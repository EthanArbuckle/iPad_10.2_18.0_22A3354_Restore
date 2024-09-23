@implementation PKCollapsibleHeaderView

- (PKCollapsibleHeaderView)initWithFrame:(CGRect)a3
{
  char *v3;
  PKCollapsibleHeaderView *v4;
  __int128 v5;
  PKTrailingAccessoryLabel *v6;
  PKTrailingAccessoryLabel *titleLabel;
  UILabel *v8;
  UILabel *subtitleLabel;
  UISearchBar *v10;
  UISearchBar *searchBar;
  uint64_t v12;
  UIActivityIndicatorView *activityIndicator;
  LAUICheckmarkLayer *v14;
  LAUICheckmarkLayer *checkmarkLayer;
  LAUICheckmarkLayer *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKCollapsibleHeaderView;
  v3 = -[PKCollapsibleHeaderView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (PKCollapsibleHeaderView *)v3;
  if (v3)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)(v3 + 552) = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)(v3 + 568) = v5;
    v6 = objc_alloc_init(PKTrailingAccessoryLabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    -[PKTrailingAccessoryLabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[PKCollapsibleHeaderView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v8;

    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_subtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    -[PKCollapsibleHeaderView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
    -[PKCollapsibleHeaderView _setLabelFonts](v4, "_setLabelFonts");
    v10 = (UISearchBar *)objc_alloc_init(MEMORY[0x1E0DC3C38]);
    searchBar = v4->_searchBar;
    v4->_searchBar = v10;

    -[UISearchBar setAutocorrectionType:](v4->_searchBar, "setAutocorrectionType:", 1);
    -[UISearchBar setDelegate:](v4->_searchBar, "setDelegate:", v4);
    -[UISearchBar setReturnKeyType:](v4->_searchBar, "setReturnKeyType:", 6);
    -[UISearchBar setEnablesReturnKeyAutomatically:](v4->_searchBar, "setEnablesReturnKeyAutomatically:", 1);
    -[UISearchBar setSearchBarStyle:](v4->_searchBar, "setSearchBarStyle:", 2);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v4->_activityIndicator;
    v4->_activityIndicator = (UIActivityIndicatorView *)v12;

    -[UIActivityIndicatorView setHidesWhenStopped:](v4->_activityIndicator, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView sizeToFit](v4->_activityIndicator, "sizeToFit");
    -[UIActivityIndicatorView setHidden:](v4->_activityIndicator, "setHidden:", 1);
    v14 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E0D44440]);
    checkmarkLayer = v4->_checkmarkLayer;
    v4->_checkmarkLayer = v14;

    -[LAUICheckmarkLayer setLineWidthScale:](v4->_checkmarkLayer, "setLineWidthScale:", 1.4);
    -[LAUICheckmarkLayer setRevealed:animated:](v4->_checkmarkLayer, "setRevealed:animated:", 0, 0);
    v16 = v4->_checkmarkLayer;
    PKLayerNullActions();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAUICheckmarkLayer setActions:](v16, "setActions:", v17);

    -[PKCollapsibleHeaderView _updateCheckmarkColor](v4, "_updateCheckmarkColor");
    -[PKCollapsibleHeaderView setTitleAccessoriesEnabled:](v4, "setTitleAccessoriesEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

    -[PKCollapsibleHeaderView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UISearchBar *searchBar;
  void *v9;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UISearchBar frame](self->_searchBar, "frame");
  v11.x = x;
  v11.y = y;
  if (CGRectContainsPoint(v12, v11))
  {
    searchBar = self->_searchBar;
    -[PKCollapsibleHeaderView convertPoint:toView:](self, "convertPoint:toView:", searchBar, x, y);
    -[UISearchBar hitTest:withEvent:](searchBar, "hitTest:withEvent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCollapsibleHeaderView;
  -[PKCollapsibleHeaderView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKCollapsibleHeaderView _updateCheckmarkColor](self, "_updateCheckmarkColor");
}

- (void)_updateCheckmarkColor
{
  void *v3;
  _QWORD v4[5];

  -[PKCollapsibleHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PKCollapsibleHeaderView__updateCheckmarkColor__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __48__PKCollapsibleHeaderView__updateCheckmarkColor__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[57];
  objc_msgSend(v1, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setColor:animated:", objc_msgSend(v3, "CGColor"), 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[PKCollapsibleHeaderView heightBoundsForWidth:](self, "heightBoundsForWidth:", a3.width, a3.height, 0, 0, 0, 0);
  v4 = 0.0;
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCollapsibleHeaderView;
  -[PKCollapsibleHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKCollapsibleHeaderView bounds](self, "bounds");
  -[PKCollapsibleHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- ($3CC2805F0189FCCE51047C0D2B5A52A9)_layoutWithBounds:(SEL)a3 isTemplateLayout:(CGRect)a4
{
  _BOOL4 v5;
  double height;
  double width;
  double x;
  UIEdgeInsets *p_readableContentInsets;
  double left;
  double right;
  CGFloat MaxY;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  $3CC2805F0189FCCE51047C0D2B5A52A9 *result;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGRect v54;
  CGRect v55;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  p_readableContentInsets = &self->_readableContentInsets;
  left = self->_readableContentInsets.left;
  right = self->_readableContentInsets.right;
  MaxY = 0.0;
  if (!a5)
  {
    -[PKCollapsibleHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, a4.size.width, 1.79769313e308);
    a4.origin.x = v53;
    MaxY = height - v53;
  }
  v51 = right;
  v52 = height;
  v15 = width - (left + right);
  if (self->_topArtView)
  {
    v50 = x;
    v16 = left;
    -[PKCollapsibleHeaderView _topArtTopPadding](self, "_topArtTopPadding", a4.origin.x, a4.origin.y);
    v18 = v17;
    v20 = self->_imageSize.width;
    v19 = self->_imageSize.height;
    if (v20 == *MEMORY[0x1E0C9D820] && v19 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[UIView sizeThatFits:](self->_topArtView, "sizeThatFits:", v15, 1.79769313e308);
      v20 = v22;
      v19 = v23;
    }
    v24 = MaxY + v18;
    PKFloatRoundToPixel();
    v26 = v25;
    if (!v5)
      -[UIView setFrame:](self->_topArtView, "setFrame:", v25, v24, v20, v19);
    v27 = fmin(v24, 0.0);
    v54.origin.x = v26;
    v54.origin.y = v24;
    v54.size.width = v20;
    v54.size.height = v19;
    MaxY = CGRectGetMaxY(v54);
    left = v16;
    x = v50;
  }
  else
  {
    v27 = 0.0;
  }
  if (self->_titleText || self->_showSpinner || self->_showCheckmark)
  {
    -[PKCollapsibleHeaderView _titleTopPadding](self, "_titleTopPadding");
    v29 = MaxY + v28;
    -[PKTrailingAccessoryLabel setContentInsets:](self->_titleLabel, "setContentInsets:", p_readableContentInsets->top, p_readableContentInsets->left, p_readableContentInsets->bottom, p_readableContentInsets->right);
    -[PKTrailingAccessoryLabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, 1.79769313e308);
    v32 = v31;
    if (!v5)
      -[PKTrailingAccessoryLabel setFrame:](self->_titleLabel, "setFrame:", x, v29, v30, v31);
    v27 = fmin(v27, v29);
    MaxY = v29 + v32;
  }
  else
  {
    -[PKTrailingAccessoryLabel setContentInsets:](self->_titleLabel, "setContentInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    if (!v5)
      -[PKTrailingAccessoryLabel setFrame:](self->_titleLabel, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  -[UILabel text](self->_subtitleLabel, "text");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length");

  if (v34)
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v15, 1.79769313e308);
    v37 = v36;
    v39 = v38;
    PKFloatRoundToPixel();
    v41 = v40;
    if (!v5)
      -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v40, MaxY + 15.0, v37, v39);
    v27 = fmin(v27, MaxY + 15.0);
    v55.origin.x = v41;
    v55.origin.y = MaxY + 15.0;
    v55.size.width = v37;
    v55.size.height = v39;
    v42 = CGRectGetMaxY(v55);
    v43 = 10.0;
    if (!self->_showSearchBar)
      v43 = 15.0;
    v44 = v42 + v43;
    if (self->_showSearchBar)
      goto LABEL_26;
LABEL_35:
    v48 = 0.0;
    goto LABEL_36;
  }
  if (self->_showSearchBar)
    v44 = MaxY;
  else
    v44 = MaxY + 15.0;
  if (!self->_showSearchBar)
    goto LABEL_35;
LABEL_26:
  v45 = v44;
  if (!v5)
    v45 = fmax(v44, self->_additionalCollapsibleHeight);
  result = ($3CC2805F0189FCCE51047C0D2B5A52A9 *)-[UISearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", width, v52);
  v47 = v46;
  if (!v5)
  {
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", 0.0, v45, width, v46);
    result = ($3CC2805F0189FCCE51047C0D2B5A52A9 *)-[UISearchBar setContentInset:](self->_searchBar, "setContentInset:", 0.0, left, 0.0, v51);
  }
  v27 = fmin(v27, v44);
  v44 = v44 + v47 + 10.0;
  v48 = fmax(v47 + 10.0 - self->_additionalCollapsibleHeight, 0.0);
LABEL_36:
  v49 = v44 + self->_additionalBottomPadding;
  retstr->var0 = v48;
  retstr->var1 = v27;
  retstr->var2 = MaxY;
  retstr->var3 = v49 - MaxY;
  retstr->var4 = v49;
  return result;
}

- ($3CC2805F0189FCCE51047C0D2B5A52A9)heightBoundsForWidth:(SEL)a3
{
  return -[PKCollapsibleHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, a4, 1.79769313e308);
}

- (void)_contentSizeCategoryDidChange
{
  -[PKCollapsibleHeaderView _setLabelFonts](self, "_setLabelFonts");
  -[PKCollapsibleHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setLabelFonts
{
  UIFont *v3;
  UIFont *titleFont;

  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AE8], (void *)*MEMORY[0x1E0DC48C8], 2, 0);
  v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  titleFont = self->_titleFont;
  self->_titleFont = v3;

  -[PKCollapsibleHeaderView updateTitleLabelText](self, "updateTitleLabelText");
}

- (double)_titleTopPadding
{
  uint64_t v3;
  double result;
  double v5;

  if (self->_topArtView || (result = 0.0, !self->_removeAdditionalTopPadding))
  {
    v3 = PKUIGetMinScreenWidthType();
    if (self->_topArtView)
    {
      result = 15.0;
      if (!v3)
        return 5.0;
    }
    else
    {
      v5 = 24.0;
      if (!v3)
        v5 = 10.0;
      return v5 + self->_additionalTopPadding;
    }
  }
  return result;
}

- (double)_topArtTopPadding
{
  double result;
  uint64_t v4;
  double v5;

  result = 0.0;
  if (!self->_removeAdditionalTopPadding)
  {
    v4 = PKUIGetMinScreenWidthType();
    v5 = 10.0;
    if (!v4)
      v5 = 5.0;
    return v5 + self->_additionalTopPadding;
  }
  return result;
}

- (double)_maxTitleWidthInsideFrameWidth:(double)a3 reserveSpace:(BOOL)a4
{
  double v5;
  double v6;

  v5 = 0.0;
  if (a4)
  {
    -[UIActivityIndicatorView sizeThatFits:](self->_activityIndicator, "sizeThatFits:", a3, 1.79769313e308);
    v5 = fmax(v6, 30.0) * 2.0 + 10.0;
  }
  return a3 - v5;
}

- (void)setTitleAccessoriesEnabled:(BOOL)a3
{
  PKTrailingAccessoryLabel *titleLabel;
  LAUICheckmarkLayer *checkmarkLayer;
  PKTrailingAccessoryLabel *v6;
  UIActivityIndicatorView *activityIndicator;

  if (((!self->_titleAccessoriesEnabled ^ a3) & 1) == 0)
  {
    self->_titleAccessoriesEnabled = a3;
    titleLabel = self->_titleLabel;
    if (a3)
    {
      checkmarkLayer = self->_checkmarkLayer;
      -[LAUICheckmarkLayer aspectSize](checkmarkLayer, "aspectSize");
      PKSizeScaleAspectFit();
      -[PKTrailingAccessoryLabel registerAccessoryWithLayer:withSize:for:](titleLabel, "registerAccessoryWithLayer:withSize:for:", checkmarkLayer, CFSTR("checkmark"));
      v6 = self->_titleLabel;
      activityIndicator = self->_activityIndicator;
      -[UIActivityIndicatorView intrinsicContentSize](activityIndicator, "intrinsicContentSize");
      -[PKTrailingAccessoryLabel registerAccessoryWithView:withSize:for:](v6, "registerAccessoryWithView:withSize:for:", activityIndicator, CFSTR("activityIndicator"));
    }
    else
    {
      -[PKTrailingAccessoryLabel unregisterAccessories](self->_titleLabel, "unregisterAccessories");
    }
    -[PKCollapsibleHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowSpinner:(BOOL)a3
{
  UIActivityIndicatorView *activityIndicator;

  if (((!self->_showSpinner ^ a3) & 1) == 0)
  {
    self->_showSpinner = a3;
    activityIndicator = self->_activityIndicator;
    if (a3)
    {
      -[UIActivityIndicatorView setHidden:](activityIndicator, "setHidden:", 0);
      -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](activityIndicator, "stopAnimating");
    }
  }
}

- (void)setShowCheckmark:(BOOL)a3
{
  -[PKCollapsibleHeaderView showCheckmark:animated:](self, "showCheckmark:animated:", a3, 1);
}

- (void)setShowSearchBar:(BOOL)a3
{
  if (((!self->_showSearchBar ^ a3) & 1) == 0)
  {
    self->_showSearchBar = a3;
    if (a3)
      -[PKCollapsibleHeaderView addSubview:](self, "addSubview:", self->_searchBar);
    else
      -[UISearchBar removeFromSuperview](self->_searchBar, "removeFromSuperview");
    -[PKCollapsibleHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAdditionalCollapsibleHeight:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  if (self->_additionalCollapsibleHeight != a3)
    self->_additionalCollapsibleHeight = a3;
}

- (void)showCheckmark:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_showCheckmark ^ a3) & 1) == 0)
  {
    self->_showCheckmark = a3;
    -[LAUICheckmarkLayer setRevealed:animated:](self->_checkmarkLayer, "setRevealed:animated:");
  }
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
  -[PKCollapsibleHeaderView updateTitleLabelText](self, "updateTitleLabelText");
  -[PKCollapsibleHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitle:(id)a3 subtitle:(id)a4
{
  id v7;
  id v8;

  objc_storeStrong((id *)&self->_titleText, a3);
  v7 = a3;
  v8 = a4;
  -[PKCollapsibleHeaderView updateTitleLabelText](self, "updateTitleLabelText");
  -[UILabel setText:](self->_subtitleLabel, "setText:", v8);

  -[PKCollapsibleHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateTitleLabelText
{
  objc_class *v3;
  UIFont *v4;
  id v5;
  id v6;
  NSString *titleText;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  if (self->_titleText)
  {
    v3 = (objc_class *)MEMORY[0x1E0DC1288];
    v4 = self->_titleFont;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v5, "setAlignment:", 1);
    objc_msgSend(v5, "setLineBreakMode:", 0);
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    titleText = self->_titleText;
    v8 = *MEMORY[0x1E0DC1138];
    v12[0] = *MEMORY[0x1E0DC1178];
    v12[1] = v8;
    v13[0] = v5;
    v13[1] = v4;
    v12[2] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithString:attributes:", titleText, v10);

  }
  else
  {
    v11 = 0;
  }
  -[PKTrailingAccessoryLabel setAttributedText:](self->_titleLabel, "setAttributedText:", v11);

}

- (void)setSearchBarDefaultText:(id)a3
{
  -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", a3);
}

- (void)setImage:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  id v7;
  id v8;

  v4 = a3;
  self->_imageSize = (CGSize)*MEMORY[0x1E0C9D820];
  v8 = v4;
  if (v4)
  {
    objc_msgSend(v4, "size");
    self->_imageSize.width = v5;
    self->_imageSize.height = v6;
    v7 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(v7, "setContentMode:", 1);
    objc_msgSend(v7, "setImage:", v8);
    -[PKCollapsibleHeaderView addSubview:](self, "addSubview:", v7);
    -[PKCollapsibleHeaderView setTopArtView:](self, "setTopArtView:", v7);

  }
  else
  {
    -[PKCollapsibleHeaderView setTopArtView:](self, "setTopArtView:", 0);
  }

}

- (void)setTopArtView:(id)a3
{
  id v5;

  v5 = a3;
  -[UIView removeFromSuperview](self->_topArtView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_topArtView, a3);
  if (self->_topArtView)
    -[PKCollapsibleHeaderView addSubview:](self, "addSubview:");
  -[PKCollapsibleHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (UIImage)image
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIView image](self->_topArtView, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIImage *)v3;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  PKCollapsibleHeaderViewDelegate **p_delegate;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "searchTextDidChangeTo:", v8);

  }
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  PKCollapsibleHeaderViewDelegate **p_delegate;
  id WeakRetained;
  id v6;

  objc_msgSend(a3, "setShowsCancelButton:", 1);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "searchBarTextDidBeginEditing");

  }
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  PKCollapsibleHeaderViewDelegate **p_delegate;
  id WeakRetained;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "resignFirstResponder");
  objc_msgSend(v4, "setShowsCancelButton:", 0);

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "searchBarTextDidEndEditing");

  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  PKCollapsibleHeaderViewDelegate **p_delegate;
  id WeakRetained;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "setText:", 0);
  objc_msgSend(v4, "resignFirstResponder");

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "searchBarCancelButtonClicked");

  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIView)topArtView
{
  return self->_topArtView;
}

- (BOOL)removeAdditionalTopPadding
{
  return self->_removeAdditionalTopPadding;
}

- (void)setRemoveAdditionalTopPadding:(BOOL)a3
{
  self->_removeAdditionalTopPadding = a3;
}

- (double)additionalTopPadding
{
  return self->_additionalTopPadding;
}

- (void)setAdditionalTopPadding:(double)a3
{
  self->_additionalTopPadding = a3;
}

- (double)additionalBottomPadding
{
  return self->_additionalBottomPadding;
}

- (void)setAdditionalBottomPadding:(double)a3
{
  self->_additionalBottomPadding = a3;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (double)additionalCollapsibleHeight
{
  return self->_additionalCollapsibleHeight;
}

- (BOOL)titleAccessoriesEnabled
{
  return self->_titleAccessoriesEnabled;
}

- (BOOL)showSearchBar
{
  return self->_showSearchBar;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (BOOL)showCheckmark
{
  return self->_showCheckmark;
}

- (UIEdgeInsets)readableContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_readableContentInsets.top;
  left = self->_readableContentInsets.left;
  bottom = self->_readableContentInsets.bottom;
  right = self->_readableContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setReadableContentInsets:(UIEdgeInsets)a3
{
  self->_readableContentInsets = a3;
}

- (PKCollapsibleHeaderViewDelegate)delegate
{
  return (PKCollapsibleHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topArtView, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
