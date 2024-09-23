@implementation NavCameraController

- (NavCameraController)init
{
  NavCameraNavigationServiceProvider *v3;
  NavCameraController *v4;

  v3 = objc_alloc_init(NavCameraNavigationServiceProvider);
  v4 = -[NavCameraController initWithNavigationProvider:](self, "initWithNavigationProvider:", v3);

  return v4;
}

- (NavCameraController)initWithNavigationProvider:(id)a3
{
  id v5;
  char *v6;
  id v7;
  void *v8;
  NavCameraCaches *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NavCameraController;
  v6 = -[NavCameraController init](&v12, "init");
  if (v6)
  {
    v7 = objc_alloc_init((Class)VKNavContext);
    v8 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v7;

    *((_QWORD *)v6 + 19) = 0;
    v6[16] = 0;
    *((_DWORD *)v6 + 12) = 0;
    *(_QWORD *)(v6 + 20) = 0;
    v6[28] = 0;
    v9 = objc_alloc_init(NavCameraCaches);
    v10 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v9;

    *((_QWORD *)v6 + 5) = 0;
    *((_QWORD *)v6 + 7) = 0x7FF0000000000000;
    *((_QWORD *)v6 + 8) = 4;
    objc_storeStrong((id *)v6 + 14, a3);
    objc_msgSend(*((id *)v6 + 14), "setDelegate:", v6);
  }

  return (NavCameraController *)v6;
}

- (void)setOverrideNavigationProvider:(id)a3
{
  NavCameraNavigationProviding *v5;
  NavCameraNavigationProviding *overrideNavigationProvider;
  NavCameraNavigationProviding **p_overrideNavigationProvider;
  NavCameraNavigationProviding *v8;
  NavCameraNavigationProviding **p_navigationProvider;
  NavCameraNavigationProviding *v10;
  NavCameraNavigationProviding *originalNavigationProvider;
  NavCameraNavigationProviding *v12;

  v5 = (NavCameraNavigationProviding *)a3;
  p_overrideNavigationProvider = &self->_overrideNavigationProvider;
  overrideNavigationProvider = self->_overrideNavigationProvider;
  if (overrideNavigationProvider != v5)
  {
    v12 = v5;
    if (overrideNavigationProvider)
    {
      -[NavCameraNavigationProviding setDelegate:](overrideNavigationProvider, "setDelegate:", 0);
      v8 = *p_overrideNavigationProvider;
      *p_overrideNavigationProvider = 0;

    }
    objc_storeStrong((id *)&self->_overrideNavigationProvider, a3);
    p_navigationProvider = &self->_navigationProvider;
    -[NavCameraNavigationProviding setDelegate:](self->_navigationProvider, "setDelegate:", 0);
    if (v12)
    {
      v10 = v12;
      originalNavigationProvider = *p_navigationProvider;
      *p_navigationProvider = v10;
    }
    else
    {
      objc_storeStrong((id *)&self->_navigationProvider, self->_originalNavigationProvider);
      originalNavigationProvider = self->_originalNavigationProvider;
      self->_originalNavigationProvider = 0;
    }

    -[NavCameraController _restoreStateFromNavigationProvider:](self, "_restoreStateFromNavigationProvider:", self->_navigationProvider);
    -[NavCameraNavigationProviding setDelegate:](self->_navigationProvider, "setDelegate:", self);
    v5 = v12;
  }

}

- (void)setMapView:(id)a3
{
  MKMapView *v5;
  MKMapView *mapView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSHashTable *activeCameraInfos;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MKMapView *v19;

  v5 = (MKMapView *)a3;
  mapView = self->_mapView;
  if (mapView != v5)
  {
    v19 = v5;
    if (!v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](mapView, "_mapLayer"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sceneConfiguration"));
      objc_msgSend(v8, "setCurrentTransportationType:", 4);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sceneConfiguration"));
      objc_msgSend(v10, "setNavigationState:", 0);

    }
    objc_storeStrong((id *)&self->_mapView, a3);
    activeCameraInfos = self->_activeCameraInfos;
    self->_activeCameraInfos = 0;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
    objc_msgSend(v12, "setNavContext:", self->_navContext);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sceneConfiguration"));
    objc_msgSend(v14, "setNavCameraMode:", -[NavCameraController navCameraMode](self, "navCameraMode"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sceneConfiguration"));
    objc_msgSend(v16, "setNavigationDestination:", -[NavCameraController navigationDestination](self, "navigationDestination"));

    v5 = v19;
    if (v19)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController navigationProvider](self, "navigationProvider"));

      v5 = v19;
      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController navigationProvider](self, "navigationProvider"));
        -[NavCameraController _restoreStateFromNavigationProvider:](self, "_restoreStateFromNavigationProvider:", v18);

        v5 = v19;
      }
    }
  }

}

- (int64_t)desiredDisplayRate
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  v3 = objc_msgSend(v2, "navigationDisplayRate");

  return (int64_t)v3;
}

