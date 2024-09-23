@implementation RAPRouteFeedbackDataSource

- (RAPRouteFeedbackDataSource)initWithRecording:(id)a3 traitCollection:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPRouteFeedbackDataSource *v12;
  RAPRouteFeedbackDataSource *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RAPRouteFeedbackDataSource;
  v12 = -[RAPRouteFeedbackDataSource init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong((id *)&v13->_recording, a3);
    objc_storeStrong((id *)&v13->_traitCollection, a4);
    v14 = objc_alloc((Class)MKMapItem);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording endWaypoint](v13->_recording, "endWaypoint"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "placeMapItemStorage"));
    v17 = objc_msgSend(v14, "initWithGeoMapItem:isPlaceHolderPlace:", v16, 0);
    -[RAPRouteFeedbackDataSource setEndWaypointMapItem:](v13, "setEndWaypointMapItem:", v17);

    -[RAPRouteFeedbackDataSource _setupRoutes](v13, "_setupRoutes");
  }

  return v13;
}

- (void)_setupRoutes
{
  RAPDirectionsRecording *recording;
  void *v4;
  NSMutableArray *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  id v18;
  NSMutableDictionary *v19;
  NSArray *v20;
  NSArray *dataSources;
  id v22;
  NSObject *v23;
  id v24;
  RAPDirectionsRecording *v25;
  uint64_t v26;
  NSObject *v27;
  NSArray *v28;
  NSArray *v29;
  id v30;
  RAPDirectionsRecording *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  NSMutableDictionary *v35;
  id v36;
  id v37;
  RAPRouteFeedbackDataSource *v38;
  id v39;
  NSMutableArray *v40;
  _QWORD v41[4];
  NSMutableDictionary *v42;
  RAPRouteFeedbackDataSource *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint8_t buf[4];
  RAPDirectionsRecording *v48;

  recording = self->_recording;
  if (recording)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording userPaths](recording, "userPaths"));

    if (v4)
    {
      v5 = objc_opt_new(NSMutableArray);
      v6 = objc_opt_new(NSMutableDictionary);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording userPaths](self->_recording, "userPaths"));
      v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingComparator:", &stru_1011ACFD0));

      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1002293F8;
      v41[3] = &unk_1011ACFF8;
      v10 = v6;
      v42 = v10;
      v43 = self;
      v11 = v7;
      v44 = v11;
      v12 = v8;
      v45 = v12;
      objc_msgSend(v33, "enumerateObjectsUsingBlock:", v41);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v10, "allKeys"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingComparator:", &stru_1011AD038));

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100229728;
      v34[3] = &unk_1011AD060;
      v35 = v10;
      v36 = v11;
      v37 = v12;
      v38 = self;
      v39 = v14;
      v40 = v5;
      v15 = v5;
      v16 = v14;
      v17 = v12;
      v18 = v11;
      v19 = v10;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v34);
      v20 = (NSArray *)-[NSMutableArray copy](v15, "copy");
      dataSources = self->_dataSources;
      self->_dataSources = v20;

    }
    else
    {
      v24 = sub_1004483CC(self->_recording, 0);
      v25 = (RAPDirectionsRecording *)objc_claimAutoreleasedReturnValue(v24);
      if (v25)
      {
        v26 = objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource _buildDataSourceForRoute:displayedStepIndices:missedStepIndex:includeOrigin:includeDestination:](self, "_buildDataSourceForRoute:displayedStepIndices:missedStepIndex:includeOrigin:includeDestination:", v25, 0, 0x7FFFFFFFFFFFFFFFLL, 1, 1));
        v27 = v26;
        if (v26)
        {
          v46 = v26;
          v28 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
          v29 = self->_dataSources;
          self->_dataSources = v28;
        }
        else
        {
          v32 = sub_100431F8C();
          v29 = (NSArray *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(&v29->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v25;
            _os_log_impl((void *)&_mh_execute_header, &v29->super, OS_LOG_TYPE_ERROR, "Failed to create a dataSource for route: %@", buf, 0xCu);
          }
        }

      }
      else
      {
        v30 = sub_100431F8C();
        v27 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v31 = self->_recording;
          *(_DWORD *)buf = 138412290;
          v48 = v31;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to create a route from recording: %@", buf, 0xCu);
        }
      }

    }
  }
  else
  {
    v22 = sub_100431F8C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Cannot setup content without a recording", buf, 2u);
    }

  }
}

