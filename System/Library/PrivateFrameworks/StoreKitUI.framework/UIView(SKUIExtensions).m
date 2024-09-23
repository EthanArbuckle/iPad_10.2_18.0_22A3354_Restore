@implementation UIView(SKUIExtensions)

- (uint64_t)_SKUIView
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
        -[UIView(SKUIExtensions) _SKUIView].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return a1;
}

- (void)_SKUIView
{
  OUTLINED_FUNCTION_1();
}

@end
