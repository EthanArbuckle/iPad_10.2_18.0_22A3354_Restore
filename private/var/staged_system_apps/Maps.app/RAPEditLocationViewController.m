@implementation RAPEditLocationViewController

- (RAPEditLocationViewController)initWithInitialCoordinates:(CLLocationCoordinate2D)a3 inMapRect:(id)a4 analyticsTarget:(int)a5 markerViewAttributes:(id)a6 allowEditingEntryPoints:(BOOL)a7 correctableEntryPoints:(id)a8 selectionHandler:(id)a9 cancelSelectionHandler:(id)a10
{
  uint64_t v14;
  double var1;
  double var0;
  double v17;
  double v18;
  double longitude;
  double latitude;
  id v22;
  id v23;
  id v24;
  RAPEditLocationViewController *v25;
  id v26;
  id selectionHandler;
  id v28;
  id cancelSelectionHandler;
  RAPCorrectableEntryPoints *v30;
  RAPCorrectableEntryPoints *correctableEntryPoints;
  objc_super v33;

  v14 = *(_QWORD *)&a5;
  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v17 = a4.var0.var1;
  v18 = a4.var0.var0;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v33.receiver = self;
  v33.super_class = (Class)RAPEditLocationViewController;
  v25 = -[EditLocationViewController initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:](&v33, "initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:", v14, a6, latitude, longitude, v18, v17, var0, var1);
  if (v25)
  {
    v26 = objc_msgSend(v23, "copy");
    selectionHandler = v25->_selectionHandler;
    v25->_selectionHandler = v26;

    v28 = objc_msgSend(v24, "copy");
    cancelSelectionHandler = v25->_cancelSelectionHandler;
    v25->_cancelSelectionHandler = v28;

    v30 = (RAPCorrectableEntryPoints *)objc_msgSend(v22, "copy");
    correctableEntryPoints = v25->_correctableEntryPoints;
    v25->_correctableEntryPoints = v30;

    v25->_allowEditingEntryPoints = a7;
  }

  return v25;
}