- (void)setDesiredDisplayRate:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v4, "setNavigationDisplayRate:", a3);

}

- (void)transitionToTrackingInMapMode:(int64_t)a3 animated:(BOOL)a4 startLocation:(id)a5 startHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v7 = a4;
  v20 = a6;
  if (a5)
  {
    v10 = a5;
    objc_msgSend(v10, "coordinate");
    v12 = v11;
    objc_msgSend(v10, "coordinate");
    v14 = VKLocationCoordinate2DMake(v12, v13);
    v16 = v15;
    objc_msgSend(v10, "course");
    v18 = v17;

  }
  else
  {
    v18 = 0.0;
    v14 = -180.0;
    v16 = -180.0;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v19, "transitionToTracking:mapMode:startLocation:startCourse:pounceCompletionHandler:", v7, a3, v20, v14, v16, v18);

}

- (void)stopTracking
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v2, "stopTracking");

}

- (void)pauseTracking
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v2, "pauseTracking");

}

- (void)resetMapViewNavigationState
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v3, "setNavContext:", 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sceneConfiguration"));
  objc_msgSend(v4, "resetState");

}

- (void)setIncidentsDisabled:(BOOL)a3
{
  self->_incidentsDisabled = a3;
}

- (void)setTrafficIncidentAlert:(id)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unsigned __int8 v10;
  id v11;

  v11 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alertID](self->_trafficIncidentAlert, "alertID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "alertID"));
  v7 = v5;
  v8 = v6;
  if (v7 | v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_trafficIncidentAlert, a3);
      -[NavCameraController _updateState](self, "_updateState");
    }
  }

}

- (void)setSearchAlongTheRoutePoints:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_searchAlongTheRoutePoints;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_searchAlongTheRoutePoints, a3);
      -[NavCameraController _updateState](self, "_updateState");
      v7 = (unint64_t)v9;
    }
  }

}

- (void)frameVehiclePositions:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v6 = self->_vehiclePositions;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_vehiclePositions, a3);
      v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend((id)v7, "count"));
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = (id)v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14), "coordinate", (_QWORD)v16);
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithMKCoordinate:](NSValue, "valueWithMKCoordinate:"));
            objc_msgSend(v9, "addObject:", v15);

            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }

      if (!-[NSArray isEqualToArray:](self->_vehiclePositionPoints, "isEqualToArray:", v9))
      {
        objc_storeStrong((id *)&self->_vehiclePositionPoints, v9);
        -[NavCameraController _updateState](self, "_updateState");
      }

    }
  }

}

- (void)filterVehiclePositionsForTripsNotInSet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  NavCameraController *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController vehiclePositions](self, "vehiclePositions"));
  v6 = objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v6, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController vehiclePositions](self, "vehiclePositions"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "tripID")));
          v14 = objc_msgSend(v4, "containsObject:", v13);

          if ((v14 & 1) == 0)
            objc_msgSend(v6, "removeObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    self = v15;
  }
  -[NavCameraController frameVehiclePositions:](self, "frameVehiclePositions:", v6);

}

