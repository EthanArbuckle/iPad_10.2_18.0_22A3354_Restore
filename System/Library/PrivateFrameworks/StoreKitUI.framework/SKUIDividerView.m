@implementation SKUIDividerView

- (UIColor)dividerColor
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
        -[SKUIDividerView dividerColor].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIDividerView backgroundColor](self, "backgroundColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDividerColor:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIDividerView setDividerColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIDividerView;
  -[SKUIDividerView setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (void)setBackgroundColor:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v3)
      -[SKUIDividerView setBackgroundColor:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t dividerOrientation;
  double dividerSize;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIDividerView sizeThatFits:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  dividerOrientation = self->_dividerOrientation;
  dividerSize = self->_dividerSize;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = 1.0 / v17;

  if (dividerSize >= 0.00000011920929)
    v19 = dividerSize;
  else
    v19 = width;
  if (dividerSize >= 0.00000011920929)
    v20 = dividerSize;
  else
    v20 = height;
  if (dividerOrientation)
    v19 = v18;
  else
    v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (int64_t)dividerOrientation
{
  return self->_dividerOrientation;
}

- (void)setDividerOrientation:(int64_t)a3
{
  self->_dividerOrientation = a3;
}

- (double)dividerSize
{
  return self->_dividerSize;
}

- (void)setDividerSize:(double)a3
{
  self->_dividerSize = a3;
}

- (void)dividerColor
{
  OUTLINED_FUNCTION_1();
}

- (void)setDividerColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
