@implementation DirectionItem

- (DirectionItem)initWithItems:(id)a3 transportType:(int64_t)a4
{
  return -[DirectionItem initWithItems:ignoreMapType:transportType:](self, "initWithItems:ignoreMapType:transportType:", a3, 1, a4);
}

- (DirectionItem)initWithItems:(id)a3 ignoreMapType:(BOOL)a4 transportType:(int64_t)a5
{
  id v9;
  DirectionItem *v10;
  DirectionItem *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DirectionItem;
  v10 = -[DirectionItem init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_numberOfCurrentLocationWaypoints = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v10->_items, a3);
    v11->_ignoreMapType = a4;
    v11->_transportType = a5;
  }

  return v11;
}

- (id)copyWithItems:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = -[DirectionItem copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSArray copyWithZone:](self->_items, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v6;

  *((_BYTE *)v5 + 16) = self->_ignoreMapType;
  *((_QWORD *)v5 + 4) = self->_allowApproximateUserLocation;
  *((_QWORD *)v5 + 5) = self->_transportType;
  objc_storeStrong((id *)v5 + 7, self->_drivePreferences);
  objc_storeStrong((id *)v5 + 8, self->_walkPreferences);
  objc_storeStrong((id *)v5 + 9, self->_transitPreferences);
  objc_storeStrong((id *)v5 + 10, self->_cyclePreferences);
  objc_storeStrong((id *)v5 + 6, self->_timing);
  objc_storeStrong((id *)v5 + 11, self->_persistentData);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  DirectionItem *v4;
  DirectionItem *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (DirectionItem *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v7 = 1;
    goto LABEL_7;
  }
  v6 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = -[DirectionItem isEqualToDirectionItem:](self, "isEqualToDirectionItem:", v5);
  else
LABEL_5:
    v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)isEqualToDirectionItem:(id)a3
{
  DirectionItem *v4;
  DirectionItem *v5;
  NSArray *items;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unsigned int v10;
  NSNumber *allowApproximateUserLocation;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unsigned int v15;
  DrivePreferences *drivePreferences;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  unsigned int v20;
  WalkPreferences *walkPreferences;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  unsigned int v25;
  TransitPreferences *transitPreferences;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  unsigned int v30;
  CyclePreferences *cyclePreferences;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  unsigned int v35;
  RoutePlanningTiming *timing;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  unsigned int v40;
  GEOComposedGeometryRoutePersistentData *persistentData;
  GEOComposedGeometryRoutePersistentData *v42;
  id v43;
  void *v44;
  unsigned __int8 v45;

  v4 = (DirectionItem *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_21;
  if (v4 == self)
  {
    v45 = 1;
    goto LABEL_23;
  }
  items = v4->_items;
  v7 = self->_items;
  v8 = items;
  if (v7 | v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if (!v10)
      goto LABEL_21;
  }
  if (self->_ignoreMapType != v5->_ignoreMapType)
    goto LABEL_21;
  if (self->_transportType != v5->_transportType)
    goto LABEL_21;
  allowApproximateUserLocation = v5->_allowApproximateUserLocation;
  v12 = self->_allowApproximateUserLocation;
  v13 = allowApproximateUserLocation;
  if (v12 | v13)
  {
    v14 = (void *)v13;
    v15 = objc_msgSend((id)v12, "isEqual:", v13);

    if (!v15)
      goto LABEL_21;
  }
  drivePreferences = v5->_drivePreferences;
  v17 = self->_drivePreferences;
  v18 = drivePreferences;
  if (v17 | v18)
  {
    v19 = (void *)v18;
    v20 = objc_msgSend((id)v17, "isEqual:", v18);

    if (!v20)
      goto LABEL_21;
  }
  walkPreferences = v5->_walkPreferences;
  v22 = self->_walkPreferences;
  v23 = walkPreferences;
  if (v22 | v23)
  {
    v24 = (void *)v23;
    v25 = objc_msgSend((id)v22, "isEqual:", v23);

    if (!v25)
      goto LABEL_21;
  }
  transitPreferences = v5->_transitPreferences;
  v27 = self->_transitPreferences;
  v28 = transitPreferences;
  if (v27 | v28)
  {
    v29 = (void *)v28;
    v30 = objc_msgSend((id)v27, "isEqual:", v28);

    if (!v30)
      goto LABEL_21;
  }
  cyclePreferences = v5->_cyclePreferences;
  v32 = self->_cyclePreferences;
  v33 = cyclePreferences;
  if (v32 | v33)
  {
    v34 = (void *)v33;
    v35 = objc_msgSend((id)v32, "isEqual:", v33);

    if (!v35)
      goto LABEL_21;
  }
  timing = v5->_timing;
  v37 = self->_timing;
  v38 = timing;
  if (!(v37 | v38)
    || (v39 = (void *)v38,
        v40 = objc_msgSend((id)v37, "isEqual:", v38),
        v39,
        (id)v37,
        v40))
  {
    persistentData = self->_persistentData;
    v42 = v5->_persistentData;
    v43 = persistentData;
    v44 = v43;
    if ((unint64_t)v43 | (unint64_t)v42)
      v45 = objc_msgSend(v43, "isEqual:", v42);
    else
      v45 = 1;

  }
  else
  {
LABEL_21:
    v45 = 0;
  }
LABEL_23:

  return v45;
}

- (BOOL)isEquivalentAsWaypointToDirectionItem:(id)a3
{
  DirectionItem *v4;
  DirectionItem *v5;
  id v6;
  unint64_t v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  NSNumber *allowApproximateUserLocation;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unsigned int v15;
  DrivePreferences *drivePreferences;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  unsigned int v20;
  WalkPreferences *walkPreferences;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  unsigned int v25;
  TransitPreferences *transitPreferences;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  unsigned int v30;
  CyclePreferences *cyclePreferences;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  unsigned int v35;
  RoutePlanningTiming *timing;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  unsigned int v40;
  GEOComposedGeometryRoutePersistentData *persistentData;
  GEOComposedGeometryRoutePersistentData *v42;
  id v43;
  void *v44;
  unsigned __int8 v45;

  v4 = (DirectionItem *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_27;
  if (v4 == self)
  {
    v45 = 1;
    goto LABEL_29;
  }
  v6 = -[NSArray count](self->_items, "count");
  if (v6 != (id)-[NSArray count](v5->_items, "count"))
    goto LABEL_27;
  if (-[NSArray count](self->_items, "count"))
  {
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v5->_items, "objectAtIndexedSubscript:", v7));
      if ((v8 & 1) != 0)
        v8 = objc_msgSend(v9, "isEquivalentAsWaypointToSearchFieldItem:", v10);
      else
        v8 = 0;

      ++v7;
    }
    while (v7 < -[NSArray count](self->_items, "count"));
    if ((v8 & 1) == 0)
      goto LABEL_27;
  }
  if (self->_ignoreMapType != v5->_ignoreMapType)
    goto LABEL_27;
  if (self->_transportType != v5->_transportType)
    goto LABEL_27;
  allowApproximateUserLocation = v5->_allowApproximateUserLocation;
  v12 = self->_allowApproximateUserLocation;
  v13 = allowApproximateUserLocation;
  if (v12 | v13)
  {
    v14 = (void *)v13;
    v15 = objc_msgSend((id)v12, "isEqual:", v13);

    if (!v15)
      goto LABEL_27;
  }
  drivePreferences = v5->_drivePreferences;
  v17 = self->_drivePreferences;
  v18 = drivePreferences;
  if (v17 | v18)
  {
    v19 = (void *)v18;
    v20 = objc_msgSend((id)v17, "isEqual:", v18);

    if (!v20)
      goto LABEL_27;
  }
  walkPreferences = v5->_walkPreferences;
  v22 = self->_walkPreferences;
  v23 = walkPreferences;
  if (v22 | v23)
  {
    v24 = (void *)v23;
    v25 = objc_msgSend((id)v22, "isEqual:", v23);

    if (!v25)
      goto LABEL_27;
  }
  transitPreferences = v5->_transitPreferences;
  v27 = self->_transitPreferences;
  v28 = transitPreferences;
  if (v27 | v28)
  {
    v29 = (void *)v28;
    v30 = objc_msgSend((id)v27, "isEqual:", v28);

    if (!v30)
      goto LABEL_27;
  }
  cyclePreferences = v5->_cyclePreferences;
  v32 = self->_cyclePreferences;
  v33 = cyclePreferences;
  if (v32 | v33)
  {
    v34 = (void *)v33;
    v35 = objc_msgSend((id)v32, "isEqual:", v33);

    if (!v35)
      goto LABEL_27;
  }
  timing = v5->_timing;
  v37 = self->_timing;
  v38 = timing;
  if (!(v37 | v38)
    || (v39 = (void *)v38,
        v40 = objc_msgSend((id)v37, "isEqual:", v38),
        v39,
        (id)v37,
        v40))
  {
    persistentData = self->_persistentData;
    v42 = v5->_persistentData;
    v43 = persistentData;
    v44 = v43;
    if ((unint64_t)v43 | (unint64_t)v42)
      v45 = objc_msgSend(v43, "isEqual:", v42);
    else
      v45 = 1;

  }
  else
  {
LABEL_27:
    v45 = 0;
  }
