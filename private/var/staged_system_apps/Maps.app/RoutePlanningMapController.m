@implementation RoutePlanningMapController

- (RoutePlanningMapController)initWithChromeViewController:(id)a3
{
  id v4;
  RoutePlanningMapController *v5;
  void *v6;
  void *v7;
  void *v8;
  GEOTransitVehicleUpdater *v9;
  GEOTransitVehicleUpdater *transitVehicleUpdater;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RoutePlanningMapController;
  v5 = -[RoutePlanningMapController init](&v12, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "_willEnterForeground:", UISceneWillEnterForegroundNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, "_didEnterBackground:", UISceneDidEnterBackgroundNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, "_chromeViewControllerDidUpdateMapInsets:", CFSTR("ChromeViewControllerDidUpdateMapInsetsNotification"), v4);

    v5->_transportType = 0;
    v9 = (GEOTransitVehicleUpdater *)objc_msgSend(objc_alloc((Class)GEOTransitVehicleUpdater), "initWithDelegate:", v5);
    transitVehicleUpdater = v5->_transitVehicleUpdater;
    v5->_transitVehicleUpdater = v9;

    objc_msgSend(v4, "registerAdditionalMapViewDelegate:", v5);
  }

  return v5;
}

- (void)dealloc
{
  GEOTransitVehicleUpdater *transitVehicleUpdater;
  objc_super v4;

  -[GEOTransitVehicleUpdater setActive:](self->_transitVehicleUpdater, "setActive:", 0);
  transitVehicleUpdater = self->_transitVehicleUpdater;
  self->_transitVehicleUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningMapController;
  -[RoutePlanningMapController dealloc](&v4, "dealloc");
}

- (void)setActionCoordinator:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_actionCoordinator);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchPinsManager"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "searchPinsManager"));
    objc_storeWeak((id *)&self->_actionCoordinator, obj);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "windowScene"));

    if (objc_msgSend(v11, "activationState"))
      v12 = objc_msgSend(v11, "activationState") == (id)1;
    else
      v12 = 1;
    -[GEOTransitVehicleUpdater setActive:](self->_transitVehicleUpdater, "setActive:", v12);
    if (v7 != v8)
    {
      objc_msgSend(v7, "removePOIShapeLoadingObserver:", self);
      objc_msgSend(v8, "addPOIShapeLoadingObserver:", self);
    }

    v5 = obj;
  }

}

- (void)setDataCoordinator:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_dataCoordinator);
    objc_msgSend(v5, "removeObserver:", self);

    v6 = objc_storeWeak((id *)&self->_dataCoordinator, obj);
    objc_msgSend(obj, "addObserver:", self);

    v7 = objc_loadWeakRetained((id *)&self->_dataCoordinator);
    objc_msgSend(v7, "setupDataForObserver:", self);

  }
}

- (void)setPersonalizedItemManager:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_personalizedItemManager);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_personalizedItemManager);
    objc_msgSend(v5, "removeObserver:", self);

    v6 = objc_storeWeak((id *)&self->_personalizedItemManager, obj);
    objc_msgSend(obj, "addObserver:", self);

  }
}

- (void)setSelectCurrentRoute:(BOOL)a3
{
  if (self->_selectCurrentRoute != a3)
  {
    self->_selectCurrentRoute = a3;
    -[RoutePlanningMapController _updateRouteAnnotationsController](self, "_updateRouteAnnotationsController");
  }
}

- (void)clearMapState:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set", a3));
  -[GEOTransitVehicleUpdater setTripIDs:](self->_transitVehicleUpdater, "setTripIDs:", v4);

  self->_transportType = 0;
  -[RoutePlanningMapController _updateRouteAnnotationsController](self, "_updateRouteAnnotationsController");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchPinsManager"));
  objc_msgSend(v5, "clearDirectionsPins");

}

- (void)restoreOriginalMapViewMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController originalViewMode](self, "originalViewMode"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController originalViewMode](self, "originalViewMode"));
    objc_msgSend(v6, "setViewMode:animated:", objc_msgSend(v7, "integerValue"), v3);

    -[RoutePlanningMapController setOriginalViewMode:](self, "setOriginalViewMode:", 0);
  }
}

