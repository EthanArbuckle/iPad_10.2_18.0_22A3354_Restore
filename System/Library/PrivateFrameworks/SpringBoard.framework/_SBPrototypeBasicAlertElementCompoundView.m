@implementation _SBPrototypeBasicAlertElementCompoundView

- (_SBPrototypeBasicAlertElementCompoundView)initWithFrame:(CGRect)a3
{
  _SBPrototypeBasicAlertElementCompoundView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SBPrototypeBasicAlertElementCompoundView;
  result = -[_SBPrototypeBasicAlertElementCompoundView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_layoutAxis = 1;
  return result;
}

- (UIImage)leadingImage
{
  return -[UIImageView image](self->_leadingImageView, "image");
}

- (void)setLeadingImage:(id)a3
{
  void *v4;
  char v5;
  id v6;
  UIImageView *v7;
  UIImageView *leadingImageView;
  id v9;

  v9 = a3;
  -[_SBPrototypeBasicAlertElementCompoundView leadingImage](self, "leadingImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    v6 = v9;
    if (v9 && !self->_leadingImageView)
    {
      v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
      leadingImageView = self->_leadingImageView;
      self->_leadingImageView = v7;

      -[_SBPrototypeBasicAlertElementCompoundView addSubview:](self, "addSubview:", self->_leadingImageView);
      v6 = v9;
    }
    -[UIImageView setImage:](self->_leadingImageView, "setImage:", v6);
    -[_SBPrototypeBasicAlertElementCompoundView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIImage)trailingImage
{
  return -[UIImageView image](self->_trailingImageView, "image");
}

- (void)setTrailingImage:(id)a3
{
  void *v4;
  char v5;
  id v6;
  UIImageView *v7;
  UIImageView *trailingImageView;
  id v9;

  v9 = a3;
  -[_SBPrototypeBasicAlertElementCompoundView trailingImage](self, "trailingImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    v6 = v9;
    if (v9 && !self->_trailingImageView)
    {
      v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
      trailingImageView = self->_trailingImageView;
      self->_trailingImageView = v7;

      -[_SBPrototypeBasicAlertElementCompoundView addSubview:](self, "addSubview:", self->_trailingImageView);
      v6 = v9;
    }
    -[UIImageView setImage:](self->_trailingImageView, "setImage:", v6);
    -[_SBPrototypeBasicAlertElementCompoundView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setLayoutAxis:(unint64_t)a3
{
  if (a3 - 1 <= 1 && self->_layoutAxis != a3)
  {
    self->_layoutAxis = a3;
    -[_SBPrototypeBasicAlertElementCompoundView setNeedsLayout](self, "setNeedsLayout");
  }
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
  -[UIImageView sizeThatFits:](self->_leadingImageView, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  -[_SBPrototypeBasicAlertElementCompoundView trailingImage](self, "trailingImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIImageView sizeThatFits:](self->_trailingImageView, "sizeThatFits:", width, height);
    if (self->_layoutAxis == 2)
    {
      if (v7 < v11)
        v7 = v11;
      v9 = v9 + v12 + 4.0;
    }
    else
    {
      v7 = v7 + v11 + 4.0;
      if (v9 < v12)
        v9 = v12;
    }
  }
  v13 = v7;
  v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double x;
  double v12;
  double y;
  double v14;
  double width;
  double v16;
  double height;
  void *v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  objc_super v34;
  CGRect v35;
  CGRect v36;

  v34.receiver = self;
  v34.super_class = (Class)_SBPrototypeBasicAlertElementCompoundView;
  -[_SBPrototypeBasicAlertElementCompoundView layoutSubviews](&v34, sel_layoutSubviews);
  -[_SBPrototypeBasicAlertElementCompoundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_SBPrototypeBasicAlertElementCompoundView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  -[UIImageView sizeThatFits:](self->_leadingImageView, "sizeThatFits:", v4, v6);
  BSRectWithSize();
  UIRectRoundToScale();
  x = v10;
  y = v12;
  width = v14;
  height = v16;
  -[_SBPrototypeBasicAlertElementCompoundView trailingImage](self, "trailingImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[UIImageView sizeThatFits:](self->_trailingImageView, "sizeThatFits:", v4, v6);
    BSRectWithSize();
    rect = v19;
    rect_8 = v20;
    v22 = v21;
    rect_16 = v23;
    -[_SBPrototypeBasicAlertElementCompoundView traitCollection](self, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "layoutDirection");

    if (self->_layoutAxis == 2)
    {
      UIRectCenteredXInRectScale();
      x = v35.origin.x;
      y = v35.origin.y;
      width = v35.size.width;
      height = v35.size.height;
      CGRectGetMaxY(v35);
      UIRectCenteredXInRectScale();
      -[UIImageView setFrame:](self->_trailingImageView, "setFrame:", v9);
    }
    else
    {
      UIRectCenteredYInRectScale();
      x = v26;
      y = v27;
      width = v28;
      v30 = v29;
      if (v25 == 1)
      {
        CGRectGetMinX(*(CGRect *)&v26);
        v36.origin.x = rect;
        v36.origin.y = v22;
        v36.size.width = rect_8;
        v36.size.height = rect_16;
        CGRectGetWidth(v36);
      }
      else
      {
        CGRectGetMaxX(*(CGRect *)&v26);
      }
      UIRectCenteredYInRectScale();
      height = v30;
      -[UIImageView setFrame:](self->_trailingImageView, "setFrame:", v9);
    }
  }
  -[UIImageView setFrame:](self->_leadingImageView, "setFrame:", x, y, width, height);
}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
}

@end
