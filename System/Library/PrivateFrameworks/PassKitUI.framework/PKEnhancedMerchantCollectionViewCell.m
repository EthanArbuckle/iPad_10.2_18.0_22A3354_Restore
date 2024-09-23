@implementation PKEnhancedMerchantCollectionViewCell

- (PKEnhancedMerchantCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKEnhancedMerchantCollectionViewCell *v3;
  PKEnhancedMerchantCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKEnhancedMerchantCollectionViewCell;
  v3 = -[PKEnhancedMerchantCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKEnhancedMerchantCollectionViewCell _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIImageView *v3;
  UIImageView *imageView;
  void *v5;
  void *v6;
  UIColor *v7;
  UIColor *normalInputColor;
  void *v9;
  void *v10;
  UIColor *v11;
  UIColor *highlightInputColor;
  id v13;

  v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
  imageView = self->_imageView;
  self->_imageView = v3;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[PKEnhancedMerchantCollectionViewCell layer](self, "layer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", 10.0);
  objc_msgSend(v13, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEnhancedMerchantCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  -[PKEnhancedMerchantCollectionViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_imageView);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  normalInputColor = self->_normalInputColor;
  self->_normalInputColor = v7;

  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolvedColorWithTraitCollection:", v10);
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  highlightInputColor = self->_highlightInputColor;
  self->_highlightInputColor = v11;

  self->_highlighted = 0;
  self->_selected = 0;
  -[PKEnhancedMerchantCollectionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B48]);

}

- (void)_createHighlightFilterIfNecessary
{
  id v3;
  CAFilter *v4;
  CAFilter *highlightFilter;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!self->_highlightFilter)
  {
    v3 = objc_alloc(MEMORY[0x1E0CD2780]);
    v4 = (CAFilter *)objc_msgSend(v3, "initWithType:", *MEMORY[0x1E0CD2E60]);
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v4;

    -[CAFilter setName:](self->_highlightFilter, "setName:", CFSTR("highlightFilter"));
    -[CAFilter setValue:forKey:](self->_highlightFilter, "setValue:forKey:", -[UIColor CGColor](self->_normalInputColor, "CGColor"), CFSTR("inputColor"));
    -[PKEnhancedMerchantCollectionViewCell layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = self->_highlightFilter;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v7);

    objc_storeStrong((id *)&self->_appliedInputColor, self->_normalInputColor);
  }
}

- (void)updateWithAccountEnhancedMerchant:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_enhancedMerchant, a3);
  v5 = v6;
  if (!v6)
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", 0);
    v5 = 0;
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKEnhancedMerchantCollectionViewCell;
  -[PKEnhancedMerchantCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKEnhancedMerchantCollectionViewCell updateWithAccountEnhancedMerchant:](self, "updateWithAccountEnhancedMerchant:", 0);
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)PKEnhancedMerchantCollectionViewCell;
  -[PKEnhancedMerchantCollectionViewCell layoutSubviews](&v16, sel_layoutSubviews);
  -[PKEnhancedMerchantCollectionViewCell bounds](self, "bounds");
  v18 = CGRectInset(v17, 30.0, 30.0);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  -[PKEnhancedMerchantCollectionViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEnhancedMerchantCollectionViewCell convertRect:toView:](self, "convertRect:toView:", v7, x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[UIImageView setFrame:](self->_imageView, "setFrame:", v9, v11, v13, v15);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKEnhancedMerchantCollectionViewCell;
  -[PKEnhancedMerchantCollectionViewCell setHighlighted:](&v5, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    -[PKEnhancedMerchantCollectionViewCell _updateFilter](self, "_updateFilter");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKEnhancedMerchantCollectionViewCell;
  -[PKEnhancedMerchantCollectionViewCell setSelected:](&v5, sel_setSelected_);
  if (self->_selected != v3)
  {
    self->_selected = v3;
    -[PKEnhancedMerchantCollectionViewCell _updateFilter](self, "_updateFilter");
  }
}

- (void)_updateFilter
{
  int *v3;
  UIColor **p_appliedInputColor;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  -[PKEnhancedMerchantCollectionViewCell _createHighlightFilterIfNecessary](self, "_createHighlightFilterIfNecessary");
  v3 = &OBJC_IVAR___PKEnhancedMerchantCollectionViewCell__highlightInputColor;
  if (!self->_highlighted)
  {
    v3 = &OBJC_IVAR___PKEnhancedMerchantCollectionViewCell__normalInputColor;
    if (self->_selected)
      v3 = &OBJC_IVAR___PKEnhancedMerchantCollectionViewCell__highlightInputColor;
  }
  p_appliedInputColor = &self->_appliedInputColor;
  v17 = *(id *)((char *)&self->super.super.super.super.super.isa + *v3);
  if ((-[UIColor isEqual:](self->_appliedInputColor, "isEqual:") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0DC3658];
    -[PKEnhancedMerchantCollectionViewCell layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "valueForKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
    if (!v8)
      v8 = -[UIColor CGColor](*p_appliedInputColor, "CGColor");
    objc_msgSend(v5, "colorWithCGColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKEnhancedMerchantCollectionViewCell layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_retainAutorelease(v17);
    objc_msgSend(v10, "setValue:forKeyPath:", objc_msgSend(v11, "CGColor"), CFSTR("filters.highlightFilter.inputColor"));

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdditive:", 0);
    objc_msgSend(v12, "setDuration:", 0.15);
    v13 = objc_retainAutorelease(v9);
    objc_msgSend(v12, "setFromValue:", objc_msgSend(v13, "CGColor"));
    v14 = objc_retainAutorelease(v11);
    objc_msgSend(v12, "setToValue:", objc_msgSend(v14, "CGColor"));
    -[PKEnhancedMerchantCollectionViewCell layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAnimationForKey:", CFSTR("highlight"));

    -[PKEnhancedMerchantCollectionViewCell layer](self, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAnimation:forKey:", v12, CFSTR("highlight"));

    objc_storeStrong((id *)p_appliedInputColor, v14);
  }

}

- (PKAccountEnhancedMerchant)enhancedMerchant
{
  return self->_enhancedMerchant;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_enhancedMerchant, 0);
  objc_storeStrong((id *)&self->_appliedInputColor, 0);
  objc_storeStrong((id *)&self->_highlightInputColor, 0);
  objc_storeStrong((id *)&self->_normalInputColor, 0);
  objc_storeStrong((id *)&self->_highlightFilter, 0);
}

@end