- (void)saveOriginalMapViewModeAs:(int64_t)a3
{
  NSNumber *v4;
  NSNumber *originalViewMode;

  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  originalViewMode = self->_originalViewMode;
  self->_originalViewMode = v4;

}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  id v6;
  NSObject *v7;
  RoutePlanningMapController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;

  if (!self->_userInteractedWithMap)
  {
    v6 = sub_10066CFAC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      self->_userInteractedWithMap = 1;
      return;
    }
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] User started interacting with map, will suppress camera updates", buf, 0xCu);

    goto LABEL_9;
  }
}

- (void)_resetUserInteractionState
{
  id v3;
  NSObject *v4;
  RoutePlanningMapController *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;

  if (self->_userInteractedWithMap)
  {
    v3 = sub_10066CFAC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      *(_WORD *)&self->_userInteractedWithMap = 0;
      return;
    }
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Clearing user interacted state, will allow camera updates", buf, 0xCu);

    goto LABEL_9;
  }
}

- (int64_t)observedRoutePlanningData
{
  return 53076;
}

- (void)routePlanningDataCoordinator:(id)a3 didEnable:(BOOL)a4
{
  -[RoutePlanningMapController _resetUserInteractionState](self, "_resetUserInteractionState", a3, a4);
  -[RoutePlanningMapController _updateCurrentRouteForVehicleUpdater](self, "_updateCurrentRouteForVehicleUpdater");
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  _BOOL4 v8;
  int64_t *p_transportType;
  int64_t v10;
  BOOL v11;
  int64_t v12;
  BOOL v15;
  void *v16;

  -[RoutePlanningMapController _resetUserInteractionState](self, "_resetUserInteractionState", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
  v7 = (unint64_t)objc_msgSend(v6, "displayedViewMode");

  if (!a4)
  {
    p_transportType = &self->_transportType;
    if (((v7 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0)
      goto LABEL_32;
    v8 = 1;
    goto LABEL_21;
  }
  if (v7 <= 7)
  {
    if (((1 << v7) & 0x67) != 0)
    {
      v8 = a4 != 3;
      p_transportType = &self->_transportType;
      if (((v7 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0)
      {
        if (a4 == 3)
        {
LABEL_6:
          v10 = 3;
          goto LABEL_39;
        }
LABEL_32:
        *p_transportType = a4;
        goto LABEL_41;
      }
LABEL_21:
      v12 = *p_transportType;
      v15 = a4 != 1 && v12 != 0 || v12 == a4;
      if (!v8 || !v15)
      {
        v10 = 7;
        switch(a4)
        {
          case 0:
          case 3:
            v10 = a4;
            break;
          case 2:
          case 5:
            goto LABEL_38;
          default:
            goto LABEL_39;
        }
        goto LABEL_39;
      }
      goto LABEL_32;
    }
    if (v7 == 3)
    {
      v11 = a4 == 3;
      goto LABEL_15;
    }
    if (v7 == 7)
    {
      v11 = a4 == 1 || a4 == 4;
LABEL_15:
      v8 = v11;
      p_transportType = &self->_transportType;
      goto LABEL_21;
    }
  }
  p_transportType = &self->_transportType;
  if (((v7 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0)
  {
    v8 = 0;
    goto LABEL_21;
  }
  switch(a4)
  {
    case 5:
      goto LABEL_38;
    case 3:
      goto LABEL_6;
    case 2:
LABEL_38:
      v10 = 0;
      break;
    default:
      v10 = 7;
      break;
  }
LABEL_39:
  *p_transportType = a4;
  if (v10 != v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
    objc_msgSend(v16, "updateViewMode:animated:", v10, 1);

  }
LABEL_41:
  -[RoutePlanningMapController _updateRouteAnnotationsController](self, "_updateRouteAnnotationsController");
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v14 = a4;
  v5 = objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController previousRouteCollection](self, "previousRouteCollection"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentRoute"));
    v8 = objc_msgSend(v7, "transportType");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController previousRouteCollection](self, "previousRouteCollection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentRoute"));
    if (v8 == objc_msgSend(v10, "transportType"))
    {
      v11 = objc_msgSend(v14, "currentRouteIndex");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController previousRouteCollection](self, "previousRouteCollection"));
      v13 = objc_msgSend(v12, "currentRouteIndex");

      -[RoutePlanningMapController setPreviousRouteCollection:](self, "setPreviousRouteCollection:", v14);
      if (v11 == v13)
        goto LABEL_8;
      goto LABEL_7;
    }

  }
  -[RoutePlanningMapController setPreviousRouteCollection:](self, "setPreviousRouteCollection:", v14);
LABEL_7:
  -[RoutePlanningMapController _resetUserInteractionState](self, "_resetUserInteractionState");
LABEL_8:
  -[RoutePlanningMapController _updateRouteAnnotationsController](self, "_updateRouteAnnotationsController");
  -[RoutePlanningMapController _updateSearchPinsManagerIfPossible](self, "_updateSearchPinsManagerIfPossible");
  -[RoutePlanningMapController _updateCurrentRouteForVehicleUpdater](self, "_updateCurrentRouteForVehicleUpdater");
  -[RoutePlanningMapController updateCameraIfPossible](self, "updateCameraIfPossible");

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateCurrentRouteDisplayedMapRect:(id)a4
{
  self->_userInteractedWithMap = 0;
  -[RoutePlanningMapController updateCameraIfPossible](self, "updateCameraIfPossible", a3, a4.var0.var0, a4.var0.var1, a4.var1.var0, a4.var1.var1);
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRideBookingRideOptionState:(id)a4
{
  uint64_t Log;
  NSObject *v5;
  char *v6;
  id v7;
  int v8;
  char *v9;
  __int16 v10;
  id v11;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/RoutePlanningMapController.m");
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Observing, but not doing anything"));
    v8 = 136315394;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRoutes:(id)a4
{
  void *v5;
  id v6;
  id WeakRetained;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator", a3, a4));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeCollection"));

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentRoute"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentRouteForVehicleUpdater);

  if (WeakRetained == v6)
    -[RoutePlanningMapController _updateVehicleManagerIfNeeded](self, "_updateVehicleManagerIfNeeded");

}

- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5
{
  void *v6;
  unsigned int v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator", a3, a4, a5));
  v7 = objc_msgSend(v6, "isRoutePlanningPresented");

  if (v7)
    -[RoutePlanningMapController updateCameraIfPossible](self, "updateCameraIfPossible");
}

- (void)_updateSearchPinsManagerIfPossible
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10066D81C;
  v24 = sub_10066D82C;
  v25 = 0;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resolvedWaypointSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypointsOrNull"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waypointRequests"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10066D834;
  v16[3] = &unk_1011BF490;
  v8 = v6;
  v17 = v8;
  v19 = &v20;
  v9 = v4;
  v18 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchPinsManager"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeCollection"));
  v13 = objc_msgSend(v12, "count") != 0;

  objc_msgSend(v11, "setDisableEndPins:", v13);
  objc_msgSend(v11, "setDisableStartPin:", v13);
  v14 = v21[5];
  v15 = objc_msgSend(v9, "copy");
  objc_msgSend(v11, "setStartPin:endPins:", v14, v15);

  _Block_object_dispose(&v20, 8);
}

