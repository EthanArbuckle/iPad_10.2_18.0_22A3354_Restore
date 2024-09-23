@implementation LookAroundPIPDataCoordinatorImpl

- (LookAroundPIPDataCoordinatorImpl)initWithMapView:(id)a3
{
  id v5;
  LookAroundPIPDataCoordinatorImpl *v6;
  uint64_t v7;
  NSHashTable *observers;
  void *v9;
  LookAroundPIPStateMachine *v10;
  LookAroundPIPStateMachine *stateMachine;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LookAroundPIPDataCoordinatorImpl;
  v6 = -[LookAroundPIPDataCoordinatorImpl init](&v13, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_mapView, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _nonselectingTapGestureRecognizer](v6->_mapView, "_nonselectingTapGestureRecognizer"));
    objc_msgSend(v9, "addTarget:action:", v6, "_nonselectingTapGestureRecognizerAction:");

    v10 = objc_alloc_init(LookAroundPIPStateMachine);
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = v10;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  MKMapServiceTicket *refineTicket;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _nonselectingTapGestureRecognizer](self->_mapView, "_nonselectingTapGestureRecognizer"));
  objc_msgSend(v3, "removeTarget:action:", self, 0);

  -[MKMapServiceTicket cancel](self->_refineTicket, "cancel");
  refineTicket = self->_refineTicket;
  self->_refineTicket = 0;

  v5.receiver = self;
  v5.super_class = (Class)LookAroundPIPDataCoordinatorImpl;
  -[LookAroundPIPDataCoordinatorImpl dealloc](&v5, "dealloc");
}

- (BOOL)isPanningMapView
{
  return -[LookAroundPIPStateMachine isPanning](self->_stateMachine, "isPanning");
}

- (void)_nonselectingTapGestureRecognizerAction:(id)a3
{
  MKMapView *mapView;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  mapView = self->_mapView;
  v5 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundPIPDataCoordinatorImpl mapView](self, "mapView"));
  objc_msgSend(v5, "locationInView:", v10);
  v7 = v6;
  v9 = v8;

  -[LookAroundPIPDataCoordinatorImpl _handleMapViewTap:atPoint:](self, "_handleMapViewTap:atPoint:", mapView, v7, v9);
}

- (VKMuninMarker)muninMarker
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
  v4 = v3;
  -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "muninMarkerAtCoordinate:", v4, v6));

  return (VKMuninMarker *)v8;
}

- (BOOL)isLookAroundDataAvailable
{
  return -[MKMapView _lookAroundAvailability](self->_mapView, "_lookAroundAvailability") == (id)2;
}

- (void)enterLookAroundPIPWithLookAroundView:(id)a3 mapItem:(id)a4
{
  id v7;
  id v8;
  MKLookAroundView **p_lookAroundView;
  void *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  __CFString *v14;
  id v15;
  NSObject *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  MKLookAroundView *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  MKLookAroundView *v27;
  __int16 v28;
  __CFString *v29;

  v7 = a3;
  v8 = a4;
  p_lookAroundView = &self->_lookAroundView;
  if (!self->_lookAroundView)
  {
    objc_storeStrong((id *)&self->_lookAroundView, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
    objc_msgSend(v10, "setDesiredMapMode:", 3);

    -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 0);
    if (v8)
    {
      v11 = (objc_class *)objc_opt_class(v8);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", mapItem=<%@: %p>"), v13, v8));

    }
    else
    {
      v14 = &stru_1011EB268;
    }
    v15 = sub_100431B9C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = (objc_class *)objc_opt_class(*p_lookAroundView);
      v18 = NSStringFromClass(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = *p_lookAroundView;
      *(_DWORD *)buf = 138412802;
      v25 = v19;
      v26 = 2048;
      v27 = v20;
      v28 = 2112;
      v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Enter LookAround PIP with lookAroundView=<%@: %p>%@", buf, 0x20u);

    }
    objc_initWeak((id *)buf, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100A9DD8C;
    v21[3] = &unk_1011E14C8;
    objc_copyWeak(&v23, (id *)buf);
    v22 = v8;
    -[LookAroundPIPDataCoordinatorImpl _getEntryMuninMarkerWithMapViewOrMapItem:shouldWait:andContinue:](self, "_getEntryMuninMarkerWithMapViewOrMapItem:shouldWait:andContinue:", v22, 0, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_getEntryMuninMarkerWithMapViewOrMapItem:(id)a3 shouldWait:(BOOL)a4 andContinue:(id)a5
{
  _BOOL8 v6;
  MKLookAroundView *v8;
  LookAroundPIPStateMachine *stateMachine;
  id v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = self->_lookAroundView;
  stateMachine = self->_stateMachine;
  v10 = a5;
  if (-[LookAroundPIPStateMachine isActive](stateMachine, "isActive")
    || !-[MKLookAroundView hasEnteredLookAround](v8, "hasEnteredLookAround"))
  {
    objc_msgSend(v11, "closeUpViewCoordinate");
  }
  else
  {
    -[MKLookAroundView centerCoordinate](v8, "centerCoordinate");
  }
  -[LookAroundPIPDataCoordinatorImpl _getEntryMuninMarkerAtCoordinate:shouldWait:andContinue:](self, "_getEntryMuninMarkerAtCoordinate:shouldWait:andContinue:", v6, v10);

}

- (void)_getMuninMarkerWithMapViewOrMapItem:(id)a3 shouldWait:(BOOL)a4 andContinue:(id)a5
{
  _BOOL8 v6;
  MKLookAroundView *v8;
  LookAroundPIPStateMachine *stateMachine;
  id v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = self->_lookAroundView;
  stateMachine = self->_stateMachine;
  v10 = a5;
  if (-[LookAroundPIPStateMachine isActive](stateMachine, "isActive")
    || !-[MKLookAroundView hasEnteredLookAround](v8, "hasEnteredLookAround"))
  {
    objc_msgSend(v11, "closeUpViewCoordinate");
  }
  else
  {
    -[MKLookAroundView centerCoordinate](v8, "centerCoordinate");
  }
  -[LookAroundPIPDataCoordinatorImpl _getMuninMarkerAtCoordinate:shouldWait:andContinue:](self, "_getMuninMarkerAtCoordinate:shouldWait:andContinue:", v6, v10);

}

- (void)_getEntryMuninMarkerAtCoordinate:(CLLocationCoordinate2D)a3 shouldWait:(BOOL)a4 andContinue:(id)a5
{
  _BOOL8 v5;
  double longitude;
  double latitude;
  MKLookAroundView *lookAroundView;
  void (**v10)(id, uint64_t, _QWORD);

  v5 = a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  lookAroundView = self->_lookAroundView;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (-[MKLookAroundView hasEnteredLookAround](lookAroundView, "hasEnteredLookAround"))
    v10[2](v10, 1, 0);
  else
    -[LookAroundPIPDataCoordinatorImpl _getMuninMarkerAtCoordinate:shouldWait:andContinue:](self, "_getMuninMarkerAtCoordinate:shouldWait:andContinue:", v5, v10, latitude, longitude);

}

- (void)_getMuninMarkerAtCoordinate:(CLLocationCoordinate2D)a3 shouldWait:(BOOL)a4 andContinue:(id)a5
{
  double longitude;
  double latitude;
  id v9;
  MKMapView *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  MKMapView *v15;
  id v16;
  _QWORD v17[4];
  MKMapView *v18;
  id v19;
  double v20;
  double v21;
  BOOL v22;
  uint8_t buf[4];
  double v24;
  __int16 v25;
  double v26;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = a5;
  v10 = self->_mapView;
  v11 = sub_100431B9C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v24 = latitude;
    v25 = 2048;
    v26 = longitude;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Asking mapView for a muninMarker at coordinate=(%g, %g)", buf, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](v10, "_mapLayer"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100A9E330;
  v17[3] = &unk_1011E14F0;
  v22 = a4;
  v18 = v10;
  v19 = v9;
  v20 = latitude;
  v21 = longitude;
  v14 = v9;
  v15 = v10;
  v16 = objc_msgSend(v13, "muninMarkerAtCoordinate:completeMarkerHandler:", v17, latitude, longitude);

}

- (void)_onSuccess:(BOOL)a3 setLookAroundViewEntryPointWithMapItem:(id)a4 orMuninMarker:(id)a5 andContinue:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void (**v12)(id, _BOOL8);
  id v13;
  NSObject *v14;
  __CFString *v15;
  MKLookAroundView *lookAroundView;
  __CFString *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  NSObject *v29;
  MKLookAroundView *v30;
  void *v31;
  uint8_t buf[4];
  __CFString *v33;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _BOOL8))a6;
  if (v11
    && v8
    && (-[MKLookAroundView hasEnteredLookAround](self->_lookAroundView, "hasEnteredLookAround") & 1) == 0)
  {
    if (objc_msgSend(v10, "_hasLookAroundStorefront"))
    {
      v13 = sub_100431B9C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        *(_DWORD *)buf = 138412290;
        v33 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Entering lookAroundView with mapItem=\"%@\", buf, 0xCu);

      }
      lookAroundView = self->_lookAroundView;
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:](MKLookAroundEntryPoint, "entryPointWithMapItem:", v10));
      -[MKLookAroundView enterLookAroundWithEntryPoint:](lookAroundView, "enterLookAroundWithEntryPoint:", v17);
    }
    else
    {
      -[MKMapView presentationYaw](self->_mapView, "presentationYaw");
      if (v10)
      {
        objc_msgSend(v11, "coordinate");
        v20 = v19;
        objc_msgSend(v11, "coordinate");
        v22 = v21;
        objc_msgSend(v10, "_coordinate");
        v24 = v23;
        objc_msgSend(v10, "_coordinate");
        v26 = GEOBearingFromCoordinateToCoordinate(v20, v22, v24, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("and mapItem=\"%@\"), v27));

      }
      else
      {
        v26 = v18;
        v17 = &stru_1011EB268;
      }
      v28 = sub_100431B9C();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Entering lookAroundView with muninMarker %@", buf, 0xCu);
      }

      v30 = self->_lookAroundView;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMuninMarker:heading:](MKLookAroundEntryPoint, "entryPointWithMuninMarker:heading:", v11, v26));
      -[MKLookAroundView enterLookAroundWithEntryPoint:](v30, "enterLookAroundWithEntryPoint:", v31);

    }
  }
  v12[2](v12, v8);

}

