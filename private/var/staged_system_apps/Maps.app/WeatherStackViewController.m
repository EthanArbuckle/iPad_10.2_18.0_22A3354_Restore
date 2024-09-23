@implementation WeatherStackViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (WeatherStackViewController)initWithWeatherLocationDataProvider:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  WeatherStackViewController *v8;
  WeatherConditionsViewController *v9;
  WeatherConditionsViewController *weatherConditionsViewController;
  AirQualityConditionsViewController *v11;
  AirQualityConditionsViewController *airQualityConditionsViewController;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WeatherStackViewController;
  v8 = -[WeatherStackViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  if (v8)
  {
    objc_msgSend(v6, "addObserver:", v8);
    v9 = -[WeatherConditionsViewController initWithWeatherLocationDataProvider:]([WeatherConditionsViewController alloc], "initWithWeatherLocationDataProvider:", v6);
    weatherConditionsViewController = v8->_weatherConditionsViewController;
    v8->_weatherConditionsViewController = v9;

    -[WeatherConditionsViewController setDelegate:](v8->_weatherConditionsViewController, "setDelegate:", v8);
    -[WeatherStackViewController addChildViewController:](v8, "addChildViewController:", v8->_weatherConditionsViewController);
    v11 = -[AirQualityConditionsViewController initWithWeatherLocationDataProvider:]([AirQualityConditionsViewController alloc], "initWithWeatherLocationDataProvider:", v6);
    airQualityConditionsViewController = v8->_airQualityConditionsViewController;
    v8->_airQualityConditionsViewController = v11;

    -[AirQualityConditionsViewController setDelegate:](v8->_airQualityConditionsViewController, "setDelegate:", v8);
    -[WeatherStackViewController addChildViewController:](v8, "addChildViewController:", v8->_airQualityConditionsViewController);
    -[WeatherConditionsViewController didMoveToParentViewController:](v8->_weatherConditionsViewController, "didMoveToParentViewController:", v8);
    -[AirQualityConditionsViewController didMoveToParentViewController:](v8->_airQualityConditionsViewController, "didMoveToParentViewController:", v8);
    v8->_overlayHidden = 0;
    v8->_overlayAlpha = 1.0;
    objc_storeWeak((id *)&v8->_delegate, v7);
  }

  return v8;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *contentView;
  void *v9;
  id v10;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[WeatherStackViewController setView:](self, "setView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
  objc_msgSend(v4, "setHidden:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("WeatherStackView"));

  v10 = (id)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("WeatherStackBlurView"));
  v7 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentView"));
  contentView = self->_contentView;
  self->_contentView = v7;

  -[UIView setAccessibilityIdentifier:](self->_contentView, "setAccessibilityIdentifier:", CFSTR("WeatherStackContent"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", v10);

  -[WeatherStackViewController setBlurView:](self, "setBlurView:", v10);
  -[WeatherStackViewController applyBorderAndShadow](self, "applyBorderAndShadow");

}

- (void)applyBorderAndShadow
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v3, "userInterfaceStyle");

  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
  v4 = objc_msgSend(v22, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v6, "setBorderColor:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v8, "setCornerRadius:", 8.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v10, "setBorderWidth:", 0.5);

  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
  v12 = objc_msgSend(v11, "CGColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
  objc_msgSend(v14, "setShadowColor:", v12);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
  objc_msgSend(v16, "setShadowRadius:", 4.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
  LODWORD(v19) = 1025758986;
  objc_msgSend(v18, "setShadowOpacity:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layer"));
  objc_msgSend(v21, "setShadowPathIsBounds:", 1);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WeatherStackViewController;
  -[WeatherStackViewController viewDidLoad](&v3, "viewDidLoad");
  -[WeatherStackViewController _configureSubviews](self, "_configureSubviews");
  -[WeatherStackViewController _configureWeatherOrbSupport](self, "_configureWeatherOrbSupport");
  -[WeatherStackViewController _updateVisibilityAnimated:](self, "_updateVisibilityAnimated:", 0);
}

- (void)clearSavedLocation
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController airQualityConditionsViewController](self, "airQualityConditionsViewController"));
  objc_msgSend(v3, "clearSavedLocation");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController weatherConditionsViewController](self, "weatherConditionsViewController"));
  objc_msgSend(v4, "clearSavedLocation");

}

- (void)setBlurGroupName:(id)a3
{
  NSString *v4;
  NSString *blurGroupName;
  NSString *v6;
  id v7;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v4;

  v6 = self->_blurGroupName;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  objc_msgSend(v7, "_setGroupName:", v6);

}

- (void)setOverlayHidden:(BOOL)a3
{
  -[WeatherStackViewController setOverlayHidden:animated:](self, "setOverlayHidden:animated:", a3, 0);
}

