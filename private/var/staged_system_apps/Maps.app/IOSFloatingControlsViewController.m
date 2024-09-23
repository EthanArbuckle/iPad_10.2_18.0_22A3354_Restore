@implementation IOSFloatingControlsViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  -[IOSFloatingControlsViewController setNonFloorPickerControlsVisible:](self, "setNonFloorPickerControlsVisible:", 1);
  v12.receiver = self;
  v12.super_class = (Class)IOSFloatingControlsViewController;
  -[FloatingControlsViewController viewDidLoad](&v12, "viewDidLoad");
  if (GEOConfigGetBOOL(MapsConfig_SizeDebugOverlay, off_1014B4948))
  {
    v3 = objc_alloc_init((Class)UILabel);
    -[IOSFloatingControlsViewController setSizeDebugLabel:](self, "setSizeDebugLabel:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController sizeDebugLabel](self, "sizeDebugLabel"));
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController sizeDebugLabel](self, "sizeDebugLabel"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController sizeDebugLabel](self, "sizeDebugLabel"));
    objc_msgSend(v8, "setTextColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController sizeDebugLabel](self, "sizeDebugLabel"));
    objc_msgSend(v9, "setText:", CFSTR("0x0"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController sizeDebugLabel](self, "sizeDebugLabel"));
    objc_msgSend(v10, "addSubview:", v11);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOSFloatingControlsViewController;
  -[FloatingControlsViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  -[IOSFloatingControlsViewController _refreshUserLocationButton](self, "_refreshUserLocationButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venuesManager"));
  objc_msgSend(v5, "addChangeObserver:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venuesManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venueWithFocus"));
  -[IOSFloatingControlsViewController didChangeFocusedVenue:](self, "didChangeFocusedVenue:", v8);

  -[IOSFloatingControlsViewController _updateMapModeButtonAppearance](self, "_updateMapModeButtonAppearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "_updateMapModeButtonAppearance", CFSTR("MKMapViewDidChangeMapTypeNotification"), 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOSFloatingControlsViewController;
  -[IOSFloatingControlsViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venuesManager"));
  objc_msgSend(v5, "removeChangeObserver:", self);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  NSString *v6;
  void *v7;
  void *v8;
  objc_super v9;
  CGSize v10;

  v9.receiver = self;
  v9.super_class = (Class)IOSFloatingControlsViewController;
  -[FloatingControlsViewController viewDidLayoutSubviews](&v9, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
  objc_msgSend(v3, "bounds");
  v10.width = v4;
  v10.height = v5;
  v6 = NSStringFromCGSize(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController sizeDebugLabel](self, "sizeDebugLabel"));
  objc_msgSend(v8, "setText:", v7);

}

- (BOOL)shouldShow:(int64_t)a3 withControlOptions:(int64_t)a4
{
  unint64_t v5;
  BOOL v6;

  v5 = (a4 | -[FloatingControlsViewController visibleControls](self, "visibleControls")) & a3;
  v6 = v5 != 0;
  if (v5)

  return v6;
}

- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  int64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  char v9;
  uint64_t v10;
  unsigned int v11;
  char v12;
  unsigned int v13;
  char v14;
  unsigned int v15;
  char v16;
  unsigned int v17;
  char v18;
  unsigned int v19;
  char v20;
  unsigned int v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  char v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
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
  _BOOL4 v58;
  _QWORD v59[5];
  _QWORD v60[6];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];

  v58 = a4;
  v5 = -[FloatingControlsViewController _sanitizedControlsFromControls:](self, "_sanitizedControlsFromControls:", a3);
  v6 = 2;
  v7 = -[IOSFloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 2, v5);
  if (!v7)
    v6 = 0;
  v8 = -[IOSFloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 1, v5);
  v9 = v8;
  v10 = v6 | v8;
  v11 = -[IOSFloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 16, v5);
  v12 = v11;
  if (v11)
    v10 |= 0x10uLL;
  v13 = -[IOSFloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 32, v5);
  v14 = v13;
  if (v13)
    v10 |= 0x20uLL;
  v15 = -[IOSFloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 64, v5);
  v16 = v15;
  if (v15)
    v10 |= 0x40uLL;
  v17 = -[IOSFloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 256, v5);
  v18 = v17;
  if (v17)
    v10 |= 0x100uLL;
  v19 = -[IOSFloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 512, v5);
  v20 = v19;
  if (v19)
    v10 |= 0x200uLL;
  v21 = -[IOSFloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 1024, v5);
  if (v21)
    v10 |= 0x400uLL;
  if ((v21 & 1) == 0
    && (v20 & 1) == 0
    && (v18 & 1) == 0
    && (v16 & 1) == 0
    && (v14 & 1) == 0
    && (v12 & 1) == 0
    && (v9 & 1) == 0
    && !v7)
  {
    goto LABEL_53;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController buttonsContainerViewController](self, "buttonsContainerViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "floatingButtonItems"));

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  v26 = v24;
  if (!v25)
    goto LABEL_51;
  v27 = v25;
  v28 = 0;
  v29 = *(_QWORD *)v62;
  do
  {
    for (i = 0; i != v27; i = (char *)i + 1)
    {
      if (*(_QWORD *)v62 != v29)
        objc_enumerationMutation(v24);
      v31 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
      if (((unint64_t)objc_msgSend(v31, "option") & v10) != 0)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "button"));

        if (!v32)
        {
          v33 = (uint64_t)objc_msgSend(v31, "option");
          v28 = 1;
          if (v33 <= 31)
          {
            switch(v33)
            {
              case 1:
                v34 = objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController userLocationButton](self, "userLocationButton"));
                break;
              case 2:
                v34 = objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController settingsButton](self, "settingsButton"));
                break;
              case 16:
                v34 = objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController mode2DButton](self, "mode2DButton"));
                break;
              default:
                continue;
            }
          }
          else if (v33 > 511)
          {
            if (v33 == 512)
            {
              v34 = objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController ttrButton](self, "ttrButton"));
            }
            else
            {
              if (v33 != 1024)
                continue;
              v34 = objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController ssaoButton](self, "ssaoButton"));
            }
          }
          else if (v33 == 32)
          {
            v34 = objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController mode3DButton](self, "mode3DButton"));
          }
          else
          {
            if (v33 != 256)
              continue;
            v34 = objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController modePedestrianARButton](self, "modePedestrianARButton"));
          }
          v35 = (void *)v34;
          objc_msgSend(v31, "setButton:", v34);

          v28 = 1;
        }
      }
    }
    v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  }
  while (v27);

  if ((v28 & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController buttonsContainerViewController](self, "buttonsContainerViewController"));
    objc_msgSend(v26, "refreshControls");
LABEL_51:

  }
