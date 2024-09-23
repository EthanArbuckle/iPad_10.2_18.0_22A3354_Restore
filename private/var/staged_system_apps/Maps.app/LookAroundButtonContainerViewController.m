@implementation LookAroundButtonContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  CardView *v3;
  CardView *cardView;
  void *v5;
  UIButton *v6;
  UIButton *lookAroundButton;
  void *v8;
  void *v9;
  UIButton *v10;
  void *v11;
  UIButton *v12;
  UIImageSymbolConfiguration *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)LookAroundButtonContainerViewController;
  -[LookAroundButtonContainerViewController viewDidLoad](&v17, "viewDidLoad");
  v3 = -[CardView initAllowingBlurredForButton:]([CardView alloc], "initAllowingBlurredForButton:", 1);
  cardView = self->_cardView;
  self->_cardView = v3;

  -[CardView setTranslatesAutoresizingMaskIntoConstraints:](self->_cardView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CardView setLayoutStyle:](self->_cardView, "setLayoutStyle:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_cardView);

  v6 = (UIButton *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
  lookAroundButton = self->_lookAroundButton;
  self->_lookAroundButton = v6;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_lookAroundButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Look Around [Accessibility]"), CFSTR("localized string not found"), 0));
  -[UIButton setAccessibilityLabel:](self->_lookAroundButton, "setAccessibilityLabel:", v9);

  -[UIButton addTarget:action:forControlEvents:](self->_lookAroundButton, "addTarget:action:forControlEvents:", self, "tappedLookAroundButton:", 0x2000);
  v10 = self->_lookAroundButton;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("binoculars.fill")));
  -[UIButton setImage:forState:](v10, "setImage:forState:", v11, 0);

  v12 = self->_lookAroundButton;
  v13 = sub_100578348(4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](v12, "setPreferredSymbolConfiguration:forImageInState:", v14, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController _buttonTintColorForExpanded:](self, "_buttonTintColorForExpanded:", 0));
  -[UIButton setTintColor:](self->_lookAroundButton, "setTintColor:", v15);

  -[UIButton setAccessibilityIdentifier:](self->_lookAroundButton, "setAccessibilityIdentifier:", CFSTR("LookAroundButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
  objc_msgSend(v16, "addSubview:", self->_lookAroundButton);

  -[LookAroundButtonContainerViewController _updateConstraints](self, "_updateConstraints");
}

- (void)setMapItem:(id)a3 willChangeHidden:(BOOL)a4 animated:(BOOL)a5
{
  uint64_t v5;
  _BOOL8 v6;
  MKMapItem *v10;
  MKMapItem *mapItem;
  id v12;
  NSObject *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  NSString *v25;
  void *v26;
  LookAroundButtonContainerViewController *v27;
  MKMapItem *v28;
  unsigned int v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;

  v5 = a5;
  v6 = a4;
  v10 = (MKMapItem *)a3;
  mapItem = self->_mapItem;
  if (mapItem == v10 || (-[MKMapItem isEqual:](mapItem, "isEqual:", v10) & 1) != 0)
    goto LABEL_13;
  v12 = sub_100431B9C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class(self);
    v15 = NSStringFromClass(v14);
    v29 = v5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _identifier](self->_mapItem, "_identifier"));
    *(_DWORD *)buf = 138412802;
    v31 = v16;
    v32 = 2112;
    v33 = v18;
    v34 = 2112;
    v35 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);

    v5 = v29;
  }

  objc_storeStrong((id *)&self->_mapItem, a3);
  if (!v10)
  {
    v27 = self;
    v28 = 0;
LABEL_12:
    -[LookAroundButtonContainerViewController updateLookAroundViewWithMapItem:willChangeHidden:animated:](v27, "updateLookAroundViewWithMapItem:willChangeHidden:animated:", v28, v6, v5);
    goto LABEL_13;
  }
  if (!objc_msgSend((id)objc_opt_class(self), "isIncompleteMapItem:", v10))
  {
    v27 = self;
    v28 = v10;
    goto LABEL_12;
  }
  v20 = sub_100431B9C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = (objc_class *)objc_opt_class(self);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 138412546;
    v31 = v24;
    v32 = 2112;
    v33 = v26;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@ %@, waiting for refreshed map item", buf, 0x16u);

  }
  -[MKLookAroundContainerView setDimmingState:animated:](self->_lookAroundContainerView, "setDimmingState:animated:", 2, v5);
LABEL_13:

}

