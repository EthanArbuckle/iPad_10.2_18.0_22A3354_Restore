@implementation OfflineMapDeviceStateRowView

- (OfflineMapDeviceStateRowView)initWithFrame:(CGRect)a3
{
  OfflineMapDeviceStateRowView *v3;
  OfflineMapDeviceStateRowView *v4;
  OfflineMapDeviceStateRowView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OfflineMapDeviceStateRowView;
  v3 = -[OfflineMapDeviceStateRowView initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = v3;
  if (v3)
  {
    -[OfflineMapDeviceStateRowView _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  UILabel *v7;
  UILabel *valueLabel;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[7];

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleSubheadline, UIFontWeightMedium));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("RowLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OfflineMapDeviceStateRowView addSubview:](self, "addSubview:", self->_titleLabel);
  v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  valueLabel = self->_valueLabel;
  self->_valueLabel = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_valueLabel, "setFont:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_valueLabel, "setTextColor:", v10);

  -[UILabel setAccessibilityIdentifier:](self->_valueLabel, "setAccessibilityIdentifier:", CFSTR("RowValue"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OfflineMapDeviceStateRowView addSubview:](self, "addSubview:", self->_valueLabel);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceStateRowView leadingAnchor](self, "leadingAnchor"));
  v11 = kMUPlacePlatterPadding;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, kMUPlacePlatterPadding));
  v35[0] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceStateRowView topAnchor](self, "topAnchor"));
  v12 = kMUPlacePlatterCompactVerticalPadding;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, kMUPlacePlatterCompactVerticalPadding));
  v35[1] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceStateRowView trailingAnchor](self, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:constant:", v27, -v11));
  v35[2] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_valueLabel, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceStateRowView leadingAnchor](self, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, v11));
  v35[3] = v23;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_valueLabel, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 2.0));
  v35[4] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_valueLabel, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceStateRowView trailingAnchor](self, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", v17, -v11));
  v35[5] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_valueLabel, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceStateRowView bottomAnchor](self, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -v12));
  v35[6] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

}

- (void)setLabelText:(id)a3
{
  NSString *v4;
  NSString *labelText;

  if (self->_labelText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    labelText = self->_labelText;
    self->_labelText = v4;

    -[OfflineMapDeviceStateRowView _updateContent](self, "_updateContent");
  }
}

- (void)setValueText:(id)a3
{
  NSString *v4;
  NSString *valueText;

  if (self->_valueText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    valueText = self->_valueText;
    self->_valueText = v4;

    -[OfflineMapDeviceStateRowView _updateContent](self, "_updateContent");
  }
}

- (void)setTrailingAccessoryView:(id)a3
{
  UIView *v5;
  UIView **p_trailingAccessoryView;
  UIView *trailingAccessoryView;
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
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];

  v5 = (UIView *)a3;
  p_trailingAccessoryView = &self->_trailingAccessoryView;
  trailingAccessoryView = self->_trailingAccessoryView;
  if (trailingAccessoryView != v5)
  {
    -[UIView removeFromSuperview](trailingAccessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_trailingAccessoryView, a3);
    if (*p_trailingAccessoryView)
    {
      -[OfflineMapDeviceStateRowView addSubview:](self, "addSubview:");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceStateRowView trailingAnchor](self, "trailingAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](*p_trailingAccessoryView, "trailingAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, kMUPlacePlatterPadding));
      v21[0] = v18;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](*p_trailingAccessoryView, "leadingAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v8, 1.0));
      v21[1] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](*p_trailingAccessoryView, "leadingAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_valueLabel, "trailingAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v11, 1.0));
      v21[2] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](*p_trailingAccessoryView, "centerYAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceStateRowView centerYAnchor](self, "centerYAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
      v21[3] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    }
  }

}

- (void)_updateContent
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceStateRowView labelText](self, "labelText"));
  -[UILabel setText:](self->_titleLabel, "setText:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceStateRowView valueText](self, "valueText"));
  -[UILabel setText:](self->_valueLabel, "setText:", v4);

}

- (NSString)labelText
{
  return self->_labelText;
}

- (NSString)valueText
{
  return self->_valueText;
}

- (UIView)trailingAccessoryView
{
  return self->_trailingAccessoryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_valueText, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
