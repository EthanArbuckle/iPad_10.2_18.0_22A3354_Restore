@implementation RAPFixedProblemViewController

- (RAPFixedProblemViewController)init
{
  RAPFixedProblemViewController *result;
  MKMapSize size;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPFixedProblemViewController;
  result = -[RAPFixedProblemViewController init](&v4, "init");
  if (result)
  {
    size = MKMapRectNull.size;
    result->_mapRect.origin = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapRectNull.origin;
    result->_mapRect.size = ($D4775485B13497D55C4F339E01923D43)size;
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  -[UITextView removeObserver:forKeyPath:](self->_textView, "removeObserver:forKeyPath:", self, CFSTR("contentSize"));
  v4.receiver = self;
  v4.super_class = (Class)RAPFixedProblemViewController;
  -[RAPFixedProblemViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  UITextView *v17;
  UITextView *textView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MKMapView *v24;
  void *v25;
  MKMapView *v26;
  MKMapView *mapView;
  NSDictionary *v28;
  uint64_t v29;
  NSDictionary *v30;
  void *v31;
  UITextView *v32;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  float v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  NSDictionary *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSLayoutConstraint *mapHeightConstraint;
  double v55;
  void *v56;
  void *v57;
  unsigned int v58;
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
  id v74;
  void *v75;
  void *v76;
  void *v77;
  MKMapView *v78;
  void *v79;
  void *v80;
  RAPFixedProblemViewController *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  objc_super v86;
  _BYTE v87[128];
  _QWORD v88[4];
  _QWORD v89[2];

  v86.receiver = self;
  v86.super_class = (Class)RAPFixedProblemViewController;
  -[RAPFixedProblemViewController viewDidLoad](&v86, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Reported Issue"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = objc_alloc((Class)UIBarButtonItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController navigationController](self, "navigationController"));
  v8 = objc_msgSend(v6, "initWithBarButtonSystemItem:target:action:", 0, v7, "handleDone:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController view](self, "view"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = objc_alloc((Class)UIView);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController view](self, "view"));
  objc_msgSend(v13, "bounds");
  v14 = objc_msgSend(v12, "initWithFrame:");

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v14, "setBackgroundColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", v14);

  v17 = (UITextView *)objc_alloc_init((Class)UITextView);
  textView = self->_textView;
  self->_textView = v17;

  -[UITextView setAlwaysBounceVertical:](self->_textView, "setAlwaysBounceVertical:", 1);
  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UITextView setTextColor:](self->_textView, "setTextColor:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v20);

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView addObserver:forKeyPath:options:context:](self->_textView, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 1, 0);
  objc_msgSend(v14, "addSubview:", self->_textView);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPProblemStatusResponse problemStatus](self->_problemStatusResponse, "problemStatus"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));

  v79 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "details"));
  LODWORD(v22) = objc_msgSend(v23, "displayStyle");

  if ((_DWORD)v22 == 5)
  {
    v24 = (MKMapView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RAPRouteFixed")));
    -[MKMapView setImage:](v24, "setImage:", v25);

  }
  else
  {
    v26 = (MKMapView *)objc_msgSend(objc_alloc((Class)MKMapView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    mapView = self->_mapView;
    self->_mapView = v26;

    -[MKMapView setCompassEnabled:](self->_mapView, "setCompassEnabled:", 0);
    -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);
    -[MKMapView setShowsAttribution:](self->_mapView, "setShowsAttribution:", 0);
    -[MKMapView setBackdropViewQualityChangingDisabled:](self->_mapView, "setBackdropViewQualityChangingDisabled:", 1);
    v24 = self->_mapView;
  }
  -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKMapView setUserInteractionEnabled:](v24, "setUserInteractionEnabled:", 0);
  objc_msgSend(v14, "addSubview:", v24);
  v28 = _NSDictionaryOfVariableBindings(CFSTR("viewToShow, _textView, borderView"), v24, self->_textView, v14, 0);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  v30 = _NSDictionaryOfVariableBindings(CFSTR("spacing, borderSpacing, actionButtonHeight, textViewMinimumHeight"), &off_10126FE20, &off_10126FE38, &off_10126FE50, &off_10126FE68, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v32 = self->_textView;
  v78 = v24;
  v89[0] = v24;
  v89[1] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 2));
  v74 = objc_msgSend(v33, "mutableCopy");

  v77 = (void *)v29;
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(borderSpacing)-[viewToShow]-0-[_textView(>=textViewMinimumHeight)]-(borderSpacing)-|"), 0, v31, v29));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController view](self, "view"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "safeAreaLayoutGuide"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "topAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, 5.0));
  v88[0] = v69;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController view](self, "view"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "safeAreaLayoutGuide"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, -5.0));
  v88[1] = v64;
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController view](self, "view"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "safeAreaLayoutGuide"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "leadingAnchor"));
  objc_msgSend(&off_10126FE20, "floatValue");
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, v36));
  v88[2] = v37;
  v80 = v14;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v81 = self;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "safeAreaLayoutGuide"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  objc_msgSend(&off_10126FE20, "floatValue");
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v41, (float)-v42));
  v88[3] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 4));
  v75 = v35;
  objc_msgSend(v35, "addObjectsFromArray:", v44);

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v45 = v74;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(_QWORD *)v83 != v48)
          objc_enumerationMutation(v45);
        v50 = _NSDictionaryOfVariableBindings(CFSTR("view"), *(id *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i), 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(borderSpacing)-[view]-(borderSpacing)-|"), 0, v31, v51));
        objc_msgSend(v34, "addObjectsFromArray:", v52);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    }
    while (v47);
  }

  objc_msgSend(v34, "addObjectsFromArray:", v76);
  v53 = objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v78, 8, 0, v78, 7, 1.0, 0.0));
  mapHeightConstraint = v81->_mapHeightConstraint;
  v81->_mapHeightConstraint = (NSLayoutConstraint *)v53;

  LODWORD(v55) = 1144750080;
  -[NSLayoutConstraint setPriority:](v81->_mapHeightConstraint, "setPriority:", v55);
  objc_msgSend(v34, "addObject:", v81->_mapHeightConstraint);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v75);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController view](v81, "view"));
  objc_msgSend(v56, "setNeedsUpdateConstraints");

  -[RAPFixedProblemViewController _updateMapViewIfLoaded](v81, "_updateMapViewIfLoaded");
  -[RAPFixedProblemViewController _updateTextFieldIfLoaded](v81, "_updateTextFieldIfLoaded");
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "details"));
  v58 = objc_msgSend(v57, "displayStyle");

  if (v58 == 5)
    -[RAPFixedProblemViewController addRouteOverlayOnView:](v81, "addRouteOverlayOnView:", v78);
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v59, "addObserver:selector:name:object:", v81, "_contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)addRouteOverlayOnView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *startLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *destinationLabel;
  void *v18;
  void *v19;
  void *v20;
  UIImageView *v21;
  UIImageView *transitIconImageView;
  UIImageView *v23;
  UIImageView *transitIconBackgroundImageView;
  void *v25;
  const __CFString *v26;
  void *v27;
  NSDictionary *v28;
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
  id v39;

  v39 = a3;
  if (-[GEORPProblemStatusResponse problemStatusCount](self->_problemStatusResponse, "problemStatusCount"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPProblemStatusResponse problemStatus](self->_problemStatusResponse, "problemStatus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "details"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItemsForPlacesInDetails:", v6));

    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      v10 = (UILabel *)objc_alloc_init((Class)UILabel);
      startLabel = self->_startLabel;
      self->_startLabel = v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
      -[UILabel setFont:](self->_startLabel, "setFont:", v12);

      -[UILabel setNumberOfLines:](self->_startLabel, "setNumberOfLines:", 2);
      -[UILabel setTextAlignment:](self->_startLabel, "setTextAlignment:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[UILabel setTextColor:](self->_startLabel, "setTextColor:", v13);

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_startLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v38 = v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "notificationDisplayName"));
      -[UILabel setText:](self->_startLabel, "setText:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
      v16 = (UILabel *)objc_alloc_init((Class)UILabel);
      destinationLabel = self->_destinationLabel;
      self->_destinationLabel = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_startLabel, "font"));
      -[UILabel setFont:](self->_destinationLabel, "setFont:", v18);

      -[UILabel setNumberOfLines:](self->_destinationLabel, "setNumberOfLines:", -[UILabel numberOfLines](self->_startLabel, "numberOfLines"));
      -[UILabel setTextAlignment:](self->_destinationLabel, "setTextAlignment:", -[UILabel textAlignment](self->_startLabel, "textAlignment"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel textColor](self->_startLabel, "textColor"));
      -[UILabel setTextColor:](self->_destinationLabel, "setTextColor:", v19);

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_destinationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "notificationDisplayName"));
      -[UILabel setText:](self->_destinationLabel, "setText:", v20);

      v21 = (UIImageView *)objc_alloc_init((Class)UIImageView);
      transitIconImageView = self->_transitIconImageView;
      self->_transitIconImageView = v21;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_transitIconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v23 = (UIImageView *)objc_alloc_init((Class)UIImageView);
      transitIconBackgroundImageView = self->_transitIconBackgroundImageView;
      self->_transitIconBackgroundImageView = v23;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_transitIconBackgroundImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      if (objc_msgSend(v6, "directionsType") == 1)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RAPTransit")));
        v26 = CFSTR("RAPTransitBgd");
      }
      else if (objc_msgSend(v6, "directionsType") == 2)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RAPWalking")));
        v26 = CFSTR("RAPWalkBgd");
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RAPCar")));
        v26 = CFSTR("RAPCarBgd");
      }
      -[UIImageView setImage:](self->_transitIconImageView, "setImage:", v25);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v26));
      -[UIImageView setImage:](self->_transitIconBackgroundImageView, "setImage:", v27);

      objc_msgSend(v39, "addSubview:", self->_startLabel);
      objc_msgSend(v39, "addSubview:", self->_destinationLabel);
      objc_msgSend(v39, "addSubview:", self->_transitIconBackgroundImageView);
      objc_msgSend(v39, "addSubview:", self->_transitIconImageView);
      v28 = _NSDictionaryOfVariableBindings(CFSTR("_startLabel, _destinationLabel, _transitIconImageView, _transitIconBackgroundImageView"), self->_startLabel, self->_destinationLabel, self->_transitIconImageView, self->_transitIconBackgroundImageView, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_startLabel]|"), 0, 0, v29));
      objc_msgSend(v30, "addObjectsFromArray:", v31);

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_destinationLabel]|"), 0, 0, v29));
      objc_msgSend(v30, "addObjectsFromArray:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[_startLabel]-(verticalSpacing)-[_transitIconBackgroundImageView]-(verticalSpacing)-[_destinationLabel]-(>=0)-|"), 0, &off_1012748E0, v29));
      objc_msgSend(v30, "addObjectsFromArray:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_transitIconImageView, 9, 0, v39, 9, 1.0, 0.0));
      objc_msgSend(v30, "addObject:", v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_transitIconImageView, 10, 0, v39, 10, 1.0, 0.0));
      objc_msgSend(v30, "addObject:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_transitIconBackgroundImageView, 9, 0, v39, 9, 1.0, 0.0));
      objc_msgSend(v30, "addObject:", v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_transitIconBackgroundImageView, 10, 0, v39, 10, 1.0, 0.0));
      objc_msgSend(v30, "addObject:", v37);

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;

  if (self->_textView == a4)
  {
    objc_msgSend(a4, "bounds", a3);
    v8 = v7;
    -[UITextView contentSize](self->_textView, "contentSize");
    v10 = v9;
    -[UITextView zoomScale](self->_textView, "zoomScale");
    v12 = (v8 - v10 * v11) * 0.5;
    v13 = v12 + -4.0;
    v14 = v12 < 4.0;
    v15 = 0.0;
    if (!v14)
      v15 = v13;
    -[UITextView setContentInset:](self->_textView, "setContentInset:", v15, 0.0, 0.0, 0.0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  RAPAnnotation *annotation;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)RAPFixedProblemViewController;
  -[RAPFixedProblemViewController viewDidAppear:](&v6, "viewDidAppear:");
  annotation = self->_annotation;
  if (annotation)
    -[MKMapView selectAnnotation:animated:](self->_mapView, "selectAnnotation:animated:", annotation, v3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPFixedProblemViewController;
  -[RAPFixedProblemViewController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", a3);
  if (-[RAPFixedProblemViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController view](self, "view"));
    objc_msgSend(v4, "setNeedsUpdateConstraints");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009B0AC4;
  v4[3] = &unk_1011AEDC8;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, 0);
}

- (void)setProblemStatusResponse:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_storeStrong((id *)&self->_problemStatusResponse, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "problemStatus"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "problemStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "details"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedTitle"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "details"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "details"));
    -[RAPFixedProblemViewController _setAnnotationsWithDetails:](self, "_setAnnotationsWithDetails:", v13);

    -[RAPFixedProblemViewController _setHeaderText:footerText:](self, "_setHeaderText:footerText:", v10, v12);
  }

}

