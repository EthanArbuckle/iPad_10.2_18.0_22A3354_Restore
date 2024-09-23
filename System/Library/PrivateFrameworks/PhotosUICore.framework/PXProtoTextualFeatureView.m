@implementation PXProtoTextualFeatureView

- (UIEdgeInsets)minimumMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 10.0;
  v4 = 0.0;
  v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)regularContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)compactContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[PXProtoTextualFeatureView regularContentSize](self, "regularContentSize");
  v4 = v3;
  -[PXProtoFeatureView recommendedCompactContentHeight](self, "recommendedCompactContentHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)updateContent
{
  id v3;
  void *v4;
  UILabel *v5;
  UILabel *label;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXProtoTextualFeatureView;
  -[PXProtoFeatureView updateContent](&v11, sel_updateContent);
  if (!self->_label)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PXProtoFeatureView contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = (UILabel *)objc_msgSend(v3, "initWithFrame:");
    label = self->_label;
    self->_label = v5;

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_label, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](self->_label, "setMinimumScaleFactor:", 0.6);
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
    -[PXProtoFeatureView contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_label);

  }
  -[PXProtoFeatureView feature](self, "feature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "featureLocalizedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_label, "setText:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_label, "setTextColor:", v10);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)PXProtoTextualFeatureView;
  -[PXProtoFeatureView layoutSubviews](&v18, sel_layoutSubviews);
  -[UILabel superview](self->_label, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UILabel bounds](self->_label, "bounds");
  v13 = v12;
  v15 = v14;
  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  v17 = v16;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  -[UILabel setBounds:](self->_label, "setBounds:", v13, v15, CGRectGetWidth(v19), v17);
  PXRectGetCenter();
  -[UILabel setCenter:](self->_label, "setCenter:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
