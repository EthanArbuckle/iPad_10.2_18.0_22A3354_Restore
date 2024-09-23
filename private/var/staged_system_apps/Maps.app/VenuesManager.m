@implementation VenuesManager

- (VenuesManager)initWithActionCoordinator:(id)a3 mapView:(id)a4 userLocationView:(id)a5
{
  id v8;
  id v9;
  id v10;
  VenuesManager *v11;
  VenuesManager *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *visitedVenues;
  uint64_t v15;
  NSHashTable *changeObservers;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VenuesManager;
  v11 = -[VenuesManager init](&v19, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_actionCoordinator, v8);
    objc_storeWeak((id *)&v12->_mapView, v9);
    objc_storeWeak((id *)&v12->_userLocationView, v10);
    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    visitedVenues = v12->_visitedVenues;
    v12->_visitedVenues = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    changeObservers = v12->_changeObservers;
    v12->_changeObservers = (NSHashTable *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v12, "_containerWillPresentContainee:", CFSTR("ContainerWillPresentContaineeNotification"), 0);

  }
  return v12;
}

- (VenuesManager)init
{

  return 0;
}

- (void)addChangeObserver:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSHashTable containsObject:](self->_changeObservers, "containsObject:", v4);
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      -[NSHashTable addObject:](self->_changeObservers, "addObject:", v6);
      v4 = v6;
    }
  }

}

- (void)removeChangeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_changeObservers, "removeObject:", a3);
}

- (void)notifyChangeObservers
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueBuildingWithFocus](self, "venueBuildingWithFocus"));
  v5 = -[VenuesManager floorOrdinalWithFocus](self, "floorOrdinalWithFocus");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[NSHashTable copy](self->_changeObservers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "didChangeFocusedVenue:focusedBuilding:displayedFloorOrdinal:", v3, v4, v5);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)scheduleEviction
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager visitedVenuesEvictionTimer](self, "visitedVenuesEvictionTimer"));
  v4 = objc_msgSend(v3, "isValid");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "visitedVenuesEvictionTimerFired:", 0, 0, 86400.0));
    -[VenuesManager setVisitedVenuesEvictionTimer:](self, "setVisitedVenuesEvictionTimer:", v5);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[VenuesManager visitedVenuesEvictionTimer](self, "visitedVenuesEvictionTimer"));
    objc_msgSend(v6, "setTolerance:", 8640.0);

  }
}

- (void)recordVenueVisitWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager visitedVenues](self, "visitedVenues"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v4);

  -[VenuesManager scheduleEviction](self, "scheduleEviction");
}

- (void)visitedVenuesEvictionTimerFired:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager visitedVenues](self, "visitedVenues", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keysOfEntriesPassingTest:", &stru_1011DEDF0));

  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager visitedVenues](self, "visitedVenues"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    objc_msgSend(v6, "removeObjectsForKeys:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager visitedVenues](self, "visitedVenues"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009E854C;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (VKVenueFeatureMarker)venueWithFocus
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "venueWithFocus"));

  return (VKVenueFeatureMarker *)v3;
}

- (VKVenueBuildingFeatureMarker)venueBuildingWithFocus
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "venueBuildingWithFocus"));

  return (VKVenueBuildingFeatureMarker *)v3;
}

- (signed)floorOrdinalWithFocus
{
  VenuesManager *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));
  LOWORD(v2) = -[VenuesManager displayedFloorOrdinalForBuildingsInVenue:](v2, "displayedFloorOrdinalForBuildingsInVenue:", v3);

  return (__int16)v2;
}

- (void)setDisplayedFloorOrdinal:(signed __int16)a3 forBuildingsInVenue:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  objc_msgSend(v7, "setDisplayedFloorOrdinal:forBuildingsInVenue:", v4, v6);

}

- (signed)displayedFloorOrdinalForBuildingsInVenue:(id)a3
{
  id v4;
  void *v5;
  signed __int16 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  v6 = (unsigned __int16)objc_msgSend(v5, "displayedFloorOrdinalForBuildingsInVenue:", v4);

  return v6;
}

- (id)venueFeatureMarkerAtCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v5;
  void *v6;
  void *v7;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapLayer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venueAtLocation:withMarginForError:", 0, latitude, longitude));

  return v7;
}

- (BOOL)isUserAtSameVenueAsMapItem:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_venueInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueIdentifier"));
  LOBYTE(self) = -[VenuesManager isUserAtVenueWithID:](self, "isUserAtVenueWithID:", objc_msgSend(v5, "venueID"));

  return (char)self;
}

- (BOOL)isUserAtSameVenueAsCoordinate:(CLLocationCoordinate2D)a3
{
  VenuesManager *v3;
  void *v4;

  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueFeatureMarkerAtCoordinate:](self, "venueFeatureMarkerAtCoordinate:", a3.latitude, a3.longitude));
  LOBYTE(v3) = -[VenuesManager isUserAtVenueWithID:](v3, "isUserAtVenueWithID:", objc_msgSend(v4, "venueID"));

  return (char)v3;
}