LABEL_29:

  return v45;
}

- (MKMapItem)startMapItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self, "items"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResult"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResult"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geocodedMapItem"));
  }
  v7 = (void *)v6;

  return (MKMapItem *)v7;
}

- (MKMapItem)endMapItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self, "items"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResult"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResult"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geocodedMapItem"));
  }
  v7 = (void *)v6;

  return (MKMapItem *)v7;
}

- (unint64_t)editRequired:(unint64_t *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t *v18;
  void *v19;
  unsigned int v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  if (a3)
    *a3 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self, "items"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self, "items"));
  v8 = objc_msgSend(v7, "count");

  if (v8 != (id)1)
  {
    v27 = 0;
    v10 = -[DirectionItem numberOfCurrentLocationWaypoints:](self, "numberOfCurrentLocationWaypoints:", &v27);
    v11 = v27;
    if (!v10)
    {
LABEL_18:
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0x7FFFFFFFFFFFFFFFLL;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self, "items"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1004FA290;
      v22[3] = &unk_1011B9600;
      v22[4] = &v23;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v22);

      v18 = v24;
      if (a3)
        *a3 = v24[3];
      v9 = 4 * (v18[3] != 0x7FFFFFFFFFFFFFFFLL);
      _Block_object_dispose(&v23, 8);
      goto LABEL_25;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v13 = objc_msgSend(v12, "isLocationServicesPossiblyAvailable");

    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      if (objc_msgSend(v14, "isAuthorizedForPreciseLocation"))
      {

      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem allowApproximateUserLocation](self, "allowApproximateUserLocation"));

        if (!v15)
        {
          if (a3)
            *a3 = (unint64_t)objc_msgSend(v11, "firstIndex");
          v9 = 3;
          goto LABEL_25;
        }
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      if (objc_msgSend(v16, "isAuthorizedForPreciseLocation"))
      {

        goto LABEL_18;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem allowApproximateUserLocation](self, "allowApproximateUserLocation"));
      v20 = objc_msgSend(v19, "BOOLValue");

      if (!a3 || (v20 & 1) != 0)
      {
        if (v20)
          goto LABEL_18;
LABEL_24:
        v9 = 2;
LABEL_25:

        return v9;
      }
    }
    else if (!a3)
    {
      goto LABEL_24;
    }
    *a3 = (unint64_t)objc_msgSend(v11, "firstIndex");
    goto LABEL_24;
  }
  if (-[DirectionItem hasCurrentLocationOnlyAsOriginWaypoint](self, "hasCurrentLocationOnlyAsOriginWaypoint"))
    return 4;
  else
    return 1;
}

