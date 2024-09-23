@implementation GEOComposedRoute

- (NSArray)_maps_directionsWaypoints
{
  id AssociatedObject;
  void *v4;
  void *v5;
  id v6;

  AssociatedObject = objc_getAssociatedObject(self, &unk_1014D1F28);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
    v6 = sub_10039DCD4(v5, &stru_1011AF4B0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v6);

    objc_setAssociatedObject(self, &unk_1014D1F28, v4, (void *)1);
  }
  return (NSArray *)v4;
}

- (BOOL)_isStartWaypoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _maps_directionsWaypoints](self, "_maps_directionsWaypoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = objc_msgSend(v6, "isEqual:", v4);

  return v7;
}

- (BOOL)_isChargingWaypoint:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _maps_directionsWaypoints](self, "_maps_directionsWaypoints"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
  if (v6 >= objc_msgSend(v7, "count"))
  {
    v9 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v6));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chargingInfo"));
  v11 = v10 != 0;

  return v11;
}

- (void)_maps_refreshTrafficIncidentsOnRoute
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute traffic](self, "traffic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trafficIncidents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trafficIncidentOffsets"));
  v5 = objc_msgSend(v3, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
    if (objc_msgSend(v3, "count"))
    {
      v7 = 0;
      do
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v7));
        v10 = objc_msgSend(objc_alloc((Class)VKTrafficIncidentFeature), "initWithRouteIncident:routeOffsetInMeters:routeRelevance:onRoute:", v8, objc_msgSend(v9, "unsignedIntValue"), 3, self);
        objc_msgSend(v6, "addObject:", v10);

        ++v7;
      }
      while (v7 < (unint64_t)objc_msgSend(v3, "count"));
    }
    v11 = objc_msgSend(v6, "copy");
    objc_setAssociatedObject(self, &unk_1014D23C1, v11, (void *)1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _maps_trafficIncidentsObservers:](self, "_maps_trafficIncidentsObservers:", 0));
    objc_msgSend(v12, "composedRoute:didUpdateTrafficIncidentsOnRoute:", self, v11);

  }
}

- (NSArray)_maps_trafficIncidentsOnRoute
{
  id AssociatedObject;
  void *v4;
  id v5;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  void *v22;

  AssociatedObject = objc_getAssociatedObject(self, &unk_1014D23C1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (v4)
    return (NSArray *)v4;
  -[GEOComposedRoute _maps_refreshTrafficIncidentsOnRoute](self, "_maps_refreshTrafficIncidentsOnRoute");
  v5 = objc_getAssociatedObject(self, &unk_1014D23C1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v4)
    return (NSArray *)v4;
  v7 = sub_1004318FC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("trafficIncidentsOnRoute should be non-nil after forced refresh (empty permitted)")));
    v13 = 136316162;
    v14 = "-[GEOComposedRoute(TrafficIncidents) _maps_trafficIncidentsOnRoute]";
    v15 = 2080;
    v16 = "GEOComposedRoute+TrafficIncidents.m";
    v17 = 1024;
    v18 = 63;
    v19 = 2080;
    v20 = "trafficIncidentsOnRoute != nil";
    v21 = 2112;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v13, 0x30u);

  }
  if (sub_100A70734())
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);

    }
  }
  return (NSArray *)0;
}

- (id)_maps_trafficIncidentsObservers:(BOOL)a3
{
  _BOOL4 v3;
  id AssociatedObject;
  id v6;
  BOOL v7;

  v3 = a3;
  AssociatedObject = objc_getAssociatedObject(self, &unk_1014D23C2);
  v6 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (v6)
    v7 = 1;
  else
    v7 = !v3;
  if (!v7)
  {
    v6 = objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___GEOComposedRouteTrafficIncidentsObserver, &_dispatch_main_q);
    objc_setAssociatedObject(self, &unk_1014D23C2, v6, (void *)1);
  }
  return v6;
}

- (void)_maps_addTrafficIncidentsObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _maps_trafficIncidentsObservers:](self, "_maps_trafficIncidentsObservers:", 1));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)_maps_removeTrafficIncidentsObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _maps_trafficIncidentsObservers:](self, "_maps_trafficIncidentsObservers:", 0));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (void)updateWaypointStyleAttributesWithItemSource:(id)a3 personalizedItemManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  SearchResult *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];

  v6 = a3;
  v28 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "styleAttributesData"));

        if (!v15)
        {
          v16 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemMatchingLocation:", v16));
          if (v17)
            objc_msgSend(v8, "setObject:forKey:", v14, v17);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    v18 = sub_10043214C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134218242;
      v37 = v20;
      v38 = 2112;
      v39 = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Will attempt to find custom style attributes for %lu waypoints from item source: %@", buf, 0x16u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allItems"));
    if ((objc_msgSend(v28, "updateInProgress") & 1) != 0)
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "previousItems"));
    else
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allItems"));
    v23 = (void *)v22;
    v24 = sub_10043214C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v23, "count");
      *(_DWORD *)buf = 134217984;
      v37 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Received all personalized compound items: %lu", buf, 0xCu);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100407990;
    v29[3] = &unk_1011B54A8;
    v30 = v23;
    v31 = v8;
    v27 = v23;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v29);

  }
}

- (void)updateCustomRouteStartEndCaptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypointDisplayInfoForWaypoint:](self, "waypointDisplayInfoForWaypoint:", v10));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypointDisplayInfoForWaypoint:](self, "waypointDisplayInfoForWaypoint:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute anchorPoints](self, "anchorPoints"));
  v9 = objc_msgSend(v8, "startAndEndAreTheSame");

  if (v9)
  {
    objc_msgSend(v7, "_routeCreation_setStartEndWaypointCaption");
  }
  else
  {
    objc_msgSend(v6, "_routeCreation_setStartWaypointCaption");
    objc_msgSend(v7, "_routeCreation_setEndWaypointCaption");
  }

}

- (void)updateMyLocationAnchorNames
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isCurrentLocation"))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypointDisplayInfoForWaypoint:](self, "waypointDisplayInfoForWaypoint:", v8));
          objc_msgSend(v9, "_routeCreation_setMyLocationName");

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (unint64_t)mapType
{
  if (-[GEOComposedRoute transportType](self, "transportType") == 1)
    return 104;
  else
    return 0;
}

- (id)nextWaypoint
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 > 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self, "destination"));
  }
  return v5;
}

- (NSData)rideSelectionsAsNSData
{
  void *v3;
  size_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute rideSelections](self, "rideSelections"));
  v4 = 4 * (_QWORD)objc_msgSend(v3, "count");

  v5 = malloc_type_malloc(v4, 0x72753CCEuLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute rideSelections](self, "rideSelections"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10043C870;
  v8[3] = &unk_1011B6D38;
  v8[4] = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  return +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v5, v4, 1);
}

- (id)rapDestinationTitle
{
  void *v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self, "destination"));
  v4 = objc_msgSend(v3, "hasFindMyHandleID");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self, "destination"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrivingDisplayName"));
  }
  else
  {
    v7 = objc_alloc((Class)MKMapItem);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self, "destination"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItemStorage"));
    v5 = objc_msgSend(v7, "initWithGeoMapItem:isPlaceHolderPlace:", v9, 0);

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  }
  v10 = (void *)v6;

  return v10;
}

- (MNTraceRecordingData)_maps_traceRecordingData
{
  id AssociatedObject;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  AssociatedObject = objc_getAssociatedObject(self, &unk_1014D25C8);
  v4 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v4 = objc_alloc_init((Class)MNTraceRecordingData);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute routeInitializerData](self, "routeInitializerData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "directionsRequest"));
    objc_msgSend(v4, "setInitialDirectionsRequest:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute routeInitializerData](self, "routeInitializerData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionsResponse"));
    objc_msgSend(v4, "setInitialDirectionsResponse:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute userRequestedWaypoints](self, "userRequestedWaypoints"));
    objc_msgSend(v4, "setWaypoints:", v9);

    -[GEOComposedRoute _maps_setTraceRecordingData:](self, "_maps_setTraceRecordingData:", v4);
  }
  return (MNTraceRecordingData *)v4;
}

- (void)_maps_setTraceRecordingData:(id)a3
{
  objc_setAssociatedObject(self, &unk_1014D25C8, a3, (void *)1);
}

- (id)chargingStationInfos
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self, "legs", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chargingStationInfo"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chargingStationInfo"));
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isLegIndexOfLastLeg:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self, "legs"));
  LOBYTE(a3) = (char *)objc_msgSend(v4, "count") - 1 == (_BYTE *)a3;

  return a3;
}

- (GEOComposedRouteStep)startRouteStep
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  unsigned int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self, "steps", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoStep"));
        v8 = objc_msgSend(v7, "maneuverType");

        if (v8 == 17)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (GEOComposedRouteStep *)v3;
}

- (id)_signForWalkingStep:(id)a3
{
  id v4;
  void *v5;
  TransitSegmentSteppingModeSign *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute segmentForStepIndex:](self, "segmentForStepIndex:", objc_msgSend(v4, "stepIndex")));
  if (objc_msgSend(v4, "isArrivalStep"))
  {
    v6 = -[TransitSegmentSteppingModeSign initWithStep:stepIndexRange:]([TransitSegmentSteppingModeSign alloc], "initWithStep:stepIndexRange:", v4, objc_msgSend(v4, "stepIndex"), 1);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "steps"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    if (v8 == v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "steps"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));

      if (objc_msgSend(v10, "isArrivalStep"))
      {
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getPreviousStep"));

        v10 = (void *)v11;
      }
      v12 = objc_msgSend(v4, "stepIndex");
      v13 = objc_msgSend(v10, "stepIndex");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getPreviousStep"));
      v15 = v14;
      if (v14 && objc_msgSend(v14, "routeSegmentType") == (id)5)
      {
        v16 = v15;
        if (objc_msgSend(v16, "maneuver") == 8)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "transitInstructionInContext:", 1));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "majorInstructionStrings"));

          if (!v18)
            v12 = objc_msgSend(v16, "stepIndex");

        }
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getNextStep"));
      v20 = v19;
      if (v19 && objc_msgSend(v19, "routeSegmentType") == (id)5)
      {
        v21 = v20;
        if (objc_msgSend(v21, "maneuver") == 7)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "transitInstructionInContext:", 1));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "majorInstructionStrings"));

          if (!v23)
            v13 = objc_msgSend(v21, "stepIndex");

        }
      }
      v6 = -[TransitSegmentSteppingModeSign initWithWalkingSegment:stepIndexRange:]([TransitSegmentSteppingModeSign alloc], "initWithWalkingSegment:stepIndexRange:", v5, v12, v13 - v12 + 1);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)_signForTransitStationStep:(id)a3
{
  id v3;
  TransitSegmentSteppingModeSign *v4;

  v3 = a3;
  if (objc_msgSend(v3, "maneuver") - 6 > 2)
    v4 = 0;
  else
    v4 = -[TransitSegmentSteppingModeSign initWithStep:stepIndexRange:]([TransitSegmentSteppingModeSign alloc], "initWithStep:stepIndexRange:", v3, objc_msgSend(v3, "stepIndex"), 1);

  return v4;
}

