@implementation SBUIVibrantButton

- (SBUIVibrantButton)initWithFrame:(CGRect)a3
{
  SBUIVibrantButton *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUIVibrantButton;
  v3 = -[SBUIVibrantButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIVibrantButton setLegibilitySettings:](v3, "setLegibilitySettings:", v4);
    -[SBUIVibrantButton setStrength:](v3, "setStrength:", *MEMORY[0x1E0CEC0C0]);
    v3->_numberOfLines = 1;
    v3->_minimumTitleScaleFactor = 0.0;
    v3->_textAlignment = 4;
    v3->_lineBreakMode = 4;
    -[SBUIVibrantButton _setUpForCurrentVibrancy](v3, "_setUpForCurrentVibrancy");

  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  BOOL v5;
  NSString *v6;
  NSString *title;
  id v8;

  v4 = a3;
  v8 = v4;
  if (!v4 || (v5 = -[NSString isEqualToString:](self->_title, "isEqualToString:", v4), v4 = v8, !v5))
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    title = self->_title;
    self->_title = v6;

    -[SBUILegibilityLabel setString:](self->_nonVibrantLegibilityLabel, "setString:", self->_title);
    -[UILabel setText:](self->_vibrantMaskLabel, "setText:", self->_title);
    v4 = v8;
  }

}

- (void)setGlyphImage:(id)a3
{
  UIImage *v5;
  id v6;
  UIView *v7;
  UIView *nonVibrantGlyph;
  UIImage *v9;

  v5 = (UIImage *)a3;
  v9 = v5;
  if (self->_glyphImage != v5)
  {
    objc_storeStrong((id *)&self->_glyphImage, a3);
    v5 = v9;
  }
  if (v5 && !self->_nonVibrantGlyph)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v7 = (UIView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    nonVibrantGlyph = self->_nonVibrantGlyph;
    self->_nonVibrantGlyph = v7;

    -[UIView setClipsToBounds:](self->_nonVibrantGlyph, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](self->_nonVibrantGlyph, "setUserInteractionEnabled:", 0);
    -[SBUIVibrantButton addSubview:](self, "addSubview:", self->_nonVibrantGlyph);
    v5 = v9;
  }
  -[UIImageView setImage:](self->_vibrantMaskGlyphView, "setImage:", v5);
  -[SBUIVibrantButton setNeedsLayout](self, "setNeedsLayout");

}

- (void)setVibrancyAllowed:(BOOL)a3
{
  if (self->_vibrancyAllowed != a3)
  {
    self->_vibrancyAllowed = a3;
    -[SBUIVibrantButton _setUpForCurrentVibrancy](self, "_setUpForCurrentVibrancy");
  }
}

- (void)setMinimumTitleScaleFactor:(double)a3
{
  self->_minimumTitleScaleFactor = a3;
  -[UILabel setMinimumScaleFactor:](self->_vibrantMaskLabel, "setMinimumScaleFactor:");
  -[SBUILegibilityLabel setMinimumScaleFactor:](self->_nonVibrantLegibilityLabel, "setMinimumScaleFactor:", self->_minimumTitleScaleFactor);
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  -[UILabel setTextAlignment:](self->_vibrantMaskLabel, "setTextAlignment:");
  -[SBUILegibilityLabel setTextAlignment:](self->_nonVibrantLegibilityLabel, "setTextAlignment:", self->_textAlignment);
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
  -[UILabel setNumberOfLines:](self->_vibrantMaskLabel, "setNumberOfLines:");
  -[SBUILegibilityLabel setNumberOfLines:](self->_nonVibrantLegibilityLabel, "setNumberOfLines:", self->_textAlignment);
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
  -[UILabel setLineBreakMode:](self->_vibrantMaskLabel, "setLineBreakMode:");
  -[SBUILegibilityLabel setLineBreakMode:](self->_nonVibrantLegibilityLabel, "setLineBreakMode:", self->_lineBreakMode);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  if (-[SBUIVibrantButton _shouldUseVibrancy](self, "_shouldUseVibrancy", a3.width, a3.height))
    -[SBUIVibrantButton _sizeThatFitsWithVibrancy](self, "_sizeThatFitsWithVibrancy");
  else
    -[SBUIVibrantButton _sizeThatFitsWithoutVibrancy](self, "_sizeThatFitsWithoutVibrancy");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  if (-[SBUIVibrantButton _shouldUseVibrancy](self, "_shouldUseVibrancy"))
    -[SBUIVibrantButton _layoutVibrantSubviews](self, "_layoutVibrantSubviews");
  else
    -[SBUIVibrantButton _layoutNonVibrantSubviews](self, "_layoutNonVibrantSubviews");
}

