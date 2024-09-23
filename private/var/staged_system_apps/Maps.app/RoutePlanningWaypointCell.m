@implementation RoutePlanningWaypointCell

- (RoutePlanningWaypointCell)initWithWaypoints:(id)a3 waypointIndex:(id)a4 editable:(BOOL)a5 delegate:(id)a6 waypointInfoProvider:(id)a7 cellIndex:(unint64_t)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  RoutePlanningWaypointCell *v18;
  NSArray *v19;
  NSArray *waypoints;
  void *v21;
  id v22;
  double y;
  double width;
  double height;
  id v26;
  void *v27;
  UIImageView *v28;
  UIImageView *iconView;
  void *v30;
  void *v31;
  void *v32;
  RoutePlanningWaypointTextField *v33;
  RoutePlanningWaypointTextField *titleTextField;
  double v35;
  void *v36;
  void *v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  NSLayoutConstraint *imageContainerViewWidthConstraint;
  void *v45;
  uint64_t v46;
  NSLayoutConstraint *iconViewWidthConstraint;
  void *v48;
  uint64_t v49;
  NSLayoutConstraint *iconViewHeightConstraint;
  RoutePlanningWaypointPillView *v51;
  RoutePlanningWaypointPillView *pillView;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  RoutePlanningWaypointPillView *v62;
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
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  NSMutableArray *v105;
  _QWORD v106[4];
  RoutePlanningWaypointCell *v107;
  objc_super v108;
  _QWORD v109[3];
  _QWORD v110[11];

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v108.receiver = self;
  v108.super_class = (Class)RoutePlanningWaypointCell;
  v18 = -[RoutePlanningWaypointCell initWithStyle:reuseIdentifier:](&v108, "initWithStyle:reuseIdentifier:", 0, 0);
  if (v18)
  {
    v103 = v14;
    v104 = v17;
    v19 = (NSArray *)objc_msgSend(v14, "copy");
    waypoints = v18->_waypoints;
    v18->_waypoints = v19;

    objc_storeStrong((id *)&v18->_waypointIndex, a4);
    v18->_editable = v11;
    v101 = v16;
    objc_storeWeak((id *)&v18->_delegate, v16);
    v18->_cellIndex = a8;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
    -[RoutePlanningWaypointCell setBackgroundColor:](v18, "setBackgroundColor:", v21);

    -[RoutePlanningWaypointCell setAccessibilityIdentifier:](v18, "setAccessibilityIdentifier:", CFSTR("RoutePlanningWaypointCell"));
    v22 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v26 = objc_msgSend(v22, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v26, "setUserInteractionEnabled:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell contentView](v18, "contentView"));
    objc_msgSend(v27, "addSubview:", v26);

    v28 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    iconView = v18->_iconView;
    v18->_iconView = v28;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v18->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v18->_iconView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIdentifier:](v18->_iconView, "setAccessibilityIdentifier:", CFSTR("RoutePlanningWaypointCellIconView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell traitCollection](v18, "traitCollection"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle2, v30, UIFontWeightBold));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v31));
    -[UIImageView setPreferredSymbolConfiguration:](v18->_iconView, "setPreferredSymbolConfiguration:", v32);

    -[UIImageView setTag:](v18->_iconView, "setTag:", 10101);
    objc_msgSend(v26, "addSubview:", v18->_iconView);
    v33 = -[RoutePlanningWaypointTextField initWithFrame:]([RoutePlanningWaypointTextField alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleTextField = v18->_titleTextField;
    v18->_titleTextField = v33;

    -[RoutePlanningWaypointTextField setTranslatesAutoresizingMaskIntoConstraints:](v18->_titleTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RoutePlanningWaypointTextField setEnabled:](v18->_titleTextField, "setEnabled:", v11);
    -[RoutePlanningWaypointTextField setAccessibilityIdentifier:](v18->_titleTextField, "setAccessibilityIdentifier:", CFSTR("RoutePlanningWaypointCellTextField"));
    -[RoutePlanningWaypointTextField setDelegate:](v18->_titleTextField, "setDelegate:", v18);
    -[RoutePlanningWaypointTextField setTextDropDelegate:](v18->_titleTextField, "setTextDropDelegate:", v18);
    -[RoutePlanningWaypointTextField setReturnKeyType:](v18->_titleTextField, "setReturnKeyType:", 6);
    -[RoutePlanningWaypointTextField setAutocorrectionType:](v18->_titleTextField, "setAutocorrectionType:", 1);
    -[RoutePlanningWaypointTextField setSpellCheckingType:](v18->_titleTextField, "setSpellCheckingType:", 1);
    -[RoutePlanningWaypointTextField setFocusGroupIdentifier:](v18->_titleTextField, "setFocusGroupIdentifier:", CFSTR("RoutePlanningWaypointFocusGroup"));
    LODWORD(v35) = 1132068864;
    -[RoutePlanningWaypointTextField setContentHuggingPriority:forAxis:](v18->_titleTextField, "setContentHuggingPriority:forAxis:", 0, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    LODWORD(v31) = objc_msgSend(v36, "userInterfaceLayoutDirection") == (id)1;

    -[RoutePlanningWaypointTextField setTextAlignment:](v18->_titleTextField, "setTextAlignment:", 2 * v31);
    -[RoutePlanningWaypointCell _updateFonts](v18, "_updateFonts");
    -[RoutePlanningWaypointTextField addTarget:action:forControlEvents:](v18->_titleTextField, "addTarget:action:forControlEvents:", v18, "_textFieldEditingChanged:", 0x20000);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell contentView](v18, "contentView"));
    objc_msgSend(v37, "addSubview:", v18->_titleTextField);

    if (sub_1002A8AA0(v18) == 5)
      v38 = 13.0;
    else
      v38 = 20.0;
    v39 = sub_1002A8AA0(v18);
    v40 = 14.0;
    if (v39 == 5)
      v40 = 9.0;
    v41 = v38 + v40 * 2.0;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "widthAnchor"));
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToConstant:", v41));
    imageContainerViewWidthConstraint = v18->_imageContainerViewWidthConstraint;
    v18->_imageContainerViewWidthConstraint = (NSLayoutConstraint *)v43;

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v18->_iconView, "widthAnchor"));
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToConstant:", v38));
    iconViewWidthConstraint = v18->_iconViewWidthConstraint;
    v18->_iconViewWidthConstraint = (NSLayoutConstraint *)v46;

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v18->_iconView, "heightAnchor"));
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToConstant:", v38));
    iconViewHeightConstraint = v18->_iconViewHeightConstraint;
    v18->_iconViewHeightConstraint = (NSLayoutConstraint *)v49;

    if (v15 && objc_msgSend(v17, "hasValidEVRoute"))
    {
      v51 = -[RoutePlanningWaypointPillView initWithWaypointIndex:waypointInfoProvider:]([RoutePlanningWaypointPillView alloc], "initWithWaypointIndex:waypointInfoProvider:", objc_msgSend(v15, "unsignedIntegerValue"), v17);
      pillView = v18->_pillView;
      v18->_pillView = v51;

      -[RoutePlanningWaypointPillView setTranslatesAutoresizingMaskIntoConstraints:](v18->_pillView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell contentView](v18, "contentView"));
      objc_msgSend(v53, "addSubview:", v18->_pillView);

    }
    v102 = v15;
    v105 = objc_opt_new(NSMutableArray);
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell contentView](v18, "contentView"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "leadingAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v94));
    v110[0] = v93;
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell contentView](v18, "contentView"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "topAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v90));
    v110[1] = v89;
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell contentView](v18, "contentView"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "bottomAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
    v110[2] = v85;
    v110[3] = v18->_imageContainerViewWidthConstraint;
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v18->_iconView, "centerXAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerXAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v83));
    v110[4] = v82;
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v18->_iconView, "centerYAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerYAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
    v110[5] = v79;
    v110[6] = v18->_iconViewWidthConstraint;
    v110[7] = v18->_iconViewHeightConstraint;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField leadingAnchor](v18->_titleTextField, "leadingAnchor"));
    v100 = v26;
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
    v110[8] = v76;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField topAnchor](v18->_titleTextField, "topAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell contentView](v18, "contentView"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v55));
    v110[9] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField bottomAnchor](v18->_titleTextField, "bottomAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell contentView](v18, "contentView"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "bottomAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v59));
    v110[10] = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v110, 11));
    -[NSMutableArray addObjectsFromArray:](v105, "addObjectsFromArray:", v61);

    v62 = v18->_pillView;
    if (v62)
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointPillView leadingAnchor](v62, "leadingAnchor"));
      v95 = objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField trailingAnchor](v18->_titleTextField, "trailingAnchor"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:constant:", v95, 10.0));
      v109[0] = v63;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointPillView trailingAnchor](v18->_pillView, "trailingAnchor"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell contentView](v18, "contentView"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "trailingAnchor"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:constant:", v65, -16.0));
      v109[1] = v66;
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointPillView centerYAnchor](v18->_pillView, "centerYAnchor"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell contentView](v18, "contentView"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "centerYAnchor"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v69));
      v109[2] = v70;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v109, 3));
      -[NSMutableArray addObjectsFromArray:](v105, "addObjectsFromArray:", v71);

      v72 = (void *)v95;
      v73 = v97;

    }
    else
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField trailingAnchor](v18->_titleTextField, "trailingAnchor"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell contentView](v18, "contentView"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "trailingAnchor"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v63));
      -[NSMutableArray addObject:](v105, "addObject:", v64);
    }
    v14 = v103;

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v105);
    -[RoutePlanningWaypointCell _updateContent](v18, "_updateContent");
    -[RoutePlanningWaypointCell _updateConstraints](v18, "_updateConstraints");
    -[RoutePlanningWaypointCell _updatePlaceholderText](v18, "_updatePlaceholderText");
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_100A4A608;
    v106[3] = &unk_1011AC860;
    v107 = v18;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v106);

    v16 = v101;
    v15 = v102;
    v17 = v104;
  }

  return v18;
}