- (id)_buildDataSourceForRoute:(id)a3 displayedStepIndices:(id)a4 missedStepIndex:(unint64_t)a5 includeOrigin:(BOOL)a6 includeDestination:(BOOL)a7
{
  RouteStepListDataSource *v7;
  uint64_t v10;
  uint64_t v11;
  id v12;
  RouteStepListDataSource *v13;
  RouteStepListDataSource *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = (RouteStepListDataSource *)a3;
  if (a3)
  {
    v10 = 66;
    if (a6)
      v10 = 67;
    if (a7)
      v11 = v10 | 4;
    else
      v11 = v10;
    v12 = a4;
    v13 = v7;
    v14 = [RouteStepListDataSource alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource traitCollection](self, "traitCollection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[RouteStepListMetrics rapMetrics](RouteStepListMetrics, "rapMetrics"));
    v7 = -[RouteStepListDataSource initWithTraitCollection:options:metrics:context:](v14, "initWithTraitCollection:options:metrics:context:", v15, v11, v16, 2);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource traitCollection](self, "traitCollection"));
    -[RouteStepListDataSource setTraitCollection:](v7, "setTraitCollection:", v17);

    -[RouteStepListDataSource setRoute:](v7, "setRoute:", v13);
    -[RouteStepListDataSource setAllowedStepIndices:](v7, "setAllowedStepIndices:", v12);

    -[RouteStepListDataSource setMissedStepIndex:](v7, "setMissedStepIndex:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource vehicle](self, "vehicle"));
    -[RouteStepListDataSource setVehicle:](v7, "setVehicle:", v18);

    -[RouteStepListDataSource setDelegate:](v7, "setDelegate:", self);
  }
  return v7;
}

- (id)_userPathForStepItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSArray *dataSources;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  id v25;
  id v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  NSObject *v34;
  __int128 *v35;
  uint8_t buf[4];
  id v37;
  uint8_t v38[128];
  __int128 v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a3;
  v5 = objc_opt_class(RouteStepManeuverItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = objc_opt_class(RouteStepManeuverItem);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "step"));
  }
  else
  {
    v11 = objc_opt_class(RouteStepWaypointItem);
    if ((objc_opt_isKindOfClass(v4, v11) & 1) == 0)
    {
LABEL_24:
      v27 = sub_100431F8C();
      v17 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v39) = 138412290;
        *(_QWORD *)((char *)&v39 + 4) = v4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to find a userPath for stepItem: %@", (uint8_t *)&v39, 0xCu);
      }
      v26 = 0;
      goto LABEL_29;
    }
    v12 = v4;
    v13 = objc_opt_class(RouteStepWaypointItem);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      v14 = v12;
    else
      v14 = 0;
    v9 = v14;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrivalStep"));
  }
  v15 = (void *)v10;

  if (!v15)
    goto LABEL_24;
  *(_QWORD *)&v39 = 0;
  *((_QWORD *)&v39 + 1) = &v39;
  v40 = 0x2020000000;
  v41 = 0x7FFFFFFFFFFFFFFFLL;
  dataSources = self->_dataSources;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100229DE8;
  v33[3] = &unk_1011AD088;
  v17 = v15;
  v34 = v17;
  v35 = &v39;
  -[NSArray enumerateObjectsUsingBlock:](dataSources, "enumerateObjectsUsingBlock:", v33);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording userPaths](self->_recording, "userPaths", 0));
  v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v23 = objc_msgSend(v22, "routeIndex");
        if (*(_QWORD *)(*((_QWORD *)&v39 + 1) + 24) == v23)
        {
          v24 = objc_msgSend(v22, "stepIndex");
          if (-[NSObject stepIndex](v17, "stepIndex") == (id)v24)
          {
            v26 = v22;
            goto LABEL_28;
          }
        }
      }
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v19)
        continue;
      break;
    }
  }

  v25 = sub_100431F8C();
  v18 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v4;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Failed to find selected userPath for stepItem: %@", buf, 0xCu);
  }
  v26 = 0;
LABEL_28:

  _Block_object_dispose(&v39, 8);
LABEL_29:

  return v26;
}

- (id)_routeForStepItem:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_dataSources;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items", 0));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          while (2)
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              if (*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v15) == v4)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));

                goto LABEL_20;
              }
              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
            if (v13)
              continue;
            break;
          }
        }

        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v7);
  }

  v16 = sub_100431F8C();
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_FAULT, "Failed to find route for stepItem: %@", buf, 0xCu);
  }
  v17 = 0;
LABEL_20:

  return v17;
}

- (NSArray)allItems
{
  NSArray *concatenatedStepItems;
  NSArray *v4;
  NSArray *v5;

  concatenatedStepItems = self->_concatenatedStepItems;
  if (!concatenatedStepItems)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource _buildStepItems](self, "_buildStepItems"));
    v5 = self->_concatenatedStepItems;
    self->_concatenatedStepItems = v4;

    concatenatedStepItems = self->_concatenatedStepItems;
  }
  return concatenatedStepItems;
}

- (void)setTraitCollection:(id)a3
{
  id v5;
  UITraitCollection *traitCollection;
  id v7;
  unsigned __int8 v8;
  NSArray *dataSources;
  unint64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  traitCollection = self->_traitCollection;
  v10 = (unint64_t)v5;
  v7 = traitCollection;
  if (v10 | (unint64_t)v7)
  {
    v8 = objc_msgSend((id)v10, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_traitCollection, a3);
      dataSources = self->_dataSources;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10022A1BC;
      v11[3] = &unk_1011AD0B0;
      v12 = (id)v10;
      -[NSArray enumerateObjectsUsingBlock:](dataSources, "enumerateObjectsUsingBlock:", v11);

    }
  }

}

