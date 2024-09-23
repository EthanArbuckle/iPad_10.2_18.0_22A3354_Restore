@implementation TVMonogramViewConfiguration

- (TVMonogramViewConfiguration)initWithStyle:(int64_t)a3
{
  char *v4;
  TVMonogramViewConfiguration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImage *unfocusedShadowImage;
  void *v10;
  void *v11;
  uint64_t v12;
  UIImage *focusedShadowImage;
  uint64_t v14;
  UIColor *v15;
  uint64_t v16;
  UIColor *v17;
  uint64_t v18;
  UIColor *v19;
  uint64_t v20;
  UIColor *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  UIColor *unfocusedBgColor;
  uint64_t v27;
  UIColor *focusedBgColor;
  uint64_t v29;
  UIColor *titleUnfocusedColor;
  uint64_t v31;
  UIColor *titleFocusedColor;
  uint64_t v33;
  UIColor *subtitleUnfocusedColor;
  uint64_t v35;
  UIColor *subtitleFocusedColor;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)TVMonogramViewConfiguration;
  v4 = -[TVMonogramViewConfiguration init](&v38, sel_init);
  v5 = (TVMonogramViewConfiguration *)v4;
  if (v4)
  {
    *((_QWORD *)v4 + 1) = a3;
    *((_QWORD *)v4 + 2) = 0x404A000000000000;
    *(_OWORD *)(v4 + 40) = xmmword_222E76FD0;
    v6 = (void *)MEMORY[0x24BDF6AC8];
    +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("monogram250x250-shadow-unfocussed"), v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    unfocusedShadowImage = v5->_unfocusedShadowImage;
    v5->_unfocusedShadowImage = (UIImage *)v8;

    v10 = (void *)MEMORY[0x24BDF6AC8];
    +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("monogram250x250-shadow-focussed"), v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    focusedShadowImage = v5->_focusedShadowImage;
    v5->_focusedShadowImage = (UIImage *)v12;

    objc_storeStrong((id *)&v5->_titleTextStyle, (id)*MEMORY[0x24BDF77B0]);
    objc_storeStrong((id *)&v5->_subtitleTextStyle, (id)*MEMORY[0x24BDF7808]);
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.6);
      v25 = objc_claimAutoreleasedReturnValue();
      unfocusedBgColor = v5->_unfocusedBgColor;
      v5->_unfocusedBgColor = (UIColor *)v25;

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
      v27 = objc_claimAutoreleasedReturnValue();
      focusedBgColor = v5->_focusedBgColor;
      v5->_focusedBgColor = (UIColor *)v27;

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5);
      v29 = objc_claimAutoreleasedReturnValue();
      titleUnfocusedColor = v5->_titleUnfocusedColor;
      v5->_titleUnfocusedColor = (UIColor *)v29;

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
      v31 = objc_claimAutoreleasedReturnValue();
      titleFocusedColor = v5->_titleFocusedColor;
      v5->_titleFocusedColor = (UIColor *)v31;

      v22 = (void *)MEMORY[0x24BDF6950];
      v23 = 0.3;
      v24 = 1.0;
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.6);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v5->_unfocusedBgColor;
      v5->_unfocusedBgColor = (UIColor *)v14;

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.9);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v5->_focusedBgColor;
      v5->_focusedBgColor = (UIColor *)v16;

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.6);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v5->_titleUnfocusedColor;
      v5->_titleUnfocusedColor = (UIColor *)v18;

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v5->_titleFocusedColor;
      v5->_titleFocusedColor = (UIColor *)v20;

      v22 = (void *)MEMORY[0x24BDF6950];
      v23 = 0.4;
      v24 = 0.0;
LABEL_6:
      objc_msgSend(v22, "colorWithWhite:alpha:", v24, v23);
      v33 = objc_claimAutoreleasedReturnValue();
      subtitleUnfocusedColor = v5->_subtitleUnfocusedColor;
      v5->_subtitleUnfocusedColor = (UIColor *)v33;

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
      v35 = objc_claimAutoreleasedReturnValue();
      subtitleFocusedColor = v5->_subtitleFocusedColor;
      v5->_subtitleFocusedColor = (UIColor *)v35;

    }
  }
  return v5;
}

