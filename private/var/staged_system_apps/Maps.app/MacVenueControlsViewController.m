@implementation MacVenueControlsViewController

- (MacVenueControlsViewController)initWithVenueFloorViewDelegate:(id)a3 venueBrowseDelegate:(id)a4 venuesManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  MacVenueControlsViewController *v11;
  MacVenueControlsViewController *v12;
  NSArray *floorOrdinals;
  NSDictionary *shortFloorNames;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MacVenueControlsViewController;
  v11 = -[MacVenueControlsViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_floorViewControllerDelegate, v8);
    objc_storeWeak((id *)&v12->_browseViewControllerDelegate, v9);
    objc_storeWeak((id *)&v12->_venuesManager, v10);
    floorOrdinals = v12->_floorOrdinals;
    v12->_floorOrdinals = (NSArray *)&__NSArray0__struct;

    shortFloorNames = v12->_shortFloorNames;
    v12->_shortFloorNames = (NSDictionary *)&__NSDictionary0__struct;

  }
  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *effectView;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  UIButton *v10;
  UIButton *browseButton;
  void *v12;
  HairlineView *v13;
  UIButton *v14;
  UIButton *floorPicker;
  void *v16;
  UIButton *v17;
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
  HairlineView *v46;
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
  objc_super v66;
  _QWORD v67[13];

  v66.receiver = self;
  v66.super_class = (Class)MacVenueControlsViewController;
  -[MacVenueControlsViewController viewDidLoad](&v66, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  effectView = self->_effectView;
  self->_effectView = v4;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_effectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self->_effectView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, 9.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_effectView);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_effectView, "contentView"));
  v8 = objc_claimAutoreleasedReturnValue(+[UIFont system16](UIFont, "system16"));
  v9 = objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("VenueBrowseFloorPickerTextColor")));
  v10 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  browseButton = self->_browseButton;
  self->_browseButton = v10;

  -[UIButton setAccessibilityIdentifier:](self->_browseButton, "setAccessibilityIdentifier:", CFSTR("VenueBrowseButton"));
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_browseButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_browseButton, "titleLabel"));
  objc_msgSend(v12, "setFont:", v8);

  -[UIButton setContentEdgeInsets:](self->_browseButton, "setContentEdgeInsets:", 5.0, 15.0, 5.0, 15.0);
  -[UIButton setTitleColor:forState:](self->_browseButton, "setTitleColor:forState:", v9, 0);
  -[UIButton addTarget:action:forControlEvents:](self->_browseButton, "addTarget:action:forControlEvents:", self, "browseVenue:", 64);
  objc_msgSend(v7, "addSubview:", self->_browseButton);
  v13 = objc_alloc_init(HairlineView);
  -[HairlineView setVertical:](v13, "setVertical:", 1);
  -[HairlineView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", v13);
  v14 = (UIButton *)objc_claimAutoreleasedReturnValue(+[MapsRightImageButton buttonWithType:](MapsRightImageButton, "buttonWithType:", 0));
  floorPicker = self->_floorPicker;
  self->_floorPicker = v14;

  -[UIButton setAccessibilityIdentifier:](self->_floorPicker, "setAccessibilityIdentifier:", CFSTR("FloorPickerButton"));
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_floorPicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setContentEdgeInsets:](self->_floorPicker, "setContentEdgeInsets:", 5.0, 15.0, 5.0, 15.0);
  v64 = (void *)v9;
  -[UIButton setTitleColor:forState:](self->_floorPicker, "setTitleColor:forState:", v9, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_floorPicker, "titleLabel"));
  v65 = (void *)v8;
  objc_msgSend(v16, "setFont:", v8);

  v17 = self->_floorPicker;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v8, 2));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.up.chevron.down"), v18));
  -[UIButton setImage:forState:](v17, "setImage:forState:", v19, 0);

  -[UIButton setTintColor:](self->_floorPicker, "setTintColor:", v9);
  -[UIButton setShowsMenuAsPrimaryAction:](self->_floorPicker, "setShowsMenuAsPrimaryAction:", 1);
  objc_msgSend(v7, "addSubview:", self->_floorPicker);
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController view](self, "view"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "heightAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](self->_effectView, "heightAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v67[0] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController view](self, "view"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "widthAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView widthAnchor](self->_effectView, "widthAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
  v67[1] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_browseButton, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v67[2] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_browseButton, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v67[3] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_browseButton, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v67[4] = v47;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView leadingAnchor](v13, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_browseButton, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v67[5] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView centerYAnchor](v13, "centerYAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerYAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v40));
  v67[6] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView topAnchor](v13, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 8.0));
  v67[7] = v36;
  v46 = v13;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView bottomAnchor](v13, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -8.0));
  v67[8] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_floorPicker, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView trailingAnchor](v13, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v67[9] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_floorPicker, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v20));
  v67[10] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_floorPicker, "topAnchor"));
  v41 = v7;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v67[11] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_floorPicker, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  v67[12] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 13));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  -[MapsThemeViewController updateTheme](self, "updateTheme");
}

