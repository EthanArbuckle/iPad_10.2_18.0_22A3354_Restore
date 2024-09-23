@implementation RouteStepListDataSource

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSMutableIndexSet *excludedStepIndices;
  NSIndexSet *allowedStepIndices;
  NSArray *items;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    v6 = sub_100431C0C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](self->_route, "uniqueRouteID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](v5, "uniqueRouteID"));
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Changing data source's route from %@ to %@", (uint8_t *)&v14, 0x16u);

    }
    objc_storeStrong((id *)&self->_route, a3);
    self->_activeStepIndex = 0;
    excludedStepIndices = self->_excludedStepIndices;
    self->_excludedStepIndices = 0;

    allowedStepIndices = self->_allowedStepIndices;
    self->_allowedStepIndices = 0;

    self->_missedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    items = self->_items;
    self->_items = 0;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
    objc_msgSend(v13, "reloadDataSource:", self);

  }
}

- (NSMutableIndexSet)excludedStepIndices
{
  NSMutableIndexSet *excludedStepIndices;
  NSMutableIndexSet *v4;
  NSMutableIndexSet *v5;

  excludedStepIndices = self->_excludedStepIndices;
  if (!excludedStepIndices)
  {
    v4 = objc_opt_new(NSMutableIndexSet);
    v5 = self->_excludedStepIndices;
    self->_excludedStepIndices = v4;

    excludedStepIndices = self->_excludedStepIndices;
  }
  return excludedStepIndices;
}

- (unint64_t)_firstDisplayedStepIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  if ((-[RouteStepListDataSource options](self, "options") & 8) != 0)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource route](self, "route"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "steps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (objc_msgSend(v5, "maneuverType") == 17)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoStep"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instructionSet"));
    v8 = objc_msgSend(v7, "hasDrivingWalkingListInstruction") ^ 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)_highlightedStepIndex
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[RouteStepListDataSource _firstDisplayedStepIndex](self, "_firstDisplayedStepIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource route](self, "route"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "steps"));
  v6 = objc_msgSend(v5, "count");

  if (v3 >= (unint64_t)v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0;
  while (v3 + v7 != -[RouteStepListDataSource activeStepIndex](self, "activeStepIndex"))
  {
    if (-[RouteStepListDataSource activeStepIndex](self, "activeStepIndex") < v3 + v7 && !v7)
      return v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource route](self, "route"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "steps"));
    v10 = objc_msgSend(v9, "count");

    ++v7;
    if (v3 + v7 >= (unint64_t)v10)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  v3 += v7;
  return v3;
}

- (void)setActiveStepIndex:(unint64_t)a3
{
  unint64_t activeStepIndex;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSMutableIndexSet *v18;

  activeStepIndex = self->_activeStepIndex;
  if (activeStepIndex == a3)
    return;
  self->_activeStepIndex = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource items](self, "items"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    return;
  v18 = objc_opt_new(NSMutableIndexSet);
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && activeStepIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource items](self, "items"));
    if ((unint64_t)objc_msgSend(v8, "count") <= a3)
    {

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource items](self, "items"));
      v10 = objc_msgSend(v9, "count");

      if (activeStepIndex < (unint64_t)v10)
      {
        if (activeStepIndex >= a3)
          v11 = a3;
        else
          v11 = activeStepIndex;
        if (activeStepIndex <= a3)
          v12 = (char *)a3;
        else
          v12 = (char *)activeStepIndex;
        goto LABEL_16;
      }
    }
  }
  v11 = 0;
  v12 = (char *)-[NSArray count](self->_items, "count") - 1;
  do
  {
LABEL_16:
    if (a3 == v11)
      v13 = 2;
    else
      v13 = v11 >= a3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource items](self, "items"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v11));

    objc_msgSend(v15, "setState:", v13);
    -[NSMutableIndexSet addIndex:](v18, "addIndex:", v11);

    ++v11;
  }
  while (v11 <= (unint64_t)v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
  v17 = -[NSMutableIndexSet copy](v18, "copy");
  objc_msgSend(v16, "reloadStepIndices:forDataSource:", v17, self);

}

