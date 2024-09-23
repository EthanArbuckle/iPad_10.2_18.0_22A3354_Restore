@implementation SBFLockScreenDateSubtitleView

- (void)setString:(id)a3
{
  -[SBUILegibilityLabel setString:](self->_label, "setString:", a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView sizeThatFits:](self->_accessoryView, "sizeThatFits:");
  v7 = v6;
  -[SBUILegibilityLabel sizeThatFits:](self->_label, "sizeThatFits:", width, height);
  v9 = fmax(v7, v8);
  -[SBFLockScreenDateSubtitleView interItemSpacing](self, "interItemSpacing");
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  v12 = v11;

  v13 = v12;
  v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)interItemSpacing
{
  double v2;
  void *v3;

  if (!self->_accessoryView)
    return 0.0;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      return 12.0;
    else
      return 9.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
      v2 = 12.0;
    else
      v2 = 9.0;

  }
  return v2;
}

- (SBFLockScreenDateSubtitleView)init
{
  return -[SBFLockScreenDateSubtitleView initWithString:accessoryView:](self, "initWithString:accessoryView:", 0, 0);
}

- (SBFLockScreenDateSubtitleView)initWithString:(id)a3 accessoryView:(id)a4
{
  id v6;
  id v7;
  SBFLockScreenDateSubtitleView *v8;
  uint64_t v9;
  _UILegibilitySettings *legibilitySettings;
  void *v11;
  objc_class *v12;
  id v13;
  _UILegibilitySettings *v14;
  double v15;
  void *v16;
  uint64_t v17;
  SBUILegibilityLabel *label;
  SBUILegibilityLabel *v19;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SBFLockScreenDateSubtitleView;
  v8 = -[SBFLockScreenDateSubtitleView init](&v23, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEADE8]), "initWithStyle:", 1);
    legibilitySettings = v8->_legibilitySettings;
    v8->_legibilitySettings = (_UILegibilitySettings *)v9;

    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v11 = (void *)getSBUILegibilityLabelClass_softClass_0;
    v28 = getSBUILegibilityLabelClass_softClass_0;
    if (!getSBUILegibilityLabelClass_softClass_0)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __getSBUILegibilityLabelClass_block_invoke_0;
      v24[3] = &unk_1E200E038;
      v24[4] = &v25;
      __getSBUILegibilityLabelClass_block_invoke_0((uint64_t)v24);
      v11 = (void *)v26[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v25, 8);
    v13 = [v12 alloc];
    v14 = v8->_legibilitySettings;
    v15 = *MEMORY[0x1E0CEC0C8];
    +[SBFLockScreenDateSubtitleView labelFont](SBFLockScreenDateSubtitleView, "labelFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "initWithSettings:strength:string:font:", v14, v6, v16, v15);
    label = v8->_label;
    v8->_label = (SBUILegibilityLabel *)v17;

    v19 = v8->_label;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUILegibilityLabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[SBUILegibilityLabel setAdjustsFontSizeToFitWidth:](v8->_label, "setAdjustsFontSizeToFitWidth:", 1);
    -[SBUILegibilityLabel setMinimumScaleFactor:](v8->_label, "setMinimumScaleFactor:", 0.25);
    -[SBFLockScreenDateSubtitleView addSubview:](v8, "addSubview:", v8->_label);
    -[SBFLockScreenDateSubtitleView setAccessoryView:](v8, "setAccessoryView:", v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v8, sel__updateForCurrentSizeCategory, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateSubtitleView;
  -[SBFLockScreenDateSubtitleView dealloc](&v4, sel_dealloc);
}

- (NSString)string
{
  return (NSString *)-[SBUILegibilityLabel string](self->_label, "string");
}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView *accessoryView;
  UIView *v7;

  v5 = (UIView *)a3;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    v7 = v5;
    if (accessoryView)
      -[UIView removeFromSuperview](accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    if (v7)
      -[SBFLockScreenDateSubtitleView addSubview:](self, "addSubview:", self->_accessoryView);
    -[SBFLockScreenDateSubtitleView layoutIfNeeded](self, "layoutIfNeeded");
    v5 = v7;
  }

}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  id v6;

  p_legibilitySettings = &self->_legibilitySettings;
  v6 = a3;
  if (!-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](*p_legibilitySettings, "sb_isEqualToLegibilitySettings:"))
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBUILegibilityLabel setLegibilitySettings:](self->_label, "setLegibilitySettings:", *p_legibilitySettings);
  }

}

- (void)setStrength:(double)a3
{
  if (self->_strength != a3)
  {
    self->_strength = a3;
    -[SBUILegibilityLabel setStrength:](self->_label, "setStrength:");
  }
}

