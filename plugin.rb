# frozen_string_literal: true

# name: discourse-lottery-v9
# about: A Discourse plugin to create lotteries in posts.
# version: 0.1
# authors: Your Name
# url: https://github.com/your-repo/discourse-lottery-v9

# 1. 注册站点设置
enabled_site_setting :lottery_enabled

# 2. 注册前端资源 (CSS, SVG, 第三方 JS 模块)
register_asset "stylesheets/common/discourse-post-lottery.scss"
# 如果你已经创建了这些文件，可以取消注释，否则请保持注释状态以避免“找不到文件”的错误
# register_asset "stylesheets/common/discourse-post-lottery-preview.scss"
# register_asset "stylesheets/mobile/discourse-post-lottery.scss", :mobile
# register_asset "stylesheets/colors.scss", :color_definitions

register_svg_icon "gift"
register_svg_icon "trophy"
register_svg_icon "dice"
register_svg_icon "users"

# 关键：`register_module` 必须在顶层作用域，不能在 `after_initialize` 内部
register_module("ember-math-helpers", "ember-math-helpers/dist/modules/helpers.js", type: :es6)

# 3. 定义插件的 Ruby 模块 (可选，但推荐)
module ::DiscoursePostLottery
  PLUGIN_NAME = "discourse-lottery-v9"
end

# 4. 在 Discourse 初始化后运行的代码块 (目前为空)
after_initialize do
  # 我们所有的后端逻辑（如 Guardian 补丁, Post 扩展, 序列化器）都将在这里添加。
  # 目前，为了确保前端能够构建成功，我们暂时将此块留空。
end