- (void)_updateState
{
  NavCameraController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NavCameraController *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  void *i;
  void *v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  NSObject *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  void *j;
  void *v84;
  double v85;
  double v86;
  id v87;
  NSObject *v88;
  id v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  NavCameraController *v118;
  uint64_t v119;
  void *v120;
  id v121;
  id v122;
  id obj;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  _BYTE v137[128];
  uint8_t v138[128];
  uint8_t buf[4];
  id v140;

  v2 = self;
  -[VKNavContext clearPointsToFrame](self->_navContext, "clearPointsToFrame");
  -[VKNavContext clearAdditionalRoutesToFrame](v2->_navContext, "clearAdditionalRoutesToFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController navigationProvider](v2, "navigationProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "route"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController navigationProvider](v2, "navigationProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alternateRoutes"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController navigationProvider](v2, "navigationProvider"));
  v8 = objc_msgSend(v7, "displayedStepIndex");

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController navigationProvider](v2, "navigationProvider"));
    v8 = objc_msgSend(v9, "stepIndex");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VKNavContext route](v2->_navContext, "route"));

  if (v10 != v4)
    -[VKNavContext updateWithNewRoute:currentStepIndex:](v2->_navContext, "updateWithNewRoute:currentStepIndex:", v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController trafficIncidentAlert](v2, "trafficIncidentAlert"));

  v120 = v4;
  if (v11)
  {
    v12 = sub_100673EEC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Will pass traffic incident to frame", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController trafficIncidentAlert](v2, "trafficIncidentAlert"));
    v15 = objc_msgSend(v14, "incidentCoordinate");
    v16 = GEOPolylineCoordinateCompare(v15, *(_QWORD *)GEOPolylineCoordinateInvalid);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController trafficIncidentAlert](v2, "trafficIncidentAlert"));
      objc_msgSend(v4, "pointAtRouteCoordinate:", objc_msgSend(v17, "incidentCoordinate"));
      v19 = v18;
      v21 = v20;
      v23 = v22;

      if (v21 >= -180.0 && v21 <= 180.0 && v19 >= -90.0 && v19 <= 90.0)
        -[VKNavContext addPointToFrame:ofType:](v2->_navContext, "addPointToFrame:ofType:", 1, v19, v21, v23);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController trafficIncidentAlert](v2, "trafficIncidentAlert"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "alternateRouteToDisplay"));

    if (v25)
    {
      v116 = v6;
      v26 = sub_100673EEC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Will pass alternate route to frame with incident", buf, 2u);
      }

      v28 = objc_alloc_init((Class)MNRouteDivergenceFinder);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "findFirstUniqueRangeBetweenRoute:andRoute:", v4, v25));
      if (objc_msgSend(v29, "count") == (id)2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", 0));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "uniqueRanges"));
        if (objc_msgSend(v31, "count"))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", 1));
          v33 = v2;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "uniqueRanges"));
          v35 = objc_msgSend(v34, "count");

          v2 = v33;
          v4 = v120;
          if (v35)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", 0));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "uniqueRanges"));
            v38 = objc_msgSend(v37, "coordinateRangeAtIndex:", 0);
            v40 = v39;

            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", 1));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "uniqueRanges"));
            v43 = objc_msgSend(v42, "coordinateRangeAtIndex:", 0);
            v45 = v44;

            -[VKNavContext addRouteToFrame:divergenceCoord:convergenceCoord:](v33->_navContext, "addRouteToFrame:divergenceCoord:convergenceCoord:", v25, v43, v45);
            v46 = v38;
            v4 = v120;
            v47 = v40;
            v2 = v33;
            -[VKNavContext addRouteToFrame:divergenceCoord:convergenceCoord:](v33->_navContext, "addRouteToFrame:divergenceCoord:convergenceCoord:", v120, v46, v47);
          }
        }
        else
        {

          v4 = v120;
        }
      }

      v6 = v116;
    }

  }
  if (!v2->_incidentsDisabled)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController trafficIncidentAlert](v2, "trafficIncidentAlert"));
    v49 = -[NavCameraController _incidentTypeForAlert:](v2, "_incidentTypeForAlert:", v48);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](v2, "mapView"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "_mapLayer"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "sceneConfiguration"));
    objc_msgSend(v52, "setCurrentIncidentType:", v49);

  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController trafficIncidentAlert](v2, "trafficIncidentAlert"));

  if (!v53)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController searchAlongTheRoutePoints](v2, "searchAlongTheRoutePoints"));
    v55 = objc_msgSend(v54, "count");

    if (v55)
    {
      v56 = sub_100673EEC();
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController searchAlongTheRoutePoints](v2, "searchAlongTheRoutePoints"));
        v59 = objc_msgSend(v58, "count");
        *(_DWORD *)buf = 134217984;
        v140 = v59;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "Will pass %lu SAR points to frame", buf, 0xCu);

      }
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](v2, "mapView"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "_mapLayer"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "sceneConfiguration"));
      objc_msgSend(v62, "setSearchAlongTheRoute:", 1);

      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController searchAlongTheRoutePoints](v2, "searchAlongTheRoutePoints"));
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v132, v138, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v133;
        do
        {
          for (i = 0; i != v65; i = (char *)i + 1)
          {
            if (*(_QWORD *)v133 != v66)
              objc_enumerationMutation(v63);
            v68 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v68, "MKCoordinateValue");
            v70 = v69;
            objc_msgSend(v68, "MKCoordinateValue");
            -[VKNavContext addPointToFrame:ofType:](v2->_navContext, "addPointToFrame:ofType:", 2, v70);
          }
          v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v132, v138, 16);
        }
        while (v65);
      }
    }
    else
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](v2, "mapView"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "_mapLayer"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "sceneConfiguration"));
      objc_msgSend(v72, "setSearchAlongTheRoute:", 0);

    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController vehiclePositionPoints](v2, "vehiclePositionPoints"));
    v74 = objc_msgSend(v73, "count");

    if (v74)
    {
      v75 = sub_100673EEC();
      v76 = objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController vehiclePositionPoints](v2, "vehiclePositionPoints"));
        v78 = objc_msgSend(v77, "count");
        *(_DWORD *)buf = 134217984;
        v140 = v78;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "Will pass %lu vehicle position points to frame", buf, 0xCu);

      }
      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController vehiclePositionPoints](v2, "vehiclePositionPoints"));
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v128, v137, 16);
      if (v80)
      {
        v81 = v80;
        v82 = *(_QWORD *)v129;
        do
        {
          for (j = 0; j != v81; j = (char *)j + 1)
          {
            if (*(_QWORD *)v129 != v82)
              objc_enumerationMutation(v79);
            v84 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v84, "MKCoordinateValue");
            v86 = v85;
            objc_msgSend(v84, "MKCoordinateValue");
            -[VKNavContext addPointToFrame:ofType:](v2->_navContext, "addPointToFrame:ofType:", 3, v86);
          }
          v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v128, v137, 16);
        }
        while (v81);
      }

    }
    if (objc_msgSend(v6, "count"))
    {
      v118 = v2;
      v87 = sub_100673EEC();
      v88 = objc_claimAutoreleasedReturnValue(v87);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
      {
        v89 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 134217984;
        v140 = v89;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEBUG, "Will pass %lu alternate routes to frame", buf, 0xCu);
      }

      v90 = objc_alloc_init((Class)MNRouteDivergenceFinder);
      v91 = *(void **)GEOPolylineCoordinateInvalid;
      v124 = 0u;
      v125 = 0u;
      v126 = 0u;
      v127 = 0u;
      v117 = v6;
      obj = v6;
      v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
      v122 = v91;
      if (v92)
      {
        v93 = v92;
        v94 = *(_QWORD *)v125;
        v119 = *(_QWORD *)v125;
        do
        {
          v95 = 0;
          v121 = v93;
          do
          {
            if (*(_QWORD *)v125 != v94)
              objc_enumerationMutation(obj);
            v96 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)v95);
            v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "findFirstUniqueRangeBetweenRoute:andRoute:", v4, v96));
            if (objc_msgSend(v97, "count") == (id)2)
            {
              v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "objectAtIndexedSubscript:", 0));
              v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "uniqueRanges"));
              if (objc_msgSend(v99, "count"))
              {
                v100 = v91;
                v101 = v90;
                v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "objectAtIndexedSubscript:", 1));
                v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "uniqueRanges"));
                v104 = objc_msgSend(v103, "count");

                if (v104)
                {
                  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "objectAtIndexedSubscript:", 1));
                  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "uniqueRanges"));
                  v107 = objc_msgSend(v106, "coordinateRangeAtIndex:", 0);
                  v109 = v108;

                  -[VKNavContext addRouteToFrame:divergenceCoord:convergenceCoord:](v118->_navContext, "addRouteToFrame:divergenceCoord:convergenceCoord:", v96, v107, v109);
                  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "objectAtIndexedSubscript:", 0));
                  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "uniqueRanges"));
                  v112 = objc_msgSend(v111, "coordinateRangeAtIndex:", 0);
                  v114 = v113;

                  v115 = v122;
                  if ((GEOPolylineCoordinateIsInvalid(v122) & 1) != 0
                    || GEOPolylineCoordinateIsABeforeB(v112, v122))
                  {
                    v115 = v112;
                  }
                  v122 = v115;
                  v91 = v100;
                  v4 = v120;
                  v90 = v101;
                  if ((GEOPolylineCoordinateIsInvalid(v100) & 1) != 0
                    || GEOPolylineCoordinateIsABeforeB(v100, v114))
                  {
                    v91 = v114;
                  }
                }
                else
                {
                  v4 = v120;
                  v90 = v101;
                  v91 = v100;
                }
                v94 = v119;
                v93 = v121;
              }
              else
              {

              }
            }

            v95 = (char *)v95 + 1;
          }
          while (v93 != v95);
          v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
        }
        while (v93);
      }

      -[VKNavContext addRouteToFrame:divergenceCoord:convergenceCoord:](v118->_navContext, "addRouteToFrame:divergenceCoord:convergenceCoord:", v4, v122, v91);
      v6 = v117;
    }
  }

}