- (void)viewDidLoad
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
  id v13;
  void *v14;
  UISegmentedControl *v15;
  UISegmentedControl *editModeSegmentedControl;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BackgroundColorButton *v33;
  BackgroundColorButton *addButton;
  BackgroundColorButton *v35;
  void *v36;
  void *v37;
  BackgroundColorButton *v38;
  void *v39;
  BackgroundColorButton *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v53;
  _QWORD v54[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationTitle](self, "navigationTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setTitle:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Back"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationItem](self, "navigationItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backBarButtonItem"));
  objc_msgSend(v8, "setTitle:", v6);

  if (self->_allowEditingEntryPoints)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Location [Report an Issue]"), CFSTR("localized string not found"), 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Entrances [Report an Issue]"), CFSTR("localized string not found"), 0));

    v13 = objc_alloc((Class)UISegmentedControl);
    v54[0] = v10;
    v54[1] = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 2));
    v15 = (UISegmentedControl *)objc_msgSend(v13, "initWithItems:", v14);
    editModeSegmentedControl = self->_editModeSegmentedControl;
    self->_editModeSegmentedControl = v15;

    -[UISegmentedControl setSelectedSegmentIndex:](self->_editModeSegmentedControl, "setSelectedSegmentIndex:", 0);
    -[UISegmentedControl addTarget:action:forControlEvents:](self->_editModeSegmentedControl, "addTarget:action:forControlEvents:", self, "selectedEditModeDidChange:", 4096);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController editModeSegmentedControl](self, "editModeSegmentedControl"));
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController editModeSegmentedControl](self, "editModeSegmentedControl"));
    objc_msgSend(v18, "addSubview:", v19);

  }
  v20 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "didTapDone");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v21, "setRightBarButtonItem:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationItem](self, "navigationItem"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "rightBarButtonItem"));
  objc_msgSend(v23, "setEnabled:", 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController cancelSelectionHandler](self, "cancelSelectionHandler"));
  if (v24)
  {
    v25 = objc_alloc((Class)UIBarButtonItem);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Cancel [Report an Issue]"), CFSTR("localized string not found"), 0));
    v28 = objc_msgSend(v25, "initWithTitle:style:target:action:", v27, 0, self, "didTapCancel");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v29, "setLeftBarButtonItem:", v28);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v31, "addSubview:", v32);

  if (self->_allowEditingEntryPoints)
  {
    v33 = (BackgroundColorButton *)objc_claimAutoreleasedReturnValue(+[BackgroundColorButton buttonWithType:](BackgroundColorButton, "buttonWithType:", 0));
    addButton = self->_addButton;
    self->_addButton = v33;

    v35 = self->_addButton;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Add Entrance [Report an Issue]"), CFSTR("localized string not found"), 0));
    -[BackgroundColorButton setTitle:forState:](v35, "setTitle:forState:", v37, 0);

    v38 = self->_addButton;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[BackgroundColorButton setBackgroundColor:forState:](v38, "setBackgroundColor:forState:", v39, 0);

    v40 = self->_addButton;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[BackgroundColorButton setTitleColor:forState:](v40, "setTitleColor:forState:", v41, 0);

    -[BackgroundColorButton addTarget:action:forControlEvents:](self->_addButton, "addTarget:action:forControlEvents:", self, "addEntryPoint", 64);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v42, "nativeScale");
    v44 = 1.0 / v43;

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton layer](self->_addButton, "layer"));
    objc_msgSend(v45, "setBorderWidth:", v44);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton theme](self->_addButton, "theme"));
    v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "hairlineColor")));
    v48 = objc_msgSend(v47, "CGColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton layer](self->_addButton, "layer"));
    objc_msgSend(v49, "setBorderColor:", v48);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton traitCollection](self->_addButton, "traitCollection"));
    +[UISegmentedControl _cornerRadiusForTraitCollection:size:](UISegmentedControl, "_cornerRadiusForTraitCollection:size:", v50, 0);
    -[BackgroundColorButton _setContinuousCornerRadius:](self->_addButton, "_setContinuousCornerRadius:");

    -[BackgroundColorButton setHidden:](self->_addButton, "setHidden:", 1);
    -[BackgroundColorButton setTranslatesAutoresizingMaskIntoConstraints:](self->_addButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController view](self, "view"));
    objc_msgSend(v51, "addSubview:", self->_addButton);

  }
  v53.receiver = self;
  v53.super_class = (Class)RAPEditLocationViewController;
  -[EditLocationViewController viewDidLoad](&v53, "viewDidLoad");
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController view](self, "view"));
  objc_msgSend(v52, "bringSubviewToFront:", self->_addButton);

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
  uint64_t v41;
  uint64_t v42;
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
  id v67;
  _QWORD v68[8];
  _QWORD v69[3];

  v67 = objc_alloc_init((Class)NSMutableArray);
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController view](self, "view"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v59));
  v69[0] = v57;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v4));
  v69[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  v69[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 3));
  objc_msgSend(v67, "addObjectsFromArray:", v11);

  if (self->_allowEditingEntryPoints)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController editModeSegmentedControl](self, "editModeSegmentedControl"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController view](self, "view"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "layoutMarginsGuide"));
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v41, 8.0));
    v68[0] = v42;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController editModeSegmentedControl](self, "editModeSegmentedControl"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "trailingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController view](self, "view"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "layoutMarginsGuide"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "trailingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v58, -8.0));
    v68[1] = v56;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController editModeSegmentedControl](self, "editModeSegmentedControl"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController view](self, "view"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "safeAreaLayoutGuide"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "topAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 15.0));
    v68[2] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController editModeSegmentedControl](self, "editModeSegmentedControl"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 15.0));
    v68[3] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController addButton](self, "addButton"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingContentGuide"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v68[4] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController addButton](self, "addButton"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingContentGuide"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
    v68[5] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController addButton](self, "addButton"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomContentGuide"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -8.0));
    v68[6] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController addButton](self, "addButton"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "heightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 45.0));
    v68[7] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 8));
    objc_msgSend(v67, "addObjectsFromArray:", v21);

    v22 = (void *)v41;
    v23 = v43;

    v24 = (void *)v42;
    v25 = v46;

    v26 = v51;
    v27 = v50;

  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController view](self, "view"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "safeAreaLayoutGuide"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
    objc_msgSend(v67, "addObject:", v24);
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v67);
}

