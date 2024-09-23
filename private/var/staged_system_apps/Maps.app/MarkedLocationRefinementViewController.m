@implementation MarkedLocationRefinementViewController

- (MarkedLocationRefinementViewController)initWithCamera:(id)a3 crosshairType:(unint64_t)a4
{
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("not supported"));

  return 0;
}

- (MarkedLocationRefinementViewController)initWithMarkedLocation:(id)a3
{
  id v5;
  id v6;
  MarkedLocationRefinementViewController *v7;
  MarkedLocationRefinementViewController *v8;
  objc_super v10;

  v5 = a3;
  v6 = objc_alloc_init((Class)MKMapCamera);
  objc_msgSend(v5, "coordinate");
  objc_msgSend(v6, "setCenterCoordinate:");
  objc_msgSend(v6, "setAltitude:", 941.0);
  v10.receiver = self;
  v10.super_class = (Class)MarkedLocationRefinementViewController;
  v7 = -[LocationRefinementViewController initWithCamera:crosshairType:](&v10, "initWithCamera:crosshairType:", v6, 0);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_originalMarkedLocation, a3);

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *heightBarConstraint;
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
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  MarkedLocationRefinementViewController *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  const __CFString *v51;
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
  MarkedLocationRefinementViewController *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  objc_super v78;
  _QWORD v79[3];
  _QWORD v80[4];
  _QWORD v81[4];

  v78.receiver = self;
  v78.super_class = (Class)MarkedLocationRefinementViewController;
  -[LocationRefinementViewController viewDidLoad](&v78, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4 = objc_msgSend(v3, "isUsingOfflineMaps");

  if (v4)
    v5 = 0;
  else
    v5 = 2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  objc_msgSend(v6, "setMapType:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Edit Location Instructions [Marked Location]"), CFSTR("localized string not found"), 0));
  -[LocationRefinementViewController setInstructionsText:](self, "setInstructionsText:", v8);

  LODWORD(v8) = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = v9;
  if ((_DWORD)v8)
    v11 = CFSTR("Move Location [Marked Location][Title]");
  else
    v11 = CFSTR("Move Pin [Dropped Pin][Title]");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, CFSTR("localized string not found"), 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationRefinementViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setTitle:", v12);

  v14 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_done:");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationRefinementViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v15, "setRightBarButtonItem:", v14);

  v16 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancel:");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationRefinementViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v17, "setLeftBarButtonItem:", v16);

  v73 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v73, "configureWithDefaultBackground");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationRefinementViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v18, "setScrollEdgeAppearance:", v73);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController userLocationButtonBottomConstraint](self, "userLocationButtonBottomConstraint"));
  objc_msgSend(v19, "setActive:", 0);

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationRefinementViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v20, "addSubview:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "heightAnchor"));
  -[MarkedLocationRefinementViewController footerHeight](self, "footerHeight");
  v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:"));
  heightBarConstraint = self->_heightBarConstraint;
  self->_heightBarConstraint = v23;

  v81[0] = self->_heightBarConstraint;
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v25));
  v81[1] = v26;
  v76 = v21;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v28 = v20;
  v72 = v20;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
  v81[2] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  v81[3] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v81, 4));
  objc_msgSend(v77, "addObjectsFromArray:", v34);

  v35 = objc_alloc_init((Class)MKViewWithHairline);
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v35, "setTopHairlineHidden:", 0);
  objc_msgSend(v35, "setBottomHairlineHidden:", 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _barHairlineShadowColor](UIColor, "_barHairlineShadowColor"));
  objc_msgSend(v35, "setHairlineColor:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationRefinementViewController view](self, "view"));
  objc_msgSend(v37, "addSubview:", v35);

  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v68));
  v80[0] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v38));
  v80[1] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "trailingAnchor"));
  v75 = v35;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
  v80[2] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
  v45 = self;
  v67 = self;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));
  v80[3] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 4));
  objc_msgSend(v77, "addObjectsFromArray:", v47);

  v48 = objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v48, "_mapkit_addPointerInteraction");
  objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v42) = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v50 = v49;
  if ((_DWORD)v42)
    v51 = CFSTR("Remove Location [Marked Location]");
  else
    v51 = CFSTR("Remove Pin [Dropped Pin]");
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", v51, CFSTR("localized string not found"), 0));

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v48, "setTitleColor:forState:", v52, 0);

  objc_msgSend(v48, "setTitle:forState:", v71, 0);
  objc_msgSend(v48, "addTarget:action:forControlEvents:", v45, "_removeMarkedLocation:", 64);
  objc_msgSend(v75, "addSubview:", v48);
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "heightAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToConstant:", 49.0));
  v79[0] = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "centerXAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "centerXAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v55));
  v79[1] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v58));
  v79[2] = v59;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 3));
  objc_msgSend(v77, "addObjectsFromArray:", v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController snapToUserLocationContainerView](v67, "snapToUserLocationContainerView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bottomAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, -12.0));
  objc_msgSend(v77, "addObject:", v64);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v77);
}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MarkedLocationRefinementViewController;
  -[MarkedLocationRefinementViewController viewLayoutMarginsDidChange](&v3, "viewLayoutMarginsDidChange");
  -[MarkedLocationRefinementViewController footerHeight](self, "footerHeight");
  -[NSLayoutConstraint setConstant:](self->_heightBarConstraint, "setConstant:");
}

- (double)footerHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationRefinementViewController view](self, "view"));
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3 + 49.0;

  return v4;
}

- (void)_done:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController delegate](self, "delegate", a3));
  -[LocationRefinementViewController selectedCoordinate](self, "selectedCoordinate");
  objc_msgSend(v4, "locationRefinementViewController:didSelectCoordinate:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 1030, 623, 0);

}

- (void)_cancel:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "markedLocationRefinementViewControllerDidCancel:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 18, 623, 0);

}

- (void)_removeMarkedLocation:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "markedLocationRefinementViewControllerSelectedRemoveMarkedLocation:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 6005, 623, 0);

}

- (UIViewController)originalPresenterViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_originalPresenterViewController);
}

- (void)setOriginalPresenterViewController:(id)a3
{
  objc_storeWeak((id *)&self->_originalPresenterViewController, a3);
}

- (SearchResult)originalMarkedLocation
{
  return self->_originalMarkedLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMarkedLocation, 0);
  objc_destroyWeak((id *)&self->_originalPresenterViewController);
  objc_storeStrong((id *)&self->_heightBarConstraint, 0);
}

@end
