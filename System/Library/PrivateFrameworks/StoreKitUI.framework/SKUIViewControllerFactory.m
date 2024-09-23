@implementation SKUIViewControllerFactory

- (id)newPlaceholderViewController
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIViewControllerFactory newPlaceholderViewController].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIViewControllerFactory;
  v3 = -[SUViewControllerFactory newPlaceholderViewController](&v8, sel_newPlaceholderViewController);
  v4 = (void *)MEMORY[0x1E0DDC208];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradientWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultBackgroundGradient:", v6);

  return v3;
}

- (void)newPlaceholderViewController
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIViewControllerFactory newPlaceholderViewController]";
}

@end
