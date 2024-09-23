@implementation SKUIDynamicMenuBarViewElement

- (BOOL)isDynamicContainer
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
        -[SKUIDynamicMenuBarViewElement isDynamicContainer].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

+ (Class)_titlesMenuBarViewElementClass
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
        +[SKUIDynamicMenuBarViewElement _titlesMenuBarViewElementClass].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (Class)_shelfMenuBarViewElementClass
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
        +[SKUIDynamicMenuBarViewElement _shelfMenuBarViewElementClass].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)isDynamicContainer
{
  OUTLINED_FUNCTION_1();
}

+ (void)_titlesMenuBarViewElementClass
{
  OUTLINED_FUNCTION_1();
}

+ (void)_shelfMenuBarViewElementClass
{
  OUTLINED_FUNCTION_1();
}

@end