- (void)updateLookAroundViewWithMapItem:(id)a3 willChangeHidden:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  unsigned int v9;
  unsigned int v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  GroupAnimation *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[6];
  char v22;
  _QWORD v23[5];
  id v24;
  _BOOL8 v25;
  char v26;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "_hasLookAroundStorefront");
  v10 = v9;
  v11 = v6;
  v12 = 2;
  if (v6)
    v12 = 3;
  if (v9)
    v13 = v12;
  else
    v13 = v6;
  v14 = objc_alloc_init(GroupAnimation);
  -[GroupAnimation setAnimated:](v14, "setAnimated:", v5);
  -[GroupAnimation setDuration:](v14, "setDuration:", 0.3);
  -[GroupAnimation setOptions:](v14, "setOptions:", 4);
  -[GroupAnimation setPreventsAnimationDuringPreparation:](v14, "setPreventsAnimationDuringPreparation:", 1);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10059AD64;
  v23[3] = &unk_1011BBFE0;
  v26 = v10;
  v23[4] = self;
  v25 = v11;
  v15 = v8;
  v24 = v15;
  -[GroupAnimation addPreparation:](v14, "addPreparation:", v23);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10059AE10;
  v21[3] = &unk_1011AFB78;
  v22 = v10;
  v21[4] = self;
  v21[5] = v13;
  -[GroupAnimation addAnimations:](v14, "addAnimations:", v21);
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10059AEA4;
  v18[3] = &unk_1011AD4F0;
  objc_copyWeak(&v19, &location);
  -[GroupAnimation addCompletion:](v14, "addCompletion:", v18);
  -[GroupAnimation runWithCurrentOptions](v14, "runWithCurrentOptions");
  if (v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("PPTLookAroundChromeOverlayMapItemUserInfoKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("PPTLookAroundChromeOverlayLookAroundViewUserInfoKey"));

    +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("PPTLookAroundChromeOverlayDidShowLookAroundPreviewNotificationName"), 0, v16);
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)setContainerStyle:(unint64_t)a3
{
  if (self->_containerStyle != a3)
  {
    self->_containerStyle = a3;
    -[LookAroundButtonContainerViewController _updateBadgeLayout](self, "_updateBadgeLayout");
    -[LookAroundButtonContainerViewController _invalidateConstraints](self, "_invalidateConstraints");
    -[LookAroundButtonContainerViewController _updateConstraints](self, "_updateConstraints");
  }
}

- (void)_loadLookAroundContainerView
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  MKLookAroundContainerView *v11;
  MKLookAroundContainerView *lookAroundContainerView;
  void *v13;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  if (!self->_lookAroundContainerView)
  {
    v4 = sub_100431B9C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class(self);
      v7 = NSStringFromClass(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v15, 0x16u);

    }
    v11 = (MKLookAroundContainerView *)objc_msgSend(objc_alloc((Class)MKLookAroundContainerView), "initWithFloatingDimmingStyle:", 1);
    lookAroundContainerView = self->_lookAroundContainerView;
    self->_lookAroundContainerView = v11;

    -[MKLookAroundContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_lookAroundContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKLookAroundContainerView setAccessibilityIdentifier:](self->_lookAroundContainerView, "setAccessibilityIdentifier:", CFSTR("LookAroundPreview"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
    objc_msgSend(v13, "insertSubview:belowSubview:", self->_lookAroundContainerView, self->_lookAroundButton);

    v14 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tappedLookAroundPreview:");
    -[MKLookAroundContainerView addGestureRecognizer:](self->_lookAroundContainerView, "addGestureRecognizer:", v14);
    -[LookAroundButtonContainerViewController _updateBadgeLayout](self, "_updateBadgeLayout");
    -[LookAroundButtonContainerViewController _invalidateConstraints](self, "_invalidateConstraints");

  }
}

- (void)_unloadLookAroundContainerView
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  MKLookAroundContainerView *lookAroundContainerView;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  if (self->_lookAroundContainerView)
  {
    v4 = sub_100431B9C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class(self);
      v7 = NSStringFromClass(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v12, 0x16u);

    }
    -[MKLookAroundContainerView removeFromSuperview](self->_lookAroundContainerView, "removeFromSuperview");
    lookAroundContainerView = self->_lookAroundContainerView;
    self->_lookAroundContainerView = 0;

  }
}

- (void)_invalidateConstraints
{
  NSArray *constraints;

  if (self->_constraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    constraints = self->_constraints;
    self->_constraints = 0;

  }
}