- (unint64_t)_incidentTypeForAlert:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = (unint64_t)objc_msgSend(v3, "alertType"), v5 <= 7))
    v6 = qword_100E39C08[v5];
  else
    v6 = 0;

  return v6;
}

- (void)setNavCameraMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  self->_navCameraMode = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapLayer"));
  objc_msgSend(v6, "setNavCameraMode:", a3);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapLayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sceneConfiguration"));
  objc_msgSend(v8, "setNavCameraMode:", a3);

}

- (unint64_t)navigationCameraHeadingOverride
{
  return (unint64_t)-[VKNavContext navigationCameraHeadingOverride](self->_navContext, "navigationCameraHeadingOverride");
}

- (void)setNavigationCameraHeadingOverride:(unint64_t)a3
{
  -[VKNavContext setNavigationCameraHeadingOverride:](self->_navContext, "setNavigationCameraHeadingOverride:", a3);
}

- (void)setNavigationDestination:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  self->_navigationDestination = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapLayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneConfiguration"));
  objc_msgSend(v5, "setNavigationDestination:", a3);

}

- (void)_restoreStateFromNavigationProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v4 = a3;
  -[NavCameraController navigationProvider:didChangeToNavigating:](self, "navigationProvider:didChangeToNavigating:", v4, objc_msgSend(v4, "isInNavigatingState"));
  -[NavCameraController navigationProvider:didChangeNavigationState:](self, "navigationProvider:didChangeNavigationState:", v4, objc_msgSend(v4, "navigationState"));
  -[NavCameraController navigationProvider:didChangeNavigationDestination:](self, "navigationProvider:didChangeNavigationDestination:", v4, objc_msgSend(v4, "navigationDestination"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
  -[NavCameraController navigationProvider:didUpdateMatchedLocation:](self, "navigationProvider:didUpdateMatchedLocation:", v4, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
  -[NavCameraController _updateWithNewRoute:](self, "_updateWithNewRoute:", v6);

  -[NavCameraController navigationProvider:didUpdateStepIndex:segmentIndex:](self, "navigationProvider:didUpdateStepIndex:segmentIndex:", v4, objc_msgSend(v4, "stepIndex"), 0);
  objc_msgSend(v4, "distanceUntilManeuver");
  v8 = v7;
  objc_msgSend(v4, "timeUntilManeuver");
  -[NavCameraController navigationProvider:didUpdateDistanceUntilManeuver:timeUntilManeuver:forStepIndex:](self, "navigationProvider:didUpdateDistanceUntilManeuver:timeUntilManeuver:forStepIndex:", v4, objc_msgSend(v4, "stepIndex"), v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alternateRoutes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alternateRouteTraffics"));
  -[NavCameraController navigationProvider:didUpdateAlternateRoutes:traffics:](self, "navigationProvider:didUpdateAlternateRoutes:traffics:", v4, v11, v10);

}

- (void)navigationProvider:(id)a3 didChangeToNavigating:(BOOL)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "route"));
  -[NavCameraController _updateWithNewRoute:](self, "_updateWithNewRoute:", v5);

}

