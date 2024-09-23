@implementation RAPDirectionsRecording

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_clusteredRouteRideSelections, a2);
  v3.receiver = self;
  v3.super_class = (Class)RAPDirectionsRecording;
  -[RAPDirectionsRecording dealloc](&v3, "dealloc");
}

- (void)clearDirectionsRequests
{
  -[NSMutableArray removeAllObjects](self->_directionsRequests, "removeAllObjects");
}

- (void)addDirectionsRequests:(id)a3
{
  id v4;
  NSMutableArray *directionsRequests;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  directionsRequests = self->_directionsRequests;
  v8 = v4;
  if (!directionsRequests)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_directionsRequests;
    self->_directionsRequests = v6;

    v4 = v8;
    directionsRequests = self->_directionsRequests;
  }
  -[NSMutableArray addObject:](directionsRequests, "addObject:", v4);

}

- (unint64_t)directionsRequestsCount
{
  return (unint64_t)-[NSMutableArray count](self->_directionsRequests, "count");
}

- (id)directionsRequestsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_directionsRequests, "objectAtIndex:", a3);
}

+ (Class)directionsRequestsType
{
  return (Class)objc_opt_class(GEODirectionsRequest, a2);
}

- (void)clearDirectionsResponses
{
  -[NSMutableArray removeAllObjects](self->_directionsResponses, "removeAllObjects");
}

- (void)addDirectionsResponses:(id)a3
{
  id v4;
  NSMutableArray *directionsResponses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  directionsResponses = self->_directionsResponses;
  v8 = v4;
  if (!directionsResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_directionsResponses;
    self->_directionsResponses = v6;

    v4 = v8;
    directionsResponses = self->_directionsResponses;
  }
  -[NSMutableArray addObject:](directionsResponses, "addObject:", v4);

}

- (unint64_t)directionsResponsesCount
{
  return (unint64_t)-[NSMutableArray count](self->_directionsResponses, "count");
}

- (id)directionsResponsesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_directionsResponses, "objectAtIndex:", a3);
}

+ (Class)directionsResponsesType
{
  return (Class)objc_opt_class(GEODirectionsResponse, a2);
}

- (void)setSelectedDirectionsResponseIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_selectedDirectionsResponseIndex = a3;
}

- (void)setHasSelectedDirectionsResponseIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSelectedDirectionsResponseIndex
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSelectedSuggestedRouteIndexInDirectionsResponse:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_selectedSuggestedRouteIndexInDirectionsResponse = a3;
}

- (void)setHasSelectedSuggestedRouteIndexInDirectionsResponse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSelectedSuggestedRouteIndexInDirectionsResponse
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasOverviewScreenshotImageData
{
  return self->_overviewScreenshotImageData != 0;
}

- (BOOL)hasDirectionsResponseID
{
  return self->_directionsResponseID != 0;
}

- (BOOL)hasStartWaypoint
{
  return self->_startWaypoint != 0;
}

- (BOOL)hasEndWaypoint
{
  return self->_endWaypoint != 0;
}

- (void)clearAuxiliaryControls
{
  -[NSMutableArray removeAllObjects](self->_auxiliaryControls, "removeAllObjects");
}

- (void)addAuxiliaryControls:(id)a3
{
  id v4;
  NSMutableArray *auxiliaryControls;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  auxiliaryControls = self->_auxiliaryControls;
  v8 = v4;
  if (!auxiliaryControls)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_auxiliaryControls;
    self->_auxiliaryControls = v6;

    v4 = v8;
    auxiliaryControls = self->_auxiliaryControls;
  }
  -[NSMutableArray addObject:](auxiliaryControls, "addObject:", v4);

}

- (unint64_t)auxiliaryControlsCount
{
  return (unint64_t)-[NSMutableArray count](self->_auxiliaryControls, "count");
}

- (id)auxiliaryControlsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_auxiliaryControls, "objectAtIndex:", a3);
}

+ (Class)auxiliaryControlsType
{
  return (Class)objc_opt_class(GEORPAuxiliaryControl, a2);
}

- (void)setOriginatingAuxiliaryControlIndex:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_originatingAuxiliaryControlIndex = a3;
}

- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasStartWaypointCorrectedSearchTemplate
{
  return self->_startWaypointCorrectedSearchTemplate != 0;
}

- (BOOL)hasEndWaypointCorrectedSearchTemplate
{
  return self->_endWaypointCorrectedSearchTemplate != 0;
}

- (unint64_t)clusteredRouteRideSelectionsCount
{
  return self->_clusteredRouteRideSelections.count;
}

- (unsigned)clusteredRouteRideSelections
{
  return self->_clusteredRouteRideSelections.list;
}

- (void)clearClusteredRouteRideSelections
{
  PBRepeatedUInt32Clear(&self->_clusteredRouteRideSelections, a2);
}

- (void)addClusteredRouteRideSelections:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_clusteredRouteRideSelections, *(_QWORD *)&a3);
}

- (unsigned)clusteredRouteRideSelectionsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_clusteredRouteRideSelections;
  unint64_t count;
  void *v6;
  void *v7;

  p_clusteredRouteRideSelections = &self->_clusteredRouteRideSelections;
  count = self->_clusteredRouteRideSelections.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_clusteredRouteRideSelections->list[a3];
}

- (void)setClusteredRouteRideSelections:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_clusteredRouteRideSelections, a3, a4);
}

- (void)setNavigationSessionID:(RAPNavSessionID)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_navigationSessionID = a3;
}

- (void)setHasNavigationSessionID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNavigationSessionID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearUserPaths
{
  -[NSMutableArray removeAllObjects](self->_userPaths, "removeAllObjects");
}

- (void)addUserPath:(id)a3
{
  id v4;
  NSMutableArray *userPaths;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  userPaths = self->_userPaths;
  v8 = v4;
  if (!userPaths)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_userPaths;
    self->_userPaths = v6;

    v4 = v8;
    userPaths = self->_userPaths;
  }
  -[NSMutableArray addObject:](userPaths, "addObject:", v4);

}