LABEL_53:
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_1005798A8;
  v60[3] = &unk_1011AD518;
  v60[4] = self;
  v60[5] = v10;
  v36 = objc_retainBlock(v60);
  v37 = v36;
  if (v58)
  {
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10057991C;
    v59[3] = &unk_1011AC860;
    v59[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v59);
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v37, 0, 0.25, 0.0);
  }
  else
  {
    ((void (*)(_QWORD *))v36[2])(v36);
  }
  if (-[IOSFloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 4, v5)&& (v38 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator")), v39 = objc_msgSend(v38, "shouldShowSearchOverlay"), v38, v39))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "view"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "superview"));

    if (!v42)
    {
      -[IOSFloatingControlsViewController addChildViewController:](self, "addChildViewController:", self->_localSearchViewController);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "view"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController _localSearchViewConstraints](self, "_localSearchViewConstraints"));
      -[FloatingControlsViewController _addSubview:withConstraints:](self, "_addSubview:withConstraints:", v44, v45);

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
      v47 = (double)objc_msgSend(v46, "shouldBeVisible");
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "view"));
      objc_msgSend(v49, "setAlpha:", v47);

      -[LocalSearchViewController didMoveToParentViewController:](self->_localSearchViewController, "didMoveToParentViewController:", self);
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
    objc_msgSend(v50, "setEnable:", 1);

    v10 |= 4uLL;
  }
  else
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    objc_msgSend(v51, "setEnable:", 0);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    objc_msgSend(v52, "willMoveToParentViewController:", 0);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "viewIfLoaded"));
    objc_msgSend(v54, "removeFromSuperview");

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    objc_msgSend(v55, "removeFromParentViewController");

  }
  if (-[IOSFloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 64, v5))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    objc_msgSend(v56, "setForceHidden:", 0);

    v10 |= 0x40uLL;
  }
  else
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewControllerIfLoaded](self, "venueFloorViewControllerIfLoaded"));
    objc_msgSend(v57, "setForceHidden:", 1);

  }
  -[FloatingControlsViewController setVisibleControls:](self, "setVisibleControls:", v10);

}

- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  Block_layout *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[4];
  _QWORD *v26;
  _QWORD v27[5];
  _QWORD v28[6];

  v4 = a4;
  v7 = -[FloatingControlsViewController visibleControls](self, "visibleControls");
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 1, a3))
    v7 &= ~1uLL;
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 2, a3))
    v7 &= ~2uLL;
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 16, a3))
  {
    v7 &= ~0x10uLL;
  }
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 32, a3))
  {
    v7 &= ~0x20uLL;
  }
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 64, a3))
  {
    v7 &= ~0x40uLL;
  }
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 256, a3))
  {
    v7 &= ~0x100uLL;
  }
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 512, a3))
  {
    v7 &= ~0x200uLL;
  }
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 1024, a3))
  {
    v7 &= ~0x400uLL;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100579CF0;
  v28[3] = &unk_1011AD518;
  v28[4] = self;
  v28[5] = v7;
  v8 = objc_retainBlock(v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController buttonsContainerViewControllerIfLoaded](self, "buttonsContainerViewControllerIfLoaded"));

  if (!v9 || v7)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController buttonsContainerViewController](self, "buttonsContainerViewController"));
    if (!v12)
      goto LABEL_23;
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController buttonsContainerViewController](self, "buttonsContainerViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
    objc_msgSend(v15, "alpha");
    v17 = fabs(v16);

    if (v17 <= 2.22044605e-16)
    {
      ((void (*)(_QWORD *))v8[2])(v8);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100579DD4;
      v24[3] = &unk_1011AC860;
      v24[4] = self;
      v18 = v24;
    }
    else
    {
LABEL_23:
      v18 = v8;
    }
    v10 = objc_retainBlock(v18);
    v11 = &stru_1011BBB30;
    if (!v4)
      goto LABEL_20;
  }
  else
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100579D7C;
    v27[3] = &unk_1011AC860;
    v27[4] = self;
    v10 = objc_retainBlock(v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100579DC8;
    v25[3] = &unk_1011B1B90;
    v26 = v8;
    v11 = objc_retainBlock(v25);

    if (!v4)
    {
LABEL_20:
      ((void (*)(_QWORD *))v10[2])(v10);
      goto LABEL_27;
    }
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100579E20;
  v23[3] = &unk_1011AC860;
  v23[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v10, v11, 0.25, 0.0);
LABEL_27:
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 4, a3))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewIfLoaded"));
    objc_msgSend(v20, "removeFromSuperview");

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    objc_msgSend(v21, "setEnable:", 0);

    v7 &= ~4uLL;
  }
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 64, a3))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewControllerIfLoaded](self, "venueFloorViewControllerIfLoaded"));
    objc_msgSend(v22, "setForceHidden:", 1);

    v7 &= ~0x40uLL;
  }
  -[FloatingControlsViewController setVisibleControls:](self, "setVisibleControls:", v7);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)floatingButtonLeadingGuide
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackViewIfLoaded](self, "controlsStackViewIfLoaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "leadingAnchor"));

  return v3;
}

- (CGRect)floatingButtonsFrame
{
  void *v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackViewIfLoaded](self, "controlsStackViewIfLoaded"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackViewIfLoaded](self, "controlsStackViewIfLoaded"));
    objc_msgSend(v4, "frame");
    x = v5;
    y = v7;
    width = v9;
    height = v11;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setBlurGroupName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = objc_msgSend(a3, "copy");
  v10.receiver = self;
  v10.super_class = (Class)IOSFloatingControlsViewController;
  -[FloatingControlsViewController setBlurGroupName:](&v10, "setBlurGroupName:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController blurGroupName](self, "blurGroupName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController buttonsContainerViewControllerIfLoaded](self, "buttonsContainerViewControllerIfLoaded"));
  objc_msgSend(v6, "setBlurGroupName:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController blurGroupName](self, "blurGroupName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewControllerIfLoaded](self, "venueFloorViewControllerIfLoaded"));
  objc_msgSend(v8, "setBlurGroupName:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController blurGroupName](self, "blurGroupName"));
  -[SettingsTipView setBlurGroupName:](self->_settingsTipView, "setBlurGroupName:", v9);

}

- (void)setMargin:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOSFloatingControlsViewController;
  -[FloatingControlsViewController setMargin:](&v6, "setMargin:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackView](self, "controlsStackView"));
  objc_msgSend(v5, "setSpacing:", a3);

}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController buttonsContainerViewControllerIfLoaded](self, "buttonsContainerViewControllerIfLoaded"));
  if (v10)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController theme](self, "theme"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "controlTintColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    objc_msgSend(v5, "setTintColor:", v4);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewControllerIfLoaded](self, "venueFloorViewControllerIfLoaded"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController theme](self, "theme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "controlTintColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v9, "setTintColor:", v8);

  }
}