- (void)_updateConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  MKLookAroundContainerView *lookAroundContainerView;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UIButton *lookAroundButton;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  MKLookAroundContainerView *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  MKLookAroundContainerView *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NSArray *v58;
  NSArray *constraints;
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
  _QWORD v71[2];
  _QWORD v72[4];
  _QWORD v73[4];

  if (!self->_constraints)
  {
    -[LookAroundButtonContainerViewController _buttonSize](self, "_buttonSize");
    v4 = v3;
    v6 = v5;
    -[LookAroundButtonContainerViewController _previewSize](self, "_previewSize");
    v9 = v7;
    v10 = v8;
    if (self->_expanded)
      v11 = v7;
    else
      v11 = v4;
    if (self->_expanded)
      v12 = v8;
    else
      v12 = v6;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[CardView topAnchor](self->_cardView, "topAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController view](self, "view"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "topAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v67));
    v73[0] = v66;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CardView leadingAnchor](self->_cardView, "leadingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController view](self, "view"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v62));
    v73[1] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CardView trailingAnchor](self->_cardView, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v14));
    v73[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CardView bottomAnchor](self->_cardView, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
    v73[3] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 4));
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v20));

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[CardView widthAnchor](self->_cardView, "widthAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToConstant:", v11));
    v72[0] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CardView heightAnchor](self->_cardView, "heightAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", v12));
    v72[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_lookAroundButton, "widthAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:", v4));
    v72[2] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_lookAroundButton, "heightAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", v6));
    v72[3] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 4));
    objc_msgSend(v65, "addObjectsFromArray:", v28);

    lookAroundContainerView = self->_lookAroundContainerView;
    if (lookAroundContainerView)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundContainerView widthAnchor](lookAroundContainerView, "widthAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToConstant:", v9));
      v71[0] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundContainerView heightAnchor](self->_lookAroundContainerView, "heightAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToConstant:", v10));
      v71[1] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 2));
      objc_msgSend(v65, "addObjectsFromArray:", v34);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v36 = objc_msgSend(v35, "userInterfaceIdiom");

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_lookAroundButton, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));
    objc_msgSend(v65, "addObject:", v40);

    lookAroundButton = self->_lookAroundButton;
    if (v36 == (id)5)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](lookAroundButton, "trailingAnchor"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
      v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "trailingAnchor"));
    }
    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](lookAroundButton, "leadingAnchor"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
      v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
    }
    v45 = (void *)v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v44));
    objc_msgSend(v65, "addObject:", v46);

    v47 = self->_lookAroundContainerView;
    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundContainerView bottomAnchor](v47, "bottomAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bottomAnchor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v50));
      objc_msgSend(v65, "addObject:", v51);

      v52 = self->_lookAroundContainerView;
      if (v36 == (id)5)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundContainerView trailingAnchor](v52, "trailingAnchor"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
        v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "trailingAnchor"));
      }
      else
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundContainerView leadingAnchor](v52, "leadingAnchor"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
        v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
      }
      v56 = (void *)v55;
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v55));
      objc_msgSend(v65, "addObject:", v57);

    }
    v58 = (NSArray *)objc_msgSend(v65, "copy");
    constraints = self->_constraints;
    self->_constraints = v58;

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
  }
}

