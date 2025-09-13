import EmberObject from "@ember/object";
import { tracked } from "@glimmer/tracking";

export default class Lottery extends EmberObject {
  @tracked draw_time;
  // 未来可以添加更多属性，如：
  // @tracked prize_name;
  // @tracked winner_count;
}