- (id)controlsStackViewIfLoaded
{
  return self->_controlsStackView;
}

- (UIStackView)controlsStackView
{
  UIStackView *controlsStackView;
  UIStackView *v4;
  UIStackView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  UIStackView *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];

  if (-[IOSFloatingControlsViewController isViewLoaded](self, "isViewLoaded"))
  {
    controlsStackView = self->_controlsStackView;
    if (!controlsStackView)
    {
      v4 = (UIStackView *)objc_alloc_init((Class)UIStackView);
      -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[FloatingControlsViewController margin](self, "margin");
      -[UIStackView setSpacing:](v4, "setSpacing:");
      -[UIStackView setDistribution:](v4, "setDistribution:", 3);
      -[UIStackView setAlignment:](v4, "setAlignment:", 4);
      -[UIStackView setAxis:](v4, "setAxis:", 1);
      v5 = self->_controlsStackView;
      self->_controlsStackView = v4;

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
      objc_msgSend(v6, "addSubview:", self->_controlsStackView);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_controlsStackView, "trailingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
      v24[0] = v20;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_controlsStackView, "topAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v8));
      v24[1] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_controlsStackView, "bottomAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
      v13 = sub_1005EC29C();
      -[FloatingControlsViewController compassDiameter](self, "compassDiameter");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:constant:", v12, -(v14 + v13 * 2.0)));
      v24[2] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

      controlsStackView = self->_controlsStackView;
    }
    v17 = controlsStackView;
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)buttonsContainerViewControllerIfLoaded
{
  return self->_buttonsContainerViewController;
}

- (ButtonsContainerViewController)buttonsContainerViewController
{
  ButtonsContainerViewController *buttonsContainerViewController;
  FloatingButtonItem *v4;
  void *v5;
  FloatingButtonItem *v6;
  void *v7;
  FloatingButtonItem *v8;
  void *v9;
  FloatingButtonItem *v10;
  void *v11;
  ButtonsContainerViewController *v12;
  ButtonsContainerViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  FloatingButtonItem *v18;
  void *v19;
  FloatingButtonItem *v20;
  FloatingButtonItem *v21;
  _QWORD v22[11];

  if (!-[IOSFloatingControlsViewController isViewLoaded](self, "isViewLoaded"))
    return (ButtonsContainerViewController *)0;
  buttonsContainerViewController = self->_buttonsContainerViewController;
  if (!buttonsContainerViewController)
  {
    v21 = -[FloatingButtonItem initWithButton:option:]([FloatingButtonItem alloc], "initWithButton:option:", 0, 2);
    v22[0] = v21;
    v20 = -[FloatingButtonItem initWithButton:option:]([FloatingButtonItem alloc], "initWithButton:option:", 0, 1);
    v22[1] = v20;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FloatingButtonItem separatorItem](FloatingButtonItem, "separatorItem"));
    v22[2] = v19;
    v18 = -[FloatingButtonItem initWithButton:option:]([FloatingButtonItem alloc], "initWithButton:option:", 0, 16);
    v22[3] = v18;
    v4 = -[FloatingButtonItem initWithButton:option:]([FloatingButtonItem alloc], "initWithButton:option:", 0, 32);
    v22[4] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FloatingButtonItem separatorItem](FloatingButtonItem, "separatorItem"));
    v22[5] = v5;
    v6 = -[FloatingButtonItem initWithButton:option:]([FloatingButtonItem alloc], "initWithButton:option:", 0, 256);
    v22[6] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FloatingButtonItem separatorItem](FloatingButtonItem, "separatorItem"));
    v22[7] = v7;
    v8 = -[FloatingButtonItem initWithButton:option:]([FloatingButtonItem alloc], "initWithButton:option:", 0, 512);
    v22[8] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FloatingButtonItem separatorItem](FloatingButtonItem, "separatorItem"));
    v22[9] = v9;
    v10 = -[FloatingButtonItem initWithButton:option:]([FloatingButtonItem alloc], "initWithButton:option:", 0, 1024);
    v22[10] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 11));

    v12 = -[ButtonsContainerViewController initWithFloatingButtonItems:]([ButtonsContainerViewController alloc], "initWithFloatingButtonItems:", v11);
    v13 = self->_buttonsContainerViewController;
    self->_buttonsContainerViewController = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController blurGroupName](self, "blurGroupName"));
    -[ButtonsContainerViewController setBlurGroupName:](self->_buttonsContainerViewController, "setBlurGroupName:", v14);

    -[IOSFloatingControlsViewController addChildViewController:](self, "addChildViewController:", self->_buttonsContainerViewController);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackView](self, "controlsStackView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonsContainerViewController view](self->_buttonsContainerViewController, "view"));
    objc_msgSend(v15, "addArrangedSubview:", v16);

    -[ButtonsContainerViewController didMoveToParentViewController:](self->_buttonsContainerViewController, "didMoveToParentViewController:", self);
    -[IOSFloatingControlsViewController updateTheme](self, "updateTheme");

    buttonsContainerViewController = self->_buttonsContainerViewController;
  }
  return buttonsContainerViewController;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)IOSFloatingControlsViewController;
  v6 = a3;
  -[FloatingControlsViewController mapView:regionDidChangeAnimated:](&v8, "mapView:regionDidChangeAnimated:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self->_localSearchViewController, "refreshSearchHereBusinessController", v8.receiver, v8.super_class));
  objc_msgSend(v7, "handleMapViewRegionDidChange:", v6);

}

- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IOSFloatingControlsViewController;
  -[FloatingControlsViewController mapView:didChangeMapType:](&v7, "mapView:didChangeMapType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController browseVenueBusinessController](self->_localSearchViewController, "browseVenueBusinessController"));
  objc_msgSend(v6, "handleMapTypeDidChange:", a4);

}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  objc_super v13;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IOSFloatingControlsViewController;
  -[FloatingControlsViewController mapView:didChangeUserTrackingMode:animated:fromTrackingButton:](&v13, "mapView:didChangeUserTrackingMode:animated:fromTrackingButton:", v10, a4, v7, v6);
  if (v6)
  {
    if (!a4)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "camera"));
      v11 = objc_msgSend(v12, "copy");

      -[IOSFloatingControlsViewController yawPriorToHeadingTracking](self, "yawPriorToHeadingTracking");
      objc_msgSend(v11, "setHeading:");
      objc_msgSend(v10, "setCamera:animated:", v11, 1);
      goto LABEL_6;
    }
    if (a4 == 2)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_mapLayer"));
      objc_msgSend(v11, "yaw");
      -[IOSFloatingControlsViewController setYawPriorToHeadingTracking:](self, "setYawPriorToHeadingTracking:");
