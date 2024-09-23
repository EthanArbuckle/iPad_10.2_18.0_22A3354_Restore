@implementation SBUILegibilityLabel

- (void)setString:(id)a3
{
  NSString *v4;
  NSString *string;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_string, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    string = self->_string;
    self->_string = v4;

    -[UILabel setText:](self->_lookasideLabel, "setText:", self->_string);
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBUILegibilityLabel frame](self, "frame");
  v8.receiver = self;
  v8.super_class = (Class)SBUILegibilityLabel;
  -[SBUILegibilityLabel setFrame:](&v8, sel_setFrame_, x, y, width, height);
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    -[UILabel setNeedsLayout](self->_lookasideLabel, "setNeedsLayout");
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (void)_markOurselfDirty
{
  self->_isDirty = 1;
  -[SBUILegibilityLabel setNeedsLayout](self, "setNeedsLayout");
  -[SBUILegibilityLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_lookasideLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (SBUILegibilityLabel)initWithFrame:(CGRect)a3
{
  void *v4;
  SBUILegibilityLabel *v5;

  objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBUILegibilityLabel initWithSettings:strength:](self, "initWithSettings:strength:", v4, *MEMORY[0x1E0CEC0C0]);

  return v5;
}

- (SBUILegibilityLabel)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUILegibilityLabel.m"), 52, CFSTR("Not supported"));

  return -[SBUILegibilityLabel initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (SBUILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  SBUILegibilityLabel *v9;

  v6 = (void *)MEMORY[0x1E0CEA5E8];
  v7 = a3;
  objc_msgSend(v6, "systemFontSize");
  objc_msgSend(v6, "systemFontOfSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBUILegibilityLabel initWithSettings:strength:string:font:](self, "initWithSettings:strength:string:font:", v7, 0, v8, a4);

  return v9;
}

- (SBUILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6
{
  return -[SBUILegibilityLabel initWithSettings:strength:string:font:options:](self, "initWithSettings:strength:string:font:options:", a3, a5, a6, 0, a4);
}

- (SBUILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6 options:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SBUILegibilityLabel *v20;
  SBUILegibilityLabel *v21;
  uint64_t v22;
  NSString *string;
  uint64_t v24;
  UILabel *lookasideLabel;
  objc_super v27;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v27.receiver = self;
  v27.super_class = (Class)SBUILegibilityLabel;
  v16 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v20 = -[SBUILegibilityLabel initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v17, v18, v19);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_legibilitySettings, a3);
    v21->_strength = a4;
    v22 = objc_msgSend(v14, "copy");
    string = v21->_string;
    v21->_string = (NSString *)v22;

    objc_storeStrong((id *)&v21->_font, a6);
    v21->_options = a7;
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v16, v17, v18, v19);
    lookasideLabel = v21->_lookasideLabel;
    v21->_lookasideLabel = (UILabel *)v24;

    -[UILabel setHidden:](v21->_lookasideLabel, "setHidden:", 1);
    -[UILabel setText:](v21->_lookasideLabel, "setText:", v21->_string);
    -[UILabel setFont:](v21->_lookasideLabel, "setFont:", v21->_font);
    -[SBUILegibilityLabel _updateLabelColor](v21, "_updateLabelColor");
    -[SBUILegibilityLabel addSubview:](v21, "addSubview:", v21->_lookasideLabel);
    -[SBUILegibilityLabel _markOurselfDirty](v21, "_markOurselfDirty");
  }

  return v21;
}

- (void)setAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedText;
  BOOL v6;
  NSAttributedString *v7;
  NSAttributedString *v8;
  NSAttributedString *v9;

  v4 = (NSAttributedString *)a3;
  attributedText = self->_attributedText;
  if (attributedText != v4)
  {
    v9 = v4;
    v6 = -[NSAttributedString isEqualToAttributedString:](attributedText, "isEqualToAttributedString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSAttributedString *)-[NSAttributedString copy](v9, "copy");
      v8 = self->_attributedText;
      self->_attributedText = v7;

      -[UILabel setAttributedText:](self->_lookasideLabel, "setAttributedText:", self->_attributedText);
      -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
      v4 = v9;
    }
  }

}

- (UIColor)textColor
{
  UIColor *textColorOverride;

  textColorOverride = self->_textColorOverride;
  if (textColorOverride)
    return textColorOverride;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_textColorOverride, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColorOverride, a3);
    -[SBUILegibilityLabel _updateLabelColor](self, "_updateLabelColor");
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }

}

