@implementation UIActivityItemProvider(SKUIExtensions)

+ (uint64_t)activityTypeShouldProvideImage:()SKUIExtensions
{
  id v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[UIActivityItemProvider(SKUIExtensions) activityTypeShouldProvideImage:].cold.1();
  }
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB1B0]);
  v5 = v4 | objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB1C0]);
  v6 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB1E0]);
  v7 = v5 | v6 | objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB1F0]);
  v8 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB218]);

  return (v7 | v8) ^ 1u;
}

+ (void)activityTypeShouldProvideImage:()SKUIExtensions .cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[UIActivityItemProvider(SKUIExtensions) activityTypeShouldProvideImage:]";
}

@end