- (void)navigationProvider:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_mapLayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sceneConfiguration"));
  objc_msgSend(v6, "setNavigationState:", v4);

}

- (void)navigationProvider:(id)a3 didChangeNavigationDestination:(unint64_t)a4
{
  -[NavCameraController setNavigationDestination:](self, "setNavigationDestination:", a4);
}

- (void)navigationProvider:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double distanceAlongRoute;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  id v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  id v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  unsigned int v87;
  id v88;
  unint64_t v89;
  void *v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController navigationProvider](self, "navigationProvider"));
  v9 = objc_msgSend(v8, "displayedStepIndex");

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController navigationProvider](self, "navigationProvider"));
    v9 = objc_msgSend(v10, "stepIndex");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
  v87 = objc_msgSend(v6, "navigationState");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch"));
  v88 = objc_msgSend(v12, "routeCoordinate");

  v89 = (unint64_t)v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stepAtIndex:", v9));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch"));

  if (v14)
  {
    v15 = 0.0;
    if (objc_msgSend(v7, "state") != (id)1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch"));
      objc_msgSend(v16, "distanceFromRoute");
      v15 = v17;

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch"));
    objc_msgSend(v18, "locationCoordinate");
    v20 = v19;
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch"));
    objc_msgSend(v11, "distanceBetweenLocation:nextPointIndex:toPointIndex:", objc_msgSend(v23, "routeCoordinate") + 1, objc_msgSend(v11, "pointCount") - 1, v20, v22);
    v25 = v15 + v24;

    objc_msgSend(v11, "distance");
    self->_distanceAlongRoute = v26 - v25;
  }
  if (!v13
    || (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch")),
        objc_msgSend(v11, "distanceBetweenRouteCoordinate:andRouteCoordinate:", objc_msgSend(v27, "routeCoordinate"), objc_msgSend(v13, "endRouteCoordinate")), v29 = v28, v27, v29 >= GEOConfigGetDouble(MapsConfig_LockLineRampTypeDistance, off_1014B2DE8)))
  {
    self->_currentLineType = objc_msgSend(v7, "roadLineType");
    self->_currentRampType = objc_msgSend(v7, "rampType");
  }
  v90 = v13;
  v91 = v6;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch"));
  -[VKNavContext setRouteMatch:](self->_navContext, "setRouteMatch:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traffic"));
  distanceAlongRoute = self->_distanceAlongRoute;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "routeTrafficColors"));
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v93;
    while (2)
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(_QWORD *)v93 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v38, "offsetMeters");
        if (v39 > distanceAlongRoute && (unint64_t)objc_msgSend(v38, "color") < 3)
        {
          objc_msgSend(v38, "offsetMeters");
          v40 = v41 - distanceAlongRoute;
          goto LABEL_21;
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
      if (v35)
        continue;
      break;
    }
  }
  v40 = INFINITY;
LABEL_21:

  self->_distanceToCurrentTrafficSection = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traffic"));
  v43 = self->_distanceAlongRoute;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "routeTrafficColors"));
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v93;
    v48 = 4;