- (void)_updateRouteAnnotationsController
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v2, "updateRouteAnnotations");

}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  unsigned int v26;
  uint64_t v27;
  _BOOL8 v28;
  void *v29;
  id v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeCollection"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
  v8 = objc_msgSend(v7, "transportType");

  if (v8 == (id)4 || !v6)
  {
    objc_msgSend(v4, "clear");
    goto LABEL_20;
  }
  v31 = v8;
  v32 = v6;
  v33 = v4;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routes"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "searchPinsManager"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "routeStartEndItemSource"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController personalizedItemManager](self, "personalizedItemManager"));
        objc_msgSend(v14, "updateWaypointStyleAttributesWithItemSource:personalizedItemManager:", v17, v18);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v11);
  }

  v6 = v32;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "routes"));
  v4 = v33;
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "routes"));
  if (v19 == (void *)v20)
  {

    v25 = v31;
    goto LABEL_15;
  }
  v21 = (void *)v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "routes"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "routes"));
  v24 = objc_msgSend(v22, "isEqualToArray:", v23);

  v25 = v31;
  if ((v24 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "routes"));
    objc_msgSend(v33, "setRoutes:", v19);
LABEL_15:

  }
  v26 = -[RoutePlanningMapController selectsCurrentRoute](self, "selectsCurrentRoute");
  if (v25 == (id)3)
    v27 = 1;
  else
    v27 = v26;
  v28 = v25 != (id)3;
  objc_msgSend(v33, "setSelectPolyline:", v27);
  objc_msgSend(v33, "setSelectedRouteIndex:", objc_msgSend(v32, "currentRouteIndex"));
  objc_msgSend(v33, "setRouteTrafficFeaturesActive:", 1);
  objc_msgSend(v33, "setAlternateRoutesEnabled:", v28);
  objc_msgSend(v33, "setStyle:", v28);
  objc_msgSend(v33, "setTransitVehiclePositions:", self->_lastReceivedVehiclePositions);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitVehicleUpdater tripIDs](self->_transitVehicleUpdater, "tripIDs"));
  objc_msgSend(v33, "filterTransitVehiclePositionsForTripsNotInSet:", v29);