- (void)_onSuccess:(BOOL)a3 waitForLookAroundViewToBecomeAdequatelyDrawnIfNeededAndContinue:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  MKLookAroundView *lookAroundView;
  id v14;
  NSObject *v15;
  void *v16;
  MKLookAroundView *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *lookAroundViewDidBecomeAdequatelyDrawnObserver;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t v25[16];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;

  v4 = a3;
  v6 = a4;
  if (!v4)
    goto LABEL_6;
  -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
  v8 = v7;
  v10 = v9;
  v11 = sub_100431B9C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v27 = v8;
    v28 = 2048;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Will enter LookAround PIP at coordinate=(%g, %g)", buf, 0x16u);
  }

  -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 0);
  lookAroundView = self->_lookAroundView;
  if (lookAroundView && (-[MKLookAroundView adequatelyDrawn](lookAroundView, "adequatelyDrawn") & 1) == 0)
  {
    objc_initWeak((id *)buf, self);
    v14 = sub_100431B9C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Waiting for lookAroundView to become adequately drawn", v25, 2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v17 = self->_lookAroundView;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100A9EB18;
    v22[3] = &unk_1011AD2D0;
    objc_copyWeak(&v24, (id *)buf);
    v19 = MKLookAroundViewDidBecomeAdequatelyDrawnNotification;
    v23 = v6;
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", v19, v17, v18, v22));
    lookAroundViewDidBecomeAdequatelyDrawnObserver = self->_lookAroundViewDidBecomeAdequatelyDrawnObserver;
    self->_lookAroundViewDidBecomeAdequatelyDrawnObserver = v20;

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
LABEL_6:
    (*((void (**)(id, _BOOL8))v6 + 2))(v6, v4);
  }

}

- (void)_onSuccess:(BOOL)a3 synchronizeMapViewCenterToLookAroundViewCenterAndContinue:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _BOOL8);
  MKLookAroundView *lookAroundView;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  int v14;
  double v15;
  __int16 v16;
  double v17;

  v4 = a3;
  v6 = (void (**)(id, _BOOL8))a4;
  if (v4)
  {
    lookAroundView = self->_lookAroundView;
    if (lookAroundView)
    {
      -[MKLookAroundView centerCoordinate](lookAroundView, "centerCoordinate");
      v9 = v8;
      v11 = v10;
      v12 = sub_100431B9C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = 134218240;
        v15 = v9;
        v16 = 2048;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Synchronizing mapView with lookAroundView at coordinate=(%g, %g)", (uint8_t *)&v14, 0x16u);
      }

      -[MKMapView setCenterCoordinate:animated:](self->_mapView, "setCenterCoordinate:animated:", 1, v9, v11);
    }
  }
  v6[2](v6, v4);

}

- (void)_onSuccessProceedToEnterLookArounPIP:(BOOL)a3
{
  double v4;
  CLLocationDegrees v5;
  double v6;
  CLLocationDegrees v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  int v14;
  CLLocationDegrees v15;
  __int16 v16;
  CLLocationDegrees v17;
  __int16 v18;
  double v19;
  __int16 v20;
  uint64_t v21;

  if (a3)
  {
    -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 2);
    -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
    v5 = v4;
    v7 = v6;
    -[MKLookAroundView presentationYaw](self->_lookAroundView, "presentationYaw");
    v9 = v8;
    -[MKMapView _zoomLevel](self->_mapView, "_zoomLevel");
    v11 = v10;
    v12 = sub_100431B9C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = 134218752;
      v15 = v5;
      v16 = 2048;
      v17 = v7;
      v18 = 2048;
      v19 = v9;
      v20 = 2048;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Did enter LookAround PIP at coordinate=(%g, %g), heading=%g, zoomLevel=%g", (uint8_t *)&v14, 0x2Au);
    }

    self->_isMapViewInSyncWithLookAroundView = 1;
    self->_lastCoordinate.latitude = v5;
    self->_lastCoordinate.longitude = v7;
    self->_lookAroundViewHeading = v9;
    self->_lastHeading = v9;
    -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 1);
  }
  else
  {
    -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 2);
  }
}

- (void)exitLookAroundPIPAfter:(double)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *mapViewDidChangeLookAroundAvailabilityObserver;
  void *v13;
  NSObject *lookAroundViewDidBecomeAdequatelyDrawnObserver;
  void *v15;
  MKLookAroundView *lookAroundView;
  dispatch_time_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id buf[2];

  v6 = a4;
  if (self->_lookAroundView)
  {
    v7 = sub_100431B9C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Will exit LookAround PIP", (uint8_t *)buf, 2u);
    }

    -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 4);
    if (self->_isLookAroundViewUserInteractionStarted)
    {
      self->_isLookAroundViewUserInteractionStarted = 0;
      -[MKMapView setUserInteractionEnabled:](self->_mapView, "setUserInteractionEnabled:", 1);
    }
    if (-[LookAroundPIPStateMachine canSetStateTo:](self->_stateMachine, "canSetStateTo:", 1))
    {
      -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 1);
      v9 = sub_100431B9C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Did cancel pending move", (uint8_t *)buf, 2u);
      }

      -[MKLookAroundView cancelPendingMove](self->_lookAroundView, "cancelPendingMove");
    }
    if (self->_mapViewDidChangeLookAroundAvailabilityObserver)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v11, "removeObserver:", self->_mapViewDidChangeLookAroundAvailabilityObserver);

      mapViewDidChangeLookAroundAvailabilityObserver = self->_mapViewDidChangeLookAroundAvailabilityObserver;
      self->_mapViewDidChangeLookAroundAvailabilityObserver = 0;

    }
    if (self->_lookAroundViewDidBecomeAdequatelyDrawnObserver)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v13, "removeObserver:", self->_lookAroundViewDidBecomeAdequatelyDrawnObserver);

      lookAroundViewDidBecomeAdequatelyDrawnObserver = self->_lookAroundViewDidBecomeAdequatelyDrawnObserver;
      self->_lookAroundViewDidBecomeAdequatelyDrawnObserver = 0;

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
    objc_msgSend(v15, "setDesiredMapMode:", 0);

    -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 0);
    lookAroundView = self->_lookAroundView;
    self->_lookAroundView = 0;

    objc_initWeak(buf, self);
    v17 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100A9F060;
    v18[3] = &unk_1011B0520;
    objc_copyWeak(&v20, buf);
    v19 = v6;
    dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);
  }

}

