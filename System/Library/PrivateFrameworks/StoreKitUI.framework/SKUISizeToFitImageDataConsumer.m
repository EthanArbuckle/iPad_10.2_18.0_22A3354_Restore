@implementation SKUISizeToFitImageDataConsumer

+ (id)consumerWithConstraintSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat *v14;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        +[SKUISizeToFitImageDataConsumer consumerWithConstraintSize:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  objc_msgSend(a1, "consumer");
  v14 = (CGFloat *)objc_claimAutoreleasedReturnValue();
  v14[1] = width;
  v14[2] = height;
  return v14;
}

+ (id)consumerWithConstraintSize2:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        +[SKUISizeToFitImageDataConsumer consumerWithConstraintSize2:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  objc_msgSend(a1, "consumer");
  v14 = objc_claimAutoreleasedReturnValue();
  *(CGFloat *)(v14 + 8) = width;
  *(CGFloat *)(v14 + 16) = height;
  *(_BYTE *)(v14 + 24) = 1;
  return (id)v14;
}

- (id)imageForImage:(id)a3
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
  double v13;
  double v14;
  void *v15;
  CGFloat v16;
  CGContext *CurrentContext;
  double width;
  double height;
  double v20;
  double v21;
  id v22;
  float v23;
  float v24;
  double v25;
  CGFloat v26;
  CGSize v28;
  CGSize v29;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISizeToFitImageDataConsumer imageForImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_custom)
  {
    v28.width = 0.0;
    v28.height = 0.0;
    objc_msgSend(v4, "size");
    SKUIIconFrameForIconSize(&v28.width, 0, v13, v14, self->_constraintSize.width, self->_constraintSize.height, 0.0);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    UIGraphicsBeginImageContextWithOptions(v28, 0, v16);

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationLow);
    width = v28.width;
    height = v28.height;
LABEL_14:
    objc_msgSend(v4, "drawInRect:", 0.0, 0.0, width, height);
    -[SKUISizeToFitImageDataConsumer _drawGradientWithContext:imageRect:](self, "_drawGradientWithContext:imageRect:", CurrentContext, 0.0, 0.0, width, height);
    CGContextRestoreGState(CurrentContext);
    UIGraphicsGetImageFromCurrentImageContext();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    goto LABEL_15;
  }
  objc_msgSend(v4, "size");
  width = self->_constraintSize.width;
  height = self->_constraintSize.height;
  if (height != 0.0)
  {
    if (width <= height)
    {
      v24 = v20 * (height / v21);
      width = floorf(v24);
      goto LABEL_13;
    }
LABEL_11:
    v23 = v21 * (width / v20);
    height = floorf(v23);
LABEL_13:
    objc_msgSend(v4, "scale");
    v26 = v25;
    v29.width = width;
    v29.height = height;
    UIGraphicsBeginImageContextWithOptions(v29, 0, v26);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationLow);
    goto LABEL_14;
  }
  if (width != 0.0)
    goto LABEL_11;
  v22 = v4;
LABEL_15:

  return v22;
}

- (void)_drawGradientWithContext:(CGContext *)a3 imageRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGColorSpace *DeviceRGB;
  id v11;
  const __CFArray *v12;
  CGGradient *v13;
  CGFloat v14;
  const void *v15[2];
  CGFloat locations[3];
  uint64_t v17;
  CGPoint v18;
  CGPoint v19;
  CGRect v20;
  CGRect v21;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_gradientEndColor)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_1BBED1340;
    -[UIColor colorWithAlphaComponent:](self->_gradientEndColor, "colorWithAlphaComponent:", 0.0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15[1] = -[UIColor CGColor](self->_gradientEndColor, "CGColor", objc_msgSend(v11, "CGColor"));

    v12 = CFArrayCreate(0, v15, 2, MEMORY[0x1E0C9B378]);
    v13 = CGGradientCreateWithColors(DeviceRGB, v12, locations);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v14 = CGRectGetMaxY(v20) - self->_gradientHeight;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v19.y = CGRectGetMaxY(v21);
    v18.x = 0.0;
    v19.x = 0.0;
    v18.y = v14;
    CGContextDrawLinearGradient(a3, v13, v18, v19, 0);
    CGGradientRelease(v13);
    CFRelease(v12);
    CGColorSpaceRelease(DeviceRGB);
  }
}

- (CGSize)constraintSize
{
  double width;
  double height;
  CGSize result;

  width = self->_constraintSize.width;
  height = self->_constraintSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setConstraintSize:(CGSize)a3
{
  self->_constraintSize = a3;
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (void)setGradientEndColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientEndColor, a3);
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (void)setGradientHeight:(double)a3
{
  self->_gradientHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
}

+ (void)consumerWithConstraintSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)consumerWithConstraintSize2:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)imageForImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
