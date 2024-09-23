@implementation SKUIAppDeviceConfig

- (BOOL)isTimeZoneSet
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIAppDeviceConfig isTimeZoneSet].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

- (unint64_t)preferredVideoFormat
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIAppDeviceConfig preferredVideoFormat].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (unint64_t)preferredVideoPreviewFormat
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIAppDeviceConfig preferredVideoPreviewFormat].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (CGSize)screenSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIAppDeviceConfig screenSize].cold.1();
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)currentSizeClasses
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIAppDeviceConfig currentSizeClasses].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (id)storeFrontCountryCode
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIAppDeviceConfig storeFrontCountryCode].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (id)systemLanguage
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIAppDeviceConfig systemLanguage].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayForKey:", CFSTR("AppleLanguages"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)timeZone
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIAppDeviceConfig timeZone].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)isTimeZoneSet
{
  OUTLINED_FUNCTION_1();
}

- (void)preferredVideoFormat
{
  OUTLINED_FUNCTION_1();
}

- (void)preferredVideoPreviewFormat
{
  OUTLINED_FUNCTION_1();
}

- (void)screenSize
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIAppDeviceConfig screenSize]";
  OUTLINED_FUNCTION_1();
}

- (void)currentSizeClasses
{
  OUTLINED_FUNCTION_1();
}

- (void)storeFrontCountryCode
{
  OUTLINED_FUNCTION_1();
}

- (void)systemLanguage
{
  OUTLINED_FUNCTION_1();
}

- (void)timeZone
{
  OUTLINED_FUNCTION_1();
}

@end