- (void)setOpen:(BOOL)a3
{
  -[MacVenueControlsViewController setOpen:animated:](self, "setOpen:animated:", a3, 1);
}

- (void)setOpen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;

  if (self->_open != a3)
  {
    v4 = a3;
    self->_open = a3;
    -[MacVenueControlsViewController toggleHidden](self, "toggleHidden");
    if (v4)
      -[MacVenueControlsViewController didOpen](self, "didOpen");
    else
      -[MacVenueControlsViewController didClose](self, "didClose");
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController view](self, "view"));
  v6 = objc_msgSend(v5, "isHidden");

  if (v6 != v3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController view](self, "view"));
    objc_msgSend(v7, "setHidden:", v3);

  }
}

- (BOOL)isHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController view](self, "view"));
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setForceHidden:(BOOL)a3
{
  -[MacVenueControlsViewController setForceHidden:animated:completion:](self, "setForceHidden:animated:completion:", a3, 0, 0);
}

- (void)setForceHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (self->_forceHidden != v6)
  {
    self->_forceHidden = v6;
    v10 = v8;
    -[MacVenueControlsViewController updateHiddenAnimated:completion:](self, "updateHiddenAnimated:completion:", v5, v8);
    goto LABEL_5;
  }
  if (v8)
  {
    v10 = v8;
    (*((void (**)(id))v8 + 2))(v8);
LABEL_5:
    v9 = v10;
  }

}

- (BOOL)lacksSearchResultsForFloorOrdinal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorViewControllerDelegate](self, "floorViewControllerDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController venue](self, "venue"));
  v7 = objc_msgSend(v4, "shortValue");

  LOBYTE(v4) = objc_msgSend(v5, "lacksSearchResultsInVenue:forFloorOrdinal:", v6, v7);
  return (char)v4;
}

- (void)didChangeSearchResultsInVenue
{
  -[MacVenueControlsViewController updateDisplayedFloor](self, "updateDisplayedFloor");
}

- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5
{
  uint64_t v5;

  v5 = a5;
  -[MacVenueControlsViewController setVenue:focusedBuilding:animated:forceUpdate:](self, "setVenue:focusedBuilding:animated:forceUpdate:", a3, a4, 1, 0);
  if (a3)
  {
    -[MacVenueControlsViewController updateBrowseVenueText](self, "updateBrowseVenueText");
    -[MacVenueControlsViewController setDisplayedFloorOrdinal:](self, "setDisplayedFloorOrdinal:", v5);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MacVenueControlsViewController;
  -[MacVenueControlsViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MacVenueControlsViewController setVisible:](self, "setVisible:", 1);
  -[MacVenueControlsViewController toggleHidden](self, "toggleHidden");
  -[MacVenueControlsViewController updateVenueAndBuildingsAnimated:forced:](self, "updateVenueAndBuildingsAnimated:forced:", 0, 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MacVenueControlsViewController setVisible:](self, "setVisible:", 0);
  v5.receiver = self;
  v5.super_class = (Class)MacVenueControlsViewController;
  -[MacVenueControlsViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (BOOL)shouldBeHidden
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[MacVenueControlsViewController forceHidden](self, "forceHidden"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController venue](self, "venue"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorOrdinals](self, "floorOrdinals"));
    v3 = (unint64_t)objc_msgSend(v5, "count") < 2;

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)updateHiddenAnimated:(BOOL)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  unsigned int v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);
  char v12;
  _QWORD v13[5];
  char v14;

  v6 = (void (**)(_QWORD))a4;
  v7 = -[MacVenueControlsViewController shouldBeHidden](self, "shouldBeHidden");
  if (v7 == -[MacVenueControlsViewController isHidden](self, "isHidden"))
    goto LABEL_8;
  if (!a3)
  {
    if (!v7)
    {
      -[MacVenueControlsViewController didStartShowing](self, "didStartShowing");
      -[MacVenueControlsViewController setHidden:](self, "setHidden:", 0);
      -[MacVenueControlsViewController didFinishShowing](self, "didFinishShowing");
      if (!v6)
        goto LABEL_10;
      goto LABEL_9;
    }
    -[MacVenueControlsViewController didStartHiding](self, "didStartHiding");
    -[MacVenueControlsViewController setHidden:](self, "setHidden:", 1);
    -[MacVenueControlsViewController setOpen:animated:](self, "setOpen:animated:", 0, 0);
    -[MacVenueControlsViewController didFinishHiding](self, "didFinishHiding");
LABEL_8:
    if (!v6)
      goto LABEL_10;
LABEL_9:
    v6[2](v6);
    goto LABEL_10;
  }
  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController view](self, "view"));
    objc_msgSend(v8, "setAlpha:", 0.0);

    -[MacVenueControlsViewController setHidden:](self, "setHidden:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController view](self, "view"));
    objc_msgSend(v9, "layoutIfNeeded");

  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10090F550;
  v13[3] = &unk_1011ACE58;
  v14 = v7;
  v13[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10090F5EC;
  v10[3] = &unk_1011C60D8;
  v10[4] = self;
  v12 = v7;
  v11 = v6;
  +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v13, v10);

LABEL_10:
}

- (void)toggleHidden
{
  if (-[MacVenueControlsViewController isVisible](self, "isVisible"))
    -[MacVenueControlsViewController setHidden:](self, "setHidden:", -[MacVenueControlsViewController isHidden](self, "isHidden") ^ 1);
}

- (void)updateVenueAndBuildingsAnimated:(BOOL)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController venuesManager](self, "venuesManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "venueWithFocus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController venuesManager](self, "venuesManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venueBuildingWithFocus"));
  -[MacVenueControlsViewController setVenue:focusedBuilding:animated:forceUpdate:](self, "setVenue:focusedBuilding:animated:forceUpdate:", v7, v9, v5, v4);

}

