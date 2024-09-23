@implementation WeatherOverlay

- (void)setHost:(id)a3
{
  id WeakRetained;
  WeatherStackViewController *stackViewController;
  void *v6;
  void *v7;
  WeatherStackViewController *v8;
  void *v9;
  WeatherStackViewController *v10;
  WeatherStackViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained != obj)
  {
    stackViewController = self->_stackViewController;
    if (stackViewController)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController parentViewController](stackViewController, "parentViewController"));

      if (v6)
      {
        -[WeatherStackViewController willMoveToParentViewController:](self->_stackViewController, "willMoveToParentViewController:", 0);
        if (-[WeatherStackViewController isViewLoaded](self->_stackViewController, "isViewLoaded"))
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self->_stackViewController, "view"));
          objc_msgSend(v7, "removeFromSuperview");

        }
        -[WeatherStackViewController removeFromParentViewController](self->_stackViewController, "removeFromParentViewController");
        -[WeatherOverlay _invalidateConstraints](self, "_invalidateConstraints");
      }
    }
    objc_storeWeak((id *)&self->_host, obj);
    if (obj)
    {
      if (!self->_stackViewController)
      {
        v8 = [WeatherStackViewController alloc];
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay weatherLocationDataProvider](self, "weatherLocationDataProvider"));
        v10 = -[WeatherStackViewController initWithWeatherLocationDataProvider:delegate:](v8, "initWithWeatherLocationDataProvider:delegate:", v9, self);
        v11 = self->_stackViewController;
        self->_stackViewController = v10;

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "containingViewController"));
      -[WeatherStackViewController willMoveToParentViewController:](self->_stackViewController, "willMoveToParentViewController:", v12);
      objc_msgSend(v12, "addChildViewController:", self->_stackViewController);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "overlayContentView"));
      -[WeatherOverlay _installInContentView:](self, "_installInContentView:", v13);

      -[WeatherStackViewController didMoveToParentViewController:](self->_stackViewController, "didMoveToParentViewController:", v12);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[WeatherSettingsManager settingsUpdatedNotification](WeatherSettingsManager, "settingsUpdatedNotification"));
    objc_msgSend(v14, "addObserver:selector:name:object:", self, "_updateLocation", v15, 0);

  }
}

- (void)_installInContentView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay view](self, "view"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

  if (v5 != v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay view](self, "view"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay view](self, "view"));
    objc_msgSend(v8, "addSubview:", v7);

    -[WeatherOverlay _updateLayout](self, "_updateLayout");
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

- (void)_updateConstraintsIfNeeded
{
  id WeakRetained;
  void *v4;
  _BOOL4 hasLeadingEdgeLayout;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  NSArray *v16;
  NSArray *constraints;
  _QWORD v18[2];
  _QWORD v19[2];

  if (!self->_constraints)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layoutGuideForOverlay:", self));

    if (v4)
    {
      hasLeadingEdgeLayout = self->_hasLeadingEdgeLayout;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay view](self, "view"));
      v7 = v6;
      if (hasLeadingEdgeLayout)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
        v19[0] = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay view](self, "view"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
        v19[1] = v14;
        v15 = v19;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
        v18[0] = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay view](self, "view"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
        v18[1] = v14;
        v15 = v18;
      }
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
      constraints = self->_constraints;
      self->_constraints = v16;

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
    }

  }
}

- (void)_updateLayout
{
  void *v3;
  _BOOL4 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == (id)5;

  if (self->_hasLeadingEdgeLayout != v4)
  {
    self->_hasLeadingEdgeLayout = v4;
    -[WeatherOverlay _invalidateConstraints](self, "_invalidateConstraints");
  }
  -[WeatherOverlay _updateConstraintsIfNeeded](self, "_updateConstraintsIfNeeded");
}

- (void)setContainerStyle:(unint64_t)a3
{
  if (self->_containerStyle != a3)
  {
    self->_containerStyle = a3;
    -[WeatherOverlay _updateLayout](self, "_updateLayout");
  }
}

- (id)view
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay stackViewController](self, "stackViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return v3;
}

- (BOOL)isHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay stackViewController](self, "stackViewController"));
  v3 = objc_msgSend(v2, "overlayHidden");

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  -[WeatherOverlay setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  CLLocationCoordinate2D v21;
  CLLocationCoordinate2D v22;

  v4 = a4;
  v5 = a3;
  if (-[WeatherOverlay isHidden](self, "isHidden"))
  {
    if (!v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay locationDataProvider](self, "locationDataProvider"));
      objc_msgSend(v7, "coordinate");
      v9 = v8;
      v11 = v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay mapPanningCoordinator](self, "mapPanningCoordinator"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay mapView](self, "mapView"));
      objc_msgSend(v12, "handleMapViewRegionDidChange:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay locationDataProvider](self, "locationDataProvider"));
      objc_msgSend(v14, "coordinate");
      v16 = v15;
      v18 = v17;

      v21.latitude = v9;
      v21.longitude = v11;
      LODWORD(v14) = CLLocationCoordinate2DIsValid(v21);
      v22.latitude = v16;
      v22.longitude = v18;
      if ((_DWORD)v14 != CLLocationCoordinate2DIsValid(v22) || v9 != v16 || v11 != v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay stackViewController](self, "stackViewController"));
        objc_msgSend(v19, "clearSavedLocation");

      }
    }
  }
  v20 = (id)objc_claimAutoreleasedReturnValue(-[WeatherOverlay stackViewController](self, "stackViewController"));
  objc_msgSend(v20, "setOverlayHidden:animated:", v5, v4);

}

