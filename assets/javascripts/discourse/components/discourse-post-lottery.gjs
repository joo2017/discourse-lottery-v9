import Component from "@glimmer/component";
import icon from "discourse/helpers/d-icon";

export default class DiscoursePostLottery extends Component {
  get drawTime() {
    return moment(this.args.lottery.draw_time);
  }

  <template>
    <div class="discourse-lottery-widget">
      <header class="lottery-header">
        <div class="lottery-icon">
          {{icon "trophy"}}
        </div>
        <div class="lottery-info">
          <span class="name">{{this.args.lottery.post.topic.title}}</span>
        </div>
      </header>

      <section class="lottery-section">
        {{icon "clock"}} 开奖时间: {{this.drawTime.format("LLLL")}}
      </section>

      <section class="lottery-section lottery-actions">
        {{! 参与按钮等逻辑将在这里添加 }}
      </section>
    </div>
  </template>
}
