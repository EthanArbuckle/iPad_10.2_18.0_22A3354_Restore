@implementation PKDashboardCollectionViewCell

+ (double)defaultHorizontalInset
{
  PKUIGetMinScreenWidthType();
  return 16.0;
}

+ (id)defaultBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
}

- (PKDashboardCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKDashboardCollectionViewCell *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKDashboardCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[PKDashboardCollectionViewCell setBackgroundView:](v3, "setBackgroundView:", v4);

    -[PKDashboardCollectionViewCell backgroundView](v3, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    v3->_bottomSeparatorVisible = 1;
    -[PKDashboardCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67A90]);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKDashboardCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v13, sel_layoutSubviews);
  -[UIView superview](self->_separatorView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKDashboardCollectionViewCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[UIView setFrame:](self->_separatorView, "setFrame:", v6 + 14.0, v8 + v12 - PKUIPixelLength(), v10 + -14.0);
  }
  -[PKDashboardCollectionViewCell updateMask](self, "updateMask");
}

- (void)prepareForReuse
{
  UIView *separatorView;
  _BOOL4 wantsCustomAppearance;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardCollectionViewCell;
  -[PKDashboardCollectionViewCell prepareForReuse](&v7, sel_prepareForReuse);
  self->_bottomSeparatorVisible = 1;
  separatorView = self->_separatorView;
  if (separatorView)
  {
    -[PKDashboardCollectionViewCell _bottomSeparatorAlpha](self, "_bottomSeparatorAlpha");
    -[UIView setAlpha:](separatorView, "setAlpha:");
  }
  wantsCustomAppearance = self->_wantsCustomAppearance;
  -[PKDashboardCollectionViewCell backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (wantsCustomAppearance)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend((id)objc_opt_class(), "defaultBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)setHorizontalInset:(double)a3
{
  self->_customHorizontalInset = 1;
  self->_horizontalInset = a3;
}

- (double)horizontalInset
{
  double result;

  if (self->_customHorizontalInset)
    return self->_horizontalInset;
  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  return result;
}

- (unint64_t)maskType
{
  return self->_maskType;
}

- (void)setMaskType:(unint64_t)a3
{
  if (self->_maskType != a3)
  {
    self->_maskType = a3;
    -[PKDashboardCollectionViewCell updateMask](self, "updateMask");
  }
}

- (void)updateMask
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGRect v11;

  -[PKDashboardCollectionViewCell bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (self->_previousMaskType != self->_maskType
    || (v11.origin.x = v3,
        v11.origin.y = v4,
        v11.size.width = v5,
        v11.size.height = v6,
        !CGRectEqualToRect(self->_previousMaskBounds, v11)))
  {
    self->_previousMaskBounds.origin.x = v7;
    self->_previousMaskBounds.origin.y = v8;
    self->_previousMaskBounds.size.width = v9;
    self->_previousMaskBounds.size.height = v10;
    self->_previousMaskType = self->_maskType;
    -[UIView pkui_setMaskType:](self, "pkui_setMaskType:", self->_maskType);
  }
}

- (void)setShowsBottomSeparator:(BOOL)a3
{
  UIView *separatorView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  UIView *v9;
  void *v10;

  if (((!self->_showsBottomSeparator ^ a3) & 1) == 0)
  {
    self->_showsBottomSeparator = a3;
    separatorView = self->_separatorView;
    if (a3)
    {
      if (!separatorView)
      {
        v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v6 = self->_separatorView;
        self->_separatorView = v5;

        v7 = self->_separatorView;
        objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

        -[UIView setAutoresizingMask:](self->_separatorView, "setAutoresizingMask:", 2);
        v9 = self->_separatorView;
        -[PKDashboardCollectionViewCell _bottomSeparatorAlpha](self, "_bottomSeparatorAlpha");
        -[UIView setAlpha:](v9, "setAlpha:");
      }
      -[PKDashboardCollectionViewCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_separatorView);

      -[PKDashboardCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UIView removeFromSuperview](separatorView, "removeFromSuperview");
    }
  }
}

- (void)setBottomSeparatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  UIView *separatorView;
  void *v6;
  uint64_t v7;
  _QWORD v8[6];

  if (((!self->_bottomSeparatorVisible ^ a3) & 1) == 0)
  {
    self->_bottomSeparatorVisible = a3;
    separatorView = self->_separatorView;
    if (separatorView)
    {
      if (a4)
      {
        -[UIView superview](separatorView, "superview");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKDashboardCollectionViewCell _bottomSeparatorAlpha](self, "_bottomSeparatorAlpha");
        if (v6)
        {
          v8[0] = MEMORY[0x1E0C809B0];
          v8[1] = 3221225472;
          v8[2] = __68__PKDashboardCollectionViewCell_setBottomSeparatorVisible_animated___block_invoke;
          v8[3] = &unk_1E3E62010;
          v8[4] = self;
          v8[5] = v7;
          objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v8, 0);
          return;
        }
      }
      else
      {
        -[PKDashboardCollectionViewCell _bottomSeparatorAlpha](self, "_bottomSeparatorAlpha");
      }
      -[UIView setAlpha:](self->_separatorView, "setAlpha:");
    }
  }
}

uint64_t __68__PKDashboardCollectionViewCell_setBottomSeparatorVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "setAlpha:", *(double *)(a1 + 40));
}

- (double)_bottomSeparatorAlpha
{
  unint64_t v2;

  LOBYTE(v2) = self->_bottomSeparatorVisible;
  return (double)v2;
}

- (void)setWantsCustomAppearance:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  if (((!self->_wantsCustomAppearance ^ a3) & 1) == 0)
  {
    v3 = a3;
    self->_wantsCustomAppearance = a3;
    -[PKDashboardCollectionViewCell backgroundView](self, "backgroundView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    else
      objc_msgSend((id)objc_opt_class(), "defaultBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDashboardCollectionViewCell;
  -[PKDashboardCollectionViewCell setHighlighted:](&v10, sel_setHighlighted_);
  if (!self->_wantsCustomAppearance || self->_wantsDefaultHighlightBehavior)
  {
    v5 = (void *)MEMORY[0x1E0DC3F10];
    if (v3)
    {
      v9 = MEMORY[0x1E0C809B0];
      v6 = __48__PKDashboardCollectionViewCell_setHighlighted___block_invoke;
      v7 = &v9;
    }
    else
    {
      v8 = MEMORY[0x1E0C809B0];
      v6 = __48__PKDashboardCollectionViewCell_setHighlighted___block_invoke_2;
      v7 = &v8;
    }
    v7[1] = 3221225472;
    v7[2] = (uint64_t)v6;
    v7[3] = (uint64_t)&unk_1E3E612E8;
    v7[4] = (uint64_t)self;
    objc_msgSend(v5, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v8);
  }
}

void __48__PKDashboardCollectionViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v1);

}

void __48__PKDashboardCollectionViewCell_setHighlighted___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v1);

}

- (BOOL)wantsCustomAppearance
{
  return self->_wantsCustomAppearance;
}

- (BOOL)wantsDefaultHighlightBehavior
{
  return self->_wantsDefaultHighlightBehavior;
}

- (void)setWantsDefaultHighlightBehavior:(BOOL)a3
{
  self->_wantsDefaultHighlightBehavior = a3;
}

- (BOOL)showsBottomSeparator
{
  return self->_showsBottomSeparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