LABEL_6:

    }
  }

}

- (id)venueFloorViewControllerIfLoaded
{
  return self->_venueFloorViewController;
}

- (void)didChangeFocusedVenue:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
    -[IOSFloatingControlsViewController setupVenueFloorViewController](self, "setupVenueFloorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "browseVenueBusinessController"));
  objc_msgSend(v5, "handleVenueWithFocusDidChange:", v6);

}

- (void)setupVenueFloorViewController
{
  void *v3;
  VenueFloorViewController *v4;
  void *v5;
  void *v6;
  VenueFloorViewController *v7;
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
  _QWORD v19[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));

  if (!v3)
  {
    v4 = [VenueFloorViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "venuesManager"));
    v7 = -[VenueFloorViewController initWithDelegate:venuesManager:visualEffectDisabled:](v4, "initWithDelegate:venuesManager:visualEffectDisabled:", self, v6, 0);
    -[IOSFloatingControlsViewController setVenueFloorViewController:](self, "setVenueFloorViewController:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "venuesManager"));
    objc_msgSend(v10, "setVenueFloorViewController:", v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    objc_msgSend(v11, "setForceHidden:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController blurGroupName](self, "blurGroupName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    objc_msgSend(v13, "setBlurGroupName:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    -[IOSFloatingControlsViewController addChildViewController:](self, "addChildViewController:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10057AAC4;
    v19[3] = &unk_1011AC860;
    v19[4] = self;
    objc_msgSend(v15, "delayConstraintSetupWhileExecuting:", v19);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    objc_msgSend(v16, "didMoveToParentViewController:", self);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
    objc_msgSend(v17, "layoutIfNeeded");

    if ((-[FloatingControlsViewController visibleControls](self, "visibleControls") & 0x40) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
      objc_msgSend(v18, "setForceHidden:animated:completion:", 0, 1, 0);

    }
  }
}

- (void)setNonFloorPickerControlsVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL8 v7;
  void *v8;
  double v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[6];

  if (self->_nonFloorPickerControlsVisible != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_nonFloorPickerControlsVisible = a3;
    v7 = !a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
    objc_msgSend(v8, "_setCompassSuppressedForFloorPicker:", v7);

    v9 = 0.0;
    if (v5)
      v9 = 1.0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10057AC68;
    v12[3] = &unk_1011AD518;
    v12[4] = self;
    *(double *)&v12[5] = v9;
    v10 = objc_retainBlock(v12);
    v11 = v10;
    if (v4)
      +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v10, 0);
    else
      ((void (*)(_QWORD *))v10[2])(v10);

  }
}

- (void)updateNonFloorPickerControlsVisibleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    -[IOSFloatingControlsViewController updateNonFloorPickerControlsVisibleForFloorPickerHidden:animated:](self, "updateNonFloorPickerControlsVisibleForFloorPickerHidden:animated:", objc_msgSend(v5, "isHidden"), v3);

  }
  else
  {
    -[IOSFloatingControlsViewController updateNonFloorPickerControlsVisibleForFloorPickerHidden:animated:](self, "updateNonFloorPickerControlsVisibleForFloorPickerHidden:animated:", 1, v3);
  }

}

- (void)updateNonFloorPickerControlsVisibleForFloorPickerHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  if (a3)
  {
    -[IOSFloatingControlsViewController setNonFloorPickerControlsVisible:animated:](self, "setNonFloorPickerControlsVisible:animated:", 1, a4);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    -[IOSFloatingControlsViewController setNonFloorPickerControlsVisible:animated:](self, "setNonFloorPickerControlsVisible:animated:", objc_msgSend(v6, "isOpen") ^ 1, v4);

  }
}

- (void)venueFloorViewControllerDidChangeConstraints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venuesManager"));
  objc_msgSend(v6, "venueFloorViewControllerDidChangeConstraints:", v4);

}

- (void)venueFloorViewControllerDidStartHiding:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackView](self, "controlsStackView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewControllerIfLoaded](self, "venueFloorViewControllerIfLoaded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "closedPlaceholderView"));
  objc_msgSend(v5, "removeArrangedSubview:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
  objc_msgSend(v8, "layoutIfNeeded");

  -[IOSFloatingControlsViewController updateNonFloorPickerControlsVisibleForFloorPickerHidden:animated:](self, "updateNonFloorPickerControlsVisibleForFloorPickerHidden:animated:", 1, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "venuesManager"));
  objc_msgSend(v9, "venueFloorViewControllerDidStartHiding:", v4);

}

- (void)venueFloorViewControllerDidFinishHiding:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackView](self, "controlsStackView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController venueFloorViewControllerIfLoaded](self, "venueFloorViewControllerIfLoaded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "closedPlaceholderView"));
  objc_msgSend(v5, "addArrangedSubview:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
  objc_msgSend(v8, "layoutIfNeeded");

  -[IOSFloatingControlsViewController updateNonFloorPickerControlsVisibleAnimated:](self, "updateNonFloorPickerControlsVisibleAnimated:", 1);
  v10 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "venuesManager"));
  objc_msgSend(v9, "venueFloorViewControllerDidFinishHiding:", v4);

}

- (void)venueFloorViewControllerDidStartShowing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  -[IOSFloatingControlsViewController updateNonFloorPickerControlsVisibleForFloorPickerHidden:animated:](self, "updateNonFloorPickerControlsVisibleForFloorPickerHidden:animated:", 0, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venuesManager"));
  objc_msgSend(v6, "venueFloorViewControllerDidStartShowing:", v4);

}

- (void)venueFloorViewControllerDidFinishShowing:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IOSFloatingControlsViewController updateNonFloorPickerControlsVisibleAnimated:](self, "updateNonFloorPickerControlsVisibleAnimated:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venuesManager"));
  objc_msgSend(v5, "venueFloorViewControllerDidFinishShowing:", v4);

}

- (void)venueFloorViewControllerDidOpen:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IOSFloatingControlsViewController updateNonFloorPickerControlsVisibleAnimated:](self, "updateNonFloorPickerControlsVisibleAnimated:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venuesManager"));
  objc_msgSend(v5, "venueFloorViewControllerDidOpen:", v4);

}

- (void)venueFloorViewControllerDidClose:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IOSFloatingControlsViewController updateNonFloorPickerControlsVisibleAnimated:](self, "updateNonFloorPickerControlsVisibleAnimated:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venuesManager"));
  objc_msgSend(v5, "venueFloorViewControllerDidClose:", v4);

}

- (id)venueFloorViewControllerConstraintsForViewWhenOpen:(id)a3
{
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
  id v16;
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
  _QWORD v27[4];

  v4 = a3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackView](self, "controlsStackView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v27[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackView](self, "controlsStackView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v27[1] = v17;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  v27[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:", v13));
  v27[3] = v14;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));

  return v16;
}

