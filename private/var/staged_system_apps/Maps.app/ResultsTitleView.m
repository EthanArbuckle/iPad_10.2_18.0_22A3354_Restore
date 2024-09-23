@implementation ResultsTitleView

- (ResultsTitleView)initWithFrame:(CGRect)a3
{
  ResultsTitleView *v3;
  ResultsTitleView *v4;
  MapsThemeButton *v5;
  MapsThemeButton *editSearchButton;
  MapsThemeButton *v7;
  void *v8;
  void *v9;
  MapsThemeLabel *v10;
  MapsThemeLabel *titleLabel;
  void *v12;
  void *v13;
  MapsThemeLabel *v14;
  MapsThemeLabel *subtitleLabel;
  void *v16;
  void *v17;
  UIImageView *v18;
  UIImageView *headerImageView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *singleLineEditSearchConstraints;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSArray *multipleLineEditSearchConstraints;
  void *v42;
  void *v43;
  double v44;
  uint64_t v45;
  NSLayoutConstraint *topLabelCenterYConstraint;
  void *v47;
  void *v48;
  uint64_t v49;
  NSLayoutConstraint *subTitleTrailingConstraint;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSArray *titleHeaderConstraints;
  id v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSArray *imageHeaderConstraints;
  void *v76;
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
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  objc_super v124;
  _QWORD v125[14];
  _QWORD v126[7];
  _QWORD v127[4];
  _QWORD v128[3];

  v124.receiver = self;
  v124.super_class = (Class)ResultsTitleView;
  v3 = -[ResultsTitleView initWithFrame:](&v124, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ResultsTitleView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("ResultsTitleView"));
    v5 = -[MapsThemeButton initWithFrame:]([MapsThemeButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    editSearchButton = v4->_editSearchButton;
    v4->_editSearchButton = v5;

    -[MapsThemeButton setAccessibilityIdentifier:](v4->_editSearchButton, "setAccessibilityIdentifier:", CFSTR("EditSearchButton"));
    -[MapsThemeButton setTitleColorProvider:](v4->_editSearchButton, "setTitleColorProvider:", &stru_1011BE7C0);
    -[MapsThemeButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_editSearchButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsThemeButton setContentHorizontalAlignment:](v4->_editSearchButton, "setContentHorizontalAlignment:", 4);
    -[MapsThemeButton addTarget:action:forControlEvents:](v4->_editSearchButton, "addTarget:action:forControlEvents:", v4, "didTapEditButton:", 64);
    v7 = v4->_editSearchButton;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Edit Search"), CFSTR("localized string not found"), 0));
    -[MapsThemeButton setTitle:forState:](v7, "setTitle:forState:", v9, 0);

    v10 = objc_alloc_init(MapsThemeLabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;

    -[MapsThemeLabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MapsThemeLabel setBackgroundColor:](v4->_titleLabel, "setBackgroundColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[MapsThemeLabel setTextColor:](v4->_titleLabel, "setTextColor:", v13);

    v14 = objc_alloc_init(MapsThemeLabel);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v14;

    -[MapsThemeLabel setAccessibilityIdentifier:](v4->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));
    -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MapsThemeLabel setBackgroundColor:](v4->_subtitleLabel, "setBackgroundColor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[MapsThemeLabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v17);

    v18 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    headerImageView = v4->_headerImageView;
    v4->_headerImageView = v18;

    -[UIImageView setAccessibilityIdentifier:](v4->_headerImageView, "setAccessibilityIdentifier:", CFSTR("HeaderImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_headerImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ResultsTitleView updateLabelFonts](v4, "updateLabelFonts");
    -[ResultsTitleView updateTitleNumberOfLines](v4, "updateTitleNumberOfLines");
    -[ResultsTitleView addSubview:](v4, "addSubview:", v4->_titleLabel);
    -[ResultsTitleView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
    -[ResultsTitleView addSubview:](v4, "addSubview:", v4->_editSearchButton);
    -[ResultsTitleView addSubview:](v4, "addSubview:", v4->_headerImageView);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton leadingAnchor](v4->_editSearchButton, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v4->_subtitleLabel, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    v128[0] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton firstBaselineAnchor](v4->_editSearchButton, "firstBaselineAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel firstBaselineAnchor](v4->_subtitleLabel, "firstBaselineAnchor"));
    LODWORD(v25) = 1148846080;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:priority:", v24, 0.0, v25));
    v128[1] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView heightAnchor](v4, "heightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintGreaterThanOrEqualToConstant:", 82.0));
    v128[2] = v28;
    v29 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v128, 3));
    singleLineEditSearchConstraints = v4->_singleLineEditSearchConstraints;
    v4->_singleLineEditSearchConstraints = (NSArray *)v29;

    v120 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton leadingAnchor](v4->_editSearchButton, "leadingAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v4->_subtitleLabel, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:", v117));
    v127[0] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton topAnchor](v4->_editSearchButton, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v4->_subtitleLabel, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 1.5));
    v127[1] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v4->_subtitleLabel, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView trailingAnchor](v4, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
    v127[2] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView heightAnchor](v4, "heightAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintGreaterThanOrEqualToConstant:", 170.0));
    v127[3] = v39;
    v40 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v127, 4));
    multipleLineEditSearchConstraints = v4->_multipleLineEditSearchConstraints;
    v4->_multipleLineEditSearchConstraints = (NSArray *)v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](v4->_titleLabel, "centerYAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView centerYAnchor](v4, "centerYAnchor"));
    LODWORD(v44) = 1144750080;
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:priority:", v43, 0.0, v44));
    topLabelCenterYConstraint = v4->_topLabelCenterYConstraint;
    v4->_topLabelCenterYConstraint = (NSLayoutConstraint *)v45;

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v4->_subtitleLabel, "trailingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView trailingAnchor](v4, "trailingAnchor"));
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v48));
    subTitleTrailingConstraint = v4->_subTitleTrailingConstraint;
    v4->_subTitleTrailingConstraint = (NSLayoutConstraint *)v49;

    v121 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView leadingAnchor](v4, "leadingAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:constant:", v118, 16.0));
    v126[0] = v115;
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView trailingAnchor](v4, "trailingAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:constant:", v111, 0.0));
    v126[1] = v109;
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v4->_titleLabel, "topAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView topAnchor](v4, "topAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:constant:", v105, 16.0));
    v126[2] = v103;
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v4->_subtitleLabel, "leadingAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:", v99));
    v126[3] = v97;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v4->_subtitleLabel, "topAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v4->_titleLabel, "bottomAnchor"));
    LODWORD(v53) = 1148846080;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:priority:", v52, 1.5, v53));
    v126[4] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton trailingAnchor](v4->_editSearchButton, "trailingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView trailingAnchor](v4, "trailingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintLessThanOrEqualToAnchor:", v56));
    v126[5] = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView bottomAnchor](v4, "bottomAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton lastBaselineAnchor](v4->_editSearchButton, "lastBaselineAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 24.0));
    v126[6] = v60;
    v61 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v126, 7));
    titleHeaderConstraints = v4->_titleHeaderConstraints;
    v4->_titleHeaderConstraints = (NSArray *)v61;

    v63 = objc_alloc_init((Class)UILayoutGuide);
    -[ResultsTitleView addLayoutGuide:](v4, "addLayoutGuide:", v63);
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "topAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v4->_titleLabel, "topAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:", v119));
    v125[0] = v116;
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "bottomAnchor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v4->_subtitleLabel, "bottomAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:", v112));
    v125[1] = v108;
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView leadingAnchor](v4, "leadingAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:constant:", v104, 16.0));
    v125[2] = v102;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_headerImageView, "leadingAnchor"));
    v110 = v63;
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v98));
    v125[3] = v96;
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v4->_headerImageView, "centerYAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "centerYAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:", v94));
    v125[4] = v93;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v4->_headerImageView, "widthAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToConstant:", 30.0));
    v125[5] = v91;
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v4->_headerImageView, "heightAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToConstant:", 30.0));
    v125[6] = v89;
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v4->_headerImageView, "trailingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:constant:", v123, 10.0));
    v125[7] = v87;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView trailingAnchor](v4, "trailingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v85));
    v125[8] = v84;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v4->_titleLabel, "topAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView topAnchor](v4, "topAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:constant:", v82, 16.0));
    v125[9] = v81;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v4->_subtitleLabel, "leadingAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v79));
    v125[10] = v78;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v4->_subtitleLabel, "topAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v4->_titleLabel, "bottomAnchor"));
    LODWORD(v66) = 1148846080;
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:priority:", v65, 1.5, v66));
    v125[11] = v67;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton trailingAnchor](v4->_editSearchButton, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView trailingAnchor](v4, "trailingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintLessThanOrEqualToAnchor:", v69));
    v125[12] = v70;
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView bottomAnchor](v4, "bottomAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton lastBaselineAnchor](v4->_editSearchButton, "lastBaselineAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, 24.0));
    v125[13] = v73;
    v74 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v125, 14));
    imageHeaderConstraints = v4->_imageHeaderConstraints;
    v4->_imageHeaderConstraints = (NSArray *)v74;

    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v76, "addObserver:selector:name:object:", v4, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  -[ResultsTitleView updateHeaderContent](v4, "updateHeaderContent");
  return v4;
}

