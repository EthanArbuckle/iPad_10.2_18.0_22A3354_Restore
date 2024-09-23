@implementation NavigationRouteDetourer

- (NavigationRouteDetourer)initWithNavigationService:(id)a3 platformController:(id)a4 routeInfoProvider:(id)a5 routeInterrupter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NavigationRouteDetourer *v15;
  NavigationRouteDetourer *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NavigationRouteDetourer;
  v15 = -[NavigationRouteDetourer init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_navigationService, a3);
    objc_storeWeak((id *)&v16->_platformController, v12);
    objc_storeStrong((id *)&v16->_routeInfoProvider, a5);
    objc_storeStrong((id *)&v16->_routeInterrupter, a6);
  }

  return v16;
}

- (void)detourRouteToMapItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_geoMapItemStorageForPersistence"));
  v5 = objc_msgSend(objc_alloc((Class)GEOComposedWaypoint), "initWithMapItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrivalInfo"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "legs"));
  v11 = objc_msgSend(v7, "legIndex");
  if (v11 >= objc_msgSend(v10, "count"))
    v12 = 0;
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pointOfInterestCategory"));
  if (!objc_msgSend(v13, "isEqualToString:", MKPointOfInterestCategoryEVCharger)
    || (objc_msgSend(v7, "isInArrivalState") & 1) == 0
    && (objc_msgSend(v7, "isInParkingState") & 1) == 0)
  {

    goto LABEL_10;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chargingStationInfo"));

  if (!v14)
  {
LABEL_10:
    -[NavigationRouteDetourer detourRouteToWaypoint:](self, "detourRouteToWaypoint:", v5);
    goto LABEL_11;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destination"));
  -[NavigationRouteDetourer detourRouteToWaypoint:replacingWaypoint:](self, "detourRouteToWaypoint:replacingWaypoint:", v5, v15);

LABEL_11:
}

- (void)detourRouteToWaypoint:(id)a3
{
  -[NavigationRouteDetourer detourRouteToWaypoint:replacingWaypoint:](self, "detourRouteToWaypoint:replacingWaypoint:", a3, 0);
}

- (void)detourRouteToWaypoint:(id)a3 replacingWaypoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  char IsEnabled_Maps182;
  char v12;
  id WeakRetained;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int IsEnabled_DrivingMultiWaypointRoutes;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteDetourer navigationService](self, "navigationService"));
  v9 = objc_msgSend(v8, "navigationTransportType");
  switch((int)v9)
  {
    case 1:
    case 6:

      goto LABEL_12;
    case 2:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(v9);
      goto LABEL_5;
    case 3:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(v9);
LABEL_5:
      v12 = IsEnabled_Maps182;

      if ((v12 & 1) != 0)
        goto LABEL_6;
      goto LABEL_12;
    default:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v9, v10);

      if (IsEnabled_DrivingMultiWaypointRoutes)
      {
LABEL_6:
        WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentNavigationSession"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "waypointController"));

        if (v15)
        {
          if (v7)
          {
            v16 = sub_10043364C();
            v17 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
              v31 = 138412546;
              v32 = v18;
              v33 = 2112;
              v34 = v19;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[MPR] replacing waypoint %@ with %@", (uint8_t *)&v31, 0x16u);

            }
            objc_msgSend(v15, "replaceWaypoint:with:", v7, v6);
          }
          else
          {
            v28 = sub_100431C0C();
            v29 = objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
              v31 = 138412290;
              v32 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[MPR] inserting new waypoint %@", (uint8_t *)&v31, 0xCu);

            }
            objc_msgSend(v15, "insertWaypoint:", v6);
          }
        }
        else
        {
          v26 = sub_100431C0C();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v31) = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Failed to reach nav waypoint controller from NavigationRouteDetourer", (uint8_t *)&v31, 2u);
          }

          v15 = 0;
        }
      }
      else
      {
LABEL_12:
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteDetourer navigationService](self, "navigationService"));
        objc_msgSend(v21, "updateDestination:", v6);

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteDetourer routeInfoProvider](self, "routeInfoProvider"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "historyEntryRoute"));

        v23 = sub_100431C0C();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v31 = 138412290;
          v32 = v15;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Will interrupt route with history entry: %@.", (uint8_t *)&v31, 0xCu);
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteDetourer routeInterrupter](self, "routeInterrupter"));
        objc_msgSend(v25, "interruptHistoryEntryRoute:withCompletion:", v15, 0);

      }
      return;
  }
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (NavigationRouteHistoryInfoProviding)routeInfoProvider
{
  return self->_routeInfoProvider;
}

- (NavigationRouteInterrupting)routeInterrupter
{
  return self->_routeInterrupter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeInterrupter, 0);
  objc_storeStrong((id *)&self->_routeInfoProvider, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end