LABEL_23:
    v49 = 0;
    while (1)
    {
      if (*(_QWORD *)v93 != v47)
        objc_enumerationMutation(v44);
      v50 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v49);
      objc_msgSend(v50, "offsetMeters");
      if (v51 > v43)
        break;
      v48 = (unint64_t)objc_msgSend(v50, "color");
      if (v46 == (id)++v49)
      {
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
        if (v46)
          goto LABEL_23;
        goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_29:
    v48 = 4;
  }

  self->_currentTrafficColor = v48;
  self->_laneCount = objc_msgSend(v11, "laneCountAtRouteCoordinate:", v88);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "_mapLayer"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "sceneConfiguration"));

  objc_msgSend(v54, "setLineType:", self->_currentLineType);
  objc_msgSend(v54, "setRampType:", self->_currentRampType);
  objc_msgSend(v7, "speed");
  objc_msgSend(v54, "setVehicleSpeed:", v55 * 3600.0 / 1000.0);
  objc_msgSend(v54, "setDistanceToCurrentTrafficSection:", self->_distanceToCurrentTrafficSection);
  objc_msgSend(v54, "setTrafficColor:", self->_currentTrafficColor);
  objc_msgSend(v54, "setLaneCount:", self->_laneCount);
  LODWORD(v52) = objc_msgSend(v7, "speedLimitIsMPH");
  v56 = objc_msgSend(v7, "speedLimit");
  v57 = (double)(unint64_t)v56;
  if ((_DWORD)v52)
    v57 = (double)(unint64_t)v56 * 1.609344;
  objc_msgSend(v54, "setRoadSpeed:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController overrideNavigationProvider](self, "overrideNavigationProvider"));

  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "roadName"));
    if (objc_msgSend(v59, "length"))
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "roadName"));
    else
      v60 = 0;

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "_mapLayer"));
    objc_msgSend(v62, "setCurrentLocationText:", v60);

  }
  -[NavCameraController _updateCameraInfoStylesForRoute:routeCoordinate:](self, "_updateCameraInfoStylesForRoute:routeCoordinate:", v11, v88);
  if (!self->_hasMatchedTiles)
  {
    if (v89 >= (unint64_t)objc_msgSend(v11, "stepsCount"))
      goto LABEL_52;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "roadFeatureAtPointIndex:", objc_msgSend(v90, "maneuverStartRouteCoordinate")));
    if (v63)
    {
      self->_hasMatchedTiles = 1;
      -[NavCameraCaches recalculateGroupedManeuversCaches](self->_navCameraCaches, "recalculateGroupedManeuversCaches");
    }

  }
  if (v87 == 1)
  {
    self->_isProcedingToRoute = 1;
    objc_msgSend(v7, "coordinate");
    v66 = GEOLocationCoordinate2DFromCLLocationCoordinate2D(v64, v65);
    v68 = v67;
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stepAtIndex:", 0));
    v70 = v69;
    if (!v69)
      goto LABEL_51;
    v71 = objc_msgSend(v11, "pointAtRouteCoordinate:", objc_msgSend(v69, "startRouteCoordinate"));
    v74 = GEOCalculateDistance(v71, v66, v68, v72, v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "_mapLayer"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "sceneConfiguration"));
    objc_msgSend(v77, "setCurrentStepLength:", v74);

    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "getNextStep"));
    if (!v78)
      goto LABEL_51;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "_mapLayer"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "sceneConfiguration"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "getNextStep"));
    objc_msgSend(v82, "distance");
    objc_msgSend(v81, "setNextStepLength:");

LABEL_50:
LABEL_51:

    goto LABEL_52;
  }
  if (self->_isProcedingToRoute)
  {
    self->_isProcedingToRoute = 0;
    if (v89 < (unint64_t)objc_msgSend(v11, "stepsCount"))
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "_mapLayer"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "sceneConfiguration"));
      objc_msgSend(v90, "distance");
      objc_msgSend(v85, "setCurrentStepLength:");

      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "getNextStep"));
      if (v86)
      {
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "_mapLayer"));
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "sceneConfiguration"));
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "getNextStep"));
        objc_msgSend(v81, "distance");
        objc_msgSend(v80, "setNextStepLength:");
        goto LABEL_50;
      }
    }
  }
LABEL_52:

}

- (void)navigationProvider:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  -[NavCameraController _updateForCurrentStepIndex](self, "_updateForCurrentStepIndex", a3, a4, a5);
}

- (void)navigationProvider:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  -[NavCameraController _updateForCurrentStepIndex](self, "_updateForCurrentStepIndex", a3, a4, a5);
}

- (void)navigationProvider:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "route", a4, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapLayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sceneConfiguration"));
  objc_msgSend(v11, "setDistanceToCurrentManeuver:", a4);

  objc_msgSend(v17, "remainingDistanceAlongRouteFromStepIndex:currentStepRemainingDistance:", a6, a4);
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_mapLayer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sceneConfiguration"));
  objc_msgSend(v16, "setDistanceToDestination:", v13);

}

- (void)navigationProvider:(id)a3 didUpdateRoute:(id)a4 traffic:(id)a5
{
  -[NavCameraController _updateWithNewRoute:](self, "_updateWithNewRoute:", a4);
}