- (void)coordinateMapViewDidStartUserInteraction:(id)a3
{
  MKMapView *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (MKMapView *)a3;
  if (self->_mapView == v4)
  {
    if (self->_lookAroundView)
    {
      if (-[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive"))
      {
        self->_isMapViewUserInteractionStarted = 1;
        -[MKLookAroundView setUserInteractionEnabled:](self->_lookAroundView, "setUserInteractionEnabled:", 0);
        if (-[LookAroundPIPStateMachine canSetStateTo:](self->_stateMachine, "canSetStateTo:", 1))
        {
          -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 1);
          v5 = sub_100431B9C();
          v6 = objc_claimAutoreleasedReturnValue(v5);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v7 = 0;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Did cancel pending move", v7, 2u);
          }

          -[MKLookAroundView cancelPendingMove](self->_lookAroundView, "cancelPendingMove");
        }
      }
    }
  }

}

- (void)coordinateMapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  MKMapView *v7;
  unsigned int v8;
  MKMapView *v9;

  v7 = (MKMapView *)a3;
  if (self->_mapView == v7)
  {
    if (self->_lookAroundView)
    {
      v9 = v7;
      v8 = -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive");
      v7 = v9;
      if (v8)
      {
        switch(a4)
        {
          case 2:
            -[LookAroundPIPDataCoordinatorImpl _handleMapViewRotateStart:](self, "_handleMapViewRotateStart:", v9);
            goto LABEL_11;
          case 1:
            -[LookAroundPIPDataCoordinatorImpl _handleMapViewZoomStart:](self, "_handleMapViewZoomStart:", v9);
            goto LABEL_11;
          case 0:
            -[LookAroundPIPDataCoordinatorImpl _handleMapViewPanStart:](self, "_handleMapViewPanStart:", v9);
LABEL_11:
            v7 = v9;
            break;
        }
      }
    }
  }

}

- (void)coordinateMapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  MKMapView *v12;
  unsigned int v13;
  MKMapView *v14;

  v12 = (MKMapView *)a3;
  if (self->_mapView == v12)
  {
    if (self->_lookAroundView)
    {
      v14 = v12;
      v13 = -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive");
      v12 = v14;
      if (v13)
      {
        if (a4 == 1)
        {
          -[LookAroundPIPDataCoordinatorImpl _handleMapViewZoomStop:zoomGestureType:zoomDirection:](self, "_handleMapViewZoomStop:zoomGestureType:zoomDirection:", v14, a6, a5);
          goto LABEL_9;
        }
        if (a4 == 2)
        {
          -[LookAroundPIPDataCoordinatorImpl _handleMapViewRotateStop:](self, "_handleMapViewRotateStop:", v14);
LABEL_9:
          v12 = v14;
        }
      }
    }
  }

}

- (void)coordinateMapViewDidStopUserInteraction:(id)a3
{
  MKMapView *v4;
  unsigned int v5;
  MKMapView *v6;

  v4 = (MKMapView *)a3;
  if (self->_mapView == v4)
  {
    if (self->_lookAroundView)
    {
      v6 = v4;
      v5 = -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive");
      v4 = v6;
      if (v5)
      {
        -[LookAroundPIPDataCoordinatorImpl _handleMapViewPanStop:shouldMoveLookAroundView:](self, "_handleMapViewPanStop:shouldMoveLookAroundView:", v6, 1);
        self->_isMapViewUserInteractionStarted = 0;
        -[MKLookAroundView setUserInteractionEnabled:](self->_lookAroundView, "setUserInteractionEnabled:", -[LookAroundPIPDataCoordinatorImpl isLookAroundDataAvailable](self, "isLookAroundDataAvailable"));
        v4 = v6;
      }
    }
  }

}

- (void)coordinateMapView:(id)a3 willSelectLabelMarker:(id)a4
{
  MKMapView *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;

  v6 = (MKMapView *)a3;
  v7 = a4;
  if (self->_mapView == v6
    && self->_lookAroundView
    && -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive"))
  {
    if (-[LookAroundPIPStateMachine canSetStateTo:](self->_stateMachine, "canSetStateTo:", 1))
    {
      -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 1);
      v8 = sub_100431B9C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Did cancel pending move", (uint8_t *)&v12, 2u);
      }

      -[MKLookAroundView cancelPendingMove](self->_lookAroundView, "cancelPendingMove");
    }
    v10 = sub_100431B9C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MapView will refine label marker %@", (uint8_t *)&v12, 0xCu);
    }

    -[LookAroundPIPDataCoordinatorImpl _refineLabelMarker:](self, "_refineLabelMarker:", v7);
  }

}

- (void)coordinateMapViewRegionDidChange:(id)a3
{
  MKMapView *v4;
  unsigned int v5;
  MKMapView *v6;

  v4 = (MKMapView *)a3;
  if (self->_mapView == v4)
  {
    if (self->_lookAroundView)
    {
      v6 = v4;
      v5 = -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive");
      v4 = v6;
      if (v5)
      {
        -[LookAroundPIPDataCoordinatorImpl _handleMapViewDidResumeIfNeeded:](self, "_handleMapViewDidResumeIfNeeded:", v6);
        v4 = v6;
      }
    }
  }

}

- (void)coordinateMapViewDidChangeVisibleRegion:(id)a3
{
  MKMapView *v4;
  unsigned int v5;
  MKMapView *v6;

  v4 = (MKMapView *)a3;
  if (self->_mapView == v4)
  {
    if (self->_lookAroundView)
    {
      v6 = v4;
      v5 = -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive");
      v4 = v6;
      if (v5)
      {
        -[LookAroundPIPDataCoordinatorImpl _handleMapViewPanningIfNeeded:](self, "_handleMapViewPanningIfNeeded:", v6);
        -[LookAroundPIPDataCoordinatorImpl _handleMapViewRotatingIfNeeded:](self, "_handleMapViewRotatingIfNeeded:", v6);
        v4 = v6;
      }
    }
  }

}

- (void)coordinateMapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4
{
  MKMapView *v6;
  unsigned int v7;
  MKMapView *v8;

  v6 = (MKMapView *)a3;
  if (self->_mapView == v6)
  {
    if (self->_lookAroundView)
    {
      v8 = v6;
      v7 = -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive");
      v6 = v8;
      if (v7)
      {
        -[LookAroundPIPDataCoordinatorImpl _handleMapView:didDidChangeLookAroundAvailability:](self, "_handleMapView:didDidChangeLookAroundAvailability:", v8, a4);
        -[MKLookAroundView setUserInteractionEnabled:](self->_lookAroundView, "setUserInteractionEnabled:", -[LookAroundPIPDataCoordinatorImpl isLookAroundDataAvailable](self, "isLookAroundDataAvailable"));
        v6 = v8;
      }
    }
  }

}