- (void)setMissedStepIndex:(unint64_t)a3
{
  NSArray *items;
  id v5;

  if (self->_missedStepIndex != a3)
  {
    self->_missedStepIndex = a3;
    items = self->_items;
    self->_items = 0;

    v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
    objc_msgSend(v5, "reloadDataSource:", self);

  }
}

- (void)setVehicle:(id)a3
{
  id v5;
  VGVehicle **p_vehicle;
  unint64_t v7;
  unint64_t v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSArray *items;
  void *v16;
  id v17;

  v5 = a3;
  p_vehicle = &self->_vehicle;
  v7 = self->_vehicle;
  v8 = (unint64_t)v5;
  if (v8 | v7)
  {
    v17 = (id)v8;
    v9 = objc_msgSend((id)v7, "isEqual:", v8);

    v8 = (unint64_t)v17;
    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](*p_vehicle, "displayName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "displayName"));
      if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle currentVehicleState](*p_vehicle, "currentVehicleState"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentVehicleState"));
        v14 = objc_msgSend(v12, "isSignificantlyDifferentFromVehicleState:", v13);

        v8 = (unint64_t)v17;
        if (!v14)
          goto LABEL_8;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_vehicle, a3);
      items = self->_items;
      self->_items = 0;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
      objc_msgSend(v16, "reloadDataSource:", self);

      v8 = (unint64_t)v17;
    }
  }
LABEL_8:

}

- (void)setAllowedStepIndices:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  NSArray *items;
  void *v10;
  id v11;

  v5 = a3;
  v6 = self->_allowedStepIndices;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v11 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v11;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_allowedStepIndices, a3);
      items = self->_items;
      self->_items = 0;

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
      objc_msgSend(v10, "reloadDataSource:", self);

      v7 = (unint64_t)v11;
    }
  }

}

- (void)setTraitCollection:(id)a3
{
  id v5;
  UITraitCollection *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSArray *items;
  UITraitCollection *v18;
  UITraitCollection *v19;

  v5 = a3;
  v6 = self->_traitCollection;
  v19 = (UITraitCollection *)v5;
  if (v6 == v19)
  {

    v18 = v19;
  }
  else
  {
    v7 = -[UITraitCollection userInterfaceStyle](v6, "userInterfaceStyle");
    if (v7 != (id)-[UITraitCollection userInterfaceStyle](v19, "userInterfaceStyle"))
      goto LABEL_8;
    -[UITraitCollection displayScale](v6, "displayScale");
    v9 = v8;
    -[UITraitCollection displayScale](v19, "displayScale");
    if (v9 != v10)
      goto LABEL_8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v6, "preferredContentSizeCategory"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v19, "preferredContentSizeCategory"));
    v13 = sub_1002A8950(v11, v12);

    if (!v13
      && (v14 = -[UITraitCollection horizontalSizeClass](v6, "horizontalSizeClass"),
          v14 == (id)-[UITraitCollection horizontalSizeClass](v19, "horizontalSizeClass")))
    {
      v15 = -[UITraitCollection verticalSizeClass](v6, "verticalSizeClass");
      v16 = -[UITraitCollection verticalSizeClass](v19, "verticalSizeClass");

      if (v15 == v16)
        goto LABEL_12;
    }
    else
    {
LABEL_8:

    }
    objc_storeStrong((id *)&self->_traitCollection, a3);
    items = self->_items;
    self->_items = 0;

    v18 = (UITraitCollection *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
    -[UITraitCollection reloadUIForDataSource:](v18, "reloadUIForDataSource:", self);
  }

LABEL_12:
}

