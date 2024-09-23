@implementation VehicleAppCell

- (VehicleAppCell)init
{
  return -[VehicleAppCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, 0);
}

- (VehicleAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  VehicleAppCell *v4;
  VehicleAppCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VehicleAppCell;
  v4 = -[VehicleAppCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", 0, a4);
  v5 = v4;
  if (v4)
  {
    -[VehicleAppCell _commonInit](v4, "_commonInit");
    -[VehicleAppCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("VehicleAppCell"));
  }
  return v5;
}

- (void)_commonInit
{
  UIImageView *v3;
  UIImageView *appIconView;
  UILabel *v5;
  UILabel *appNameLabel;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *appDescriptionLabel;
  void *v11;
  void *v12;
  UIButton *v13;
  UIButton *openButton;
  UIButton *v15;
  void *v16;
  void *v17;
  UIButton *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[12];

  v3 = objc_opt_new(UIImageView);
  appIconView = self->_appIconView;
  self->_appIconView = v3;

  -[UIImageView setAccessibilityIdentifier:](self->_appIconView, "setAccessibilityIdentifier:", CFSTR("AppIconView"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_appIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = objc_opt_new(UILabel);
  appNameLabel = self->_appNameLabel;
  self->_appNameLabel = v5;

  -[UILabel setAccessibilityIdentifier:](self->_appNameLabel, "setAccessibilityIdentifier:", CFSTR("AppNameLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_appNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_appNameLabel, "setTextColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_appNameLabel, "setFont:", v8);

  v9 = objc_opt_new(UILabel);
  appDescriptionLabel = self->_appDescriptionLabel;
  self->_appDescriptionLabel = v9;

  -[UILabel setAccessibilityIdentifier:](self->_appDescriptionLabel, "setAccessibilityIdentifier:", CFSTR("AppDescriptionLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_appDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_appDescriptionLabel, "setTextColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  -[UILabel setFont:](self->_appDescriptionLabel, "setFont:", v12);

  v13 = objc_opt_new(UIButton);
  openButton = self->_openButton;
  self->_openButton = v13;

  -[UIButton setAccessibilityIdentifier:](self->_openButton, "setAccessibilityIdentifier:", CFSTR("OpenButton"));
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_openButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = self->_openButton;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Open App"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v15, "setTitle:forState:", v17, 0);

  v18 = self->_openButton;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIButton setTitleColor:forState:](v18, "setTitleColor:forState:", v19, 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_openButton, "titleLabel"));
  objc_msgSend(v21, "setFont:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  -[UIButton setBackgroundColor:](self->_openButton, "setBackgroundColor:", v22);

  -[UIButton setContentEdgeInsets:](self->_openButton, "setContentEdgeInsets:", 10.0, 12.0, 10.0, 12.0);
  LODWORD(v23) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_openButton, "setContentCompressionResistancePriority:forAxis:", 0, v23);
  LODWORD(v24) = 1148846080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_openButton, "setContentHuggingPriority:forAxis:", 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell contentView](self, "contentView"));
  objc_msgSend(v25, "addSubview:", self->_appIconView);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell contentView](self, "contentView"));
  objc_msgSend(v26, "addSubview:", self->_appNameLabel);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell contentView](self, "contentView"));
  objc_msgSend(v27, "addSubview:", self->_appDescriptionLabel);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell contentView](self, "contentView"));
  objc_msgSend(v28, "addSubview:", self->_openButton);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_appIconView, "leadingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell contentView](self, "contentView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "leadingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, 16.0));
  v69[0] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_appIconView, "widthAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToConstant:", 62.0));
  v69[1] = v63;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_appIconView, "centerYAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell contentView](self, "contentView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "centerYAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
  v69[2] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_appIconView, "heightAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToConstant:", 62.0));
  v69[3] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_appNameLabel, "leadingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_appIconView, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 10.0));
  v69[4] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_appNameLabel, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_openButton, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, -10.0));
  v69[5] = v51;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_appNameLabel, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell contentView](self, "contentView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 30.0));
  v69[6] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_appDescriptionLabel, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_appIconView, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 10.0));
  v69[7] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_appDescriptionLabel, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_openButton, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -10.0));
  v69[8] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_appDescriptionLabel, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_appNameLabel, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 3.0));
  v69[9] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_openButton, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell contentView](self, "contentView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, -16.0));
  v69[10] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_openButton, "centerYAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell contentView](self, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "centerYAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));
  v69[11] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 12));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v38);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VehicleAppCell;
  -[VehicleAppCell layoutSubviews](&v7, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell openButton](self, "openButton"));
  objc_msgSend(v3, "frame");
  v5 = v4 * 0.5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell openButton](self, "openButton"));
  objc_msgSend(v6, "_setContinuousCornerRadius:", v5);

}

- (void)setApplicationRecord:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  LSApplicationRecord *v14;

  v14 = (LSApplicationRecord *)a3;
  if (self->_applicationRecord != v14)
  {
    objc_storeStrong((id *)&self->_applicationRecord, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord bundleIdentifier](v14, "bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v6, "scale");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v5, 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell appIconView](self, "appIconView"));
    objc_msgSend(v8, "setImage:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord localizedName](v14, "localizedName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell appNameLabel](self, "appNameLabel"));
    objc_msgSend(v10, "setText:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](v14, "iTunesMetadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "genre"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell appDescriptionLabel](self, "appDescriptionLabel"));
    objc_msgSend(v13, "setText:", v12);

  }
}

- (double)cellHeightWithWidth:(double)a3
{
  return 98.0;
}

- (LSApplicationRecord)applicationRecord
{
  return self->_applicationRecord;
}

- (UIButton)openButton
{
  return self->_openButton;
}

- (UIImageView)appIconView
{
  return self->_appIconView;
}

- (void)setAppIconView:(id)a3
{
  objc_storeStrong((id *)&self->_appIconView, a3);
}

- (UILabel)appNameLabel
{
  return self->_appNameLabel;
}

- (void)setAppNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_appNameLabel, a3);
}

- (UILabel)appDescriptionLabel
{
  return self->_appDescriptionLabel;
}

- (void)setAppDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_appDescriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_appNameLabel, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_openButton, 0);
  objc_storeStrong((id *)&self->_applicationRecord, 0);
}

@end