- (BOOL)isUserAtVenueWithID:(unint64_t)a3
{
  id v3;
  void *v4;

  v3 = (id)a3;
  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager _userVenueMarker](self, "_userVenueMarker"));
    LOBYTE(v3) = objc_msgSend(v4, "venueID") == v3;

  }
  return (char)v3;
}

- (id)_userVenueMarker
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastGoodLocation"));

  if (v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager")), v6 = objc_msgSend(v5, "isAuthorizedForPreciseLocation"), v5, v6))
  {
    objc_msgSend(v4, "coordinate");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueFeatureMarkerAtCoordinate:](self, "venueFeatureMarkerAtCoordinate:"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSNumber)userLocationFloorOrdinal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "floorOrdinalInVenue:forMapView:", v5, v6));

  return (NSNumber *)v7;
}

- (id)userLocationFloorOrdinalInVenue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager userLocationFloorOrdinal](self, "userLocationFloorOrdinal"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userLocation"));
    objc_msgSend(v7, "coordinate");
    v9 = v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_mapLayer"));
    v14 = objc_msgSend(v13, "venueAtLocation:", VKLocationCoordinate2DMake(v9, v11));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v16 = objc_msgSend(v15, "venueID");
    if (v16 == objc_msgSend(v4, "venueID"))
      v17 = v5;
    else
      v17 = 0;
    v18 = v17;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)displayUserLocationFloorOrdinalIfNeededWithVenue:(id)a3 asNewlyFocusedVenue:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  id v15;

  v4 = a4;
  v15 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  v7 = objc_msgSend(v6, "userTrackingMode");

  if (v7 || v4)
  {
    if (!v4
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView")),
          v9 = objc_msgSend(v8, "displayedFloorIsDefaultForBuildingsInVenue:", v15),
          v8,
          v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager userLocationFloorOrdinalInVenue:](self, "userLocationFloorOrdinalInVenue:", v15));
      v11 = v10;
      if (v10)
      {
        v12 = objc_msgSend(v10, "shortValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
        v14 = objc_msgSend(v13, "displayedFloorOrdinalForBuildingsInVenue:", v15);

        if (v12 != v14)
          -[VenuesManager setDisplayedFloorOrdinal:forBuildingsInVenue:](self, "setDisplayedFloorOrdinal:forBuildingsInVenue:", objc_msgSend(v11, "shortValue"), v15);
      }

    }
  }

}

- (BOOL)hasSearchResultsInVenue:(id)a3 matching:(id)a4
{
  id v6;
  unsigned int (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned int v20;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = (unsigned int (**)(id, void *))a4;
  if (v6)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = objc_claimAutoreleasedReturnValue(-[VenuesManager searchResultCountInVenue](self, "searchResultCountInVenue", 0));
    v9 = (void *)v8;
    v10 = &__NSArray0__struct;
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v17 = objc_msgSend(v16, "venueID");
          if (v17 == objc_msgSend(v6, "venueID"))
          {
            if (v7[2](v7, v16))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager searchResultCountInVenue](self, "searchResultCountInVenue"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v16));
              v20 = objc_msgSend(v19, "shortValue");

              if (v20)
              {
                v21 = 1;
                goto LABEL_17;
              }
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
          continue;
        break;
      }
    }
    v21 = 0;
LABEL_17:

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)hasSearchResultsInVenue:(id)a3 forFloorOrdinal:(signed __int16)a4
{
  _QWORD v5[4];
  signed __int16 v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009E8D24;
  v5[3] = &unk_1011DEE10;
  v6 = a4;
  return -[VenuesManager hasSearchResultsInVenue:matching:](self, "hasSearchResultsInVenue:matching:", a3, v5);
}

- (BOOL)hasSearchResultsInVenueForAnyFloorOrdinal:(id)a3
{
  return -[VenuesManager hasSearchResultsInVenue:matching:](self, "hasSearchResultsInVenue:matching:", a3, &stru_1011DEE50);
}

- (void)getMinZoom:(id *)a3 maxZoom:(id *)a4 resultsForDeterminingRegion:(id *)a5 forDisplayingResults:(id)a6 fromSearch:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id *v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  int v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  NSMutableArray *v47;
  id *v48;
  uint64_t v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id *v60;
  void *v61;
  id v62;
  id *v63;
  id *v64;
  VenuesManager *v65;
  void *v66;
  void *v67;
  void *v69;
  NSMutableArray *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];

  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a7, "venueCategoryItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "venueIdentifier"));

  if (v13 && objc_msgSend(v13, "venueID"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "venueWithID:", objc_msgSend(v13, "venueID")));

    v69 = (void *)v15;
    if (v15)
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentIdentifiers"));
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      if (v17)
      {
        v18 = v17;
        v19 = a3;
        v20 = *(_QWORD *)v77;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v77 != v20)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v22, "_hasBuildingID"))
            {
              v23 = objc_claimAutoreleasedReturnValue(-[VenuesManager venue:buildingWithId:](self, "venue:buildingWithId:", v69, objc_msgSend(v22, "buildingID")));
              if (v23)
              {
                v24 = v23;
                goto LABEL_17;
              }
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
          if (v18)
            continue;
          break;
        }
        v24 = 0;
