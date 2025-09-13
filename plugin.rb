# name: discourse-lottery-v9
# about: A Discourse plugin to create lotteries in posts.
# version: 0.1
# authors: Your Name
# url: https://github.com/your-repo/discourse-lottery-v9

enabled_site_setting :lottery_enabled

register_asset "stylesheets/common/discourse-post-lottery.scss"

# --- 新增的代码块 ---
# Discourse 核心不包含 ember-math-helpers，所以我们需要为插件注册这个模块。
# 这会让它在前端的 `import` 语句中可用。
register_module("ember-math-helpers", "ember-math-helpers/dist/modules/helpers.js", type: :es6)
# --------------------

after_initialize do
  # 后端逻辑将在这里添加
end
