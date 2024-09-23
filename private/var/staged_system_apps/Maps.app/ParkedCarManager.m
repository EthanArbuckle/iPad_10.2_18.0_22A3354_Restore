@implementation ParkedCarManager

+ (id)sharedManager
{
  if (qword_1014D42F0 != -1)
    dispatch_once(&qword_1014D42F0, &stru_1011E7DA0);
  return (id)qword_1014D42E8;
}

- (ParkedCarManager)init
{
  ParkedCarManager *v2;
  void *v3;
  void *v4;
  void *v5;
  ParkedCarManager *v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ParkedCarManager;
  v2 = -[ParkedCarManager init](&v14, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_authDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "_willResume:", MKApplicationStateWillEnterForegroundNotification, 0);

    objc_initWeak(&location, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_100BADB1C;
    v11 = &unk_1011AD9D0;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v5, "startMonitoringVehicleEventsWithHandler:", &v8);

    -[ParkedCarManager _updateParkedCar](v2, "_updateParkedCar", v8, v9, v10, v11);
    v6 = v2;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
  objc_msgSend(v3, "stopMonitoringVehicleEvents");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)ParkedCarManager;
  -[ParkedCarManager dealloc](&v5, "dealloc");
}

- (void)_authDidChange:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager", a3));
  if ((objc_msgSend(v4, "isAuthorizedForPreciseLocation") & 1) != 0)
    -[ParkedCarManager _updateParkedCar](self, "_updateParkedCar");
  else
    -[ParkedCarManager removeParkedCar](self, "removeParkedCar");

}

- (void)addParkedCarObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeParkedCarObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)fetchParkedCar:(id)a3
{
  id v4;
  NSMutableArray *fetchHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    fetchHandlers = self->_fetchHandlers;
    v10 = v4;
    if (!fetchHandlers)
    {
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v7 = self->_fetchHandlers;
      self->_fetchHandlers = v6;

      fetchHandlers = self->_fetchHandlers;
    }
    v8 = objc_msgSend(v10, "copy");
    v9 = objc_retainBlock(v8);
    -[NSMutableArray addObject:](fetchHandlers, "addObject:", v9);

    v4 = v10;
    if (!self->_isUpdating)
    {
      -[ParkedCarManager _updateParkedCar](self, "_updateParkedCar");
      v4 = v10;
    }
  }

}

- (void)updateParkedCarWithVehicleEvent:(id)a3 coordinate:(CLLocationCoordinate2D)a4 referenceFrame:(int)a5
{
  uint64_t v5;
  double longitude;
  double latitude;
  id v9;
  ParkedCar *parkedCar;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  NSMutableArray *fetchHandlers;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
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
  CLLocationCoordinate2D v36;

  v5 = *(_QWORD *)&a5;
  longitude = a4.longitude;
  latitude = a4.latitude;
  v9 = a3;
  parkedCar = self->_parkedCar;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCar mapItem](parkedCar, "mapItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItem"));
  -[ParkedCar updateFromVehicleEvent:geoMapItem:](parkedCar, "updateFromVehicleEvent:geoMapItem:", v9, v12);

  v36.latitude = latitude;
  v36.longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v36))
  {
    -[ParkedCar setCoordinate:](self->_parkedCar, "setCoordinate:", latitude, longitude);
    -[ParkedCar setReferenceFrame:](self->_parkedCar, "setReferenceFrame:", v5);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v18, "parkedCarManager:didUpdateParkedCar:") & 1) != 0)
          objc_msgSend(v18, "parkedCarManager:didUpdateParkedCar:", self, self->_parkedCar);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v15);
  }

  v19 = -[NSMutableArray copy](self->_fetchHandlers, "copy");
  fetchHandlers = self->_fetchHandlers;
  self->_fetchHandlers = 0;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j) + 16))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v23);
  }

}