- (void)setHeaderImage:(id)a3
{
  objc_storeStrong((id *)&self->_headerImage, a3);
  -[ResultsTitleView updateHeaderContent](self, "updateHeaderContent");
}

- (id)effectiveTraitCollectionWithTraitCollection:(id)a3
{
  return objc_msgSend(a3, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, UIContentSizeCategoryAccessibilityLarge);
}

- (id)subtitlefontWithTraitCollection:(id)a3
{
  return +[UIFont system15CompatibleWithTraitCollection:](UIFont, "system15CompatibleWithTraitCollection:", a3);
}

- (id)titlefontWithTraitCollection:(id)a3
{
  return +[UIFont system22SemiboldCompatibleWithTraitCollection:](UIFont, "system22SemiboldCompatibleWithTraitCollection:", a3);
}

- (void)updateHeaderContent
{
  void *v3;
  void *v4;
  int *v5;
  UIImageView **p_headerImageView;
  int *v7;

  -[ResultsTitleView updateLabelFonts](self, "updateLabelFonts");
  -[ResultsTitleView updateTitleNumberOfLines](self, "updateTitleNumberOfLines");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView headerImage](self, "headerImage"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView headerImage](self, "headerImage"));
    v5 = &OBJC_IVAR___ResultsTitleView__titleHeaderConstraints;
    p_headerImageView = &self->_headerImageView;
    -[UIImageView setImage:](self->_headerImageView, "setImage:", v4);

    v7 = &OBJC_IVAR___ResultsTitleView__imageHeaderConstraints;
  }
  else
  {
    v7 = &OBJC_IVAR___ResultsTitleView__titleHeaderConstraints;
    v5 = &OBJC_IVAR___ResultsTitleView__imageHeaderConstraints;
    p_headerImageView = &self->_headerImageView;
  }
  -[UIImageView setHidden:](*p_headerImageView, "setHidden:", v3 == 0);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v7));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v5));
  -[MapsThemeButton setHidden:](self->_editSearchButton, "setHidden:", self->_editButtonHidden);
  -[NSLayoutConstraint setActive:](self->_subTitleTrailingConstraint, "setActive:", self->_editButtonHidden);
  -[ResultsTitleView updateEditSearchButtonConstraints](self, "updateEditSearchButtonConstraints");
}

