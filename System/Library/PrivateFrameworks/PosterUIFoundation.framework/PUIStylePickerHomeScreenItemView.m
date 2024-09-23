@implementation PUIStylePickerHomeScreenItemView

+ (id)defaultFont
{
  if (defaultFont_onceToken != -1)
    dispatch_once(&defaultFont_onceToken, &__block_literal_global_18);
  return (id)defaultFont_defaultFont;
}

void __47__PUIStylePickerHomeScreenItemView_defaultFont__block_invoke()
{
  void *v0;
  const __CTFontDescriptor *v1;
  CTFontRef v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDC4D70];
  v5[0] = CFSTR(".SFUI-Medium");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithAttributesAndOptions();

  v2 = CTFontCreateWithFontDescriptor(v1, 14.0, 0);
  v3 = (void *)defaultFont_defaultFont;
  defaultFont_defaultFont = (uint64_t)v2;

}

- (PUIStylePickerHomeScreenItemView)initWithFrame:(CGRect)a3
{
  PUIStylePickerHomeScreenItemView *v3;
  PUIStylePickerHomeScreenItemView *v4;
  uint64_t v5;
  UILabel *label;
  _PUIStylePickerMicaAssetView *v7;
  _PUIStylePickerMicaAssetView *assetView;
  uint64_t v9;
  UIView *selectedBorderView;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double Width;
  double Height;
  BOOL v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  UITraitChangeRegistration *traitChangeRegistration;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  void *v49;
  void *v50;
  _QWORD v51[3];
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;

  v53 = *MEMORY[0x24BDAC8D0];
  v48.receiver = self;
  v48.super_class = (Class)PUIStylePickerHomeScreenItemView;
  v3 = -[PUIStylePickerHomeScreenItemView initWithFrame:](&v48, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUIStylePickerHomeScreenItemView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUIStylePickerHomeScreenItemView setAutoresizingMask:](v4, "setAutoresizingMask:", 0);
    v5 = objc_opt_new();
    label = v4->_label;
    v4->_label = (UILabel *)v5;

    v4->_iconSize = (CGSize)vdupq_n_s64(0x4050000000000000uLL);
    v7 = -[_PUIStylePickerMicaAssetView initWithFrame:]([_PUIStylePickerMicaAssetView alloc], "initWithFrame:", 0.0, 0.0, v4->_iconSize.width, v4->_iconSize.height);
    assetView = v4->_assetView;
    v4->_assetView = v7;

    v9 = objc_opt_new();
    selectedBorderView = v4->_selectedBorderView;
    v4->_selectedBorderView = (UIView *)v9;

    -[UIView setUserInteractionEnabled:](v4->_selectedBorderView, "setUserInteractionEnabled:", 0);
    -[UIView setAlpha:](v4->_selectedBorderView, "setAlpha:", 0.0);
    -[UIView layer](v4->_selectedBorderView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 3.0);

    -[UIView _setContinuousCornerRadius:](v4->_selectedBorderView, "_setContinuousCornerRadius:", 18.0);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v51[0] = v4->_label;
    v51[1] = v4->_assetView;
    v51[2] = v4->_selectedBorderView;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[PUIStylePickerHomeScreenItemView addSubview:](v4, "addSubview:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v14);
    }

    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_label, "setFont:", v18);
    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v4->_label, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom");

    if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v21 = 89.6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;

      v54.origin.x = v24;
      v54.origin.y = v26;
      v54.size.width = v28;
      v54.size.height = v30;
      Width = CGRectGetWidth(v54);
      v55.origin.x = v24;
      v55.origin.y = v26;
      v55.size.width = v28;
      v55.size.height = v30;
      Height = CGRectGetHeight(v55);
      if (Width < Height)
        Height = Width;
      v33 = Height < 375.0;
      v21 = 80.0;
      if (v33)
        v21 = 73.6;
    }
    -[UILabel setPreferredMaxLayoutWidth:](v4->_label, "setPreferredMaxLayoutWidth:", v21);
    -[PUIStylePickerHomeScreenItemView _updateColorsForTraitCollectionAnimated:](v4, "_updateColorsForTraitCollectionAnimated:", 0);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A08]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v34, "setValue:forKey:", objc_msgSend(v35, "CGColor"), CFSTR("inputColor"));

    objc_msgSend(v34, "setName:", CFSTR("selectionFilter"));
    objc_msgSend(v34, "setValue:forKey:", &unk_25156AF90, CFSTR("inputAmount"));
    -[_PUIStylePickerMicaAssetView layer](v4->_assetView, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFilters:", v37);

    -[_PUIStylePickerMicaAssetView layer](v4->_assetView, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAllowsGroupOpacity:", 0);

    objc_opt_self();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v39;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerHomeScreenItemView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v40, sel__userInterfaceStyleDidUpdate_);
    v41 = objc_claimAutoreleasedReturnValue();
    traitChangeRegistration = v4->_traitChangeRegistration;
    v4->_traitChangeRegistration = (UITraitChangeRegistration *)v41;

  }
  return v4;
}

