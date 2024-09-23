@implementation ExtensionFlowHeaderView

- (ExtensionFlowHeaderView)initWithFrame:(CGRect)a3
{
  ExtensionFlowHeaderView *v3;
  ExtensionFlowHeaderView *v4;
  UIImageView *v5;
  UIImageView *iconImageView;
  UIImageView *v7;
  UIImageView *bannerImageView;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *detailLabel;
  void *v15;
  void *v16;
  CardButton *v17;
  void *v18;
  CardButton *v19;
  CardButton *dismissButtonX;
  uint64_t v21;
  UIButton *dismissButtonDone;
  void *v23;
  id v24;
  double v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _QWORD v45[2];
  _BYTE v46[128];

  v44.receiver = self;
  v44.super_class = (Class)ExtensionFlowHeaderView;
  v3 = -[ExtensionFlowHeaderView initWithFrame:](&v44, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ExtensionFlowHeaderView setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
    v4->_dismissButtonType = 0;
    v5 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v5;

    v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    bannerImageView = v4->_bannerImageView;
    v4->_bannerImageView = v7;

    -[UIImageView setContentMode:](v4->_bannerImageView, "setContentMode:", 1);
    v9 = objc_opt_new(UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightMedium));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v12);

    v13 = objc_opt_new(UILabel);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 14.0, UIFontWeightRegular));
    -[UILabel setFont:](v4->_detailLabel, "setFont:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_detailLabel, "setTextColor:", v16);

    v17 = [CardButton alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration close](CardButtonConfiguration, "close"));
    v19 = -[CardButton initWithConfiguration:](v17, "initWithConfiguration:", v18);
    dismissButtonX = v4->_dismissButtonX;
    v4->_dismissButtonX = v19;

    v21 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 102));
    dismissButtonDone = v4->_dismissButtonDone;
    v4->_dismissButtonDone = (UIButton *)v21;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v45[0] = v4->_dismissButtonX;
    v45[1] = v4->_dismissButtonDone;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 2, 0));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v24)
    {
      v26 = v24;
      v27 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v27)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          LODWORD(v25) = 1148846080;
          objc_msgSend(v29, "setContentCompressionResistancePriority:forAxis:", 0, v25);
          LODWORD(v30) = 1148846080;
          objc_msgSend(v29, "setContentHuggingPriority:forAxis:", 0, v30);
        }
        v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v26);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonDone](v4, "dismissButtonDone"));
    objc_msgSend(v31, "addTarget:action:forControlEvents:", v4, "dismissButtonTapped:", 64);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonX](v4, "dismissButtonX"));
    objc_msgSend(v32, "addTarget:action:forControlEvents:", v4, "dismissButtonTapped:", 64);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView bannerImageView](v4, "bannerImageView"));
    -[ExtensionFlowHeaderView addSubview:](v4, "addSubview:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageView](v4, "iconImageView"));
    -[ExtensionFlowHeaderView addSubview:](v4, "addSubview:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](v4, "titleLabel"));
    -[ExtensionFlowHeaderView addSubview:](v4, "addSubview:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView detailLabel](v4, "detailLabel"));
    -[ExtensionFlowHeaderView addSubview:](v4, "addSubview:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonX](v4, "dismissButtonX"));
    -[ExtensionFlowHeaderView addSubview:](v4, "addSubview:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonDone](v4, "dismissButtonDone"));
    -[ExtensionFlowHeaderView addSubview:](v4, "addSubview:", v38);

    -[ExtensionFlowHeaderView setupConstraints](v4, "setupConstraints");
    -[ExtensionFlowHeaderView configureDismissButton](v4, "configureDismissButton");
  }
  return v4;
}

- (void)setupConstraints
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
  _QWORD v84[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView detailLabel](self, "detailLabel"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonX](self, "dismissButtonX"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonDone](self, "dismissButtonDone"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageView](self, "iconImageView"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView bannerImageView](self, "bannerImageView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageView](self, "iconImageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView leadingAnchor](self, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 15.0));
  -[ExtensionFlowHeaderView setIconImageViewLeadingConstraint:](self, "setIconImageViewLeadingConstraint:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView topAnchor](self, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 28.5));
  -[ExtensionFlowHeaderView setTitleVerticalConstraintDetailPresent:](self, "setTitleVerticalConstraintDetailPresent:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerYAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView centerYAnchor](self, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  -[ExtensionFlowHeaderView setTitleVerticalConstraintDetailNotPresent:](self, "setTitleVerticalConstraintDetailNotPresent:", v20);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageViewLeadingConstraint](self, "iconImageViewLeadingConstraint"));
  v84[0] = v83;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageView](self, "iconImageView"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "centerYAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView centerYAnchor](self, "centerYAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
  v84[1] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView bannerImageView](self, "bannerImageView"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageView](self, "iconImageView"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "leadingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v75));
  v84[2] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView bannerImageView](self, "bannerImageView"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "centerYAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView centerYAnchor](self, "centerYAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v71));
  v84[3] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView bannerImageView](self, "bannerImageView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "widthAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintLessThanOrEqualToConstant:", 125.0));
  v84[4] = v67;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView bannerImageView](self, "bannerImageView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "heightAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintLessThanOrEqualToConstant:", 46.0));
  v84[5] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageView](self, "iconImageView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, 15.0));
  v84[6] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonX](self, "dismissButtonX"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:constant:", v55, -15.0));
  v84[7] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleVerticalConstraintDetailPresent](self, "titleVerticalConstraintDetailPresent"));
  v84[8] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView detailLabel](self, "detailLabel"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v84[9] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView detailLabel](self, "detailLabel"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v84[10] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView detailLabel](self, "detailLabel"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lastBaselineAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "lastBaselineAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 17.5));
  v84[11] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonX](self, "dismissButtonX"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerYAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView centerYAnchor](self, "centerYAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v84[12] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonX](self, "dismissButtonX"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView trailingAnchor](self, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v84[13] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonDone](self, "dismissButtonDone"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView centerYAnchor](self, "centerYAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  v84[14] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonDone](self, "dismissButtonDone"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView trailingAnchor](self, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -15.0));
  v84[15] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 16));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

}