- (void)setParkedCarWithMapItem:(id)a3 overrideCoordinate:(CLLocationCoordinate2D)a4 referenceFrame:(int)a5 vehicleEvent:(id)a6
{
  uint64_t v7;
  double longitude;
  double latitude;
  id v11;
  id v12;
  ParkedCar *v13;
  ParkedCar *parkedCar;
  ParkedCar **p_parkedCar;
  ParkedCar *v16;
  ParkedCar *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  GEOMapServiceTicket *ticket;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  id v31;
  NSMutableArray *fetchHandlers;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *k;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  CLLocationCoordinate2D v55;

  v7 = *(_QWORD *)&a5;
  longitude = a4.longitude;
  latitude = a4.latitude;
  v11 = a3;
  v12 = a6;
  if (v12)
    v13 = -[ParkedCar initWithVehicleEvent:geoMapItem:]([ParkedCar alloc], "initWithVehicleEvent:geoMapItem:", v12, v11);
  else
    v13 = 0;
  v55.latitude = latitude;
  v55.longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v55))
  {
    -[ParkedCar setCoordinate:](v13, "setCoordinate:", latitude, longitude);
    -[ParkedCar setReferenceFrame:](v13, "setReferenceFrame:", v7);
  }
  v39 = v12;
  p_parkedCar = &self->_parkedCar;
  parkedCar = self->_parkedCar;
  if (parkedCar)
  {
    v38 = v11;
    v16 = parkedCar;
    v17 = self->_parkedCar;
    self->_parkedCar = 0;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v23, "parkedCarManager:didRemoveParkedCar:") & 1) != 0)
            objc_msgSend(v23, "parkedCarManager:didRemoveParkedCar:", self, v16);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v20);
    }

    p_parkedCar = &self->_parkedCar;
    v11 = v38;
  }
  -[GEOMapServiceTicket cancel](self->_ticket, "cancel");
  ticket = self->_ticket;
  self->_ticket = 0;

  objc_storeStrong((id *)p_parkedCar, v13);
  if (self->_parkedCar)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v45 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
          if ((objc_opt_respondsToSelector(v30, "parkedCarManager:didAddParkedCar:") & 1) != 0)
            objc_msgSend(v30, "parkedCarManager:didAddParkedCar:", self, self->_parkedCar);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v27);
    }

    if (!v11)
      -[ParkedCarManager _updateParkedCarMapItem](self, "_updateParkedCarMapItem");
  }
  v31 = -[NSMutableArray copy](self->_fetchHandlers, "copy");
  fetchHandlers = self->_fetchHandlers;
  self->_fetchHandlers = 0;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v33 = v31;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v35; k = (char *)k + 1)
      {
        if (*(_QWORD *)v41 != v36)
          objc_enumerationMutation(v33);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)k) + 16))();
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v35);
  }

}

- (void)resolveMapItemFromVehicleEvent:(id)a3 overrideCoordinate:(CLLocationCoordinate2D)a4 referenceFrame:(int)a5 callback:(id)a6
{
  uint64_t v7;
  double longitude;
  double latitude;
  id v11;
  void (**v12)(_QWORD);
  ParkedCar *parkedCar;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  void (**v25)(_QWORD);
  id v26[3];
  int v27;
  id location;

  v7 = *(_QWORD *)&a5;
  longitude = a4.longitude;
  latitude = a4.latitude;
  v11 = a3;
  v12 = (void (**)(_QWORD))a6;
  if (v11)
  {
    parkedCar = self->_parkedCar;
    if (parkedCar)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCar vehicleEvent](parkedCar, "vehicleEvent"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if (v17)
      {
        -[ParkedCarManager updateParkedCarWithVehicleEvent:coordinate:referenceFrame:](self, "updateParkedCarWithVehicleEvent:coordinate:referenceFrame:", v11, v7, latitude, longitude);
        if (!v12)
          goto LABEL_10;
        goto LABEL_9;
      }
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapItem"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "geoMapItemHandle"));

  if (v19)
  {
    objc_initWeak(&location, self);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapItem"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "geoMapItemHandle"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100BAE5A0;
    v23[3] = &unk_1011E7DF0;
    objc_copyWeak(v26, &location);
    v26[1] = *(id *)&latitude;
    v26[2] = *(id *)&longitude;
    v27 = v7;
    v24 = v11;
    v25 = v12;
    objc_msgSend(v20, "resolveMapItemFromHandle:completionHandler:", v22, v23);

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ParkedCarManager setParkedCarWithMapItem:overrideCoordinate:referenceFrame:vehicleEvent:](self, "setParkedCarWithMapItem:overrideCoordinate:referenceFrame:vehicleEvent:", 0, v7, v11, latitude, longitude);
    if (v12)
LABEL_9:
      v12[2](v12);
  }
LABEL_10:

}

