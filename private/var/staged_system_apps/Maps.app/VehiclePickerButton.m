@implementation VehiclePickerButton

- (VehiclePickerButton)initWithFrame:(CGRect)a3
{
  VehiclePickerButton *v3;
  VehiclePickerButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *leadingConstraint;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *trailingConstraint;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSLayoutConstraint *topConstraint;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *bottomConstraint;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  _QWORD v46[8];

  v45.receiver = self;
  v45.super_class = (Class)VehiclePickerButton;
  v3 = -[VehiclePickerButton initWithFrame:](&v45, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton highlightView](v3, "highlightView"));
    -[VehiclePickerButton addSubview:](v4, "addSubview:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](v4, "colorView"));
    -[VehiclePickerButton addSubview:](v4, "addSubview:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](v4, "colorView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton leadingAnchor](v4, "leadingAnchor"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    leadingConstraint = v4->_leadingConstraint;
    v4->_leadingConstraint = (NSLayoutConstraint *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](v4, "colorView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton trailingAnchor](v4, "trailingAnchor"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    trailingConstraint = v4->_trailingConstraint;
    v4->_trailingConstraint = (NSLayoutConstraint *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](v4, "colorView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton topAnchor](v4, "topAnchor"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    topConstraint = v4->_topConstraint;
    v4->_topConstraint = (NSLayoutConstraint *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](v4, "colorView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton bottomAnchor](v4, "bottomAnchor"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    bottomConstraint = v4->_bottomConstraint;
    v4->_bottomConstraint = (NSLayoutConstraint *)v25;

    v46[0] = v4->_leadingConstraint;
    v46[1] = v4->_trailingConstraint;
    v46[2] = v4->_topConstraint;
    v46[3] = v4->_bottomConstraint;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton highlightView](v4, "highlightView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton leadingAnchor](v4, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
    v46[4] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton highlightView](v4, "highlightView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton trailingAnchor](v4, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
    v46[5] = v37;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton highlightView](v4, "highlightView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton topAnchor](v4, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    v46[6] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton highlightView](v4, "highlightView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton bottomAnchor](v4, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
    v46[7] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

  }
  return v4;
}

- (UIView)highlightView
{
  UIView *highlightView;
  UIView *v4;
  UIView *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  highlightView = self->_highlightView;
  if (!highlightView)
  {
    v4 = objc_opt_new(UIView);
    v5 = self->_highlightView;
    self->_highlightView = v4;

    -[UIView setUserInteractionEnabled:](self->_highlightView, "setUserInteractionEnabled:", 0);
    -[UIView setHidden:](self->_highlightView, "setHidden:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_highlightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_highlightView, "layer"));
    objc_msgSend(v6, "setBorderWidth:", 3.0);

    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color")));
    v8 = objc_msgSend(v7, "CGColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_highlightView, "layer"));
    objc_msgSend(v9, "setBorderColor:", v8);

    highlightView = self->_highlightView;
  }
  return highlightView;
}

- (UIImageView)colorView
{
  UIImageView *colorView;
  UIImageView *v4;
  UIImageView *v5;

  colorView = self->_colorView;
  if (!colorView)
  {
    v4 = objc_opt_new(UIImageView);
    v5 = self->_colorView;
    self->_colorView = v4;

    -[UIImageView setUserInteractionEnabled:](self->_colorView, "setUserInteractionEnabled:", 0);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_colorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    colorView = self->_colorView;
  }
  return colorView;
}

- (void)setColorViewInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v7;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self->_colorViewInsets.top;
  if (self->_colorViewInsets.left != a3.left
    || v7 != top
    || self->_colorViewInsets.right != a3.right
    || self->_colorViewInsets.bottom != a3.bottom)
  {
    self->_colorViewInsets.top = top;
    self->_colorViewInsets.left = a3.left;
    self->_colorViewInsets.bottom = a3.bottom;
    self->_colorViewInsets.right = a3.right;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton leadingConstraint](self, "leadingConstraint", v7));
    objc_msgSend(v12, "setConstant:", left);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton trailingConstraint](self, "trailingConstraint"));
    objc_msgSend(v13, "setConstant:", -right);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton topConstraint](self, "topConstraint"));
    objc_msgSend(v14, "setConstant:", top);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton bottomConstraint](self, "bottomConstraint"));
    objc_msgSend(v15, "setConstant:", -bottom);

    -[VehiclePickerButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;

  if (self->_active != a3)
  {
    self->_active = a3;
    v4 = !a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton highlightView](self, "highlightView"));
    objc_msgSend(v5, "setHidden:", v4);

    -[VehiclePickerButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNeedsOutlineStroke:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  if (self->_needsOutlineStroke != a3)
  {
    v3 = a3;
    self->_needsOutlineStroke = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](self, "colorView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v6, "setBorderWidth:", 1.0);

      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color")));
      v9 = objc_msgSend(v8, "CGColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](self, "colorView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      objc_msgSend(v11, "setBorderColor:", v9);

    }
    else
    {
      objc_msgSend(v6, "setBorderWidth:", 0.0);

      v8 = (id)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](self, "colorView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
      objc_msgSend(v10, "setBorderColor:", 0);
    }

    -[VehiclePickerButton setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)layoutSubviews
{
  void *v3;
  double Width;
  void *v5;
  double Height;
  void *v7;
  uint64_t v8;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v24;
  double v25;
  void *v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v27.receiver = self;
  v27.super_class = (Class)VehiclePickerButton;
  -[VehiclePickerButton layoutSubviews](&v27, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](self, "colorView"));
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v28);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](self, "colorView"));
  objc_msgSend(v5, "frame");
  Height = CGRectGetHeight(v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](self, "colorView"));
  objc_msgSend(v7, "frame");
  if (Width >= Height)
    v12 = CGRectGetHeight(*(CGRect *)&v8);
  else
    v12 = CGRectGetWidth(*(CGRect *)&v8);
  v13 = v12 * 0.5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](self, "colorView"));
  objc_msgSend(v14, "_setCornerRadius:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton highlightView](self, "highlightView"));
  objc_msgSend(v15, "frame");
  v16 = CGRectGetWidth(v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton highlightView](self, "highlightView"));
  objc_msgSend(v17, "frame");
  v18 = CGRectGetHeight(v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton highlightView](self, "highlightView"));
  objc_msgSend(v19, "frame");
  if (v16 < v18)
    v24 = CGRectGetWidth(*(CGRect *)&v20);
  else
    v24 = CGRectGetHeight(*(CGRect *)&v20);
  v25 = v24 * 0.5;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton highlightView](self, "highlightView"));
  objc_msgSend(v26, "_setCornerRadius:", v25);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VehiclePickerButton;
  v4 = a3;
  -[VehiclePickerButton traitCollectionDidChange:](&v16, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton traitCollection](self, "traitCollection", v16.receiver, v16.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    if (-[VehiclePickerButton needsOutlineStroke](self, "needsOutlineStroke"))
    {
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color")));
      v9 = objc_msgSend(v8, "CGColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](self, "colorView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      objc_msgSend(v11, "setBorderColor:", v9);

    }
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color")));
    v13 = objc_msgSend(v12, "CGColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton highlightView](self, "highlightView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
    objc_msgSend(v15, "setBorderColor:", v13);

  }
}

- (id)accessibilityIdentifier
{
  return CFSTR("VehiclePickerButton");
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (void)setColorView:(id)a3
{
  objc_storeStrong((id *)&self->_colorView, a3);
}

- (UIEdgeInsets)colorViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_colorViewInsets.top;
  left = self->_colorViewInsets.left;
  bottom = self->_colorViewInsets.bottom;
  right = self->_colorViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)needsOutlineStroke
{
  return self->_needsOutlineStroke;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
}

@end