- (id)_signForTransitTripStep:(id)a3
{
  id v4;
  unsigned int v5;
  void *v7;
  void *v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  TransitSegmentSteppingModeSign *v14;
  _BYTE *v15;
  _BYTE *v16;
  id v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "maneuver");
  if (v5 == 9 || v5 == 5)
  {
    if (objc_msgSend(v4, "maneuver") == 9)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getPreviousStep"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute segmentForStepIndex:](self, "segmentForStepIndex:", objc_msgSend(v7, "stepIndex")));
      v9 = (char *)objc_msgSend(v8, "startStepIndex");

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute segmentForStepIndex:](self, "segmentForStepIndex:", objc_msgSend(v4, "stepIndex")));
      v9 = (char *)objc_msgSend(v7, "startStepIndex") + 1;
    }

    v14 = -[TransitSegmentSteppingModeSign initWithStep:stepIndexRange:]([TransitSegmentSteppingModeSign alloc], "initWithStep:stepIndexRange:", v4, v9, (_BYTE *)objc_msgSend(v4, "stepIndex") - v9 + 1);
  }
  else if (v5 == 3)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getPreviousStep"));
    v11 = v10;
    if (v10)
    {
      v12 = v10;
      do
      {
        if (objc_msgSend(v12, "routeSegmentType") != (id)5)
          break;
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getPreviousStep"));

        v12 = (void *)v13;
      }
      while (v13);
    }
    else
    {
      v12 = 0;
    }
    v15 = objc_msgSend(v4, "stepIndex");
    v16 = objc_msgSend(v4, "stepIndex");
    if (v11 && objc_msgSend(v11, "routeSegmentType") == (id)5)
    {
      v17 = v11;
      if (objc_msgSend(v17, "maneuver") == 6)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "transitInstructionInContext:", 1));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "majorInstructionStrings"));

        if (!v19)
          v15 = objc_msgSend(v17, "stepIndex");

      }
    }
    v14 = -[TransitSegmentSteppingModeSign initWithStep:stepIndexRange:]([TransitSegmentSteppingModeSign alloc], "initWithStep:stepIndexRange:", v4, v15, v16 - v15 + 1);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSArray)steppingSigns
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BYTE *v16;
  _BYTE *v17;
  _BYTE *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute segments](self, "segments"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self, "steps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "routeSegmentType");
        if (v11 == (id)6)
        {
          v12 = objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _signForTransitTripStep:](self, "_signForTransitTripStep:", v10));
          goto LABEL_12;
        }
        if (v11 == (id)5)
        {
          v12 = objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _signForTransitStationStep:](self, "_signForTransitStationStep:", v10));
          goto LABEL_12;
        }
        if (v11 == (id)2)
        {
          v12 = objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _signForWalkingStep:](self, "_signForWalkingStep:", v10));
LABEL_12:
          v13 = (void *)v12;
          goto LABEL_14;
        }
        v13 = 0;
LABEL_14:
        if (objc_msgSend(v13, "hasValidInstructions"))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
          v15 = v14;
          if (v14)
          {
            v16 = objc_msgSend(v14, "stepIndexRange");
            v18 = v17;
          }
          else
          {
            v16 = 0;
            v18 = 0;
          }
          if ((_BYTE *)((_BYTE *)objc_msgSend(v13, "stepIndexRange") - v16) != v18)
          {
            objc_msgSend(v13, "stepIndexRange");
            objc_msgSend(v13, "setStepIndexRange:");
          }
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (id)waypointsAfterStepIndex:(unint64_t)a3
{
  return -[GEOComposedRoute waypointsAfterStepIndex:legIndex:](self, "waypointsAfterStepIndex:legIndex:", a3, 0);
}

- (id)waypointsAfterStepIndex:(unint64_t)a3 legIndex:(unint64_t *)a4
{
  NSMutableArray *v7;
  char *v8;
  void *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;

  v7 = objc_opt_new(NSMutableArray);
  v8 = (char *)-[GEOComposedRoute legIndexForStepIndex:](self, "legIndexForStepIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self, "legs"));
  v10 = (char *)objc_msgSend(v9, "count");

  if (v8 < v10)
  {
    v11 = v8;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self, "legs"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v11));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "destination"));
      -[NSMutableArray addObject:](v7, "addObject:", v14);

      ++v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self, "legs"));
      v16 = (char *)objc_msgSend(v15, "count");

    }
    while (v11 < v16);
  }
  if (a4)
    *a4 = (unint64_t)v8;
  return v7;
}