- (void)setVehicle:(id)a3
{
  id v5;
  VGVehicle *vehicle;
  id v7;
  unsigned __int8 v8;
  NSArray *dataSources;
  unint64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  vehicle = self->_vehicle;
  v10 = (unint64_t)v5;
  v7 = vehicle;
  if (v10 | (unint64_t)v7)
  {
    v8 = objc_msgSend((id)v10, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_vehicle, a3);
      dataSources = self->_dataSources;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10022A2A8;
      v11[3] = &unk_1011AD0B0;
      v12 = (id)v10;
      -[NSArray enumerateObjectsUsingBlock:](dataSources, "enumerateObjectsUsingBlock:", v11);

    }
  }

}

- (id)_buildStepItems
{
  NSMutableArray *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  NSMutableArray *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_opt_new(NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_dataSources;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8), "items"));
        -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10022A448;
  v14[3] = &unk_1011AD0D8;
  v15 = v3;
  v10 = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v10, "lastObject"));
  objc_msgSend(v11, "setShowsHairline:", 0);

  v12 = -[NSMutableArray copy](v10, "copy");
  return v12;
}

- (id)_stepItemForIndexPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSArray *v12;
  NSArray *v13;
  void *v14;
  __CFString *v15;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  RAPRouteFeedbackDataSource *v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 == (id)1)
  {
    v7 = objc_msgSend(v4, "row");
    if ((uint64_t)v7 < (int64_t)-[NSArray count](self->_concatenatedStepItems, "count"))
    {
      v6 = objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_concatenatedStepItems, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
      goto LABEL_6;
    }
    v11 = sub_100431F8C();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = self->_concatenatedStepItems;
      v13 = v12;
      if (v12)
      {
        if (-[NSArray count](v12, "count"))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](v13, "componentsJoinedByString:", CFSTR(", ")));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v13, v14));

        }
        else
        {
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v13));
        }
      }
      else
      {
        v15 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 138412546;
      v18 = v4;
      v19 = 2112;
      v20 = (RAPRouteFeedbackDataSource *)v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "_stepItemForIndexPath: called with invalid indexPath: %@, _concatenatedStepItems: %@", buf, 0x16u);

    }
LABEL_16:

    v8 = 0;
    goto LABEL_17;
  }
  if (v5)
  {
    v9 = sub_100431F8C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v18 = v4;
      v19 = 2112;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "_stepItemForIndexPath: called with invalid section: %lu, dataSource: %@", buf, 0x16u);
    }
    goto LABEL_16;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_concatenatedStepItems, "lastObject"));
LABEL_6:
  v8 = (void *)v6;
LABEL_17:

  return v8;
}

- (NSString)description
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  VGVehicle *vehicle;
  void *v13;
  void *v14;

  v3 = objc_opt_class(self);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording userPaths](self->_recording, "userPaths"));
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "count"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", ")));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v5, v6));

    }
    else
    {
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v5));
    }
  }
  else
  {
    v7 = CFSTR("<nil>");
  }

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource allItems](self, "allItems"));
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "count"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", ")));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v9, v10));

    }
    else
    {
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v9));
    }
  }
  else
  {
    v11 = CFSTR("<nil>");
  }

  vehicle = self->_vehicle;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource traitCollection](self, "traitCollection"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: userPaths='%@', allItems='%@', vehicle: %@, traitCollection: %@>"), v3, self, v7, v11, vehicle, v13));

  return (NSString *)v14;
}

- (void)_setNeedsUpdateData
{
  _QWORD block[5];

  if (!self->_needsUpdateData)
  {
    self->_needsUpdateData = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10022A950;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updateData
{
  NSArray *concatenatedStepItems;
  id WeakRetained;

  if (self->_needsUpdateData)
  {
    concatenatedStepItems = self->_concatenatedStepItems;
    self->_concatenatedStepItems = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dataSourceDidUpdate:", self);

    self->_needsUpdateData = 0;
  }
}

- (void)reloadDataSource:(id)a3
{
  -[RAPRouteFeedbackDataSource _setNeedsUpdateData](self, "_setNeedsUpdateData", a3);
}

- (void)reloadStepIndices:(id)a3 forDataSource:(id)a4
{
  -[RAPRouteFeedbackDataSource reloadDataSource:](self, "reloadDataSource:", a4);
}

- (Class)cellClassForItemType:(unint64_t)a3
{
  return +[RAPRouteFeedbackDataSource _cellClassForItemType:](RAPRouteFeedbackDataSource, "_cellClassForItemType:", a3);
}

+ (Class)_cellClassForItemType:(unint64_t)a3
{
  __objc2_class **v3;
  uint64_t v4;

  if (a3)
  {
    if (a3 != 1)
      return (Class)0;
    v3 = off_101197EB8;
  }
  else
  {
    v3 = &off_101197EC8;
  }
  v4 = objc_opt_class(*v3, a2);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (MKMapItem)endWaypointMapItem
{
  return self->_endWaypointMapItem;
}

- (void)setEndWaypointMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_endWaypointMapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endWaypointMapItem, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_concatenatedStepItems, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_recording, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