- (UIFont)font
{
  return (UIFont *)-[SBUILegibilityLabel font](self->_label, "font");
}

- (void)setFont:(id)a3
{
  -[SBUILegibilityLabel setFont:](self->_label, "setFont:", a3);
}

- (void)_updateForCurrentSizeCategory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBFLockScreenDateSubtitleView__updateForCurrentSizeCategory__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __62__SBFLockScreenDateSubtitleView__updateForCurrentSizeCategory__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "labelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)layoutSubviews
{
  UIView *accessoryView;
  SBUILegibilityLabel *label;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFLockScreenDateSubtitleView;
  -[SBFLockScreenDateSubtitleView layoutSubviews](&v5, sel_layoutSubviews);
  -[UIView sizeToFit](self->_accessoryView, "sizeToFit");
  accessoryView = self->_accessoryView;
  -[SBFLockScreenDateSubtitleView accessoryViewFrame](self, "accessoryViewFrame");
  -[UIView setFrame:](accessoryView, "setFrame:");
  -[SBUILegibilityLabel sizeToFit](self->_label, "sizeToFit");
  label = self->_label;
  -[SBFLockScreenDateSubtitleView subtitleLabelFrame](self, "subtitleLabelFrame");
  -[SBUILegibilityLabel setFrame:](label, "setFrame:");
}

- (CGRect)accessoryViewFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MaxX;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  -[SBFLockScreenDateSubtitleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView frame](self->_accessoryView, "frame");
  UIRectCenteredYInRectScale();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection", 0) == 1)
  {
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    MaxX = CGRectGetMaxX(v24);
    v25.origin.x = v12;
    v25.origin.y = v14;
    v25.size.width = v16;
    v25.size.height = v18;
    v12 = MaxX - CGRectGetWidth(v25);
  }
  v20 = v12;
  v21 = v14;
  v22 = v16;
  v23 = v18;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)subtitleLabelFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MinX;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat rect;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  -[SBFLockScreenDateSubtitleView bounds](self, "bounds");
  -[SBUILegibilityLabel bounds](self->_label, "bounds");
  -[SBFLockScreenDateSubtitleView accessoryViewFrame](self, "accessoryViewFrame");
  v24 = v4;
  v25 = v3;
  v26 = v5;
  rect = v6;
  UIRectCenteredYInRectScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection", 0) == 1)
  {
    v27.origin.y = v24;
    v27.origin.x = v25;
    v27.size.width = v26;
    v27.size.height = rect;
    MinX = CGRectGetMinX(v27);
    -[SBFLockScreenDateSubtitleView interItemSpacing](self, "interItemSpacing");
    v17 = MinX - v16;
    v28.origin.x = v8;
    v28.origin.y = v10;
    v28.size.width = v12;
    v28.size.height = v14;
    v18 = v17 - CGRectGetWidth(v28);
  }
  else
  {
    -[SBFLockScreenDateSubtitleView interItemSpacing](self, "interItemSpacing");
    v18 = v26 + v19;
  }
  v20 = v10;
  v21 = v12;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v18;
  return result;
}

- (UIEdgeInsets)subtitleLabelCharacterOverflowInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[SBUILegibilityLabel characterOverflowInsets](self->_label, "characterOverflowInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (id)labelFont
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  _QWORD *v18;
  int v19;
  double v20;
  uint64_t v21;
  void *v22;

  if (labelFont_onceToken != -1)
    dispatch_once(&labelFont_onceToken, &__block_literal_global_32);
  if (labelFont_timeSubtitleFont)
    return (id)labelFont_timeSubtitleFont;
  v3 = 0x1E0CEA000uLL;
  v4 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 22.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v8 = 23.0;
  else
    v8 = 22.0;
  objc_msgSend(v4, "systemFontOfSize:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)labelFont_timeSubtitleFont;
  labelFont_timeSubtitleFont = v9;

  v11 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 23.0;
  v14 = __sb__runningInSpringBoard();
  if ((_DWORD)v14)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "userInterfaceIdiom"))
    {
      v15 = 0;
      v16 = 0;
      v17 = 1;
      goto LABEL_26;
    }
  }
  v17 = v14 ^ 1;
  v3 = __sb__runningInSpringBoard();
  if ((_DWORD)v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v15 = 0;
      v16 = 0;
      v18 = (_QWORD *)MEMORY[0x1E0CEB3D0];
      goto LABEL_27;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v14 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v14, "userInterfaceIdiom"))
    {
      v16 = 0;
      v18 = (_QWORD *)MEMORY[0x1E0CEB3D0];
      v15 = 1;
      goto LABEL_27;
    }
  }
  v15 = v3 ^ 1;
  v19 = __sb__runningInSpringBoard();
  if (v19)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v3, "_referenceBounds");
  }
  v16 = v19 ^ 1;
  BSSizeRoundForScale();
  if (v20 < *(double *)(MEMORY[0x1E0DAB260] + 40))
  {
    v18 = (_QWORD *)MEMORY[0x1E0CEB3D0];
    goto LABEL_27;
  }