- (double)preferredSeparatorInset
{
  double result;

  -[NSLayoutConstraint constant](self->_imageContainerViewWidthConstraint, "constant");
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningWaypointCell;
  v4 = a3;
  -[RoutePlanningWaypointCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell traitCollection](self, "traitCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredContentSizeCategory"));

  if (v5 != v7)
  {
    -[RoutePlanningWaypointCell _updateFonts](self, "_updateFonts");
    -[RoutePlanningWaypointCell _updateConstraints](self, "_updateConstraints");
  }
}

- (void)setCellIndex:(unint64_t)a3
{
  if (self->_cellIndex != a3)
  {
    self->_cellIndex = a3;
    -[RoutePlanningWaypointCell _updatePlaceholderText](self, "_updatePlaceholderText");
  }
}

- (void)_updateContent
{
  -[RoutePlanningWaypointCell _updateTitleText](self, "_updateTitleText");
  -[RoutePlanningWaypointCell _updateIconImage](self, "_updateIconImage");
}

- (void)_updateTitleText
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell waypoints](self, "waypoints"));
  v3 = objc_msgSend(v17, "count");
  if ((unint64_t)v3 < 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
    if (!-[RoutePlanningWaypointTextField isEnabled](self->_titleTextField, "isEnabled"))
      goto LABEL_7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchResult"));
    v10 = objc_msgSend(v9, "isDynamicCurrentLocation");

    if (!v10
      || (v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager")), v12 = objc_msgSend(v11, "isLocationServicesApproved"), v13 = objc_msgSend(v11, "isAuthorizedForPreciseLocation"), v11, v14 = &stru_1011EB268, v12)&& v13)
    {
LABEL_7:
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypointName"));
    }
    if (v14)
      v15 = v14;
    else
      v15 = &stru_1011EB268;
    -[RoutePlanningWaypointTextField setText:](self->_titleTextField, "setText:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[RoutePlanningWaypointTextField setTextColor:](self->_titleTextField, "setTextColor:", v16);

  }
  else
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Route Planning] Waypoint List"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4, v4, v4));
    -[RoutePlanningWaypointTextField setText:](self->_titleTextField, "setText:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[RoutePlanningWaypointTextField setTextColor:](self->_titleTextField, "setTextColor:", v8);
  }

}

- (void)_updateIconImage
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  _QWORD v35[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell waypoints](self, "waypoints"));
  v4 = objc_msgSend(v3, "count");
  if (!self->_editing)
  {
    v5 = (unint64_t)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField text](self->_titleTextField, "text"));
    v7 = objc_msgSend(v6, "length");

    if (v7 && v5 != 0)
    {
      if (v5 < 2)
      {
        -[UIImageView setTintColor:](self->_iconView, "setTintColor:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell traitCollection](self, "traitCollection"));
        objc_msgSend(v24, "displayScale");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "waypointIconWithScale:"));

        if (!v10)
        {
LABEL_18:
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes genericMarkerStyleAttributes](GEOFeatureStyleAttributes, "genericMarkerStyleAttributes"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell traitCollection](self, "traitCollection"));
          objc_msgSend(v26, "displayScale");
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v25, 0, 0));

        }
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
        -[UIImageView setTintColor:](self->_iconView, "setTintColor:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes multipleWaypointsStyleAttributes](GEOFeatureStyleAttributes, "multipleWaypointsStyleAttributes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell traitCollection](self, "traitCollection"));
        objc_msgSend(v17, "displayScale");
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v16, 0, 0));

        if (!v10)
        {
          v18 = sub_1004318FC();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v27 = 136315906;
            v28 = "-[RoutePlanningWaypointCell _updateIconImage]";
            v29 = 2080;
            v30 = "RoutePlanningWaypointCell.m";
            v31 = 1024;
            v32 = 260;
            v33 = 2080;
            v34 = "waypointCount <= 1";
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v27, 0x26u);
          }

          if (sub_100A70734())
          {
            v20 = sub_1004318FC();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v27 = 138412290;
              v28 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);

            }
          }
          goto LABEL_18;
        }
      }
      -[UIImageView setImage:](self->_iconView, "setImage:", v10);
      goto LABEL_8;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor"));
  -[UIImageView setTintColor:](self->_iconView, "setTintColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v35[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v35[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("magnifyingglass.circle.fill"), v13));
  -[UIImageView setImage:](self->_iconView, "setImage:", v14);

LABEL_8:
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell traitCollection](self, "traitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v3));
  -[RoutePlanningWaypointTextField setFont:](self->_titleTextField, "setFont:", v4);

}