- (void)setVenue:(id)a3 focusedBuilding:(id)a4 animated:(BOOL)a5 forceUpdate:(BOOL)a6
{
  _BOOL8 v7;
  VKVenueFeatureMarker *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  MacVenueControlsViewController *v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  NSMutableSet *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  _QWORD *v35;
  void (**v36)(_QWORD);
  MacVenueControlsViewController *v37;
  uint64_t v38;
  _BOOL4 v39;
  id v40;
  VKVenueFeatureMarker *v41;
  _QWORD v42[4];
  void (**v43)(_QWORD);
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  BOOL v50;
  _BYTE v51[128];

  v7 = a5;
  v10 = (VKVenueFeatureMarker *)a3;
  v11 = objc_claimAutoreleasedReturnValue(-[VKVenueFeatureMarker buildings](v10, "buildings"));
  v12 = (void *)v11;
  v13 = &__NSArray0__struct;
  if (v11)
    v13 = (void *)v11;
  v14 = v13;

  if (!a6 && self->_venue == v10)
  {
    v16 = self;
    v17 = v7;
    v15 = 0;
    goto LABEL_21;
  }
  objc_storeStrong((id *)&self->_venue, a3);
  -[MacVenueControlsViewController updateBrowseVenueText](self, "updateBrowseVenueText");
  if (-[MacVenueControlsViewController isHidden](self, "isHidden")
    || !-[MacVenueControlsViewController shouldBeHidden](self, "shouldBeHidden")
    || !v7)
  {
    v39 = v7;
    v41 = v10;
    v18 = objc_opt_new(NSMutableDictionary);
    v19 = objc_opt_new(NSMutableSet);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v40 = v14;
    v20 = v14;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "floorOrdinals"));
          -[NSMutableSet addObjectsFromArray:](v19, "addObjectsFromArray:", v26);

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "floorNames"));
          -[NSMutableDictionary addEntriesFromDictionary:](v18, "addEntriesFromDictionary:", v27);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v22);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v19, "allObjects"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "sortedArrayUsingSelector:", "compare:"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "reverseObjectEnumerator"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allObjects"));

    if (!a6)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorOrdinals](self, "floorOrdinals"));
      if (+[NSArray array:isEqualToArray:](NSArray, "array:isEqualToArray:", v31, v32))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController shortFloorNames](self, "shortFloorNames"));
        v34 = +[NSDictionary dictionary:isEqualToDictionary:](NSDictionary, "dictionary:isEqualToDictionary:", v18, v33);

        if (v34)
        {
          -[MacVenueControlsViewController updateHiddenAnimated:completion:](self, "updateHiddenAnimated:completion:", v39, 0);
          v14 = v40;
          v10 = v41;
LABEL_30:

          goto LABEL_31;
        }
      }
      else
      {

      }
    }
    objc_storeStrong((id *)&self->_floorOrdinals, v31);
    objc_storeStrong((id *)&self->_shortFloorNames, v18);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10090FB68;
    v44[3] = &unk_1011AC860;
    v44[4] = self;
    v35 = objc_retainBlock(v44);
    v36 = (void (**)(_QWORD))v35;
    if (v39)
    {
      if (!-[MacVenueControlsViewController isHidden](self, "isHidden"))
      {
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_10090FB70;
        v42[3] = &unk_1011ADA00;
        v43 = v36;
        +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v42, 0);

        goto LABEL_29;
      }
      v36[2](v36);
      v37 = self;
      v38 = 1;
    }
    else
    {
      ((void (*)(_QWORD *))v35[2])(v35);
      v37 = self;
      v38 = 0;
    }
    -[MacVenueControlsViewController updateHiddenAnimated:completion:](v37, "updateHiddenAnimated:completion:", v38, 0);
LABEL_29:
    v14 = v40;
    v10 = v41;

    goto LABEL_30;
  }
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10090FB54;
  v49[3] = &unk_1011ACE58;
  v49[4] = self;
  v50 = a6;
  v15 = v49;
  v16 = self;
  v17 = 1;
LABEL_21:
  -[MacVenueControlsViewController updateHiddenAnimated:completion:](v16, "updateHiddenAnimated:completion:", v17, v15);
LABEL_31:

}

- (void)updateDisplayedFloor
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController venue](self, "venue"));

  if (v3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController venuesManager](self, "venuesManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController venue](self, "venue"));
    -[MacVenueControlsViewController setDisplayedFloorOrdinal:](self, "setDisplayedFloorOrdinal:", objc_msgSend(v5, "displayedFloorOrdinalForBuildingsInVenue:", v4));

  }
}

- (void)updateBrowseVenueText
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController venue](self, "venue"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortName"));

  v4 = objc_msgSend(v9, "length");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v4)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Browse [venue with name]"), CFSTR("localized string not found"), 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9));
    v6 = (void *)v7;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Browse [venue without name]"), CFSTR("localized string not found"), 0));
  }

  -[UIButton setTitle:forState:](self->_browseButton, "setTitle:forState:", v8, 0);
}

