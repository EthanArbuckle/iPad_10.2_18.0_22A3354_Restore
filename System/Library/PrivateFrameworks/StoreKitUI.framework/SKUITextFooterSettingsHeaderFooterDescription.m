@implementation SKUITextFooterSettingsHeaderFooterDescription

- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITextFooterSettingsHeaderFooterDescription _viewClassForSettingsHeaderFooterDescription:].cold.1();
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_viewClassForSettingsHeaderFooterDescription:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITextFooterSettingsHeaderFooterDescription _viewClassForSettingsHeaderFooterDescription:]";
}

@end
