@implementation _MapViewState

- (_MapViewState)initWithMapView:(id)a3
{
  id v4;
  _MapViewState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_MapViewState;
  v5 = -[_MapViewState init](&v7, "init");
  if (v5)
  {
    v5->_showsTraffic = objc_msgSend(v4, "showsTraffic");
    v5->_showsUserLocation = objc_msgSend(v4, "showsUserLocation");
  }

  return v5;
}

- (void)restoreStateToMapView:(id)a3
{
  _BOOL8 showsTraffic;
  void *v5;
  void *v6;
  id v7;

  showsTraffic = self->_showsTraffic;
  v7 = a3;
  objc_msgSend(v7, "setShowsTraffic:", showsTraffic);
  objc_msgSend(v7, "setShowsUserLocation:", self->_showsUserLocation);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_mapLayer"));
  objc_msgSend(v5, "setStaysCenteredDuringPinch:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_mapLayer"));
  objc_msgSend(v6, "setStaysCenteredDuringRotation:", 0);

  objc_msgSend(v7, "setUserTrackingMode:", 0);
}

- (BOOL)showsTraffic
{
  return self->_showsTraffic;
}

- (BOOL)showsUserLocation
{
  return self->_showsUserLocation;
}

@end