LABEL_17:
        a3 = v19;
      }
      else
      {
        v24 = 0;
      }

      v25 = 1;
      v15 = v24;
    }
    else
    {
      v25 = 0;
      v69 = 0;
    }
  }
  else
  {
    v25 = 0;
    v69 = 0;
    v15 = 0;
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));
  v26 = objc_claimAutoreleasedReturnValue(-[VenuesManager venueBuildingWithFocus](self, "venueBuildingWithFocus"));
  v65 = self;
  v66 = (void *)v26;
  v67 = (void *)v15;
  if (v15)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
    objc_msgSend(v27, "zoomToFocusVenueBuilding:", v15);
LABEL_24:
    v29 = v28;
    v30 = 0;
LABEL_25:
    v31 = v71;
    goto LABEL_26;
  }
  if (v25)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
    objc_msgSend(v27, "zoomToFocusVenue:", v69);
    goto LABEL_24;
  }
  if (v26)
  {
    v49 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
    objc_msgSend(v27, "zoomToFocusVenueBuilding:", v49);
    v29 = v50;
    v30 = 1;
    goto LABEL_25;
  }
  v31 = v71;
  if (!v71)
  {
    *a3 = 0;
    *a4 = 0;
    goto LABEL_51;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  objc_msgSend(v27, "zoomToFocusVenue:", v71);
  v29 = v51;
  v30 = 1;
LABEL_26:

  if (v29 <= 0.0)
  {
    *a3 = 0;
    *a4 = 0;
    if ((v30 & 1) != 0)
      goto LABEL_35;
    goto LABEL_51;
  }
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v29)));
  *a3 = v32;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  objc_msgSend(v33, "_zoomLevel");
  if (v34 < v29)
  {

    goto LABEL_34;
  }

  if (!v71)
  {
LABEL_34:
    *a4 = 0;
    v31 = v71;
    if ((v30 & 1) != 0)
      goto LABEL_35;
LABEL_51:
    v48 = a5;
    *a5 = objc_msgSend(v11, "copy");
    if (!v31)
      goto LABEL_58;
    goto LABEL_52;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  objc_msgSend(v35, "_zoomLevel");
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

  v31 = v71;
  if (!v30)
    goto LABEL_51;
LABEL_35:
  v63 = a3;
  v60 = a4;
  v61 = v13;
  v70 = objc_opt_new(NSMutableArray);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v62 = v11;
  v36 = v11;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v73;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(_QWORD *)v73 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)j);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mapItem"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "_venueInfo"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "venueIdentifier"));
        v45 = objc_msgSend(v44, "venueID");
        v46 = objc_msgSend(v71, "venueID");

        if (v45 == v46)
          -[NSMutableArray addObject:](v70, "addObject:", v41);
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    }
    while (v38);
  }

  v47 = objc_retainAutorelease(v70);
  v48 = a5;
  *a5 = v47;

  v13 = v61;
  v11 = v62;
  a4 = v60;
  a3 = v63;
  v31 = v71;
  if (v71)
  {
LABEL_52:
    if (objc_msgSend(*v48, "count") == (id)1)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v48, "firstObject"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "mapItem"));
      if (objc_msgSend(v53, "_venueFeatureType") == (id)4)
      {
        v64 = a3;
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "mapItem"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "_venueInfo"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "venueIdentifier"));
        v57 = objc_msgSend(v56, "venueID");
        v58 = objc_msgSend(v71, "venueID");

        if (v57 == v58)
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](v65, "mapView"));
          objc_msgSend(v59, "_zoomLevel");
          *v64 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

          *a4 = objc_retainAutorelease(*v64);
        }
      }
      else
      {

      }
      v31 = v71;
    }
  }
LABEL_58:

}

- (void)getMinZoom:(id *)a3 maxZoom:(id *)a4 forDisplayingLabelMarker:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v15 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueBuildingWithFocus](self, "venueBuildingWithFocus"));
  if (objc_msgSend(v15, "venueID") && (v10 = objc_msgSend(v15, "venueID"), v10 == objc_msgSend(v8, "venueID")))
  {
    if (objc_msgSend(v15, "venueLevelID"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
      objc_msgSend(v11, "_zoomLevel");
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

      v12 = objc_retainAutorelease(*a3);
    }
    else
    {
      if (objc_msgSend(v15, "venueBuildingID")
        && (v13 = objc_msgSend(v15, "venueBuildingID"), v13 == objc_msgSend(v9, "buildingId")))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
        objc_msgSend(v14, "zoomToFocusVenueBuilding:", v9);
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
        objc_msgSend(v14, "zoomToFocusVenue:", v8);
      }
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
    *a3 = 0;
  }
  *a4 = v12;

}

