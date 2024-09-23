@implementation SKUIMenuBarNavigationBarController

- (id)fallbackTitleView
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuBarNavigationBarController fallbackTitleView].cold.1();
  }
  return self->_titleView;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
}

- (void)fallbackTitleView
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMenuBarNavigationBarController fallbackTitleView]";
}

@end
