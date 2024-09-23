@implementation NanoRoutePlanningResponse

- (NanoRoutePlanningResponse)init
{
  NanoRoutePlanningResponse *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NanoRoutePlanningResponse;
  result = -[NanoRoutePlanningResponse init](&v3, "init");
  if (result)
    result->_routeOrigin = 1;
  return result;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse routeIDs](self, "routeIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse lastError](self, "lastError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, routeIDs: %@, error: %@, (%lu/%lu)>"), v3, self, v4, v5, -[NanoRoutePlanningResponse numberOfRoutes](self, "numberOfRoutes"), -[NanoRoutePlanningResponse expectedNumberOfRoutes](self, "expectedNumberOfRoutes")));

  return v6;
}

+ (BOOL)_canRunNavigationForRoute:(id)a3
{
  return _objc_msgSend(a3, "isNavigableForWatch");
}

- (void)setRoutes:(id)a3
{
  NSArray *v4;
  NSArray *routes;
  unsigned __int8 v6;
  NSArray *v7;

  v4 = (NSArray *)a3;
  routes = self->_routes;
  if (routes != v4)
  {
    v7 = v4;
    v6 = -[NSArray isEqualToArray:](routes, "isEqualToArray:", v4);
    v4 = v7;
    if ((v6 & 1) == 0)
    {
      -[NanoRoutePlanningResponse _setRoutes:withRouteIDs:](self, "_setRoutes:withRouteIDs:", v7, 0);
      v4 = v7;
    }
  }

}

- (void)_setRoutes:(id)a3 withRouteIDs:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSDictionary *v11;
  NSDictionary *userInfoByRouteID;
  NSArray *v13;
  id v14;
  NSArray *routeIDs;
  id v16;
  _QWORD v17[4];
  id v18;
  NanoRoutePlanningResponse *v19;
  id v20;

  v16 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_routes, a3);
  v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v16, "count"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100349D14;
  v17[3] = &unk_1011B2508;
  v9 = v7;
  v18 = v9;
  v19 = self;
  v10 = v8;
  v20 = v10;
  objc_msgSend(v16, "enumerateObjectsWithOptions:usingBlock:", 0, v17);
  v11 = (NSDictionary *)objc_msgSend(v10, "copy");
  userInfoByRouteID = self->_userInfoByRouteID;
  self->_userInfoByRouteID = v11;

  if (v9)
  {
    v13 = (NSArray *)v9;
LABEL_5:
    routeIDs = self->_routeIDs;
    self->_routeIDs = v13;

    goto LABEL_6;
  }
  if (v16)
  {
    v14 = sub_10039DCD4(v16, &stru_1011B2548);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue(v14);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)setObject:(id)a3 forUserInfoKey:(id)a4 forRouteID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSDictionary *v20;
  NSDictionary *userInfoByRouteID;
  id v22;

  if (a5)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse userInfoForRouteWithID:](self, "userInfoForRouteWithID:", v8));
    v12 = objc_msgSend(v11, "mutableCopy");
    v13 = v12;
    if (v12)
      v14 = v12;
    else
      v14 = objc_alloc_init((Class)NSMutableDictionary);
    v22 = v14;

    objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, v9);
    v15 = -[NSDictionary mutableCopy](self->_userInfoByRouteID, "mutableCopy");
    v16 = v15;
    if (v15)
      v17 = v15;
    else
      v17 = objc_alloc_init((Class)NSMutableDictionary);
    v18 = v17;

    v19 = objc_msgSend(v22, "copy");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v8);

    v20 = (NSDictionary *)objc_msgSend(v18, "copy");
    userInfoByRouteID = self->_userInfoByRouteID;
    self->_userInfoByRouteID = v20;

  }
}

- (NSArray)companionRoutes
{
  NSArray *v3;
  id v4;
  NSObject *v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  NSUInteger v21;

  v3 = -[NSArray count](self->_routes, "count");
  if (v3)
  {
    if (-[NSArray count](self->_companionRoutes, "count"))
    {
      v4 = sub_10043214C();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = -[NSArray count](self->_routes, "count");
        v7 = -[NSArray count](self->_companionRoutes, "count");
        *(_DWORD *)buf = 134217984;
        v21 = v6 - v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will construct %lu remaining companion routes from composed routes", buf, 0xCu);
      }

      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse routes](self, "routes", 0));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            v13 = -[NanoRoutePlanningResponse _generateCompanionRouteFromComposedRoute:](self, "_generateCompanionRouteFromComposedRoute:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12));
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }

    }
    else
    {
      -[NanoRoutePlanningResponse _generateCompanionRoutesFromComposedRoutes](self, "_generateCompanionRoutesFromComposedRoutes");
    }
    v3 = self->_companionRoutes;
  }
  return v3;
}