- (unsigned)tollCurrencyType
{
  unsigned __int8 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((-[GEOComposedRoute avoidsTolls](self, "avoidsTolls") & 1) != 0)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", NSLocaleCurrencySymbol));
  if (qword_1014D2798 != -1)
    dispatch_once(&qword_1014D2798, &stru_1011BA1D8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2790, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
    v2 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v2 = 1;

  return v2;
}

- (id)combinedDescriptionForFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  NSAttributedStringKey v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute routeDescriptions](self, "routeDescriptions"));
  if (objc_msgSend(v5, "count"))
  {
    if (v4)
    {
      v19 = NSFontAttributeName;
      v20 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    }
    else
    {
      v6 = 0;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:", v8, v6));

    v10 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v9);
    v11 = objc_alloc((Class)NSAttributedString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR(" · [Route description delimiter]"), CFSTR("localized string not found"), 0));
    v14 = objc_msgSend(v11, "initWithString:", v13);

    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v15 = 1;
      do
      {
        objc_msgSend(v10, "appendAttributedString:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:", v16, v6));
        objc_msgSend(v10, "appendAttributedString:", v17);

        ++v15;
      }
      while (v15 < (unint64_t)objc_msgSend(v5, "count"));
    }
    v7 = objc_msgSend(v10, "copy");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)shareETAWaypointContacts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];

  if (+[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSuggestionsCache sharedInstance](SharedTripSuggestionsCache, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestedContacts"));

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contact"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          objc_msgSend(v3, "setObject:forKey:", v10, v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v7);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "meCard"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "findMyHandle"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contact"));

          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "findMyHandle"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contact"));

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "findMyHandle"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
          }
          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addressBookAddress"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "contact"));

            if (!v26)
            {
              v24 = 0;
              goto LABEL_27;
            }
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addressBookAddress"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contact"));
            v26 = 0;
          }

          if (v24)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
            v29 = objc_msgSend(v28, "isEqualToString:", v38);

            if ((v29 & 1) == 0)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
              v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v30));

              if (v31)
                goto LABEL_26;
              if (!v26)
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addressBookAddress"));
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "contact"));
                v33 = v13;
                v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripContact contactsFromCNContact:](MSPSharedTripContact, "contactsFromCNContact:", v32));
                v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "firstObject"));

                v13 = v33;
                if (!v31)
                  goto LABEL_27;
LABEL_26:
                objc_msgSend(v13, "addObject:", v31);

                goto LABEL_27;
              }
              v31 = objc_msgSend(objc_alloc((Class)MSPSharedTripContact), "initWithContact:handle:", v24, v26);
              if (v31)
                goto LABEL_26;
            }
          }
LABEL_27:

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v17);
    }

  }
  else
  {
    v13 = 0;
  }
  return (NSArray *)v13;
}

- (id)arrivalInstructionStringForStepIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self, "steps"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315906;
      v19 = "-[GEOComposedRoute(NavExtras) arrivalInstructionStringForStepIndex:]";
      v20 = 2080;
      v21 = "GEOComposedRoute+NavExtras.m";
      v22 = 1024;
      v23 = 73;
      v24 = 2080;
      v25 = "stepIndex < self.steps.count";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v18, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v18 = 138412290;
        v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);

      }
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self, "steps"));
  v8 = objc_msgSend(v7, "count");

  if ((unint64_t)v8 <= a3)
  {
    v11 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self, "steps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", a3));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _arrivalInstructionStringForStep:](self, "_arrivalInstructionStringForStep:", v10));
  }
  return v11;
}

- (id)arrivalInstructionStringForLegIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self, "legs"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315906;
      v19 = "-[GEOComposedRoute(NavExtras) arrivalInstructionStringForLegIndex:]";
      v20 = 2080;
      v21 = "GEOComposedRoute+NavExtras.m";
      v22 = 1024;
      v23 = 83;
      v24 = 2080;
      v25 = "legIndex < self.legs.count";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v18, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v18 = 138412290;
        v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);

      }
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self, "legs"));
  v8 = objc_msgSend(v7, "count");

  if ((unint64_t)v8 <= a3)
  {
    v11 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self, "legs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", a3));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute arrivalInstructionStringForStepIndex:](self, "arrivalInstructionStringForStepIndex:", objc_msgSend(v10, "endStepIndex")));
  }
  return v11;
}

- (id)_arrivalInstructionStringForStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RouteStepManeuverItem *v8;
  RouteStepManeuverItem *v9;
  id v10;
  RouteStepManeuverItem *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waypoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "findMyHandleID"));
  if (v6)
  {

LABEL_4:
    v8 = (RouteStepManeuverItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrivingDisplayName"));
    goto LABEL_5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addressBookAddress"));

  if (v7)
    goto LABEL_4;
  if (objc_msgSend(v4, "maneuverType") - 33 <= 1)
  {
    v12 = [RouteStepManeuverItem alloc];
    v13 = objc_opt_class(self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RouteStepListMetrics navSignMetrics](RouteStepListMetrics, "navSignMetrics"));
    LOBYTE(v17) = 0;
    v9 = -[RouteStepManeuverItem initWithRouteStep:cellClass:state:metrics:context:route:scale:isMissedStep:](v12, "initWithRouteStep:cellClass:state:metrics:context:route:scale:isMissedStep:", v4, v13, 1, v14, 1, self, 0.0, v17);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem secondaryText](v9, "secondaryText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "string"));
    v10 = objc_msgSend(v16, "copy");

    goto LABEL_6;
  }
  v8 = (RouteStepManeuverItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navDisplayName"));
LABEL_5:
  v9 = v8;
  v10 = -[RouteStepManeuverItem copy](v8, "copy");
LABEL_6:

  return v10;
}

- (NSArray)transitLinesOnRoute
{
  id AssociatedObject;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  AssociatedObject = objc_getAssociatedObject(self, off_1014AF9E8);
  v4 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[GEOComposedRoute stepsCount](self, "stepsCount"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute segments](self, "segments", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
          v11 = objc_opt_class(GEOComposedTransitTripRouteSegment);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v12 = v10;
            if (objc_msgSend(v12, "rideOptionsCount"))
            {
              v13 = 0;
              do
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transitLineForRideOption:", v13));
                objc_msgSend(v4, "addObject:", v14);

                ++v13;
              }
              while (v13 < (unint64_t)objc_msgSend(v12, "rideOptionsCount"));
            }

          }
          v9 = (char *)v9 + 1;
        }
        while (v9 != v7);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_setAssociatedObject(self, off_1014AF9E8, v4, (void *)1);
  }
  return (NSArray *)v4;
}