- (void)_updateParkedCar
{
  void *v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  if (objc_msgSend(v3, "isLocationServicesApproved") && !self->_isUpdating)
  {
    self->_isUpdating = 1;
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100BAE854;
    v11[3] = &unk_1011AD260;
    objc_copyWeak(&v12, &location);
    v4 = objc_retainBlock(v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100BAE874;
    v7[3] = &unk_1011C0B68;
    objc_copyWeak(&v10, &location);
    v6 = v4;
    v9 = v6;
    v8 = v3;
    objc_msgSend(v5, "fetchLastVehicleEventsWithHandler:", v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_updateParkedCarMapItem
{
  GEOMapServiceTicket *ticket;
  ParkedCar *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  GEOMapServiceTicket *v10;
  GEOMapServiceTicket *v11;
  GEOMapServiceTicket *v12;
  ParkedCar *v13;
  _QWORD v14[4];
  ParkedCar *v15;
  id v16;
  id location;

  -[GEOMapServiceTicket cancel](self->_ticket, "cancel");
  ticket = self->_ticket;
  self->_ticket = 0;

  objc_initWeak(&location, self);
  v4 = self->_parkedCar;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  -[ParkedCar coordinate](v4, "coordinate");
  v8 = GEOLocationCoordinate2DFromCLLocationCoordinate2D(v6, v7);
  v10 = (GEOMapServiceTicket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", 1, -[ParkedCar referenceFrame](v4, "referenceFrame") != 2, 1, 0, v8, v9));
  v11 = self->_ticket;
  self->_ticket = v10;

  v12 = self->_ticket;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100BAEED8;
  v14[3] = &unk_1011ADF70;
  objc_copyWeak(&v16, &location);
  v13 = v4;
  v15 = v13;
  -[GEOMapServiceTicket submitWithHandler:networkActivity:](v12, "submitWithHandler:networkActivity:", v14, 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)removeParkedCar
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100BAF15C;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(v3, "clearAllVehicleEventsWithHandler:", v4);

}

- (void)removeImageForParkedCar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleEvent"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    objc_msgSend(v6, "updateVehicleEventWithIdentifier:photo:", v7, 0);

  }
  objc_msgSend(v4, "setImage:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v13, "parkedCarManager:didUpdateParkedCar:") & 1) != 0)
          objc_msgSend(v13, "parkedCarManager:didUpdateParkedCar:", self, v4);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[ParkedCarManager _updateParkedCar](self, "_updateParkedCar");
}

- (void)setImage:(id)a3 forParkedCar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double width;
  double height;
  void *v32;
  double v33;
  CGFloat v34;
  UIImage *ImageFromCurrentImageContext;
  UIImage *v36;
  NSData *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *i;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  CGSize v52;
  CGRect v53;
  CGRect v54;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vehicleEvent"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;

    if (v11 <= v14)
      v17 = v19;

    objc_msgSend(v6, "size");
    v21 = v20;
    objc_msgSend(v6, "size");
    v23 = v22;
    objc_msgSend(v6, "size");
    if (v21 <= v23)
      v24 = v25;
    v26 = fmax(v24 / v17 * 0.5, 1.0);
    objc_msgSend(v6, "size");
    v28 = v27 / v26;
    objc_msgSend(v6, "size");
    v53.size.height = v29 / v26;
    v53.origin.x = 0.0;
    v53.origin.y = 0.0;
    v53.size.width = v28;
    v54 = CGRectIntegral(v53);
    width = v54.size.width;
    height = v54.size.height;
    v32 = objc_autoreleasePoolPush();
    objc_msgSend(v6, "scale");
    v34 = v33;
    v52.width = width;
    v52.height = height;
    UIGraphicsBeginImageContextWithOptions(v52, 1, v34);
    objc_msgSend(v6, "drawInRect:", 0.0, 0.0, width, height);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v36 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
    if (v6)
    {
      v37 = UIImageJPEGRepresentation(v36, 0.699999988);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    }
    else
    {
      v38 = 0;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    objc_msgSend(v39, "updateVehicleEventWithIdentifier:photo:", v40, v38);

    objc_autoreleasePoolPop(v32);
  }
  objc_msgSend(v7, "setImage:", v6);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v46, "parkedCarManager:didUpdateParkedCar:") & 1) != 0)
          objc_msgSend(v46, "parkedCarManager:didUpdateParkedCar:", self, v7);
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v43);
  }

  -[ParkedCarManager _updateParkedCar](self, "_updateParkedCar");
}