- (void)_setAnnotationsWithDetails:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  RAPAnnotation *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  id v27;
  CLLocationCoordinate2D v28;

  v4 = a3;
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayRegion"));
  objc_msgSend(v27, "southLat");
  v6 = v5;
  objc_msgSend(v27, "northLat");
  if (v6 == v7)
  {
    objc_msgSend(v27, "westLng");
    v9 = v8;
    objc_msgSend(v27, "eastLng");
    if (v9 == v10)
    {
      objc_msgSend(v27, "southLat");
      v12 = v11;
      objc_msgSend(v27, "westLng");
      v14 = MKMapRectMakeWithRadialDistance(v12, v13, 200.0);
      v18 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v14, v15, v16, v17);

      v27 = v18;
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mapItemsForPlacesInDetails:", v4));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
  v22 = -[RAPAnnotation initWithMapItem:]([RAPAnnotation alloc], "initWithMapItem:", v21);
  if (self->_annotation)
    -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:");
  -[RAPAnnotation coordinate](v22, "coordinate");
  if (CLLocationCoordinate2DIsValid(v28))
    objc_storeStrong((id *)&self->_annotation, v22);
  self->_mapRect.origin.x = GEOMapRectForMapRegion(v27, v23);
  self->_mapRect.origin.y = v24;
  self->_mapRect.size.width = v25;
  self->_mapRect.size.height = v26;
  -[RAPFixedProblemViewController _updateMapViewIfLoaded](self, "_updateMapViewIfLoaded");

}