- (void)setBackgroundColor:(id)a3
{
  UIView *nonVibrantGlyph;
  id v5;

  nonVibrantGlyph = self->_nonVibrantGlyph;
  v5 = a3;
  -[UIView setBackgroundColor:](nonVibrantGlyph, "setBackgroundColor:", v5);
  -[UIView setBackgroundColor:](self->_vibrantGlyph, "setBackgroundColor:", v5);

}

- (id)backgroundColor
{
  return -[UIView backgroundColor](self->_nonVibrantGlyph, "backgroundColor");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIVibrantButton;
  -[SBUIVibrantButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SBUIVibrantButton _updateForState](self, "_updateForState");
}

- (BOOL)_shouldUseVibrancy
{
  void *v2;
  BOOL v3;

  if (!-[SBUIVibrantButton isVibrancyAllowed](self, "isVibrancyAllowed"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_graphicsQuality") == 100;

  return v3;
}

+ (id)_labelFont
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0DA9E68], "logoutLabelFontSize");
  return (id)objc_msgSend(v2, "systemFontOfSize:");
}

- (void)_setUpForCurrentVibrancy
{
  UIView *nonVibrantGlyph;
  SBUILegibilityView *nonVibrantGlyphLegibilityView;
  SBUILegibilityLabel *nonVibrantLegibilityLabel;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  UIView *vibrantGlyph;
  id v13;
  UIView *v14;
  UIView *vibrantMaskView;
  UILabel *v16;
  UILabel *vibrantMaskLabel;
  UILabel *v18;
  void *v19;
  UIImageView *v20;
  UIImageView *vibrantMaskGlyphView;
  UIView *v22;
  UIView *v23;
  UILabel *v24;
  UIImageView *v25;
  UIView *vibrantGlyphTintView;
  UIView *vibrantGlyphBackgroundView;
  id v28;
  UIView *v29;
  UIView *v30;
  SBUILegibilityLabel *v31;
  _UILegibilitySettings *legibilitySettings;
  double v33;
  const __CFString *title;
  void *v35;
  SBUILegibilityLabel *v36;
  SBUILegibilityLabel *v37;

  if (-[SBUIVibrantButton _shouldUseVibrancy](self, "_shouldUseVibrancy"))
  {
    -[UIView removeFromSuperview](self->_nonVibrantGlyph, "removeFromSuperview");
    -[SBUILegibilityLabel removeFromSuperview](self->_nonVibrantLegibilityLabel, "removeFromSuperview");
    nonVibrantGlyph = self->_nonVibrantGlyph;
    self->_nonVibrantGlyph = 0;

    nonVibrantGlyphLegibilityView = self->_nonVibrantGlyphLegibilityView;
    self->_nonVibrantGlyphLegibilityView = 0;

    nonVibrantLegibilityLabel = self->_nonVibrantLegibilityLabel;
    self->_nonVibrantLegibilityLabel = 0;

    if (!self->_vibrantGlyph)
    {
      v6 = objc_alloc(MEMORY[0x1E0CEABB0]);
      v7 = *MEMORY[0x1E0C9D648];
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v11 = (UIView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
      vibrantGlyph = self->_vibrantGlyph;
      self->_vibrantGlyph = v11;

      -[UIView setUserInteractionEnabled:](self->_vibrantGlyph, "setUserInteractionEnabled:", 0);
      -[SBUIVibrantButton addSubview:](self, "addSubview:", self->_vibrantGlyph);
      v13 = objc_alloc(MEMORY[0x1E0CEABB0]);
      -[SBUIVibrantButton bounds](self, "bounds");
      v14 = (UIView *)objc_msgSend(v13, "initWithFrame:");
      vibrantMaskView = self->_vibrantMaskView;
      self->_vibrantMaskView = v14;

      v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v7, v8, v9, v10);
      vibrantMaskLabel = self->_vibrantMaskLabel;
      self->_vibrantMaskLabel = v16;

      -[UIView addSubview:](self->_vibrantMaskView, "addSubview:", self->_vibrantMaskLabel);
      -[UILabel setText:](self->_vibrantMaskLabel, "setText:", self->_title);
      v18 = self->_vibrantMaskLabel;
      objc_msgSend((id)objc_opt_class(), "_labelFont");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v18, "setFont:", v19);

      -[UILabel setAdjustsFontSizeToFitWidth:](self->_vibrantMaskLabel, "setAdjustsFontSizeToFitWidth:", 1);
      -[UILabel setMinimumScaleFactor:](self->_vibrantMaskLabel, "setMinimumScaleFactor:", self->_minimumTitleScaleFactor);
      -[UILabel setTextAlignment:](self->_vibrantMaskLabel, "setTextAlignment:", self->_textAlignment);
      -[UILabel setNumberOfLines:](self->_vibrantMaskLabel, "setNumberOfLines:", self->_numberOfLines);
      -[UILabel setLineBreakMode:](self->_vibrantMaskLabel, "setLineBreakMode:", self->_lineBreakMode);
      v20 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v7, v8, v9, v10);
      vibrantMaskGlyphView = self->_vibrantMaskGlyphView;
      self->_vibrantMaskGlyphView = v20;

      -[UIView addSubview:](self->_vibrantMaskView, "addSubview:", self->_vibrantMaskGlyphView);
      -[UIImageView setImage:](self->_vibrantMaskGlyphView, "setImage:", self->_glyphImage);
      -[UIView setMaskView:](self->_vibrantGlyph, "setMaskView:", self->_vibrantMaskView);
    }
  }
  else
  {
    -[UIView removeFromSuperview](self->_vibrantGlyph, "removeFromSuperview");
    v22 = self->_vibrantGlyph;
    self->_vibrantGlyph = 0;

    v23 = self->_vibrantMaskView;
    self->_vibrantMaskView = 0;

    v24 = self->_vibrantMaskLabel;
    self->_vibrantMaskLabel = 0;

    v25 = self->_vibrantMaskGlyphView;
    self->_vibrantMaskGlyphView = 0;

    vibrantGlyphTintView = self->_vibrantGlyphTintView;
    self->_vibrantGlyphTintView = 0;

    vibrantGlyphBackgroundView = self->_vibrantGlyphBackgroundView;
    self->_vibrantGlyphBackgroundView = 0;

    if (!self->_nonVibrantGlyph)
    {
      v28 = objc_alloc(MEMORY[0x1E0CEABB0]);
      v29 = (UIView *)objc_msgSend(v28, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v30 = self->_nonVibrantGlyph;
      self->_nonVibrantGlyph = v29;

      -[UIView setClipsToBounds:](self->_nonVibrantGlyph, "setClipsToBounds:", 1);
      -[UIView setUserInteractionEnabled:](self->_nonVibrantGlyph, "setUserInteractionEnabled:", 0);
      -[SBUIVibrantButton addSubview:](self, "addSubview:", self->_nonVibrantGlyph);
    }
    if (!self->_nonVibrantLegibilityLabel)
    {
      v31 = [SBUILegibilityLabel alloc];
      legibilitySettings = self->_legibilitySettings;
      v33 = *MEMORY[0x1E0CEC0C0];
      if (self->_title)
        title = (const __CFString *)self->_title;
      else
        title = &stru_1E4C40DE8;
      objc_msgSend((id)objc_opt_class(), "_labelFont");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[SBUILegibilityLabel initWithSettings:strength:string:font:](v31, "initWithSettings:strength:string:font:", legibilitySettings, title, v35, v33);
      v37 = self->_nonVibrantLegibilityLabel;
      self->_nonVibrantLegibilityLabel = v36;

      -[SBUILegibilityLabel setAdjustsFontSizeToFitWidth:](self->_nonVibrantLegibilityLabel, "setAdjustsFontSizeToFitWidth:", 1);
      -[SBUILegibilityLabel setMinimumScaleFactor:](self->_nonVibrantLegibilityLabel, "setMinimumScaleFactor:", self->_minimumTitleScaleFactor);
      -[SBUILegibilityLabel setNumberOfLines:](self->_nonVibrantLegibilityLabel, "setNumberOfLines:", self->_numberOfLines);
      -[SBUILegibilityLabel setTextAlignment:](self->_nonVibrantLegibilityLabel, "setTextAlignment:", self->_textAlignment);
      -[SBUILegibilityLabel setLineBreakMode:](self->_nonVibrantLegibilityLabel, "setLineBreakMode:", self->_lineBreakMode);
      -[SBUIVibrantButton addSubview:](self, "addSubview:", self->_nonVibrantLegibilityLabel);
    }
  }
}

