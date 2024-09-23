@implementation NSDictionary(SKUIExtensions)

+ (id)sk_dictionaryWithSize:()SKUIExtensions
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[NSDictionary(SKUIExtensions) sk_dictionaryWithSize:].cold.1();
  }
  v8[0] = CFSTR("width");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("height");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)sk_dictionaryWithSize:()SKUIExtensions .cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[NSDictionary(SKUIExtensions) sk_dictionaryWithSize:]";
}

@end