- (void)coordinateLookAroundViewDidStartUserInteraction:(id)a3
{
  MKLookAroundView *lookAroundView;
  BOOL v4;

  lookAroundView = self->_lookAroundView;
  if (lookAroundView)
    v4 = lookAroundView == a3;
  else
    v4 = 0;
  if (v4)
  {
    if (-[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive", a3))
    {
      self->_isLookAroundViewUserInteractionStarted = 1;
      -[MKMapView setUserInteractionEnabled:](self->_mapView, "setUserInteractionEnabled:", 0);
    }
  }
}

- (void)coordinateLookAroundViewDidStopUserInteraction:(id)a3
{
  MKLookAroundView *lookAroundView;
  BOOL v4;

  lookAroundView = self->_lookAroundView;
  if (lookAroundView)
    v4 = lookAroundView == a3;
  else
    v4 = 0;
  if (v4)
  {
    if (-[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive", a3))
    {
      self->_isLookAroundViewUserInteractionStarted = 0;
      -[MKMapView setUserInteractionEnabled:](self->_mapView, "setUserInteractionEnabled:", 1);
    }
  }
}

- (void)coordinateLookAroundViewDidChangeVisibleRegion:(id)a3
{
  MKLookAroundView *v4;
  MKLookAroundView *v5;
  MKLookAroundView *lookAroundView;
  BOOL v7;
  unsigned int v8;
  double v9;
  MKMapView *mapView;
  MKLookAroundView *v11;

  v4 = (MKLookAroundView *)a3;
  v5 = v4;
  lookAroundView = self->_lookAroundView;
  if (lookAroundView)
    v7 = lookAroundView == v4;
  else
    v7 = 0;
  if (v7)
  {
    v11 = v4;
    v8 = -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive");
    v5 = v11;
    if (v8)
    {
      -[MKLookAroundView presentationYaw](v11, "presentationYaw");
      self->_lookAroundViewHeading = v9;
      if (self->_isLookAroundViewUserInteractionStarted)
        goto LABEL_11;
      if (!-[LookAroundPIPStateMachine isCancellingPendingMove](self->_stateMachine, "isCancellingPendingMove"))
      {
        mapView = self->_mapView;
        -[MKLookAroundView centerCoordinate](v11, "centerCoordinate");
        -[MKMapView setCenterCoordinate:](mapView, "setCenterCoordinate:");
        -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 14);
      }
      v5 = v11;
      if (self->_isLookAroundViewUserInteractionStarted)
      {
LABEL_11:
        -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 12);
        v5 = v11;
      }
    }
  }

}

- (void)pause
{
  if (self->_lookAroundView && -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive"))
  {
    if (-[LookAroundPIPStateMachine canSetStateTo:](self->_stateMachine, "canSetStateTo:", 5))
      -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 5);
  }
}

- (void)resume
{
  if (self->_lookAroundView && -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive"))
  {
    if (-[LookAroundPIPStateMachine canSetStateTo:](self->_stateMachine, "canSetStateTo:", 6))
      -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 6);
  }
}

- (void)setNeedsMapViewSynchronization
{
  if (self->_lookAroundView && -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive"))
  {
    if (-[LookAroundPIPStateMachine canSetStateTo:](self->_stateMachine, "canSetStateTo:", 6))
    {
      -[MKLookAroundView centerCoordinate](self->_lookAroundView, "centerCoordinate");
      -[MKMapView setCenterCoordinate:](self->_mapView, "setCenterCoordinate:");
    }
  }
}

- (void)synchronizeMapViewIfNeeded
{
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  id v8;
  double v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  MKMapView *mapView;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;

  if (self->_lookAroundView && -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive"))
  {
    -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
    v5 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v3, v4);
    -[MKLookAroundView centerCoordinate](self->_lookAroundView, "centerCoordinate");
    v8 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v6, v7);
    objc_msgSend(v5, "distanceFromLocation:", v8);
    if (v9 >= 10.0
      && !-[LookAroundPIPStateMachine isCancellingPendingMove](self->_stateMachine, "isCancellingPendingMove")
      && !-[LookAroundPIPStateMachine isMoving](self->_stateMachine, "isMoving")
      && !-[LookAroundPIPStateMachine isPanning](self->_stateMachine, "isPanning"))
    {
      v10 = sub_100431B9C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
        v13 = v12;
        -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
        v15 = v14;
        -[MKLookAroundView centerCoordinate](self->_lookAroundView, "centerCoordinate");
        v17 = v16;
        -[MKLookAroundView centerCoordinate](self->_lookAroundView, "centerCoordinate");
        v19 = v18;
        v20 = sub_100AC246C(-[LookAroundPIPStateMachine state](self->_stateMachine, "state"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v23 = 134219010;
        v24 = v13;
        v25 = 2048;
        v26 = v15;
        v27 = 2048;
        v28 = v17;
        v29 = 2048;
        v30 = v19;
        v31 = 2112;
        v32 = v21;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Synchronizing mapView={%g, %g} with lookAroundView={%g, %g}, state=%@", (uint8_t *)&v23, 0x34u);

      }
      mapView = self->_mapView;
      -[MKLookAroundView centerCoordinate](self->_lookAroundView, "centerCoordinate");
      -[MKMapView setCenterCoordinate:animated:](mapView, "setCenterCoordinate:animated:", 0);
    }

  }
}

- (void)setNeedsLookAroundAvailabilityUpdate
{
  void *v3;
  id v4;
  MKMapView *v5;

  v5 = self->_mapView;
  -[LookAroundPIPDataCoordinatorImpl coordinateMapView:didChangeLookAroundAvailability:](self, "coordinateMapView:didChangeLookAroundAvailability:", v5, -[MKMapView _lookAroundAvailability](v5, "_lookAroundAvailability"));
  if (-[MKMapView _lookAroundAvailability](v5, "_lookAroundAvailability") != (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView camera](v5, "camera"));
    v4 = objc_msgSend(v3, "copy");

    objc_msgSend(v4, "setCenterCoordinateDistance:", 950.0);
    -[MKMapView setCamera:animated:](v5, "setCamera:animated:", v4, 0);

  }
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_filteredHeadingReset
{
  self->_absoluteHeadings[4] = 0.0;
  *(_OWORD *)self->_absoluteHeadings = 0u;
  *(_OWORD *)&self->_absoluteHeadings[2] = 0u;
  *(_OWORD *)&self->_absoluteHeadingsAverage = 0u;
  *(_OWORD *)&self->_filteredHeadingsCount = 0u;
  *(_OWORD *)self->_headingsQuadrants = 0u;
  *(_OWORD *)&self->_headingsQuadrants[2] = 0u;
  self->_headingsQuadrants[4] = 0.0;
  self->_headingsQuadrantsSum = 0.0;
}

- (double)_filteredHeadingWithHeading:(double)result
{
  double v3;
  double v4;
  unint64_t filteredHeadingsCount;
  unint64_t filteredHeadingsIndex;
  double *v7;
  double *v8;
  double v9;
  double absoluteHeadingsAverage;

  v3 = -result;
  if (result >= 0.0)
    v3 = result;
  v4 = -1.0;
  if (result >= 0.0)
    v4 = 1.0;
  filteredHeadingsCount = self->_filteredHeadingsCount;
  filteredHeadingsIndex = self->_filteredHeadingsIndex;
  if (filteredHeadingsCount > 4)
  {
    v7 = (double *)(&self->super.isa + filteredHeadingsIndex);
    self->_absoluteHeadingsSum = self->_absoluteHeadingsSum - v7[2];
    self->_headingsQuadrantsSum = self->_headingsQuadrantsSum - v7[11];
  }
  v8 = (double *)(&self->super.isa + filteredHeadingsIndex);
  v8[2] = v3;
  self->_absoluteHeadingsSum = v3 + self->_absoluteHeadingsSum;
  v8[11] = v4;
  v9 = v4 + self->_headingsQuadrantsSum;
  self->_headingsQuadrantsSum = v9;
  self->_filteredHeadingsIndex = (filteredHeadingsIndex + 1) % 5;
  if (filteredHeadingsCount >= 5)
  {
    absoluteHeadingsAverage = self->_absoluteHeadingsAverage;
    self->_absoluteHeadingsAverage = self->_absoluteHeadingsSum / (double)filteredHeadingsCount;
  }
  else
  {
    self->_filteredHeadingsCount = filteredHeadingsCount + 1;
    absoluteHeadingsAverage = self->_absoluteHeadingsAverage;
    self->_absoluteHeadingsAverage = self->_absoluteHeadingsSum / (double)(filteredHeadingsCount + 1);
    if (filteredHeadingsCount != 4)
      return result;
  }
  if (v3 < absoluteHeadingsAverage + -45.0 || v3 > absoluteHeadingsAverage + 45.0)
  {
    result = -absoluteHeadingsAverage;
    if (v9 >= 0.0)
      return absoluteHeadingsAverage;
  }
  return result;
}

- (void)_handleMapViewPanStart:(id)a3
{
  id v4;
  double v5;
  CLLocationDegrees v6;
  double v7;
  CLLocationDegrees v8;
  id v9;
  NSObject *v10;
  int v11;
  CLLocationDegrees v12;
  __int16 v13;
  CLLocationDegrees v14;

  v4 = a3;
  if (-[LookAroundPIPStateMachine canSetStateTo:](self->_stateMachine, "canSetStateTo:", 4))
  {
    -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 4);
    objc_msgSend(v4, "centerCoordinate");
    v6 = v5;
    v8 = v7;
    v9 = sub_100431B9C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 134218240;
      v12 = v6;
      v13 = 2048;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MapView did start panning at coordinate=(%g, %g)", (uint8_t *)&v11, 0x16u);
    }

    self->_lastCoordinate.latitude = v6;
    self->_lastCoordinate.longitude = v8;
    -[LookAroundPIPDataCoordinatorImpl _filteredHeadingReset](self, "_filteredHeadingReset");
    -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 6);
  }

}