- (CGSize)_sizeThatFitsWithVibrancy
{
  double v2;
  double v3;
  CGSize result;

  -[SBUIVibrantButton _sizeThatFitsForLabelView:](self, "_sizeThatFitsForLabelView:", self->_vibrantMaskLabel);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_sizeThatFitsWithoutVibrancy
{
  double v2;
  double v3;
  CGSize result;

  -[SBUIVibrantButton _sizeThatFitsForLabelView:](self, "_sizeThatFitsForLabelView:", self->_nonVibrantLegibilityLabel);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_sizeThatFitsForLabelView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(a3, "sizeThatFits:", 100.0, 3.40282347e38);
  v5 = v4;
  -[UIImage size](self->_glyphImage, "size");
  if (v5 >= v6)
    v6 = v5;
  v8 = v7 + 15.0;
  result.height = v8;
  result.width = v6;
  return result;
}

- (CGRect)_labelFrameForSize:(CGSize)a3 baselineOffset:(double)a4 inRect:(CGRect)a5
{
  CGRect v6;

  UIRectCenteredXInRect();
  return CGRectOffset(v6, 0.0, a4);
}

- (CGRect)_glyphFrameForSize:(CGSize)a3 inRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  UIRectInset();
  UIRectCenteredXInRectScale();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_layoutVibrantSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIView *vibrantMaskView;
  UIView *vibrantGlyphBackgroundView;
  UIView *vibrantGlyphTintView;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;

  -[SBUIVibrantButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel sizeThatFits:](self->_vibrantMaskLabel, "sizeThatFits:", v7, v9);
  v12 = v11;
  v14 = v13;
  -[UIImage size](self->_glyphImage, "size");
  v33 = v15;
  v17 = v16;
  -[UILabel _firstBaselineOffsetFromTop](self->_vibrantMaskLabel, "_firstBaselineOffsetFromTop");
  -[SBUIVibrantButton _labelFrameForSize:baselineOffset:inRect:](self, "_labelFrameForSize:baselineOffset:inRect:", v12, v14, v14 - v18, v4, v6, v8, v10);
  v37 = v20;
  v38 = v19;
  v35 = v22;
  v36 = v21;
  -[SBUIVibrantButton _glyphFrameForSize:inRect:](self, "_glyphFrameForSize:inRect:", v33, v17, v4, v6, v8, v10);
  v24 = v23;
  v26 = v25;
  v34 = v27;
  v29 = v28;
  UIRectInset();
  -[UIView setFrame:](self->_vibrantGlyph, "setFrame:");
  vibrantMaskView = self->_vibrantMaskView;
  -[UIView bounds](self->_vibrantGlyph, "bounds");
  -[UIView setFrame:](vibrantMaskView, "setFrame:");
  -[UILabel setFrame:](self->_vibrantMaskLabel, "setFrame:", v38, v37, v36, v35);
  -[UIImageView setFrame:](self->_vibrantMaskGlyphView, "setFrame:", v24, v26, v34, v29);
  vibrantGlyphBackgroundView = self->_vibrantGlyphBackgroundView;
  -[UIView bounds](self->_vibrantGlyph, "bounds");
  -[UIView setFrame:](vibrantGlyphBackgroundView, "setFrame:");
  vibrantGlyphTintView = self->_vibrantGlyphTintView;
  -[UIView bounds](self->_vibrantGlyph, "bounds");
  -[UIView setFrame:](vibrantGlyphTintView, "setFrame:");
}