- (void)_updateWithNewRoute:(id)a3
{
  NavCameraCaches *v4;
  NavCameraCaches *navCameraCaches;

  v4 = (NavCameraCaches *)objc_claimAutoreleasedReturnValue(+[NavCameraCaches cachesWithRoute:context:](NavCameraCaches, "cachesWithRoute:context:", a3, self->_navContext));
  navCameraCaches = self->_navCameraCaches;
  self->_navCameraCaches = v4;

  -[NavCameraController _updateState](self, "_updateState");
}

- (void)_updateForCurrentStepIndex
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
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
  id v25;
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
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController navigationProvider](self, "navigationProvider"));
  v4 = objc_msgSend(v3, "displayedStepIndex");

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController navigationProvider](self, "navigationProvider"));
    v4 = objc_msgSend(v5, "stepIndex");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController navigationProvider](self, "navigationProvider"));
  v76 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));

  v7 = v4 >= objc_msgSend(v76, "stepsCount");
  v8 = v76;
  if (!v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "stepAtIndex:", v4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_mapLayer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sceneConfiguration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getNextStep"));
    objc_msgSend(v13, "distance");
    objc_msgSend(v12, "setNextStepLength:");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_mapLayer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sceneConfiguration"));
    objc_msgSend(v9, "distance");
    objc_msgSend(v16, "setCurrentStepLength:");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_mapLayer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sceneConfiguration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoStep"));
    objc_msgSend(v19, "setCurrentManeuverJunctionsCount:", objc_msgSend(v20, "junctionElementsCount"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_mapLayer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sceneConfiguration"));
    objc_msgSend(v23, "setCurrentTransportationType:", objc_msgSend(v9, "transportType"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoStep"));
    v25 = objc_msgSend(v24, "maneuverType");

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "roadFeatureAtPointIndex:", objc_msgSend(v9, "startRouteCoordinate")));
    v27 = v26;
    if (v26)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "feature"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "attributes"));
      self->_currentLineType = objc_msgSend(v29, "lineType");

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "feature"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "attributes"));
      self->_currentRampType = objc_msgSend(v31, "rampType");

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "_mapLayer"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "sceneConfiguration"));
      objc_msgSend(v34, "setLineType:", self->_currentLineType);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "_mapLayer"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sceneConfiguration"));
      objc_msgSend(v37, "setRampType:", self->_currentRampType);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "_mapLayer"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "sceneConfiguration"));
      objc_msgSend(v40, "setDistanceToCurrentTrafficSection:", self->_distanceToCurrentTrafficSection);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "_mapLayer"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "sceneConfiguration"));
      objc_msgSend(v43, "setTrafficColor:", self->_currentTrafficColor);

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "_mapLayer"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "sceneConfiguration"));
      objc_msgSend(v46, "setLaneCount:", self->_laneCount);

    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transitStep"));
    if (objc_msgSend(v47, "hasManeuverType"))
      v48 = objc_msgSend(v47, "maneuverType");
    else
      v48 = 0;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "_mapLayer"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "sceneConfiguration"));
    objc_msgSend(v51, "setCurrentManeuverType:", v25);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "_mapLayer"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "sceneConfiguration"));
    objc_msgSend(v54, "setCurrentTransitManeuverType:", v48);

    v55 = objc_claimAutoreleasedReturnValue(-[NavCameraCaches stepsWithRampCache](self->_navCameraCaches, "stepsWithRampCache"));
    if (v55)
    {
      v56 = (void *)v55;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches stepsWithRampCache](self->_navCameraCaches, "stepsWithRampCache"));
      v58 = objc_msgSend(v57, "count");

      if (v4 < v58)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches stepsWithRampCache](self->_navCameraCaches, "stepsWithRampCache"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectAtIndexedSubscript:", v4));
        if (((unint64_t)objc_msgSend(v60, "integerValue") & 0x8000000000000000) != 0)
        {
          v63 = 0;
        }
        else
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches stepsWithRampCache](self->_navCameraCaches, "stepsWithRampCache"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectAtIndexedSubscript:", v4));
          v63 = objc_msgSend(v62, "integerValue");

        }
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "_mapLayer"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "sceneConfiguration"));
        objc_msgSend(v66, "setNextManeuverRampType:", v63);

      }
    }
    -[VKNavContext setCurrentStepIndex:](self->_navContext, "setCurrentStepIndex:", v4);
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches groupedManeuverCounts](self->_navCameraCaches, "groupedManeuverCounts"));
    v68 = objc_msgSend(v67, "count");

    if (v4 < v68)
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches groupedManeuverCounts](self->_navCameraCaches, "groupedManeuverCounts"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectAtIndexedSubscript:", v4));
      v71 = objc_msgSend(v70, "unsignedIntegerValue");

      if ((unint64_t)v71 >= 5)
        v72 = 5;
      else
        v72 = (uint64_t)v71;
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "_mapLayer"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "sceneConfiguration"));
      objc_msgSend(v75, "setCurrentGroupedManeuverCount:", v72);

    }
    v8 = v76;
  }

}

