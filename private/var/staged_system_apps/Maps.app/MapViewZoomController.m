@implementation MapViewZoomController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MapViewZoomController _applyOffsetCameraForOverlay:animated:forced:](self, "_applyOffsetCameraForOverlay:animated:forced:", 0, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MapViewZoomController;
  -[MapViewZoomController dealloc](&v4, "dealloc");
}

- (MapViewZoomController)initWithNavigationDisplay:(id)a3
{
  id v5;
  MapViewZoomController *v6;
  MapViewZoomController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapViewZoomController;
  v6 = -[MapViewZoomController init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationDisplay, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v8, "registerObserver:", v7);

  }
  return v7;
}

- (MKMapView)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return (MKMapView *)v3;
}

- (void)setZoomTo:(unint64_t)a3
{
  -[MapViewZoomController setZoomTo:startCameraTracking:](self, "setZoomTo:startCameraTracking:", a3, 1);
}

- (void)setZoomTo:(unint64_t)a3 startCameraTracking:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  unint64_t zoom;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  void *v22;

  if (self->_zoom != a3)
  {
    v4 = a4;
    v7 = sub_10043157C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      zoom = self->_zoom;
      if (zoom >= 3)
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MapViewZoom(%lu)"), self->_zoom));
      else
        v10 = off_1011E8D20[zoom];
      v11 = v10;
      if (a3 >= 3)
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MapViewZoom(%lu)"), a3));
      else
        v12 = off_1011E8D20[a3];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController mapView](self, "mapView"));
      *(_DWORD *)buf = 138544130;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      v19 = 1024;
      v20 = v4;
      v21 = 2114;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Changing zoom from %{public}@ to %{public}@, startCameraTracking: %d on mapView: %{public}@", buf, 0x26u);

    }
    self->_zoom = a3;
    if (a3 == 2)
    {
      self->_zoom = 0;
    }
    else
    {
      if (a3 == 1)
      {
        -[MapViewZoomController _zoomToOverview:startCameraTracking:](self, "_zoomToOverview:startCameraTracking:", 1, v4);
        goto LABEL_17;
      }
      if (a3)
        goto LABEL_17;
    }
    -[MapViewZoomController _zoomToDetail:startCameraTracking:](self, "_zoomToDetail:startCameraTracking:", 1, v4);
LABEL_17:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController delegate](self, "delegate"));
    objc_msgSend(v14, "mapViewZoomController:didChangeMapViewZoom:", self, self->_zoom);

  }
}

- (void)setZoomToTargetWithRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  void *v8;
  void *v9;
  id v10;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  self->_zoom = 2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController navigationDisplay](self, "navigationDisplay"));
  objc_msgSend(v8, "stopCameraMotion");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController mapView](self, "mapView"));
  objc_msgSend(v9, "animateToVisibleMapRect:usingDefaultAnimationDuration:completion:", 1, 0, v6, v5, var0, var1);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MapViewZoomController delegate](self, "delegate"));
  objc_msgSend(v10, "mapViewZoomController:didChangeMapViewZoom:", self, self->_zoom);

}

- (void)updateCameraForTraits:(id)a3 containerStyle:(unint64_t)a4
{
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = (a4 > 7) | (0x1Cu >> a4);
  if (self->_zoom)
  {
    if ((v6 & 1) != 0)
    {
LABEL_3:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController navigationDisplay](self, "navigationDisplay"));
      v8 = v7;
      v9 = 2;
      goto LABEL_9;
    }
  }
  else
  {
    -[MapViewZoomController _applyOffsetCameraForOverlay:animated:forced:](self, "_applyOffsetCameraForOverlay:animated:forced:", v6 & 1, 1, 0);
    if ((v6 & 1) != 0)
      goto LABEL_3;
  }
  if (objc_msgSend(v10, "horizontalSizeClass") == (id)1 && objc_msgSend(v10, "verticalSizeClass") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController navigationDisplay](self, "navigationDisplay"));
    v8 = v7;
    v9 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController navigationDisplay](self, "navigationDisplay"));
    v8 = v7;
    v9 = 0;
  }
LABEL_9:
  objc_msgSend(v7, "setSky:", v9);

}

