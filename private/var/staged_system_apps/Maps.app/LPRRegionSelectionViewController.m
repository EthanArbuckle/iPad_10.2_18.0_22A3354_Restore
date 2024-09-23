@implementation LPRRegionSelectionViewController

- (LPRRegionSelectionViewController)initWithScenario:(int64_t)a3 vehicle:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  LPRRegionSelectionViewController *v10;
  LPRRegionSelectionViewController *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)LPRRegionSelectionViewController;
  v10 = -[LPRRegionSelectionViewController init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[LPRRegionSelectionViewController setCurrentVehicle:](v10, "setCurrentVehicle:", v8);
    v11->_scenario = a3;
    objc_storeWeak((id *)&v11->_delegate, v9);
  }

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  MapsThemeLabel *v47;
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
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  objc_super v95;
  _QWORD v96[7];
  _BYTE v97[128];

  v95.receiver = self;
  v95.super_class = (Class)LPRRegionSelectionViewController;
  -[LPRRegionSelectionViewController viewDidLoad](&v95, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("LPRRegionSelectionView"));

  if (self->_scenario == 1)
  {
    v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "pressedCancel");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  }
  v6 = objc_alloc_init((Class)UITableView);
  -[LPRRegionSelectionViewController setRegionTableView:](self, "setRegionTableView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionTableView](self, "regionTableView"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionTableView](self, "regionTableView"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("RegionTableView"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionTableView](self, "regionTableView"));
  objc_msgSend(v9, "setDelegate:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionTableView](self, "regionTableView"));
  objc_msgSend(v10, "setDataSource:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionTableView](self, "regionTableView"));
  objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", objc_opt_class(MKTableViewCell), CFSTR("LPRRegion"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[LPRRegionSelectionViewController setRegions:](self, "setRegions:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastLocation"));

  objc_msgSend(v14, "coordinate");
  v16 = v15;
  v89 = v14;
  objc_msgSend(v14, "coordinate");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManager sharedManager](GEOResourceManager, "sharedManager"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataForResourceWithName:fallbackBundle:", CFSTR("regional_vehicle_info.pb"), 0));

  if (v20)
  {
    v21 = objc_msgSend(objc_alloc((Class)GEOLPRRoot), "initWithData:", v20);
    -[LPRRegionSelectionViewController setLprRules:](self, "setLprRules:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController lprRules](self, "lprRules"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "powerTypes"));
    -[LPRRegionSelectionViewController setPowerTypes:](self, "setPowerTypes:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController lprRules](self, "lprRules"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "regions"));
    v27 = objc_msgSend(v26, "mutableCopy");

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController lprRules](self, "lprRules"));
    v29 = objc_msgSend(v28, "regionsCount");

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", 0));
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "subRegions"));

      v27 = (id)v31;
    }
    else
    {
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2191, 0, CFSTR("EmptyRegions"));
    }
    objc_msgSend(v27, "sortUsingComparator:", &stru_1011BCA50);
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v32 = v27;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v92;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v92 != v35)
            objc_enumerationMutation(v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)v36), "info"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "licensePlateTemplate"));

          objc_msgSend(v22, "appendString:", v38);
          v36 = (char *)v36 + 1;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
      }
      while (v34);
    }

    -[LPRRegionSelectionViewController setRegionCodes:](self, "setRegionCodes:", v22);
    v39 = geoLPRRegionsContainingPoint(v32, v16, v18);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if (objc_msgSend(v40, "count"))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regions](self, "regions"));
      objc_msgSend(v41, "addObject:", v40);

      objc_msgSend(v32, "removeObjectsInArray:", v40);
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regions](self, "regions"));
    objc_msgSend(v42, "addObject:", v32);

  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController view](self, "view"));
  objc_msgSend(v44, "setBackgroundColor:", v43);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionTableView](self, "regionTableView"));
  objc_msgSend(v45, "addSubview:", v46);

  v47 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v47, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  -[MapsThemeLabel setNumberOfLines:](v47, "setNumberOfLines:", 2);
  -[MapsThemeLabel setTextAlignment:](v47, "setTextAlignment:", 1);
  -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v47, "setAdjustsFontSizeToFitWidth:", 1);
  -[MapsThemeLabel setMinimumScaleFactor:](v47, "setMinimumScaleFactor:", 0.5);
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleLargeTitle));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "fontDescriptorWithSymbolicTraits:", 2));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v48, 0.0));
  -[MapsThemeLabel setFont:](v47, "setFont:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[MapsThemeLabel setTextColor:](v47, "setTextColor:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Regions"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v47, "setText:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController view](self, "view"));
  objc_msgSend(v53, "addSubview:", v47);

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController view](self, "view"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v47, "topAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController view](self, "view"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "safeAreaLayoutGuide"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "topAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, 30.0));
  v96[0] = v83;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerXAnchor](v47, "centerXAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController view](self, "view"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "centerXAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:constant:", v80, 0.0));
  v96[1] = v79;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel widthAnchor](v47, "widthAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController view](self, "view"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "widthAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:multiplier:constant:", v76, 0.9, 0.0));
  v96[2] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionTableView](self, "regionTableView"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "topAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v47, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, 25.0));
  v96[3] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionTableView](self, "regionTableView"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "centerXAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController view](self, "view"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "centerXAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, 0.0));
  v96[4] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionTableView](self, "regionTableView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "widthAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController view](self, "view"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "widthAnchor"));
  v73 = (void *)v20;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:multiplier:", v55, 1.0));
  v96[5] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionTableView](self, "regionTableView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController view](self, "view"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "bottomAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v60, -10.0));
  v96[6] = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v96, 7));
  objc_msgSend(v90, "addConstraints:", v62);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPRRegionSelectionViewController;
  -[LPRRegionSelectionViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v7, "setLockedOrientations:", 2);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v8, "setOrientation:animated:", 1, v3);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPRRegionSelectionViewController;
  -[LPRRegionSelectionViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
}