- (void)setNotes:(id)a3 forParkedCar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vehicleEvent"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    objc_msgSend(v9, "updateVehicleEventWithIdentifier:notes:", v10, v6);

  }
  v17 = v6;
  objc_msgSend(v7, "setNotes:", v6);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v16, "parkedCarManager:didUpdateParkedCar:") & 1) != 0)
          objc_msgSend(v16, "parkedCarManager:didUpdateParkedCar:", self, v7);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  -[ParkedCarManager _updateParkedCar](self, "_updateParkedCar");
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3 referenceFrame:(int)a4 forParkedCar:(id)a5
{
  uint64_t v5;
  double longitude;
  double latitude;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = *(_QWORD *)&a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = a5;
  objc_msgSend(v9, "setCoordinate:", latitude, longitude);
  objc_msgSend(v9, "setReferenceFrame:", v5);
  objc_msgSend(v9, "setMapItem:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vehicleEvent"));
  if (v10)
  {
    v11 = objc_alloc((Class)CLLocation);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v13 = objc_msgSend(v11, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v12, v5, latitude, longitude, 0.0, 0.0, -1.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    objc_msgSend(v14, "updateVehicleEventWithIdentifier:geoMapItem:", v15, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    objc_msgSend(v16, "updateVehicleEventWithIdentifier:location:", v17, v13);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects", 0));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v23, "parkedCarManager:didUpdateParkedCar:") & 1) != 0)
          objc_msgSend(v23, "parkedCarManager:didUpdateParkedCar:", self, v9);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v20);
  }

  -[ParkedCarManager _updateParkedCarMapItem](self, "_updateParkedCarMapItem");
}

- (void)informCoreRoutineOfEngagementWithParkedCar:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "vehicleEvent"));
  if (v5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    objc_msgSend(v3, "engageInVehicleEventWithIdentifier:", v4);

  }
}

- (void)_debug_addParkedCarAtLocation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
  objc_msgSend(v5, "vehicleEventAtLocation:notes:", v4, 0);

  -[ParkedCarManager _updateParkedCar](self, "_updateParkedCar");
}

- (void)_debug_showParkedCarNotification
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCar vehicleEvent](self->_parkedCar, "vehicleEvent"));
  objc_msgSend(v4, "showParkedCarBulletinForEvent:", v3);

}

- (void)_debug_showParkedCarReplacementNotification
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCar vehicleEvent](self->_parkedCar, "vehicleEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCar vehicleEvent](self->_parkedCar, "vehicleEvent"));
  objc_msgSend(v5, "showParkedCarReplacementBulletinForEvent:replacingEvent:", v3, v4);

}

- (ParkedCar)parkedCar
{
  return self->_parkedCar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkedCar, 0);
  objc_storeStrong((id *)&self->_fetchHandlers, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