- (BOOL)hasCurrentLocationOnlyAsOriginWaypoint
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = -[DirectionItem numberOfCurrentLocationWaypoints:](self, "numberOfCurrentLocationWaypoints:", 0);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self, "items"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchResult"));
    v7 = objc_msgSend(v6, "isDynamicCurrentLocation");

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (unint64_t)numberOfCurrentLocationWaypoints:(id *)a3
{
  id v5;
  void *v6;
  unint64_t numberOfCurrentLocationWaypoints;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a3)
    v5 = objc_alloc_init((Class)NSMutableIndexSet);
  else
    v5 = 0;
  if (self->_numberOfCurrentLocationWaypoints == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self, "items"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004FA490;
    v9[3] = &unk_1011B9628;
    v10 = v5;
    v11 = &v12;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

    self->_numberOfCurrentLocationWaypoints = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  if (a3)
    *a3 = objc_msgSend(v5, "copy");
  numberOfCurrentLocationWaypoints = self->_numberOfCurrentLocationWaypoints;

  return numberOfCurrentLocationWaypoints;
}

- (unint64_t)numberOfUserRequestedWaypoints
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self, "items"));
  v3 = sub_10039E080(v2, &stru_1011B9668);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "count");

  return (unint64_t)v5;
}

- (BOOL)canAddStop
{
  int64_t v3;
  uint64_t v4;
  int v5;
  int IsEnabled_DrivingMultiWaypointRoutes;
  unint64_t UInteger;

  v3 = -[DirectionItem transportType](self, "transportType");
  v5 = 0;
  switch(v3)
  {
    case 0:
      if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v3, v4) & 1) == 0
        && (MapsFeature_IsEnabled_Maps420() & 1) == 0)
      {
        goto LABEL_5;
      }
      v5 = 1;
      break;
    case 1:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v3, v4);
      goto LABEL_8;
    case 2:
LABEL_5:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
      goto LABEL_8;
    case 5:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_8:
      v5 = IsEnabled_DrivingMultiWaypointRoutes;
      break;
    default:
      break;
  }
  UInteger = GEOConfigGetUInteger(MapsConfig_MPRWaypointLimit, off_1014B4858);
  if (!v5)
    return 0;
  if (UInteger)
    return -[DirectionItem numberOfUserRequestedWaypoints](self, "numberOfUserRequestedWaypoints") < UInteger;
  return 1;
}

- (BOOL)isVenueItem
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem startMapItem](self, "startMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_venueInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueIdentifier"));
  if ((objc_msgSend(v5, "_hasVenueID") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem endMapItem](self, "endMapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_venueInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venueIdentifier"));
    v6 = objc_msgSend(v9, "_hasVenueID");

  }
  return v6;
}

- (unint64_t)venueID
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem endMapItem](self, "endMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_venueInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueIdentifier"));
  v6 = objc_msgSend(v5, "_hasVenueID");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem endMapItem](self, "endMapItem"));
LABEL_5:
    v12 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_venueInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "venueIdentifier"));
    v15 = objc_msgSend(v14, "venueID");

    return (unint64_t)v15;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem startMapItem](self, "startMapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_venueInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "venueIdentifier"));
  v11 = objc_msgSend(v10, "_hasVenueID");

  if (v11)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem startMapItem](self, "startMapItem"));
    goto LABEL_5;
  }
  return 0;
}

- (unint64_t)venueCardID
{
  return 0;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)ignoreMapType
{
  return self->_ignoreMapType;
}

- (void)setIgnoreMapType:(BOOL)a3
{
  self->_ignoreMapType = a3;
}

- (NSNumber)allowApproximateUserLocation
{
  return self->_allowApproximateUserLocation;
}

- (void)setAllowApproximateUserLocation:(id)a3
{
  self->_allowApproximateUserLocation = (NSNumber *)a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (RoutePlanningTiming)timing
{
  return self->_timing;
}

- (void)setTiming:(id)a3
{
  objc_storeStrong((id *)&self->_timing, a3);
}

- (DrivePreferences)drivePreferences
{
  return self->_drivePreferences;
}

- (void)setDrivePreferences:(id)a3
{
  objc_storeStrong((id *)&self->_drivePreferences, a3);
}

- (WalkPreferences)walkPreferences
{
  return self->_walkPreferences;
}

- (void)setWalkPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_walkPreferences, a3);
}

- (TransitPreferences)transitPreferences
{
  return self->_transitPreferences;
}

- (void)setTransitPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_transitPreferences, a3);
}

- (CyclePreferences)cyclePreferences
{
  return self->_cyclePreferences;
}

