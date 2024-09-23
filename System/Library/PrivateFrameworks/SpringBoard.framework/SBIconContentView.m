@implementation SBIconContentView

- (int64_t)orientation
{
  return self->_orientation;
}

- (SBIconContentView)initWithFrame:(CGRect)a3
{
  SBIconContentView *v3;
  SBIconContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBIconContentView;
  v3 = -[SBIconContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SBIconContentView _setIgnoresLayerTransformForSafeAreaInsets:](v3, "_setIgnoresLayerTransformForSafeAreaInsets:", 1);
  return v4;
}

- (SBIconContentView)initWithOrientation:(int64_t)a3
{
  SBIconContentView *result;

  result = -[SBIconContentView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (result)
    result->_orientation = a3;
  return result;
}

- (void)setOrientation:(int64_t)a3
{
  int v5;

  v5 = XBInterfaceOrientationsAreOrthogonal();
  self->_orientation = a3;
  if (v5)
  {
    -[SBIconContentView setNeedsLayout](self, "setNeedsLayout");
    -[SBIconContentView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  UIView *v7;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    v5 = v7;
    if (v7)
    {
      -[SBIconContentView addSubview:](self, "addSubview:", v7);
      v5 = v7;
    }
  }

}

- (id)preferredFocusEnvironments
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviews
{
  id v3;

  -[SBIconContentView contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconContentView bounds](self, "bounds");
  objc_msgSend(v3, "sb_setBoundsAndPositionFromFrame:");

}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