- (BOOL)lacksSearchResultsInVenue:(id)a3 forFloorOrdinal:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venuesManager"));
  if (objc_msgSend(v8, "hasSearchResultsInVenueForAnyFloorOrdinal:", v6))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "venuesManager"));
    v11 = objc_msgSend(v10, "hasSearchResultsInVenue:forFloorOrdinal:", v6, v4) ^ 1;

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)setRefreshViewEnable:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
  objc_msgSend(v4, "setEnable:", v3);

}

- (void)setSearchSession:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refreshSearchHereBusinessController"));
  objc_msgSend(v5, "setSearchSession:", v4);

}

- (VKVenueFeatureMarker)venueWithFocus
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "venuesManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venueWithFocus"));

  return (VKVenueFeatureMarker *)v4;
}

- (void)localSearchViewControllerDidSelectRefreshSearchHere:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator", a3));
  v5 = objc_msgSend(v4, "shouldShowSearchOverlay");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
    objc_msgSend(v6, "refreshCurrentSearch");

  }
}

- (void)viewControllerDidSelectBrowseVenue:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venuesManager"));
  objc_msgSend(v3, "presentPlaceCardForVenueWithFocusAndAddToHistory:source:centeringOnVenue:", 1, 7, 0);

}

- (void)localSearchViewShouldBeVisibleDidChange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  _BOOL4 v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  char v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewController](self, "localSearchViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "alpha");
  v7 = v6 != 1.0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
  v9 = objc_msgSend(v8, "shouldBeVisible");

  if (((v7 ^ v9) & 1) == 0)
  {
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
      objc_msgSend(v11, "layoutIfNeeded");

    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10057B770;
    v12[3] = &unk_1011ACE58;
    v12[4] = self;
    v13 = v9;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v12, 0);
  }
}

- (id)localSearchViewControllerIfLoaded
{
  return self->_localSearchViewController;
}

- (LocalSearchViewController)localSearchViewController
{
  LocalSearchViewController *localSearchViewController;
  LocalSearchViewController *v4;
  LocalSearchViewController *v5;

  localSearchViewController = self->_localSearchViewController;
  if (!localSearchViewController)
  {
    v4 = -[LocalSearchViewController initAsButton:]([LocalSearchViewController alloc], "initAsButton:", 1);
    v5 = self->_localSearchViewController;
    self->_localSearchViewController = v4;

    -[LocalSearchViewController setDelegate:](self->_localSearchViewController, "setDelegate:", self);
    localSearchViewController = self->_localSearchViewController;
  }
  return localSearchViewController;
}

- (id)_localSearchViewConstraints
{
  LocalSearchViewController *localSearchViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  localSearchViewController = self->_localSearchViewController;
  if (!localSearchViewController)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController view](localSearchViewController, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackView](self, "controlsStackView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  -[FloatingControlsViewController margin](self, "margin");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, -v8));
  v16[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackView](self, "controlsStackView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v16[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));

  return v14;
}

- (_MapsUserTrackingButton)userLocationButton
{
  _MapsUserTrackingButton *userLocationButton;
  void *v4;
  _MapsUserTrackingButton *v5;
  _MapsUserTrackingButton *v6;
  _MapsUserTrackingButton *v7;
  void *v8;
  _MapsUserTrackingButton *v9;
  void *v10;
  _MapsUserTrackingButton *v11;
  void *v12;
  double left;
  double bottom;
  double right;
  _MapsUserTrackingButton *v16;
  void *v17;
  _MapsUserTrackingButton *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];

  userLocationButton = self->_userLocationButton;
  if (!userLocationButton)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
    v5 = (_MapsUserTrackingButton *)objc_claimAutoreleasedReturnValue(+[_MapsUserTrackingButton buttonWithMapView:applyDefaultImageIfNeeded:](_MapsUserTrackingButton, "buttonWithMapView:applyDefaultImageIfNeeded:", v4, 0));
    v6 = self->_userLocationButton;
    self->_userLocationButton = v5;

    -[_MapsUserTrackingButton setAccessibilityIdentifier:](self->_userLocationButton, "setAccessibilityIdentifier:", CFSTR("UserLocationButton"));
    v7 = self->_userLocationButton;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("location")));
    -[_MapsUserTrackingButton _setImage:forUserTrackingMode:controlState:](v7, "_setImage:forUserTrackingMode:controlState:", v8, 0, 0);

    v9 = self->_userLocationButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("location.fill")));
    -[_MapsUserTrackingButton _setImage:forUserTrackingMode:controlState:](v9, "_setImage:forUserTrackingMode:controlState:", v10, 1, 0);

    v11 = self->_userLocationButton;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("location.north.line.fill")));
    -[_MapsUserTrackingButton _setImage:forUserTrackingMode:controlState:](v11, "_setImage:forUserTrackingMode:controlState:", v12, 2, 0);

    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    -[_MapsUserTrackingButton _setImageEdgeInsets:forUserTrackingMode:](self->_userLocationButton, "_setImageEdgeInsets:forUserTrackingMode:", 0, UIEdgeInsetsZero.top, left, bottom, right);
    -[_MapsUserTrackingButton _setImageEdgeInsets:forUserTrackingMode:](self->_userLocationButton, "_setImageEdgeInsets:forUserTrackingMode:", 1, UIEdgeInsetsZero.top, left, bottom, right);
    -[_MapsUserTrackingButton _setImageEdgeInsets:forUserTrackingMode:](self->_userLocationButton, "_setImageEdgeInsets:forUserTrackingMode:", 2, UIEdgeInsetsZero.top, left, bottom, right);
    v16 = self->_userLocationButton;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme floatingControlsTintColor](MapsTheme, "floatingControlsTintColor"));
    -[_MapsUserTrackingButton setTintColor:](v16, "setTintColor:", v17);

    -[_MapsUserTrackingButton _setSelectsWhenTracking:](self->_userLocationButton, "_setSelectsWhenTracking:", 0);
    -[_MapsUserTrackingButton addTarget:action:forControlEvents:](self->_userLocationButton, "addTarget:action:forControlEvents:", self, "_showLocationServicesAlertIfNeeded", 64);
    v18 = self->_userLocationButton;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5, 18.0));
    -[_MapsUserTrackingButton setPreferredSymbolConfiguration:forImageInState:](v18, "setPreferredSymbolConfiguration:forImageInState:", v19, 0);

    -[_MapsUserTrackingButton setTranslatesAutoresizingMaskIntoConstraints:](self->_userLocationButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MapsUserTrackingButton heightAnchor](self->_userLocationButton, "heightAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", 44.0));
    v26[0] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_MapsUserTrackingButton widthAnchor](self->_userLocationButton, "widthAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 44.0));
    v26[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    userLocationButton = self->_userLocationButton;
  }
  return userLocationButton;
}