- (void)setCurrentLocale:(id)a3
{
  void *v5;
  NSLocale **p_currentLocale;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  NSLocale *v10;
  NSLocale *v11;
  void *v12;
  unsigned __int8 v13;
  NSArray *items;
  id v15;

  v15 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", NSLocaleMeasurementSystem));
  p_currentLocale = &self->_currentLocale;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSLocale objectForKey:](self->_currentLocale, "objectForKey:", NSLocaleMeasurementSystem));
  v8 = v5;
  v9 = v7;
  if (!(v8 | v9))
  {
    v10 = (NSLocale *)v15;
    v11 = *p_currentLocale;
    *p_currentLocale = v10;
LABEL_5:

    goto LABEL_6;
  }
  v12 = (void *)v9;
  v13 = objc_msgSend((id)v8, "isEqual:", v9);

  objc_storeStrong((id *)&self->_currentLocale, a3);
  if ((v13 & 1) == 0)
  {
    items = self->_items;
    self->_items = 0;

    v11 = (NSLocale *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
    -[NSLocale reloadDataSource:](v11, "reloadDataSource:", self);
    goto LABEL_5;
  }
LABEL_6:

}

- (NSArray)items
{
  NSArray *items;

  items = self->_items;
  if (!items)
  {
    -[RouteStepListDataSource _calculateItems](self, "_calculateItems");
    items = self->_items;
  }
  return items;
}

- (unint64_t)itemIndexForStepIndex:(unint64_t)a3
{
  unint64_t v3;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD block[9];

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource excludedStepIndices](self, "excludedStepIndices"));
  v7 = objc_msgSend(v6, "containsIndex:", 0);

  if (!a3 && (v7 & 1) != 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource excludedStepIndices](self, "excludedStepIndices"));
  v10 = objc_msgSend(v9, "countOfIndexesInRange:", v7, a3 - v7);

  v3 = a3 - (_QWORD)v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource items](self, "items"));
  v12 = objc_msgSend(v11, "count");

  if (v3 < (unint64_t)v12)
    return v3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003E31A8;
  block[3] = &unk_1011AFFE8;
  block[6] = v12;
  block[7] = a3;
  block[8] = v8;
  block[4] = self;
  block[5] = v3;
  if (qword_1014D23A8 != -1)
    dispatch_once(&qword_1014D23A8, block);
  if (v12)
    return (unint64_t)v12 - 1;
  else
    return 0;
}

- (RouteStepListDataSource)initWithTraitCollection:(id)a3 options:(unint64_t)a4 metrics:(id)a5 context:(int64_t)a6
{
  id v11;
  id v12;
  RouteStepListDataSource *v13;
  RouteStepListDataSource *v14;
  uint64_t v15;
  NSLocale *currentLocale;
  void *v17;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RouteStepListDataSource;
  v13 = -[RouteStepListDataSource init](&v19, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_traitCollection, a3);
    v14->_options = a4;
    objc_storeStrong((id *)&v14->_metrics, a5);
    v14->_context = a6;
    v14->_missedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    v15 = objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    currentLocale = v14->_currentLocale;
    v14->_currentLocale = (NSLocale *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v14, "_localeDidChange", NSCurrentLocaleDidChangeNotification, 0);

  }
  return v14;
}

