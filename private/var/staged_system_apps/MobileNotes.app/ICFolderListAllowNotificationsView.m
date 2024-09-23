@implementation ICFolderListAllowNotificationsView

+ (double)backgroundTopMargin
{
  unsigned int v2;
  double result;

  v2 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  result = 16.0;
  if (v2)
    return 0.0;
  return result;
}

+ (double)backgroundBottomMargin
{
  unsigned int v2;
  double result;

  v2 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  result = 16.0;
  if (v2)
    return 12.0;
  return result;
}

+ (double)titleTopMargin
{
  unsigned int v2;
  double result;

  v2 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  result = 11.0;
  if (v2)
    return 12.0;
  return result;
}

+ (double)separatorTopMargin
{
  unsigned int v2;
  double result;

  v2 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  result = 11.0;
  if (v2)
    return 12.0;
  return result;
}

- (ICFolderListAllowNotificationsView)initWithFrame:(CGRect)a3
{
  ICFolderListAllowNotificationsView *v3;
  id v4;
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
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)ICFolderListAllowNotificationsView;
  v3 = -[ICFolderListAllowNotificationsView initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init((Class)UIView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v4, "setBackgroundColor:", v5);

    -[ICFolderListAllowNotificationsView setBackgroundView:](v3, "setBackgroundView:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView createRoundedRectView](v3, "createRoundedRectView"));
    -[ICFolderListAllowNotificationsView setRoundedRectView:](v3, "setRoundedRectView:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView contentView](v3, "contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](v3, "roundedRectView"));
    objc_msgSend(v7, "addSubview:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView createBell](v3, "createBell"));
    -[ICFolderListAllowNotificationsView setBellBackgroundView:](v3, "setBellBackgroundView:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](v3, "roundedRectView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView bellBackgroundView](v3, "bellBackgroundView"));
    objc_msgSend(v10, "addSubview:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView createTitle](v3, "createTitle"));
    -[ICFolderListAllowNotificationsView setTitleLabel:](v3, "setTitleLabel:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](v3, "roundedRectView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView titleLabel](v3, "titleLabel"));
    objc_msgSend(v13, "addSubview:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView createSeparator](v3, "createSeparator"));
    -[ICFolderListAllowNotificationsView setSeparatorView:](v3, "setSeparatorView:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](v3, "roundedRectView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView separatorView](v3, "separatorView"));
    objc_msgSend(v16, "addSubview:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView createCloseButton](v3, "createCloseButton"));
    -[ICFolderListAllowNotificationsView setCloseButton:](v3, "setCloseButton:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](v3, "roundedRectView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView closeButton](v3, "closeButton"));
    objc_msgSend(v19, "addSubview:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView createSettingsButton](v3, "createSettingsButton"));
    -[ICFolderListAllowNotificationsView setSettingsButton:](v3, "setSettingsButton:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](v3, "roundedRectView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView settingsButton](v3, "settingsButton"));
    objc_msgSend(v22, "addSubview:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView constraints](v3, "constraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    -[ICFolderListAllowNotificationsView updateCloseButtonImage](v3, "updateCloseButtonImage");
    -[ICFolderListAllowNotificationsView updateColors](v3, "updateColors");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v25, "addObserver:selector:name:object:", v3, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v3;
}

- (void)setHasGroupInset:(BOOL)a3
{
  self->_hasGroupInset = a3;
  -[ICFolderListAllowNotificationsView updateColors](self, "updateColors");
}

- (id)createRoundedRectView
{
  id v3;
  void *v4;
  double v5;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView traitCollection](self, "traitCollection"));
  v5 = _UITableViewDefaultSectionCornerRadiusForTraitCollection();

  objc_msgSend(v3, "ic_applyRoundedCornersWithRadius:", v5);
  return v3;
}

- (id)createBell
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v3, "setBackgroundColor:", v4);

    objc_msgSend(v3, "ic_applyRoundedCornersWithRadius:", 16.0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, -1, 20.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("bell.badge.fill"), v5));

  v7 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v7, "setTintColor:", v8);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v7);
  -[ICFolderListAllowNotificationsView setBellImageView:](self, "setBellImageView:", v7);

  return v3;
}

- (id)createTitle
{
  id v2;
  void *v3;
  const UIFontTextStyle *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setNumberOfLines:", 0);
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v4 = &UIFontTextStyleFootnote;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v4 = &UIFontTextStyleHeadline;
  }
  objc_msgSend(v2, "setTextColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", *v4));
  objc_msgSend(v2, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Do you want to be notified when mentioned in shared notes?"), &stru_1005704B8, 0));
  objc_msgSend(v2, "setText:", v7);

  return v2;
}

