@implementation UIApplication(SKUIMedusaAdditions)

- (uint64_t)SKUI_isMedusaActive
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[UIApplication(SKUIMedusaAdditions) SKUI_isMedusaActive].cold.1();
  }
  return objc_msgSend(a1, "SKUI_isFullscreen") ^ 1;
}

- (BOOL)SKUI_isFullscreen
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[UIApplication(SKUIMedusaAdditions) SKUI_isFullscreen].cold.1();
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  objc_msgSend(a1, "keyWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  return v4 + v6 == v9 + v11;
}

- (void)SKUI_isMedusaActive
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[UIApplication(SKUIMedusaAdditions) SKUI_isMedusaActive]";
}

- (void)SKUI_isFullscreen
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[UIApplication(SKUIMedusaAdditions) SKUI_isFullscreen]";
}

@end