- (NSString)navigationTitle
{
  NSString *navigationTitle;
  _BOOL4 allowEditingEntryPoints;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSString *v8;
  NSString *v9;

  navigationTitle = self->_navigationTitle;
  if (!navigationTitle)
  {
    allowEditingEntryPoints = self->_allowEditingEntryPoints;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    if (allowEditingEntryPoints)
      v7 = CFSTR("Location & Entrances [Report an Issue]");
    else
      v7 = CFSTR("Edit Location [Report an Issue]");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));
    v9 = self->_navigationTitle;
    self->_navigationTitle = v8;

    navigationTitle = self->_navigationTitle;
  }
  return navigationTitle;
}

- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  void *v7;
  id v8;

  longitude = a4.longitude;
  latitude = a4.latitude;
  if (-[RAPEditLocationViewController _isInEditLocationMode](self, "_isInEditLocationMode", a3))
  {
    self->_lastEditLocationCoordinate.latitude = latitude;
    self->_lastEditLocationCoordinate.longitude = longitude;
    if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationItem](self, "navigationItem"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rightBarButtonItem"));
      objc_msgSend(v7, "setEnabled:", 1);

    }
  }
}

- (void)didTapCancel
{
  void *v3;
  void (**v4)(void);
  id v5;
  id v6;

  -[EditLocationViewController _captureUserAction:](self, "_captureUserAction:", 18);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController cancelSelectionHandler](self, "cancelSelectionHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController cancelSelectionHandler](self, "cancelSelectionHandler"));
    v4[2]();

  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationController](self, "navigationController"));
  v5 = objc_msgSend(v6, "popViewControllerAnimated:", 1);

}

- (void)didTapDone
{
  unsigned int v3;
  void (**v4)(_QWORD, _QWORD, double, double);
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;

  -[EditLocationViewController _captureUserAction:](self, "_captureUserAction:", 41);
  v3 = -[RAPEditLocationViewController _isInEditLocationMode](self, "_isInEditLocationMode");
  v4 = (void (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController selectionHandler](self, "selectionHandler"));
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    objc_msgSend(v5, "centerCoordinate");
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController correctableEntryPoints](self, "correctableEntryPoints"));
    ((void (**)(_QWORD, void *, double, double))v4)[2](v4, v10, v7, v9);

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController correctableEntryPoints](self, "correctableEntryPoints"));
    ((void (**)(_QWORD, void *, double, double))v4)[2](v4, v5, self->_lastEditLocationCoordinate.latitude, self->_lastEditLocationCoordinate.longitude);
  }

  v12 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationController](self, "navigationController"));
  v11 = objc_msgSend(v12, "popViewControllerAnimated:", 1);

}

- (void)reloadData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "annotations"));
  objc_msgSend(v13, "removeAnnotations:", v4);

  v5 = objc_alloc((Class)MKPointAnnotation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController attributes](self, "attributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v8 = objc_msgSend(v5, "initWithCoordinate:title:subtitle:", v7, 0, self->_lastEditLocationCoordinate.latitude, self->_lastEditLocationCoordinate.longitude);

  v9 = objc_alloc((Class)NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController correctableEntryPoints](self, "correctableEntryPoints"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "workingPoints"));
  v12 = objc_msgSend(v9, "initWithArray:", v11);

  objc_msgSend(v12, "addObject:", v8);
  objc_msgSend(v13, "showAnnotations:animated:", v12, 0);

}