- (void)_updateCameraInfoStylesForRoute:(id)a3 routeCoordinate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSHashTable **p_activeCameraInfos;
  NSHashTable *activeCameraInfos;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *k;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *m;
  id v42;
  id v43;
  id v44;
  void *n;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *ii;
  void *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id *location;
  void *v61;
  id v62;
  id obj;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cameraInfos"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v86 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i);
        v14 = objc_msgSend(v13, "routeCoordinateRange");
        if (((uint64_t (*)(_QWORD, _QWORD, _QWORD))GEOPolylineCoordinateInRange)(a4, v14, v15))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    }
    while (v10);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mutableData"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "updateableCameraInfos"));

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v82;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v82 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)j);
        v23 = objc_msgSend(v22, "routeCoordinateRange");
        if (((uint64_t (*)(_QWORD, _QWORD, _QWORD))GEOPolylineCoordinateInRange)(a4, v23, v24))
          objc_msgSend(v7, "addObject:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
    }
    while (v19);
  }
  v61 = v6;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraController mapView](self, "mapView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_mapLayer"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sceneConfiguration"));

  activeCameraInfos = self->_activeCameraInfos;
  p_activeCameraInfos = &self->_activeCameraInfos;
  v30 = -[NSHashTable copy](activeCameraInfos, "copy");
  objc_msgSend(v30, "minusHashTable:", v7);
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v30;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v78;
    do
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(_QWORD *)v78 != v33)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)k);
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "styleAttributes"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "attributes"));

        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v74;
          do
          {
            for (m = 0; m != v39; m = (char *)m + 1)
            {
              if (*(_QWORD *)v74 != v40)
                objc_enumerationMutation(v37);
              objc_msgSend(v27, "removeStyleAttributeKey:", objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)m), "key"));
            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
          }
          while (v39);
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
    }
    while (v32);
  }

  v59 = v7;
  v42 = objc_msgSend(v7, "copy");
  location = (id *)p_activeCameraInfos;
  objc_msgSend(v42, "minusHashTable:", *p_activeCameraInfos);
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v62 = v42;
  v43 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
  if (v43)
  {
    v44 = v43;
    v64 = *(_QWORD *)v70;
    do
    {
      for (n = 0; n != v44; n = (char *)n + 1)
      {
        if (*(_QWORD *)v70 != v64)
          objc_enumerationMutation(v62);
        v46 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)n);
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "styleAttributes"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "attributes"));

        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v66;
          do
          {
            for (ii = 0; ii != v50; ii = (char *)ii + 1)
            {
              if (*(_QWORD *)v66 != v51)
                objc_enumerationMutation(v48);
              v53 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)ii);
              v54 = objc_msgSend(v53, "key");
              v55 = objc_msgSend(v53, "value");
              v56 = objc_msgSend(v46, "routeCoordinateRange");
              objc_msgSend(v27, "applyStyleAttributeKeyValue:withValue:withCoordinateRange:", v54, v55, v56, v57);
            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
          }
          while (v50);
        }

      }
      v44 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
    }
    while (v44);
  }

  if (objc_msgSend(v59, "count"))
    v58 = v59;
  else
    v58 = 0;
  objc_storeStrong(location, v58);

}

- (NavCameraNavigationProviding)overrideNavigationProvider
{
  return self->_overrideNavigationProvider;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (NavCameraNavigationProviding)navigationProvider
{
  return self->_navigationProvider;
}

- (void)setNavigationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_navigationProvider, a3);
}

- (MNTrafficIncidentAlert)trafficIncidentAlert
{
  return self->_trafficIncidentAlert;
}

- (NSArray)searchAlongTheRoutePoints
{
  return self->_searchAlongTheRoutePoints;
}

- (NSArray)vehiclePositions
{
  return self->_vehiclePositions;
}

- (void)setVehiclePositions:(id)a3
{
  objc_storeStrong((id *)&self->_vehiclePositions, a3);
}

- (NSArray)vehiclePositionPoints
{
  return self->_vehiclePositionPoints;
}

- (void)setVehiclePositionPoints:(id)a3
{
  objc_storeStrong((id *)&self->_vehiclePositionPoints, a3);
}

- (unint64_t)navCameraMode
{
  return self->_navCameraMode;
}

- (unint64_t)navigationDestination
{
  return self->_navigationDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehiclePositionPoints, 0);
  objc_storeStrong((id *)&self->_vehiclePositions, 0);
  objc_storeStrong((id *)&self->_searchAlongTheRoutePoints, 0);
  objc_storeStrong((id *)&self->_trafficIncidentAlert, 0);
  objc_storeStrong((id *)&self->_navigationProvider, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_overrideNavigationProvider, 0);
  objc_storeStrong((id *)&self->_originalNavigationProvider, 0);
  objc_storeStrong((id *)&self->_activeCameraInfos, 0);
  objc_storeStrong((id *)&self->_navCameraCaches, 0);
  objc_storeStrong((id *)&self->_navContext, 0);
}

@end
