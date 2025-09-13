import { withPluginApi } from "discourse/lib/plugin-api";
import { i18n } from "discourse-i18n";
import DiscoursePostLottery from "../components/discourse-post-lottery";
import Lottery from "../models/lottery";

export function buildLotteryPreview(element) {
  element.innerHTML = "";
  element.classList.add("discourse-post-lottery-preview");

  const drawTime = moment(element.dataset.drawTime);
  element.innerHTML = `
    <div class="event-preview-title">${i18n("lottery.builder.title")}</div>
    <div class="event-preview-dates">
      ${i18n("lottery.builder.draw_time")}: <span class='start'>${drawTime.format("LLLL")}</span>
    </div>
  `;
}

function initializeLotteryDecorator(api) {
  api.decorateCookedElement(
    (cooked, helper) => {
      const isPreview = cooked.classList.contains("d-editor-preview");
      const lotteryNodes = cooked.querySelectorAll(".discourse-post-lottery");

      lotteryNodes.forEach((node) => {
        if (isPreview) {
          buildLotteryPreview(node);
          return;
        }

        const post = helper?.getModel();
        if (!post) return;

        const lottery = Lottery.create({
          id: post.id,
          draw_time: node.dataset.drawTime,
          post: { // 传递简化的post对象
            id: post.id,
            post_number: post.post_number,
            url: post.url,
            topic: {
              id: post.topic.id,
              title: post.topic.title,
            },
          },
        });

        helper.renderGlimmer(node, <template><DiscoursePostLottery @lottery={{lottery}} /></template>);
      });
    },
    { id: "discourse-lottery-decorator" }
  );
}

export default {
  name: "lottery-decorator",
  initialize(container) {
    const siteSettings = container.lookup("service:site-settings");
    if (siteSettings.lottery_enabled) {
      withPluginApi("1.0.0", initializeLotteryDecorator);
    }
  },
};