- (unint64_t)userPathsCount
{
  return (unint64_t)-[NSMutableArray count](self->_userPaths, "count");
}

- (id)userPathAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_userPaths, "objectAtIndex:", a3);
}

+ (Class)userPathType
{
  return (Class)objc_opt_class(RAPUserPathEntry, a2);
}

- (void)clearWaypoints
{
  -[NSMutableArray removeAllObjects](self->_waypoints, "removeAllObjects");
}

- (void)addWaypoints:(id)a3
{
  id v4;
  NSMutableArray *waypoints;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  waypoints = self->_waypoints;
  v8 = v4;
  if (!waypoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_waypoints;
    self->_waypoints = v6;

    v4 = v8;
    waypoints = self->_waypoints;
  }
  -[NSMutableArray addObject:](waypoints, "addObject:", v4);

}

- (unint64_t)waypointsCount
{
  return (unint64_t)-[NSMutableArray count](self->_waypoints, "count");
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_waypoints, "objectAtIndex:", a3);
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class(RAPUserSearchInput, a2);
}

- (void)clearRoutes
{
  -[NSMutableArray removeAllObjects](self->_routes, "removeAllObjects");
}

- (void)addRoute:(id)a3
{
  id v4;
  NSMutableArray *routes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  routes = self->_routes;
  v8 = v4;
  if (!routes)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_routes;
    self->_routes = v6;

    v4 = v8;
    routes = self->_routes;
  }
  -[NSMutableArray addObject:](routes, "addObject:", v4);

}

- (unint64_t)routesCount
{
  return (unint64_t)-[NSMutableArray count](self->_routes, "count");
}

- (id)routeAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_routes, "objectAtIndex:", a3);
}

