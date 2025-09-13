import Component from "@glimmer/component";
import DModal from "discourse/components/d-modal";
import DButton from "discourse/components/d-button";
import DateTimeInput from "discourse/components/date-time-input";
import { i18n } from "discourse-i18n";
import { action } from "@ember/object";
import { fn, mut } from "@ember/helper";

export default class LotteryBuilder extends Component {
  get lottery() {
    return this.args.model.lottery;
  }

  @action
  createLottery() {
    // 将日期对象格式化为 BBCode 需要的字符串
    const drawTimeString = moment(this.lottery.draw_time).format("YYYY-MM-DD HH:mm");
    
    const markdown = `[lottery draw_time="${drawTimeString}"]\n[/lottery]`;
    
    // 使用传入的 toolbarEvent 对象将文本插入编辑器
    this.args.model.toolbarEvent.addText(markdown);
    this.args.closeModal();
  }

  <template>
    <DModal @title={{i18n "lottery.builder.title"}} @closeModal={{@closeModal}}>
      <:body>
        <form>
          <div class="lottery-field">
            <label for="lottery-draw-time">{{i18n "lottery.builder.draw_time"}}</label>
            <DateTimeInput @value={{this.lottery.draw_time}} @onChange={{fn (mut this.lottery.draw_time)}} />
          </div>
        </form>
      </:body>
      <:footer>
        <DButton class="btn-primary" @action={{this.createLottery}} @label="lottery.builder.create" />
        <DButton @action={{@closeModal}} @label="composer.cancel_button" />
      </:footer>
    </DModal>
  </template>
}