- (void)setOverlayHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  _BOOL8 v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  __CFString *v23;

  if (self->_overlayHidden != a3)
  {
    v4 = a4;
    v5 = a3;
    v8 = sub_10043276C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class(self);
      v11 = NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = CFSTR("NO");
      if (v5)
        v15 = CFSTR("YES");
      v16 = v15;
      v18 = 138412802;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ %@, hidden = %@", (uint8_t *)&v18, 0x20u);

    }
    self->_overlayHidden = v5;
    v17 = !v5;
    -[AirQualityConditionsViewController setEnabled:](self->_airQualityConditionsViewController, "setEnabled:", v17);
    -[WeatherConditionsViewController setEnabled:](self->_weatherConditionsViewController, "setEnabled:", v17);
    -[WeatherStackViewController _updateVisibilityAnimated:](self, "_updateVisibilityAnimated:", v4);
  }
}

- (void)setOverlayAlpha:(double)a3
{
  double v4;
  double v5;
  id v6;

  if (self->_overlayAlpha != a3)
  {
    self->_overlayAlpha = a3;
    -[WeatherStackViewController _viewAlpha](self, "_viewAlpha");
    v5 = v4;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
    objc_msgSend(v6, "setAlpha:", v5);

  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v5 = a3;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 15001, 640, 0);
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100562874;
  v8[3] = &unk_1011B0C28;
  objc_copyWeak(&v9, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v8, &stru_1011BB398));
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v6 = (void *)objc_opt_new(_UIPreviewParameters);
  if (sub_1002A8AA0(self) == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController theme](self, "theme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicControlBackgroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorWithAlphaComponent:", 0.75));
    objc_msgSend(v6, "setBackgroundColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
    objc_msgSend(v10, "frame");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
    objc_msgSend(v13, "frame");
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v12, v15, 8.0));
    objc_msgSend(v6, "setVisiblePath:", v16);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v6, "setBackgroundColor:", v16);
  }

  v17 = objc_alloc((Class)_UITargetedPreview);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
  v19 = objc_msgSend(v17, "initWithView:parameters:", v18, v6);

  return v19;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100562B40;
  v11[3] = &unk_1011AD260;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "addCompletion:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)weatherLocationDataProvider:(id)a3 didChangeLocation:(id)a4
{
  -[WeatherStackViewController setLocation:](self, "setLocation:", a4);
}

- (void)weatherConditionsViewController:(id)a3 makeVisible:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  __CFString *v24;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  if (self->_weatherShown != v6)
  {
    v10 = sub_10043276C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = CFSTR("NO");
      if (v6)
        v17 = CFSTR("YES");
      v18 = v17;
      v19 = 138412802;
      v20 = v14;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ %@, visible = %@", (uint8_t *)&v19, 0x20u);

    }
    self->_weatherShown = v6;
    if (!-[WeatherStackViewController overlayHidden](self, "overlayHidden"))
      -[WeatherStackViewController _requestVisibilityUpdateAnimated:](self, "_requestVisibilityUpdateAnimated:", v5);
  }

}

- (void)airQualityConditionsViewController:(id)a3 makeVisible:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  __CFString *v24;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  if (self->_airQualityShown != v6)
  {
    v10 = sub_10043276C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = CFSTR("NO");
      if (v6)
        v17 = CFSTR("YES");
      v18 = v17;
      v19 = 138412802;
      v20 = v14;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ %@, visible = %@", (uint8_t *)&v19, 0x20u);

    }
    self->_airQualityShown = v6;
    if (!-[WeatherStackViewController overlayHidden](self, "overlayHidden"))
      -[WeatherStackViewController _requestVisibilityUpdateAnimated:](self, "_requestVisibilityUpdateAnimated:", v5);
  }

}

- (void)_setCornerRadiusWithMaskedCorners:(unint64_t)a3 withValue:(double)a4
{
  UIVisualEffectView **p_blurView;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  p_blurView = &self->_blurView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_blurView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "subviews"));
  v9 = objc_loadWeakRetained((id *)p_blurView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));

  if (a4 == 0.0)
  {
    objc_msgSend(WeakRetained, "_setCornerRadius:", 0.0);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "layer", (_QWORD)v26));
          objc_msgSend(v25, "setMaskedCorners:", 0);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v22);
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "_setCornerRadius:", a4);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
          v18 = v17;
          if (v16 == v10)
            v19 = 0;
          else
            v19 = a3;
          objc_msgSend(v17, "setMaskedCorners:", v19);
          objc_msgSend(v18, "setCornerRadius:", a4);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v13);
    }
  }

}

