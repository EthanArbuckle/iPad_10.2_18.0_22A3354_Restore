@implementation SKUISeparatorView

- (void)setColor1:(id)a3
{
  UIColor *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIColor *v13;
  UIColor *color1;

  v4 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISeparatorView setColor1:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_color1 != v4)
  {
    v13 = (UIColor *)-[UIColor copy](v4, "copy");
    color1 = self->_color1;
    self->_color1 = v13;

    -[SKUISeparatorView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setColor2:(id)a3
{
  UIColor *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIColor *v13;
  UIColor *color2;

  v4 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISeparatorView setColor2:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_color2 != v4)
  {
    v13 = (UIColor *)-[UIColor copy](v4, "copy");
    color2 = self->_color2;
    self->_color2 = v13;

    -[SKUISeparatorView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setSeparatorStyle:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISeparatorView setSeparatorStyle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    -[SKUISeparatorView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  int64_t separatorStyle;
  float v17;
  double v18;
  double v19;
  float v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v4)
      -[SKUISeparatorView drawRect:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  -[SKUISeparatorView bounds](self, "bounds");
  v14 = v12;
  v15 = v13;
  separatorStyle = self->_separatorStyle;
  if (separatorStyle == 1)
  {
    v20 = v12 * 0.5;
    v19 = floorf(v20);
    -[UIColor set](self->_color1, "set");
    v18 = 0.0;
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = v19;
    v22.size.height = v15;
    UIRectFill(v22);
    -[UIColor set](self->_color2, "set");
    v14 = v19;
  }
  else
  {
    if (separatorStyle)
      return;
    v17 = v13 * 0.5;
    v18 = floorf(v17);
    -[UIColor set](self->_color1, "set");
    v19 = 0.0;
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = v14;
    v21.size.height = v18;
    UIRectFill(v21);
    -[UIColor set](self->_color2, "set");
    v15 = v18;
  }
  v23.origin.x = v19;
  v23.origin.y = v18;
  v23.size.width = v14;
  v23.size.height = v15;
  UIRectFill(v23);
}

- (UIColor)color1
{
  return self->_color1;
}

- (UIColor)color2
{
  return self->_color2;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color2, 0);
  objc_storeStrong((id *)&self->_color1, 0);
}

- (void)setColor1:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setColor2:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setSeparatorStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)drawRect:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
