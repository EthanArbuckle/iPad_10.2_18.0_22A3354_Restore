@implementation PKPassColorProfile

- (id)foregroundColorOverStrip:(BOOL)a3
{
  if (a3 && self->_stripProfile)
    self = self->_stripProfile;
  -[PKPassColorProfile foregroundColor](self, "foregroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (id)labelColorOverStrip:(BOOL)a3
{
  if (a3 && self->_stripProfile)
    self = self->_stripProfile;
  -[PKPassColorProfile labelColor](self, "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (BOOL)isLight
{
  return self->_backgroundLightness > 0.219999999;
}

- (id)foregroundAttributesForFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0DC1140];
  v4 = a3;
  -[PKPassColorProfile foregroundColor](self, "foregroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = *MEMORY[0x1E0DC1138];
  v9[0] = v5;
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)profileForDisplayProfile:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  PKPassColorProfile *v29;
  void *v30;
  uint64_t v31;
  void *v32;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_getAssociatedObject(v3, &ColorProfileCacheKey);
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_23;
  }
  if (objc_msgSend(v4, "passStyle") == 9)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v4, "foregroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pkui_colorWithPKColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v13 = v10;

      goto LABEL_14;
    }
LABEL_12:
    v10 = v9;
    goto LABEL_13;
  }
  v11 = objc_msgSend(v4, "showsBackgroundImage");
  v12 = (void *)MEMORY[0x1E0DC3658];
  if (!v11)
  {
    objc_msgSend(v4, "backgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pkui_colorWithPKColor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithAlphaComponent:", 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v18;

    v19 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v4, "foregroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pkui_colorWithPKColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.699999988);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  v20 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(v4, "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pkui_colorWithPKColor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PKPassColorProfile _initWithBackgroundColor:foregroundColor:labelColor:]([PKPassColorProfile alloc], "_initWithBackgroundColor:foregroundColor:labelColor:", v6, v13, v22);
  if (objc_msgSend(v4, "showsStripImage"))
  {
    v23 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v4, "stripColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pkui_colorWithPKColor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v27;

    v29 = [PKPassColorProfile alloc];
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PKPassColorProfile _initWithBackgroundColor:foregroundColor:labelColor:](v29, "_initWithBackgroundColor:foregroundColor:labelColor:", v30, v28, v28);
    v32 = (void *)v5[4];
    v5[4] = v31;

  }
  *((_BYTE *)v5 + 40) = objc_msgSend(v4, "supportsAutomaticForegroundVibrancy");
  *((_BYTE *)v5 + 41) = objc_msgSend(v4, "supportsAutomaticLabelVibrancy");
  if (v4 && v5)
    objc_setAssociatedObject(v4, &ColorProfileCacheKey, v5, (void *)0x301);

LABEL_23:
  return v5;
}

- (id)_initWithBackgroundColor:(id)a3 foregroundColor:(id)a4 labelColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPassColorProfile *v11;
  PKPassColorProfile *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPassColorProfile;
  v11 = -[PKPassColorProfile init](&v14, sel_init);
  v12 = v11;
  if (v11)
    -[PKPassColorProfile _calculateColorsWithBackgroundColor:foregroundColor:labelColor:](v11, "_calculateColorsWithBackgroundColor:foregroundColor:labelColor:", v8, v9, v10);

  return v12;
}

