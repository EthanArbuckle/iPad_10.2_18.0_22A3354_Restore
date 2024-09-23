@implementation SKUIScrollingTabNavigationBar

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIScrollingTabNavigationBar setCenter:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v14 = x + self->_positionOffset.horizontal;
  v15 = y + self->_positionOffset.vertical;
  v16.receiver = self;
  v16.super_class = (Class)SKUIScrollingTabNavigationBar;
  -[SKUIScrollingTabNavigationBar setCenter:](&v16, sel_setCenter_, v14, v15);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIScrollingTabNavigationBar setFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = x + self->_positionOffset.horizontal;
  v17 = y + self->_positionOffset.vertical;
  v18.receiver = self;
  v18.super_class = (Class)SKUIScrollingTabNavigationBar;
  -[SKUIScrollingTabNavigationBar setFrame:](&v18, sel_setFrame_, v16, v17, width, height);
}

- (UIOffset)positionOffset
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double horizontal;
  double vertical;
  UIOffset result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIScrollingTabNavigationBar positionOffset].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  horizontal = self->_positionOffset.horizontal;
  vertical = self->_positionOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setPositionOffset:(UIOffset)a3
{
  double vertical;
  double horizontal;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIOffset *p_positionOffset;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIScrollingTabNavigationBar setPositionOffset:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  p_positionOffset = &self->_positionOffset;
  if (self->_positionOffset.horizontal != horizontal || self->_positionOffset.vertical != vertical)
  {
    -[SKUIScrollingTabNavigationBar center](self, "center");
    v16 = self->_positionOffset.vertical;
    v18 = v17 - p_positionOffset->horizontal;
    p_positionOffset->horizontal = horizontal;
    self->_positionOffset.vertical = vertical;
    v20.receiver = self;
    v20.super_class = (Class)SKUIScrollingTabNavigationBar;
    -[SKUIScrollingTabNavigationBar setCenter:](&v20, sel_setCenter_, horizontal + v18, v19 - v16 + vertical);
  }
}

- (void)setCenter:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)positionOffset
{
  OUTLINED_FUNCTION_1();
}

- (void)setPositionOffset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