- (void)_refreshUserLocationButton
{
  _MapsUserTrackingButton *userLocationButton;
  void *v4;
  id v5;

  userLocationButton = self->_userLocationButton;
  if (userLocationButton)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MapsUserTrackingButton mapView](userLocationButton, "mapView"));

    if (!v4)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
      -[_MapsUserTrackingButton setMapView:](self->_userLocationButton, "setMapView:", v5);

    }
  }
}

- (UIButton)settingsButton
{
  UIButton *settingsButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  settingsButton = self->_settingsButton;
  if (!settingsButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    v5 = self->_settingsButton;
    self->_settingsButton = v4;

    -[IOSFloatingControlsViewController _setMapModeButtonAXIdentifier](self, "_setMapModeButtonAXIdentifier");
    v6 = self->_settingsButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Map Modes"), CFSTR("localized string not found"), 0));
    -[UIButton setAccessibilityLabel:](v6, "setAccessibilityLabel:", v8);

    -[UIButton addTarget:action:forControlEvents:](self->_settingsButton, "addTarget:action:forControlEvents:", self, "_presentSettings", 64);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController _mapModeButtonImageNameForCurrentMapType](self, "_mapModeButtonImageNameForCurrentMapType"));
    -[IOSFloatingControlsViewController _mapModeButtonPointSizeForCurrentMapType](self, "_mapModeButtonPointSizeForCurrentMapType");
    -[IOSFloatingControlsViewController _configureButton:withSymbolImageName:pointSize:weight:](self, "_configureButton:withSymbolImageName:pointSize:weight:", self->_settingsButton, v9, 5);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_settingsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_settingsButton, "heightAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 44.0));
    v16[0] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_settingsButton, "widthAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:", 44.0));
    v16[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

    settingsButton = self->_settingsButton;
  }
  return settingsButton;
}

- (id)_mapModeButtonImageNameForCurrentMapType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "_cartographicConfiguration");

    if (v10 == 1)
      return CFSTR("globe.americas.fill");
    if (v10)
      return CFSTR("map.fill");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
  if (!v5)
    return CFSTR("map.fill");
  v6 = v5;
  objc_msgSend(v5, "_cartographicConfiguration");

  v7 = CFSTR("map.fill");
  if (v9 == 4)
    v7 = CFSTR("tram.fill");
  if (v9 == 2)
    return CFSTR("car.fill");
  else
    return (id)v7;
}

- (id)_mapModeAXIdentifierForCurrentMapType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "_cartographicConfiguration");

    if (v10 == 1)
      return CFSTR("Satellite");
    if (v10)
      return CFSTR("Explore");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
  if (!v5)
    return CFSTR("Explore");
  v6 = v5;
  objc_msgSend(v5, "_cartographicConfiguration");

  v7 = CFSTR("Explore");
  if (v9 == 4)
    v7 = CFSTR("Transit");
  if (v9 == 2)
    return CFSTR("Driving");
  else
    return (id)v7;
}

- (double)_mapModeButtonPointSizeForCurrentMapType
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "_cartographicConfiguration");
    if (v6 == 1)
      v4 = 18.0;
    else
      v4 = 17.0;
  }
  else
  {
    v4 = 17.0;
  }

  return v4;
}

- (void)_setMapModeButtonAXIdentifier
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController _mapModeAXIdentifierForCurrentMapType](self, "_mapModeAXIdentifierForCurrentMapType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("SettingsButton."), "stringByAppendingString:", v4));
  -[UIButton setAccessibilityIdentifier:](self->_settingsButton, "setAccessibilityIdentifier:", v3);

}

- (void)_updateMapModeButtonAppearance
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));

  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController _mapModeButtonImageNameForCurrentMapType](self, "_mapModeButtonImageNameForCurrentMapType"));
    -[IOSFloatingControlsViewController _mapModeButtonPointSizeForCurrentMapType](self, "_mapModeButtonPointSizeForCurrentMapType");
    v5 = v4;
    -[IOSFloatingControlsViewController _setMapModeButtonAXIdentifier](self, "_setMapModeButtonAXIdentifier");
    -[IOSFloatingControlsViewController _configureButton:withSymbolImageName:pointSize:weight:](self, "_configureButton:withSymbolImageName:pointSize:weight:", self->_settingsButton, v6, 5, v5);

  }
}

- (void)_presentSettings
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v3, "viewControllerOpenSettings:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController openSettingsDelegate](self, "openSettingsDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "viewControllerOpenSettings:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController openSettingsDelegate](self, "openSettingsDelegate"));
    objc_msgSend(v6, "viewControllerOpenSettings:", self);

  }
}

- (void)_showLocationServicesAlertIfNeeded
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  unsigned int v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v3 = objc_msgSend(v2, "isLocationServicesAuthorizationNeeded");

  if (v3)
  {
    v4 = sub_10057C534();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Location Services authorization is needed, will show alert", buf, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v6, "requestWhenInUseAuthorization");
    v7 = 0;
LABEL_5:

    goto LABEL_18;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v23 = 0;
  v9 = objc_msgSend(v8, "isLocationServicesPossiblyAvailable:", &v23);
  v7 = v23;

  if ((v9 & 1) == 0)
  {
    v10 = sub_10057C534();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
      v13 = objc_msgSend(v7, "code");
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));
      v15 = (void *)v14;
      if (v14)
        v16 = (const __CFString *)v14;
      else
        v16 = CFSTR("no description available");
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedRecoverySuggestion"));
      v18 = (void *)v17;
      v19 = CFSTR("no recovery suggestion available");
      *(_DWORD *)buf = 138413058;
      v25 = v12;
      if (v17)
        v19 = (const __CFString *)v17;
      v26 = 2048;
      v27 = v13;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Location Services not available, error domain => %@ code => %ld, description => %@, recovery suggestion => %@", buf, 0x2Au);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v21 = objc_msgSend(v20, "isEqualToString:", MKLocationErrorDomain);

    if (v21)
    {
      v22 = objc_msgSend(v7, "code");
      if (v22 == (id)2)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
        objc_msgSend(v6, "showLocationServicesAlertWithError:", v7);
      }
      else
      {
        if (v22)
          goto LABEL_18;
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
        objc_msgSend(v6, "promptLocationServicesOff");
      }
      goto LABEL_5;
    }
  }
LABEL_18:

}