- (BOOL)hasSearchResultsInVenue:(id)a3
{
  return -[VenuesManager hasSearchResultsInVenue:matching:](self, "hasSearchResultsInVenue:matching:", a3, &stru_1011DEE70);
}

- (void)setVenueFloorViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  NSHashTable *changeObservers;
  id v7;
  NSHashTable *v8;
  id v9;
  void *v10;
  id v11;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_venueFloorViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    changeObservers = self->_changeObservers;
    v7 = objc_loadWeakRetained((id *)&self->_venueFloorViewController);
    LODWORD(changeObservers) = -[NSHashTable containsObject:](changeObservers, "containsObject:", v7);

    if ((_DWORD)changeObservers)
    {
      v8 = self->_changeObservers;
      v9 = objc_loadWeakRetained((id *)&self->_venueFloorViewController);
      -[NSHashTable removeObject:](v8, "removeObject:", v9);

    }
    objc_storeWeak((id *)&self->_venueFloorViewController, obj);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager userLocationFloorOrdinal](self, "userLocationFloorOrdinal"));
    objc_msgSend(obj, "setUserLocationFloorOrdinal:", v10);

    v11 = objc_loadWeakRetained((id *)&self->_venueFloorViewController);
    -[VenuesManager addChangeObserver:](self, "addChangeObserver:", v11);

    -[VenuesManager updateSearchResultCountFromCurrentViewController](self, "updateSearchResultCountFromCurrentViewController");
    -[VenuesManager updateFocusedVenueFloor](self, "updateFocusedVenueFloor");
    -[VenuesManager venueFloorViewControllerStateDidChange](self, "venueFloorViewControllerStateDidChange");
    v5 = obj;
  }

}

- (void)setVenueCardStack:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_venueCardStack);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_venueCardStack);
    objc_msgSend(v5, "removeStackObserver:", self);

    v6 = objc_storeWeak((id *)&self->_venueCardStack, obj);
    objc_msgSend(obj, "addStackObserver:", self);

    -[VenuesManager updateDimmingOutsideVenue](self, "updateDimmingOutsideVenue");
  }

}

- (void)displayFloorForSelectedSearchResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_venueInfo"));

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "venueIdentifier")),
        v7 = objc_msgSend(v6, "_hasVenueID"),
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "venueIdentifier"));
    v9 = objc_msgSend(v8, "venueID");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "venueIdentifier", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentIdentifiers"));

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "floorInfo"));

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "floorInfo"));
            v12 = objc_msgSend(v17, "ordinal");

            goto LABEL_14;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_14:

  }
  else
  {
    v12 = 0;
    v9 = 0;
  }
  -[VenuesManager setPendingDisplayFloorForSelectionVenueID:](self, "setPendingDisplayFloorForSelectionVenueID:", v9);
  -[VenuesManager setPendingDisplayFloorForSelectionFloorOrdinal:](self, "setPendingDisplayFloorForSelectionFloorOrdinal:", v12);
  -[VenuesManager displayFloorForPendingSelection](self, "displayFloorForPendingSelection");

}

- (void)displayFloorForSelectedLabelMarker:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  char v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "featureAnnotation"));
  v5 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "featureAnnotation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchResult"));
    v8 = objc_msgSend(v7, "type") == 3;

  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v16, "hasVenueLookInsideFloorOrdinal"))
  {
    v9 = objc_msgSend(v16, "venueLookInsideFloorOrdinal");
LABEL_11:
    -[VenuesManager setPendingValuesAndDisplayVenueID:floorOrdinal:](self, "setPendingValuesAndDisplayVenueID:floorOrdinal:", v16, v9);
    goto LABEL_12;
  }
  if (objc_msgSend(v16, "venueLevelID"))
    v10 = 1;
  else
    v10 = v8;
  if ((v10 & 1) != 0)
  {
    v9 = objc_msgSend(v16, "venueFloorOrdinal");
    goto LABEL_11;
  }
  if (objc_msgSend(v16, "venueID"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "venueWithID:", objc_msgSend(v16, "venueID")));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapIdentifier"));
    if (v13)
    {
      -[VenuesManager recordVenueVisitWithIdentifier:](self, "recordVenueVisitWithIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
      v15 = objc_msgSend(v14, "defaultFloorForBuildingsInVenue:", v12);

      -[VenuesManager setPendingValuesAndDisplayVenueID:floorOrdinal:](self, "setPendingValuesAndDisplayVenueID:floorOrdinal:", v16, v15);
    }

  }
LABEL_12:

}