LABEL_20:
  return 1;
}

- (void)_willEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchPinsManager"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));

  if (v9 == v8)
    -[GEOTransitVehicleUpdater setActive:](self->_transitVehicleUpdater, "setActive:", 1);

}

- (void)_didEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchPinsManager"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));

  if (v9 == v8)
    -[GEOTransitVehicleUpdater setActive:](self->_transitVehicleUpdater, "setActive:", 0);

}

- (void)updateCameraIfPossible
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  RoutePlanningMapController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  RoutePlanningMapController *v15;
  NSObject *v16;
  os_log_type_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v25;
  double v26;
  void *v27;
  id v28;
  RoutePlanningMapController *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  RoutePlanningMapController *v48;
  objc_class *v49;
  NSString *v50;
  void *v51;
  void *v52;
  void *v53;
  RoutePlanningMapController *v54;
  uint64_t v55;
  void *v56;
  uint8_t buf[4];
  RoutePlanningMapController *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  void *v63;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
  v4 = objc_msgSend(v3, "isPresentingAddStopSearchResults");

  if (!v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
    if (!-[NSObject isEnabled](v6, "isEnabled"))
      goto LABEL_46;
    if (self->_userInteractedWithMap)
    {
      if (self->_loggedFirstCameraSuppress)
      {
        v7 = sub_10066CFAC();
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v9 = self;
          v10 = (objc_class *)objc_opt_class(v9);
          v11 = NSStringFromClass(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
            v14 = v13;
            if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
            {
              v15 = (RoutePlanningMapController *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

              goto LABEL_13;
            }

          }
          v15 = (RoutePlanningMapController *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_13:

          *(_DWORD *)buf = 138543362;
          v58 = v15;
          v16 = v8;
          v17 = OS_LOG_TYPE_DEBUG;
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%{public}@] Will suppress camera update, user has interacted with map since last update", buf, 0xCu);

        }
LABEL_45:

        goto LABEL_46;
      }
      self->_loggedFirstCameraSuppress = 1;
      v28 = sub_10066CFAC();
      v8 = objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_45;
      v29 = self;
      v30 = (objc_class *)objc_opt_class(v29);
      v31 = NSStringFromClass(v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      if ((objc_opt_respondsToSelector(v29, "accessibilityIdentifier") & 1) != 0)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController performSelector:](v29, "performSelector:", "accessibilityIdentifier"));
        v34 = v33;
        if (v33 && !objc_msgSend(v33, "isEqualToString:", v32))
        {
          v15 = (RoutePlanningMapController *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v32, v29, v34));

          goto LABEL_25;
        }

      }
      v15 = (RoutePlanningMapController *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v32, v29));
