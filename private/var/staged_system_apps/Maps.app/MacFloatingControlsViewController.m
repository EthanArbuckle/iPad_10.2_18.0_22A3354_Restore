@implementation MacFloatingControlsViewController

- (id)floatingButtonLeadingGuide
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "trailingAnchor"));

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MacFloatingControlsViewController;
  -[FloatingControlsViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venuesManager"));
  objc_msgSend(v5, "addChangeObserver:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venuesManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venueWithFocus"));
  -[MacFloatingControlsViewController didChangeFocusedVenue:](self, "didChangeFocusedVenue:", v8);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MacFloatingControlsViewController;
  -[MacFloatingControlsViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venuesManager"));
  objc_msgSend(v5, "removeChangeObserver:", self);

}

- (void)updateCompassInsets
{
  void *v3;
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
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v27;
  id v28;

  if (-[FloatingControlsViewController automaticallyUpdateCompassInsets](self, "automaticallyUpdateCompassInsets"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
    v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");

    v5 = sub_1005EC29C();
    v6 = sub_1005EC29C();
    if (v4 == (id)1)
      v7 = v5;
    else
      v7 = 0.0;
    if (v4 == (id)1)
    {
      v5 = v6;
      v8 = 0.0;
    }
    else
    {
      v8 = v6;
    }
    -[MacFloatingControlsViewController additionalCompassEdgeInsets](self, "additionalCompassEdgeInsets");
    v13 = UIEdgeInsetsAdd(15, 0.0, v7, v5, v8, v9, v10, v11, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
    objc_msgSend(v20, "_compassInsets");
    if (v15 != v24 || v13 != v21 || v19 != v23)
    {

LABEL_18:
      v28 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
      objc_msgSend(v28, "_setCompassInsets:animated:", 0, v13, v15, v17, v19);

      return;
    }
    v27 = v22;

    if (v17 != v27)
      goto LABEL_18;
  }
}

- (void)setAdditionalCompassEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_additionalCompassEdgeInsets.left
    || a3.top != self->_additionalCompassEdgeInsets.top
    || a3.right != self->_additionalCompassEdgeInsets.right
    || a3.bottom != self->_additionalCompassEdgeInsets.bottom)
  {
    self->_additionalCompassEdgeInsets = a3;
    -[MacFloatingControlsViewController updateCompassInsets](self, "updateCompassInsets");
  }
}

- (void)_showSearchHereIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self->_localSearchViewController, "refreshSearchHereBusinessController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchSession"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchInfo"));

  if (v12)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
    v8 = objc_opt_respondsToSelector(v7, "showRedoSearchOverlay:");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self->_localSearchViewController, "refreshSearchHereBusinessController"));
      v10 = objc_msgSend(v9, "shouldShowManualRedoButton");

      if (v3 || v10 && objc_msgSend(v12, "shouldAllowManualRedoButton"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
        objc_msgSend(v11, "showRedoSearchOverlay:", v3);

      }
    }
  }

}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MacFloatingControlsViewController;
  v7 = -[FloatingControlsViewController mapView:regionDidChangeAnimated:](&v12, "mapView:regionDidChangeAnimated:", v6, v4);
  if (MapsFeature_IsEnabled_SearchAndDiscovery(v7))
  {
    if (self->_tappedTrackingButton)
    {
      self->_tappedTrackingButton = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "refreshSearchHereBusinessController"));
      v10 = objc_msgSend(v9, "didStopRespondingToGesture:", v6);

      -[MacFloatingControlsViewController _showSearchHereIfNeeded:](self, "_showSearchHereIfNeeded:", v10);
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self->_localSearchViewController, "refreshSearchHereBusinessController"));
    objc_msgSend(v11, "handleMapViewRegionDidChange:", v6);

  }
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  LocalSearchViewController *localSearchViewController;
  id v6;
  id v7;

  if (!a4)
  {
    localSearchViewController = self->_localSearchViewController;
    v6 = a3;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](localSearchViewController, "refreshSearchHereBusinessController"));
    objc_msgSend(v7, "didStartRespondingToGesture:", v6);

  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  LocalSearchViewController *localSearchViewController;
  id v10;
  void *v11;
  id v12;

  localSearchViewController = self->_localSearchViewController;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](localSearchViewController, "refreshSearchHereBusinessController"));
  v12 = objc_msgSend(v11, "didStopRespondingToGesture:", v10);

  -[MacFloatingControlsViewController _showSearchHereIfNeeded:](self, "_showSearchHereIfNeeded:", v12);
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  id v7;
  void *v8;
  id v9;

  if (a6)
  {
    self->_tappedTrackingButton = 1;
    v7 = a3;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "refreshSearchHereBusinessController"));
    objc_msgSend(v8, "didStartRespondingToGesture:", v7);

  }
}

- (id)venueFloorViewControllerIfLoaded
{
  return self->_venueFloorViewController;
}

- (void)didChangeFocusedVenue:(id)a3
{
  if (a3)
    -[MacFloatingControlsViewController setupVenueFloorViewController](self, "setupVenueFloorViewController");
}

- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = -[FloatingControlsViewController _sanitizedControlsFromControls:](self, "_sanitizedControlsFromControls:", a3, a4);
  if (-[FloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 64, v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    objc_msgSend(v6, "setForceHidden:", 0);
    v7 = 64;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController venueFloorViewControllerIfLoaded](self, "venueFloorViewControllerIfLoaded"));
    objc_msgSend(v6, "setForceHidden:", 1);
    v7 = 0;
  }

  if (-[FloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 4, v5)
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator")),
        v9 = objc_msgSend(v8, "shouldShowSearchOverlay"),
        v8,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
    objc_msgSend(v10, "setEnable:", 1);

    v7 |= 4uLL;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    objc_msgSend(v11, "setEnable:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    objc_msgSend(v12, "willMoveToParentViewController:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewIfLoaded"));
    objc_msgSend(v14, "removeFromSuperview");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    objc_msgSend(v15, "removeFromParentViewController");

  }
  -[FloatingControlsViewController setVisibleControls:](self, "setVisibleControls:", v7);
}

- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = -[FloatingControlsViewController visibleControls](self, "visibleControls", a3, a4);
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 4, a3))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewIfLoaded"));
    objc_msgSend(v8, "removeFromSuperview");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewControllerIfLoaded](self, "localSearchViewControllerIfLoaded"));
    objc_msgSend(v9, "setEnable:", 0);

    v6 &= ~4uLL;
  }
  if (-[FloatingControlsViewController shouldHide:withControlOptions:](self, "shouldHide:withControlOptions:", 64, a3))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController venueFloorViewControllerIfLoaded](self, "venueFloorViewControllerIfLoaded"));
    objc_msgSend(v10, "setForceHidden:", 1);

    v6 &= ~0x40uLL;
  }
  -[FloatingControlsViewController setVisibleControls:](self, "setVisibleControls:", v6);
}

- (void)setupVenueFloorViewController
{
  void *v3;
  MacVenueControlsViewController *v4;
  void *v5;
  void *v6;
  MacVenueControlsViewController *v7;
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
  _QWORD v27[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));

  if (!v3)
  {
    v4 = [MacVenueControlsViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "venuesManager"));
    v7 = -[MacVenueControlsViewController initWithVenueFloorViewDelegate:venueBrowseDelegate:venuesManager:](v4, "initWithVenueFloorViewDelegate:venueBrowseDelegate:venuesManager:", self, self, v6);
    -[MacFloatingControlsViewController setVenueFloorViewController:](self, "setVenueFloorViewController:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "venuesManager"));
    objc_msgSend(v10, "setVenueFloorViewController:", v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    objc_msgSend(v11, "setForceHidden:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    -[MacFloatingControlsViewController addChildViewController:](self, "addChildViewController:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
    objc_msgSend(v15, "addSubview:", v14);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerXAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v17));
    v27[0] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 0.0));
    v27[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
    objc_msgSend(v24, "layoutIfNeeded");

    if ((-[FloatingControlsViewController visibleControls](self, "visibleControls") & 0x40) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController venueFloorViewController](self, "venueFloorViewController"));
      objc_msgSend(v25, "setForceHidden:animated:completion:", 0, 1, 0);

    }
  }
}

- (void)venueFloorViewControllerDidChangeConstraints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
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
  id v7;

  v4 = a3;
  -[MacFloatingControlsViewController setRefreshViewEnable:](self, "setRefreshViewEnable:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venuesManager"));
  objc_msgSend(v6, "venueFloorViewControllerDidStartHiding:", v4);

}

- (void)venueFloorViewControllerDidFinishHiding:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venuesManager"));
  objc_msgSend(v6, "venueFloorViewControllerDidFinishHiding:", v4);

}

- (void)venueFloorViewControllerDidStartShowing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MacFloatingControlsViewController setRefreshViewEnable:](self, "setRefreshViewEnable:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

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
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venuesManager"));
  objc_msgSend(v5, "venueFloorViewControllerDidClose:", v4);

}

- (id)venueFloorViewControllerConstraintsForViewWhenOpen:(id)a3
{
  return 0;
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
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
  objc_msgSend(v4, "setEnable:", v3);

}

- (void)setSearchSession:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
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
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator", a3));
  objc_msgSend(v3, "refreshCurrentSearch");

}

- (void)viewControllerDidSelectBrowseVenue:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venuesManager"));
  objc_msgSend(v3, "presentPlaceCardForVenueWithFocusAndAddToHistory:source:centeringOnVenue:", 1, 7, 1);

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

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "alpha");
  v7 = v6 != 1.0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
  v9 = objc_msgSend(v8, "shouldBeVisible");

  if (((v7 ^ v9) & 1) == 0)
  {
    if (v9)
    {
      -[MacFloatingControlsViewController setupLocalSearchViewController](self, "setupLocalSearchViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
      objc_msgSend(v11, "layoutIfNeeded");

    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10057EDE4;
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

- (void)setupLocalSearchViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

  if (!v5)
  {
    -[MacFloatingControlsViewController addChildViewController:](self, "addChildViewController:", self->_localSearchViewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController _localSearchViewConstraints](self, "_localSearchViewConstraints"));
    -[FloatingControlsViewController _addSubview:withConstraints:](self, "_addSubview:withConstraints:", v7, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
    v10 = (double)objc_msgSend(v9, "shouldBeVisible");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController localSearchViewController](self, "localSearchViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    objc_msgSend(v12, "setAlpha:", v10);

    -[LocalSearchViewController didMoveToParentViewController:](self->_localSearchViewController, "didMoveToParentViewController:", self);
  }
}

- (id)_localSearchViewConstraints
{
  LocalSearchViewController *localSearchViewController;
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
  _QWORD v15[2];

  localSearchViewController = self->_localSearchViewController;
  if (!localSearchViewController)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController view](localSearchViewController, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  v15[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacFloatingControlsViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v15[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));

  return v13;
}

- (UIEdgeInsets)additionalCompassEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalCompassEdgeInsets.top;
  left = self->_additionalCompassEdgeInsets.left;
  bottom = self->_additionalCompassEdgeInsets.bottom;
  right = self->_additionalCompassEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (MacVenueControlsViewController)venueFloorViewController
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSearchViewController, 0);
  objc_storeStrong((id *)&self->_venueFloorViewController, 0);
}

@end