- (void)setPendingValuesAndDisplayVenueID:(id)a3 floorOrdinal:(signed __int16)a4
{
  uint64_t v4;

  v4 = a4;
  -[VenuesManager setPendingDisplayFloorForSelectionVenueID:](self, "setPendingDisplayFloorForSelectionVenueID:", objc_msgSend(a3, "venueID"));
  -[VenuesManager setPendingDisplayFloorForSelectionFloorOrdinal:](self, "setPendingDisplayFloorForSelectionFloorOrdinal:", v4);
  -[VenuesManager displayFloorForPendingSelection](self, "displayFloorForPendingSelection");
}

- (void)displayFloorForCurrentOrPendingSelection
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager actionCoordinator](self, "actionCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapSelectionManager"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "labelMarker"));

  if (v5)
    -[VenuesManager displayFloorForSelectedLabelMarker:](self, "displayFloorForSelectedLabelMarker:", v5);
  else
    -[VenuesManager displayFloorForPendingSelection](self, "displayFloorForPendingSelection");

}

- (void)displayFloorForPendingSelection
{
  id WeakRetained;
  id v4;

  if (-[VenuesManager pendingDisplayFloorForSelectionVenueID](self, "pendingDisplayFloorForSelectionVenueID"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "venueWithID:", -[VenuesManager pendingDisplayFloorForSelectionVenueID](self, "pendingDisplayFloorForSelectionVenueID")));

    if (v4)
      -[VenuesManager setDisplayedFloorOrdinal:forBuildingsInVenue:](self, "setDisplayedFloorOrdinal:forBuildingsInVenue:", -[VenuesManager pendingDisplayFloorForSelectionFloorOrdinal](self, "pendingDisplayFloorForSelectionFloorOrdinal"), v4);

  }
}

- (void)updateUserLocation
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  unsigned int v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[VenuesManager userLocationFloorOrdinal](self, "userLocationFloorOrdinal"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueFloorViewController](self, "venueFloorViewController"));
  objc_msgSend(v3, "setUserLocationFloorOrdinal:", v9);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager floorCard](self, "floorCard"));
  objc_msgSend(v4, "userLocationDidChange");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));
  v6 = 0;
  if (v5 && v9)
  {
    v7 = -[VenuesManager displayedFloorOrdinalForBuildingsInVenue:](self, "displayedFloorOrdinalForBuildingsInVenue:", v5);
    v6 = v7 != objc_msgSend(v9, "shortValue");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager userLocationView](self, "userLocationView"));
  objc_msgSend(v8, "_setIsOnAnotherFloorInVenue:", v6);

}

- (void)presentPlaceCardForVenueWithFocusAndAddToHistory:(BOOL)a3 source:(unint64_t)a4 centeringOnVenue:(BOOL)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17[2];
  BOOL v18;
  BOOL v19;
  id location;
  id v21;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapIdentifier"));
    if (v11)
    {
      v12 = objc_msgSend(objc_alloc((Class)MKMapItemIdentifier), "initWithGEOMapItemIdentifier:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v21 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ticketForIdentifiers:traits:", v14, 0));

      objc_initWeak(&location, self);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1009E9DF0;
      v16[3] = &unk_1011DEE98;
      objc_copyWeak(v17, &location);
      v18 = a5;
      v19 = a3;
      v17[1] = (id)a4;
      objc_msgSend(v15, "submitWithHandler:networkActivity:", v16, 0);
      objc_destroyWeak(v17);
      objc_destroyWeak(&location);

    }
  }

}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v5;

  -[VenuesManager updateUserLocation](self, "updateUserLocation", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));
  -[VenuesManager displayUserLocationFloorOrdinalIfNeededWithVenue:asNewlyFocusedVenue:](self, "displayUserLocationFloorOrdinalIfNeededWithVenue:asNewlyFocusedVenue:", v5, 0);

}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus", a3, a4, a5));
  -[VenuesManager displayUserLocationFloorOrdinalIfNeededWithVenue:asNewlyFocusedVenue:](self, "displayUserLocationFloorOrdinalIfNeededWithVenue:asNewlyFocusedVenue:", v6, 0);

}

- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3
{
  void *v4;
  unsigned int v5;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueFloorViewController](self, "venueFloorViewController", a3));
  v5 = objc_msgSend(v4, "isOpen");

  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009EA014;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v5 ^ 1;
}