- (id)firstStepManeuverItem
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource items](self, "items", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        v7 = objc_opt_class(RouteStepManeuverItem);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)lastStepManeuverItem
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource items](self, "items", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "reverseObjectEnumerator"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(RouteStepManeuverItem);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_calculateItems
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  RouteStepWaypointItem *v16;
  void *v17;
  void *v18;
  RouteStepWaypointItem *v19;
  void *v20;
  char *v21;
  char *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  DirectionsWaypoint *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  RouteStepManeuverItem *v43;
  void *v44;
  id v45;
  RouteStepManeuverItem *v46;
  RouteStepWaypointItem *v47;
  RouteStepWaypointItem *v48;
  void *v49;
  void *v50;
  RouteStepWaypointItem *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  RouteStepWaypointItem *v57;
  void *v58;
  unsigned int v59;
  uint64_t v60;
  RouteStepFooterItem *v61;
  void *v62;
  RouteStepFooterItem *v63;
  id v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  NSMutableArray *v70;
  void *v71;
  void *v72;
  unint64_t v73;
  unint64_t v74;
  void *v75;
  GEOComposedRoute *v76;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  NSMutableArray *v80;
  __int16 v81;
  id v82;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource metrics](self, "metrics"));
  v74 = -[RouteStepListDataSource activeStepIndex](self, "activeStepIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource traitCollection](self, "traitCollection"));
  objc_msgSend(v5, "displayScale");
  v7 = v6;

  v76 = self->_route;
  if (-[GEOComposedRoute isEVRoute](v76, "isEVRoute"))
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource vehicle](self, "vehicle"));
  else
    v71 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource route](self, "route"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_directionsWaypoints"));

  v10 = sub_100431C0C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute name](v76, "name"));
    v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](v76, "uniqueRouteID"));
    *(_DWORD *)buf = 138412802;
    v78 = v12;
    v79 = 2112;
    v80 = v13;
    v81 = 2048;
    v82 = -[GEOComposedRoute stepsCount](v76, "stepsCount");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Calculating items for route %@ (%@) with steps %lu", buf, 0x20u);

  }
  if ((-[RouteStepListDataSource options](self, "options") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource route](self, "route"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "origin"));

    if (v15)
    {
      v16 = [RouteStepWaypointItem alloc];
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
      v19 = -[RouteStepWaypointItem initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:](v16, "initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:", v17, 0, 0, v71, v76, objc_msgSend(v18, "cellClassForItemType:", 0), v7, v74 == 0, v4, self->_context);

      -[RouteStepListDataSource _appendItem:toArray:](self, "_appendItem:toArray:", v19, v3);
    }
  }
  v69 = v9;
  v73 = -[RouteStepListDataSource _highlightedStepIndex](self, "_highlightedStepIndex");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](v76, "steps"));
  v21 = (char *)objc_msgSend(v20, "count");

  v72 = v4;
  if (v21)
  {
    v22 = 0;
    v70 = v3;
    do
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](v76, "steps"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v22));

      if (v22
        || (-[RouteStepListDataSource options](self, "options") & 8) != 0
        || objc_msgSend(v24, "maneuverType") != 17
        || (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "geoStep")),
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "instructionSet")),
            v27 = objc_msgSend(v26, "hasDrivingWalkingListInstruction"),
            v26,
            v25,
            (v27 & 1) != 0))
      {
        if (v22 - 1 >= v21)
        {
          v29 = 0;
        }
        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](v76, "steps"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v22 - 1));

        }
        if (((objc_msgSend(v29, "isEVChargerStep") & 1) != 0
           || (-[RouteStepListDataSource options](self, "options") & 0x40) != 0)
          && objc_msgSend(v24, "maneuverType") == 85)
        {
          goto LABEL_33;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "geoStep"));

        if (!v30
          || (v31 = objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource allowedStepIndices](self, "allowedStepIndices"))) != 0
          && (v32 = (void *)v31,
              v33 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource allowedStepIndices](self, "allowedStepIndices")),
              v34 = objc_msgSend(v33, "containsIndex:", v22),
              v33,
              v32,
              (v34 & 1) == 0))
        {
LABEL_33:
          v46 = (RouteStepManeuverItem *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource excludedStepIndices](self, "excludedStepIndices"));
          -[RouteStepManeuverItem addIndex:](v46, "addIndex:", v22);
        }
        else
        {
          if ((-[RouteStepListDataSource options](self, "options") & 2) != 0)
          {
            v35 = sub_100BCA378(v24, v76);
            v75 = (void *)objc_claimAutoreleasedReturnValue(v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](v76, "legs"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", -[GEOComposedRoute legIndexForStepIndex:](v76, "legIndexForStepIndex:", objc_msgSend(v24, "stepIndex"))));

            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "destination"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "chargingInfo"));

            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "destinationListSecondaryInstructions"));
            v41 = objc_msgSend(v40, "count");

            if (v75 && (v41 || !v39))
            {
              v47 = [RouteStepWaypointItem alloc];
              v68 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
              v48 = -[RouteStepWaypointItem initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:](v47, "initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:", v75, 1, v24, v71, v76, objc_msgSend(v68, "cellClassForItemType:", 0), v7, 1, v72, self->_context);

              v4 = v72;
              v3 = v70;
              -[RouteStepListDataSource _appendItem:toArray:](self, "_appendItem:toArray:", v48, v70);

              goto LABEL_35;
            }

            v3 = v70;
            v4 = v72;
          }
          if ((char *)v73 == v22)
            v42 = 2;
          else
            v42 = (unint64_t)v22 >= v74;
          v43 = [RouteStepManeuverItem alloc];
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
          v45 = objc_msgSend(v44, "cellClassForItemType:", 1);
          LOBYTE(v67) = v22 == (char *)self->_missedStepIndex;
          v46 = -[RouteStepManeuverItem initWithRouteStep:cellClass:state:metrics:context:route:scale:isMissedStep:](v43, "initWithRouteStep:cellClass:state:metrics:context:route:scale:isMissedStep:", v24, v45, v42, v4, self->_context, v76, v7, v67);

          -[RouteStepListDataSource _appendItem:toArray:](self, "_appendItem:toArray:", v46, v3);
        }

      }
      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource excludedStepIndices](self, "excludedStepIndices"));
        objc_msgSend(v29, "addIndex:", 0);
      }
