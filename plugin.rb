# frozen_string_literal: true

# name: discourse-lottery-v9
# about: A Discourse plugin to create lotteries in posts.
# version: 0.1
# authors: Your Name
# url: https://github.com/your-repo/discourse-lottery-v9

enabled_site_setting :lottery_enabled

# 注册前端资源
register_asset "stylesheets/common/discourse-post-lottery.scss"
# 下面这两行是我们还没有创建的文件，为了让构建通过，暂时注释掉
# register_asset "stylesheets/common/discourse-post-lottery-preview.scss"
# register_asset "stylesheets/mobile/discourse-post-lottery.scss", :mobile
# register_asset "stylesheets/colors.scss", :color_definitions

register_svg_icon "gift"
register_svg_icon "trophy"
register_svg_icon "dice"
register_svg_icon "users"

# 注册 ember-math-helpers 模块，供前端使用
register_module("ember-math-helpers", "ember-math-helpers/dist/modules/helpers.js", type: :es6)

# 插件的主模块定义
module ::DiscoursePostLottery
  PLUGIN_NAME = "discourse-post-lottery"
  
  # 这些常量目前在后端还未使用，但预留是好的
  TOPIC_POST_LOTTERY_STARTS_AT = "TopicLotteryStartsAt"  
  TOPIC_POST_LOTTERY_ENDS_AT = "TopicLotteryEndsAt"
end

# after_initialize 块用于在 Discourse 核心加载完毕后执行代码
after_initialize do
  # 目前我们还没有任何后端逻辑，所以这个块是空的。
  # 未来的后端代码，如 post_extension, guardian 扩展等，都将放在这里。
end