- (void)mapView:(id)a3 didChangeFocusedVenue:(id)a4 focusedBuilding:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    -[VenuesManager displayUserLocationFloorOrdinalIfNeededWithVenue:asNewlyFocusedVenue:](self, "displayUserLocationFloorOrdinalIfNeededWithVenue:asNewlyFocusedVenue:", v8, 1);
    -[VenuesManager updateFocusedVenueFloor](self, "updateFocusedVenueFloor");
    -[VenuesManager displayFloorForCurrentOrPendingSelection](self, "displayFloorForCurrentOrPendingSelection");
  }
  else if (!v9)
  {
    -[VenuesManager setSearchVenueIdentifier:](self, "setSearchVenueIdentifier:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    objc_msgSend(v13, "setVenueExperienceShown:", 0);
    v14 = 1057;
    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  v12 = objc_msgSend(v11, "venueExperienceShown");

  if ((v12 & 1) != 0)
    goto LABEL_8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v13, "setVenueExperienceShown:", 1);
  v14 = 1056;
LABEL_7:

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v14, 0, 0);
LABEL_8:
  -[VenuesManager updateUserLocation](self, "updateUserLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
  v16 = objc_msgSend(v15, "displayedFloorIsDefaultForBuildingsInVenue:", v8);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));

    v18 = -[VenuesManager floorOrdinalWithFocus](self, "floorOrdinalWithFocus");
    if (v17)
    {
      v19 = -[VenuesManager searchVenueIdentifier](self, "searchVenueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));
      v21 = v19 == objc_msgSend(v20, "venueID");

    }
    else
    {
      v21 = 1;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager visitedVenues](self, "visitedVenues"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v22));

    if ((v18 & 0x80000000) == 0 || v21 || v24)
      v25 = -[VenuesManager displayedFloorOrdinalForBuildingsInVenue:](self, "displayedFloorOrdinalForBuildingsInVenue:", v8);
    else
      v25 = -[VenuesManager firstAbovegroundFloorOrdinalForVenue:](self, "firstAbovegroundFloorOrdinalForVenue:", v8);
    -[VenuesManager setDisplayedFloorOrdinal:forBuildingsInVenue:](self, "setDisplayedFloorOrdinal:forBuildingsInVenue:", v25, v8);

  }
  -[VenuesManager updateDimmingOutsideVenue](self, "updateDimmingOutsideVenue");
  -[VenuesManager notifyChangeObservers](self, "notifyChangeObservers");

}

- (void)mapView:(id)a3 didChangeDisplayedFloorOrdinal:(signed __int16)a4 forVenue:(id)a5
{
  id v6;
  unint64_t v7;
  id v8;

  v6 = a5;
  -[VenuesManager notifyChangeObservers](self, "notifyChangeObservers");
  -[VenuesManager updateUserLocation](self, "updateUserLocation");
  v7 = -[VenuesManager pendingDisplayFloorForSelectionVenueID](self, "pendingDisplayFloorForSelectionVenueID");
  v8 = objc_msgSend(v6, "venueID");

  if ((id)v7 == v8)
    -[VenuesManager setPendingDisplayFloorForSelectionVenueID:](self, "setPendingDisplayFloorForSelectionVenueID:", 0);
  -[VenuesManager dismissLastPlaceCardViewControllerIfNecessary](self, "dismissLastPlaceCardViewControllerIfNecessary");
  -[VenuesManager updateDimmingOutsideVenue](self, "updateDimmingOutsideVenue");
}

- (id)venue:(id)a3 buildingWithId:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "buildings", 0));
  v6 = (void *)v5;
  v7 = &__NSArray0__struct;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "buildingId") == (id)a4)
        {
          v14 = v13;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (void)setSearchResultCountInVenue:(id)a3
{
  NSDictionary *v4;
  NSDictionary *searchResultCountInVenue;
  void *v6;
  id v7;

  v7 = a3;
  if (!+[NSDictionary dictionary:isEqualToDictionary:](NSDictionary, "dictionary:isEqualToDictionary:", self->_searchResultCountInVenue))
  {
    v4 = (NSDictionary *)objc_msgSend(v7, "copy");
    searchResultCountInVenue = self->_searchResultCountInVenue;
    self->_searchResultCountInVenue = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueFloorViewController](self, "venueFloorViewController"));
    objc_msgSend(v6, "didChangeSearchResultsInVenue");

  }
}

