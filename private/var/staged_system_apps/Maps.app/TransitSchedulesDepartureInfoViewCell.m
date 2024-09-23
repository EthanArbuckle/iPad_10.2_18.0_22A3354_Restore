@implementation TransitSchedulesDepartureInfoViewCell

- (TransitSchedulesDepartureInfoViewCell)initWithFrame:(CGRect)a3
{
  TransitSchedulesDepartureInfoViewCell *v3;
  void *v4;
  void *v5;
  id v6;
  double y;
  double width;
  double height;
  UILabel *v10;
  UILabel *titleLabel;
  void *v12;
  UILabel *v13;
  UILabel *subtitleLabel;
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
  void *v39;
  objc_super v40;
  _QWORD v41[7];

  v40.receiver = self;
  v40.super_class = (Class)TransitSchedulesDepartureInfoViewCell;
  v3 = -[TransitSchedulesDepartureInfoViewCell initWithFrame:](&v40, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TransitSchedulesDepartureInfoViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoViewCell contentView](v3, "contentView"));
    v6 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UILabel *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v12);

    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v3->_titleLabel, &stru_1011E7AD8);
    objc_msgSend(v5, "addSubview:", v3->_titleLabel);
    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v15);

    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v3->_subtitleLabel, &stru_1011E7BF8);
    objc_msgSend(v5, "addSubview:", v3->_subtitleLabel);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_titleLabel, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 12.0));
    v41[0] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 16.0));
    v41[1] = v34;
    v32 = v5;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v31, -16.0));
    v41[2] = v30;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_subtitleLabel, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 5.0));
    v41[3] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_subtitleLabel, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v16, -12.0));
    v41[4] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_subtitleLabel, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v41[5] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_subtitleLabel, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    v41[6] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

  }
  return v3;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    title = self->_title;
    self->_title = v4;

    -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
  }

}

- (void)setContent:(id)a3
{
  NSString *v4;
  NSString *content;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_content, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    content = self->_content;
    self->_content = v4;

    -[UILabel setText:](self->_subtitleLabel, "setText:", self->_content);
  }

}

- (NSString)title
{
  return self->_title;
}

- (NSString)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