- (void)updateLabelFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView traitCollection](self, "traitCollection"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ResultsTitleView effectiveTraitCollectionWithTraitCollection:](self, "effectiveTraitCollectionWithTraitCollection:", v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView titlefontWithTraitCollection:](self, "titlefontWithTraitCollection:", v7));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView subtitlefontWithTraitCollection:](self, "subtitlefontWithTraitCollection:", v7));
  -[MapsThemeLabel setFont:](self->_titleLabel, "setFont:", v4);
  -[MapsThemeLabel setFont:](self->_subtitleLabel, "setFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](self->_editSearchButton, "titleLabel"));
  objc_msgSend(v6, "setFont:", v5);

}

- (void)updateEditSearchButtonConstraints
{
  int *v3;
  int *v4;

  v3 = &OBJC_IVAR___ResultsTitleView__singleLineEditSearchConstraints;
  if (-[ResultsTitleView editSearchButtonWillTruncate](self, "editSearchButtonWillTruncate")
    && +[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled"))
  {
    v4 = &OBJC_IVAR___ResultsTitleView__singleLineEditSearchConstraints;
    v3 = &OBJC_IVAR___ResultsTitleView__multipleLineEditSearchConstraints;
  }
  else
  {
    v4 = &OBJC_IVAR___ResultsTitleView__multipleLineEditSearchConstraints;
  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v3));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v4));
}