- (void)setCyclePreferences:(id)a3
{
  objc_storeStrong((id *)&self->_cyclePreferences, a3);
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (void)setPersistentData:(id)a3
{
  objc_storeStrong((id *)&self->_persistentData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_cyclePreferences, 0);
  objc_storeStrong((id *)&self->_transitPreferences, 0);
  objc_storeStrong((id *)&self->_walkPreferences, 0);
  objc_storeStrong((id *)&self->_drivePreferences, 0);
  objc_storeStrong((id *)&self->_timing, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

+ (id)directionItemWithNanoRoutePlanningRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  DirectionItem *v7;
  unsigned int v8;
  uint64_t v9;
  DirectionItem *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waypoints"));
  v5 = sub_10039DCD4(v4, &stru_1011BB630);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = [DirectionItem alloc];
  v8 = objc_msgSend(v3, "resolvedTransportType");

  if (v8 - 1 > 5)
    v9 = 1;
  else
    v9 = qword_100E37990[v8 - 1];
  v10 = -[DirectionItem initWithItems:transportType:](v7, "initWithItems:transportType:", v6, v9);

  return v10;
}

+ (id)directionItemWithRoutePlanningSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  char *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  char *v26;
  _QWORD v27[4];
  NSMutableArray *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  void *v38;

  v4 = a3;
  if (!v4)
  {
    v16 = sub_1004318FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "+[DirectionItem(RoutePlanningSession) directionItemWithRoutePlanningSession:]";
      v31 = 2080;
      v32 = "DirectionItem+RoutePlanningSession.m";
      v33 = 1024;
      v34 = 30;
      v35 = 2080;
      v36 = "routePlanningSession != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originWaypointRequest"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destinationWaypointRequest"));

  if (!v6 || !v8)
  {
    v21 = sub_1004318FC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("We should have both origin and destination here")));
      *(_DWORD *)buf = 136316162;
      v30 = "+[DirectionItem(RoutePlanningSession) directionItemWithRoutePlanningSession:]";
      v31 = 2080;
      v32 = "DirectionItem+RoutePlanningSession.m";
      v33 = 1024;
      v34 = 34;
      v35 = 2080;
      v36 = "origin && destination";
      v37 = 2112;
      v38 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v30 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1008E15E8;
  v27[3] = &unk_1011B5878;
  v28 = objc_opt_new(NSMutableArray);
  v9 = v28;
  objc_msgSend(v4, "enumerateRequestsOrWaypointsUsingBlock:", v27);
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithItems:transportType:", v9, objc_msgSend(v4, "currentTransportType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timing"));
  objc_msgSend(v10, "setTiming:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "drivePreferences"));
  objc_msgSend(v10, "setDrivePreferences:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitPreferences"));
  objc_msgSend(v10, "setTransitPreferences:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cyclePreferences"));
  objc_msgSend(v10, "setCyclePreferences:", v14);

  return v10;
}

+ (id)directionItemWithRideBookingSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  char *v23;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;

  v4 = a3;
  if (!v4)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v24 = 136315906;
      v25 = "+[DirectionItem(RoutePlanningSession) directionItemWithRideBookingSession:]";
      v26 = 2080;
      v27 = "DirectionItem+RoutePlanningSession.m";
      v28 = 1024;
      v29 = 53;
      v30 = 2080;
      v31 = "rideBookingSession != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v24, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v24 = 138412290;
        v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originRequest"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationRequest"));
  v7 = (void *)v6;
  if (!v5 || !v6)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("We should have both origin and destination here")));
      v24 = 136316162;
      v25 = "+[DirectionItem(RoutePlanningSession) directionItemWithRideBookingSession:]";
      v26 = 2080;
      v27 = "DirectionItem+RoutePlanningSession.m";
      v28 = 1024;
      v29 = 57;
      v30 = 2080;
      v31 = "origin && destination";
      v32 = 2112;
      v33 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v24, 0x30u);

    }
    if (sub_100A70734())
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v24 = 138412290;
        v25 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);

      }
    }
  }
  v8 = objc_opt_new(NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v5));
  -[NSMutableArray addObject:](v8, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v7));
  -[NSMutableArray addObject:](v8, "addObject:", v10);

  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithItems:transportType:", v8, 4);
  return v11;
}

@end