- (void)updateFocusedVenueFloor
{
  VenuesManager *v2;
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  void *v16;
  VenuesManager *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  void *v25;
  int v26;
  signed __int16 v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));
  if (v3)
  {
    v4 = (id)-[VenuesManager displayedFloorOrdinalForBuildingsInVenue:](v2, "displayedFloorOrdinalForBuildingsInVenue:", v3);
    if (-[VenuesManager hasSearchResultsInVenueForAnyFloorOrdinal:](v2, "hasSearchResultsInVenueForAnyFloorOrdinal:", v3))
    {
      if (!-[VenuesManager hasSearchResultsInVenue:forFloorOrdinal:](v2, "hasSearchResultsInVenue:forFloorOrdinal:", v3, v4)|| (v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](v2, "mapView")), v6 = objc_msgSend(v5, "displayedFloorIsDefaultForBuildingsInVenue:", v3), v5, v6))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager userLocationFloorOrdinalInVenue:](v2, "userLocationFloorOrdinalInVenue:", v3));
        v8 = v7;
        if (v7
          && -[VenuesManager hasSearchResultsInVenue:forFloorOrdinal:](v2, "hasSearchResultsInVenue:forFloorOrdinal:", v3, objc_msgSend(v7, "shortValue")))
        {
          v27 = (unsigned __int16)objc_msgSend(v8, "shortValue");
        }
        else
        {
          v25 = v8;
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue(-[VenuesManager searchResultCountInVenue](v2, "searchResultCountInVenue"));
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v9)
          {
            v10 = v9;
            v11 = 0;
            v12 = *(_QWORD *)v30;
            v26 = (int)v4;
            v27 = (__int16)v4;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(_QWORD *)v30 != v12)
                  objc_enumerationMutation(obj);
                v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
                v15 = objc_msgSend(v14, "venueID");
                if (v15 == objc_msgSend(v3, "venueID"))
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "floorOrdinal"));

                  if (v16)
                  {
                    v17 = v2;
                    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager searchResultCountInVenue](v2, "searchResultCountInVenue"));
                    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v14));
                    v20 = objc_msgSend(v19, "unsignedIntegerValue");

                    v2 = v17;
                    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "floorOrdinal"));
                    v22 = objc_msgSend(v21, "shortValue");

                    if (v20 > v11)
                      goto LABEL_22;
                    if (v20 == v11)
                    {
                      v23 = v22 - v26;
                      if ((int)(v22 - v26) < 0)
                        v23 = v26 - v22;
                      v24 = v27 - v26;
                      if (v24 < 0)
                        v24 = v26 - v27;
                      if (v23 < v24)
                      {
LABEL_22:
                        v27 = v22;
                        v11 = v20;
                      }
                    }
                  }
                }
              }
              v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            }
            while (v10);
          }
          else
          {
            v27 = (__int16)v4;
          }

          v8 = v25;
        }
        -[VenuesManager setDisplayedFloorOrdinal:forBuildingsInVenue:](v2, "setDisplayedFloorOrdinal:forBuildingsInVenue:", v27, v3);

      }
    }
  }

}

- (void)_containerWillPresentContainee:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ContainerContainee")));

  v6 = objc_claimAutoreleasedReturnValue(-[VenuesManager venueFloorViewController](self, "venueFloorViewController"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager floorCard](self, "floorCard"));

    if (v5 != v8)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1009EA874;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  v9 = -[NSDictionary copy](self->_searchResultCountInVenue, "copy");
  -[VenuesManager updateSearchResultCountFromViewController:](self, "updateSearchResultCountFromViewController:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager floorCard](self, "floorCard"));

  if (v5 != v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager searchResultCountInVenueWithViewController:](self, "searchResultCountInVenueWithViewController:", v5));
    if (!+[NSDictionary dictionary:isEqualToDictionary:](NSDictionary, "dictionary:isEqualToDictionary:", v9, v11))-[VenuesManager updateFocusedVenueFloor](self, "updateFocusedVenueFloor");

  }
}

- (void)updateSearchResultCountFromCurrentViewController
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[VenuesManager actionCoordinator](self, "actionCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentViewController"));
  -[VenuesManager updateSearchResultCountFromViewController:](self, "updateSearchResultCountFromViewController:", v3);

}

- (void)updateSearchResultCountFromViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[VenuesManager floorCard](self, "floorCard"));

  v5 = v7;
  if (v4 != v7)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager searchResultCountInVenueWithViewController:](self, "searchResultCountInVenueWithViewController:", v7));
    -[VenuesManager setSearchResultCountInVenue:](self, "setSearchResultCountInVenue:", v6);

    v5 = v7;
  }

}

- (id)searchResultCountInVenueWithViewController:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___VenuesControlCoordinating)
    && (objc_opt_respondsToSelector(v3, "searchResultCountInVenue") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultCountInVenue"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)venueFloorViewControllerStateDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  VenueFloorCardViewController *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueFloorViewController](self, "venueFloorViewController"));
  if (!objc_msgSend(v3, "isOpen"))
    goto LABEL_4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueFloorViewController](self, "venueFloorViewController"));
  if (objc_msgSend(v4, "isHidden"))
  {

LABEL_4:
    goto LABEL_5;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == (id)5)
  {
LABEL_5:
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager floorCard](self, "floorCard"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager actionCoordinator](self, "actionCoordinator"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager floorCard](self, "floorCard"));
      objc_msgSend(v6, "viewControllerGoPreviousState:withSender:", v7, 0);

      -[VenuesManager setFloorCard:](self, "setFloorCard:", 0);
    }
    goto LABEL_7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager floorCard](self, "floorCard"));

  if (!v10)
  {
    v11 = -[VenueFloorCardViewController initWithVenuesManager:]([VenueFloorCardViewController alloc], "initWithVenuesManager:", self);
    -[VenuesManager addChangeObserver:](self, "addChangeObserver:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager actionCoordinator](self, "actionCoordinator"));
    -[ControlContaineeViewController setDelegate:](v11, "setDelegate:", v12);

    -[VenuesManager setFloorCard:](self, "setFloorCard:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager actionCoordinator](self, "actionCoordinator"));
    objc_msgSend(v13, "viewController:presentVenueFloorCardViewController:", 0, v11);

  }
LABEL_7:
  -[VenuesManager updateDimmingOutsideVenue](self, "updateDimmingOutsideVenue");
}

- (void)updateDimmingOutsideVenue
{
  void *v3;
  _BOOL8 v5;
  id v6;

  if (GEOConfigGetBOOL(MapsConfig_VenueDimUnderground, off_1014B30D8))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));

    v5 = -[VenuesManager floorOrdinalWithFocus](self, "floorOrdinalWithFocus") < 0 && v3 != 0;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[VenuesManager mapView](self, "mapView"));
    objc_msgSend(v6, "setDimmingOutsideVenueWithFocus:", v5);

  }
}

