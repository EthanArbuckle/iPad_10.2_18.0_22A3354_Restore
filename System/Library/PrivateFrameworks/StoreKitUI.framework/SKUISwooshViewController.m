@implementation SKUISwooshViewController

- (void)deselectAllItems
{
  OUTLINED_FUNCTION_1();
}

- (CGRect)frameForItemAtIndex:(int64_t)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUISwooshViewController frameForItemAtIndex:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)indexPathsForVisibleItems
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
        -[SKUISwooshViewController indexPathsForVisibleItems].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (id)popImageViewForItemAtIndex:(int64_t)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUISwooshViewController popImageViewForItemAtIndex:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0;
}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v4)
      -[SKUISwooshViewController setImage:forItemAtIndex:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)unhideImages
{
  OUTLINED_FUNCTION_1();
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (SKUISwooshViewControllerDelegate)delegate
{
  return (SKUISwooshViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)frameForItemAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)indexPathsForVisibleItems
{
  OUTLINED_FUNCTION_1();
}

- (void)popImageViewForItemAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 forItemAtIndex:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