- (void)_handleMapViewRotateStart:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "centerCoordinate");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "presentationYaw");
  v10 = v9;

  v11 = sub_100431B9C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134218496;
    v14 = v6;
    v15 = 2048;
    v16 = v8;
    v17 = 2048;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "MapView did start rotating at coordinate=(%g, %g), heading=%g", (uint8_t *)&v13, 0x20u);
  }

  self->_isRotatingMapView = 1;
  -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 9);
}

- (void)_handleMapViewZoomStart:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "centerCoordinate");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "_zoomLevel");
  v10 = v9;

  v11 = sub_100431B9C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134218496;
    v14 = v6;
    v15 = 2048;
    v16 = v8;
    v17 = 2048;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "MapView did start zooming at coordinate=(%g, %g), zoomLevel=%g", (uint8_t *)&v13, 0x20u);
  }

  self->_isZoomingMapView = 1;
}

- (void)_handleMapViewPanningIfNeeded:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double latitude;
  double longitude;
  double v10;
  id v11;

  v11 = a3;
  if (-[LookAroundPIPDataCoordinatorImpl isPanningMapView](self, "isPanningMapView"))
  {
    objc_msgSend(v11, "centerCoordinate");
    v5 = v4;
    v7 = v6;
    latitude = self->_lastCoordinate.latitude;
    longitude = self->_lastCoordinate.longitude;
    self->_lastCoordinate.latitude = v5;
    self->_lastCoordinate.longitude = v7;
    if (vabdd_f64(latitude, v5) >= 0.00000000999999994 || vabdd_f64(longitude, v7) >= 0.00000000999999994)
    {
      -[LookAroundPIPDataCoordinatorImpl _filteredHeadingWithHeading:](self, "_filteredHeadingWithHeading:", GEOBearingFromCoordinateToCoordinate(latitude, longitude, v5, v7));
      self->_lookAroundViewHeading = v10;
      self->_lastHeading = v10;
      -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 7);
    }
  }

}

- (void)_handleMapViewRotatingIfNeeded:(id)a3
{
  if (self->_isRotatingMapView)
    -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 10);
}

- (void)_handleMapViewPanStop:(id)a3 shouldMoveLookAroundView:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  CLLocationDegrees v8;
  double v9;
  CLLocationDegrees v10;
  double lastHeading;
  id v12;
  NSObject *v13;
  _QWORD v14[6];
  uint8_t buf[4];
  CLLocationDegrees v16;
  __int16 v17;
  CLLocationDegrees v18;
  __int16 v19;
  double v20;

  v4 = a4;
  v6 = a3;
  if (-[LookAroundPIPDataCoordinatorImpl isPanningMapView](self, "isPanningMapView"))
  {
    objc_msgSend(v6, "centerCoordinate");
    v8 = v7;
    v10 = v9;
    lastHeading = self->_lastHeading;
    v12 = sub_100431B9C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v16 = v8;
      v17 = 2048;
      v18 = v10;
      v19 = 2048;
      v20 = lastHeading;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "MapView did end panning at coordinate=(%g, %g), heading=%g", buf, 0x20u);
    }

    self->_isMapViewInSyncWithLookAroundView = 0;
    self->_lastCoordinate.latitude = v8;
    self->_lastCoordinate.longitude = v10;
    -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 8);
    if (v4 && -[LookAroundPIPDataCoordinatorImpl isLookAroundDataAvailable](self, "isLookAroundDataAvailable"))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100AA016C;
      v14[3] = &unk_1011E1518;
      v14[4] = self;
      *(double *)&v14[5] = lastHeading;
      -[LookAroundPIPDataCoordinatorImpl _nearestMuninMarkerWithCompleteMarkerHandler:](self, "_nearestMuninMarkerWithCompleteMarkerHandler:", v14);
    }
    else
    {
      -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 2);
    }
  }

}

- (void)_handleMapViewRotateStop:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "centerCoordinate");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "presentationYaw");
  v10 = v9;

  v11 = sub_100431B9C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134218496;
    v14 = v6;
    v15 = 2048;
    v16 = v8;
    v17 = 2048;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "MapView did end rotating at coordinate=(%g, %g), heading=%g", (uint8_t *)&v13, 0x20u);
  }

  self->_isRotatingMapView = 0;
  -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 11);
}

- (void)_handleMapViewPinchWithZoomDirection:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
  {
    v3 = 21;
  }
  else
  {
    if (a3 != 2)
      return;
    v3 = 22;
  }
  -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", v3);
}

- (void)_handleMapViewOneFingerPanWithZoomDirection:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
  {
    v3 = 17;
  }
  else
  {
    if (a3 != 2)
      return;
    v3 = 18;
  }
  -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", v3);
}

- (void)_handleMapViewZoomStop:(id)a3 zoomGestureType:(int64_t)a4 zoomDirection:(int64_t)a5
{
  id v8;
  LookAroundPIPDataCoordinatorImpl *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;

  v8 = a3;
  if (a4 == 2 && a5 == 1)
  {
    v9 = self;
    v10 = 19;
LABEL_7:
    -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](v9, "_notifyObservers:", v10);
    goto LABEL_8;
  }
  if (a4 == 3 && a5 == 2)
  {
    v9 = self;
    v10 = 20;
    goto LABEL_7;
  }
  if (a4 == 4)
  {
    -[LookAroundPIPDataCoordinatorImpl _handleMapViewOneFingerPanWithZoomDirection:](self, "_handleMapViewOneFingerPanWithZoomDirection:", a5);
  }
  else if (a4 == 1)
  {
    -[LookAroundPIPDataCoordinatorImpl _handleMapViewPinchWithZoomDirection:](self, "_handleMapViewPinchWithZoomDirection:", a5);
  }
LABEL_8:
  objc_msgSend(v8, "centerCoordinate");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v8, "_zoomLevel");
  v16 = v15;
  v17 = sub_100431B9C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = 134218496;
    v20 = v12;
    v21 = 2048;
    v22 = v14;
    v23 = 2048;
    v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "MapView did end zooming at coordinate=(%g, %g), zoomLevel=%g", (uint8_t *)&v19, 0x20u);
  }

  self->_isZoomingMapView = 0;
  -[LookAroundPIPDataCoordinatorImpl _moveLookAroundViewIfNeeded](self, "_moveLookAroundViewIfNeeded");

}