- (void)_updateConstraints
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  v5 = UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraExtraExtraLarge);

  v6 = sub_1002A8AA0(self);
  v7 = 30.0;
  if (v5 == NSOrderedAscending)
    v7 = 20.0;
  if (v6 == 5)
    v8 = 13.0;
  else
    v8 = v7;
  v9 = sub_1002A8AA0(self);
  v10 = 14.0;
  if (v9 == 5)
    v10 = 9.0;
  -[NSLayoutConstraint setConstant:](self->_imageContainerViewWidthConstraint, "setConstant:", v8 + v10 * 2.0);
  -[NSLayoutConstraint setConstant:](self->_iconViewWidthConstraint, "setConstant:", v8);
  -[NSLayoutConstraint setConstant:](self->_iconViewHeightConstraint, "setConstant:", v8);
}

- (void)_updatePlaceholderText
{
  unint64_t cellIndex;
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;

  cellIndex = self->_cellIndex;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v4;
  if (cellIndex)
    v5 = CFSTR("[Route Planning] To");
  else
    v5 = CFSTR("[Route Planning] From");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));
  -[RoutePlanningWaypointTextField setPlaceholder:](self->_titleTextField, "setPlaceholder:", v6);

}

- (NSString)currentText
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField text](self->_titleTextField, "text"));
  v3 = objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (SearchFieldItem)editingWaypoint
{
  void *v3;
  void *v4;

  if (-[RoutePlanningWaypointCell isEditable](self, "isEditable"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell waypoints](self, "waypoints"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  }
  else
  {
    v4 = 0;
  }
  return (SearchFieldItem *)v4;
}

- (void)beginEditing
{
  _QWORD block[5];

  -[RoutePlanningWaypointTextField becomeFirstResponder](self->_titleTextField, "becomeFirstResponder");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A4AFB4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)endEditing
{
  -[RoutePlanningWaypointTextField resignFirstResponder](self->_titleTextField, "resignFirstResponder");
}

- (void)prepareForReplacement
{
  NSArray *waypoints;

  objc_storeWeak((id *)&self->_delegate, 0);
  waypoints = self->_waypoints;
  self->_waypoints = 0;

  -[RoutePlanningWaypointTextField setText:](self->_titleTextField, "setText:", 0);
  -[RoutePlanningWaypointTextField setPlaceholder:](self->_titleTextField, "setPlaceholder:", 0);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  _BOOL8 v4;
  void *v5;
  char v6;
  id v7;

  v4 = -[RoutePlanningWaypointTextField isHandlingTouch](self->_titleTextField, "isHandlingTouch", a3);
  -[RoutePlanningWaypointTextField didBeginEditingFromTouch:](self->_titleTextField, "didBeginEditingFromTouch:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "cellDidStartEditing:withUserInteraction:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
    objc_msgSend(v7, "cellDidStartEditing:withUserInteraction:", self, v4);

  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[RoutePlanningWaypointCell _markAsNotEditingAndUpdateContent](self, "_markAsNotEditingAndUpdateContent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "cellDidStopEditing:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
    objc_msgSend(v6, "cellDidStopEditing:", self);

  }
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v12;
  void *v13;

  v4 = sub_10043214C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell editingWaypoint](self, "editingWaypoint"));
    v12 = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will clear item: %@", (uint8_t *)&v12, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell editingWaypoint](self, "editingWaypoint"));
  objc_msgSend(v7, "clear");

  -[RoutePlanningWaypointCell _markAsEditing](self, "_markAsEditing");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "cellDidClearInputText:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
    objc_msgSend(v10, "cellDidClearInputText:", self);

  }
  return 1;
}

