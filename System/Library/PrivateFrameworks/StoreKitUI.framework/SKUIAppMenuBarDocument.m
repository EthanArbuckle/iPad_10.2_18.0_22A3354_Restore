@implementation SKUIAppMenuBarDocument

+ (id)featureName
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIAppMenuBarDocument featureName].cold.1();
  }
  return (id)*MEMORY[0x1E0D3A380];
}

+ (void)featureName
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIAppMenuBarDocument featureName]";
}

@end