LABEL_25:

      *(_DWORD *)buf = 138543362;
      v58 = v15;
      v16 = v8;
      v17 = OS_LOG_TYPE_INFO;
      goto LABEL_26;
    }
    -[NSObject currentRouteDisplayedMapRect](v6, "currentRouteDisplayedMapRect");
    v22 = v21;
    v23 = v18;
    if (v21 != MKMapRectNull.origin.x || v18 != MKMapRectNull.origin.y)
    {
      v25 = v19;
      v26 = v20;
      v8 = objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mapCameraController](v8, "mapCameraController"));
      objc_msgSend(v27, "frameMapRect:animated:completion:", 1, 0, v22, v23, v25, v26);
LABEL_44:

      goto LABEL_45;
    }
    v8 = objc_claimAutoreleasedReturnValue(-[NSObject routeCollection](v6, "routeCollection"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routes](v8, "routes"));
    if (-[NSObject transportType](v6, "transportType") == (id)3)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentRoute](v8, "currentRoute"));

      if (v35)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentRoute](v8, "currentRoute"));
        v63 = v36;
        v37 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));

        v27 = (void *)v37;
      }
    }
    v38 = objc_msgSend(v27, "count");
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
    v40 = v39;
    if (v38)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mapCameraController"));
      objc_msgSend(v41, "frameRoutes:includeCompassInset:animated:completion:", v27, 1, 1, 0);
LABEL_43:

      goto LABEL_44;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "searchPinsManager"));

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "startPOIShapeIfLoaded"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "endPOIShapesIfLoaded"));
    v44 = v43;
    if (v41 && objc_msgSend(v43, "count"))
    {
      v45 = objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mapCameraController](v45, "mapCameraController"));
      objc_msgSend(v46, "frameApproximateRouteFromStartPOIShape:toEndPOIShapes:animated:completion:", v41, v44, 1, 0);

LABEL_42:
      v40 = v42;
      goto LABEL_43;
    }
    v47 = sub_10066CFAC();
    v45 = objc_claimAutoreleasedReturnValue(v47);
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      goto LABEL_42;
    v48 = self;
    v49 = (objc_class *)objc_opt_class(v48);
    v50 = NSStringFromClass(v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    if ((objc_opt_respondsToSelector(v48, "accessibilityIdentifier") & 1) != 0)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController performSelector:](v48, "performSelector:", "accessibilityIdentifier"));
      v53 = v52;
      if (v52 && !objc_msgSend(v52, "isEqualToString:", v51))
      {
        v55 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v51, v48, v53));
        v56 = v53;
        v54 = (RoutePlanningMapController *)v55;

        goto LABEL_41;
      }

    }
    v54 = (RoutePlanningMapController *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v51, v48));
LABEL_41:

    *(_DWORD *)buf = 138543874;
    v58 = v54;
    v59 = 2112;
    v60 = v41;
    v61 = 2112;
    v62 = v44;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "[%{public}@] Skipping waypoint based framing due to startPOIShape: %@, endPOIShapes: %@", buf, 0x20u);

    goto LABEL_42;
  }
  v5 = sub_10066CFAC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v58 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Presenting Search results for adding a stop. Ignore route framing.", buf, 0xCu);
  }
LABEL_46:

}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSString *v18;
  void *v19;
  unsigned int v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  Block_layout *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  ActionCoordination **p_actionCoordinator;
  id WeakRetained;
  char v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  RoutePlanningMapController *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  __CFString *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  __CFString *v51;
  void *v52;
  CGPoint v53;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeCollection"));

  if (-[RoutePlanningMapController selectsCurrentRoute](self, "selectsCurrentRoute"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "currentRoute"));
  else
    v9 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController actionCoordinator](self, "actionCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeAnnotationsController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
  v13 = objc_msgSend(v12, "alternateRoutesEnabled");

  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "routes"));
