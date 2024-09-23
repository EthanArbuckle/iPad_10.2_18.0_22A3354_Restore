@implementation OfflineMapDeviceExplanatoryRowView

- (OfflineMapDeviceExplanatoryRowView)initWithFrame:(CGRect)a3
{
  OfflineMapDeviceExplanatoryRowView *v3;
  OfflineMapDeviceExplanatoryRowView *v4;
  NSString *text;
  OfflineMapDeviceExplanatoryRowView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OfflineMapDeviceExplanatoryRowView;
  v3 = -[OfflineMapDeviceExplanatoryRowView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = v3;
  if (v3)
  {
    text = v3->_text;
    v3->_text = (NSString *)&stru_1011EB268;

    -[OfflineMapDeviceExplanatoryRowView _configureSubviews](v4, "_configureSubviews");
    v6 = v4;
  }

  return v4;
}

- (void)_configureSubviews
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *reasonLabel;
  void *v11;
  void *v12;
  double v13;
  double v14;
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
  NSArray *v25;
  NSArray *noValueConstraints;
  void *v27;
  void *v28;
  void *v29;
  NSArray *v30;
  NSArray *valueConstraints;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[6];

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleSubheadline, UIFontWeightMedium));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MAP_DETAILS_STATE_LABEL_WAITING"), CFSTR("localized string not found"), CFSTR("Offline")));
  -[UILabel setText:](self->_titleLabel, "setText:", v8);

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("RowLabel"));
  -[OfflineMapDeviceExplanatoryRowView addSubview:](self, "addSubview:", self->_titleLabel);
  v9 = (UILabel *)objc_alloc_init((Class)UILabel);
  reasonLabel = self->_reasonLabel;
  self->_reasonLabel = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  -[UILabel setFont:](self->_reasonLabel, "setFont:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_reasonLabel, "setTextColor:", v12);

  -[UILabel setNumberOfLines:](self->_reasonLabel, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_reasonLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_reasonLabel, "setAccessibilityIdentifier:", CFSTR("RowValue"));
  -[UILabel setHidden:](self->_reasonLabel, "setHidden:", 1);
  -[OfflineMapDeviceExplanatoryRowView addSubview:](self, "addSubview:", self->_reasonLabel);
  LODWORD(v13) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_reasonLabel, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceExplanatoryRowView leadingAnchor](self, "leadingAnchor"));
  v14 = kMUPlacePlatterPadding;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, kMUPlacePlatterPadding));
  v46[0] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceExplanatoryRowView topAnchor](self, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 12.0));
  v46[1] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceExplanatoryRowView trailingAnchor](self, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, -v14));
  v46[2] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_reasonLabel, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceExplanatoryRowView leadingAnchor](self, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, v14));
  v46[3] = v32;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_reasonLabel, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 2.0));
  v46[4] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_reasonLabel, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceExplanatoryRowView trailingAnchor](self, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -v14));
  v46[5] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceExplanatoryRowView bottomAnchor](self, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -12.0));
  v45 = v24;
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  noValueConstraints = self->_noValueConstraints;
  self->_noValueConstraints = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_reasonLabel, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceExplanatoryRowView bottomAnchor](self, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -12.0));
  v44 = v29;
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
  valueConstraints = self->_valueConstraints;
  self->_valueConstraints = v30;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_noValueConstraints);
}

- (void)setText:(id)a3
{
  unsigned int v4;
  NSString *v5;
  NSString *text;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqualToString:", self->_text) & 1) == 0)
  {
    v4 = -[UILabel isHidden](self->_reasonLabel, "isHidden");
    v5 = (NSString *)objc_msgSend(v9, "copy");
    text = self->_text;
    self->_text = v5;

    -[UILabel setText:](self->_reasonLabel, "setText:", self->_text);
    -[UILabel setHidden:](self->_reasonLabel, "setHidden:", -[NSString length](self->_text, "length") == 0);
    if (v4 != -[UILabel isHidden](self->_reasonLabel, "isHidden"))
    {
      if (v4)
        v7 = 3;
      else
        v7 = 4;
      if (v4)
        v8 = 4;
      else
        v8 = 3;
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *(_QWORD *)&self->MKViewWithHairline_opaque[OBJC_IVAR___OfflineMapDeviceExplanatoryRowView__text[v7]]);
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(_QWORD *)&self->MKViewWithHairline_opaque[OBJC_IVAR___OfflineMapDeviceExplanatoryRowView__text[v8]]);
    }
  }

}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_valueConstraints, 0);
  objc_storeStrong((id *)&self->_noValueConstraints, 0);
  objc_storeStrong((id *)&self->_reasonLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