+ (Class)routeType
{
  return (Class)objc_opt_class(GEOWaypointRoute, a2);
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RAPDirectionsRecording;
  v3 = -[RAPDirectionsRecording description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  char has;
  void *v19;
  void *v20;
  NSData *overviewScreenshotImageData;
  NSData *directionsResponseID;
  RAPUserSearchInput *startWaypoint;
  void *v24;
  RAPUserSearchInput *endWaypoint;
  void *v26;
  id v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *k;
  void *v33;
  void *v34;
  GEORPCorrectedSearch *startWaypointCorrectedSearchTemplate;
  void *v36;
  GEORPCorrectedSearch *endWaypointCorrectedSearchTemplate;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  NSMutableArray *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *m;
  void *v49;
  id v50;
  NSMutableArray *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *n;
  void *v56;
  id v57;
  NSMutableArray *v58;
  id v59;
  id v60;
  uint64_t v61;
  void *ii;
  void *v63;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (-[NSMutableArray count](self->_directionsRequests, "count"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_directionsRequests, "count"));
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v5 = self->_directionsRequests;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v86 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("directionsRequests"));
  }
  if (-[NSMutableArray count](self->_directionsResponses, "count"))
  {
    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_directionsResponses, "count"));
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v12 = self->_directionsResponses;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v82;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(_QWORD *)v82 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("directionsResponses"));
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selectedDirectionsResponseIndex));
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("selectedDirectionsResponseIndex"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selectedSuggestedRouteIndexInDirectionsResponse));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("selectedSuggestedRouteIndexInDirectionsResponse"));

  }
  overviewScreenshotImageData = self->_overviewScreenshotImageData;
  if (overviewScreenshotImageData)
    objc_msgSend(v3, "setObject:forKey:", overviewScreenshotImageData, CFSTR("overviewScreenshotImageData"));
  directionsResponseID = self->_directionsResponseID;
  if (directionsResponseID)
    objc_msgSend(v3, "setObject:forKey:", directionsResponseID, CFSTR("directionsResponseID"));
  startWaypoint = self->_startWaypoint;
  if (startWaypoint)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPUserSearchInput dictionaryRepresentation](startWaypoint, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("startWaypoint"));

  }
  endWaypoint = self->_endWaypoint;
  if (endWaypoint)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPUserSearchInput dictionaryRepresentation](endWaypoint, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("endWaypoint"));

  }
  if (-[NSMutableArray count](self->_auxiliaryControls, "count"))
  {
    v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_auxiliaryControls, "count"));
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v28 = self->_auxiliaryControls;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(_QWORD *)v78 != v31)
            objc_enumerationMutation(v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation"));
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("auxiliaryControls"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_originatingAuxiliaryControlIndex));
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("originatingAuxiliaryControlIndex"));

  }
  startWaypointCorrectedSearchTemplate = self->_startWaypointCorrectedSearchTemplate;
  if (startWaypointCorrectedSearchTemplate)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPCorrectedSearch dictionaryRepresentation](startWaypointCorrectedSearchTemplate, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("startWaypointCorrectedSearchTemplate"));

  }
  endWaypointCorrectedSearchTemplate = self->_endWaypointCorrectedSearchTemplate;
  if (endWaypointCorrectedSearchTemplate)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPCorrectedSearch dictionaryRepresentation](endWaypointCorrectedSearchTemplate, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("endWaypointCorrectedSearchTemplate"));

  }
  v39 = PBRepeatedUInt32NSArray(&self->_clusteredRouteRideSelections);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("clusteredRouteRideSelections"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v41 = sub_10044F2F8(&self->_navigationSessionID._high);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("navigationSessionID"));

  }
  if (-[NSMutableArray count](self->_userPaths, "count"))
  {
    v43 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_userPaths, "count"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v44 = self->_userPaths;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v74;
      do
      {
        for (m = 0; m != v46; m = (char *)m + 1)
        {
          if (*(_QWORD *)v74 != v47)
            objc_enumerationMutation(v44);
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)m), "dictionaryRepresentation"));
          objc_msgSend(v43, "addObject:", v49);

        }
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
      }
      while (v46);
    }

    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("userPath"));
  }
  if (-[NSMutableArray count](self->_waypoints, "count"))
  {
    v50 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_waypoints, "count"));
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v51 = self->_waypoints;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v70;
      do
      {
        for (n = 0; n != v53; n = (char *)n + 1)
        {
          if (*(_QWORD *)v70 != v54)
            objc_enumerationMutation(v51);
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)n), "dictionaryRepresentation"));
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
      }
      while (v53);
    }

    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("waypoints"));
  }
  if (-[NSMutableArray count](self->_routes, "count"))
  {
    v57 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_routes, "count"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v58 = self->_routes;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v66;
      do
      {
        for (ii = 0; ii != v60; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v66 != v61)
            objc_enumerationMutation(v58);
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)ii), "dictionaryRepresentation", (_QWORD)v65));
          objc_msgSend(v57, "addObject:", v63);

        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
      }
      while (v60);
    }

    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("route"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  int v12;
  RAPUserSearchInput *v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  unsigned int v21;
  unint64_t v22;
  char v23;
  uint64_t Data;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char v30;
  unsigned int v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  int v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                            + OBJC_IVAR___PBDataReader__length))
  {
LABEL_110:
    LOBYTE(v36) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    return v36;
  }
  while (2)
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      goto LABEL_110;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0)
        goto LABEL_11;
      v5 += 7;
      v10 = v6++ >= 9;
      if (v10)
      {
        v7 = 0;
        v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v7 = 0;
LABEL_13:
    v12 = v7 & 7;
    if (v11 || v12 == 4)
      goto LABEL_110;
    switch((v7 >> 3))
    {
      case 1u:
        v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEODirectionsRequest);
        -[RAPDirectionsRecording addDirectionsRequests:](self, "addDirectionsRequests:", v14);
        goto LABEL_80;
      case 2u:
        v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEODirectionsResponse);
        -[RAPDirectionsRecording addDirectionsResponses:](self, "addDirectionsResponses:", v14);
        goto LABEL_80;
      case 3u:
        v15 = 0;
        v16 = 0;
        v17 = 0;
        *(_BYTE *)&self->_has |= 4u;
        while (2)
        {
          v18 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v18 == -1 || v18 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v19 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
            v17 |= (unint64_t)(v19 & 0x7F) << v15;
            if (v19 < 0)
            {
              v15 += 7;
              v10 = v16++ >= 9;
              if (v10)
              {
                LODWORD(v17) = 0;
                goto LABEL_88;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v17) = 0;
LABEL_88:
        v43 = 120;
        goto LABEL_93;
      case 4u:
        v20 = 0;
        v21 = 0;
        v17 = 0;
        *(_BYTE *)&self->_has |= 8u;
        while (2)
        {
          v22 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v17 |= (unint64_t)(v23 & 0x7F) << v20;
            if (v23 < 0)
            {
              v20 += 7;
              v10 = v21++ >= 9;
              if (v10)
              {
                LODWORD(v17) = 0;
                goto LABEL_92;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v17) = 0;
LABEL_92:
        v43 = 124;
LABEL_93:
        *(_DWORD *)&self->PBCodable_opaque[v43] = v17;
        goto LABEL_83;
      case 5u:
        Data = PBReaderReadData(a3);
        v25 = objc_claimAutoreleasedReturnValue(Data);
        v26 = 104;
        goto LABEL_38;
      case 6u:
        v27 = PBReaderReadData(a3);
        v25 = objc_claimAutoreleasedReturnValue(v27);
        v26 = 72;
LABEL_38:
        v28 = *(void **)&self->PBCodable_opaque[v26];
        *(_QWORD *)&self->PBCodable_opaque[v26] = v25;

        goto LABEL_83;
      case 7u:
        v14 = objc_alloc_init(RAPUserSearchInput);
        v29 = 128;
        goto LABEL_41;
      case 8u:
        v14 = objc_alloc_init(RAPUserSearchInput);
        v29 = 88;
LABEL_41:
        objc_storeStrong((id *)&self->PBCodable_opaque[v29], v14);
        goto LABEL_76;
      case 9u:
        v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEORPAuxiliaryControl);
        -[RAPDirectionsRecording addAuxiliaryControls:](self, "addAuxiliaryControls:", v14);
        goto LABEL_80;
      case 0xAu:
        v30 = 0;
        v31 = 0;
        v32 = 0;
        *(_BYTE *)&self->_has |= 2u;
        while (2)
        {
          v33 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v33 == -1 || v33 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v33);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v33 + 1;
            v32 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              v10 = v31++ >= 9;
              if (v10)
              {
                v32 = 0;
                goto LABEL_97;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v32 = 0;
LABEL_97:
        self->_originatingAuxiliaryControlIndex = v32;
        goto LABEL_83;
      case 0xBu:
        v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEORPCorrectedSearch);
        v35 = 136;
        goto LABEL_52;
      case 0xCu:
        v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEORPCorrectedSearch);
        v35 = 96;
LABEL_52:
        objc_storeStrong((id *)&self->PBCodable_opaque[v35], v14);
        goto LABEL_80;
      case 0xDu:
        if (v12 == 2)
        {
          v51 = 0;
          v52 = 0;
          v36 = PBReaderPlaceMark(a3, &v51);
          if (!v36)
            return v36;
          while (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                                      + OBJC_IVAR___PBDataReader__length)
               && !*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          {
            v37 = 0;
            v38 = 0;
            v39 = 0;
            while (1)
            {
              v40 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
              if (v40 == -1 || v40 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
                break;
              v41 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v40);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v40 + 1;
              v39 |= (unint64_t)(v41 & 0x7F) << v37;
              if ((v41 & 0x80) == 0)
                goto LABEL_65;
              v37 += 7;
              v10 = v38++ >= 9;
              if (v10)
              {
                v42 = 0;
                goto LABEL_68;
              }
            }
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_65:
            if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
              v42 = 0;
            else
              v42 = v39;
LABEL_68:
            PBRepeatedUInt32Add(&self->_clusteredRouteRideSelections, v42);
          }
LABEL_71:
          PBReaderRecallMark(a3, &v51);
        }
        else
        {
          v44 = 0;
          v45 = 0;
          v46 = 0;
          while (1)
          {
            v47 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v47 == -1 || v47 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
              break;
            v48 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v47);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v47 + 1;
            v46 |= (unint64_t)(v48 & 0x7F) << v44;
            if ((v48 & 0x80) == 0)
              goto LABEL_106;
            v44 += 7;
            v10 = v45++ >= 9;
            if (v10)
            {
              v49 = 0;
              goto LABEL_109;
            }
          }
          *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_106:
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v49 = 0;
          else
            v49 = v46;
LABEL_109:
          PBRepeatedUInt32Add(&self->_clusteredRouteRideSelections, v49);
        }
        goto LABEL_83;
      case 0xEu:
        *(_BYTE *)&self->_has |= 1u;
        v51 = 0;
        v52 = 0;
        if (PBReaderPlaceMark(a3, &v51)
          && (sub_10044F390(&self->_navigationSessionID._high, (uint64_t)a3) & 1) != 0)
        {
          goto LABEL_71;
        }
        goto LABEL_113;
      case 0xFu:
        v14 = objc_alloc_init(RAPUserPathEntry);
        -[RAPDirectionsRecording addUserPath:](self, "addUserPath:", v14);
        v51 = 0;
        v52 = 0;
        if (!PBReaderPlaceMark(a3, &v51) || (sub_100A545B4((uint64_t)v14, (uint64_t)a3) & 1) == 0)
          goto LABEL_112;
        goto LABEL_82;
      case 0x10u:
        v14 = objc_alloc_init(RAPUserSearchInput);
        -[RAPDirectionsRecording addWaypoints:](self, "addWaypoints:", v14);
LABEL_76:
        v51 = 0;
        v52 = 0;
        if (!PBReaderPlaceMark(a3, &v51) || (sub_1006FEB20((uint64_t)v14, (uint64_t)a3) & 1) == 0)
          goto LABEL_112;
        goto LABEL_82;
      case 0x11u:
        v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEOWaypointRoute);
        -[RAPDirectionsRecording addRoute:](self, "addRoute:", v14);
