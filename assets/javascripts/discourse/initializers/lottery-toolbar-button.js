import { withPluginApi } from "discourse/lib/plugin-api";
import LotteryBuilder from "../components/modal/lottery-builder";
import Lottery from "../models/lottery";

function initializeLotteryToolbar(api) {
  const modal = api.container.lookup("service:modal");

  api.addComposerToolbarPopupMenuOption({
    icon: "trophy",
    label: "lottery.builder.attach",

    action: (toolbarEvent) => {
      const lottery = Lottery.create({
        // 可以在这里设置默认值
        draw_time: moment().add(1, "day").toDate(),
      });

      modal.show(LotteryBuilder, {
        model: {
          lottery: lottery,
          toolbarEvent: toolbarEvent,
        },
      });
    },

    condition: (composer) => {
      const composerModel = composer.model;
      return (
        composerModel && !composerModel.replyingToTopic && (composerModel.topicFirstPost || (composerModel.editingPost && composerModel.post?.post_number === 1))
      );
    },
  });
}

export default {
  name: "lottery-toolbar-button",
  initialize(container) {
    const siteSettings = container.lookup("service:site-settings");
    if (siteSettings.lottery_enabled) {
      withPluginApi("1.0.0", initializeLotteryToolbar);
    }
  },
};