- (void)setSettingsTipState:(int64_t)a3
{
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id location;
  objc_super v9;

  if (-[FloatingControlsViewController settingsTipState](self, "settingsTipState") != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)IOSFloatingControlsViewController;
    -[FloatingControlsViewController setSettingsTipState:](&v9, "setSettingsTipState:", a3);
    if (-[FloatingControlsViewController settingsTipState](self, "settingsTipState"))
    {
      -[IOSFloatingControlsViewController _loadSettingsTipView](self, "_loadSettingsTipView");
    }
    else
    {
      objc_initWeak(&location, self);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10057C694;
      v7[3] = &unk_1011AC860;
      v7[4] = self;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10057C6C8;
      v5[3] = &unk_1011AD4F0;
      objc_copyWeak(&v6, &location);
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, v5, 0.25);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_loadSettingsTipView
{
  SettingsTipView *v3;
  SettingsTipView *settingsTipView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  if (!self->_settingsTipView)
  {
    v3 = -[SettingsTipView initWithFrame:]([SettingsTipView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    settingsTipView = self->_settingsTipView;
    self->_settingsTipView = v3;

    -[SettingsTipView setAccessibilityIdentifier:](self->_settingsTipView, "setAccessibilityIdentifier:", CFSTR("SettingsTipView"));
    -[SettingsTipView setTranslatesAutoresizingMaskIntoConstraints:](self->_settingsTipView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SettingsTipView setDelegate:](self->_settingsTipView, "setDelegate:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController blurGroupName](self, "blurGroupName"));
    -[SettingsTipView setBlurGroupName:](self->_settingsTipView, "setBlurGroupName:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
    objc_msgSend(v6, "addSubview:", self->_settingsTipView);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView topAnchor](self->_settingsTipView, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackView](self, "controlsStackView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
    v21[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView leadingAnchor](self->_settingsTipView, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
    v11 = objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v10, sub_1005EC29C());
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v21[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView trailingAnchor](self->_settingsTipView, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController controlsStackView](self, "controlsStackView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
    v21[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  }
}

- (void)_unloadSettingsTipView
{
  SettingsTipView *settingsTipView;
  SettingsTipView *v4;

  settingsTipView = self->_settingsTipView;
  if (settingsTipView)
  {
    -[SettingsTipView removeFromSuperview](settingsTipView, "removeFromSuperview");
    v4 = self->_settingsTipView;
    self->_settingsTipView = 0;

  }
}

- (void)settingsTipViewDidTapTip:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator", a3));
  objc_msgSend(v4, "viewControllerOpenSettings:", self);

}

- (void)settingsTipViewDidTapClose:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator", a3));
  objc_msgSend(v4, "viewControllerCloseSettingsTip:", self);

}

- (UIButton)mode2DButton
{
  UIButton *mode2DButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  mode2DButton = self->_mode2DButton;
  if (!mode2DButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    v5 = self->_mode2DButton;
    self->_mode2DButton = v4;

    -[UIButton setAccessibilityIdentifier:](self->_mode2DButton, "setAccessibilityIdentifier:", CFSTR("ModeButton2D"));
    -[UIButton setHidden:](self->_mode2DButton, "setHidden:", 1);
    v6 = self->_mode2DButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("2D mode"), CFSTR("localized string not found"), 0));
    -[UIButton setAccessibilityLabel:](v6, "setAccessibilityLabel:", v8);

    v9 = self->_mode2DButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
    -[UIButton addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", v10, "exit3dMode", 64);

    -[IOSFloatingControlsViewController _configureButton:withSymbolImageName:pointSize:weight:](self, "_configureButton:withSymbolImageName:pointSize:weight:", self->_mode2DButton, CFSTR("view.2d"), 5, 17.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_mode2DButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_mode2DButton, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 44.0));
    v17[0] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_mode2DButton, "widthAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 44.0));
    v17[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

    mode2DButton = self->_mode2DButton;
  }
  return mode2DButton;
}

- (UIButton)mode3DButton
{
  UIButton *mode3DButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  mode3DButton = self->_mode3DButton;
  if (!mode3DButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    v5 = self->_mode3DButton;
    self->_mode3DButton = v4;

    -[UIButton setAccessibilityIdentifier:](self->_mode3DButton, "setAccessibilityIdentifier:", CFSTR("ModeButton3D"));
    -[UIButton setHidden:](self->_mode3DButton, "setHidden:", 1);
    v6 = self->_mode3DButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("3D mode"), CFSTR("localized string not found"), 0));
    -[UIButton setAccessibilityLabel:](v6, "setAccessibilityLabel:", v8);

    v9 = self->_mode3DButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
    -[UIButton addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", v10, "select3dMode", 64);

    -[IOSFloatingControlsViewController _configureButton:withSymbolImageName:pointSize:weight:](self, "_configureButton:withSymbolImageName:pointSize:weight:", self->_mode3DButton, CFSTR("view.3d"), 5, 17.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_mode3DButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_mode3DButton, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 44.0));
    v17[0] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_mode3DButton, "widthAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 44.0));
    v17[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

    mode3DButton = self->_mode3DButton;
  }
  return mode3DButton;
}

- (UIButton)modePedestrianARButton
{
  UIButton *modePedestrianARButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  modePedestrianARButton = self->_modePedestrianARButton;
  if (!modePedestrianARButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    v5 = self->_modePedestrianARButton;
    self->_modePedestrianARButton = v4;

    -[UIButton setAccessibilityIdentifier:](self->_modePedestrianARButton, "setAccessibilityIdentifier:", CFSTR("ModeButtonAR"));
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_modePedestrianARButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setTag:](self->_modePedestrianARButton, "setTag:", &off_1011EA608);
    v6 = self->_modePedestrianARButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Pedestrian AR [Accessibility]"), CFSTR("localized string not found"), 0));
    -[UIButton setAccessibilityLabel:](v6, "setAccessibilityLabel:", v8);

    -[UIButton addTarget:action:forControlEvents:](self->_modePedestrianARButton, "addTarget:action:forControlEvents:", self, "enterPedestrianAR:", 64);
    -[IOSFloatingControlsViewController _configureButton:withSymbolImageName:pointSize:weight:](self, "_configureButton:withSymbolImageName:pointSize:weight:", self->_modePedestrianARButton, CFSTR("arkit"), 4, 18.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_modePedestrianARButton, "heightAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:", 44.0));
    v16[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_modePedestrianARButton, "widthAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_modePedestrianARButton, "heightAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    v16[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

    modePedestrianARButton = self->_modePedestrianARButton;
  }
  return modePedestrianARButton;
}

- (void)enterPedestrianAR:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v5, "enterPedestrianAR:", v4);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 126, 302, 0);
}