- (NSDate)transitRouteArrivalDate
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute startDate](self, "startDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", (double)-[GEOComposedRoute expectedTime](self, "expectedTime")));

  return (NSDate *)v4;
}

- (RouteCollection)_maps_routeCollection
{
  return (RouteCollection *)objc_getAssociatedObject(self, &unk_1014D2D20);
}

- (void)_maps_routeCollectionOnly_Clear
{
  objc_setAssociatedObject(self, &unk_1014D2D20, 0, 0);
}

- (void)_maps_routeCollectionOnly_setRouteCollectionWhenNil:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _maps_routeCollection](self, "_maps_routeCollection"));
  if (!v4)
    objc_setAssociatedObject(self, &unk_1014D2D20, value, 0);

}

- (unint64_t)_maps_routeIndex
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _maps_routeCollection](self, "_maps_routeCollection"));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "indexOfRoute:", self);
  else
    v5 = -[GEOComposedRoute indexInResponse](self, "indexInResponse");
  v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)hasArrivalStorefrontGeometry
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self, "legs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destinationDisplayInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arInfo"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storefrontFaceGeometrys"));
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)arrivalStorefrontLocation
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self, "legs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destinationDisplayInfo"));
  objc_msgSend(v4, "position");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (id)advisoriesStyleAttributes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute routeLabelArtwork](self, "routeLabelArtwork"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iconDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "styleAttributes"));

  return v4;
}

