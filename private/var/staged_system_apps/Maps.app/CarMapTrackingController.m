@implementation CarMapTrackingController

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, MKUserTrackingViewModeDidChangeNotification, self->_mapView);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, MKUserTrackingViewDidUpdateUserLocationNotification, self->_mapView);

  v5.receiver = self;
  v5.super_class = (Class)CarMapTrackingController;
  -[CarMapTrackingController dealloc](&v5, "dealloc");
}

- (void)setMapView:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_mapView)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, MKUserTrackingViewModeDidChangeNotification, self->_mapView);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:name:object:", self, MKUserTrackingViewDidUpdateUserLocationNotification, self->_mapView);

  }
  objc_storeStrong((id *)&self->_mapView, a3);
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "_mapViewNotified:", MKUserTrackingViewModeDidChangeNotification, self->_mapView);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "_mapViewNotified:", MKUserTrackingViewDidUpdateUserLocationNotification, self->_mapView);

  }
}

- (void)_mapViewNotified:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  objc_msgSend(v7, "postNotificationName:object:userInfo:", v5, self, v6);
}

- (int64_t)userTrackingMode
{
  if (self->_useForcedTrackingMode)
    return self->_forcedTrackingMode;
  else
    return -[MKMapView userTrackingMode](self->_mapView, "userTrackingMode");
}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5
{
  void *v5;
  id v6;

  if (self->_useForcedTrackingMode)
    -[CarMapTrackingController setForcedTrackingMode:](self, "setForcedTrackingMode:", a3, a4, a5);
  else
    -[MKMapView _setUserTrackingMode:animated:fromTrackingButton:](self->_mapView, "_setUserTrackingMode:animated:fromTrackingButton:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateMapInsets");

}

- (void)setForcedTrackingMode:(int64_t)a3
{
  void *v4;
  id WeakRetained;

  if (self->_forcedTrackingMode != a3)
  {
    self->_forcedTrackingMode = a3;
    if (self->_useForcedTrackingMode)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v4, "postNotificationName:object:", MKUserTrackingViewModeDidChangeNotification, self);

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "trackingController:changedToForcedTrackingMode:", self, self->_forcedTrackingMode);

    }
  }
}

- (void)setUseForcedTrackingMode:(BOOL)a3
{
  void *v4;
  id WeakRetained;

  if (self->_useForcedTrackingMode != a3)
  {
    self->_useForcedTrackingMode = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v4, "postNotificationName:object:", MKUserTrackingViewModeDidChangeNotification, self);

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "trackingController:changedToForcedTrackingMode:", self, self->_forcedTrackingMode);

    }
  }
}

- (BOOL)hasUserLocation
{
  return -[MKMapView hasUserLocation](self->_mapView, "hasUserLocation");
}

- (BOOL)canRotateForHeading
{
  if (self->_useForcedTrackingMode)
    return 0;
  else
    return -[MKMapView canRotateForHeading](self->_mapView, "canRotateForHeading");
}

- (BOOL)isCurrentlyRotated
{
  if (self->_useForcedTrackingMode)
    return 0;
  else
    return -[MKMapView isCurrentlyRotated](self->_mapView, "isCurrentlyRotated");
}

- (BOOL)hasRenderedSomething
{
  if ((objc_opt_respondsToSelector(self->_mapView, "hasRenderedSomething") & 1) != 0)
    return -[MKMapView hasRenderedSomething](self->_mapView, "hasRenderedSomething");
  else
    return 0;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (BOOL)useForcedTrackingMode
{
  return self->_useForcedTrackingMode;
}

- (int64_t)forcedTrackingMode
{
  return self->_forcedTrackingMode;
}

- (CarMapTrackingControllerDelegate)delegate
{
  return (CarMapTrackingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
