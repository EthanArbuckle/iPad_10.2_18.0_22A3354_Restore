@implementation ExtensionsBannerAttributionView

- (ExtensionsBannerAttributionView)initWithCoder:(id)a3
{
  ExtensionsBannerAttributionView *v3;
  ExtensionsBannerAttributionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsBannerAttributionView;
  v3 = -[ExtensionsBannerAttributionView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ExtensionsBannerAttributionView _commonInit](v3, "_commonInit");
  return v4;
}

- (ExtensionsBannerAttributionView)initWithFrame:(CGRect)a3
{
  ExtensionsBannerAttributionView *v3;
  ExtensionsBannerAttributionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsBannerAttributionView;
  v3 = -[ExtensionsBannerAttributionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ExtensionsBannerAttributionView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  UILabel *v5;
  UILabel *attributionLabel;
  void *v7;

  -[ExtensionsBannerAttributionView setTopHairlineHidden:](self, "setTopHairlineHidden:", 1);
  -[ExtensionsBannerAttributionView setBottomHairlineHidden:](self, "setBottomHairlineHidden:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:", 0.0700000003));
  -[ExtensionsBannerAttributionView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  attributionLabel = self->_attributionLabel;
  self->_attributionLabel = v5;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_attributionLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_attributionLabel, "setNumberOfLines:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_attributionLabel, "setTextColor:", v7);

  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_attributionLabel, &stru_1011E7AF8);
  -[ExtensionsBannerAttributionView addSubview:](self, "addSubview:", self->_attributionLabel);
  -[ExtensionsBannerAttributionView _setupConstraints](self, "_setupConstraints");
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_attributionLabel, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsBannerAttributionView leadingAnchor](self, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, 16.0));
  v16[0] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_attributionLabel, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsBannerAttributionView trailingAnchor](self, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, -16.0));
  v16[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_attributionLabel, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsBannerAttributionView topAnchor](self, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 0.0));
  v16[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_attributionLabel, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsBannerAttributionView bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 0.0));
  v16[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UILabel)attributionLabel
{
  return self->_attributionLabel;
}

- (void)setAttributionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_attributionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionLabel, 0);
}

@end
