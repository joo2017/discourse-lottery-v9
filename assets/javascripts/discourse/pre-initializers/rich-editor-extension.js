import { withPluginApi } from "discourse/lib/plugin-api";
import { buildLotteryPreview } from "../initializers/lottery-decorator.gjs";

const LOTTERY_ATTRIBUTES = {
  drawTime: { default: null },
  // 以后可以添加更多属性
};

function dasherize(input) {
  return input.replace(/[A-Z]/g, (char, index) => (index !== 0 ? "-" : "") + char.toLowerCase());
}

const extension = {
  nodeSpec: {
    lottery: {
      attrs: LOTTERY_ATTRIBUTES,
      group: "block",
      defining: true,
      isolating: true,
      draggable: true,
      parseDOM: [
        {
          tag: "div.discourse-post-lottery",
          getAttrs(dom) {
            return { ...dom.dataset };
          },
        },
      ],
      toDOM(node) {
        const element = document.createElement("div");
        element.classList.add("discourse-post-lottery");
        for (const [key, value] of Object.entries(node.attrs)) {
          if (value !== null) {
            element.dataset[dasherize(key)] = value;
          }
        }
        buildLotteryPreview(element);
        return element;
      },
    },
  },

  serializeNode: {
    lottery(state, node) {
      let bbcode = `[lottery draw_time="${node.attrs.drawTime}"]`;
      bbcode += "\n[/lottery]\n";
      state.write(bbcode);
    },
  },
};

export default {
  name: "discourse-lottery-rich-editor",
  initialize() {
    withPluginApi("2.1.1", (api) => {
      api.registerRichEditorExtension(extension);
    });
  },
};
