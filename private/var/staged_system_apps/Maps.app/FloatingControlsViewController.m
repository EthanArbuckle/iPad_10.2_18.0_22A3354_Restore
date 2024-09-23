@implementation FloatingControlsViewController

- (void)setMapViewProviding:(id)a3
{
  objc_storeWeak((id *)&self->_mapViewProviding, a3);
}

- (MKMapView)mapView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewProviding);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapView"));

  return (MKMapView *)v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FloatingControlsViewController;
  -[FloatingControlsViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setAllowsGroupOpacity:", 0);

  self->_visible = 1;
  self->_isConfigured = 0;
  self->_alpha = 1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController view](self, "view"));
  objc_msgSend(v5, "_setHostsLayoutEngine:", 1);

  -[FloatingControlsViewController setVisibleControls:](self, "setVisibleControls:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FloatingControlsViewController;
  -[FloatingControlsViewController viewWillAppear:](&v13, "viewWillAppear:", a3);
  if (!self->_isConfigured)
  {
    self->_isConfigured = 1;
    -[MapsThemeViewController updateTheme](self, "updateTheme");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
  v5 = (char *)objc_msgSend(v4, "mapType");
  v6 = 0;
  if ((unint64_t)(v5 - 1) >= 4 && v5 != (char *)107)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController traitCollection](self, "traitCollection"));
    v6 = objc_msgSend(v7, "userInterfaceStyle") != (id)2;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
  objc_msgSend(v8, "_setCompassViewSize:style:", 1, v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController view](self, "view"));
  v10 = objc_msgSend(v9, "effectiveUserInterfaceLayoutDirection");

  if (v10 == (id)1)
    v11 = 8;
  else
    v11 = 4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
  objc_msgSend(v12, "setAttributionCorner:", v11);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FloatingControlsViewController;
  -[FloatingControlsViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[FloatingControlsViewController updateCompassInsets](self, "updateCompassInsets");
}

- (void)updateCompassInsets
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MaxY;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  CGRect v32;

  if (-[FloatingControlsViewController automaticallyUpdateCompassInsets](self, "automaticallyUpdateCompassInsets"))
  {
    v31 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController controlsStackViewIfLoaded](self, "controlsStackViewIfLoaded"));
    if (v31 && self->_visible)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
      objc_msgSend(v31, "bounds");
      objc_msgSend(v3, "convertRect:fromView:", v31);
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;

      v32.origin.x = v5;
      v32.origin.y = v7;
      v32.size.width = v9;
      v32.size.height = v11;
      MaxY = CGRectGetMaxY(v32);
      v13 = 0.0;
      if (MaxY <= 0.0)
      {
LABEL_9:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
        objc_msgSend(v19, "_compassInsets");
        v21 = v20;
        v23 = v22;

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
        objc_msgSend(v24, "_compassInsets");
        if (v21 == v28 && v13 == v25 && v23 == v27)
        {
          v29 = v26;

          if (v29 == 0.0)
          {
LABEL_16:

            return;
          }
        }
        else
        {

        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
        objc_msgSend(v30, "_setCompassInsets:", v13, v21, 0.0, v23);

        goto LABEL_16;
      }
      v14 = MaxY + sub_1005EC29C();
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
      objc_msgSend(v15, "_edgeInsets");
      v13 = v14 - v16;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController view](self, "view"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));
      objc_msgSend(v17, "safeAreaInsets");
      v13 = v18;

    }
    goto LABEL_9;
  }
}

- (id)controlsStackViewIfLoaded
{
  return 0;
}

- (void)setBlurGroupName:(id)a3
{
  NSString *v4;
  NSString *blurGroupName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v4;

}

- (void)setAutomaticallyUpdateCompassInsets:(BOOL)a3
{
  if (self->_automaticallyUpdateCompassInsets != a3)
  {
    self->_automaticallyUpdateCompassInsets = a3;
    -[FloatingControlsViewController updateCompassInsets](self, "updateCompassInsets");
  }
}

- (BOOL)shouldHide:(int64_t)a3 withControlOptions:(int64_t)a4
{
  return (-[FloatingControlsViewController visibleControls](self, "visibleControls") & a3) != 0 && (a4 & a3) != 0;
}

- (BOOL)shouldShow:(int64_t)a3 withControlOptions:(int64_t)a4
{
  return ((a4 | -[FloatingControlsViewController visibleControls](self, "visibleControls")) & a3) != 0;
}

- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  -[FloatingControlsViewController setVisibleControls:](self, "setVisibleControls:", 0, a4);
}

- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  -[FloatingControlsViewController setVisibleControls:](self, "setVisibleControls:", -[FloatingControlsViewController visibleControls](self, "visibleControls", a3, a4));
}

- (int64_t)_sanitizedControlsFromControls:(int64_t)a3
{
  return a3;
}

- (void)_addSubview:(id)a3 withConstraints:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", v6);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);
}