- (void)_layoutNonVibrantSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;

  -[SBUIVibrantButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBUILegibilityLabel sizeThatFits:](self->_nonVibrantLegibilityLabel, "sizeThatFits:", v7, v9);
  v12 = v11;
  v14 = v13;
  -[UIImage size](self->_glyphImage, "size");
  v34 = v16;
  v35 = v15;
  -[SBUILegibilityLabel firstBaselineOffsetFromBottom](self->_nonVibrantLegibilityLabel, "firstBaselineOffsetFromBottom");
  -[SBUIVibrantButton _labelFrameForSize:baselineOffset:inRect:](self, "_labelFrameForSize:baselineOffset:inRect:", v12, v14, v17, v4, v6, v8, v10);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[SBUIVibrantButton _glyphFrameForSize:inRect:](self, "_glyphFrameForSize:inRect:", v35, v34, v4, v6, v8, v10);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[SBUILegibilityLabel setFrame:](self->_nonVibrantLegibilityLabel, "setFrame:", v19, v21, v23, v25);
  -[UIView setFrame:](self->_nonVibrantGlyph, "setFrame:", v27, v29, v31, v33);
}

- (id)_lazyGlyphLegibilityView
{
  SBUILegibilityView *v3;
  SBUILegibilityView *v4;
  SBUILegibilityView *nonVibrantGlyphLegibilityView;
  SBUILegibilityView *v6;
  void *v7;

  if (self->_glyphImage
    && !-[SBUIVibrantButton _shouldUseVibrancy](self, "_shouldUseVibrancy")
    && !self->_nonVibrantGlyphLegibilityView)
  {
    v3 = [SBUILegibilityView alloc];
    -[UIView bounds](self->_nonVibrantGlyph, "bounds");
    v4 = -[SBUILegibilityView initWithFrame:](v3, "initWithFrame:");
    nonVibrantGlyphLegibilityView = self->_nonVibrantGlyphLegibilityView;
    self->_nonVibrantGlyphLegibilityView = v4;

    v6 = self->_nonVibrantGlyphLegibilityView;
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUILegibilityView updateForChangedSettings:options:image:strength:](v6, "updateForChangedSettings:options:image:strength:", v7, 2, self->_glyphImage, *MEMORY[0x1E0CEC0D0]);

    -[UIView addSubview:](self->_nonVibrantGlyph, "addSubview:", self->_nonVibrantGlyphLegibilityView);
    -[SBUILegibilityView setAutoresizingMask:](self->_nonVibrantGlyphLegibilityView, "setAutoresizingMask:", 18);
    -[UIView setAutoresizesSubviews:](self->_nonVibrantGlyph, "setAutoresizesSubviews:", 1);
  }
  return self->_nonVibrantGlyphLegibilityView;
}