- (GEOComposedRouteAdvisory)clickableAdvisory
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute advisories](self, "advisories"));
  v3 = sub_10039E080(v2, &stru_1011D97A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  return (GEOComposedRouteAdvisory *)v5;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_maps_boundingMapRect
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute boundingMapRegion](self, "boundingMapRegion"));
  v4 = GEOMapRectForMapRegion(v2, v3);
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.var1.var1 = v14;
  result.var1.var0 = v13;
  result.var0.var1 = v12;
  result.var0.var0 = v11;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_maps_boundingRectForStep:(id)a3
{
  id v4;
  double x;
  double v6;
  double y;
  double v8;
  double width;
  double v10;
  double height;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v4 = a3;
  if (objc_msgSend(v4, "stepIndex") == (id)0x7FFFFFFFFFFFFFFFLL
    || (v16 = 0,
        v17 = 0,
        -[GEOComposedRoute _maps_getMapPoints:count:forStep:](self, "_maps_getMapPoints:count:forStep:", &v16, &v17, v4),
        !v17))
  {
    x = MKMapRectNull.origin.x;
    y = MKMapRectNull.origin.y;
    width = MKMapRectNull.size.width;
    height = MKMapRectNull.size.height;
  }
  else
  {
    x = MKMapRectBoundingMapPoints(v16, objc_msgSend(v4, "pointCount"));
    y = v6;
    width = v8;
    height = v10;
    free(v16);
  }

  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.var1.var1 = v15;
  result.var1.var0 = v14;
  result.var0.var1 = v13;
  result.var0.var0 = v12;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_maps_boundingRectForStep:(id)a3 fromPoint:(unint64_t)a4
{
  id v6;
  void *v7;
  double x;
  double v9;
  double y;
  double v11;
  double width;
  double v13;
  double height;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    NSLog(CFSTR("Error, Route:boundingRectForStep called with nil step"));
LABEL_12:
    x = MKMapRectNull.origin.x;
    y = MKMapRectNull.origin.y;
    width = MKMapRectNull.size.width;
    height = MKMapRectNull.size.height;
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "stepIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  if (objc_msgSend(v7, "startPointIndex") > a4 || objc_msgSend(v7, "endPointIndex") < a4)
  {
    NSLog(CFSTR("Error, Route:boundingRectForStep called with invalid startPointIndex"));
    if (objc_msgSend(v7, "startPointIndex") >= a4)
      a4 = objc_msgSend(v7, "startPointIndex");
    if (a4 >= objc_msgSend(v7, "endPointIndex"))
      a4 = objc_msgSend(v7, "endPointIndex");
  }
  v20 = 0;
  -[GEOComposedRoute _getMapPoints:count:startIndex:limit:](self, "_getMapPoints:count:startIndex:limit:", &v19, &v20, a4, objc_msgSend(v7, "pointCount", 0) - a4 + objc_msgSend(v7, "startPointIndex"));
  if (!v20)
    goto LABEL_12;
  x = MKMapRectBoundingMapPoints(v19, v20);
  y = v9;
  width = v11;
  height = v13;
  free(v19);
LABEL_13:

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.var1.var1 = v18;
  result.var1.var0 = v17;
  result.var0.var1 = v16;
  result.var0.var0 = v15;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_maps_closestMapPointToMapPoint:(id)a3
{
  double var1;
  double var0;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  unint64_t v17;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  var1 = a3.var1;
  var0 = a3.var0;
  v16 = 0;
  v17 = 0;
  v5 = -[GEOComposedRoute _maps_getMapPoints:count:](self, "_maps_getMapPoints:count:", &v16, &v17);
  if (v17)
  {
    if (v17 == 1)
    {
      v6 = 9.22337204e18;
      v7 = 9.22337204e18;
    }
    else
    {
      v8 = 0;
      v9 = INFINITY;
      v7 = 9.22337204e18;
      v10 = 1;
      v6 = 9.22337204e18;
      do
      {
        v11 = MKClosestMapPointInLineSegmentFromMapPoint(v5, *(double *)((char *)v16 + v8), *(double *)((char *)v16 + v8 + 8), *(double *)((char *)v16 + v8 + 16), *(double *)((char *)v16 + v8 + 24), var0, var1);
        v13 = (var1 - v12) * (var1 - v12);
        if (v13 + (var0 - v11) * (var0 - v11) < v9)
        {
          v9 = v13 + (var0 - v11) * (var0 - v11);
          v6 = v12;
          v7 = v11;
        }
        ++v10;
        v8 += 16;
      }
      while (v10 < v17);
    }
    free(v16);
  }
  else
  {
    v6 = -1.0;
    v7 = -1.0;
  }
  v14 = v7;
  v15 = v6;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)_maps_getMapPoints:(id *)a3 count:(unint64_t *)a4
{
  -[GEOComposedRoute _getMapPoints:count:startIndex:limit:](self, "_getMapPoints:count:startIndex:limit:", a3, a4, 0, -[GEOComposedRoute pointCount](self, "pointCount"));
}

- (void)_maps_getMapPoints:(id *)a3 count:(unint64_t *)a4 forStep:(id)a5
{
  id v8;
  uint64_t v9;
  unsigned int v10;

  v8 = a5;
  v9 = objc_msgSend(v8, "startPointIndex");
  v10 = objc_msgSend(v8, "pointCount");

  -[GEOComposedRoute _getMapPoints:count:startIndex:limit:](self, "_getMapPoints:count:startIndex:limit:", a3, a4, v9, v10);
}

- (void)_getMapPoints:(id *)a3 count:(unint64_t *)a4 startIndex:(unint64_t)a5 limit:(unint64_t)a6
{
  unint64_t v8;
  unint64_t v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  unint64_t v14;
  char *v15;
  CLLocationCoordinate2D v16;

  if (!a3 || !a6 || (v8 = a5, -[GEOComposedRoute pointCount](self, "pointCount") <= a5))
  {
    if (!a4)
      return;
    v14 = 0;
    goto LABEL_13;
  }
  v11 = a6 + v8;
  if (a6 + v8 >= -[GEOComposedRoute pointCount](self, "pointCount"))
    v11 = -[GEOComposedRoute pointCount](self, "pointCount");
  v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(16 * (v11 - v8), 0x1000040451B5BE8uLL);
  v13 = v12;
  v14 = v11 - v8;
  if (v11 > v8)
  {
    v15 = (char *)v12 + 8;
    do
    {
      -[GEOComposedRoute _mkCoordAt:](self, "_mkCoordAt:", v8);
      *(MKMapPoint *)(v15 - 8) = MKMapPointForCoordinate(v16);
      ++v8;
      v15 += 16;
    }
    while (v11 != v8);
  }
  *a3 = v13;
  if (a4)
LABEL_13:
    *a4 = v14;
}

- (CLLocationCoordinate2D)_mkCoordAt:(unsigned int)a3
{
  CLLocationDegrees v3;
  CLLocationDegrees v4;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v7;
  CLLocationCoordinate2D result;

  -[GEOComposedRoute pointAt:](self, "pointAt:", a3);
  v7 = CLLocationCoordinate2DMake(v3, v4);
  longitude = v7.longitude;
  latitude = v7.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (id)distanceAndElevationString
{
  double v3;
  double v4;
  void *v5;
  id v6;
  void *v7;

  -[GEOComposedRoute distance](self, "distance");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self, "elevationProfile"));
  v6 = sub_10090091C(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)timeAndElevationDescriptionStringWithAttributes:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute previewDurationString](self, "previewDurationString"));
  -[GEOComposedRoute travelAndChargingDuration](self, "travelAndChargingDuration");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self, "elevationProfile"));
  v9 = sub_100900648(v5, v8, v4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)timeStringWithAttributes:(id)a3
{
  id v4;
  double v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (double)-[GEOComposedRoute expectedTime](self, "expectedTime");
  v6 = v4;
  v7 = GEOStringForDuration(2, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v8, v6);

  return v9;
}

- (id)bookmarkRepresentation
{
  SyncedBookmarkRepr *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  SearchResult *v7;
  SearchResult *v8;
  SearchResult *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  SearchResult *v15;
  SearchResult *v16;
  SearchResult *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init(SyncedBookmarkRepr);
  -[SyncedBookmarkRepr setType:](v3, "setType:", 4);
  v4 = -[GEOComposedRoute transportType](self, "transportType");
  if (v4 <= 4)
    -[SyncedBookmarkRepr setDirectionsMode:](v3, "setDirectionsMode:", dword_100E3CAD8[v4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute origin](self, "origin"));
  v6 = objc_msgSend(v5, "isCurrentLocation");

  if (v6)
  {
    v7 = (SearchResult *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    v8 = v7;
  }
  else
  {
    v9 = [SearchResult alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute origin](self, "origin"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geoMapItem"));
    v8 = -[SearchResult initWithGEOMapItem:](v9, "initWithGEOMapItem:", v11);

    if (!v8)
      goto LABEL_8;
    v7 = v8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult bookmarkRepresentation](v7, "bookmarkRepresentation"));
  -[SyncedBookmarkRepr addPlaces:](v3, "addPlaces:", v12);

LABEL_8:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self, "destination"));
  v14 = objc_msgSend(v13, "isCurrentLocation");

  if (v14)
  {
    v15 = (SearchResult *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    v16 = v15;
LABEL_12:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult bookmarkRepresentation](v15, "bookmarkRepresentation"));
    -[SyncedBookmarkRepr addPlaces:](v3, "addPlaces:", v20);

    goto LABEL_13;
  }
  v17 = [SearchResult alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self, "destination"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "geoMapItem"));
  v16 = -[SearchResult initWithGEOMapItem:](v17, "initWithGEOMapItem:", v19);

  if (v16)
  {
    v15 = v16;
    goto LABEL_12;
  }