- (id)selectedCompanionRoute
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse selectedRouteID](self, "selectedRouteID"));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse companionRouteWithID:](self, "companionRouteWithID:", v3));
  else
    v4 = 0;

  return v4;
}

- (id)companionRouteWithID:(id)a3
{
  id v4;
  void *v5;
  NSArray *companionRoutes;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSArray *v21;
  NSArray *v22;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, uint64_t, _BYTE *);
  void *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  if (-[NanoRoutePlanningResponse numberOfRoutes](self, "numberOfRoutes"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_data"));
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = sub_10034A3A4;
    v34 = sub_10034A3B4;
    v35 = 0;
    companionRoutes = self->_companionRoutes;
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_10034A3BC;
    v27 = &unk_1011B2570;
    v7 = v5;
    v28 = v7;
    v29 = &v30;
    -[NSArray enumerateObjectsWithOptions:usingBlock:](companionRoutes, "enumerateObjectsWithOptions:usingBlock:", 1, &v24);
    v8 = (void *)v31[5];
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse routeWithID:](self, "routeWithID:", v4, v24, v25, v26, v27));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse routes](self, "routes"));
      v11 = objc_msgSend(v10, "indexOfObject:", v9);

      if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse _generateCompanionRouteFromComposedRoute:](self, "_generateCompanionRouteFromComposedRoute:", v9));
        v13 = (void *)v31[5];
        v31[5] = v12;

        v14 = -[NSArray mutableCopy](self->_companionRoutes, "mutableCopy");
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          v18 = objc_alloc((Class)NSMutableArray);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse routes](self, "routes"));
          v16 = objc_msgSend(v18, "initWithCapacity:", objc_msgSend(v19, "count"));

        }
        v20 = v31[5];
        if (objc_msgSend(v16, "count") < v11)
          v11 = objc_msgSend(v16, "count");
        objc_msgSend(v16, "insertObject:atIndex:", v20, v11);
        v21 = (NSArray *)objc_msgSend(v16, "copy");
        v22 = self->_companionRoutes;
        self->_companionRoutes = v21;

      }
      v8 = (void *)v31[5];
    }
    v17 = v8;

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_generateCompanionRoutesFromComposedRoutes
{
  id v3;
  NSObject *v4;
  NSUInteger v5;
  NSArray *routes;
  id v7;
  NSArray *v8;
  NSArray *companionRoutes;
  NSArray *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  NSUInteger v13;

  if (-[NSArray count](self->_routes, "count"))
  {
    v3 = sub_10043214C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = -[NSArray count](self->_routes, "count");
      *(_DWORD *)buf = 134217984;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will construct %lu companion routes from composed routes", buf, 0xCu);
    }

    routes = self->_routes;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10034A570;
    v11[3] = &unk_1011B2598;
    v11[4] = self;
    v7 = sub_10039DCD4(routes, v11);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue(v7);
    companionRoutes = self->_companionRoutes;
    self->_companionRoutes = v8;

  }
  else
  {
    v10 = self->_companionRoutes;
    self->_companionRoutes = 0;

  }
}

- (id)_generateCompanionRouteFromComposedRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNanoFormattedStringFormatter sharedFormatter](MNNanoFormattedStringFormatter, "sharedFormatter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v7 = objc_opt_class(GEOComposedWaypointToRoute);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoMapItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));

  }
  v13 = objc_msgSend(objc_alloc((Class)GEOCompanionRouteDetails), "initWithRoute:destinationName:stringFormatter:traffic:", v4, v11, v5, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueRouteID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse userInfoForRouteWithID:](self, "userInfoForRouteWithID:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("canNavigate")));

  if (v16)
    v17 = objc_msgSend(v16, "BOOLValue");
  else
    v17 = objc_msgSend((id)objc_opt_class(self), "_canRunNavigationForRoute:", v4);
  objc_msgSend(v13, "setCanNavigate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse directionsRequest](self, "directionsRequest"));
  objc_msgSend(v13, "setRequest:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse directionsResponse](self, "directionsResponse"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "preJupiterCompatibleDirectionsResponseWithRoute:", v4));
  objc_msgSend(v13, "setResponse:", v20);

  return v13;
}

- (unint64_t)numberOfRoutes
{
  NSArray *routes;

  routes = self->_routes;
  if (!routes)
    routes = self->_companionRoutes;
  return -[NSArray count](routes, "count");
}

- (BOOL)hasReceivedAllExpectedRoutes
{
  unint64_t v3;
  unint64_t expectedNumberOfRoutes;
  BOOL v5;

  v3 = -[NanoRoutePlanningResponse numberOfRoutes](self, "numberOfRoutes");
  if (v3)
  {
    expectedNumberOfRoutes = self->_expectedNumberOfRoutes;
    if (expectedNumberOfRoutes)
      v5 = v3 == expectedNumberOfRoutes;
    else
      v5 = 1;
    LOBYTE(v3) = v5;
  }
  return v3;
}

- (NSUUID)selectedRouteID
{
  NSUUID *selectedRouteID;

  selectedRouteID = self->_selectedRouteID;
  if (selectedRouteID)
    return selectedRouteID;
  else
    return (NSUUID *)(id)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_routeIDs, "firstObject"));
}

- (GEOComposedRoute)selectedRoute
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse selectedRouteID](self, "selectedRouteID"));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse routeWithID:](self, "routeWithID:", v3));
  else
    v4 = 0;

  return (GEOComposedRoute *)v4;
}

- (unint64_t)selectedRouteIndex
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse selectedRouteID](self, "selectedRouteID"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse routeIDs](self, "routeIDs"));
    v5 = (unint64_t)objc_msgSend(v4, "indexOfObject:", v3);

  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)routeWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (-[NanoRoutePlanningResponse numberOfRoutes](self, "numberOfRoutes"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_10034A3A4;
    v15 = sub_10034A3B4;
    v16 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse routes](self, "routes"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10034A97C;
    v8[3] = &unk_1011B1948;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 1, v8);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)userInfoForRouteWithID:(id)a3
{
  void *v4;
  NSDictionary *userInfoByRouteID;

  v4 = 0;
  if (a3)
  {
    userInfoByRouteID = self->_userInfoByRouteID;
    if (userInfoByRouteID)
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](userInfoByRouteID, "objectForKeyedSubscript:"));
  }
  return v4;
}

- (BOOL)canNavigateRouteWithID:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse userInfoForRouteWithID:](self, "userInfoForRouteWithID:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("canNavigate")));
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)snapshot
{
  NanoRoutePlanningResponseSnapshot *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = objc_alloc_init(NanoRoutePlanningResponseSnapshot);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse routeIDs](self, "routeIDs"));
  -[NanoRoutePlanningResponseSnapshot setRouteIdentifiers:](v3, "setRouteIdentifiers:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse selectedRouteID](self, "selectedRouteID"));
  -[NanoRoutePlanningResponseSnapshot setSelectedRouteIdentifier:](v3, "setSelectedRouteIdentifier:", v5);

  if (-[NSArray count](self->_routes, "count"))
  {
    v6 = sub_10039DCD4(self->_routes, &stru_1011B25B8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NanoRoutePlanningResponseSnapshot setRevisionIdentifiers:](v3, "setRevisionIdentifiers:", v7);

    v8 = sub_10039DCD4(self->_routes, &stru_1011B25F8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NanoRoutePlanningResponseSnapshot setSelectedRideIndexes:](v3, "setSelectedRideIndexes:", v9);
LABEL_5:

    return v3;
  }
  if (-[NSArray count](self->_companionRoutes, "count"))
  {
    v10 = sub_10039DCD4(self->_companionRoutes, &stru_1011B2638);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NanoRoutePlanningResponseSnapshot setRevisionIdentifiers:](v3, "setRevisionIdentifiers:", v9);
    goto LABEL_5;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NanoRoutePlanningResponse *v4;

  v4 = objc_alloc_init(NanoRoutePlanningResponse);
  -[NanoRoutePlanningResponse _populateCopy:](self, "_populateCopy:", v4);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NanoRoutePlanningMutableResponse *v4;

  v4 = objc_alloc_init(NanoRoutePlanningMutableResponse);
  -[NanoRoutePlanningResponse _populateCopy:](self, "_populateCopy:", v4);
  return v4;
}