- (void)dismissLastPlaceCardViewControllerIfNecessary
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager actionCoordinator](self, "actionCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapSelectionManager"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "labelMarker"));

  if (objc_msgSend(v10, "venueLevelID"))
  {
    v5 = objc_msgSend(v10, "venueFloorOrdinal");
    if (v5 != -[VenuesManager floorOrdinalWithFocus](self, "floorOrdinalWithFocus"))
    {
      v6 = objc_msgSend(v10, "venueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager venueWithFocus](self, "venueWithFocus"));
      v8 = objc_msgSend(v7, "venueID");

      if (v6 == v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesManager actionCoordinator](self, "actionCoordinator"));
        objc_msgSend(v9, "dismissLastVenuePlaceCard");

      }
    }
  }

}

- (id)sortedFloorOrdinalsForVenue:(id)a3
{
  id v3;
  NSMutableSet *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableSet);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "buildings", 0));
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9), "floorOrdinals"));
        -[NSMutableSet addObjectsFromArray:](v4, "addObjectsFromArray:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v4, "allObjects"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sortedArrayUsingSelector:", "compare:"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reverseObjectEnumerator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));

  return v14;
}

- (signed)firstAbovegroundFloorOrdinalForVenue:(id)a3
{
  id v4;
  signed __int16 v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = -[VenuesManager floorOrdinalWithFocus](self, "floorOrdinalWithFocus");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[VenuesManager sortedFloorOrdinalsForVenue:](self, "sortedFloorOrdinalsForVenue:", v4));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
      if ((objc_msgSend(v11, "shortValue", (_QWORD)v13) & 0x80000000) != 0)
        break;
      v5 = (unsigned __int16)objc_msgSend(v11, "shortValue");
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  return v5;
}

- (ActionCoordination)actionCoordinator
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_actionCoordinator);
}

- (VenueFloorViewControlling)venueFloorViewController
{
  return (VenueFloorViewControlling *)objc_loadWeakRetained((id *)&self->_venueFloorViewController);
}

- (VenuesStack)venueCardStack
{
  return (VenuesStack *)objc_loadWeakRetained((id *)&self->_venueCardStack);
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (MapsUserLocationView)userLocationView
{
  return (MapsUserLocationView *)objc_loadWeakRetained((id *)&self->_userLocationView);
}

- (void)setUserLocationView:(id)a3
{
  objc_storeWeak((id *)&self->_userLocationView, a3);
}

- (VenueFloorCardViewController)floorCard
{
  return self->_floorCard;
}

- (void)setFloorCard:(id)a3
{
  objc_storeStrong((id *)&self->_floorCard, a3);
}

- (NSDictionary)searchResultCountInVenue
{
  return self->_searchResultCountInVenue;
}

- (unint64_t)pendingDisplayFloorForSelectionVenueID
{
  return self->_pendingDisplayFloorForSelectionVenueID;
}

- (void)setPendingDisplayFloorForSelectionVenueID:(unint64_t)a3
{
  self->_pendingDisplayFloorForSelectionVenueID = a3;
}

- (signed)pendingDisplayFloorForSelectionFloorOrdinal
{
  return self->_pendingDisplayFloorForSelectionFloorOrdinal;
}

- (void)setPendingDisplayFloorForSelectionFloorOrdinal:(signed __int16)a3
{
  self->_pendingDisplayFloorForSelectionFloorOrdinal = a3;
}

- (unint64_t)searchVenueIdentifier
{
  return self->_searchVenueIdentifier;
}

- (void)setSearchVenueIdentifier:(unint64_t)a3
{
  self->_searchVenueIdentifier = a3;
}

- (NSTimer)visitedVenuesEvictionTimer
{
  return self->_visitedVenuesEvictionTimer;
}

- (void)setVisitedVenuesEvictionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_visitedVenuesEvictionTimer, a3);
}

- (NSMutableDictionary)visitedVenues
{
  return self->_visitedVenues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitedVenues, 0);
  objc_storeStrong((id *)&self->_visitedVenuesEvictionTimer, 0);
  objc_storeStrong((id *)&self->_searchResultCountInVenue, 0);
  objc_storeStrong((id *)&self->_floorCard, 0);
  objc_destroyWeak((id *)&self->_userLocationView);
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_venueCardStack);
  objc_destroyWeak((id *)&self->_venueFloorViewController);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_storeStrong((id *)&self->_changeObservers, 0);
}

@end