- (void)configureDismissButton
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = -[ExtensionFlowHeaderView dismissButtonType](self, "dismissButtonType");
  if (v3 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonX](self, "dismissButtonX"));
    objc_msgSend(v11, "setHidden:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonDone](self, "dismissButtonDone"));
    v12 = v9;
    v10 = 1;
  }
  else
  {
    if (v3)
      return;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonDone](self, "dismissButtonDone"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("extension_flow_done_key"), CFSTR("localized string not found"), 0));
    objc_msgSend(v4, "setTitle:forState:", v6, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonDone](self, "dismissButtonDone"));
    objc_msgSend(v7, "setImage:forState:", 0, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonX](self, "dismissButtonX"));
    objc_msgSend(v8, "setHidden:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView dismissButtonDone](self, "dismissButtonDone"));
    v12 = v9;
    v10 = 0;
  }
  objc_msgSend(v9, "setHidden:", v10);

}

- (void)configureImages
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
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView bannerImageView](self, "bannerImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView bannerImageView](self, "bannerImageView"));
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setAlpha:", 1.0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageView](self, "iconImageView"));
    objc_msgSend(v7, "setAlpha:", 0.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
    objc_msgSend(v8, "setAlpha:", 0.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView detailLabel](self, "detailLabel"));
    v10 = v9;
    v11 = 0.0;
  }
  else
  {
    objc_msgSend(v5, "setAlpha:", 0.0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageView](self, "iconImageView"));
    objc_msgSend(v12, "setAlpha:", 1.0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
    objc_msgSend(v13, "setAlpha:", 1.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView detailLabel](self, "detailLabel"));
    v10 = v9;
    v11 = 1.0;
  }
  objc_msgSend(v9, "setAlpha:", v11);

  v17 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageView](self, "iconImageView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "image"));
  if (v14)
    v15 = 15.0;
  else
    v15 = 0.0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageViewLeadingConstraint](self, "iconImageViewLeadingConstraint"));
  objc_msgSend(v16, "setConstant:", v15);

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ExtensionFlowHeaderView;
  -[ExtensionFlowHeaderView layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[ExtensionFlowHeaderView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)dismissButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView delegate](self, "delegate", a3));
  objc_msgSend(v4, "extensionFlowHeaderViewDidTapDismiss:", self);

}