- (void)_userInterfaceStyleDidUpdate:(id)a3
{
  -[PUIStylePickerHomeScreenItemView _updateColorsForTraitCollectionAnimated:](self, "_updateColorsForTraitCollectionAnimated:", 1);
}

- (void)_updateColorsForTraitCollectionAnimated:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL selected;
  UILabel *v17;
  UIView *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  UILabel *v23;
  UIView *v24;
  void *v25;
  _BOOL4 v26;
  _QWORD v27[4];
  UIView *v28;
  id v29;
  id v30;
  UILabel *v31;
  id v32;
  id v33;
  BOOL v34;

  v26 = a3;
  -[PUIStylePickerHomeScreenItemView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.08);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorWithAlphaComponent:", 0.08);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v15;
    v9 = (void *)v14;
    v8 = (void *)v13;
    v7 = (void *)v12;
  }
  selected = self->_selected;
  v17 = self->_label;
  v18 = self->_selectedBorderView;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __76__PUIStylePickerHomeScreenItemView__updateColorsForTraitCollectionAnimated___block_invoke;
  v27[3] = &unk_25154C568;
  v28 = v18;
  v19 = v7;
  v29 = v19;
  v20 = v10;
  v30 = v20;
  v31 = v17;
  v34 = selected;
  v21 = v8;
  v32 = v21;
  v22 = v9;
  v33 = v22;
  v23 = v17;
  v24 = v18;
  v25 = (void *)MEMORY[0x2495151FC](v27);
  if (v26)
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v25, 0, 0.3, 0.0);
  else
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v25);

}

uint64_t __76__PUIStylePickerHomeScreenItemView__updateColorsForTraitCollectionAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGColor"));

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompositingFilter:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 56), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", *(_QWORD *)(a1 + 48));

  v5 = *(void **)(a1 + 56);
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(v5, "setAlpha:", 0.65);
    v6 = (_QWORD *)(a1 + 64);
    v7 = 1.0;
  }
  else
  {
    objc_msgSend(v5, "setAlpha:", 0.4);
    v6 = (_QWORD *)(a1 + 72);
    v7 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 56), "setTextColor:", *v6);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v7);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUIStylePickerHomeScreenItemView;
  -[PUIStylePickerHomeScreenItemView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
  {
    -[PUIStylePickerHomeScreenItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PUIStylePickerHomeScreenItemView _updateLayoutConstraints](self, "_updateLayoutConstraints");
  }
}

