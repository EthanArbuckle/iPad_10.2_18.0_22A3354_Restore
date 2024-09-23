@implementation FeedbackHeaderView

- (FeedbackHeaderView)init
{
  FeedbackHeaderView *v2;
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *titleLabel;
  void *v9;
  UILabel *v10;
  UILabel *subtitleLabel;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;
  _QWORD v44[7];

  v43.receiver = self;
  v43.super_class = (Class)FeedbackHeaderView;
  v2 = -[FeedbackHeaderView init](&v43, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v2->_titleLabel, "setTextColor:", v9);

    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v2->_titleLabel, &stru_1011E8910);
    -[FeedbackHeaderView addSubview:](v2, "addSubview:", v2->_titleLabel);
    v10 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v2->_subtitleLabel;
    v2->_subtitleLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v2->_subtitleLabel, "setTextColor:", v12);

    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v2->_subtitleLabel, &stru_1011E88F0);
    -[FeedbackHeaderView addSubview:](v2, "addSubview:", v2->_subtitleLabel);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackHeaderView titleLabel](v2, "titleLabel"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackHeaderView leadingAnchor](v2, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v44[0] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackHeaderView titleLabel](v2, "titleLabel"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackHeaderView trailingAnchor](v2, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    v44[1] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v2->_titleLabel, "firstBaselineAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackHeaderView topAnchor](v2, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v32, &stru_1011E8910, 35.0));
    v44[2] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackHeaderView subtitleLabel](v2, "subtitleLabel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackHeaderView leadingAnchor](v2, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
    v44[3] = v27;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackHeaderView trailingAnchor](v2, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackHeaderView subtitleLabel](v2, "subtitleLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v24));
    v44[4] = v23;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v2->_subtitleLabel, "firstBaselineAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v2->_titleLabel, "lastBaselineAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v15, &stru_1011E88F0, 21.0));
    v44[5] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackHeaderView bottomAnchor](v2, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackHeaderView subtitleLabel](v2, "subtitleLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstBaselineAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 22.0));
    v44[6] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  }
  return v2;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

  -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v4;

  -[UILabel setText:](self->_subtitleLabel, "setText:", self->_subtitle);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