- (void)_applyViewPropertiesForState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  UIButton *lookAroundButton;
  __int128 v8;
  void *v9;
  MKLookAroundContainerView *lookAroundContainerView;
  __int128 *v11;
  UIButton *v12;
  __int128 v13;
  void *v14;
  UIButton *v15;
  void *v16;
  __int128 v17;
  UIButton *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[6];
  _OWORD v25[3];
  _OWORD v26[6];
  _OWORD v27[6];
  _OWORD v28[3];
  _OWORD v29[6];
  _OWORD v30[3];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v31 = v3;
  v32 = v4;
  v33 = v5;
  switch(a3)
  {
    case 0:
      -[UIButton setHidden:](self->_lookAroundButton, "setHidden:", 0);
      -[UIButton setAlpha:](self->_lookAroundButton, "setAlpha:", 1.0);
      lookAroundButton = self->_lookAroundButton;
      v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v30[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v30[1] = v8;
      v30[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      -[UIButton setTransform:](lookAroundButton, "setTransform:", v30);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController _buttonTintColorForExpanded:](self, "_buttonTintColorForExpanded:", 0));
      -[UIButton setTintColor:](self->_lookAroundButton, "setTintColor:", v9);

      -[MKLookAroundContainerView setHidden:](self->_lookAroundContainerView, "setHidden:", 0);
      -[MKLookAroundContainerView setAlpha:](self->_lookAroundContainerView, "setAlpha:", 0.0);
      -[MKLookAroundContainerView setBadgeHidden:](self->_lookAroundContainerView, "setBadgeHidden:", 1);
      -[LookAroundButtonContainerViewController _collapsedPreviewTransform](self, "_collapsedPreviewTransform");
      lookAroundContainerView = self->_lookAroundContainerView;
      v29[0] = v29[3];
      v29[1] = v29[4];
      v29[2] = v29[5];
      v11 = v29;
      goto LABEL_6;
    case 1:
      -[UIButton setHidden:](self->_lookAroundButton, "setHidden:", 1);
      -[UIButton setAlpha:](self->_lookAroundButton, "setAlpha:", 0.0);
      v12 = self->_lookAroundButton;
      v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v28[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v28[1] = v13;
      v28[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      -[UIButton setTransform:](v12, "setTransform:", v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController _buttonTintColorForExpanded:](self, "_buttonTintColorForExpanded:", 0));
      -[UIButton setTintColor:](self->_lookAroundButton, "setTintColor:", v14);

      -[MKLookAroundContainerView setHidden:](self->_lookAroundContainerView, "setHidden:", 0);
      -[MKLookAroundContainerView setAlpha:](self->_lookAroundContainerView, "setAlpha:", 1.0);
      -[MKLookAroundContainerView setBadgeHidden:](self->_lookAroundContainerView, "setBadgeHidden:", 1);
      -[LookAroundButtonContainerViewController _collapsedPreviewTransform](self, "_collapsedPreviewTransform");
      lookAroundContainerView = self->_lookAroundContainerView;
      v27[0] = v27[3];
      v27[1] = v27[4];
      v27[2] = v27[5];
      v11 = v27;
      goto LABEL_6;
    case 2:
      -[UIButton setHidden:](self->_lookAroundButton, "setHidden:", 0);
      -[UIButton setAlpha:](self->_lookAroundButton, "setAlpha:", 1.0);
      -[LookAroundButtonContainerViewController _expandedButtonTransform](self, "_expandedButtonTransform");
      v15 = self->_lookAroundButton;
      v26[0] = v26[3];
      v26[1] = v26[4];
      v26[2] = v26[5];
      -[UIButton setTransform:](v15, "setTransform:", v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController _buttonTintColorForExpanded:](self, "_buttonTintColorForExpanded:", 1));
      -[UIButton setTintColor:](self->_lookAroundButton, "setTintColor:", v16);

      -[MKLookAroundContainerView setHidden:](self->_lookAroundContainerView, "setHidden:", 0);
      -[MKLookAroundContainerView setAlpha:](self->_lookAroundContainerView, "setAlpha:", 1.0);
      -[MKLookAroundContainerView setBadgeHidden:](self->_lookAroundContainerView, "setBadgeHidden:", 1);
      lookAroundContainerView = self->_lookAroundContainerView;
      v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v25[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v25[1] = v17;
      v25[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v11 = v25;
      goto LABEL_6;
    case 3:
      -[UIButton setHidden:](self->_lookAroundButton, "setHidden:", 1);
      -[UIButton setAlpha:](self->_lookAroundButton, "setAlpha:", 1.0);
      -[LookAroundButtonContainerViewController _expandedButtonTransform](self, "_expandedButtonTransform");
      v18 = self->_lookAroundButton;
      v24[0] = v24[3];
      v24[1] = v24[4];
      v24[2] = v24[5];
      -[UIButton setTransform:](v18, "setTransform:", v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController _buttonTintColorForExpanded:](self, "_buttonTintColorForExpanded:", 1));
      -[UIButton setTintColor:](self->_lookAroundButton, "setTintColor:", v19);

      -[MKLookAroundContainerView setHidden:](self->_lookAroundContainerView, "setHidden:", 0);
      -[MKLookAroundContainerView setAlpha:](self->_lookAroundContainerView, "setAlpha:", 1.0);
      -[MKLookAroundContainerView setBadgeHidden:](self->_lookAroundContainerView, "setBadgeHidden:", 0);
      lookAroundContainerView = self->_lookAroundContainerView;
      v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v21 = *(_OWORD *)&CGAffineTransformIdentity.a;
      v22 = v20;
      v23 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v11 = &v21;
LABEL_6:
      -[MKLookAroundContainerView setTransform:](lookAroundContainerView, "setTransform:", v11, v21, v22, v23);
      break;
    default:
      return;
  }
}

- (void)_updateBadgeLayout
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom") != (id)5;

  -[MKLookAroundContainerView setBadgeOnLeadingEdge:](self->_lookAroundContainerView, "setBadgeOnLeadingEdge:", v4);
}