LABEL_35:

      ++v22;
    }
    while (v21 != v22);
  }
  if ((-[RouteStepListDataSource options](self, "options") & 4) != 0)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource route](self, "route"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "destination"));

    if (v50)
    {
      v51 = [RouteStepWaypointItem alloc];
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "lastObject"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource route](self, "route"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "steps"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "lastObject"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
      v57 = -[RouteStepWaypointItem initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:](v51, "initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:", v52, 2, v55, v71, v76, objc_msgSend(v56, "cellClassForItemType:", 0), v7, 1, v72, self->_context);

      v4 = v72;
      -[RouteStepListDataSource _appendItem:toArray:](self, "_appendItem:toArray:", v57, v3);

    }
  }
  if ((-[RouteStepListDataSource options](self, "options") & 0x20) != 0)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource route](self, "route"));
    v59 = objc_msgSend(v58, "isMultipointRoute");

    if (v59)
      v60 = 0;
    else
      v60 = 2;
    if (-[GEOComposedRoute transportType](v76, "transportType") != 1
      && !-[GEOComposedRoute isWalkingOnlyTransitRoute](v76, "isWalkingOnlyTransitRoute"))
    {
      v60 |= 8uLL;
    }
    v61 = [RouteStepFooterItem alloc];
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
    v63 = -[RouteStepFooterItem initWithCommandSet:cellClass:state:metrics:context:route:scale:](v61, "initWithCommandSet:cellClass:state:metrics:context:route:scale:", v60, objc_msgSend(v62, "cellClassForItemType:", 2), 1, v4, self->_context, v76, v7);

    -[RouteStepListDataSource _appendItem:toArray:](self, "_appendItem:toArray:", v63, v3);
  }
  v64 = sub_100431C0C();
  v65 = objc_claimAutoreleasedReturnValue(v64);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    v66 = -[NSMutableArray count](v3, "count");
    *(_DWORD *)buf = 134218242;
    v78 = v66;
    v79 = 2112;
    v80 = v3;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Built %lu items: %@", buf, 0x16u);
  }

  -[RouteStepListDataSource setItems:](self, "setItems:", v3);
}

- (void)_appendItem:(id)a3 toArray:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource traitCollection](self, "traitCollection"));
  objc_msgSend(v11, "setTraitCollection:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "customizeItem:forDataSource:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource delegate](self, "delegate"));
    objc_msgSend(v10, "customizeItem:forDataSource:", v11, self);

  }
  objc_msgSend(v6, "addObject:", v11);

}

- (void)_localeDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  -[RouteStepListDataSource setCurrentLocale:](self, "setCurrentLocale:", v3);

}

- (RouteStepListDataSourceDelegate)delegate
{
  return (RouteStepListDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (unint64_t)activeStepIndex
{
  return self->_activeStepIndex;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (NSIndexSet)allowedStepIndices
{
  return self->_allowedStepIndices;
}

- (unint64_t)missedStepIndex
{
  return self->_missedStepIndex;
}

- (RouteStepListMetrics)metrics
{
  return self->_metrics;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setExcludedStepIndices:(id)a3
{
  objc_storeStrong((id *)&self->_excludedStepIndices, a3);
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSLocale)currentLocale
{
  return self->_currentLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_excludedStepIndices, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_allowedStepIndices, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