- (void)_calculateColorsWithBackgroundColor:(id)a3 foregroundColor:(id)a4 labelColor:(id)a5
{
  id v9;
  id v10;
  id v11;
  CGColorSpace *DeviceGray;
  CGContext *v13;
  UIColor *backgroundColor;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  UIColor *v22;
  UIColor *labelColor;
  UIColor *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIColor *v29;
  UIColor *highlightColor;
  char data;
  double v32;
  double v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  data = 0;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v13 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 1uLL, DeviceGray, 0);
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  self->_backgroundLightness = _ColorLightness(self->_backgroundColor, v13, &data);
  objc_storeStrong((id *)&self->_foregroundColor, a4);
  self->_foregroundLightness = _ColorLightness(self->_foregroundColor, v13, &data);
  backgroundColor = self->_backgroundColor;
  v15 = (self->_backgroundLightness + -0.400000006) * 1.20000005;
  if (v15 >= 0.0)
    v16 = v15 + 0.25;
  else
    v16 = 0.25;
  v32 = 0.0;
  v33 = 0.0;
  -[UIColor getHue:saturation:brightness:alpha:](backgroundColor, "getHue:saturation:brightness:alpha:", 0, &v33, &v32, 0);
  v17 = (v33 + v32 * 2.0) / 3.0 + -0.800000012;
  v18 = v17 * 1.5;
  v19 = v17 < 0.0;
  v20 = 0.0;
  if (!v19)
    v20 = v18;
  if (v20 <= 0.300000012)
    v21 = v20;
  else
    v21 = 0.300000012;
  if (v11)
  {
    v22 = (UIColor *)v11;
  }
  else
  {
    if (-[PKPassColorProfile isLight](self, "isLight"))
      _NewColorByAdjustingColor(self->_backgroundColor, 1, v16 * 0.7, v21);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v22 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  labelColor = self->_labelColor;
  self->_labelColor = v22;

  self->_labelLightness = _ColorLightness(self->_labelColor, v13, &data);
  self->_overlayDarkeningAlpha = v16;
  self->_regularDarkeningAlpha = v21;
  v24 = self->_backgroundColor;
  v32 = 0.0;
  v33 = 0.0;
  -[UIColor getHue:saturation:brightness:alpha:](v24, "getHue:saturation:brightness:alpha:", 0, &v33, &v32, 0);
  v25 = (v33 + v32 * 2.0) / 3.0 + -0.800000012;
  v26 = v25 * 1.20000005;
  v19 = v25 < 0.0;
  v27 = 0.0;
  if (!v19)
    v27 = v26;
  if (v27 <= 0.300000012)
    v28 = v27;
  else
    v28 = 0.300000012;
  _NewColorByAdjustingColor(self->_backgroundColor, 0, 0.800000012, v28);
  v29 = (UIColor *)objc_claimAutoreleasedReturnValue();
  highlightColor = self->_highlightColor;
  self->_highlightColor = v29;

  self->_overlayLighteningAlpha = 0.800000012;
  self->_regularLighteningAlpha = v28;
  CFRelease(DeviceGray);
  CFRelease(v13);

}

- (id)labelAttributesForFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0DC1140];
  v4 = a3;
  -[PKPassColorProfile labelColor](self, "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = *MEMORY[0x1E0DC1138];
  v9[0] = v5;
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)labelImageForGlyph:(id)a3
{
  return (id)objc_msgSend(a3, "imageWithTintColor:renderingMode:", self->_labelColor, 1);
}

- (id)foregroundImageForGlyph:(id)a3
{
  return -[PKPassColorProfile _imageForGlyph:color:](self, "_imageForGlyph:color:", a3, self->_foregroundColor);
}

- (id)_imageForGlyph:(id)a3 color:(id)a4
{
  double v5;
  double v6;
  id v7;
  id v8;
  double width;
  double height;
  CGContext *CurrentContext;
  id v12;
  CGColor *v13;
  void *v14;
  CGSize v16;
  CGRect v17;

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "size");
  width = v16.width;
  height = v16.height;
  UIGraphicsBeginImageContextWithOptions(v16, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v12 = objc_retainAutorelease(v7);
  v13 = (CGColor *)objc_msgSend(v12, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v13);
  v17.origin.x = v5;
  v17.origin.y = v6;
  v17.size.width = width;
  v17.size.height = height;
  CGContextFillRect(CurrentContext, v17);
  objc_msgSend(v8, "drawInRect:blendMode:alpha:", 22, v5, v6, width, height, 1.0);

  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v14;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (double)overlayDarkeningAlpha
{
  return self->_overlayDarkeningAlpha;
}

- (double)regularDarkeningAlpha
{
  return self->_regularDarkeningAlpha;
}

- (double)overlayLighteningAlpha
{
  return self->_overlayLighteningAlpha;
}

- (double)regularLighteningAlpha
{
  return self->_regularLighteningAlpha;
}

- (BOOL)supportsAutomaticForegroundVibrancy
{
  return self->_supportsAutomaticForegroundVibrancy;
}

- (BOOL)supportsAutomaticLabelVibrancy
{
  return self->_supportsAutomaticLabelVibrancy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_stripProfile, 0);
}

@end