- (id)createSeparator
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (id)createCloseButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration borderlessButtonConfiguration](UIButtonConfiguration, "borderlessButtonConfiguration"));
  objc_msgSend(v3, "contentInsets");
  objc_msgSend(v3, "setContentInsets:", 4.0, 4.0, 4.0, 4.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  objc_msgSend(v3, "setBaseForegroundColor:", v4);

  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000F9F6C;
  v15 = &unk_1005518A8;
  objc_copyWeak(&v16, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v12));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v3, v5, v12, v13, v14, v15));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1148846080;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  LODWORD(v8) = 1148846080;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v8);
  LODWORD(v9) = 1148846080;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v9);
  LODWORD(v10) = 1148846080;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

- (id)createSettingsButton
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  const UIFontTextStyle *v12;
  UIFontTextStyle v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  NSAttributedStringKey v24;
  void *v25;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration ic_plainButtonConfiguration](UIButtonConfiguration, "ic_plainButtonConfiguration"));
  objc_msgSend(v2, "contentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v8 = 0.0;
    v4 = 0.0;
  }
  else
  {
    objc_msgSend(v2, "setTitleAlignment:", 1);
    v10 = 0.0;
    v6 = 0.0;
  }
  objc_msgSend(v2, "setContentInsets:", v4, v6, v8, v10);
  objc_msgSend(v2, "setCornerStyle:", 4);
  v11 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  v12 = &UIFontTextStyleBody;
  if (!v11)
    v12 = &UIFontTextStyleSubheadline;
  v13 = *v12;
  v24 = NSFontAttributeName;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", v14));
  v25 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Go to Settings"), &stru_1005704B8, 0));

  v19 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v18, v16);
  objc_msgSend(v2, "setAttributedTitle:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &stru_100554DE0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v2, v20));
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v22) = 1148846080;
  objc_msgSend(v21, "setContentCompressionResistancePriority:forAxis:", 1, v22);

  return v21;
}

- (id)constraints
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
  double v25;
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
  double v70;
  double v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
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
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  double v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](self, "roundedRectView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutMarginsGuide"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v8));
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](self, "roundedRectView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layoutMarginsGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v14));
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](self, "roundedRectView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  objc_msgSend((id)objc_opt_class(self), "backgroundTopMargin");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19));
  objc_msgSend(v3, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](self, "roundedRectView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  objc_msgSend((id)objc_opt_class(self), "backgroundBottomMargin");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -v25));
  objc_msgSend(v3, "addObject:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView bellBackgroundView](self, "bellBackgroundView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](self, "roundedRectView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, 12.0));
  objc_msgSend(v3, "addObject:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView bellBackgroundView](self, "bellBackgroundView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](self, "roundedRectView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, 16.0));
  objc_msgSend(v3, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView bellBackgroundView](self, "bellBackgroundView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "widthAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToConstant:", 32.0));
  objc_msgSend(v3, "addObject:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView bellBackgroundView](self, "bellBackgroundView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "heightAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToConstant:", 32.0));
  objc_msgSend(v3, "addObject:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView bellImageView](self, "bellImageView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "centerXAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView bellBackgroundView](self, "bellBackgroundView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "centerXAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v46));
  objc_msgSend(v3, "addObject:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView bellImageView](self, "bellImageView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "centerYAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView bellBackgroundView](self, "bellBackgroundView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "centerYAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v51));
  objc_msgSend(v3, "addObject:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView titleLabel](self, "titleLabel"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](self, "roundedRectView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
  objc_msgSend((id)objc_opt_class(self), "titleTopMargin");
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v56));
  objc_msgSend(v3, "addObject:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView titleLabel](self, "titleLabel"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView bellBackgroundView](self, "bellBackgroundView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61, 12.0));
  objc_msgSend(v3, "addObject:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView titleLabel](self, "titleLabel"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView closeButton](self, "closeButton"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:constant:", v66, -7.0));
  objc_msgSend(v3, "addObject:", v67);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView titleLabel](self, "titleLabel"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "font"));
  objc_msgSend(v69, "ascender");
  v71 = v70;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView titleLabel](self, "titleLabel"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "font"));
  objc_msgSend(v73, "descender");
  v75 = v71 + v74;

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView closeButton](self, "closeButton"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "centerYAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView titleLabel](self, "titleLabel"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "firstBaselineAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, v75 * -0.5));
  objc_msgSend(v3, "addObject:", v80);

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView closeButton](self, "closeButton"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](self, "roundedRectView"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "trailingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:", v84, -7.0));
  objc_msgSend(v3, "addObject:", v85);

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView closeButton](self, "closeButton"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "heightAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView closeButton](self, "closeButton"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "widthAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v89));
  objc_msgSend(v3, "addObject:", v90);

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView separatorView](self, "separatorView"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "topAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView titleLabel](self, "titleLabel"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "bottomAnchor"));
  objc_msgSend((id)objc_opt_class(self), "separatorTopMargin");
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:constant:", v94));
  objc_msgSend(v3, "addObject:", v95);

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView separatorView](self, "separatorView"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "leadingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView titleLabel](self, "titleLabel"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "leadingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:", v99));
  objc_msgSend(v3, "addObject:", v100);

  v101 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView separatorView](self, "separatorView"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "trailingAnchor"));
  v103 = objc_opt_self(self);
  v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "roundedRectView"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "trailingAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:constant:", v106, -13.0));
  objc_msgSend(v3, "addObject:", v107);

  v108 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView separatorView](self, "separatorView"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "heightAnchor"));
  -[ICFolderListAllowNotificationsView ic_hairlineWidth](self, "ic_hairlineWidth");
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToConstant:"));
  objc_msgSend(v3, "addObject:", v110);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    v111 = 12.0;
  else
    v111 = 0.0;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView settingsButton](self, "settingsButton"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "topAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView separatorView](self, "separatorView"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "bottomAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:constant:", v115, v111));
  objc_msgSend(v3, "addObject:", v116);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    objc_msgSend(v117, "contentInsets");
    v119 = v118;

    v120 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    objc_msgSend(v120, "contentInsets");
    v122 = v121;

    v123 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView settingsButton](self, "settingsButton"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "leadingAnchor"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView separatorView](self, "separatorView"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "leadingAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToAnchor:constant:", v126, -v119));
    objc_msgSend(v3, "addObject:", v127);

    v128 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView settingsButton](self, "settingsButton"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "trailingAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView separatorView](self, "separatorView"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "trailingAnchor"));
    v132 = objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintLessThanOrEqualToAnchor:constant:", v131, v122));
  }
  else
  {
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView settingsButton](self, "settingsButton"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "leadingAnchor"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView separatorView](self, "separatorView"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "leadingAnchor"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintEqualToAnchor:", v136));
    objc_msgSend(v3, "addObject:", v137);

    v128 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView settingsButton](self, "settingsButton"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "trailingAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView separatorView](self, "separatorView"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "trailingAnchor"));
    v132 = objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToAnchor:", v131));
  }
  v138 = (void *)v132;
  objc_msgSend(v3, "addObject:", v132);

  v139 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView settingsButton](self, "settingsButton"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "heightAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "constraintEqualToConstant:", 44.0));

  LODWORD(v142) = 1144750080;
  objc_msgSend(v141, "setPriority:", v142);
  objc_msgSend(v3, "addObject:", v141);
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView settingsButton](self, "settingsButton"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "bottomAnchor"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](self, "roundedRectView"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "bottomAnchor"));
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:constant:", v146, -v111));
  objc_msgSend(v3, "addObject:", v147);

  v148 = objc_msgSend(v3, "copy");
  return v148;
}

