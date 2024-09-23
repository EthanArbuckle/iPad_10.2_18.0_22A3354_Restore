@implementation SKUIStackViewItemView

- (void)setBorderColor:(id)a3
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
  UIColor *borderColor;

  v4 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIStackViewItemView setBorderColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_borderColor != v4)
  {
    v13 = (UIColor *)-[UIColor copy](v4, "copy");
    borderColor = self->_borderColor;
    self->_borderColor = v13;

    -[SKUIStackViewItemView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (UIImage *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIStackViewItemView setImage:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[SKUIStackViewItemView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setShouldFlipImageHorizontal:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIStackViewItemView setShouldFlipImageHorizontal:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_shouldFlipImageHorizontal != v3)
  {
    self->_shouldFlipImageHorizontal = v3;
    -[SKUIStackViewItemView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setShouldFlipImageVertical:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIStackViewItemView setShouldFlipImageVertical:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_shouldFlipImageVertical != v3)
  {
    self->_shouldFlipImageVertical = v3;
    -[SKUIStackViewItemView setNeedsDisplay](self, "setNeedsDisplay");
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGContext *CurrentContext;
  _BOOL4 shouldFlipImageVertical;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  UIColor *borderColor;
  double v27;
  void *v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIStackViewItemView drawRect:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  -[SKUIStackViewItemView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  shouldFlipImageVertical = self->_shouldFlipImageVertical;
  v22 = -1.0;
  if (self->_shouldFlipImageHorizontal)
  {
    v23 = -1.0;
  }
  else
  {
    if (!self->_shouldFlipImageVertical)
      goto LABEL_16;
    v23 = 1.0;
    shouldFlipImageVertical = 1;
  }
  if (!shouldFlipImageVertical)
    v22 = 1.0;
  CGContextScaleCTM(CurrentContext, v23, v22);
  v24 = -v17;
  v25 = 0.0;
  if (!self->_shouldFlipImageHorizontal)
    v24 = 0.0;
  if (self->_shouldFlipImageVertical)
    v25 = -v19;
  CGContextTranslateCTM(CurrentContext, v24, v25);
LABEL_16:
  -[UIImage drawInRect:](self->_image, "drawInRect:", v13, v15, v17, v19);
  CGContextRestoreGState(CurrentContext);
  borderColor = self->_borderColor;
  if (borderColor)
  {
    v27 = *(double *)&drawRect__borderWidth;
    if (*(double *)&drawRect__borderWidth == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", *(double *)&drawRect__borderWidth);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "scale");
      *(double *)&drawRect__borderWidth = 1.0 / v29;

      borderColor = self->_borderColor;
    }
    -[UIColor set](borderColor, "set", v27);
    *(_QWORD *)&v30.size.height = drawRect__borderWidth;
    v30.origin.x = 0.0;
    v30.origin.y = 0.0;
    v30.size.width = v17;
    UIRectFillUsingBlendMode(v30, kCGBlendModeNormal);
    *(_QWORD *)&v31.origin.y = drawRect__borderWidth;
    v31.origin.x = v17 - *(double *)&drawRect__borderWidth;
    v31.size.height = v19 - *(double *)&drawRect__borderWidth * 2.0;
    *(_QWORD *)&v31.size.width = drawRect__borderWidth;
    UIRectFillUsingBlendMode(v31, kCGBlendModeNormal);
    *(_QWORD *)&v32.size.height = drawRect__borderWidth;
    v32.origin.y = v19 - *(double *)&drawRect__borderWidth;
    v32.origin.x = 0.0;
    v32.size.width = v17;
    UIRectFillUsingBlendMode(v32, kCGBlendModeNormal);
    *(_QWORD *)&v33.origin.y = drawRect__borderWidth;
    v33.size.height = v19 - *(double *)&drawRect__borderWidth * 2.0;
    v33.origin.x = 0.0;
    *(_QWORD *)&v33.size.width = drawRect__borderWidth;
    UIRectFillUsingBlendMode(v33, kCGBlendModeNormal);
  }
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)shouldFlipImageHorizontal
{
  return self->_shouldFlipImageHorizontal;
}

- (BOOL)shouldFlipImageVertical
{
  return self->_shouldFlipImageVertical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

- (void)setBorderColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setShouldFlipImageHorizontal:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setShouldFlipImageVertical:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)drawRect:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