- (void)setFont:(id)a3
{
  UIFont *v5;

  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[UILabel setFont:](self->_lookasideLabel, "setFont:", v5);
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }

}

- (int64_t)numberOfLines
{
  return -[UILabel numberOfLines](self->_lookasideLabel, "numberOfLines");
}

- (void)setNumberOfLines:(int64_t)a3
{
  uint64_t v5;

  if (-[UILabel numberOfLines](self->_lookasideLabel, "numberOfLines") != a3)
  {
    -[UILabel setNumberOfLines:](self->_lookasideLabel, "setNumberOfLines:", a3);
    if (a3 > 1)
      v5 = 1;
    else
      v5 = 4;
    -[UILabel setTextAlignment:](self->_lookasideLabel, "setTextAlignment:", v5);
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return -[UILabel adjustsFontSizeToFitWidth](self->_lookasideLabel, "adjustsFontSizeToFitWidth");
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UILabel adjustsFontSizeToFitWidth](self->_lookasideLabel, "adjustsFontSizeToFitWidth") != a3)
  {
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_lookasideLabel, "setAdjustsFontSizeToFitWidth:", v3);
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (double)minimumScaleFactor
{
  double result;

  -[UILabel minimumScaleFactor](self->_lookasideLabel, "minimumScaleFactor");
  return result;
}