- (void)updateColors
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ICFolderListAllowNotificationsView setBackgroundColor:](self, "setBackgroundColor:", v3);

  if (-[ICFolderListAllowNotificationsView hasGroupInset](self, "hasGroupInset"))
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
  v6 = (id)v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView roundedRectView](self, "roundedRectView"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)updateCloseButtonImage
{
  unsigned int v3;
  const UIFontTextStyle *v4;
  UIFontTextStyle v5;
  const UIFontWeight *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  v4 = &UIFontTextStyleBody;
  if (v3)
    v4 = &UIFontTextStyleTitle2;
  v5 = *v4;
  v6 = &UIFontWeightRegular;
  if (!v3)
    v6 = &UIFontWeightSemibold;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForStyle:withFontWeight:maxContentSizeCategory:](UIFont, "ic_preferredFontForStyle:withFontWeight:maxContentSizeCategory:", v5, UIContentSizeCategoryExtraExtraLarge, *v6));
  objc_msgSend(v12, "pointSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("xmark"), v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView closeButton](self, "closeButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));

  objc_msgSend(v10, "setImage:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListAllowNotificationsView closeButton](self, "closeButton"));
  objc_msgSend(v11, "setConfiguration:", v10);

}

- (id)closeHandler
{
  return self->_closeHandler;
}

- (void)setCloseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)hasGroupInset
{
  return self->_hasGroupInset;
}

- (UIView)roundedRectView
{
  return self->_roundedRectView;
}

- (void)setRoundedRectView:(id)a3
{
  objc_storeStrong((id *)&self->_roundedRectView, a3);
}

- (UIView)bellBackgroundView
{
  return self->_bellBackgroundView;
}

- (void)setBellBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_bellBackgroundView, a3);
}

- (UIImageView)bellImageView
{
  return self->_bellImageView;
}

- (void)setBellImageView:(id)a3
{
  objc_storeStrong((id *)&self->_bellImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (UIButton)settingsButton
{
  return self->_settingsButton;
}

- (void)setSettingsButton:(id)a3
{
  objc_storeStrong((id *)&self->_settingsButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsButton, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bellImageView, 0);
  objc_storeStrong((id *)&self->_bellBackgroundView, 0);
  objc_storeStrong((id *)&self->_roundedRectView, 0);
  objc_storeStrong(&self->_closeHandler, 0);
}

@end
