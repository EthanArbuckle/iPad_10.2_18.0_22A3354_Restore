@implementation VUIMonogramViewConfiguration

- (VUIMonogramViewConfiguration)initWithStyle:(int64_t)a3
{
  char *v4;
  VUIMonogramViewConfiguration *v5;
  uint64_t v6;
  UIColor *v7;
  uint64_t v8;
  UIColor *v9;
  uint64_t v10;
  UIColor *v11;
  uint64_t v12;
  UIColor *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  UIColor *unfocusedBgColor;
  uint64_t v19;
  UIColor *focusedBgColor;
  uint64_t v21;
  UIColor *titleUnfocusedColor;
  uint64_t v23;
  UIColor *titleFocusedColor;
  uint64_t v25;
  UIColor *subtitleUnfocusedColor;
  uint64_t v27;
  UIColor *subtitleFocusedColor;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)VUIMonogramViewConfiguration;
  v4 = -[VUIMonogramViewConfiguration init](&v30, sel_init);
  v5 = (VUIMonogramViewConfiguration *)v4;
  if (v4)
  {
    *((_QWORD *)v4 + 1) = a3;
    *((_QWORD *)v4 + 2) = 0x404A000000000000;
    *(_OWORD *)(v4 + 40) = xmmword_1DA1C2170;
    *((_QWORD *)v4 + 7) = 13;
    *((_QWORD *)v4 + 10) = 14;
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
      v17 = objc_claimAutoreleasedReturnValue();
      unfocusedBgColor = v5->_unfocusedBgColor;
      v5->_unfocusedBgColor = (UIColor *)v17;

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
      v19 = objc_claimAutoreleasedReturnValue();
      focusedBgColor = v5->_focusedBgColor;
      v5->_focusedBgColor = (UIColor *)v19;

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
      v21 = objc_claimAutoreleasedReturnValue();
      titleUnfocusedColor = v5->_titleUnfocusedColor;
      v5->_titleUnfocusedColor = (UIColor *)v21;

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
      v23 = objc_claimAutoreleasedReturnValue();
      titleFocusedColor = v5->_titleFocusedColor;
      v5->_titleFocusedColor = (UIColor *)v23;

      v14 = (void *)MEMORY[0x1E0DC3658];
      v15 = 0.3;
      v16 = 1.0;
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v5->_unfocusedBgColor;
      v5->_unfocusedBgColor = (UIColor *)v6;

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.9);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v5->_focusedBgColor;
      v5->_focusedBgColor = (UIColor *)v8;

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v5->_titleUnfocusedColor;
      v5->_titleUnfocusedColor = (UIColor *)v10;

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_titleFocusedColor;
      v5->_titleFocusedColor = (UIColor *)v12;

      v14 = (void *)MEMORY[0x1E0DC3658];
      v15 = 0.4;
      v16 = 0.0;
LABEL_6:
      objc_msgSend(v14, "colorWithWhite:alpha:", v16, v15);
      v25 = objc_claimAutoreleasedReturnValue();
      subtitleUnfocusedColor = v5->_subtitleUnfocusedColor;
      v5->_subtitleUnfocusedColor = (UIColor *)v25;

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
      v27 = objc_claimAutoreleasedReturnValue();
      subtitleFocusedColor = v5->_subtitleFocusedColor;
      v5->_subtitleFocusedColor = (UIColor *)v27;

    }
  }
  return v5;
}

- (VUIMonogramViewConfiguration)initWithShadowImages:(BOOL)a3
{
  _BOOL4 v3;
  VUIMonogramViewConfiguration *result;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIMonogramViewConfiguration;
  result = -[VUIMonogramViewConfiguration init](&v5, sel_init);
  if (result)
  {
    result->_style = 0;
    result->_focusedSizeIncrease = 52.0;
    if (v3)
      *(_OWORD *)&result->_unfocusedShadowAlpha = xmmword_1DA1C2170;
  }
  return result;
}

- (id)unfocusedShadowImage
{
  if (unfocusedShadowImage_onceToken != -1)
    dispatch_once(&unfocusedShadowImage_onceToken, &__block_literal_global_94);
  return (id)unfocusedShadowImage_unfocusedShadowImage;
}

void __52__VUIMonogramViewConfiguration_unfocusedShadowImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "vuiImageNamed:inBundle:", CFSTR("MonogramShadowUnfocused"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)unfocusedShadowImage_unfocusedShadowImage;
  unfocusedShadowImage_unfocusedShadowImage = v1;

}