LABEL_8:
    v15 = (void *)v14;
    goto LABEL_9;
  }
  if (v9)
  {
    v52 = v9;
    v14 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
    goto LABEL_8;
  }
  v15 = 0;
LABEL_9:
  v16 = sub_10066CFAC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v53.x = x;
    v53.y = y;
    v18 = NSStringFromCGPoint(v53);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = -[RoutePlanningMapController selectsCurrentRoute](self, "selectsCurrentRoute");
    v21 = CFSTR("YES");
    if (!v20)
      v21 = CFSTR("NO");
    v22 = v21;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "currentRoute"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "uniqueRouteID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString"));
    v25 = CFSTR("YES");
    if (!v13)
      v25 = CFSTR("NO");
    v26 = v25;
    *(_DWORD *)buf = 134350082;
    v43 = self;
    v44 = 2112;
    v45 = v19;
    v46 = 2112;
    v47 = v22;
    v48 = 2112;
    v49 = v24;
    v50 = 2112;
    v51 = v26;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Did receive map view tap at point %@; selectsCurrentRoute: %@; currentRoute: %@; showingAlternateRoutes: %@",
      buf,
      0x34u);

  }
  v27 = &stru_1011B7C58;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[RouteAnnotationsResponder routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:](RouteAnnotationsResponder, "routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:", v7, v15, v9, &stru_1011B7C58, x, y));

  v29 = sub_10066CFAC();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "uniqueRouteID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "UUIDString"));
    *(_DWORD *)buf = 134349314;
    v43 = self;
    v44 = 2112;
    v45 = v32;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}p] Detected user tapped route: %@", buf, 0x16u);

  }
  if (v28)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v33, "updateCurrentRoute:", v28);

    p_actionCoordinator = &self->_actionCoordinator;
    WeakRetained = objc_loadWeakRetained((id *)p_actionCoordinator);
    v36 = objc_opt_respondsToSelector(WeakRetained, "currentMapViewTargetForAnalytics");

    if ((v36 & 1) != 0)
    {
      v37 = objc_loadWeakRetained((id *)p_actionCoordinator);
      v38 = objc_msgSend(v37, "currentMapViewTargetForAnalytics");

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v39, "captureUserAction:onTarget:eventValue:routeIndex:", 3015, v38, 0, objc_msgSend(v28, "_maps_routeIndex"));

    }
  }

}

- (void)_updateCurrentRouteForVehicleUpdater
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  id obj;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
  v4 = objc_msgSend(v3, "isEnabled");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
  v6 = objc_msgSend(v5, "transportType");

  obj = 0;
  if (v4 && v6 == (id)3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeCollection"));

    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentRoute"));
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentRouteForVehicleUpdater);

  v10 = obj;
  if (obj != WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)&self->_currentRouteForVehicleUpdater);
    objc_msgSend(v11, "unregisterObserver:", self);

    objc_storeWeak((id *)&self->_currentRouteForVehicleUpdater, obj);
    objc_msgSend(obj, "registerObserver:", self);
    -[RoutePlanningMapController _updateVehicleManagerIfNeeded](self, "_updateVehicleManagerIfNeeded");
    v10 = obj;
  }

}

- (void)_updateVehicleManagerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController _currentVehicleEntries](self, "_currentVehicleEntries"));
  v7 = v3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tripIDs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }
  -[GEOTransitVehicleUpdater setTripIDs:](self->_transitVehicleUpdater, "setTripIDs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
  -[GEOTransitVehicleUpdater setActive:](self->_transitVehicleUpdater, "setActive:", objc_msgSend(v6, "isEnabled"));

  -[RoutePlanningMapController _updateRouteAnnotationsController](self, "_updateRouteAnnotationsController");
}