- (void)_handleMapViewTap:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  MKMapView *v7;
  id v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  NSObject *v15;
  int v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;

  y = a4.y;
  x = a4.x;
  v7 = (MKMapView *)a3;
  if (self->_mapView == v7
    && self->_lookAroundView
    && -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive"))
  {
    if (-[LookAroundPIPStateMachine canSetStateTo:](self->_stateMachine, "canSetStateTo:", 1))
    {
      -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 1);
      v8 = sub_100431B9C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Did cancel pending move", (uint8_t *)&v16, 2u);
      }

      -[MKLookAroundView cancelPendingMove](self->_lookAroundView, "cancelPendingMove");
    }
    -[MKMapView convertPoint:toCoordinateFromView:](self->_mapView, "convertPoint:toCoordinateFromView:", self->_mapView, x, y);
    v11 = v10;
    v13 = v12;
    v14 = sub_100431B9C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = 134218752;
      v17 = x;
      v18 = 2048;
      v19 = y;
      v20 = 2048;
      v21 = v11;
      v22 = 2048;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "MapView did receive tap at point={%g, %g}, coordinate={%g, %g}", (uint8_t *)&v16, 0x2Au);
    }

    -[LookAroundPIPDataCoordinatorImpl _moveLookAroundViewToCoordinate:](self, "_moveLookAroundViewToCoordinate:", v11, v13);
  }

}

- (void)_handleMapView:(id)a3 didDidChangeLookAroundAvailability:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;

  v6 = a3;
  objc_msgSend(v6, "centerCoordinate");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "_zoomLevel");
  v12 = v11;

  v13 = sub_100431B9C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    if ((unint64_t)a4 > 2)
      v15 = 0;
    else
      v15 = (uint64_t)*(&off_1011E15B0 + a4);
    v16 = 138413058;
    v17 = v15;
    v18 = 2048;
    v19 = v8;
    v20 = 2048;
    v21 = v10;
    v22 = 2048;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "MapView did change LookAround availability=%@ at coordinate=(%g, %g), zoomLevel=%g", (uint8_t *)&v16, 0x2Au);
  }

  -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 3);
  -[LookAroundPIPDataCoordinatorImpl _moveLookAroundViewIfNeeded](self, "_moveLookAroundViewIfNeeded");
}

- (void)_moveLookAroundViewIfNeeded
{
  double lookAroundViewHeading;
  _QWORD v4[6];

  if (-[LookAroundPIPDataCoordinatorImpl isLookAroundDataAvailable](self, "isLookAroundDataAvailable")
    && !-[LookAroundPIPDataCoordinatorImpl isPanningMapView](self, "isPanningMapView")
    && !self->_isZoomingMapView
    && !-[LookAroundPIPDataCoordinatorImpl isMapViewInSyncWithLookAroundView](self, "isMapViewInSyncWithLookAroundView"))
  {
    lookAroundViewHeading = self->_lookAroundViewHeading;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100AA0794;
    v4[3] = &unk_1011E1518;
    v4[4] = self;
    *(double *)&v4[5] = lookAroundViewHeading;
    -[LookAroundPIPDataCoordinatorImpl _nearestMuninMarkerWithCompleteMarkerHandler:](self, "_nearestMuninMarkerWithCompleteMarkerHandler:", v4);
  }
}

- (void)_moveLookAroundViewToCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  _QWORD v6[5];
  id v7[3];
  id location;

  longitude = a3.longitude;
  latitude = a3.latitude;
  objc_initWeak(&location, self);
  -[LookAroundPIPDataCoordinatorImpl _handleMapViewPanStart:](self, "_handleMapViewPanStart:", self->_mapView);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100AA0890;
  v6[3] = &unk_1011E1540;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&latitude;
  v7[2] = *(id *)&longitude;
  v6[4] = self;
  -[LookAroundPIPDataCoordinatorImpl _getMuninMarkerAtCoordinate:shouldWait:andContinue:](self, "_getMuninMarkerAtCoordinate:shouldWait:andContinue:", 1, v6, latitude, longitude);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_moveLookAroundViewToMapItem:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[LookAroundPIPDataCoordinatorImpl _handleMapViewPanStart:](self, "_handleMapViewPanStart:", self->_mapView);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100AA0ACC;
  v6[3] = &unk_1011E14C8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[LookAroundPIPDataCoordinatorImpl _getMuninMarkerWithMapViewOrMapItem:shouldWait:andContinue:](self, "_getMuninMarkerWithMapViewOrMapItem:shouldWait:andContinue:", v5, 1, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_handleMapViewDidResumeIfNeeded:(id)a3
{
  id v4;
  LookAroundPIPStateMachine *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  LookAroundPIPStateMachine *v9;

  v4 = a3;
  v5 = self->_stateMachine;
  if (-[LookAroundPIPStateMachine canSetStateTo:](v5, "canSetStateTo:", 7))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "camera"));
    v7 = objc_msgSend(v6, "copy");

    -[MKLookAroundView centerCoordinate](self->_lookAroundView, "centerCoordinate");
    objc_msgSend(v7, "setCenterCoordinate:");
    -[LookAroundPIPStateMachine setStateTo:](v5, "setStateTo:", 7);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100AA0CCC;
    v8[3] = &unk_1011AE8F8;
    v9 = v5;
    objc_msgSend(v4, "setCamera:animated:completionHandler:", v7, 1, v8);

  }
}

