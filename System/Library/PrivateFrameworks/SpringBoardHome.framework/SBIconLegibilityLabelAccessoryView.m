@implementation SBIconLegibilityLabelAccessoryView

- (SBIconLegibilityLabelAccessoryView)initWithFrame:(CGRect)a3
{
  SBIconLegibilityLabelAccessoryView *v3;
  UIImageView *v4;
  UIImageView *iconImageView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconLegibilityLabelAccessoryView;
  v3 = -[SBIconLegibilityLabelAccessoryView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v4;

    -[SBIconLegibilityLabelAccessoryView addSubview:](v3, "addSubview:", v3->_iconImageView);
  }
  return v3;
}

- (void)updateWithLegibilitySettings:(id)a3 labelFont:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "primaryColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconLegibilityLabelAccessoryView setTintColor:](self, "setTintColor:", v8);

  v9.receiver = self;
  v9.super_class = (Class)SBIconLegibilityLabelAccessoryView;
  -[SBIconLabelAccessoryView updateWithLegibilitySettings:labelFont:](&v9, sel_updateWithLegibilitySettings_labelFont_, v7, v6);

}

- (void)updateWithBaseImage:(id)a3 legibilitySettings:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SBIconLegibilityLabelAccessoryView iconImageView](self, "iconImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  objc_msgSend(v6, "sizeToFit");
}

- (BOOL)hasBaseline
{
  void *v2;
  void *v3;
  char v4;

  -[SBIconLegibilityLabelAccessoryView iconImageView](self, "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasBaseline");

  return v4;
}

- (double)baselineOffsetFromBottom
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBIconLegibilityLabelAccessoryView iconImageView](self, "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baselineOffsetFromBottom");
  v5 = v4;

  return v5;
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[SBIconLegibilityLabelAccessoryView iconImageView](self, "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alignmentRectInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (id)firstBaselineAnchor
{
  void *v2;
  void *v3;

  -[SBIconLegibilityLabelAccessoryView iconImageView](self, "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBaselineAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastBaselineAnchor
{
  void *v2;
  void *v3;

  -[SBIconLegibilityLabelAccessoryView iconImageView](self, "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastBaselineAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