- (double)_alphaForState
{
  int v2;
  double result;

  v2 = -[SBUIVibrantButton isHighlighted](self, "isHighlighted");
  result = 0.2;
  if (!v2)
    return 1.0;
  return result;
}

- (void)_updateForState
{
  -[SBUIVibrantButton _alphaForState](self, "_alphaForState");
  -[SBUIVibrantButton setAlpha:](self, "setAlpha:");
}

- (void)setVibrantSettings:(id)a3
{
  UIView *vibrantGlyphTintView;
  _SBFVibrantSettings *vibrantSettings;
  UIView *v7;
  UIView *v8;
  id v9;

  v9 = a3;
  if (-[SBUIVibrantButton _shouldUseVibrancy](self, "_shouldUseVibrancy")
    && (-[_SBFVibrantSettings isEqual:](self->_vibrantSettings, "isEqual:", v9) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrantSettings, a3);
    -[UIView removeFromSuperview](self->_vibrantGlyphTintView, "removeFromSuperview");
    vibrantGlyphTintView = self->_vibrantGlyphTintView;
    self->_vibrantGlyphTintView = 0;

    vibrantSettings = self->_vibrantSettings;
    -[UIView bounds](self->_vibrantGlyph, "bounds");
    -[_SBFVibrantSettings tintViewWithFrame:](vibrantSettings, "tintViewWithFrame:");
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_vibrantGlyphTintView;
    self->_vibrantGlyphTintView = v7;

    -[UIView addSubview:](self->_vibrantGlyph, "addSubview:", self->_vibrantGlyphTintView);
  }

}