- (void)_refineLabelMarker:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  MKMapServiceTicket *v13;
  MKMapServiceTicket *refineTicket;
  MKMapServiceTicket *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  id v21;

  v5 = a3;
  objc_storeStrong((id *)&self->_labelMarkerToRefine, a3);
  objc_msgSend(v5, "coordinate");
  v7 = v6;
  objc_msgSend(v5, "coordinate");
  v9 = objc_msgSend(objc_alloc((Class)GEOMapItemIdentifier), "initWithMUID:coordinate:", objc_msgSend(v5, "businessID"), v7, v8);
  v10 = objc_msgSend(objc_alloc((Class)MKMapItemIdentifier), "initWithGEOMapItemIdentifier:", v9);
  -[MKMapServiceTicket cancel](self->_refineTicket, "cancel");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v21 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v13 = (MKMapServiceTicket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ticketForIdentifiers:traits:", v12, 0));
  refineTicket = self->_refineTicket;
  self->_refineTicket = v13;

  objc_initWeak(&location, self);
  v15 = self->_refineTicket;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100AA0EDC;
  v17[3] = &unk_1011ADF70;
  objc_copyWeak(&v19, &location);
  v16 = v5;
  v18 = v16;
  -[MKMapServiceTicket submitWithHandler:networkActivity:](v15, "submitWithHandler:networkActivity:", v17, 0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)_notifyObservers:(unint64_t)a3
{
  const char *v5;
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;

  v5 = -[LookAroundPIPDataCoordinatorImpl _selectorForObserverEventType:](self, "_selectorForObserverEventType:");
  if (a3 > 0xC || ((1 << a3) & 0x1480) == 0)
  {
    v6 = sub_100431B9C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = NSStringFromSelector(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Notifying observers with %@", buf, 0xCu);

    }
  }
  v10 = -[NSHashTable copy](self->_observers, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[LookAroundPIPDataCoordinatorImpl _dispatchSelector:toObserver:](self, "_dispatchSelector:toObserver:", v5, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), (_QWORD)v16);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (SEL)_selectorForObserverEventType:(unint64_t)a3
{
  SEL result;

  switch(a3)
  {
    case 0uLL:
      result = "lookAroundPIPDataCoordinatorWillEnterLookArounPIP:";
      break;
    case 1uLL:
      result = "lookAroundPIPDataCoordinatorDidEnterLookAroundPIP:";
      break;
    case 2uLL:
      result = "lookAroundPIPDataCoordinatorFailedToEnterLookArounPIP:";
      break;
    case 3uLL:
      result = "lookAroundPIPDataCoordinatorDidChangeLookAroundAvailability:";
      break;
    case 4uLL:
      result = "lookAroundPIPDataCoordinatorWillExitLookAroundPIP:";
      break;
    case 5uLL:
      result = "lookAroundPIPDataCoordinatorDidExitLookAroundPIP:";
      break;
    case 6uLL:
      result = "lookAroundPIPDataCoordinatorDidStartPanningMapView:";
      break;
    case 7uLL:
      result = "lookAroundPIPDataCoordinatorIsPanningMapView:";
      break;
    case 8uLL:
      result = "lookAroundPIPDataCoordinatorDidEndPanningMapView:";
      break;
    case 9uLL:
      result = "lookAroundPIPDataCoordinatorDidStartRotatingMapView:";
      break;
    case 0xAuLL:
      result = "lookAroundPIPDataCoordinatorIsRotatingMapView:";
      break;
    case 0xBuLL:
      result = "lookAroundPIPDataCoordinatorDidEndRotatingMapView:";
      break;
    case 0xCuLL:
      result = "lookAroundPIPDataCoordinatorDidPanLookAroundView:";
      break;
    case 0xDuLL:
      result = "lookAroundPIPDataCoordinatorDidStartMovingLookAroundView:";
      break;
    case 0xEuLL:
      result = "lookAroundPIPDataCoordinatorIsMovingLookAroundView:";
      break;
    case 0xFuLL:
      result = "lookAroundPIPDataCoordinatorDidSynchronizeMapView:";
      break;
    case 0x10uLL:
      result = "lookAroundPIPDataCoordinatorDidEndMovingLookAroundView:";
      break;
    case 0x11uLL:
      result = "lookAroundPIPDataCoordinatorDidSingleFingerZoomInMapView:";
      break;
    case 0x12uLL:
      result = "lookAroundPIPDataCoordinatorDidSingleFingerZoomOutMapView:";
      break;
    case 0x13uLL:
      result = "lookAroundPIPDataCoordinatorDidDoubleTapZoomInMapView:";
      break;
    case 0x14uLL:
      result = "lookAroundPIPDataCoordinatorDidDoubleTapZoomOutMapView:";
      break;
    case 0x15uLL:
      result = "lookAroundPIPDataCoordinatorDidPinchZoomInMapView:";
      break;
    case 0x16uLL:
      result = "lookAroundPIPDataCoordinatorDidPinchZoomOutMapView:";
      break;
    case 0x17uLL:
      result = "lookAroundPIPDataCoordinatorDidSelectMapItem:";
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)_dispatchSelector:(SEL)a3 toObserver:(id)a4
{
  id v6;

  v6 = a4;
  if ((objc_opt_respondsToSelector(v6, a3) & 1) != 0)
    ((void (*)(id, SEL, LookAroundPIPDataCoordinatorImpl *, MKMapView *))objc_msgSend(v6, "methodForSelector:", a3))(v6, a3, self, self->_mapView);

}

- (void)_startMovingLookAroundViewToMapItem:(id)a3 orMuninMarker:(id)a4 heading:(double)a5 shouldZoom:(BOOL)a6
{
  id v10;
  id v11;
  LookAroundPIPStateMachine *v12;
  double v13;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  CLLocationCoordinate2D v16;
  id v17;
  NSObject *v18;
  MKMapView *v19;
  MKLookAroundView *v20;
  MKLookAroundView *lookAroundView;
  MKLookAroundView *v22;
  unsigned int v23;
  char v24;
  int v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  MKLookAroundView *v31;
  _BYTE *v32;
  uint64_t *v33;
  id v34;
  BOOL v35;
  id location;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t v41[4];
  CLLocationDegrees latitude;
  __int16 v43;
  CLLocationDegrees longitude;
  __int16 v45;
  double v46;
  _BYTE buf[24];
  double v48;

  v10 = a3;
  v11 = a4;
  v12 = self->_stateMachine;
  if (!-[LookAroundPIPStateMachine canSetStateTo:](v12, "canSetStateTo:", 3))
    goto LABEL_13;
  -[LookAroundPIPStateMachine setStateTo:](v12, "setStateTo:", 3);
  objc_msgSend(v11, "coordinate");
  v14 = v13;
  objc_msgSend(v11, "coordinate");
  v16 = CLLocationCoordinate2DMake(v14, v15);
  v17 = sub_100431B9C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    *(CLLocationDegrees *)&buf[4] = v16.latitude;
    *(_WORD *)&buf[12] = 2048;
    *(CLLocationDegrees *)&buf[14] = v16.longitude;
    *(_WORD *)&buf[22] = 2048;
    v48 = a5;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "LookAroundView started moving to coordinate=(%g, %g), heading=%g", buf, 0x20u);
  }

  v19 = self->_mapView;
  v20 = self->_lookAroundView;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v48) = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  objc_initWeak(&location, self);
  -[MKLookAroundView setUserInteractionEnabled:](self->_lookAroundView, "setUserInteractionEnabled:", 0);
  lookAroundView = self->_lookAroundView;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100AA18BC;
  v30[3] = &unk_1011E1590;
  v30[4] = self;
  v32 = buf;
  v33 = &v37;
  v22 = v20;
  v31 = v22;
  objc_copyWeak(&v34, &location);
  v35 = a6;
  v23 = -[MKLookAroundView moveToMapItem:wantsCloseUpView:orMuninMarker:withHeading:completionHandler:](lookAroundView, "moveToMapItem:wantsCloseUpView:orMuninMarker:withHeading:completionHandler:", v10, 1, v11, v30, a5);
  v24 = v23;
  if (!v23)
    goto LABEL_12;
  os_unfair_lock_lock(&self->_lock);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v25 = *((unsigned __int8 *)v38 + 24);
    os_unfair_lock_unlock(&self->_lock);
    if (!v25)
      goto LABEL_12;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  v26 = sub_100431B9C();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v41 = 134218496;
    latitude = v16.latitude;
    v43 = 2048;
    longitude = v16.longitude;
    v45 = 2048;
    v46 = a5;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "MapView synchronizing with muninMarker at coordinate=(%g, %g), heading=%g", v41, 0x20u);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView camera](v19, "camera"));
  v29 = objc_msgSend(v28, "copy");

  objc_msgSend(v29, "setCenterCoordinate:", v16.latitude, v16.longitude);
  -[LookAroundPIPDataCoordinatorImpl setLookAroundViewHeading:](self, "setLookAroundViewHeading:", a5);
  -[MKMapView setCamera:animated:](v19, "setCamera:animated:", v29, 1);
  -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 15);

LABEL_12:
  objc_destroyWeak(&v34);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(buf, 8);

  if ((v24 & 1) == 0)
LABEL_13:
    -[LookAroundPIPDataCoordinatorImpl _willEndMovingLookAroundView:shouldZoomIfFinished:](self, "_willEndMovingLookAroundView:shouldZoomIfFinished:", 0, 0);

}