- (BOOL)editSearchButtonWillTruncate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  NSAttributedStringKey v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel text](self->_subtitleLabel, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](self->_editSearchButton, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v3, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView traitCollection](self, "traitCollection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView effectiveTraitCollectionWithTraitCollection:](self, "effectiveTraitCollectionWithTraitCollection:", v7));

  v26 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView subtitlefontWithTraitCollection:](self, "subtitlefontWithTraitCollection:", v8));
  v27 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
  objc_msgSend(v6, "sizeWithAttributes:", v10);
  v12 = v11;

  -[ResultsTitleView frame](self, "frame");
  v14 = v13;
  -[ResultsTitleView layoutMargins](self, "layoutMargins");
  v16 = v14 - v15;
  -[ResultsTitleView layoutMargins](self, "layoutMargins");
  v18 = 0.0;
  if (v16 - v17 >= 0.0)
  {
    -[ResultsTitleView frame](self, "frame", 0.0, v16 - v17);
    v20 = v19;
    -[ResultsTitleView layoutMargins](self, "layoutMargins");
    v22 = v20 - v21;
    -[ResultsTitleView layoutMargins](self, "layoutMargins");
    v18 = v22 - v23;
  }
  v24 = ceil(v12) > v18;

  return v24;
}

- (void)updateTitleNumberOfLines
{
  uint64_t v3;

  if (+[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled"))
    v3 = 2;
  else
    v3 = 1;
  -[MapsThemeLabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v3);
  -[MapsThemeLabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", v3);
}

- (void)didTapEditButton:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "currentUITargetForAnalytics");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsTitleView delegate](self, "delegate"));
    v7 = objc_msgSend(v6, "currentUITargetForAnalytics");

  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 2033, v7, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "editSearchButtonTapped");

}

- (NSString)title
{
  return (NSString *)-[MapsThemeLabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[MapsThemeLabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)subtitle
{
  return (NSString *)-[MapsThemeLabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  -[MapsThemeLabel setText:](self->_subtitleLabel, "setText:", a3);
}

- (void)centerTitleVertically:(BOOL)a3
{
  -[NSLayoutConstraint setActive:](self->_topLabelCenterYConstraint, "setActive:", a3);
}

- (void)setEditButtonHidden:(BOOL)a3
{
  self->_editButtonHidden = a3;
  -[MapsThemeButton setHidden:](self->_editSearchButton, "setHidden:");
}

- (ResultsTitleViewDelegate)delegate
{
  return (ResultsTitleViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (BOOL)editButtonHidden
{
  return self->_editButtonHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_imageHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_multipleLineEditSearchConstraints, 0);
  objc_storeStrong((id *)&self->_singleLineEditSearchConstraints, 0);
  objc_storeStrong((id *)&self->_subTitleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_editSearchButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
