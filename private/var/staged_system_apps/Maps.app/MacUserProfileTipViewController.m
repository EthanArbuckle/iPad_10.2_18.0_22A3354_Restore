@implementation MacUserProfileTipViewController

- (MacUserProfileTipViewController)initWithUserProfileLinkType:(int64_t)a3
{
  MacUserProfileTipViewController *v4;
  MacUserProfileTipViewController *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  NSString *linkTypeStringSingular;
  uint64_t v18;
  NSString *mapsHomeSectionTitlePlural;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MacUserProfileTipViewController;
  v4 = -[MacUserProfileTipViewController initWithNibName:bundle:](&v21, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[MacUserProfileTipViewController setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v5->_userProfileLinkType = a3;
    if (a3 == 2)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[User Profile Mac Tooltip - Guides] guide"), CFSTR("localized string not found"), 0));
      linkTypeStringSingular = v5->_linkTypeStringSingular;
      v5->_linkTypeStringSingular = (NSString *)v16;

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("[User Profile Mac Tooltip - Guides]");
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[User Profile Mac Tooltip - Favorites] favorite"), CFSTR("localized string not found"), 0));
      v11 = v5->_linkTypeStringSingular;
      v5->_linkTypeStringSingular = (NSString *)v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("[User Profile Mac Tooltip - Favorites]");
LABEL_6:
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, CFSTR("localized string not found"), 0));
      mapsHomeSectionTitlePlural = v5->_mapsHomeSectionTitlePlural;
      v5->_mapsHomeSectionTitlePlural = (NSString *)v18;

    }
  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  double y;
  double width;
  double height;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *addLabel;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UILabel *v27;
  UILabel *editLabel;
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
  double v46;
  double v47;
  double v48;
  double v49;
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
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSString *v90;
  objc_super v91;
  _QWORD v92[10];

  v91.receiver = self;
  v91.super_class = (Class)MacUserProfileTipViewController;
  -[MacUserProfileTipViewController viewDidLoad](&v91, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("MacUserProfileTipView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  objc_msgSend(v4, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);

  v5 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = (UILabel *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[User Profile Mac Tooltip] Manage <Favorites or Guides>"), CFSTR("localized string not found"), 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, self->_mapsHomeSectionTitlePlural));
  -[UILabel setText:](self->_titleLabel, "setText:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20Bold](UIFont, "system20Bold"));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  objc_msgSend(v15, "addSubview:", self->_titleLabel);

  v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  addLabel = self->_addLabel;
  self->_addLabel = v16;

  -[UILabel setAccessibilityIdentifier:](self->_addLabel, "setAccessibilityIdentifier:", CFSTR("AddLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_addLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_addLabel, "setNumberOfLines:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_addLabel, "setTextColor:", v18);

  if (self->_userProfileLinkType == 2)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("[User Profile Mac Tooltip] My Guides"), CFSTR("localized string not found"), 0));

  }
  else
  {
    v20 = self->_mapsHomeSectionTitlePlural;
  }
  v90 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("[User Profile Mac Tooltip] To add a <favorite or guide>, hold the pointer and click <plus SF Symbol>"), CFSTR("localized string not found"), 0));
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, self->_linkTypeStringSingular, v20));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.circle.fill")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController _setupTextString:withImage:](self, "_setupTextString:withImage:", v89, v23));
  -[UILabel setAttributedText:](self->_addLabel, "setAttributedText:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_addLabel, "setFont:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  objc_msgSend(v26, "addSubview:", self->_addLabel);

  v27 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  editLabel = self->_editLabel;
  self->_editLabel = v27;

  -[UILabel setAccessibilityIdentifier:](self->_editLabel, "setAccessibilityIdentifier:", CFSTR("EditLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_editLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_editLabel, "setNumberOfLines:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_editLabel, "setTextColor:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("[User Profile Mac Tooltip] To edit or remove a <favorite or guide>, hold the pointer over it and click <chevron SF Symbol>"), CFSTR("localized string not found"), 0));
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, self->_linkTypeStringSingular));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("info.circle.fill")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController _setupTextString:withImage:](self, "_setupTextString:withImage:", v88, v32));
  -[UILabel setAttributedText:](self->_editLabel, "setAttributedText:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_editLabel, "setFont:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  objc_msgSend(v35, "addSubview:", self->_editLabel);

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "layoutMarginsGuide"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v84));
  v92[0] = v83;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "layoutMarginsGuide"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "trailingAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v79));
  v92[1] = v78;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_addLabel, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "layoutMarginsGuide"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "leadingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v74));
  v92[2] = v73;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_addLabel, "trailingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "layoutMarginsGuide"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v69));
  v92[3] = v68;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_editLabel, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "layoutMarginsGuide"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v64));
  v92[4] = v63;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_editLabel, "trailingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "layoutMarginsGuide"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v59));
  v92[5] = v58;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "layoutMarginsGuide"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v54));
  v92[6] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_addLabel, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 6.0));
  v92[7] = v50;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_editLabel, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_addLabel, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 16.0));
  v92[8] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_editLabel, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "layoutMarginsGuide"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v42));
  v92[9] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v92, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController view](self, "view"));
  objc_msgSend(v45, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v47 = v46;
  v49 = v48;

  -[MacUserProfileTipViewController setPreferredContentSize:](self, "setPreferredContentSize:", v47, v49);
}

- (id)_setupTextString:(id)a3 withImage:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "imageWithRenderingMode:", 2));
  v7 = objc_alloc_init((Class)NSTextAttachment);
  objc_msgSend(v7, "setImage:", v6);
  v8 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v5, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v7));
  objc_msgSend(v8, "appendAttributedString:", v9);

  return v8;
}

- (int64_t)userProfileLinkType
{
  return self->_userProfileLinkType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkTypeStringSingular, 0);
  objc_storeStrong((id *)&self->_mapsHomeSectionTitlePlural, 0);
  objc_storeStrong((id *)&self->_editLabel, 0);
  objc_storeStrong((id *)&self->_addLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