- (TVMonogramViewConfiguration)initWithShadowImages:(BOOL)a3
{
  _BOOL4 v3;
  char *v4;
  TVMonogramViewConfiguration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImage *unfocusedShadowImage;
  void *v10;
  void *v11;
  uint64_t v12;
  UIImage *focusedShadowImage;
  objc_super v15;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TVMonogramViewConfiguration;
  v4 = -[TVMonogramViewConfiguration init](&v15, sel_init);
  v5 = (TVMonogramViewConfiguration *)v4;
  if (v4)
  {
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 2) = 0x404A000000000000;
    if (v3)
    {
      *(_OWORD *)(v4 + 40) = xmmword_222E76FD0;
      v6 = (void *)MEMORY[0x24BDF6AC8];
      +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("monogram250x250-shadow-unfocussed"), v7, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      unfocusedShadowImage = v5->_unfocusedShadowImage;
      v5->_unfocusedShadowImage = (UIImage *)v8;

      v10 = (void *)MEMORY[0x24BDF6AC8];
      +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("monogram250x250-shadow-focussed"), v11, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      focusedShadowImage = v5->_focusedShadowImage;
      v5->_focusedShadowImage = (UIImage *)v12;

    }
  }
  return v5;
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 16) = self->_focusedSizeIncrease;
  *(double *)(v4 + 40) = self->_unfocusedShadowAlpha;
  *(double *)(v4 + 48) = self->_focusedShadowAlpha;
  v5 = -[UIImage copy](self->_unfocusedShadowImage, "copy");
  v6 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v5;

  v7 = -[UIImage copy](self->_focusedShadowImage, "copy");
  v8 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v7;

  v9 = -[NSString copy](self->_titleTextStyle, "copy");
  v10 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v9;

  v11 = -[NSString copy](self->_subtitleTextStyle, "copy");
  v12 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v11;

  v13 = -[UIColor copy](self->_unfocusedBgColor, "copy");
  v14 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v13;

  v15 = -[UIColor copy](self->_focusedBgColor, "copy");
  v16 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v15;

  v17 = -[UIColor copy](self->_titleUnfocusedColor, "copy");
  v18 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v17;

  v19 = -[UIColor copy](self->_titleFocusedColor, "copy");
  v20 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v19;

  v21 = -[UIColor copy](self->_subtitleUnfocusedColor, "copy");
  v22 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v21;

  v23 = -[UIColor copy](self->_subtitleFocusedColor, "copy");
  v24 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = v23;

  return (id)v4;
}

- (double)unfocusedImageAlpha
{
  double result;
  UIColor *unfocusedBgColor;
  double v5;
  double v6;

  result = 1.0;
  if (self->_focusedBgColor)
  {
    unfocusedBgColor = self->_unfocusedBgColor;
    if (unfocusedBgColor)
    {
      v5 = 1.0;
      v6 = 1.0;
      -[UIColor getRed:green:blue:alpha:](unfocusedBgColor, "getRed:green:blue:alpha:", 0, 0, 0, &v5, 1.0);
      -[UIColor getRed:green:blue:alpha:](self->_focusedBgColor, "getRed:green:blue:alpha:", 0, 0, 0, &v6);
      return v5 / v6;
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

- (UIImage)unfocusedShadowImage
{
  return self->_unfocusedShadowImage;
}

- (void)setUnfocusedShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_unfocusedShadowImage, a3);
}

- (UIImage)focusedShadowImage
{
  return self->_focusedShadowImage;
}

- (void)setFocusedShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_focusedShadowImage, a3);
}

- (NSString)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setTitleTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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

- (NSString)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (void)setSubtitleTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
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
  objc_storeStrong((id *)&self->_subtitleTextStyle, 0);
  objc_storeStrong((id *)&self->_titleFocusedColor, 0);
  objc_storeStrong((id *)&self->_titleUnfocusedColor, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
  objc_storeStrong((id *)&self->_focusedShadowImage, 0);
  objc_storeStrong((id *)&self->_unfocusedShadowImage, 0);
  objc_storeStrong((id *)&self->_focusedBgColor, 0);
  objc_storeStrong((id *)&self->_unfocusedBgColor, 0);
}

@end