LABEL_13:

  return v3;
}

+ (id)_maps_composedRouteWithPersistentData:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)GEORouteBuilder_PersistentData), "initWithPersistentData:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buildRoute"));
  objc_msgSend(v5, "updateCustomRouteStartEndCaptions");

  return v5;
}

- (id)_maps_convertToNavigableRouteWithTraits:(id)a3 errorHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  GEOMapServiceTraits *v17;
  GEOMapItemClientAttributes *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  GEOComposedRoute *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new(MNRouteEditorRequest);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEORouteAttributes defaultRouteAttributesForTransportType:](GEORouteAttributes, "defaultRouteAttributesForTransportType:", -[GEOComposedRoute transportType](self, "transportType")));
  if (+[PedestrianARSessionTask isPedestrianARModeSupported](PedestrianARSessionTask, "isPedestrianARModeSupported"))
  {
    v13 = objc_opt_new(GEOCommonOptions);
    -[NSObject setSupportsArMode:](v13, "setSupportsArMode:", 1);
    objc_msgSend(v11, "setCommonOptions:", v13);
    v14 = sub_100431C0C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v27 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Marking route request with supportsArMode", buf, 0xCu);
    }

  }
  else
  {
    v16 = sub_100431C0C();
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v27 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] NOT marking route request with supportsArMode", buf, 0xCu);
    }
  }

  objc_msgSend(v11, "setRouteAttributes:", v12);
  if (v8)
  {
    objc_msgSend(v11, "setTraits:", v8);
  }
  else
  {
    v17 = objc_opt_new(GEOMapServiceTraits);
    objc_msgSend(v11, "setTraits:", v17);

  }
  v18 = objc_opt_new(GEOMapItemClientAttributes);
  objc_msgSend(v11, "setClientAttributes:", v18);

  objc_msgSend(v11, "setCurrentRoute:", self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100972CA4;
  v23[3] = &unk_1011DCFB0;
  v24 = v9;
  v25 = v10;
  v19 = v10;
  v20 = v9;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MNRouteEditor convertToNavigableRoute:finishedHandler:](MNRouteEditor, "convertToNavigableRoute:finishedHandler:", v11, v23));

  return v21;
}

- (unint64_t)suggestedNavigationModeForLocation:(id)a3 context:(unint64_t)a4
{
  return -[GEOComposedRoute suggestedNavigationModeForLocation:context:ignoreDeviceNavigability:](self, "suggestedNavigationModeForLocation:context:ignoreDeviceNavigability:", a3, a4, 0);
}

- (unint64_t)suggestedNavigationModeForLocation:(id)a3 context:(unint64_t)a4 ignoreDeviceNavigability:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)MNSuggestedNavigationModeFinder), "initWithRoute:context:ignoreDeviceNavigability:", self, a4, v5);
  v10 = objc_msgSend(v9, "suggestedNavigationModeForLocation:", v8);

  return (unint64_t)v10;
}

- (NSArray)composedGuidanceEventsWithSignGuidance
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute composedGuidanceEvents](self, "composedGuidanceEvents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011E1CE0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "filteredArrayUsingPredicate:", v3));

  return (NSArray *)v4;
}

- (NSArray)composedGuidanceEventsWithLaneGuidance
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute composedGuidanceEvents](self, "composedGuidanceEvents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011E1D00));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "filteredArrayUsingPredicate:", v3));

  return (NSArray *)v4;
}

- (id)nextLaneGuidanceEventAfterEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  uint64_t v8;
  void *i;
  id v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute composedGuidanceEvents](self, "composedGuidanceEvents", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((v7 & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "lanes"));
          v12 = objc_msgSend(v11, "count");

          if (v12)
          {
            v6 = v10;
            goto LABEL_12;
          }
        }
        v7 |= v10 == v4;
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)shouldReturnToRoutePickerWhenEndingDirectionsAtStepIndex:(unint64_t)a3
{
  BOOL v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;

  if ((-[GEOComposedRoute isWalkingOnlyTransitRoute](self, "isWalkingOnlyTransitRoute") & 1) != 0)
    return 1;
  if (-[GEOComposedRoute transportType](self, "transportType") != 1)
    return 0;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v7 = objc_msgSend(v6, "isTrackingCurrentLocation");

  if (!v7)
    return 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self, "steps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextAlightingStep"));

  v5 = (unint64_t)objc_msgSend(v10, "stepIndex") >= a3;
  return v5;
}

- (NSString)abbreviatedDistance
{
  double v3;
  void *v4;
  double v5;

  -[GEOComposedRoute distance](self, "distance");
  if (v3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[GEOComposedRoute distance](self, "distance");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _mapkit_localizedDistanceStringWithMeters:abbreviated:](NSString, "_mapkit_localizedDistanceStringWithMeters:abbreviated:", v5, 1));
  }
  return (NSString *)v4;
}