- (void)_textFieldEditingChanged:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  -[RoutePlanningWaypointCell _markAsEditing](self, "_markAsEditing");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "cell:didChangeInputText:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    if (!v7)
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Should always have text!")));
        v15 = 136316162;
        v16 = "-[RoutePlanningWaypointCell _textFieldEditingChanged:]";
        v17 = 2080;
        v18 = "RoutePlanningWaypointCell.m";
        v19 = 1024;
        v20 = 368;
        v21 = 2080;
        v22 = "text";
        v23 = 2112;
        v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v15, 0x30u);

      }
      if (sub_100A70734())
      {
        v12 = sub_1004318FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v15 = 138412290;
          v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

        }
      }
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
    objc_msgSend(v8, "cell:didChangeInputText:", self, v7);

  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_stringByTrimmingLeadingWhitespace"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "cellDidRequestSearch:");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
      objc_msgSend(v9, "cellDidRequestSearch:", self);

    }
  }
  return v6 != 0;
}

- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "contextMenuForCell:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextMenuForCell:", self));

    if (v10)
    {
      v11 = objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v11, "insertObject:atIndex:", v10, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v11));

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)mapsDragDestinationHandler
{
  MapsDragDestinationHandler *mapsDragDestinationHandler;
  MapsDragDestinationHandler *v4;
  MapsDragDestinationHandler *v5;

  mapsDragDestinationHandler = self->_mapsDragDestinationHandler;
  if (!mapsDragDestinationHandler)
  {
    v4 = objc_alloc_init(MapsDragDestinationHandler);
    v5 = self->_mapsDragDestinationHandler;
    self->_mapsDragDestinationHandler = v4;

    -[MapsDragDestinationHandler setDelegate:](self->_mapsDragDestinationHandler, "setDelegate:", self);
    mapsDragDestinationHandler = self->_mapsDragDestinationHandler;
  }
  return mapsDragDestinationHandler;
}

