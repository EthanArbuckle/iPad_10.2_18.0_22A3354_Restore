@implementation TrafficIncidentTitleView

- (TrafficIncidentTitleView)init
{
  TrafficIncidentTitleView *v2;
  TrafficIncidentTitleView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentTitleView;
  v2 = -[TrafficIncidentTitleView init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[TrafficIncidentTitleView _setupViews](v2, "_setupViews");
    -[TrafficIncidentTitleView _setupConstraints](v3, "_setupConstraints");
  }
  return v3;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)_setupViews
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_titleLabel, &stru_1011E7B58);
  -[TrafficIncidentTitleView addSubview:](self, "addSubview:", self->_titleLabel);
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
  void *v16;
  void *v17;
  _QWORD v18[4];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentTitleView leadingAnchor](self, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, 16.0));
  v18[0] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentTitleView trailingAnchor](self, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v13, -16.0));
  v18[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentTitleView topAnchor](self, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v6, &stru_1011E7B58, 37.0));
  v18[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentTitleView bottomAnchor](self, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v10, &stru_1011E7B58, -22.0));
  v18[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