- (void)setMinimumScaleFactor:(double)a3
{
  -[UILabel minimumScaleFactor](self->_lookasideLabel, "minimumScaleFactor");
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    -[UILabel setMinimumScaleFactor:](self->_lookasideLabel, "setMinimumScaleFactor:", a3);
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (int64_t)textAlignment
{
  return -[UILabel textAlignment](self->_lookasideLabel, "textAlignment");
}

- (void)setTextAlignment:(int64_t)a3
{
  if (-[UILabel textAlignment](self->_lookasideLabel, "textAlignment") != a3)
  {
    -[UILabel setTextAlignment:](self->_lookasideLabel, "setTextAlignment:", a3);
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (int64_t)lineBreakMode
{
  return -[UILabel lineBreakMode](self->_lookasideLabel, "lineBreakMode");
}

- (void)setLineBreakMode:(int64_t)a3
{
  if (-[UILabel lineBreakMode](self->_lookasideLabel, "lineBreakMode") != a3)
  {
    -[UILabel setLineBreakMode:](self->_lookasideLabel, "setLineBreakMode:", a3);
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (float)hyphenationFactor
{
  float result;

  -[UILabel _hyphenationFactor](self->_lookasideLabel, "_hyphenationFactor");
  return result;
}

- (void)setHyphenationFactor:(float)a3
{
  double v5;

  -[UILabel _hyphenationFactor](self->_lookasideLabel, "_hyphenationFactor");
  if (*(float *)&v5 != a3)
  {
    *(float *)&v5 = a3;
    -[UILabel _setHyphenationFactor:](self->_lookasideLabel, "_setHyphenationFactor:", v5);
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (void)setOptions:(int64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    -[SBUILegibilityView updateForChangedSettings:options:](self->_legibilityView, "updateForChangedSettings:options:", self->_legibilitySettings, a3);
    -[SBUILegibilityLabel _updateLabelColor](self, "_updateLabelColor");
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (UIEdgeInsets)characterOverflowInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UILabel _contentInsetsFromFonts](self->_lookasideLabel, "_contentInsetsFromFonts");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)firstBaselineOffsetFromBottom
{
  double Height;
  double v4;
  CGRect v6;

  -[SBUILegibilityLabel bounds](self, "bounds");
  Height = CGRectGetHeight(v6);
  -[UILabel effectiveFirstBaselineOffsetFromTop](self->_lookasideLabel, "effectiveFirstBaselineOffsetFromTop");
  return Height - v4;
}

- (double)lastBaselineOffsetFromBottom
{
  double result;

  -[UILabel effectiveBaselineOffsetFromBottom](self->_lookasideLabel, "effectiveBaselineOffsetFromBottom");
  return result;
}

- (void)_updateLabelColor
{
  UILabel *lookasideLabel;
  id v3;

  lookasideLabel = self->_lookasideLabel;
  if (self->_textColorOverride)
  {
    -[UILabel setTextColor:](self->_lookasideLabel, "setTextColor:");
  }
  else
  {
    -[SBUILegibilityLabel drawingColor](self, "drawingColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](lookasideLabel, "setTextColor:", v3);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUILegibilityLabel;
  v4 = a3;
  -[SBUILegibilityLabel traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  -[SBUILegibilityLabel traitCollection](self, "traitCollection", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");

  objc_msgSend(v4, "displayScale");
  if ((BSFloatEqualToFloat() & 1) == 0)
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
}

- (id)viewForFirstBaselineLayout
{
  return self->_lookasideLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_lookasideLabel;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBUILegibilityLabel bounds](self, "bounds");
  v8.receiver = self;
  v8.super_class = (Class)SBUILegibilityLabel;
  -[SBUILegibilityLabel setBounds:](&v8, sel_setBounds_, x, y, width, height);
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    -[UILabel setNeedsLayout](self->_lookasideLabel, "setNeedsLayout");
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_lookasideLabel, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  UILabel *lookasideLabel;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUILegibilityLabel;
  -[SBUILegibilityLabel layoutSubviews](&v4, sel_layoutSubviews);
  lookasideLabel = self->_lookasideLabel;
  -[SBUILegibilityLabel bounds](self, "bounds");
  -[UILabel setFrame:](lookasideLabel, "setFrame:");
  if (self->_isDirty)
  {
    -[SBUILegibilityLabel _updateLegibilityView](self, "_updateLegibilityView");
    self->_isDirty = 0;
  }
}

- (void)setStrength:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_strength = a3;
    -[SBUILegibilityView setStrength:](self->_legibilityView, "setStrength:", a3);
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBUILegibilityLabel _updateLabelColor](self, "_updateLabelColor");
    -[SBUILegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
    -[SBUILegibilityLabel _updateLegibilityView](self, "_updateLegibilityView");
  }

}

- (void)_updateLabelForLegibilitySettings
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[UILabel attributedText](self->_lookasideLabel, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "mutableCopy");

  v4 = objc_msgSend(v7, "length");
  -[SBUILegibilityLabel textColor](self, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CEA0A0];
  if (v5)
    objc_msgSend(v7, "addAttribute:value:range:", v6, v5, 0, v4);
  else
    objc_msgSend(v7, "removeAttribute:range:", v6, 0, v4);
  -[UILabel setAttributedText:](self->_lookasideLabel, "setAttributedText:", v7);

}

- (void)_updateLegibilityView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double Height;
  double v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double MinX;
  double MaxX;
  double v38;
  CGFloat v39;
  double MinY;
  double MaxY;
  double v42;
  void *v43;
  double v44;
  double v45;
  SBUILegibilityView *legibilityView;
  SBUILegibilityView *v47;
  SBUILegibilityView *v48;
  SBUILegibilityView *v49;
  void *v50;
  CGFloat rect;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _QWORD v64[13];
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  -[SBUILegibilityLabel _updateLabelForLegibilitySettings](self, "_updateLabelForLegibilitySettings");
  -[SBUILegibilityLabel bounds](self, "bounds");
  v53 = v4;
  v55 = v3;
  v61 = v5;
  v52 = v6;
  -[SBUILegibilityLabel traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");

  -[SBUILegibilityLabel characterOverflowInsets](self, "characterOverflowInsets");
  v57 = v8;
  v59 = v9;
  v62 = v11;
  v63 = v10;
  -[UILabel bounds](self->_lookasideLabel, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_lookasideLabel, "textRectForBounds:limitedToNumberOfLines:", -[UILabel numberOfLines](self->_lookasideLabel, "numberOfLines"), v12, v14, v16, v18);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v65.origin.x = v13;
  v65.origin.y = v15;
  v65.size.width = v17;
  v28 = v25;
  v65.size.height = v19;
  Height = CGRectGetHeight(v65);
  v66.origin.x = v21;
  v66.origin.y = v23;
  v66.size.width = v28;
  v66.size.height = v27;
  v30 = (Height - CGRectGetHeight(v66)) * 0.5;
  if (-[UILabel adjustsFontSizeToFitWidth](self->_lookasideLabel, "adjustsFontSizeToFitWidth"))
  {
    v31 = v61;
    v32 = v28;
    v33 = v53;
    v34 = v55;
    v35 = v52;
  }
  else
  {
    v67.origin.x = v21;
    v67.origin.y = v30;
    v67.size.width = v28;
    v67.size.height = v27;
    rect = v30;
    MinX = CGRectGetMinX(v67);
    v34 = v55;
    v68.origin.x = v55;
    v31 = v61;
    v68.origin.y = v61;
    v32 = v28;
    v35 = v52;
    v33 = v53;
    v68.size.width = v53;
    v68.size.height = v52;
    v63 = v63 + MinX - CGRectGetMinX(v68);
    v69.origin.x = v21;
    v69.origin.y = rect;
    v69.size.width = v32;
    v69.size.height = v27;
    MaxX = CGRectGetMaxX(v69);
    v70.origin.x = v55;
    v70.origin.y = v61;
    v70.size.width = v53;
    v70.size.height = v52;
    v38 = MaxX - CGRectGetMaxX(v70);
    v30 = rect;
    v62 = v62 - v38;
  }
  v71.origin.x = v21;
  v71.origin.y = v30;
  v71.size.width = v32;
  v71.size.height = v27;
  v54 = v27;
  v39 = v30;
  MinY = CGRectGetMinY(v71);
  v72.origin.x = v34;
  v72.origin.y = v31;
  v72.size.width = v33;
  v72.size.height = v35;
  v56 = v57 + MinY - CGRectGetMinY(v72);
  v73.origin.x = v21;
  v73.origin.y = v39;
  v73.size.width = v32;
  v73.size.height = v54;
  MaxY = CGRectGetMaxY(v73);
  v74.origin.x = v34;
  v74.origin.y = v31;
  v74.size.width = v33;
  v74.size.height = v35;
  v42 = v59 - (MaxY - CGRectGetMaxY(v74));
  v58 = v35 - (v56 + v42);
  v60 = v33 - (v63 + v62);
  BSSizeRoundForScale();
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __44__SBUILegibilityLabel__updateLegibilityView__block_invoke;
  v64[3] = &unk_1E4C40C58;
  *(double *)&v64[5] = v56;
  *(double *)&v64[6] = v63;
  *(double *)&v64[7] = v42;
  *(double *)&v64[8] = v62;
  v64[4] = self;
  *(double *)&v64[9] = v34;
  *(double *)&v64[10] = v61;
  *(double *)&v64[11] = v33;
  *(double *)&v64[12] = v35;
  objc_msgSend(MEMORY[0x1E0CEA638], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, 0, v64);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v34 + v63;
  v45 = v61 + v56;
  legibilityView = self->_legibilityView;
  if (legibilityView)
  {
    -[SBUILegibilityView setFrame:](legibilityView, "setFrame:", v44, v45, v60, v58);
  }
  else
  {
    v47 = -[SBUILegibilityView initWithFrame:]([SBUILegibilityView alloc], "initWithFrame:", v44, v45, v60, v58);
    v48 = self->_legibilityView;
    self->_legibilityView = v47;

    -[SBUILegibilityLabel addSubview:](self, "addSubview:", self->_legibilityView);
  }
  v49 = self->_legibilityView;
  -[SBUILegibilityLabel legibilitySettings](self, "legibilitySettings");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityView updateForChangedSettings:options:image:strength:](v49, "updateForChangedSettings:options:image:strength:", v50, -[SBUILegibilityLabel options](self, "options"), v43, self->_strength);

}

uint64_t __44__SBUILegibilityLabel__updateLegibilityView__block_invoke(uint64_t a1)
{
  CGContext *CurrentContext;
  CGAffineTransform v4;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, -*(double *)(a1 + 48), -*(double *)(a1 + 40));
  CGContextGetCTM(&v4, CurrentContext);
  CGContextSetBaseCTM();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "drawRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (BOOL)usesColorFilters
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)usesSecondaryColor
{
  return self->_options & 1;
}

- (id)drawingColor
{
  BOOL v3;
  _UILegibilitySettings *legibilitySettings;

  v3 = -[SBUILegibilityLabel usesSecondaryColor](self, "usesSecondaryColor");
  legibilitySettings = self->_legibilitySettings;
  if (v3)
    -[_UILegibilitySettings secondaryColor](legibilitySettings, "secondaryColor");
  else
    -[_UILegibilitySettings primaryColor](legibilitySettings, "primaryColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)shadowColor
{
  return (id)-[_UILegibilitySettings shadowColor](self->_legibilitySettings, "shadowColor");
}

- (SBUILegibilityEngine)legibilityEngine
{
  return -[SBUILegibilityView legibilityEngine](self->_legibilityView, "legibilityEngine");
}

- (void)setLegibilityEngine:(id)a3
{
  -[SBUILegibilityView setLegibilityEngine:](self->_legibilityView, "setLegibilityEngine:", a3);
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (NSString)string
{
  return self->_string;
}

- (UIFont)font
{
  return self->_font;
}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_textColorOverride, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_legibilityView, 0);
  objc_storeStrong((id *)&self->_lookasideLabel, 0);
}

@end
