@implementation SKUIAccountButtonsViewElement

- (int64_t)pageComponentType
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIAccountButtonsViewElement pageComponentType].cold.1();
  }
  return 1;
}

- (void)pageComponentType
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIAccountButtonsViewElement pageComponentType]";
}

@end
