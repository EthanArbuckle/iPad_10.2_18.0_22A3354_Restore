@implementation NCClickInteractionPresentedView

- (NCClickInteractionPresentedView)initWithTitle:(id)a3
{
  id v4;
  NCClickInteractionPresentedView *v5;
  NCClickInteractionPresentedView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NCClickInteractionPresentedView;
  v5 = -[NCClickInteractionPresentedView init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[NCClickInteractionPresentedView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[NCClickInteractionPresentedView _configureTitleLabel](v6, "_configureTitleLabel");
    -[NCClickInteractionPresentedView setTitle:](v6, "setTitle:", v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__darkerSystemColorsStatusDidChange_, *MEMORY[0x1E0DC4508], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel__reduceTransparencyStatusDidChange_, *MEMORY[0x1E0DC45B8], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4508], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);

  v5.receiver = self;
  v5.super_class = (Class)NCClickInteractionPresentedView;
  -[NCClickInteractionPresentedView dealloc](&v5, sel_dealloc);
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    self->_cachedSizeThatFits = (CGSize)*MEMORY[0x1E0C9D820];
    -[UILabel setText:](self->_titleLabel, "setText:", v6);
    -[NCClickInteractionPresentedView _updateTitleLabelAnchorPointAndPosition](self, "_updateTitleLabelAnchorPointAndPosition");
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGSize *p_cachedSizeThatFits;
  double width;
  double height;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  p_cachedSizeThatFits = &self->_cachedSizeThatFits;
  width = self->_cachedSizeThatFits.width;
  height = self->_cachedSizeThatFits.height;
  if (width == 0.0 && height == 0.0)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v7 = v6 + 48.0;
    v9 = v8 + 24.0;
    if (v9 < 60.0)
      v9 = 60.0;
    p_cachedSizeThatFits->width = v7;
    p_cachedSizeThatFits->height = v9;
    _NCMainScreenScale();
    UISizeRoundToScale();
    p_cachedSizeThatFits->width = width;
    p_cachedSizeThatFits->height = height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutSubviews
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
  double v14;
  CGFloat v15;
  CGFloat Height;
  UILabel *titleLabel;
  CGAffineTransform v18;
  CGAffineTransform v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)NCClickInteractionPresentedView;
  -[NCClickInteractionPresentedView layoutSubviews](&v20, sel_layoutSubviews);
  -[NCClickInteractionPresentedView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NCClickInteractionPresentedView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v12 = v11;
  v14 = v13;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v15 = CGRectGetWidth(v21) / v12;
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  Height = CGRectGetHeight(v22);
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, v15, Height / v14);
  titleLabel = self->_titleLabel;
  v18 = v19;
  -[UILabel setTransform:](titleLabel, "setTransform:", &v18);
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  if (a3 == 1)
    return self->_visualStylingProvider;
  else
    return 0;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E8D5FE50;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v7;
  MTVisualStylingProvider *visualStylingProvider;
  MTVisualStylingProvider *v9;

  v7 = (MTVisualStylingProvider *)a3;
  if (a4 == 1)
  {
    visualStylingProvider = self->_visualStylingProvider;
    if (visualStylingProvider != v7)
    {
      v9 = v7;
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", self->_titleLabel);
      objc_storeStrong((id *)&self->_visualStylingProvider, a3);
      -[NCClickInteractionPresentedView _updateTitleLabelVisualStyling](self, "_updateTitleLabelVisualStyling");
      v7 = v9;
    }
  }

}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[NCClickInteractionPresentedView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
  }
}

- (NSString)preferredContentSizeCategory
{
  NSString **p_preferredContentSizeCategory;
  NSString *preferredContentSizeCategory;

  p_preferredContentSizeCategory = &self->_preferredContentSizeCategory;
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E0DC4938]);
    preferredContentSizeCategory = *p_preferredContentSizeCategory;
  }
  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCClickInteractionPresentedView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[NCClickInteractionPresentedView setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", v4);
    self->_cachedSizeThatFits = (CGSize)*MEMORY[0x1E0C9D820];
    -[NCClickInteractionPresentedView _updateTitleLabelTextAttributes](self, "_updateTitleLabelTextAttributes");
  }

  return v6 ^ 1;
}