- (void)pressedCancel
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionTableView](self, "regionTableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("LPRRegion"), v5));

  objc_msgSend(v7, "setAccessoryType:", 1);
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("RegionTableViewCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regions](self, "regions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));
  v10 = objc_msgSend(v5, "row");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayNames"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v12, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v14, "setText:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("TextLabel"));

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regions](self, "regions", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));
  v7 = objc_msgSend(v6, "count");

  return (int64_t)v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regions](self, "regions", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v5;
  id v6;
  BOOL v7;
  double result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regions](self, "regions", a3));
  v6 = objc_msgSend(v5, "count");

  v7 = v6 == (id)1 || a4 == 1;
  result = 75.0;
  if (!v7)
    return 0.0;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  MapsThemeLabel *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  UIView *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  MapsThemeLabel *v38;
  void *v39;
  _QWORD v40[2];
  CGRect v41;
  CGRect v42;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regions](self, "regions"));
  v8 = objc_msgSend(v7, "count");

  if (a4 || (unint64_t)v8 <= 1)
  {
    v10 = objc_alloc_init(MapsThemeLabel);
    -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsThemeLabel setTextAlignment:](v10, "setTextAlignment:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 16.0, UIFontWeightLight));
    -[MapsThemeLabel setFont:](v10, "setFont:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[MapsThemeLabel setTextColor:](v10, "setTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regions](self, "regions"));
    v14 = objc_msgSend(v13, "count");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = v15;
    if ((unint64_t)v14 <= 1)
      v17 = CFSTR("[LPR Onboarding]Regions");
    else
      v17 = CFSTR("[LPR Onboarding]Other Regions");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v17, CFSTR("localized string not found"), 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uppercaseString"));
    -[MapsThemeLabel setText:](v10, "setText:", v19);

    v20 = objc_alloc((Class)UITableViewHeaderFooterView);
    objc_msgSend(v6, "frame");
    v9 = objc_msgSend(v20, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v41), 75.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backgroundColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
    objc_msgSend(v22, "setBackgroundColor:", v21);

    v23 = objc_opt_new(UIView);
    objc_msgSend(v9, "setBackgroundView:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backgroundColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backgroundView"));
    objc_msgSend(v25, "setBackgroundColor:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
    objc_msgSend(v26, "addSubview:", v10);

    v27 = objc_alloc((Class)MKViewWithHairline);
    objc_msgSend(v6, "frame");
    v28 = objc_msgSend(v27, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v42), 75.0);
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v28, "setTopHairlineHidden:", 1);
    objc_msgSend(v28, "setBottomHairlineHidden:", 0);
    objc_msgSend(v9, "addSubview:", v28);
    objc_msgSend(v9, "layoutIfNeeded");
    v38 = v10;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v10, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layoutMarginsGuide"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v30));
    v40[0] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v10, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, -8.0));
    v40[1] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
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
  id v21;
  LPROnboardingAddLicensePlatePageViewController *v22;
  int64_t scenario;
  VGVehicle *currentVehicle;
  id WeakRetained;
  void *v26;
  void *v27;
  LPROnboardingAddLicensePlatePageViewController *v28;
  void *v29;
  id v30;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regions](self, "regions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
  v9 = objc_msgSend(v6, "row");

  v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController currentVehicle](self, "currentVehicle"));

  if (!v10)
  {
    v21 = objc_msgSend(objc_alloc((Class)VGVehicle), "initWithLicensePlate:lprVehicleType:lprPowerType:", &stru_1011EB268, CFSTR("PASSENGER_CAR"), &stru_1011EB268);
    -[LPRRegionSelectionViewController setCurrentVehicle:](self, "setCurrentVehicle:", v21);
    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController currentVehicle](self, "currentVehicle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "licensePlate"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController regionCodes](self, "regionCodes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController currentVehicle](self, "currentVehicle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "licensePlate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v14));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController currentVehicle](self, "currentVehicle"));
    objc_msgSend(v18, "setLicensePlate:", v17);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController currentVehicle](self, "currentVehicle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lprVehicleType"));

  if (!v20)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController currentVehicle](self, "currentVehicle"));
    objc_msgSend(v21, "setLprVehicleType:", CFSTR("PASSENGER_CAR"));