- (void)setSelected:(BOOL)a3
{
  -[PUIStylePickerHomeScreenItemView setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setIconSize:(CGSize)a3
{
  if (self->_iconSize.width != a3.width || self->_iconSize.height != a3.height)
  {
    self->_iconSize = a3;
    -[_PUIStylePickerMicaAssetView setIconSize:](self->_assetView, "setIconSize:");
    -[PUIStylePickerHomeScreenItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PUIStylePickerHomeScreenItemView _updateLayoutConstraints](self, "_updateLayoutConstraints");
  }
}

- (void)setIconContinousCornerRadius:(double)a3
{
  if (self->_iconContinuousCornerRadius != a3)
  {
    self->_iconContinuousCornerRadius = a3;
    -[_PUIStylePickerMicaAssetView _setContinuousCornerRadius:](self->_assetView, "_setContinuousCornerRadius:");
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[PUIStylePickerHomeScreenItemView _updateColorsForTraitCollectionAnimated:](self, "_updateColorsForTraitCollectionAnimated:", a4);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  -[PUIStylePickerHomeScreenItemView setHighlighted:animated:](self, "setHighlighted:animated:", a3, 1);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  objc_super v7;

  if (self->_highlighted != a3)
  {
    v4 = a4;
    v5 = a3;
    v7.receiver = self;
    v7.super_class = (Class)PUIStylePickerHomeScreenItemView;
    -[PUIStylePickerHomeScreenItemView setHighlighted:](&v7, sel_setHighlighted_);
    self->_highlighted = v5;
    -[PUIStylePickerHomeScreenItemView _updateHighlightState:](self, "_updateHighlightState:", v4 & ~v5);
  }
}

- (void)_updateHighlightState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[_PUIStylePickerMicaAssetView layer](self->_assetView, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_highlighted)
    v5 = &unk_25156AFA0;
  else
    v5 = &unk_25156AF90;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("filters.selectionFilter.inputAmount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKeyPath:", CFSTR("filters.selectionFilter.inputAmount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFromValue:", v7);

    objc_msgSend(v6, "setToValue:", v5);
    objc_msgSend(v6, "setDuration:", 0.3);
    objc_msgSend(v8, "addAnimation:forKey:", v6, CFSTR("filters.selectionFilter.inputAmount"));

  }
  objc_msgSend(v8, "setValue:forKeyPath:", v5, CFSTR("filters.selectionFilter.inputAmount"));

}

+ (CGSize)defaultSizeForIconSize:(CGSize)a3
{
  double height;
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  v7 = height + v6 + 7.0;

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[PUIStylePickerHomeScreenItemView iconSize](self, "iconSize");
  objc_msgSend((id)objc_opt_class(), "defaultSizeForIconSize:", v2, v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PUIStylePickerHomeScreenItemView iconSize](self, "iconSize", a3.width, a3.height);
  objc_msgSend((id)objc_opt_class(), "defaultSizeForIconSize:", v5, v6);
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_updateLayoutConstraints
{
  NSArray *knownConstraints;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _PUIStylePickerMicaAssetView *v14;
  UILabel *v15;
  UIView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSArray *v43;
  NSArray *v44;
  void *v45;
  _QWORD v46[3];
  _QWORD v47[4];

  v47[3] = *MEMORY[0x24BDAC8D0];
  if (self->_knownConstraints)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:");
    knownConstraints = self->_knownConstraints;
    self->_knownConstraints = 0;

  }
  -[PUIStylePickerHomeScreenItemView iconSize](self, "iconSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "defaultSizeForIconSize:", v4, v6);
  v9 = v8;
  v10 = (void *)objc_opt_new();
  v47[0] = &unk_25156AFB0;
  v46[0] = CFSTR("interitemSpacing");
  v46[1] = CFSTR("minAssetViewWidth");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v11;
  v46[2] = CFSTR("minAssetViewHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = self->_assetView;
  v15 = self->_label;
  v16 = self->_selectedBorderView;
  _NSDictionaryOfVariableBindings(CFSTR("assetView, label"), v14, v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[assetView]-interitemSpacing-[label]|"), 512, v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v18);

  v45 = (void *)v13;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[assetView]|"), 512, v13, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v19);

  -[UILabel widthAnchor](v15, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintGreaterThanOrEqualToConstant:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v21);

  -[UILabel centerXAnchor](v15, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerHomeScreenItemView centerXAnchor](self, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v24);

  -[_PUIStylePickerMicaAssetView heightAnchor](v14, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToConstant:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v26);

  -[_PUIStylePickerMicaAssetView widthAnchor](v14, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToConstant:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v28);

  -[PUIStylePickerHomeScreenItemView heightAnchor](self, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintGreaterThanOrEqualToConstant:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v30);

  -[PUIStylePickerHomeScreenItemView widthAnchor](self, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintGreaterThanOrEqualToConstant:", v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v32);

  -[UIView heightAnchor](v16, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintGreaterThanOrEqualToConstant:", v7 + 10.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v34);

  -[UIView widthAnchor](v16, "widthAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintGreaterThanOrEqualToConstant:", v5 + 10.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v36);

  -[UIView centerXAnchor](v16, "centerXAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUIStylePickerMicaAssetView centerXAnchor](v14, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v39);

  -[UIView centerYAnchor](v16, "centerYAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUIStylePickerMicaAssetView centerYAnchor](v14, "centerYAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v42);

  if (!-[NSArray isEqualToArray:](self->_knownConstraints, "isEqualToArray:", v10))
  {
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v10);
    -[PUIStylePickerHomeScreenItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v43 = (NSArray *)objc_msgSend(v10, "copy");
    v44 = self->_knownConstraints;
    self->_knownConstraints = v43;

  }
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (PUIStylePickerMicaAssetControlling)assetView
{
  return (PUIStylePickerMicaAssetControlling *)self->_assetView;
}

- (double)iconContinuousCornerRadius
{
  return self->_iconContinuousCornerRadius;
}

- (void)setIconContinuousCornerRadius:(double)a3
{
  self->_iconContinuousCornerRadius = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_selectedBorderView, 0);
  objc_storeStrong((id *)&self->_labelAssetViewMarginConstraint, 0);
  objc_storeStrong((id *)&self->_knownConstraints, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
}

@end
