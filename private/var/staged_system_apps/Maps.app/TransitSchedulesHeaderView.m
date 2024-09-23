@implementation TransitSchedulesHeaderView

- (TransitSchedulesHeaderView)initWithTransitLine:(id)a3
{
  id v4;
  TransitSchedulesHeaderView *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TransitSchedulesHeaderView;
  v5 = -[TransitSchedulesHeaderView initWithFrame:](&v10, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artwork"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "system"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));

    -[TransitSchedulesHeaderView createViewsWithTitle:subtitle:artwork:](v5, "createViewsWithTitle:subtitle:artwork:", v8, 0, v6);
  }

  return v5;
}

- (void)createViewsWithTitle:(id)a3 subtitle:(id)a4 artwork:(id)a5
{
  id v8;
  id v9;
  UILabel *v10;
  UILabel *titleLabel;
  void *v12;
  double v13;
  double v14;
  UILabel *v15;
  UILabel *subtitleLabel;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[8];

  v54 = a5;
  v8 = a4;
  v9 = a3;
  -[TransitSchedulesHeaderView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesHeaderView"));
  v10 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v10;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v12);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesHeaderViewTitleLabel"));
  LODWORD(v13) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  LODWORD(v14) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v14);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_titleLabel, &stru_1011E7B58);
  -[TransitSchedulesHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
  v15 = (UILabel *)objc_alloc_init((Class)UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v15;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_subtitleLabel, &stru_1011E7A78);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v17);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 2);
  -[UILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesHeaderViewSubtitleLabel"));
  LODWORD(v18) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v18);
  LODWORD(v19) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v19);
  -[TransitSchedulesHeaderView addSubview:](self, "addSubview:", self->_subtitleLabel);
  -[UILabel setText:](self->_titleLabel, "setText:", v9);

  -[UILabel setText:](self->_subtitleLabel, "setText:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 16.0));

  LODWORD(v24) = 1144733696;
  v53 = v23;
  objc_msgSend(v23, "setPriority:", v24);
  v55[0] = v23;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
  v55[1] = v49;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v45, &stru_1011E7B58, 36.0));
  v55[2] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v41, 0.0));
  v55[3] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v55[4] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v55[5] = v34;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_subtitleLabel, "firstBaselineAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v27, &stru_1011E7A78, 21.0));
  v55[6] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v31, 1.0));
  v55[7] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

  -[TransitSchedulesHeaderView setArtwork:](self, "setArtwork:", v54);
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:", a3);
}

- (void)setArtwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  UIImageView *lineImageryView;
  UIImageView *v11;
  UIImageView *v12;
  double v13;
  double v14;
  double v15;
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
  _QWORD v33[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKArtworkDataSourceCache sharedInstance](MKArtworkDataSourceCache, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "scale");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageForArtwork:size:featureType:scale:nightMode:", v4, 7, 2, -[TransitSchedulesHeaderView _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled"), v8));
  if (v9)
  {
    lineImageryView = self->_lineImageryView;
    if (lineImageryView)
    {
      -[UIImageView setImage:](lineImageryView, "setImage:", v9);
    }
    else
    {
      v11 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v9);
      v12 = self->_lineImageryView;
      self->_lineImageryView = v11;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_lineImageryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setContentMode:](self->_lineImageryView, "setContentMode:", 1);
      -[UIImageView setAccessibilityIdentifier:](self->_lineImageryView, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesHeaderViewLineImageryView"));
      LODWORD(v13) = 1144750080;
      -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_lineImageryView, "setContentCompressionResistancePriority:forAxis:", 1, v13);
      LODWORD(v14) = 1144750080;
      -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_lineImageryView, "setContentCompressionResistancePriority:forAxis:", 0, v14);
      LODWORD(v15) = 1144750080;
      -[UIImageView setContentHuggingPriority:forAxis:](self->_lineImageryView, "setContentHuggingPriority:forAxis:", 0, v15);
      -[TransitSchedulesHeaderView addSubview:](self, "addSubview:", self->_lineImageryView);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_lineImageryView, "leadingAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 16.0));
      v33[0] = v29;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_lineImageryView, "topAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v25, &stru_1011E7B58, 20.0));
      v33[1] = v24;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_lineImageryView, "bottomAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v18, 1.0));
      v33[2] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_lineImageryView, "trailingAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 10.0));
      v33[3] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineImageryView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