- (UIButton)ttrButton
{
  UIButton *ttrButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  _QWORD v26[2];
  _QWORD v27[2];

  ttrButton = self->_ttrButton;
  if (!ttrButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    v5 = self->_ttrButton;
    self->_ttrButton = v4;

    -[UIButton setAccessibilityIdentifier:](self->_ttrButton, "setAccessibilityIdentifier:", CFSTR("TTRButton"));
    -[UIButton setHidden:](self->_ttrButton, "setHidden:", 1);
    v6 = self->_ttrButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Tap-to-Radar"), CFSTR("localized string not found"), 0));
    -[UIButton setAccessibilityLabel:](v6, "setAccessibilityLabel:", v8);

    v9 = self->_ttrButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
    -[UIButton addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", v10, "createRadar", 64);

    -[IOSFloatingControlsViewController _configureButton:withSymbolImageName:pointSize:weight:](self, "_configureButton:withSymbolImageName:pointSize:weight:", self->_ttrButton, CFSTR("ant.circle.fill"), 5, 17.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_ttrButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setContextMenuInteractionEnabled:](self->_ttrButton, "setContextMenuInteractionEnabled:", 1);
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10057D3E0;
    v23[3] = &unk_1011AF8A0;
    objc_copyWeak(&v24, &location);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Full"), 0, 0, v23));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10057D4CC;
    v21[3] = &unk_1011AF8A0;
    objc_copyWeak(&v22, &location);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Regular"), 0, 0, v21));
    v27[0] = v20;
    v27[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", CFSTR("Log archive type"), 0, 0, 1, v12));

    -[UIButton setMenu:](self->_ttrButton, "setMenu:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_ttrButton, "heightAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 44.0));
    v26[0] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_ttrButton, "widthAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", 44.0));
    v26[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    ttrButton = self->_ttrButton;
  }
  return ttrButton;
}

- (UIButton)ssaoButton
{
  UIButton *ssaoButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  ssaoButton = self->_ssaoButton;
  if (!ssaoButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    v5 = self->_ssaoButton;
    self->_ssaoButton = v4;

    -[UIButton setAccessibilityIdentifier:](self->_ssaoButton, "setAccessibilityIdentifier:", CFSTR("SSAOButton"));
    -[UIButton setHidden:](self->_ssaoButton, "setHidden:", 1);
    v6 = self->_ssaoButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SSAO"), CFSTR("localized string not found"), 0));
    -[UIButton setAccessibilityLabel:](v6, "setAccessibilityLabel:", v8);

    v9 = self->_ssaoButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
    -[UIButton addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", v10, "toggleSSAO", 64);

    -[IOSFloatingControlsViewController _configureButton:withSymbolImageName:pointSize:weight:](self, "_configureButton:withSymbolImageName:pointSize:weight:", self->_ssaoButton, CFSTR("s.circle.fill"), 5, 20.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_ssaoButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_ssaoButton, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 44.0));
    v17[0] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_ssaoButton, "widthAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 44.0));
    v17[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

    ssaoButton = self->_ssaoButton;
  }
  return ssaoButton;
}

- (void)createRadar
{
  id v3;
  NSObject *v4;
  IOSFloatingControlsViewController *v5;
  IOSFloatingControlsViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint8_t buf[4];
  __CFString *v15;

  v3 = sub_10057C534();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR from floating control", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v13, "launchTTR");

}

- (void)toggleSSAO
{
  int BOOL;

  BOOL = GEOConfigGetBOOL(MapsFeaturesConfig_SSAOEnabled[0], MapsFeaturesConfig_SSAOEnabled[1]);
  GEOConfigSetBOOL(MapsFeaturesConfig_SSAOEnabled[0], MapsFeaturesConfig_SSAOEnabled[1], BOOL ^ 1u);
}

- (void)_configureButton:(id)a3 withSymbolImageName:(id)a4 pointSize:(double)a5 weight:(int64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;

  v9 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", a4));
  objc_msgSend(v9, "setImage:forState:", v12, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme floatingControlsTintColor](MapsTheme, "floatingControlsTintColor"));
  objc_msgSend(v9, "setTintColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", a6, a5));
  objc_msgSend(v9, "setPreferredSymbolConfiguration:forImageInState:", v11, 0);

}

- (BOOL)nonFloorPickerControlsVisible
{
  return self->_nonFloorPickerControlsVisible;
}

- (void)setNonFloorPickerControlsVisible:(BOOL)a3
{
  self->_nonFloorPickerControlsVisible = a3;
}

- (void)setControlsStackView:(id)a3
{
  objc_storeStrong((id *)&self->_controlsStackView, a3);
}

- (void)setButtonsContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsContainerViewController, a3);
}

- (void)setUserLocationButton:(id)a3
{
  objc_storeStrong((id *)&self->_userLocationButton, a3);
}

- (void)setSettingsButton:(id)a3
{
  objc_storeStrong((id *)&self->_settingsButton, a3);
}

- (void)setMode2DButton:(id)a3
{
  objc_storeStrong((id *)&self->_mode2DButton, a3);
}

- (void)setMode3DButton:(id)a3
{
  objc_storeStrong((id *)&self->_mode3DButton, a3);
}

- (void)setModePedestrianARButton:(id)a3
{
  objc_storeStrong((id *)&self->_modePedestrianARButton, a3);
}

- (void)setTtrButton:(id)a3
{
  objc_storeStrong((id *)&self->_ttrButton, a3);
}

- (VenueFloorViewController)venueFloorViewController
{
  return self->_venueFloorViewController;
}

- (void)setVenueFloorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_venueFloorViewController, a3);
}

- (void)setLocalSearchViewController:(id)a3
{
  objc_storeStrong((id *)&self->_localSearchViewController, a3);
}

- (double)yawPriorToHeadingTracking
{
  return self->_yawPriorToHeadingTracking;
}

- (void)setYawPriorToHeadingTracking:(double)a3
{
  self->_yawPriorToHeadingTracking = a3;
}

- (SettingsTipView)settingsTipView
{
  return self->_settingsTipView;
}

- (void)setSettingsTipView:(id)a3
{
  objc_storeStrong((id *)&self->_settingsTipView, a3);
}

- (UILabel)sizeDebugLabel
{
  return self->_sizeDebugLabel;
}

- (void)setSizeDebugLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sizeDebugLabel, a3);
}

- (void)setSsaoButton:(id)a3
{
  objc_storeStrong((id *)&self->_ssaoButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssaoButton, 0);
  objc_storeStrong((id *)&self->_sizeDebugLabel, 0);
  objc_storeStrong((id *)&self->_settingsTipView, 0);
  objc_storeStrong((id *)&self->_localSearchViewController, 0);
  objc_storeStrong((id *)&self->_venueFloorViewController, 0);
  objc_storeStrong((id *)&self->_ttrButton, 0);
  objc_storeStrong((id *)&self->_modePedestrianARButton, 0);
  objc_storeStrong((id *)&self->_mode3DButton, 0);
  objc_storeStrong((id *)&self->_mode2DButton, 0);
  objc_storeStrong((id *)&self->_settingsButton, 0);
  objc_storeStrong((id *)&self->_userLocationButton, 0);
  objc_storeStrong((id *)&self->_buttonsContainerViewController, 0);
  objc_storeStrong((id *)&self->_controlsStackView, 0);
}

@end