- (unint64_t)textDroppableView:(id)a3 willBecomeEditableForDrop:(id)a4
{
  return 2;
}

- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)UITextDropProposal), "initWithDropOperation:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell mapsDragDestinationHandler](self, "mapsDragDestinationHandler"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dropSession"));

  objc_msgSend(v7, "beginDrop:", v8);
  objc_msgSend(v6, "setDropPerformer:", 1);
  return v6;
}

- (void)textDroppableView:(id)a3 willPerformDrop:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bounds");
  v10 = v9 + v8 * 0.5;
  v13 = v12 + v11 * 0.5;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell mapsDragDestinationHandler](self, "mapsDragDestinationHandler"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dropSession"));

  objc_msgSend(v15, "performDrop:finishingAtLocation:inView:", v14, v7, v10, v13);
}

- (void)textDroppableView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell mapsDragDestinationHandler](self, "mapsDragDestinationHandler"));
  objc_msgSend(v6, "endDrop:", v5);

}

- (void)mapsDragDestinationHandler:(id)a3 didReceiveMapItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  -[RoutePlanningWaypointTextField setText:](self->_titleTextField, "setText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "cell:didReceiveMapItem:");

  if ((v8 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100A4B940;
    v9[3] = &unk_1011AC8B0;
    v9[4] = self;
    v10 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  }
  else
  {
    -[RoutePlanningWaypointCell _textFieldEditingChanged:](self, "_textFieldEditingChanged:", self->_titleTextField);
  }

}

- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveVCard:(id)a4
{
  return 0;
}

- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveURL:(id)a4
{
  return 0;
}

- (void)_markAsEditing
{
  void *v3;

  if (!self->_editing)
  {
    self->_editing = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell editingWaypoint](self, "editingWaypoint"));
    objc_msgSend(v3, "clear");

    -[RoutePlanningWaypointCell _updateIconImage](self, "_updateIconImage");
  }
}

- (void)_markAsNotEditingAndUpdateContent
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  void *v12;

  if (self->_editing)
  {
    self->_editing = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell editingWaypoint](self, "editingWaypoint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waypoint"));
    v5 = objc_msgSend(v4, "isValid");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(v3, "clear");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell currentText](self, "currentText"));
      v7 = objc_msgSend(v6, "length");

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointCell currentText](self, "currentText"));
        objc_msgSend(v3, "setSearchString:", v8);

        v9 = sub_10043214C();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v11 = 138412290;
          v12 = v3;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Did end editing invalid item with entered text, saving to item: %@", (uint8_t *)&v11, 0xCu);
        }

      }
    }
    -[RoutePlanningWaypointCell _updateContent](self, "_updateContent");

  }
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (NSNumber)waypointIndex
{
  return self->_waypointIndex;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (RoutePlanningWaypointCellDelegate)delegate
{
  return (RoutePlanningWaypointCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)cellIndex
{
  return self->_cellIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_waypointIndex, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_mapsDragDestinationHandler, 0);
  objc_storeStrong((id *)&self->_iconViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_iconViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