- (void)selectedEditModeDidChange:(id)a3
{
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
  uint64_t v15;
  void *v16;
  void *v17;
  CLLocationDegrees v18;
  CLLocationDegrees v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;

  if (-[RAPEditLocationViewController _isInEditLocationMode](self, "_isInEditLocationMode", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    objc_msgSend(v4, "setCrosshairEnabled:", 1);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "annotations"));
    objc_msgSend(v6, "removeAnnotations:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Pan & zoom map to refine location [Report an Issue]"), CFSTR("localized string not found"), 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    objc_msgSend(v12, "setPrompt:", v11);

    -[BackgroundColorButton setHidden:](self->_addButton, "setHidden:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapView"));
    objc_msgSend(v14, "setCenterCoordinate:animated:", 0, self->_lastEditLocationCoordinate.latitude, self->_lastEditLocationCoordinate.longitude);
    v15 = 10184;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapView"));
    objc_msgSend(v17, "centerCoordinate");
    self->_lastEditLocationCoordinate.latitude = v18;
    self->_lastEditLocationCoordinate.longitude = v19;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    objc_msgSend(v20, "setCrosshairEnabled:", 0);

    -[RAPEditLocationViewController reloadData](self, "reloadData");
    -[BackgroundColorButton setHidden:](self->_addButton, "setHidden:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController correctableEntryPoints](self, "correctableEntryPoints"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "workingPoints"));
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Choose an entrance to edit [Report an Issue]"), CFSTR("localized string not found"), 0));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
      objc_msgSend(v24, "setPrompt:", v14);

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
      objc_msgSend(v14, "setPrompt:", v13);
    }
    v15 = 10187;
  }

  -[EditLocationViewController _captureUserAction:](self, "_captureUserAction:", v15);
}

- (void)addEntryPoint
{
  RAPEditEntryPointViewController *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  RAPEditEntryPointViewController *v15;

  -[EditLocationViewController _captureUserAction:](self, "_captureUserAction:", 10189);
  v3 = [RAPEditEntryPointViewController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
  objc_msgSend(v5, "visibleMapRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v15 = -[RAPEditEntryPointViewController initWithMapRect:entryPoint:delegate:initialViewMode:](v3, "initWithMapRect:entryPoint:delegate:initialViewMode:", 0, self, objc_msgSend(v14, "viewMode"), v7, v9, v11, v13);

  -[RAPEditLocationViewController _presentEntryPointEditor:](self, "_presentEntryPointEditor:", v15);
}

- (void)_presentEntryPointEditor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v4);
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  objc_msgSend(v7, "setModalInPresentation:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationController](self, "navigationController"));
  objc_msgSend(v7, "setOverrideUserInterfaceStyle:", objc_msgSend(v5, "overrideUserInterfaceStyle"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationController](self, "navigationController"));
  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", objc_msgSend(v6, "overrideUserInterfaceStyle"));

  -[RAPEditLocationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)userDidRequestDeletionOfEntryPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController correctableEntryPoints](self, "correctableEntryPoints"));
  objc_msgSend(v5, "removeEntryPoint:", v4);

  -[RAPEditLocationViewController reloadData](self, "reloadData");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationItem](self, "navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightBarButtonItem"));
  objc_msgSend(v6, "setEnabled:", 1);

}

- (id)userDidRequestCreationOfEntryPointWithCoordinates:(CLLocationCoordinate2D)a3 entryPointType:(int64_t)a4
{
  double longitude;
  double latitude;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController correctableEntryPoints](self, "correctableEntryPoints"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "createEntryPointWithCoordinates:entryPointType:", a4, latitude, longitude));

  -[RAPEditLocationViewController reloadData](self, "reloadData");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationItem](self, "navigationItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rightBarButtonItem"));
  objc_msgSend(v11, "setEnabled:", 1);

  return v9;
}

