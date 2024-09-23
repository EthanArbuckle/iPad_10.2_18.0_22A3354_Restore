@implementation NavigationIntentCapturer

- (NavigationIntentCapturer)initWithMapService:(id)a3
{
  id v5;
  NavigationIntentCapturer *v6;
  NavigationIntentCapturer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavigationIntentCapturer;
  v6 = -[NavigationIntentCapturer init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapService, a3);

  return v7;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)captureStartNavigationIntent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  id v16;
  CLLocationCoordinate2D v17;
  CLLocationCoordinate2D v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationIntentCapturer navigationSession](self, "navigationSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRouteCollection"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRoute"));

  if (objc_msgSend(v16, "source") != (id)2 && objc_msgSend(v16, "source") != (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "origin"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "destination"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoMapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CLPlacemark placemarkWithGEOMapItem:](CLPlacemark, "placemarkWithGEOMapItem:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoMapItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CLPlacemark placemarkWithGEOMapItem:](CLPlacemark, "placemarkWithGEOMapItem:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));
    objc_msgSend(v11, "coordinate");
    if (CLLocationCoordinate2DIsValid(v17))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "location"));
      objc_msgSend(v12, "coordinate");
      v13 = CLLocationCoordinate2DIsValid(v18);

      if (!v13)
      {
LABEL_10:

        goto LABEL_11;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationIntentCapturer navigationSession](self, "navigationSession"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
      if (objc_msgSend(v14, "isETAOnlyMode"))
        v15 = 9016;
      else
        v15 = 3001;
      -[NavigationIntentCapturer captureUserAction:](self, "captureUserAction:", v15);

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (void)captureUserAction:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char *v13;
  uint64_t v14;
  id v15;

  v3 = *(_QWORD *)&a3;
  if (a3 == 9016 || a3 == 3001)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationIntentCapturer navigationSession](self, "navigationSession"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startNavigationDetails"));
    v8 = (uint64_t)objc_msgSend(v7, "selectedRouteIndex");

  }
  else
  {
    v8 = 0xFFFFFFFFLL;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationIntentCapturer navigationSession](self, "navigationSession"));
  v10 = objc_msgSend(v9, "sessionInitiator");

  if (v10 == (id)2)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "chromeViewController"));
    objc_msgSend(v11, "captureUserAction:selectedRouteIndex:", v3, v8);
  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[GEORouteDetails routeDetailsWithResultIndex:](GEORouteDetails, "routeDetailsWithResultIndex:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationIntentCapturer mapService](self, "mapService"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationIntentCapturer navigationSession](self, "navigationSession"));
    v13 = (char *)objc_msgSend(v12, "currentTransportType");
    if ((unint64_t)(v13 - 1) >= 5)
      v14 = 0;
    else
      v14 = ((_DWORD)v13 + 300);
    objc_msgSend(v11, "captureUserAction:onTarget:eventValue:routeDetails:", v3, v14, 0, v15);

  }
}

- (void)setNavigationSession:(id)a3
{
  NavigationSession *v5;
  NavigationSession *navigationSession;
  NavigationSession *v7;

  v5 = (NavigationSession *)a3;
  navigationSession = self->_navigationSession;
  if (navigationSession != v5)
  {
    v7 = v5;
    -[NavigationSession removeObserver:](navigationSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_navigationSession, a3);
    -[NavigationSession addObserver:](self->_navigationSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a5;
  v6 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;
  -[NavigationIntentCapturer setNavigationSession:](self, "setNavigationSession:", v8);

}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD block[5];

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NavigationIntentCapturer navigationSession](self, "navigationSession"));

  if (a4 == 1 && v7 == v6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100924E24;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (MKMapService)mapService
{
  return self->_mapService;
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_mapService, 0);
}

@end