- (void)_updateMapViewIfLoaded
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  MKMapView *mapView;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  $99E9129AA7BA404914A9E870D54E0AD8 *p_mapRect;
  BOOL v13;
  MKMapView *v14;
  void *v15;
  void *v16;
  double v17;
  RAPAnnotation *annotation;

  if (self->_mapView
    && -[GEORPProblemStatusResponse problemStatusCount](self->_problemStatusResponse, "problemStatusCount"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPProblemStatusResponse problemStatus](self->_problemStatusResponse, "problemStatus"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));

    if (self->_annotation)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      v6 = objc_msgSend(v5, "displayStyle");

      if (v6 != 4)
      {
        mapView = self->_mapView;
        if (self->_mapRect.size.width == 0.0 || self->_mapRect.size.height == 0.0)
        {
          annotation = self->_annotation;
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &annotation, 1));
          -[MKMapView showAnnotations:animated:](mapView, "showAnnotations:animated:", v8, 0);

        }
        else
        {
          -[MKMapView addAnnotation:](self->_mapView, "addAnnotation:", self->_annotation);
        }
      }
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
    v10 = objc_msgSend(v9, "mapType");

    if (v10 - 2 > 2)
      v11 = 0;
    else
      v11 = qword_100E3CCA0[v10 - 2];
    -[MKMapView setMapType:](self->_mapView, "setMapType:", v11);
    p_mapRect = &self->_mapRect;
    v13 = self->_mapRect.origin.y == MKMapRectNull.origin.y && self->_mapRect.origin.x == MKMapRectNull.origin.x;
    if (!v13 && self->_mapRect.size.width != 0.0 && self->_mapRect.size.height != 0.0)
    {
      v14 = self->_mapView;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController view](self, "view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "safeAreaLayoutGuide"));
      objc_msgSend(v16, "layoutFrame");
      -[MKMapView setVisibleMapRect:edgePadding:animated:](v14, "setVisibleMapRect:edgePadding:animated:", 0, p_mapRect->origin.x, p_mapRect->origin.y, p_mapRect->size.width, p_mapRect->size.height, v17, 0.0, 0.0, 0.0);

    }
  }
}