- (void)userDidRequestModificationOfEntryPoint:(id)a3 withCoordinates:(CLLocationCoordinate2D)a4 entryPointType:(int64_t)a5
{
  double longitude;
  double latitude;
  id v9;
  void *v10;
  void *v11;
  id v12;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController correctableEntryPoints](self, "correctableEntryPoints"));
  objc_msgSend(v10, "modifyEntryPoint:withCoordinates:entryPointType:", v9, a5, latitude, longitude);

  -[RAPEditLocationViewController reloadData](self, "reloadData");
  v12 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationViewController navigationItem](self, "navigationItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rightBarButtonItem"));
  objc_msgSend(v11, "setEnabled:", 1);

}

- (void)editEntryPointController:(id)a3 willDismissWithViewMode:(int64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView", a3));
  objc_msgSend(v5, "setViewMode:", a4);

}

- (void)editLocationMapView:(id)a3 didSelectAnnotationView:(id)a4
{
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  RAPEditEntryPointViewController *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  RAPEditEntryPointViewController *v21;
  id v22;

  v22 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "annotation"));
  v6 = objc_opt_class(RAPEntryPoint);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    -[EditLocationViewController _captureUserAction:](self, "_captureUserAction:", 10188);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "annotation"));
    v9 = [RAPEditEntryPointViewController alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));
    objc_msgSend(v11, "visibleMapRect");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v21 = -[RAPEditEntryPointViewController initWithMapRect:entryPoint:delegate:initialViewMode:](v9, "initWithMapRect:entryPoint:delegate:initialViewMode:", v8, self, objc_msgSend(v20, "viewMode"), v13, v15, v17, v19);

    -[RAPEditLocationViewController _presentEntryPointEditor:](self, "_presentEntryPointEditor:", v21);
  }

}

- (BOOL)_isInEditLocationMode
{
  return !self->_allowEditingEntryPoints
      || -[UISegmentedControl selectedSegmentIndex](self->_editModeSegmentedControl, "selectedSegmentIndex") == 0;
}

- (void)editLocationMapViewFinishedPanning:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[RAPEditLocationViewController _isInEditLocationMode](self, "_isInEditLocationMode"))
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPEditLocationViewController;
    -[EditLocationViewController editLocationMapViewFinishedPanning:](&v5, "editLocationMapViewFinishedPanning:", v4);
  }

}

- (void)editLocationMapViewFinishedZoomingIn:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[RAPEditLocationViewController _isInEditLocationMode](self, "_isInEditLocationMode"))
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPEditLocationViewController;
    -[EditLocationViewController editLocationMapViewFinishedZoomingIn:](&v5, "editLocationMapViewFinishedZoomingIn:", v4);
  }

}

- (void)editLocationMapViewFinishedZoomingOut:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[RAPEditLocationViewController _isInEditLocationMode](self, "_isInEditLocationMode"))
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPEditLocationViewController;
    -[EditLocationViewController editLocationMapViewFinishedZoomingOut:](&v5, "editLocationMapViewFinishedZoomingOut:", v4);
  }

}

- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  if (-[RAPEditLocationViewController _isInEditLocationMode](self, "_isInEditLocationMode"))
  {
    v7.receiver = self;
    v7.super_class = (Class)RAPEditLocationViewController;
    -[EditLocationViewController editLocationMapView:didChangeViewMode:](&v7, "editLocationMapView:didChangeViewMode:", v6, a4);
  }

}

- (void)setNavigationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_navigationTitle, a3);
}

- (BackgroundColorButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
  objc_storeStrong((id *)&self->_addButton, a3);
}

- (UISegmentedControl)editModeSegmentedControl
{
  return self->_editModeSegmentedControl;
}

- (void)setEditModeSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_editModeSegmentedControl, a3);
}

- (RAPCorrectableEntryPoints)correctableEntryPoints
{
  return self->_correctableEntryPoints;
}

- (void)setCorrectableEntryPoints:(id)a3
{
  objc_storeStrong((id *)&self->_correctableEntryPoints, a3);
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)cancelSelectionHandler
{
  return self->_cancelSelectionHandler;
}

- (void)setCancelSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelSelectionHandler, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_correctableEntryPoints, 0);
  objc_storeStrong((id *)&self->_editModeSegmentedControl, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_navigationTitle, 0);
}

@end