- (double)compassDiameter
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController mapView](self, "mapView"));
  objc_msgSend(v2, "_compassDiameter");
  v4 = v3;

  return v4;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  -[WeatherMapPanningCoordinator handleMapViewRegionDidChange:](self->_weatherMapPanningCoordinator, "handleMapViewRegionDidChange:", a3, a4);
}

- (void)setVisible:(BOOL)a3
{
  -[FloatingControlsViewController setVisible:animated:](self, "setVisible:animated:", a3, 0);
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  -[FloatingControlsViewController setVisible:animated:completion:](self, "setVisible:animated:completion:", a3, a4, 0);
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    -[FloatingControlsViewController _updateAlphaAnimated:completion:](self, "_updateAlphaAnimated:completion:", a4, a5);
  }
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
  -[FloatingControlsViewController _updateAlphaAnimated:completion:](self, "_updateAlphaAnimated:completion:", 0, 0);
}

- (void)_updateAlphaAnimated:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double alpha;
  void *v10;
  _QWORD v11[5];

  v6 = a4;
  if (a3)
  {
    if (self->_visible)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController view](self, "view"));
      objc_msgSend(v7, "setHidden:", 0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController view](self, "view"));
      objc_msgSend(v8, "setAlpha:", 0.0);

    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100578B00;
    v11[3] = &unk_1011AC860;
    v11[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v11, v6);
  }
  else
  {
    if (self->_visible)
      alpha = self->_alpha;
    else
      alpha = 0.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController view](self, "view"));
    objc_msgSend(v10, "setAlpha:", alpha);

    -[FloatingControlsViewController updateCompassInsets](self, "updateCompassInsets");
  }

}

- (int)currentUITargetForAnalytics
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  if ((objc_opt_respondsToSelector(v5, "currentUITargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentUITargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"));
  if ((objc_opt_respondsToSelector(v5, "currentMapViewTargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentMapViewTargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (int64_t)settingsTipState
{
  return self->_settingsTipState;
}

- (void)setSettingsTipState:(int64_t)a3
{
  self->_settingsTipState = a3;
}

- (FloatingControlsViewControllerActionCoordination)actionCoordinator
{
  return (FloatingControlsViewControllerActionCoordination *)objc_loadWeakRetained((id *)&self->_actionCoordinator);
}

- (void)setActionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_actionCoordinator, a3);
}

- (MapViewProviding)mapViewProviding
{
  return (MapViewProviding *)objc_loadWeakRetained((id *)&self->_mapViewProviding);
}

- (int64_t)visibleControls
{
  return self->_visibleControls;
}

- (void)setVisibleControls:(int64_t)a3
{
  self->_visibleControls = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (NSLayoutXAxisAnchor)floatingButtonLeadingGuide
{
  return self->_floatingButtonLeadingGuide;
}

- (CGRect)floatingButtonsFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_floatingButtonsFrame.origin.x;
  y = self->_floatingButtonsFrame.origin.y;
  width = self->_floatingButtonsFrame.size.width;
  height = self->_floatingButtonsFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)lookAroundButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lookAroundButtonFrame.origin.x;
  y = self->_lookAroundButtonFrame.origin.y;
  width = self->_lookAroundButtonFrame.size.width;
  height = self->_lookAroundButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (FloatingControlsViewControllerOpenSettingsDelegate)openSettingsDelegate
{
  return (FloatingControlsViewControllerOpenSettingsDelegate *)objc_loadWeakRetained((id *)&self->_openSettingsDelegate);
}

- (void)setOpenSettingsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_openSettingsDelegate, a3);
}

- (BOOL)automaticallyUpdateCompassInsets
{
  return self->_automaticallyUpdateCompassInsets;
}

- (BOOL)hasReceivedLocationUpdate
{
  return self->_hasReceivedLocationUpdate;
}

- (void)setHasReceivedLocationUpdate:(BOOL)a3
{
  self->_hasReceivedLocationUpdate = a3;
}

- (BOOL)visible
{
  return self->_visible;
}

- (WeatherLocationDataProvider)weatherLocationDataProvider
{
  return self->_weatherLocationDataProvider;
}

- (void)setWeatherLocationDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_weatherLocationDataProvider, a3);
}

- (WeatherMapPanningCoordinator)weatherMapPanningCoordinator
{
  return self->_weatherMapPanningCoordinator;
}

- (void)setWeatherMapPanningCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_weatherMapPanningCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherMapPanningCoordinator, 0);
  objc_storeStrong((id *)&self->_weatherLocationDataProvider, 0);
  objc_destroyWeak((id *)&self->_openSettingsDelegate);
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_storeStrong((id *)&self->_floatingButtonLeadingGuide, 0);
  objc_destroyWeak((id *)&self->_mapViewProviding);
  objc_destroyWeak((id *)&self->_actionCoordinator);
}

@end