- (void)_requestVisibilityUpdateAnimated:(BOOL)a3
{
  OS_dispatch_source *updateVisibilityTimer;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  id location[2];

  updateVisibilityTimer = self->_updateVisibilityTimer;
  if (updateVisibilityTimer
    || (v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q), v7 = self->_updateVisibilityTimer, self->_updateVisibilityTimer = v6, v7, self->_updateVisibilityTimer))
  {
    v8 = dispatch_time(0, 250000000);
    dispatch_source_set_timer((dispatch_source_t)self->_updateVisibilityTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
    objc_initWeak(location, self);
    v9 = self->_updateVisibilityTimer;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100563208;
    v12[3] = &unk_1011AD388;
    objc_copyWeak(&v13, location);
    v14 = a3;
    dispatch_source_set_event_handler(v9, v12);
    if (!updateVisibilityTimer)
      dispatch_resume((dispatch_object_t)self->_updateVisibilityTimer);
    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    v10 = sub_10043276C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create timer to update WeatherStackViewController visibility", (uint8_t *)location, 2u);
    }

  }
}

- (void)_updateVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 weatherShown;
  unsigned int v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  NSString *v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  GroupAnimation *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 airQualityShown;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  WeatherStackViewController *v48;
  BOOL v49;
  BOOL v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  BOOL v55;
  BOOL v56;
  char v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  __CFString *v63;
  __int16 v64;
  __CFString *v65;
  __int16 v66;
  __CFString *v67;
  __int16 v68;
  __CFString *v69;

  v3 = a3;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController airQualityConditionsViewController](self, "airQualityConditionsViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController weatherConditionsViewController](self, "weatherConditionsViewController"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));

  airQualityShown = self->_airQualityShown;
  weatherShown = self->_weatherShown;
  v10 = -[WeatherStackViewController _viewShown](self, "_viewShown");
  v11 = sub_10043276C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class(self);
    v14 = NSStringFromClass(v13);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v15 = NSStringFromSelector(a2);
    v35 = v7;
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (v3)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    v18 = v17;
    if (v10)
      v19 = CFSTR("NO");
    else
      v19 = CFSTR("YES");
    v20 = v19;
    if (weatherShown)
      v21 = CFSTR("NO");
    else
      v21 = CFSTR("YES");
    v22 = v21;
    if (airQualityShown)
      v23 = CFSTR("NO");
    else
      v23 = CFSTR("YES");
    v24 = (void *)v16;
    v25 = v23;
    *(_DWORD *)buf = 138413570;
    v59 = v36;
    v60 = 2112;
    v61 = v24;
    v62 = 2112;
    v63 = v18;
    v64 = 2112;
    v65 = v20;
    v66 = 2112;
    v67 = v22;
    v68 = 2112;
    v69 = v25;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ %@, animated = %@, overall view hidden = %@, weather hidden = %@, AQI hidden = %@", buf, 0x3Eu);

    v7 = v35;
  }

  v26 = objc_alloc_init(GroupAnimation);
  -[GroupAnimation setAnimated:](v26, "setAnimated:", v3);
  +[GroupAnimation defaultAnimationDuration](GroupAnimation, "defaultAnimationDuration");
  -[GroupAnimation setDuration:](v26, "setDuration:");
  -[GroupAnimation setOptions:](v26, "setOptions:", 4);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1005636C4;
  v51[3] = &unk_1011BB3C0;
  v51[4] = self;
  v55 = airQualityShown;
  v27 = v7;
  v52 = v27;
  v56 = weatherShown;
  v28 = v37;
  v53 = v28;
  v57 = v10;
  v29 = v38;
  v54 = v29;
  -[GroupAnimation addPreparation:](v26, "addPreparation:", v51);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10056373C;
  v45[3] = &unk_1011BB3E8;
  v30 = v27;
  v46 = v30;
  v49 = airQualityShown;
  v31 = v28;
  v50 = weatherShown;
  v47 = v31;
  v48 = self;
  -[GroupAnimation addAnimations:](v26, "addAnimations:", v45);
  objc_initWeak((id *)buf, self);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1005637C0;
  v40[3] = &unk_1011BB410;
  objc_copyWeak(&v44, (id *)buf);
  v32 = v30;
  v41 = v32;
  v33 = v31;
  v42 = v33;
  v34 = v29;
  v43 = v34;
  -[GroupAnimation addCompletion:](v26, "addCompletion:", v40);
  -[GroupAnimation runWithCurrentOptions](v26, "runWithCurrentOptions");

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)buf);

}

- (BOOL)_viewShown
{
  BOOL v2;

  v2 = self->_airQualityShown || self->_weatherShown;
  return !self->_overlayHidden && v2;
}