- (void)_setHeaderText:(id)a3 footerText:(id)a4
{
  id v6;
  NSString *v7;
  NSString *headerText;
  NSString *v9;
  NSString *footerText;

  v6 = a4;
  v7 = (NSString *)objc_msgSend(a3, "copy");
  headerText = self->_headerText;
  self->_headerText = v7;

  v9 = (NSString *)objc_msgSend(v6, "copy");
  footerText = self->_footerText;
  self->_footerText = v9;

  -[RAPFixedProblemViewController _updateTextFieldIfLoaded](self, "_updateTextFieldIfLoaded");
}

- (void)_updateTextFieldIfLoaded
{
  NSString *footerText;
  NSString *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSString *v23;
  NSString *v24;
  id v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];

  if (self->_textView)
  {
    footerText = self->_footerText;
    v4 = self->_headerText;
    v23 = footerText;
    v25 = objc_alloc_init((Class)NSMutableAttributedString);
    v5 = objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithFixedSize:](UIFont, "_maps_systemFontWithFixedSize:", 23.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
    v7 = objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setAlignment:", 1);
    v28[0] = NSFontAttributeName;
    v28[1] = NSParagraphStyleAttributeName;
    v22 = (void *)v5;
    v29[0] = v5;
    v29[1] = v7;
    v28[2] = NSForegroundColorAttributeName;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v29[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));

    if (v4)
    {
      v10 = objc_alloc((Class)NSAttributedString);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("\n")));
      v12 = objc_msgSend(v10, "initWithString:attributes:", v11, v9);
      objc_msgSend(v25, "appendAttributedString:", v12);

    }
    v24 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    objc_msgSend(v13, "_mapkit_scaledValueForValue:", 20.0);
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
    v17 = objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "setAlignment:", 1);
    objc_msgSend(v17, "setParagraphSpacingBefore:", v15);
    v26[0] = NSFontAttributeName;
    v26[1] = NSParagraphStyleAttributeName;
    v27[0] = v13;
    v27[1] = v17;
    v26[2] = NSForegroundColorAttributeName;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v27[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 3));

    if (v23)
    {
      v20 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v23, v19);
      objc_msgSend(v25, "appendAttributedString:", v20);

    }
    -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v25);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_textView, "textContainer"));
    objc_msgSend(v21, "setLineFragmentPadding:", v15);

  }
}

- (void)handleDone:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RAPFixedProblemViewController navigationController](self, "navigationController", a3));
  objc_msgSend(v4, "handleDone:", self);

}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  dispatch_time_t v5;
  _QWORD block[5];

  v5 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009B1474;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)labelMarkerOnMapViewWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labelMarkers"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (GEORPProblemStatusResponse)problemStatusResponse
{
  return self->_problemStatusResponse;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_problemStatusResponse, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_transitIconBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_transitIconImageView, 0);
  objc_storeStrong((id *)&self->_destinationLabel, 0);
  objc_storeStrong((id *)&self->_startLabel, 0);
  objc_storeStrong((id *)&self->_actionButtonSeparator, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_mapHeightConstraint, 0);
}

@end