- (void)setIconImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageView](self, "iconImageView"));
  objc_msgSend(v5, "setImage:", v4);

  -[ExtensionFlowHeaderView configureImages](self, "configureImages");
}

- (UIImage)iconImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView iconImageView](self, "iconImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return (UIImage *)v3;
}

- (void)setBannerImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView bannerImageView](self, "bannerImageView"));
  objc_msgSend(v5, "setImage:", v4);

  -[ExtensionFlowHeaderView configureImages](self, "configureImages");
}

- (UIImage)bannerImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView bannerImageView](self, "bannerImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return (UIImage *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)setDetailText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView detailLabel](self, "detailLabel"));
  objc_msgSend(v5, "setText:", v4);

  v6 = objc_msgSend(v4, "length");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleVerticalConstraintDetailPresent](self, "titleVerticalConstraintDetailPresent"));
    objc_msgSend(v7, "setActive:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleVerticalConstraintDetailNotPresent](self, "titleVerticalConstraintDetailNotPresent"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleVerticalConstraintDetailNotPresent](self, "titleVerticalConstraintDetailNotPresent"));
    objc_msgSend(v9, "setActive:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleVerticalConstraintDetailPresent](self, "titleVerticalConstraintDetailPresent"));
  }
  v10 = v8;
  objc_msgSend(v8, "setActive:", 0);

}

- (NSString)titleText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (NSString)detailText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowHeaderView detailLabel](self, "detailLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setDismissButtonType:(unint64_t)a3
{
  if (self->_dismissButtonType != a3)
  {
    self->_dismissButtonType = a3;
    -[ExtensionFlowHeaderView configureDismissButton](self, "configureDismissButton");
  }
}

- (unint64_t)dismissButtonType
{
  return self->_dismissButtonType;
}

- (ExtensionFlowHeaderViewDelegate)delegate
{
  return (ExtensionFlowHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CardButton)dismissButtonX
{
  return self->_dismissButtonX;
}

- (UIButton)dismissButtonDone
{
  return self->_dismissButtonDone;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UIImageView)bannerImageView
{
  return self->_bannerImageView;
}

- (void)setBannerImageView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerImageView, a3);
}

- (NSLayoutConstraint)iconImageViewLeadingConstraint
{
  return self->_iconImageViewLeadingConstraint;
}

- (void)setIconImageViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)titleVerticalConstraintDetailNotPresent
{
  return self->_titleVerticalConstraintDetailNotPresent;
}

- (void)setTitleVerticalConstraintDetailNotPresent:(id)a3
{
  objc_storeStrong((id *)&self->_titleVerticalConstraintDetailNotPresent, a3);
}

- (NSLayoutConstraint)titleVerticalConstraintDetailPresent
{
  return self->_titleVerticalConstraintDetailPresent;
}

- (void)setTitleVerticalConstraintDetailPresent:(id)a3
{
  objc_storeStrong((id *)&self->_titleVerticalConstraintDetailPresent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleVerticalConstraintDetailPresent, 0);
  objc_storeStrong((id *)&self->_titleVerticalConstraintDetailNotPresent, 0);
  objc_storeStrong((id *)&self->_iconImageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bannerImageView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_dismissButtonDone, 0);
  objc_storeStrong((id *)&self->_dismissButtonX, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