- (double)_viewAlpha
{
  unsigned int v3;
  double result;

  v3 = -[WeatherStackViewController _viewShown](self, "_viewShown");
  result = 0.0;
  if (v3)
    return self->_overlayAlpha;
  return result;
}

- (void)_configureSubviews
{
  id v3;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[8];

  -[WeatherStackViewController _setCornerRadiusWithMaskedCorners:withValue:](self, "_setCornerRadiusWithMaskedCorners:withValue:", 15, 8.0);
  v3 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setAxis:", 1);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("ContentStackView"));
  -[UIView addSubview:](self->_contentView, "addSubview:", v3);
  -[WeatherStackViewController setStackView:](self, "setStackView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController weatherConditionsViewController](self, "weatherConditionsViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v3, "addArrangedSubview:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController airQualityConditionsViewController](self, "airQualityConditionsViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v3, "addArrangedSubview:", v7);

  if (sub_1002A8AA0(self) == 5)
    v8 = 5.0;
  else
    v8 = 4.0;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v47[0] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v47[1] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v47[2] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v47[3] = v26;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, v8));
  v47[4] = v22;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, -v8));
  v47[5] = v18;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 5.0));
  v47[6] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController blurView](self, "blurView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, -5.0));
  v47[7] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 8));
  objc_msgSend(v46, "addObjectsFromArray:", v17);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);
}

- (void)_configureWeatherOrbSupport
{
  UIContextMenuInteraction *v3;
  UIContextMenuInteraction *contextMenuInteraction;
  id v5;

  v3 = (UIContextMenuInteraction *)objc_msgSend(objc_alloc((Class)UIContextMenuInteraction), "initWithDelegate:", self);
  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = v3;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController view](self, "view"));
  objc_msgSend(v5, "addInteraction:", self->_contextMenuInteraction);

}

- (void)_openWeatherPunchOutURL
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController _weatherPunchOutURL](self, "_weatherPunchOutURL"));
  if (v3)
  {
    v6 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6050, 640, v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController delegate](self, "delegate"));
    objc_msgSend(v5, "weatherStackViewController:openURL:", self, v6);

    v3 = v6;
  }

}

- (void)_openAirQualityConditionsPunchOutURL
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController _airQualityConditionsPunchOutURL](self, "_airQualityConditionsPunchOutURL"));
  if (v3)
  {
    v6 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6050, 640, v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController delegate](self, "delegate"));
    objc_msgSend(v5, "weatherStackViewController:openURL:", self, v6);

    v3 = v6;
  }

}

- (id)_weatherPunchOutURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController location](self, "location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL weatherURLForLocation:](NSURL, "weatherURLForLocation:", v2));

  return v3;
}

- (id)_airQualityConditionsPunchOutURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherStackViewController airQualityConditionsViewController](self, "airQualityConditionsViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "airQualityConditions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "learnMoreURL"));

  return v4;
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (WeatherStackViewControllerDelegate)delegate
{
  return (WeatherStackViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)overlayHidden
{
  return self->_overlayHidden;
}

- (double)overlayAlpha
{
  return self->_overlayAlpha;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIVisualEffectView)blurView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_blurView);
}

- (void)setBlurView:(id)a3
{
  objc_storeWeak((id *)&self->_blurView, a3);
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_stackView);
}

- (void)setStackView:(id)a3
{
  objc_storeWeak((id *)&self->_stackView, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (AirQualityConditionsViewController)airQualityConditionsViewController
{
  return self->_airQualityConditionsViewController;
}

- (void)setAirQualityConditionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityConditionsViewController, a3);
}

- (WeatherConditionsViewController)weatherConditionsViewController
{
  return self->_weatherConditionsViewController;
}

- (void)setWeatherConditionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_weatherConditionsViewController, a3);
}

- (BOOL)airQualityShown
{
  return self->_airQualityShown;
}

- (void)setAirQualityShown:(BOOL)a3
{
  self->_airQualityShown = a3;
}

- (BOOL)weatherShown
{
  return self->_weatherShown;
}

- (void)setWeatherShown:(BOOL)a3
{
  self->_weatherShown = a3;
}

- (OS_dispatch_source)updateVisibilityTimer
{
  return self->_updateVisibilityTimer;
}

- (void)setUpdateVisibilityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateVisibilityTimer, a3);
}

- (int64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(int64_t)a3
{
  self->_animationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateVisibilityTimer, 0);
  objc_storeStrong((id *)&self->_weatherConditionsViewController, 0);
  objc_storeStrong((id *)&self->_airQualityConditionsViewController, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_destroyWeak((id *)&self->_stackView);
  objc_destroyWeak((id *)&self->_blurView);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
}

@end