- (void)_updateTitleLabelVisualStyling
{
  void *v3;

  -[NCClickInteractionPresentedView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UILabel mt_removeAllVisualStyling](self->_titleLabel, "mt_removeAllVisualStyling");
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self->_titleLabel, 1);
  }
}

- (void)_updateTitleLabelTextAttributes
{
  NSString *preferredContentSizeCategory;
  uint64_t v4;
  UILabel *v5;
  void *v6;
  UILabel *titleLabel;
  void *v8;
  uint64_t v9;
  void *v10;

  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (preferredContentSizeCategory
    && (v4 = *MEMORY[0x1E0DC4900],
        UIContentSizeCategoryCompareToCategory(preferredContentSizeCategory, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]) != NSOrderedDescending))
  {
    titleLabel = self->_titleLabel;
    v8 = (void *)MEMORY[0x1E0DC1350];
    v9 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredFontForTextStyle:compatibleWithTraitCollection:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](titleLabel, "setFont:", v10);

  }
  else
  {
    v5 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5, "setFont:", v6);
  }

  -[NCClickInteractionPresentedView _updateTitleLabelAnchorPointAndPosition](self, "_updateTitleLabelAnchorPointAndPosition");
  -[NCClickInteractionPresentedView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTitleLabelAnchorPointAndPosition
{
  UILabel *titleLabel;
  __int128 v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MinX;
  double MinY;
  UILabel *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGRect v23;
  CGRect v24;

  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel transform](titleLabel, "transform");
    titleLabel = self->_titleLabel;
  }
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v17 = *MEMORY[0x1E0C9BAA8];
  v18 = v4;
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UILabel setTransform:](titleLabel, "setTransform:", &v17);
  -[UILabel layer](self->_titleLabel, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(v5, "setPosition:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[NCClickInteractionPresentedView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  BSRectWithSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  v23.origin.x = v7;
  v23.origin.y = v9;
  v23.size.width = v11;
  v23.size.height = v13;
  MinX = CGRectGetMinX(v23);
  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  MinY = CGRectGetMinY(v24);
  objc_msgSend(v5, "setAnchorPoint:", 0.0, 0.0);
  objc_msgSend(v5, "setPosition:", MinX, MinY);
  v16 = self->_titleLabel;
  v17 = v20;
  v18 = v21;
  v19 = v22;
  -[UILabel setTransform:](v16, "setTransform:", &v17);
  -[NCClickInteractionPresentedView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_configureTitleLabel
{
  UILabel *v3;
  UILabel *titleLabel;
  double v5;

  if (!self->_titleLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
    LODWORD(v5) = 0.5;
    -[UILabel _setHyphenationFactor:](self->_titleLabel, "_setHyphenationFactor:", v5);
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    -[NCClickInteractionPresentedView _updateTitleLabelVisualStyling](self, "_updateTitleLabelVisualStyling");
    -[NCClickInteractionPresentedView _updateTitleLabelTextAttributes](self, "_updateTitleLabelTextAttributes");
    -[NCClickInteractionPresentedView addSubview:](self, "addSubview:", self->_titleLabel);
  }
}

- (void)_darkerSystemColorsStatusDidChange:(id)a3
{
  if (self->_titleLabel)
    -[NCClickInteractionPresentedView _updateTitleLabelVisualStyling](self, "_updateTitleLabelVisualStyling", a3);
}

- (void)_reduceTransparencyStatusDidChange:(id)a3
{
  if (self->_titleLabel)
    -[NCClickInteractionPresentedView _updateTitleLabelVisualStyling](self, "_updateTitleLabelVisualStyling", a3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