LABEL_80:
        v51 = 0;
        v52 = 0;
        if (PBReaderPlaceMark(a3, &v51) && -[RAPUserSearchInput readFrom:](v14, "readFrom:", a3))
        {
LABEL_82:
          PBReaderRecallMark(a3, &v51);

LABEL_83:
          if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_110;
          continue;
        }
LABEL_112:

LABEL_113:
        LOBYTE(v36) = 0;
        return v36;
      default:
        if ((PBReaderSkipValueWithTag(a3) & 1) == 0)
          goto LABEL_113;
        goto LABEL_83;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  char has;
  NSData *overviewScreenshotImageData;
  NSData *directionsResponseID;
  RAPUserSearchInput *startWaypoint;
  RAPUserSearchInput *endWaypoint;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *k;
  GEORPCorrectedSearch *startWaypointCorrectedSearchTemplate;
  GEORPCorrectedSearch *endWaypointCorrectedSearchTemplate;
  unint64_t v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *m;
  NSMutableArray *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *n;
  NSMutableArray *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *ii;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];

  v4 = a3;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v5 = self->_directionsRequests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage(v4, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i), 1);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    }
    while (v7);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v10 = self->_directionsResponses;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v61 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage(v4, *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j), 2);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_selectedDirectionsResponseIndex, 3);
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteUint32Field(v4, self->_selectedSuggestedRouteIndexInDirectionsResponse, 4);
  overviewScreenshotImageData = self->_overviewScreenshotImageData;
  if (overviewScreenshotImageData)
    PBDataWriterWriteDataField(v4, overviewScreenshotImageData, 5);
  directionsResponseID = self->_directionsResponseID;
  if (directionsResponseID)
    PBDataWriterWriteDataField(v4, directionsResponseID, 6);
  startWaypoint = self->_startWaypoint;
  if (startWaypoint)
    PBDataWriterWriteSubmessage(v4, startWaypoint, 7);
  endWaypoint = self->_endWaypoint;
  if (endWaypoint)
    PBDataWriterWriteSubmessage(v4, endWaypoint, 8);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v20 = self->_auxiliaryControls;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v57;
    do
    {
      for (k = 0; k != v22; k = (char *)k + 1)
      {
        if (*(_QWORD *)v57 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage(v4, *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)k), 9);
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
    }
    while (v22);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field(v4, self->_originatingAuxiliaryControlIndex, 10);
  startWaypointCorrectedSearchTemplate = self->_startWaypointCorrectedSearchTemplate;
  if (startWaypointCorrectedSearchTemplate)
    PBDataWriterWriteSubmessage(v4, startWaypointCorrectedSearchTemplate, 11);
  endWaypointCorrectedSearchTemplate = self->_endWaypointCorrectedSearchTemplate;
  if (endWaypointCorrectedSearchTemplate)
    PBDataWriterWriteSubmessage(v4, endWaypointCorrectedSearchTemplate, 12);
  if (self->_clusteredRouteRideSelections.count)
  {
    v27 = 0;
    do
      PBDataWriterWriteUint32Field(v4, self->_clusteredRouteRideSelections.list[v27++], 13);
    while (v27 < self->_clusteredRouteRideSelections.count);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v55 = 0;
    PBDataWriterPlaceMark(v4, &v55, 14);
    sub_10044F60C(&self->_navigationSessionID._high, v4);
    PBDataWriterRecallMark(v4, &v55);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v28 = self->_userPaths;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v52;
    do
    {
      for (m = 0; m != v30; m = (char *)m + 1)
      {
        if (*(_QWORD *)v52 != v31)
          objc_enumerationMutation(v28);
        PBDataWriterWriteSubmessage(v4, *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)m), 15);
      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
    }
    while (v30);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v33 = self->_waypoints;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v48;
    do
    {
      for (n = 0; n != v35; n = (char *)n + 1)
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(v33);
        PBDataWriterWriteSubmessage(v4, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)n), 16);
      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
    }
    while (v35);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v38 = self->_routes;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v43, v68, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v44;
    do
    {
      for (ii = 0; ii != v40; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v44 != v41)
          objc_enumerationMutation(v38);
        PBDataWriterWriteSubmessage(v4, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)ii), 17);
      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v43, v68, 16);
    }
    while (v40);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  char has;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t ii;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t jj;
  void *v31;
  char *v32;

  v32 = (char *)a3;
  if (-[RAPDirectionsRecording directionsRequestsCount](self, "directionsRequestsCount"))
  {
    objc_msgSend(v32, "clearDirectionsRequests");
    v4 = -[RAPDirectionsRecording directionsRequestsCount](self, "directionsRequestsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsRequestsAtIndex:](self, "directionsRequestsAtIndex:", i));
        objc_msgSend(v32, "addDirectionsRequests:", v7);

      }
    }
  }
  if (-[RAPDirectionsRecording directionsResponsesCount](self, "directionsResponsesCount"))
  {
    objc_msgSend(v32, "clearDirectionsResponses");
    v8 = -[RAPDirectionsRecording directionsResponsesCount](self, "directionsResponsesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsResponsesAtIndex:](self, "directionsResponsesAtIndex:", j));
        objc_msgSend(v32, "addDirectionsResponses:", v11);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v32 + 30) = self->_selectedDirectionsResponseIndex;
    v32[160] |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v32 + 31) = self->_selectedSuggestedRouteIndexInDirectionsResponse;
    v32[160] |= 8u;
  }
  if (self->_overviewScreenshotImageData)
    objc_msgSend(v32, "setOverviewScreenshotImageData:");
  if (self->_directionsResponseID)
    objc_msgSend(v32, "setDirectionsResponseID:");
  if (self->_startWaypoint)
    objc_msgSend(v32, "setStartWaypoint:");
  if (self->_endWaypoint)
    objc_msgSend(v32, "setEndWaypoint:");
  if (-[RAPDirectionsRecording auxiliaryControlsCount](self, "auxiliaryControlsCount"))
  {
    objc_msgSend(v32, "clearAuxiliaryControls");
    v13 = -[RAPDirectionsRecording auxiliaryControlsCount](self, "auxiliaryControlsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording auxiliaryControlsAtIndex:](self, "auxiliaryControlsAtIndex:", k));
        objc_msgSend(v32, "addAuxiliaryControls:", v16);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v32 + 6) = self->_originatingAuxiliaryControlIndex;
    v32[160] |= 2u;
  }
  if (self->_startWaypointCorrectedSearchTemplate)
    objc_msgSend(v32, "setStartWaypointCorrectedSearchTemplate:");
  if (self->_endWaypointCorrectedSearchTemplate)
    objc_msgSend(v32, "setEndWaypointCorrectedSearchTemplate:");
  if (-[RAPDirectionsRecording clusteredRouteRideSelectionsCount](self, "clusteredRouteRideSelectionsCount"))
  {
    objc_msgSend(v32, "clearClusteredRouteRideSelections");
    v17 = -[RAPDirectionsRecording clusteredRouteRideSelectionsCount](self, "clusteredRouteRideSelectionsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
        objc_msgSend(v32, "addClusteredRouteRideSelections:", -[RAPDirectionsRecording clusteredRouteRideSelectionsAtIndex:](self, "clusteredRouteRideSelectionsAtIndex:", m));
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(RAPNavSessionID *)(v32 + 8) = self->_navigationSessionID;
    v32[160] |= 1u;
  }
  if (-[RAPDirectionsRecording userPathsCount](self, "userPathsCount"))
  {
    objc_msgSend(v32, "clearUserPaths");
    v20 = -[RAPDirectionsRecording userPathsCount](self, "userPathsCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording userPathAtIndex:](self, "userPathAtIndex:", n));
        objc_msgSend(v32, "addUserPath:", v23);

      }
    }
  }
  if (-[RAPDirectionsRecording waypointsCount](self, "waypointsCount"))
  {
    objc_msgSend(v32, "clearWaypoints");
    v24 = -[RAPDirectionsRecording waypointsCount](self, "waypointsCount");
    if (v24)
    {
      v25 = v24;
      for (ii = 0; ii != v25; ++ii)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording waypointsAtIndex:](self, "waypointsAtIndex:", ii));
        objc_msgSend(v32, "addWaypoints:", v27);

      }
    }
  }
  if (-[RAPDirectionsRecording routesCount](self, "routesCount"))
  {
    objc_msgSend(v32, "clearRoutes");
    v28 = -[RAPDirectionsRecording routesCount](self, "routesCount");
    if (v28)
    {
      v29 = v28;
      for (jj = 0; jj != v29; ++jj)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording routeAtIndex:](self, "routeAtIndex:", jj));
        objc_msgSend(v32, "addRoute:", v31);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  id v17;
  char has;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  NSMutableArray *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *k;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  NSMutableArray *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *m;
  id v42;
  NSMutableArray *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *n;
  id v48;
  NSMutableArray *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *ii;
  id v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
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
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];

  v5 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v6 = self->_directionsRequests;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v77 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v5, "addDirectionsRequests:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
    }
    while (v8);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v12 = self->_directionsResponses;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v73;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v73 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v5, "addDirectionsResponses:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    }
    while (v14);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 30) = self->_selectedDirectionsResponseIndex;
    v5[160] |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 31) = self->_selectedSuggestedRouteIndexInDirectionsResponse;
    v5[160] |= 8u;
  }
  v19 = -[NSData copyWithZone:](self->_overviewScreenshotImageData, "copyWithZone:", a3);
  v20 = (void *)*((_QWORD *)v5 + 13);
  *((_QWORD *)v5 + 13) = v19;

  v21 = -[NSData copyWithZone:](self->_directionsResponseID, "copyWithZone:", a3);
  v22 = (void *)*((_QWORD *)v5 + 9);
  *((_QWORD *)v5 + 9) = v21;

  v23 = -[RAPUserSearchInput copyWithZone:](self->_startWaypoint, "copyWithZone:", a3);
  v24 = (void *)*((_QWORD *)v5 + 16);
  *((_QWORD *)v5 + 16) = v23;

  v25 = -[RAPUserSearchInput copyWithZone:](self->_endWaypoint, "copyWithZone:", a3);
  v26 = (void *)*((_QWORD *)v5 + 11);
  *((_QWORD *)v5 + 11) = v25;

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v27 = self->_auxiliaryControls;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v29; k = (char *)k + 1)
      {
        if (*(_QWORD *)v69 != v30)
          objc_enumerationMutation(v27);
        v32 = objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)k), "copyWithZone:", a3);
        objc_msgSend(v5, "addAuxiliaryControls:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
    }
    while (v29);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v5 + 6) = self->_originatingAuxiliaryControlIndex;
    v5[160] |= 2u;
  }
  v33 = -[GEORPCorrectedSearch copyWithZone:](self->_startWaypointCorrectedSearchTemplate, "copyWithZone:", a3);
  v34 = (void *)*((_QWORD *)v5 + 17);
  *((_QWORD *)v5 + 17) = v33;

  v35 = -[GEORPCorrectedSearch copyWithZone:](self->_endWaypointCorrectedSearchTemplate, "copyWithZone:", a3);
  v36 = (void *)*((_QWORD *)v5 + 12);
  *((_QWORD *)v5 + 12) = v35;

  PBRepeatedUInt32Copy(v5 + 24, &self->_clusteredRouteRideSelections);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(RAPNavSessionID *)(v5 + 8) = self->_navigationSessionID;
    v5[160] |= 1u;
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v37 = self->_userPaths;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v65;
    do
    {
      for (m = 0; m != v39; m = (char *)m + 1)
      {
        if (*(_QWORD *)v65 != v40)
          objc_enumerationMutation(v37);
        v42 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)m), "copyWithZone:", a3);
        objc_msgSend(v5, "addUserPath:", v42);

      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
    }
    while (v39);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v43 = self->_waypoints;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v61;
    do
    {
      for (n = 0; n != v45; n = (char *)n + 1)
      {
        if (*(_QWORD *)v61 != v46)
          objc_enumerationMutation(v43);
        v48 = objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)n), "copyWithZone:", a3);
        objc_msgSend(v5, "addWaypoints:", v48);

      }
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
    }
    while (v45);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v49 = self->_routes;
  v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v57;
    do
    {
      for (ii = 0; ii != v51; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v57 != v52)
          objc_enumerationMutation(v49);
        v54 = objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)ii), "copyWithZone:", a3, (_QWORD)v56);
        objc_msgSend(v5, "addRoute:", v54);

      }
      v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
    }
    while (v51);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSMutableArray *directionsRequests;
  NSMutableArray *directionsResponses;
  NSData *overviewScreenshotImageData;
  NSData *directionsResponseID;
  RAPUserSearchInput *startWaypoint;
  RAPUserSearchInput *endWaypoint;
  NSMutableArray *auxiliaryControls;
  GEORPCorrectedSearch *startWaypointCorrectedSearchTemplate;
  GEORPCorrectedSearch *endWaypointCorrectedSearchTemplate;
  NSMutableArray *userPaths;
  NSMutableArray *waypoints;
  NSMutableArray *routes;
  unsigned __int8 v18;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_51;
  directionsRequests = self->_directionsRequests;
  if ((unint64_t)directionsRequests | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](directionsRequests, "isEqual:"))
      goto LABEL_51;
  }
  directionsResponses = self->_directionsResponses;
  if ((unint64_t)directionsResponses | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](directionsResponses, "isEqual:"))
      goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[160] & 4) == 0 || self->_selectedDirectionsResponseIndex != *((_DWORD *)v4 + 30))
      goto LABEL_51;
  }
  else if ((v4[160] & 4) != 0)
  {
LABEL_51:
    v18 = 0;
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[160] & 8) == 0 || self->_selectedSuggestedRouteIndexInDirectionsResponse != *((_DWORD *)v4 + 31))
      goto LABEL_51;
  }
  else if ((v4[160] & 8) != 0)
  {
    goto LABEL_51;
  }
  overviewScreenshotImageData = self->_overviewScreenshotImageData;
  if ((unint64_t)overviewScreenshotImageData | *((_QWORD *)v4 + 13)
    && !-[NSData isEqual:](overviewScreenshotImageData, "isEqual:"))
  {
    goto LABEL_51;
  }
  directionsResponseID = self->_directionsResponseID;
  if ((unint64_t)directionsResponseID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](directionsResponseID, "isEqual:"))
      goto LABEL_51;
  }
  startWaypoint = self->_startWaypoint;
  if ((unint64_t)startWaypoint | *((_QWORD *)v4 + 16))
  {
    if (!-[RAPUserSearchInput isEqual:](startWaypoint, "isEqual:"))
      goto LABEL_51;
  }
  endWaypoint = self->_endWaypoint;
  if ((unint64_t)endWaypoint | *((_QWORD *)v4 + 11))
  {
    if (!-[RAPUserSearchInput isEqual:](endWaypoint, "isEqual:"))
      goto LABEL_51;
  }
  auxiliaryControls = self->_auxiliaryControls;
  if ((unint64_t)auxiliaryControls | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](auxiliaryControls, "isEqual:"))
      goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[160] & 2) == 0 || self->_originatingAuxiliaryControlIndex != *((_QWORD *)v4 + 6))
      goto LABEL_51;
  }
  else if ((v4[160] & 2) != 0)
  {
    goto LABEL_51;
  }
  startWaypointCorrectedSearchTemplate = self->_startWaypointCorrectedSearchTemplate;
  if ((unint64_t)startWaypointCorrectedSearchTemplate | *((_QWORD *)v4 + 17)
    && !-[GEORPCorrectedSearch isEqual:](startWaypointCorrectedSearchTemplate, "isEqual:"))
  {
    goto LABEL_51;
  }
  endWaypointCorrectedSearchTemplate = self->_endWaypointCorrectedSearchTemplate;
  if ((unint64_t)endWaypointCorrectedSearchTemplate | *((_QWORD *)v4 + 12))
  {
    if (!-[GEORPCorrectedSearch isEqual:](endWaypointCorrectedSearchTemplate, "isEqual:"))
      goto LABEL_51;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_clusteredRouteRideSelections, v4 + 24))
    goto LABEL_51;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[160] & 1) == 0)
      goto LABEL_51;
    if (self->_navigationSessionID._high != *((_QWORD *)v4 + 1)
      || self->_navigationSessionID._low != *((_QWORD *)v4 + 2))
    {
      goto LABEL_51;
    }
  }
  else if ((v4[160] & 1) != 0)
  {
    goto LABEL_51;
  }
  userPaths = self->_userPaths;
  if ((unint64_t)userPaths | *((_QWORD *)v4 + 18)
    && !-[NSMutableArray isEqual:](userPaths, "isEqual:"))
  {
    goto LABEL_51;
  }
  waypoints = self->_waypoints;
  if ((unint64_t)waypoints | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](waypoints, "isEqual:"))
      goto LABEL_51;
  }
  routes = self->_routes;
  if ((unint64_t)routes | *((_QWORD *)v4 + 14))
    v18 = -[NSMutableArray isEqual:](routes, "isEqual:");
  else
    v18 = 1;
