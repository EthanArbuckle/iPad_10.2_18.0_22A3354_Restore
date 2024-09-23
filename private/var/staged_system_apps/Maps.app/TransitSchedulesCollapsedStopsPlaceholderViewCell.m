@implementation TransitSchedulesCollapsedStopsPlaceholderViewCell

- (TransitSchedulesCollapsedStopsPlaceholderViewCell)initWithFrame:(CGRect)a3
{
  TransitSchedulesCollapsedStopsPlaceholderViewCell *v3;
  TransitSchedulesCollapsedStopsPlaceholderViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitSchedulesCollapsedStopsPlaceholderViewCell;
  v3 = -[TransitSchedulesCollapsedStopsPlaceholderViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TransitSchedulesCollapsedStopsPlaceholderViewCell createSubviews](v3, "createSubviews");
  return v4;
}

- (void)createSubviews
{
  void *v3;
  void *v4;
  id v5;
  TransitDirectionsColoredLine *v6;
  void *v7;
  void *v8;
  MapsThemeLabel *v9;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  TransitDirectionsColoredLine *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[12];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesCollapsedStopsPlaceholderViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesCollapsedStopsPlaceholderViewCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[TransitSchedulesCollapsedStopsPlaceholderViewCell setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = objc_alloc_init((Class)UIView);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v5);
  v6 = -[TransitDirectionsColoredLine initWithStyle:]([TransitDirectionsColoredLine alloc], "initWithStyle:", 3);
  -[TransitDirectionsColoredLine setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesCollapsedStopsPlaceholderViewCell theme](self, "theme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitSchedulesPastStopLinkColor"));
  -[TransitDirectionsColoredLine setLineColor:](v6, "setLineColor:", v8);

  objc_msgSend(v5, "addSubview:", v6);
  v9 = objc_alloc_init(MapsThemeLabel);
  -[TransitSchedulesCollapsedStopsPlaceholderViewCell setPrimaryTextLabel:](self, "setPrimaryTextLabel:", v9);
  -[MapsThemeLabel setNumberOfLines:](v9, "setNumberOfLines:", 2);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesCollapsedStopsPlaceholderViewCell theme](self, "theme"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transitSchedulesPastStopTextColor"));
  -[MapsThemeLabel setTextColor:](v9, "setTextColor:", v11);

  -[MapsThemeLabel setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesCollapsedStopsPlaceholderViewCellPrimaryTextLabel"));
  objc_msgSend(v3, "addSubview:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesCollapsedStopsPlaceholderViewCell primaryTextLabel](self, "primaryTextLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v12, &stru_1011E7A38);

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v51[0] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v51[1] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 16.0));
  v51[2] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widthAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToConstant:", 24.0));
  v51[3] = v40;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine topAnchor](v6, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v51[4] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine bottomAnchor](v6, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v51[5] = v32;
  v39 = v6;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine centerXAnchor](v6, "centerXAnchor"));
  v33 = v5;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v51[6] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine widthAnchor](v6, "widthAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToConstant:", 4.0));
  v51[7] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v9, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 5.0));
  v51[8] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v9, "bottomAnchor"));
  v31 = v3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v13, -8.0));
  v51[9] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v9, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 8.0));
  v51[10] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v9, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -8.0));
  v51[11] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 12));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (void)setPlaceholderText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesCollapsedStopsPlaceholderViewCell primaryTextLabel](self, "primaryTextLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)placeholderText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesCollapsedStopsPlaceholderViewCell primaryTextLabel](self, "primaryTextLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (MapsThemeLabel)primaryTextLabel
{
  return self->_primaryTextLabel;
}

- (void)setPrimaryTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
}

@end