- (void)_zoomToDetail:(BOOL)a3 startCameraTracking:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;

  v4 = a4;
  v5 = a3;
  -[MapViewZoomController _applyOffsetCameraForOverlay:animated:forced:](self, "_applyOffsetCameraForOverlay:animated:forced:", 1, a3, 0);
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController navigationDisplay](self, "navigationDisplay"));
    objc_msgSend(v7, "startMotion:", v5);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController navigationDisplay](self, "navigationDisplay"));
  objc_msgSend(v8, "setNavigationCameraMode:", 0);

  v9 = sub_10043157C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController mapView](self, "mapView"));
    v14 = 136315394;
    v15 = "-[MapViewZoomController _zoomToDetail:startCameraTracking:]";
    v16 = 2114;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s, navigationCameraReturnToPuck! on mapView: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController navigationDisplay](self, "navigationDisplay"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapView"));
  objc_msgSend(v13, "navigationCameraReturnToPuck");

}

- (void)_zoomToOverview:(BOOL)a3 startCameraTracking:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;

  v4 = a4;
  v5 = a3;
  -[MapViewZoomController _applyOffsetCameraForOverlay:animated:forced:](self, "_applyOffsetCameraForOverlay:animated:forced:", 1, a3, 0);
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController navigationDisplay](self, "navigationDisplay"));
    objc_msgSend(v7, "startMotion:", v5);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController navigationDisplay](self, "navigationDisplay"));
  objc_msgSend(v8, "setNavigationCameraMode:", 1);

  v9 = sub_10043157C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController mapView](self, "mapView"));
    v14 = 136315394;
    v15 = "-[MapViewZoomController _zoomToOverview:startCameraTracking:]";
    v16 = 2114;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s, navigationCameraReturnToPuck! on mapView: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController navigationDisplay](self, "navigationDisplay"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapView"));
  objc_msgSend(v13, "navigationCameraReturnToPuck");

}

- ($C79183323B9A0D5602617FF3BE5395AC)_boundingMapRectForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeAnnotationsController"));
  objc_msgSend(v6, "mapRectForRouteRemainingAtLocation:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v16 = UIEdgeInsetsMakeWithEdges(15, v15, 20.0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController mapView](self, "mapView"));
  objc_msgSend(v23, "mapRectThatFits:edgePadding:", v8, v10, v12, v14, v16, v18, v20, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = v25;
  v33 = v27;
  v34 = v29;
  v35 = v31;
  result.var1.var1 = v35;
  result.var1.var0 = v34;
  result.var0.var1 = v33;
  result.var0.var0 = v32;
  return result;
}

- (void)_applyOffsetCameraForOverlay:(BOOL)a3 animated:(BOOL)a4 forced:(BOOL)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  double v9;
  double v10;
  id *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v9 = 0.0;
  if (a3)
  {
    -[MapViewZoomController _horizontalCameraOffset](self, "_horizontalCameraOffset");
    v9 = v10;
  }
  if (a5 || self->_currentCameraOffset != v9)
  {
    self->_currentCameraOffset = v9;
    v11 = (id *)&kCAMediaTimingFunctionEaseInEaseOut;
    if (v6)
      v12 = 2.5;
    else
      v12 = 0.0;
    if (!v7)
      v11 = (id *)&kCAMediaTimingFunctionDefault;
    v13 = *v11;
    v16 = (id)objc_claimAutoreleasedReturnValue(-[MapViewZoomController mapView](self, "mapView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_mapLayer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", v13));

    objc_msgSend(v14, "setCameraHorizontalOffset:duration:timingFunction:", v15, v9, v12);
  }
}

- (double)_horizontalCameraOffset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MidX;
  void *v15;
  double v16;
  CGRect v18;
  CGRect v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "layoutIfNeeded");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "unobscuredMapContentBoundsInContainingView");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v18.origin.x = v7;
  v18.origin.y = v9;
  v18.size.width = v11;
  v18.size.height = v13;
  MidX = CGRectGetMidX(v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewZoomController mapView](self, "mapView"));
  objc_msgSend(v15, "bounds");
  v16 = MidX - CGRectGetMidX(v19);

  return v16;
}

- (unint64_t)zoom
{
  return self->_zoom;
}

- (MapViewZoomControllerDelegate)delegate
{
  return (MapViewZoomControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IOSBasedChromeViewController)chromeViewController
{
  return (IOSBasedChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (NavigationDisplay)navigationDisplay
{
  return self->_navigationDisplay;
}

- (void)setNavigationDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_navigationDisplay, a3);
}

- (double)currentCameraOffset
{
  return self->_currentCameraOffset;
}

- (void)setCurrentCameraOffset:(double)a3
{
  self->_currentCameraOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationDisplay, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