LABEL_7:

  }
  v22 = [LPROnboardingAddLicensePlatePageViewController alloc];
  scenario = self->_scenario;
  currentVehicle = self->_currentVehicle;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController lprRules](self, "lprRules"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController powerTypes](self, "powerTypes"));
  v28 = -[LPROnboardingAddLicensePlatePageViewController initWithScenario:vehicle:delegate:region:lprRules:powerTypes:](v22, "initWithScenario:vehicle:delegate:region:lprRules:powerTypes:", scenario, currentVehicle, WeakRetained, v30, v26, v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRegionSelectionViewController navigationController](self, "navigationController"));
  objc_msgSend(v29, "pushViewController:animated:", v28, 1);

}

- (UITableView)regionTableView
{
  return self->_regionTableView;
}

- (void)setRegionTableView:(id)a3
{
  objc_storeStrong((id *)&self->_regionTableView, a3);
}

- (NSMutableArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  objc_storeStrong((id *)&self->_regions, a3);
}

- (NSMutableDictionary)powerTypes
{
  return self->_powerTypes;
}

- (void)setPowerTypes:(id)a3
{
  objc_storeStrong((id *)&self->_powerTypes, a3);
}

- (VGVehicle)currentVehicle
{
  return self->_currentVehicle;
}

- (void)setCurrentVehicle:(id)a3
{
  objc_storeStrong((id *)&self->_currentVehicle, a3);
}

- (NSString)regionCodes
{
  return self->_regionCodes;
}

- (void)setRegionCodes:(id)a3
{
  objc_storeStrong((id *)&self->_regionCodes, a3);
}

- (GEOLPRRoot)lprRules
{
  return self->_lprRules;
}

- (void)setLprRules:(id)a3
{
  objc_storeStrong((id *)&self->_lprRules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lprRules, 0);
  objc_storeStrong((id *)&self->_regionCodes, 0);
  objc_storeStrong((id *)&self->_currentVehicle, 0);
  objc_storeStrong((id *)&self->_powerTypes, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_regionTableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