- (id)_currentVehicleEntries
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  id v13;
  id v14;
  char v15;
  char v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->_currentRouteForVehicleUpdater);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "departureDate"));
  if (v6)
  {

LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController dataCoordinator](self, "dataCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timing"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrivalDate"));

  if (v9)
    goto LABEL_5;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "segments", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v13)
  {
LABEL_24:
    v10 = 0;
    goto LABEL_26;
  }
  v14 = v13;
  v15 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v24;
  while (2)
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(_QWORD *)v24 != v17)
        objc_enumerationMutation(v12);
      v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
      if (!(v15 & 1 | (objc_msgSend(v19, "type") != (id)5)))
      {
        v22 = sub_10066EB60(v19);
        v21 = objc_claimAutoreleasedReturnValue(v22);
        if (v21)
        {
LABEL_25:
          v10 = (void *)v21;
          goto LABEL_26;
        }
        v15 = 1;
LABEL_20:
        if ((v16 & 1) != 0)
          goto LABEL_24;
        continue;
      }
      if (!((objc_msgSend(v19, "type") != (id)6) | v16 & 1))
      {
        v20 = sub_10066EB60(v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (v21)
          goto LABEL_25;
        v16 = 1;
      }
      if ((v15 & 1) != 0)
        goto LABEL_20;
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v10 = 0;
    if (v14)
      continue;
    break;
  }
LABEL_26:

LABEL_6:
  return v10;
}

- (id)transitVehicleUpdater:(id)a3 shouldUpdateVehiclePositionsForTripIDs:(id)a4
{
  id v5;
  void *v6;
  id UInteger;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningMapController _currentVehicleEntries](self, "_currentVehicleEntries"));
  UInteger = (id)GEOConfigGetUInteger(MapsConfig_TransitMaximumNumberOfVehiclesToDisplay, off_1014B2D88);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", UInteger));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "upcomingTripIDs", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
      if (objc_msgSend(v5, "containsObject:", v14))
        objc_msgSend(v8, "addObject:", v14);
      if (objc_msgSend(v8, "count") == UInteger)
        break;
      if (v11 == (id)++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  v15 = objc_msgSend(v8, "copy");
  return v15;
}

- (void)transitVehicleUpdater:(id)a3 didUpdateVehiclePositions:(id)a4 forTripIDs:(id)a5
{
  NSArray *v6;
  NSArray *lastReceivedVehiclePositions;

  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "allObjects", a3));
  lastReceivedVehiclePositions = self->_lastReceivedVehiclePositions;
  self->_lastReceivedVehiclePositions = v6;

  -[RoutePlanningMapController _updateRouteAnnotationsController](self, "_updateRouteAnnotationsController");
}

- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  GEOComposedRoute **p_currentRouteForVehicleUpdater;
  id v8;
  id WeakRetained;

  p_currentRouteForVehicleUpdater = &self->_currentRouteForVehicleUpdater;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_currentRouteForVehicleUpdater);

  if (WeakRetained == v8)
    -[RoutePlanningMapController _updateVehicleManagerIfNeeded](self, "_updateVehicleManagerIfNeeded");
}

- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10066EF28;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (ActionCoordination)actionCoordinator
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_actionCoordinator);
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  return (RoutePlanningDataCoordination *)objc_loadWeakRetained((id *)&self->_dataCoordinator);
}

- (PersonalizedItemManager)personalizedItemManager
{
  return (PersonalizedItemManager *)objc_loadWeakRetained((id *)&self->_personalizedItemManager);
}

- (BOOL)selectsCurrentRoute
{
  return self->_selectCurrentRoute;
}

- (NSNumber)originalViewMode
{
  return self->_originalViewMode;
}

- (void)setOriginalViewMode:(id)a3
{
  objc_storeStrong((id *)&self->_originalViewMode, a3);
}

- (RouteCollection)previousRouteCollection
{
  return self->_previousRouteCollection;
}

- (void)setPreviousRouteCollection:(id)a3
{
  objc_storeStrong((id *)&self->_previousRouteCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRouteCollection, 0);
  objc_storeStrong((id *)&self->_originalViewMode, 0);
  objc_destroyWeak((id *)&self->_personalizedItemManager);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_destroyWeak((id *)&self->_currentRouteForVehicleUpdater);
  objc_storeStrong((id *)&self->_lastReceivedVehiclePositions, 0);
  objc_storeStrong((id *)&self->_transitVehicleUpdater, 0);
}

@end