LABEL_52:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v19 = (unint64_t)-[NSMutableArray hash](self->_directionsRequests, "hash");
  v18 = (unint64_t)-[NSMutableArray hash](self->_directionsResponses, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v17 = 2654435761 * self->_selectedDirectionsResponseIndex;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v17 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v16 = 2654435761 * self->_selectedSuggestedRouteIndexInDirectionsResponse;
      goto LABEL_6;
    }
  }
  v16 = 0;
LABEL_6:
  v15 = (unint64_t)-[NSData hash](self->_overviewScreenshotImageData, "hash");
  v3 = (unint64_t)-[NSData hash](self->_directionsResponseID, "hash");
  v4 = -[RAPUserSearchInput hash](self->_startWaypoint, "hash");
  v5 = -[RAPUserSearchInput hash](self->_endWaypoint, "hash");
  v6 = (unint64_t)-[NSMutableArray hash](self->_auxiliaryControls, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761u * self->_originatingAuxiliaryControlIndex;
  else
    v7 = 0;
  v8 = (unint64_t)-[GEORPCorrectedSearch hash](self->_startWaypointCorrectedSearchTemplate, "hash");
  v9 = (unint64_t)-[GEORPCorrectedSearch hash](self->_endWaypointCorrectedSearchTemplate, "hash");
  v10 = PBRepeatedUInt32Hash(&self->_clusteredRouteRideSelections);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = PBHashBytes(&self->_navigationSessionID, 16);
  else
    v11 = 0;
  v12 = v10 ^ v11 ^ (unint64_t)-[NSMutableArray hash](self->_userPaths, "hash");
  v13 = v12 ^ (unint64_t)-[NSMutableArray hash](self->_waypoints, "hash");
  return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v13 ^ (unint64_t)-[NSMutableArray hash](self->_routes, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  char v15;
  RAPUserSearchInput *startWaypoint;
  uint64_t v17;
  RAPUserSearchInput *endWaypoint;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *k;
  GEORPCorrectedSearch *startWaypointCorrectedSearchTemplate;
  uint64_t v26;
  GEORPCorrectedSearch *endWaypointCorrectedSearchTemplate;
  uint64_t v28;
  char *v29;
  char *v30;
  char *m;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *n;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *ii;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *jj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];

  v4 = (char *)a3;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v5 = *((id *)v4 + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v68 != v8)
          objc_enumerationMutation(v5);
        -[RAPDirectionsRecording addDirectionsRequests:](self, "addDirectionsRequests:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v7);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v10 = *((id *)v4 + 10);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v64 != v13)
          objc_enumerationMutation(v10);
        -[RAPDirectionsRecording addDirectionsResponses:](self, "addDirectionsResponses:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v12);
  }

  v15 = v4[160];
  if ((v15 & 4) != 0)
  {
    self->_selectedDirectionsResponseIndex = *((_DWORD *)v4 + 30);
    *(_BYTE *)&self->_has |= 4u;
    v15 = v4[160];
  }
  if ((v15 & 8) != 0)
  {
    self->_selectedSuggestedRouteIndexInDirectionsResponse = *((_DWORD *)v4 + 31);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 13))
    -[RAPDirectionsRecording setOverviewScreenshotImageData:](self, "setOverviewScreenshotImageData:");
  if (*((_QWORD *)v4 + 9))
    -[RAPDirectionsRecording setDirectionsResponseID:](self, "setDirectionsResponseID:");
  startWaypoint = self->_startWaypoint;
  v17 = *((_QWORD *)v4 + 16);
  if (startWaypoint)
  {
    if (v17)
      -[RAPUserSearchInput mergeFrom:](startWaypoint, "mergeFrom:");
  }
  else if (v17)
  {
    -[RAPDirectionsRecording setStartWaypoint:](self, "setStartWaypoint:");
  }
  endWaypoint = self->_endWaypoint;
  v19 = *((_QWORD *)v4 + 11);
  if (endWaypoint)
  {
    if (v19)
      -[RAPUserSearchInput mergeFrom:](endWaypoint, "mergeFrom:");
  }
  else if (v19)
  {
    -[RAPDirectionsRecording setEndWaypoint:](self, "setEndWaypoint:");
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v20 = *((id *)v4 + 7);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v22; k = (char *)k + 1)
      {
        if (*(_QWORD *)v60 != v23)
          objc_enumerationMutation(v20);
        -[RAPDirectionsRecording addAuxiliaryControls:](self, "addAuxiliaryControls:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)k));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    }
    while (v22);
  }

  if ((v4[160] & 2) != 0)
  {
    self->_originatingAuxiliaryControlIndex = *((_QWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  startWaypointCorrectedSearchTemplate = self->_startWaypointCorrectedSearchTemplate;
  v26 = *((_QWORD *)v4 + 17);
  if (startWaypointCorrectedSearchTemplate)
  {
    if (v26)
      -[GEORPCorrectedSearch mergeFrom:](startWaypointCorrectedSearchTemplate, "mergeFrom:");
  }
  else if (v26)
  {
    -[RAPDirectionsRecording setStartWaypointCorrectedSearchTemplate:](self, "setStartWaypointCorrectedSearchTemplate:");
  }
  endWaypointCorrectedSearchTemplate = self->_endWaypointCorrectedSearchTemplate;
  v28 = *((_QWORD *)v4 + 12);
  if (endWaypointCorrectedSearchTemplate)
  {
    if (v28)
      -[GEORPCorrectedSearch mergeFrom:](endWaypointCorrectedSearchTemplate, "mergeFrom:");
  }
  else if (v28)
  {
    -[RAPDirectionsRecording setEndWaypointCorrectedSearchTemplate:](self, "setEndWaypointCorrectedSearchTemplate:");
  }
  v29 = (char *)objc_msgSend(v4, "clusteredRouteRideSelectionsCount");
  if (v29)
  {
    v30 = v29;
    for (m = 0; m != v30; ++m)
      -[RAPDirectionsRecording addClusteredRouteRideSelections:](self, "addClusteredRouteRideSelections:", objc_msgSend(v4, "clusteredRouteRideSelectionsAtIndex:", m));
  }
  if ((v4[160] & 1) != 0)
  {
    self->_navigationSessionID = *(RAPNavSessionID *)(v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v32 = *((id *)v4 + 18);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v56;
    do
    {
      for (n = 0; n != v34; n = (char *)n + 1)
      {
        if (*(_QWORD *)v56 != v35)
          objc_enumerationMutation(v32);
        -[RAPDirectionsRecording addUserPath:](self, "addUserPath:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)n));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
    }
    while (v34);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v37 = *((id *)v4 + 19);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v52;
    do
    {
      for (ii = 0; ii != v39; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v52 != v40)
          objc_enumerationMutation(v37);
        -[RAPDirectionsRecording addWaypoints:](self, "addWaypoints:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)ii));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
    }
    while (v39);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v42 = *((id *)v4 + 14);
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v48;
    do
    {
      for (jj = 0; jj != v44; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v48 != v45)
          objc_enumerationMutation(v42);
        -[RAPDirectionsRecording addRoute:](self, "addRoute:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)jj), (_QWORD)v47);
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
    }
    while (v44);
  }

}

- (NSMutableArray)directionsRequests
{
  return self->_directionsRequests;
}

- (void)setDirectionsRequests:(id)a3
{
  objc_storeStrong((id *)&self->_directionsRequests, a3);
}

- (NSMutableArray)directionsResponses
{
  return self->_directionsResponses;
}

- (void)setDirectionsResponses:(id)a3
{
  objc_storeStrong((id *)&self->_directionsResponses, a3);
}

- (unsigned)selectedDirectionsResponseIndex
{
  return self->_selectedDirectionsResponseIndex;
}

- (unsigned)selectedSuggestedRouteIndexInDirectionsResponse
{
  return self->_selectedSuggestedRouteIndexInDirectionsResponse;
}

- (NSData)overviewScreenshotImageData
{
  return self->_overviewScreenshotImageData;
}

- (void)setOverviewScreenshotImageData:(id)a3
{
  objc_storeStrong((id *)&self->_overviewScreenshotImageData, a3);
}

- (NSData)directionsResponseID
{
  return self->_directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
  objc_storeStrong((id *)&self->_directionsResponseID, a3);
}

- (RAPUserSearchInput)startWaypoint
{
  return self->_startWaypoint;
}

- (void)setStartWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_startWaypoint, a3);
}

- (RAPUserSearchInput)endWaypoint
{
  return self->_endWaypoint;
}

- (void)setEndWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_endWaypoint, a3);
}

- (NSArray)auxiliaryControls
{
  return &self->_auxiliaryControls->super;
}

- (void)setAuxiliaryControls:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryControls, a3);
}

- (unint64_t)originatingAuxiliaryControlIndex
{
  return self->_originatingAuxiliaryControlIndex;
}

- (GEORPCorrectedSearch)startWaypointCorrectedSearchTemplate
{
  return self->_startWaypointCorrectedSearchTemplate;
}

- (void)setStartWaypointCorrectedSearchTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_startWaypointCorrectedSearchTemplate, a3);
}

- (GEORPCorrectedSearch)endWaypointCorrectedSearchTemplate
{
  return self->_endWaypointCorrectedSearchTemplate;
}

- (void)setEndWaypointCorrectedSearchTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_endWaypointCorrectedSearchTemplate, a3);
}

- (RAPNavSessionID)navigationSessionID
{
  RAPNavSessionID *p_navigationSessionID;
  unint64_t high;
  unint64_t low;
  RAPNavSessionID result;

  p_navigationSessionID = &self->_navigationSessionID;
  high = self->_navigationSessionID._high;
  low = p_navigationSessionID->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (NSMutableArray)userPaths
{
  return self->_userPaths;
}

- (void)setUserPaths:(id)a3
{
  objc_storeStrong((id *)&self->_userPaths, a3);
}

- (NSMutableArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_waypoints, a3);
}

- (NSMutableArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
  objc_storeStrong((id *)&self->_routes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_userPaths, 0);
  objc_storeStrong((id *)&self->_startWaypointCorrectedSearchTemplate, 0);
  objc_storeStrong((id *)&self->_startWaypoint, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_overviewScreenshotImageData, 0);
  objc_storeStrong((id *)&self->_endWaypointCorrectedSearchTemplate, 0);
  objc_storeStrong((id *)&self->_endWaypoint, 0);
  objc_storeStrong((id *)&self->_directionsResponses, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_directionsRequests, 0);
  objc_storeStrong((id *)&self->_auxiliaryControls, 0);
}

@end