LABEL_26:
  v18 = (_QWORD *)MEMORY[0x1E0CEB3C8];
LABEL_27:
  objc_msgSend(a1, "scaledFontSize:withMaximumFontSizeCategory:", *v18, v7);
  objc_msgSend(v11, "systemFontOfSize:");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)labelFont_timeSubtitleFont;
  labelFont_timeSubtitleFont = v21;

  if (v16)
  {

    if (!v15)
      goto LABEL_29;
LABEL_33:

    if (!v17)
      return (id)labelFont_timeSubtitleFont;
    goto LABEL_30;
  }
  if (v15)
    goto LABEL_33;
LABEL_29:
  if (v17)
LABEL_30:

  return (id)labelFont_timeSubtitleFont;
}

void __42__SBFLockScreenDateSubtitleView_labelFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEB3F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_14);

}

void __42__SBFLockScreenDateSubtitleView_labelFont__block_invoke_2()
{
  void *v0;

  v0 = (void *)labelFont_timeSubtitleFont;
  labelFont_timeSubtitleFont = 0;

}

+ ($01BB1521EC52D44A8E7628F5261DCEC8)labelFontMetrics
{
  double v3;
  void *v4;
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
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  if (labelFontMetrics_onceToken != -1)
    dispatch_once(&labelFontMetrics_onceToken, &__block_literal_global_16_2);
  v3 = *(double *)&labelFontMetrics_labelFontMetrics;
  if (*(double *)&labelFontMetrics_labelFontMetrics == 0.0)
  {
    objc_msgSend(a1, "labelFont", *(double *)&labelFontMetrics_labelFontMetrics);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ascender");
    v6 = v5;
    objc_msgSend(v4, "descender");
    v8 = v7;
    objc_msgSend(v4, "_bodyLeading");
    v10 = v9;
    objc_msgSend(v4, "capHeight");
    *(_QWORD *)&labelFontMetrics_labelFontMetrics = v6;
    *((_QWORD *)&labelFontMetrics_labelFontMetrics + 1) = v8;
    qword_1ECEEFB50 = v10;
    qword_1ECEEFB58 = v11;

    v3 = *(double *)&labelFontMetrics_labelFontMetrics;
  }
  v12 = *((double *)&labelFontMetrics_labelFontMetrics + 1);
  v13 = *(double *)&qword_1ECEEFB50;
  v14 = *(double *)&qword_1ECEEFB58;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v3;
  return result;
}

void __49__SBFLockScreenDateSubtitleView_labelFontMetrics__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  labelFontMetrics_labelFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1ECEEFB50 = unk_18AC17988;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEB3F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_17_2);

}

double __49__SBFLockScreenDateSubtitleView_labelFontMetrics__block_invoke_2()
{
  double result;

  result = *(double *)&SBFFontMetricsZero;
  labelFontMetrics_labelFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1ECEEFB50 = unk_18AC17988;
  return result;
}

+ (double)scaledFontSize:(double)a3 withMaximumFontSizeCategory:(id)a4
{
  NSString *v5;
  NSString *v6;
  NSComparisonResult v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v5 = (NSString *)a4;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIContentSizeCategoryCompareToCategory(v6, v5);

  v8 = (void *)MEMORY[0x1E0CEA5E8];
  v9 = *MEMORY[0x1E0CEB538];
  if (v7 == NSOrderedAscending)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredFontForTextStyle:compatibleWithTraitCollection:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "_scaledValueForValue:", a3);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  v14 = v13;

  return v14;
}

- (double)baselineOffsetFromOrigin
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MaxY;
  double v21;
  CGRect v23;

  -[SBUILegibilityLabel frame](self->_label, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBFLockScreenDateSubtitleView superview](self, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateSubtitleView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v23.origin.x = v13;
  v23.origin.y = v15;
  v23.size.width = v17;
  v23.size.height = v19;
  MaxY = CGRectGetMaxY(v23);
  -[SBUILegibilityLabel firstBaselineOffsetFromBottom](self->_label, "firstBaselineOffsetFromBottom");
  return MaxY - v21;
}

- (double)baselineOffsetFromBottom
{
  double result;

  -[SBUILegibilityLabel firstBaselineOffsetFromBottom](self->_label, "firstBaselineOffsetFromBottom");
  return result;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)strength
{
  return self->_strength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
