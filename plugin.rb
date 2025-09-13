# frozen_string_literal: true

# name: discourse-lottery-v9
# about: A Discourse plugin to create lottery activities in topics
# version: 1.0
# author: Based on discourse-calendar
# url: https://github.com/discourse/discourse-lottery

enabled_site_setting :lottery_enabled

# 注册前端资源
register_asset "stylesheets/common/discourse-post-lottery.scss"
register_asset "stylesheets/common/discourse-post-lottery-preview.scss"
register_asset "stylesheets/mobile/discourse-post-lottery.scss", :mobile
register_asset "stylesheets/colors.scss", :color_definitions

register_svg_icon "gift"
register_svg_icon "trophy"
register_svg_icon "dice"
register_svg_icon "users"

# 关键改动：将 register_module 从 after_initialize 块中移到这里
# Discourse 核心不包含 ember-math-helpers，所以我们需要为插件注册这个模块。
# 这会让它在前端的 `import` 语句中可用。
register_module("ember-math-helpers", "ember-math-helpers/dist/modules/helpers.js", type: :es6)

module ::DiscoursePostLottery
  PLUGIN_NAME = "discourse-post-lottery"
  
  TOPIC_POST_LOTTERY_STARTS_AT = "TopicLotteryStartsAt"  
  TOPIC_POST_LOTTERY_ENDS_AT = "TopicLotteryEndsAt"
end

# 这行代码应该是存在的，但你的原始代码中没有，我先注释掉
# 如果你已经创建了这个文件，请取消注释
# require_relative "lib/discourse_post_lottery/engine"

after_initialize do
  # 加载模型扩展
  # 下面的路径可能需要根据你的实际目录结构调整
  # require_relative "lib/discourse_post_lottery/post_extension"

  # 前端需要的扩展
  # reloadable_patch do
  #   Post.prepend(DiscoursePostLottery::PostExtension)
  # end

  # 用户权限
  add_to_class(:user, :can_create_discourse_p