- (CGSize)_buttonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_previewSize
{
  id v3;
  double v4;
  double v5;
  CGSize result;

  v3 = objc_msgSend((id)objc_opt_class(self), "previewSizeWithContainerStyle:", self->_containerStyle);
  objc_msgSend((id)objc_opt_class(self), "sizeForPreviewSize:", v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGAffineTransform)_expandedButtonTransform
{
  void *v5;
  int v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double v11;
  __int128 v12;
  CGAffineTransform *result;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom") != (id)5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController view](self, "view"));
  LODWORD(v5) = objc_msgSend(v7, "effectiveUserInterfaceLayoutDirection") == (id)1;

  v8 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v9;
  v10 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v10;
  v11 = 4.5;
  if (v6 != v5)
    v11 = -4.5;
  *(_OWORD *)&v16.a = v8;
  *(_OWORD *)&v16.c = v9;
  *(_OWORD *)&v16.tx = v10;
  CGAffineTransformTranslate(retstr, &v16, v11, 7.0);
  v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v16, &v15, 0.9, 0.9);
  v14 = *(_OWORD *)&v16.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v16.tx;
  return result;
}

- (CGAffineTransform)_collapsedPreviewTransform
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double v19;
  double v20;
  __int128 v21;
  CGAffineTransform *result;
  __int128 v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom") != (id)5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController view](self, "view"));
  v8 = objc_msgSend(v7, "effectiveUserInterfaceLayoutDirection");

  -[LookAroundButtonContainerViewController _buttonSize](self, "_buttonSize");
  v10 = v9;
  v12 = v11;
  -[LookAroundButtonContainerViewController _previewSize](self, "_previewSize");
  if (v10 / v13 <= v12 / v14)
    v15 = v12 / v14;
  else
    v15 = v10 / v13;
  v16 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v17;
  v18 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v18;
  v19 = (v13 - v10) * 0.5;
  v20 = -v19;
  if (v6 == (v8 == (id)1))
    v20 = v19;
  *(_OWORD *)&v25.a = v16;
  *(_OWORD *)&v25.c = v17;
  *(_OWORD *)&v25.tx = v18;
  CGAffineTransformTranslate(retstr, &v25, v20, (v14 - v12) * 0.5);
  v21 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v24.c = v21;
  *(_OWORD *)&v24.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v25, &v24, v15, v15);
  v23 = *(_OWORD *)&v25.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v25.a;
  *(_OWORD *)&retstr->c = v23;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v25.tx;
  return result;
}

- (id)_buttonTintColorForExpanded:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme floatingControlsTintColor](MapsTheme, "floatingControlsTintColor"));
  return v3;
}

- (void)tappedLookAroundButton:(id)a3
{
  LookAroundButtonContainerViewControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "enterLookAroundPIP:", v4);

}

- (void)tappedLookAroundPreview:(id)a3
{
  MKMapItem *mapItem;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  mapItem = self->_mapItem;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent"));
  objc_msgSend(WeakRetained, "enterLookAroundForMapItem:lookAroundView:", mapItem, v5);

}

+ (int64_t)previewSizeWithContainerStyle:(unint64_t)a3
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (a3 == 6)
    return 3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  objc_msgSend(v4, "bounds");
  v8 = v7;
  objc_msgSend(v4, "bounds");
  if (v6 >= v8)
    v11 = v10;
  else
    v11 = v9;
  if (v11 >= 375.0)
  {
    if (v11 <= 390.0)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(v4, "scale");
      if (v12 <= 2.0)
        v3 = 1;
      else
        v3 = 2;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (CGSize)sizeForPreviewSize:(int64_t)a3
{
  int64_t v3;
  double v4;
  double v5;
  CGSize result;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 2)
  {
    v5 = 66.0;
    v4 = 90.0;
  }
  else
  {
    v4 = dbl_100E39208[v3];
    v5 = dbl_100E39220[v3];
  }
  result.height = v5;
  result.width = v4;
  return result;
}

+ (double)expandedHeight
{
  double v2;

  objc_msgSend(a1, "sizeForPreviewSize:", objc_msgSend(a1, "previewSizeWithContainerStyle:", 1));
  return v2;
}

+ (BOOL)isIncompleteMapItem:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_identifier"));
  if (v4)
  {
    if ((objc_msgSend(v3, "_hasResolvablePartialInformation") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_geoMapItem"));
      v5 = objc_msgSend(v6, "hasExpiredComponents");

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (LookAroundButtonContainerViewControllerDelegate)delegate
{
  return (LookAroundButtonContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (unint64_t)containerStyle
{
  return self->_containerStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_lookAroundContainerView, 0);
  objc_storeStrong((id *)&self->_lookAroundButton, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
}

@end