- (void)setBackgroundView:(id)a3
{
  _BOOL4 v5;
  UIView *v6;
  UIView **p_vibrantGlyphBackgroundView;
  UIView *vibrantGlyphBackgroundView;
  UIView *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  BOOL v22;
  UIView *v23;
  UIView *v24;
  CGRect v25;
  CGRect v26;

  v24 = (UIView *)a3;
  v5 = -[SBUIVibrantButton _shouldUseVibrancy](self, "_shouldUseVibrancy");
  v6 = v24;
  if (v5)
  {
    p_vibrantGlyphBackgroundView = &self->_vibrantGlyphBackgroundView;
    vibrantGlyphBackgroundView = self->_vibrantGlyphBackgroundView;
    v9 = v24;
    if (vibrantGlyphBackgroundView != v24)
    {
      -[UIView removeFromSuperview](vibrantGlyphBackgroundView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_vibrantGlyphBackgroundView, a3);
      -[UIView addSubview:](self->_vibrantGlyph, "addSubview:", *p_vibrantGlyphBackgroundView);
      -[UIView sendSubviewToBack:](self->_vibrantGlyph, "sendSubviewToBack:", *p_vibrantGlyphBackgroundView);
      v9 = *p_vibrantGlyphBackgroundView;
    }
    -[UIView frame](v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UIView bounds](self->_vibrantGlyph, "bounds");
    v26.origin.x = v18;
    v26.origin.y = v19;
    v26.size.width = v20;
    v26.size.height = v21;
    v25.origin.x = v11;
    v25.origin.y = v13;
    v25.size.width = v15;
    v25.size.height = v17;
    v22 = CGRectEqualToRect(v25, v26);
    v6 = v24;
    if (!v22)
    {
      v23 = *p_vibrantGlyphBackgroundView;
      -[UIView bounds](self->_vibrantGlyph, "bounds");
      -[UIView setFrame:](v23, "setFrame:");
      v6 = v24;
    }
  }

}

- (void)setStrength:(double)a3
{
  void *v5;

  self->_strength = a3;
  -[SBUIVibrantButton _lazyGlyphLegibilityView](self, "_lazyGlyphLegibilityView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStrength:", a3);

  -[SBUILegibilityLabel setStrength:](self->_nonVibrantLegibilityLabel, "setStrength:", a3);
}

- (void)setLegibilitySettings:(id)a3
{
  void *v5;
  id v6;

  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  v6 = a3;
  -[SBUIVibrantButton _lazyGlyphLegibilityView](self, "_lazyGlyphLegibilityView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateForChangedSettings:", v6);

  -[SBUILegibilityLabel setLegibilitySettings:](self->_nonVibrantLegibilityLabel, "setLegibilitySettings:", v6);
}

- (void)setLegibilitySettings:(id)a3 textStrength:(double)a4
{
  id v6;

  v6 = a3;
  -[SBUIVibrantButton setStrength:](self, "setStrength:", a4);
  -[SBUIVibrantButton setLegibilitySettings:](self, "setLegibilitySettings:", v6);

}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (double)minimumTitleScaleFactor
{
  return self->_minimumTitleScaleFactor;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (_SBFVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)isVibrancyAllowed
{
  return self->_vibrancyAllowed;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonVibrantLegibilityLabel, 0);
  objc_storeStrong((id *)&self->_nonVibrantGlyphLegibilityView, 0);
  objc_storeStrong((id *)&self->_nonVibrantGlyph, 0);
  objc_storeStrong((id *)&self->_vibrantGlyphTintView, 0);
  objc_storeStrong((id *)&self->_vibrantGlyphBackgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantGlyph, 0);
  objc_storeStrong((id *)&self->_vibrantMaskGlyphView, 0);
  objc_storeStrong((id *)&self->_vibrantMaskLabel, 0);
  objc_storeStrong((id *)&self->_vibrantMaskView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
}

@end
