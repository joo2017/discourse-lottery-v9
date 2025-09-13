# frozen_string_literal: true

# name: discourse-lottery-v9
# about: A Discourse plugin to create lotteries in posts.
# version: 0.1
# authors: Your Name
# url: https://github.com/your-repo/discourse-lottery-v9

enabled_site_setting :lottery_enabled

# 只注册我们已经创建的 SCSS 文件
register_asset "stylesheets/common/discourse-post-lottery.scss"

# 注册 SVG 图标
register_svg_icon "gift"
register_svg_icon "trophy"
register_svg_icon "dice"
register_svg_icon "users"

# 错误的方法已被彻底移除。不需要 register_module。

after_initialize do
  # 目前我们还没有任何后端逻辑，所以这个块是空的。
  # 当我们开始添加后端功能时，代码将放在这里。
end