- (void)_willEndMovingLookAroundView:(BOOL)a3 shouldZoomIfFinished:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  unsigned int v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  _BOOL4 isMapViewInSyncWithLookAroundView;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  double lastHeading;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  _BYTE v31[22];
  __int16 v32;
  double v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;

  v4 = a4;
  v5 = a3;
  -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
  v9 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v7, v8);
  -[MKLookAroundView centerCoordinate](self->_lookAroundView, "centerCoordinate");
  v11 = v10;
  v13 = v12;
  v14 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v10, v12);
  objc_msgSend(v9, "distanceFromLocation:", v14);
  v16 = v15;
  v17 = 0;
  self->_isMapViewInSyncWithLookAroundView = v15 < 10.0;
  if (!v5 && v15 < 500.0)
    v17 = -[LookAroundPIPStateMachine isMoving](self->_stateMachine, "isMoving");
  v18 = 0;
  if (v5 && v4)
    v18 = -[LookAroundPIPStateMachine isActive](self->_stateMachine, "isActive");
  v19 = sub_100431B9C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    isMapViewInSyncWithLookAroundView = self->_isMapViewInSyncWithLookAroundView;
    v22 = CFSTR("NO");
    *(_DWORD *)v31 = 134219266;
    if (v5)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    *(double *)&v31[4] = v11;
    if (isMapViewInSyncWithLookAroundView)
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    if (v17)
      v22 = CFSTR("YES");
    *(_WORD *)&v31[12] = 2048;
    *(double *)&v31[14] = v13;
    v32 = 2048;
    v33 = v16;
    v34 = 2112;
    v35 = v23;
    v36 = 2112;
    v37 = v24;
    v38 = 2112;
    v39 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "LookAroundView will end moving to coordinate=(%g, %g), distance=%g, finished=%@, isMapViewInSyncWithLookAroundView=%@, shouldSnapBack=%@", v31, 0x3Eu);
  }

  if (v17)
  {
    lastHeading = self->_lastHeading;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView camera](self->_mapView, "camera"));
    v27 = objc_msgSend(v26, "copy");

    objc_msgSend(v27, "setCenterCoordinate:", v11, v13);
    -[MKMapView setCamera:animated:](self->_mapView, "setCamera:animated:", v27, 1);
    -[LookAroundPIPDataCoordinatorImpl setIsMapViewInSyncWithLookAroundView:](self, "setIsMapViewInSyncWithLookAroundView:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPDataCoordinatorImpl lookAroundView](self, "lookAroundView"));
    objc_msgSend(v28, "setPresentationYaw:", lastHeading);

LABEL_23:
    goto LABEL_24;
  }
  if (v18)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView camera](self->_mapView, "camera"));
    v27 = objc_msgSend(v29, "copy");

    objc_msgSend(v27, "centerCoordinateDistance");
    if (v30 < 950.0)
      objc_msgSend(v27, "centerCoordinateDistance");
    objc_msgSend(v27, "setCenterCoordinateDistance:", *(_OWORD *)v31);
    -[MKMapView setCamera:animated:](self->_mapView, "setCamera:animated:", v27, 1);
    goto LABEL_23;
  }
LABEL_24:
  -[LookAroundPIPDataCoordinatorImpl _didEndMovingLookAroundView:](self, "_didEndMovingLookAroundView:", v5, *(_QWORD *)v31);

}

- (void)_didEndMovingLookAroundView:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  CLLocationDegrees v6;
  double v7;
  CLLocationDegrees v8;
  double v9;
  double v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  _BOOL4 isMapViewInSyncWithLookAroundView;
  const __CFString *v15;
  _BYTE v16[22];
  __int16 v17;
  double v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;

  v3 = a3;
  -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
  v6 = v5;
  v8 = v7;
  -[MKLookAroundView presentationYaw](self->_lookAroundView, "presentationYaw");
  v10 = v9;
  v11 = sub_100431B9C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = CFSTR("NO");
    isMapViewInSyncWithLookAroundView = self->_isMapViewInSyncWithLookAroundView;
    *(_DWORD *)v16 = 134219010;
    if (v3)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    *(CLLocationDegrees *)&v16[4] = v6;
    *(_WORD *)&v16[12] = 2048;
    if (isMapViewInSyncWithLookAroundView)
      v13 = CFSTR("YES");
    *(CLLocationDegrees *)&v16[14] = v8;
    v17 = 2048;
    v18 = v10;
    v19 = 2112;
    v20 = v15;
    v21 = 2112;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "LookAroundView did end moving to coordinate=(%g, %g), heading=%g, finished=%@, isMapViewInSyncWithLookAroundView=%@", v16, 0x34u);
  }

  if (!-[LookAroundPIPStateMachine isCancellingPendingMove](self->_stateMachine, "isCancellingPendingMove"))
    -[LookAroundPIPStateMachine setStateTo:](self->_stateMachine, "setStateTo:", 2);
  self->_lastCoordinate.latitude = v6;
  self->_lastCoordinate.longitude = v8;
  self->_lookAroundViewHeading = v10;
  self->_lastHeading = v10;
  -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 16, *(_OWORD *)v16);
}

- (void)_nearestMuninMarkerWithCompleteMarkerHandler:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
  v5 = v4;
  -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  v9 = objc_msgSend(v8, "muninMarkerAtCoordinate:completeMarkerHandler:", v10, v5, v7);

}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (MKLookAroundView)lookAroundView
{
  return self->_lookAroundView;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (VKLabelMarker)labelMarkerToRefine
{
  return self->_labelMarkerToRefine;
}

- (void)setLabelMarkerToRefine:(id)a3
{
  objc_storeStrong((id *)&self->_labelMarkerToRefine, a3);
}

- (MKMapServiceTicket)refineTicket
{
  return self->_refineTicket;
}

- (void)setRefineTicket:(id)a3
{
  objc_storeStrong((id *)&self->_refineTicket, a3);
}

- (NSObject)mapViewDidChangeLookAroundAvailabilityObserver
{
  return self->_mapViewDidChangeLookAroundAvailabilityObserver;
}

- (void)setMapViewDidChangeLookAroundAvailabilityObserver:(id)a3
{
  objc_storeStrong((id *)&self->_mapViewDidChangeLookAroundAvailabilityObserver, a3);
}

- (NSObject)lookAroundViewDidBecomeAdequatelyDrawnObserver
{
  return self->_lookAroundViewDidBecomeAdequatelyDrawnObserver;
}

- (void)setLookAroundViewDidBecomeAdequatelyDrawnObserver:(id)a3
{
  objc_storeStrong((id *)&self->_lookAroundViewDidBecomeAdequatelyDrawnObserver, a3);
}

- (LookAroundPIPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (BOOL)isMapViewInSyncWithLookAroundView
{
  return self->_isMapViewInSyncWithLookAroundView;
}

- (void)setIsMapViewInSyncWithLookAroundView:(BOOL)a3
{
  self->_isMapViewInSyncWithLookAroundView = a3;
}

- (BOOL)isRotatingMapView
{
  return self->_isRotatingMapView;
}

- (void)setIsRotatingMapView:(BOOL)a3
{
  self->_isRotatingMapView = a3;
}

- (BOOL)isZoomingMapView
{
  return self->_isZoomingMapView;
}

- (void)setIsZoomingMapView:(BOOL)a3
{
  self->_isZoomingMapView = a3;
}

- (BOOL)isMapViewUserInteractionStarted
{
  return self->_isMapViewUserInteractionStarted;
}

- (void)setIsMapViewUserInteractionStarted:(BOOL)a3
{
  self->_isMapViewUserInteractionStarted = a3;
}

- (BOOL)isLookAroundViewUserInteractionStarted
{
  return self->_isLookAroundViewUserInteractionStarted;
}

- (void)setIsLookAroundViewUserInteractionStarted:(BOOL)a3
{
  self->_isLookAroundViewUserInteractionStarted = a3;
}

- (double)lookAroundViewHeading
{
  return self->_lookAroundViewHeading;
}

- (void)setLookAroundViewHeading:(double)a3
{
  self->_lookAroundViewHeading = a3;
}

- (CLLocationCoordinate2D)lastCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_lastCoordinate.latitude;
  longitude = self->_lastCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setLastCoordinate:(CLLocationCoordinate2D)a3
{
  self->_lastCoordinate = a3;
}

- (double)lastHeading
{
  return self->_lastHeading;
}

- (void)setLastHeading:(double)a3
{
  self->_lastHeading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_lookAroundViewDidBecomeAdequatelyDrawnObserver, 0);
  objc_storeStrong((id *)&self->_mapViewDidChangeLookAroundAvailabilityObserver, 0);
  objc_storeStrong((id *)&self->_refineTicket, 0);
  objc_storeStrong((id *)&self->_labelMarkerToRefine, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