- (void)setDisplayedFloorOrdinal:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  _QWORD v21[6];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorOrdinals](self, "floorOrdinals"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController shortFloorNames](self, "shortFloorNames"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10090FFA4;
        v21[3] = &unk_1011DBD70;
        v21[4] = self;
        v21[5] = v10;
        v13 = v12;
        v22 = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v13, 0, v13, v21));
        objc_msgSend(v14, "setState:", objc_msgSend(v10, "shortValue") == (_DWORD)v3);
        if (-[MacVenueControlsViewController lacksSearchResultsForFloorOrdinal:](self, "lacksSearchResultsForFloorOrdinal:", v10))
        {
          objc_msgSend(v14, "setAttributes:", 1);
        }
        objc_msgSend(v5, "addObject:", v14);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController shortFloorNames](self, "shortFloorNames"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v3));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorPicker](self, "floorPicker"));
  objc_msgSend(v18, "setTitle:forState:", v17, 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v5));
  -[UIButton setMenu:](self->_floorPicker, "setMenu:", v19);

}

- (void)selectedFloorOrdinal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController shortFloorNames](self, "shortFloorNames"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorPicker](self, "floorPicker"));
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

}

- (void)browseVenue:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController browseViewControllerDelegate](self, "browseViewControllerDelegate", a3));
  objc_msgSend(v3, "viewControllerDidSelectBrowseVenue:", 0);

}

- (void)didChangeConstraints
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorViewControllerDelegate](self, "floorViewControllerDelegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidChangeConstraints:", self);

}

- (void)didStartHiding
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorViewControllerDelegate](self, "floorViewControllerDelegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidStartHiding:", self);

}

- (void)didFinishHiding
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorViewControllerDelegate](self, "floorViewControllerDelegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidFinishHiding:", self);

}

- (void)didStartShowing
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorViewControllerDelegate](self, "floorViewControllerDelegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidStartShowing:", self);

}

- (void)didFinishShowing
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorViewControllerDelegate](self, "floorViewControllerDelegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidFinishShowing:", self);

}

- (void)didOpen
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorViewControllerDelegate](self, "floorViewControllerDelegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidOpen:", self);

}

- (void)didClose
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacVenueControlsViewController floorViewControllerDelegate](self, "floorViewControllerDelegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidClose:", self);

}

- (BOOL)isOpen
{
  return self->_open;
}

- (NSNumber)userLocationFloorOrdinal
{
  return self->_userLocationFloorOrdinal;
}

- (void)setUserLocationFloorOrdinal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (UIButton)floorPicker
{
  return self->_floorPicker;
}

- (VenueFloorViewControllerDelegate)floorViewControllerDelegate
{
  return (VenueFloorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_floorViewControllerDelegate);
}

- (void)setFloorViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_floorViewControllerDelegate, a3);
}

- (BrowseVenueViewControllerDelegate)browseViewControllerDelegate
{
  return (BrowseVenueViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_browseViewControllerDelegate);
}

- (void)setBrowseViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_browseViewControllerDelegate, a3);
}

- (VenuesManager)venuesManager
{
  return (VenuesManager *)objc_loadWeakRetained((id *)&self->_venuesManager);
}

- (void)setVenuesManager:(id)a3
{
  objc_storeWeak((id *)&self->_venuesManager, a3);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (VKVenueFeatureMarker)venue
{
  return self->_venue;
}

- (void)setVenue:(id)a3
{
  objc_storeStrong((id *)&self->_venue, a3);
}

- (NSArray)floorOrdinals
{
  return self->_floorOrdinals;
}

- (void)setFloorOrdinals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)shortFloorNames
{
  return self->_shortFloorNames;
}

- (void)setShortFloorNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortFloorNames, 0);
  objc_storeStrong((id *)&self->_floorOrdinals, 0);
  objc_storeStrong((id *)&self->_venue, 0);
  objc_destroyWeak((id *)&self->_venuesManager);
  objc_destroyWeak((id *)&self->_browseViewControllerDelegate);
  objc_destroyWeak((id *)&self->_floorViewControllerDelegate);
  objc_storeStrong((id *)&self->_floorPicker, 0);
  objc_storeStrong((id *)&self->_userLocationFloorOrdinal, 0);
  objc_storeStrong((id *)&self->_browseButton, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
