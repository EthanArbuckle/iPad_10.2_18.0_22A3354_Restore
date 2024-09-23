@implementation SKUIVideoImageDataConsumer

- (id)imageForColor:(id)a3 orientation:(unint64_t)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKUIColorScheme *colorScheme;
  double v16;
  double v17;
  int *v18;
  double *v19;
  double v20;
  double v21;
  BOOL v22;
  void *v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  CGSize v31;
  CGRect v32;

  v6 = a3;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !(v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)))
  {
    if (v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[SKUIVideoImageDataConsumer imageForColor:orientation:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  if (!v6)
  {
LABEL_5:
    colorScheme = self->_colorScheme;
    v30 = 0;
    SKUIIconColorsForColorScheme(colorScheme, &v30, 0, 0);
    v6 = v30;
  }
LABEL_6:
  v16 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v18 = &OBJC_IVAR___SKUIVideoImageDataConsumer__portraitSize;
  if (a4 == 2)
    v18 = &OBJC_IVAR___SKUIVideoImageDataConsumer__landscapeSize;
  v19 = (double *)((char *)self + *v18);
  v21 = *v19;
  v20 = v19[1];
  v22 = self->_backgroundColor != 0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scale");
  v25 = v24;
  v31.width = v21;
  v31.height = v20;
  UIGraphicsBeginImageContextWithOptions(v31, v22, v25);

  objc_msgSend(v6, "set");
  v32.origin.x = v16;
  v32.origin.y = v17;
  v32.size.width = v21;
  v32.size.height = v20;
  UIRectFill(v32);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "set");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v16, v17, v21, v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v28;
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
  _BOOL4 v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  int *v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  BOOL v26;
  double v27;
  CGFloat v28;
  UIColor *backgroundColor;
  void *v30;
  void *v31;
  void *v32;
  CGSize v34;
  CGRect v35;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIVideoImageDataConsumer imageForImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "size");
  v15 = v13 > v14;
  v16 = 2;
  if (v13 <= v14)
    v16 = 1;
  if ((v16 & self->_allowedOrientations) == 0)
  {
    v17 = objc_alloc(MEMORY[0x1E0DC3870]);
    v18 = objc_retainAutorelease(v4);
    v19 = objc_msgSend(v18, "CGImage");
    objc_msgSend(v18, "scale");
    v4 = (id)objc_msgSend(v17, "initWithCGImage:scale:orientation:", v19, 2);

    objc_msgSend(v4, "size");
    v15 = self->_allowedOrientations == 2;
  }
  if (v15)
    v20 = &OBJC_IVAR___SKUIVideoImageDataConsumer__landscapeSize;
  else
    v20 = &OBJC_IVAR___SKUIVideoImageDataConsumer__portraitSize;
  v21 = *(double *)((char *)&self->super.super.super.isa + *v20);
  v23 = *MEMORY[0x1E0C9D648];
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v24 = v14 * (v21 / v13);
  v25 = ceilf(v24);
  v26 = self->_backgroundColor != 0;
  objc_msgSend(v4, "scale");
  v28 = v27;
  v34.width = v21;
  v34.height = v25;
  UIGraphicsBeginImageContextWithOptions(v34, v26, v28);
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    -[UIColor set](backgroundColor, "set");
    v35.origin.x = v23;
    v35.origin.y = v22;
    v35.size.width = v21;
    v35.size.height = v25;
    UIRectFill(v35);
  }
  objc_msgSend(v4, "drawInRect:", v23, v22, v21, v25);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "set");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v23, v22, v21, v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v32;
}

- (unint64_t)allowedOrientations
{
  return self->_allowedOrientations;
}

- (void)setAllowedOrientations:(unint64_t)a3
{
  self->_allowedOrientations = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (CGSize)landscapeSize
{
  double width;
  double height;
  CGSize result;

  width = self->_landscapeSize.width;
  height = self->_landscapeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLandscapeSize:(CGSize)a3
{
  self->_landscapeSize = a3;
}

- (CGSize)portraitSize
{
  double width;
  double height;
  CGSize result;

  width = self->_portraitSize.width;
  height = self->_portraitSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPortraitSize:(CGSize)a3
{
  self->_portraitSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)imageForColor:(uint64_t)a3 orientation:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageForImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