- (NSString)expandedTravelTime
{
  double v3;
  void *v4;
  double v5;

  -[GEOComposedRoute travelAndChargingDuration](self, "travelAndChargingDuration");
  if (v3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[GEOComposedRoute travelAndChargingDuration](self, "travelAndChargingDuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:abbreviated:](NSString, "_navigation_stringWithSeconds:abbreviated:", v5, 0));
  }
  return (NSString *)v4;
}

- (NSString)accessibilityExpandedDistance
{
  double v3;
  void *v4;
  double v5;

  -[GEOComposedRoute distance](self, "distance");
  if (v3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[GEOComposedRoute distance](self, "distance");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _mapkit_voiceOverLocalizedDistanceStringWithMeters:](NSString, "_mapkit_voiceOverLocalizedDistanceStringWithMeters:", v5));
  }
  return (NSString *)v4;
}

- (NSString)expandedDistance
{
  double v3;
  void *v4;
  double v5;

  -[GEOComposedRoute distance](self, "distance");
  if (v3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[GEOComposedRoute distance](self, "distance");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _mapkit_localizedDistanceStringWithMeters:abbreviated:](NSString, "_mapkit_localizedDistanceStringWithMeters:abbreviated:", v5, 0));
  }
  return (NSString *)v4;
}

- (NSString)clientPickingDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute abbreviatedDistance](self, "abbreviatedDistance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute name](self, "name"));
  if (objc_msgSend(v3, "length") && objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WalkingDrivingRoute_SecondaryTextFormat"), CFSTR("localized string not found"), 0));
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3, v4));

  }
  else
  {
    if (objc_msgSend(v3, "length"))
      v8 = v3;
    else
      v8 = v4;
    v7 = v8;
  }

  return (NSString *)v7;
}

- (GuidanceETA)guidanceETA
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GuidanceETA *v12;

  -[GEOComposedRoute distance](self, "distance");
  v4 = v3;
  -[GEOComposedRoute travelAndChargingDuration](self, "travelAndChargingDuration");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self, "destination"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timezone"));

  if (-[GEOComposedRoute isEVRoute](self, "isEVRoute"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute lastEVStep](self, "lastEVStep"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "evInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "remainingBatteryPercentage")));

  }
  else
  {
    v11 = 0;
  }
  v12 = -[GuidanceETA initWithRemainingTime:remainingDistance:arrivalBatteryCharge:destinationTimeZone:transportType:]([GuidanceETA alloc], "initWithRemainingTime:remainingDistance:arrivalBatteryCharge:destinationTimeZone:transportType:", v11, v8, -[GEOComposedRoute transportType](self, "transportType"), v6, v4);

  return v12;
}

- (BOOL)_maps_isEqualToComposedRoute:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v14;
  unsigned __int8 v15;

  v4 = a3;
  v5 = objc_opt_class(self);
  if (v5 == objc_opt_class(v4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueRouteID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID"));
    if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rideSelections"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute rideSelections](self, "rideSelections"));
      v11 = v9;
      v12 = v10;
      if (!(v11 | v12))
      {
        v6 = 1;
LABEL_8:

        goto LABEL_9;
      }
      v14 = (void *)v12;
      v15 = objc_msgSend((id)v11, "isEqual:", v12);

      if ((v15 & 1) != 0)
      {
        v6 = 1;
        goto LABEL_9;
      }
    }
    else
    {

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "segments"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute segments](self, "segments"));
    v6 = objc_msgSend(v7, "isEqualToArray:", v8);
    goto LABEL_8;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (TransitDirectionsStepsListDataProvider)transitDirectionsStepsListDataProvider
{
  id AssociatedObject;
  TransitDirectionsStepsListDataProvider *v4;

  if (-[GEOComposedRoute transportType](self, "transportType") == 1
    || -[GEOComposedRoute isWalkingOnlyTransitRoute](self, "isWalkingOnlyTransitRoute"))
  {
    AssociatedObject = objc_getAssociatedObject(self, &unk_1014D4450);
    v4 = (TransitDirectionsStepsListDataProvider *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    if (!v4)
    {
      v4 = -[TransitDirectionsStepsListDataProvider initWithRoute:forGuidance:]([TransitDirectionsStepsListDataProvider alloc], "initWithRoute:forGuidance:", self, 0);
      objc_setAssociatedObject(self, &unk_1014D4450, v4, (void *)1);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)carplayDestinationHandoffRequired
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  if (objc_msgSend(v3, "isCurrentlyConnectedToCarAppScene"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    if (objc_msgSend(v4, "isNavigationAidedDrivingEnabled"))
      v5 = -[GEOComposedRoute transportType](self, "transportType") == 0;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_maps_routeRequestStorage
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
  v5 = objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "setWaypoints:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute persistentData](self, "persistentData"));
  objc_msgSend(v3, "setDestinationRouteData:", v6);

  objc_msgSend(v3, "setTransportType:", -[GEOComposedRoute transportType](self, "transportType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute routeAttributes](self, "routeAttributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "automobileOptions"));
  objc_msgSend(v3, "setAutomobileOptions:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "walkingOptions"));
  objc_msgSend(v3, "setWalkingOptions:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitOptions"));
  objc_msgSend(v3, "setTransitOptions:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cyclingOptions"));
  objc_msgSend(v3, "setCyclingOptions:", v11);

  return v3;
}

@end