- (void)_populateCopy:(id)a3
{
  id *v5;

  objc_storeStrong((id *)a3 + 2, self->_routeIDs);
  v5 = (id *)a3;
  objc_storeStrong(v5 + 3, self->_routes);
  objc_storeStrong(v5 + 4, self->_companionRoutes);
  v5[10] = (id)self->_routeOrigin;
  objc_storeStrong(v5 + 5, self->_selectedRouteID);
  v5[11] = (id)self->_expectedNumberOfRoutes;
  objc_storeStrong(v5 + 7, self->_traceRecordingData);
  objc_storeStrong(v5 + 8, self->_directionsRequest);
  objc_storeStrong(v5 + 9, self->_directionsResponse);
  objc_storeStrong(v5 + 1, self->_userInfoByRouteID);
  objc_storeStrong(v5 + 6, self->_lastError);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NanoRoutePlanningResponse)initWithCoder:(id)a3
{
  id v4;
  NanoRoutePlanningResponse *v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSUUID *selectedRouteID;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  MNTraceRecordingData *traceRecordingData;
  id v25;
  uint64_t v26;
  GEODirectionsRequest *directionsRequest;
  id v28;
  uint64_t v29;
  GEODirectionsResponse *directionsResponse;
  uint64_t v31;
  NSSet *v32;
  void *v33;
  uint64_t v34;
  NSError *lastError;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSSet *v40;
  void *v41;
  void *v42;
  NSDictionary *v43;
  NSDictionary *userInfoByRouteID;
  NSDictionary *v45;
  _QWORD v47[4];
  NanoRoutePlanningResponse *v48;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)NanoRoutePlanningResponse;
  v5 = -[NanoRoutePlanningResponse init](&v49, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSArray);
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(NSUUID), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_routeIDs")));

    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DiskRouteStorage")) && v9)
    {
      v10 = sub_10039DCD4(v9, &stru_1011B2678);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    }
    else
    {
      v12 = objc_opt_class(NSArray);
      v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(GEOComposedRoute), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_routes")));

    }
    -[NanoRoutePlanningResponse _setRoutes:withRouteIDs:](v5, "_setRoutes:withRouteIDs:", v11, v9);
    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("_routeOrigin"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v5->_routeOrigin = (unint64_t)objc_msgSend(v16, "unsignedIntegerValue");

    v17 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("_selectedRouteID"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    selectedRouteID = v5->_selectedRouteID;
    v5->_selectedRouteID = (NSUUID *)v18;

    v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("_expectedNumberOfRoutes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v5->_expectedNumberOfRoutes = (unint64_t)objc_msgSend(v21, "unsignedIntegerValue");

    v22 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MNTraceRecordingData), CFSTR("_traceRecordingData"));
    v23 = objc_claimAutoreleasedReturnValue(v22);
    traceRecordingData = v5->_traceRecordingData;
    v5->_traceRecordingData = (MNTraceRecordingData *)v23;

    v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEODirectionsRequest), CFSTR("_directionsRequest"));
    v26 = objc_claimAutoreleasedReturnValue(v25);
    directionsRequest = v5->_directionsRequest;
    v5->_directionsRequest = (GEODirectionsRequest *)v26;

    v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEODirectionsResponse), CFSTR("_directionsResponse"));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    directionsResponse = v5->_directionsResponse;
    v5->_directionsResponse = (GEODirectionsResponse *)v29;

    v31 = objc_opt_class(NSError);
    v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v31, objc_opt_class(GEODirectionsError), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("_lastError")));
    lastError = v5->_lastError;
    v5->_lastError = (NSError *)v34;

    v36 = objc_opt_class(NSDictionary);
    v37 = objc_opt_class(NSUUID);
    v38 = objc_opt_class(GEOTransitRouteUpdate);
    v39 = objc_opt_class(NSNumber);
    v40 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v36, v37, v38, v39, objc_opt_class(NSString), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("_userInfoByRouteID")));
    v43 = (NSDictionary *)objc_msgSend(v42, "mutableCopy");
    userInfoByRouteID = v5->_userInfoByRouteID;
    v5->_userInfoByRouteID = v43;

    v45 = v5->_userInfoByRouteID;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10034B144;
    v47[3] = &unk_1011B26A0;
    v48 = v5;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v45, "enumerateKeysAndObjectsUsingBlock:", v47);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int BOOL;
  int v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  NanoRoutePlanningResponse *v18;
  NanoRoutePlanningResponse *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD block[4];
  char v36;
  uint8_t buf[4];
  __CFString *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeIDs, CFSTR("_routeIDs"));
  BOOL = GEOConfigGetBOOL(MapsConfig_NanoMapsPreferDiskRouteStorageForRoutePlanning, off_1014B5198);
  v6 = BOOL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034B660;
  block[3] = &unk_1011B26C0;
  v36 = BOOL;
  if (qword_1014D2190 != -1)
  {
    dispatch_once(&qword_1014D2190, block);
    if (v6)
      goto LABEL_3;
LABEL_23:
    objc_msgSend(v4, "encodeObject:forKey:", self->_routes, CFSTR("_routes"));
    goto LABEL_24;
  }
  if (!BOOL)
    goto LABEL_23;
