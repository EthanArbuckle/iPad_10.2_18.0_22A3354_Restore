@implementation UIViewController(SKUINavigationController)

- (uint64_t)SKUIPinnedHeaderView
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v0)
        -[UIViewController(SKUINavigationController) SKUIPinnedHeaderView].cold.1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  return 0;
}

- (void)SKUIPinnedHeaderView
{
  OUTLINED_FUNCTION_1();
}

@end