- (double)alpha
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay stackViewController](self, "stackViewController"));
  objc_msgSend(v2, "overlayAlpha");
  v4 = v3;

  return v4;
}

- (void)setAlpha:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[WeatherOverlay stackViewController](self, "stackViewController"));
  objc_msgSend(v4, "setOverlayAlpha:", a3);

}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay mapViewProvider](self, "mapViewProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (void)setMapViewProvider:(id)a3
{
  id v4;
  MapViewProviding **p_mapViewProvider;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id obj;

  v4 = a3;
  p_mapViewProvider = &self->_mapViewProvider;
  v6 = (unint64_t)objc_loadWeakRetained((id *)p_mapViewProvider);
  v7 = (unint64_t)v4;
  if (v7 | v6)
  {
    obj = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)obj;
    if ((v8 & 1) == 0)
    {
      objc_storeWeak((id *)p_mapViewProvider, obj);
      v7 = (unint64_t)obj;
    }
  }

}

- (void)_updateLocation
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[WeatherOverlay mapPanningCoordinator](self, "mapPanningCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay mapView](self, "mapView"));
  objc_msgSend(v4, "handleMapViewRegionDidChange:forceUpdate:", v3, 1);

}

- (id)weatherLocationDataProvider
{
  WeatherLocationDataProvider *locationDataProvider;
  WeatherLocationDataProvider *v4;
  WeatherLocationDataProvider *v5;
  WeatherMapPanningCoordinator *v6;
  void *v7;
  void *v8;

  locationDataProvider = self->_locationDataProvider;
  if (!locationDataProvider)
  {
    v4 = objc_alloc_init(WeatherLocationDataProvider);
    v5 = self->_locationDataProvider;
    self->_locationDataProvider = v4;

    v6 = -[WeatherMapPanningCoordinator initWithWeatherLocationDataProvider:]([WeatherMapPanningCoordinator alloc], "initWithWeatherLocationDataProvider:", self->_locationDataProvider);
    -[WeatherOverlay setMapPanningCoordinator:](self, "setMapPanningCoordinator:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay mapPanningCoordinator](self, "mapPanningCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherOverlay mapView](self, "mapView"));
    objc_msgSend(v7, "handleMapViewRegionDidChange:", v8);

    locationDataProvider = self->_locationDataProvider;
  }
  return locationDataProvider;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5;

  v5 = a3;
  if (!-[WeatherOverlay isHidden](self, "isHidden"))
    -[WeatherMapPanningCoordinator handleMapViewRegionDidChange:](self->_mapPanningCoordinator, "handleMapViewRegionDidChange:", v5);

}

- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4
{
  uint64_t v4;
  id v5;

  if (a4 - 1 < 4 || a4 == 107)
    v4 = 2;
  else
    v4 = 0;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[WeatherOverlay stackViewController](self, "stackViewController", a3));
  objc_msgSend(v5, "setOverrideUserInterfaceStyle:", v4);

}

- (void)weatherStackViewController:(id)a3 openURL:(id)a4
{
  id v5;
  MapsWebLinkPresenter *v6;
  id WeakRetained;
  void *v8;
  MapsWebLinkPresenter *v9;

  v5 = a4;
  v6 = [MapsWebLinkPresenter alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "containingViewController"));
  v9 = -[MapsWebLinkPresenter initWithPresentingViewController:](v6, "initWithPresentingViewController:", v8);

  -[MapsWebLinkPresenter presentWebURL:](v9, "presentWebURL:", v5);
}

- (ChromeOverlayHosting)host
{
  return (ChromeOverlayHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (MapViewProviding)mapViewProvider
{
  return (MapViewProviding *)objc_loadWeakRetained((id *)&self->_mapViewProvider);
}

- (unint64_t)containerStyle
{
  return self->_containerStyle;
}

- (WeatherStackViewController)stackViewController
{
  return self->_stackViewController;
}

- (void)setStackViewController:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewController, a3);
}

- (WeatherLocationDataProvider)locationDataProvider
{
  return self->_locationDataProvider;
}

- (void)setLocationDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_locationDataProvider, a3);
}

- (WeatherMapPanningCoordinator)mapPanningCoordinator
{
  return self->_mapPanningCoordinator;
}

- (void)setMapPanningCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_mapPanningCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapPanningCoordinator, 0);
  objc_storeStrong((id *)&self->_locationDataProvider, 0);
  objc_storeStrong((id *)&self->_stackViewController, 0);
  objc_destroyWeak((id *)&self->_mapViewProvider);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