LABEL_3:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = self->_routes;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (!v8)
    goto LABEL_11;
  v9 = v8;
  v10 = *(_QWORD *)v32;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v32 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
      v30 = 0;
      v13 = MNSaveRouteWithSubpath(v12, CFSTR("planning"), 0, &v30);
      v14 = v30;
      v15 = v14;
      if ((v13 & 1) == 0)
      {
        v16 = sub_10043214C();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
LABEL_22:

          objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("DiskRouteStorage"));
          goto LABEL_23;
        }
        v18 = self;
        v19 = v18;
        if (!v18)
        {
          v25 = CFSTR("<nil>");
          goto LABEL_21;
        }
        v20 = (objc_class *)objc_opt_class(v18);
        v21 = NSStringFromClass(v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        if ((objc_opt_respondsToSelector(v19, "accessibilityIdentifier") & 1) != 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse performSelector:](v19, "performSelector:", "accessibilityIdentifier"));
          v24 = v23;
          if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
          {
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, v19, v24));

            goto LABEL_19;
          }

        }
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, v19));
LABEL_19:

LABEL_21:
        v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueRouteID"));

        *(_DWORD *)buf = 138543874;
        v38 = v25;
        v39 = 2114;
        v40 = v27;
        v41 = 2112;
        v42 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to write route %{public}@ to disk: %@", buf, 0x20u);

        goto LABEL_22;
      }

    }
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v9)
      continue;
    break;
  }
LABEL_11:

  objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("DiskRouteStorage"));
LABEL_24:
  objc_msgSend(v4, "encodeObject:forKey:", self->_selectedRouteID, CFSTR("_selectedRouteID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_routeOrigin));
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("_routeOrigin"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_expectedNumberOfRoutes));
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("_expectedNumberOfRoutes"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_traceRecordingData, CFSTR("_traceRecordingData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_directionsRequest, CFSTR("_directionsRequest"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_directionsResponse, CFSTR("_directionsResponse"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastError, CFSTR("_lastError"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_userInfoByRouteID, CFSTR("_userInfoByRouteID"));

}

+ (void)clearDiskRouteStorage
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const __CFString *v7;

  v2 = sub_10043214C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = CFSTR("planning");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing disk route storage at subpath %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v4 = MNRecommendedDateForClearingRoutes();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  MNClearStoredRoutesWithSubpathUsedBefore(v5, CFSTR("planning"));

}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setCompanionRoutes:(id)a3
{
  objc_storeStrong((id *)&self->_companionRoutes, a3);
}

- (NSArray)routeIDs
{
  return self->_routeIDs;
}

- (void)setSelectedRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRouteID, a3);
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
  objc_storeStrong((id *)&self->_lastError, a3);
}

- (MNTraceRecordingData)traceRecordingData
{
  return self->_traceRecordingData;
}

- (void)setTraceRecordingData:(id)a3
{
  objc_storeStrong((id *)&self->_traceRecordingData, a3);
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (void)setDirectionsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_directionsRequest, a3);
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (void)setDirectionsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_directionsResponse, a3);
}

- (unint64_t)routeOrigin
{
  return self->_routeOrigin;
}

- (void)setRouteOrigin:(unint64_t)a3
{
  self->_routeOrigin = a3;
}

- (unint64_t)expectedNumberOfRoutes
{
  return self->_expectedNumberOfRoutes;
}

- (void)setExpectedNumberOfRoutes:(unint64_t)a3
{
  self->_expectedNumberOfRoutes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_traceRecordingData, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_selectedRouteID, 0);
  objc_storeStrong((id *)&self->_companionRoutes, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_routeIDs, 0);
  objc_storeStrong((id *)&self->_userInfoByRouteID, 0);
}

@end