- (id)focusedShadowImage
{
  if (focusedShadowImage_onceToken != -1)
    dispatch_once(&focusedShadowImage_onceToken, &__block_literal_global_4_0);
  return (id)focusedShadowImage_focusedShadowImage;
}

void __50__VUIMonogramViewConfiguration_focusedShadowImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "vuiImageNamed:inBundle:", CFSTR("MonogramShadowFocused"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)focusedShadowImage_focusedShadowImage;
  focusedShadowImage_focusedShadowImage = v1;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 16) = self->_focusedSizeIncrease;
  *(double *)(v4 + 40) = self->_unfocusedShadowAlpha;
  *(double *)(v4 + 48) = self->_focusedShadowAlpha;
  *(_QWORD *)(v4 + 56) = self->_titleTextStyle;
  *(_QWORD *)(v4 + 80) = self->_subtitleTextStyle;
  v5 = -[UIColor copy](self->_unfocusedBgColor, "copy");
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  v7 = -[UIColor copy](self->_focusedBgColor, "copy");
  v8 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v7;

  v9 = -[UIColor copy](self->_titleUnfocusedColor, "copy");
  v10 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v9;

  v11 = -[UIColor copy](self->_titleFocusedColor, "copy");
  v12 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v11;

  v13 = -[UIColor copy](self->_subtitleUnfocusedColor, "copy");
  v14 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v13;

  v15 = -[UIColor copy](self->_subtitleFocusedColor, "copy");
  v16 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v15;

  return (id)v4;
}

- (double)unfocusedImageAlpha
{
  double result;
  double v4;
  double v5;

  result = 1.0;
  if (self->_focusedBgColor)
  {
    if (self->_unfocusedBgColor)
    {
      v4 = 1.0;
      v5 = 1.0;
      objc_msgSend(MEMORY[0x1E0DC69B0], "vuiColor:getRed:green:blue:alpha:", 1.0);
      objc_msgSend(MEMORY[0x1E0DC69B0], "vuiColor:getRed:green:blue:alpha:", self->_unfocusedBgColor, 0, 0, 0, &v4);
      return v4 / v5;
    }
  }
  return result;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (UIColor)unfocusedBgColor
{
  return self->_unfocusedBgColor;
}

- (void)setUnfocusedBgColor:(id)a3
{
  objc_storeStrong((id *)&self->_unfocusedBgColor, a3);
}

- (UIColor)focusedBgColor
{
  return self->_focusedBgColor;
}

- (void)setFocusedBgColor:(id)a3
{
  objc_storeStrong((id *)&self->_focusedBgColor, a3);
}

- (double)unfocusedShadowAlpha
{
  return self->_unfocusedShadowAlpha;
}

- (void)setUnfocusedShadowAlpha:(double)a3
{
  self->_unfocusedShadowAlpha = a3;
}

- (double)focusedShadowAlpha
{
  return self->_focusedShadowAlpha;
}

- (void)setFocusedShadowAlpha:(double)a3
{
  self->_focusedShadowAlpha = a3;
}

- (int64_t)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setTitleTextStyle:(int64_t)a3
{
  self->_titleTextStyle = a3;
}

- (UIColor)titleUnfocusedColor
{
  return self->_titleUnfocusedColor;
}

- (void)setTitleUnfocusedColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleUnfocusedColor, a3);
}

- (UIColor)titleFocusedColor
{
  return self->_titleFocusedColor;
}

- (void)setTitleFocusedColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleFocusedColor, a3);
}

- (int64_t)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (void)setSubtitleTextStyle:(int64_t)a3
{
  self->_subtitleTextStyle = a3;
}

- (UIColor)subtitleUnfocusedColor
{
  return self->_subtitleUnfocusedColor;
}

- (void)setSubtitleUnfocusedColor:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleUnfocusedColor, a3);
}

- (UIColor)subtitleFocusedColor
{
  return self->_subtitleFocusedColor;
}

- (void)setSubtitleFocusedColor:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFocusedColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleFocusedColor, 0);
  objc_storeStrong((id *)&self->_subtitleUnfocusedColor, 0);
  objc_storeStrong((id *)&self->_titleFocusedColor, 0);
  objc_storeStrong((id *)&self->_titleUnfocusedColor, 0);
  objc_storeStrong((id *)&self->_focusedBgColor, 0);
  objc_storeStrong((id *)&self->_unfocusedBgColor, 0);
}

@end
