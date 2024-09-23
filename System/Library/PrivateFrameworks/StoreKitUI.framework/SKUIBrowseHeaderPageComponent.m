@implementation SKUIBrowseHeaderPageComponent

- (int64_t)componentType
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrowseHeaderPageComponent componentType].cold.1();
  }
  return 17;
}

- (void)componentType
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBrowseHeaderPageComponent componentType]";
}

@end
