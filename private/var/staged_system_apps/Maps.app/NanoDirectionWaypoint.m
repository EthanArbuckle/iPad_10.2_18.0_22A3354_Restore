@implementation NanoDirectionWaypoint

+ (id)directionWaypointForCompanionWaypoint:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v17;

  v4 = a3;
  if (objc_msgSend(v4, "isCurrentLocation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "directionWaypointForCurrentLocation:", v5));
  }
  else
  {
    v6 = objc_alloc_init((Class)a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    objc_msgSend(v6, "setLocation:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    objc_msgSend(v6, "setGeoMapItem:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchString"));
    objc_msgSend(v6, "setSearchString:", v9);

    v10 = objc_msgSend(objc_alloc((Class)GEOComposedWaypoint), "initWithCompanionWaypoint:", v4);
    objc_msgSend(v6, "setComposedWaypoint:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "findMyHandleID"));
    objc_msgSend(v6, "setFindMyHandleID:", v11);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeData"));
    if (v5)
    {
      v17 = 0;
      v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(GEOComposedGeometryRoutePersistentData), v5, &v17);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = v17;
      v15 = (void *)v6[8];
      v6[8] = v13;

    }
  }

  return v6;
}

+ (id)directionWaypointToCustomRoute:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (_QWORD *)objc_opt_new(a1);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentData"));
  v7 = (void *)v5[8];
  v5[8] = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  objc_msgSend(v5, "setName:", v8);

  v9 = objc_msgSend(objc_alloc((Class)GEOComposedWaypointToRoute), "initWithRoute:", v4);
  objc_msgSend(v5, "setComposedWaypoint:", v9);

  return v5;
}

+ (id)directionWaypointForComposedWaypoint:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  if (objc_msgSend(v3, "isCurrentLocation"))
  {
    if (objc_msgSend(v3, "hasLatLng"))
    {
      v4 = objc_alloc((Class)GEOLocation);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "latLng"));
      v6 = objc_msgSend(v4, "initWithLocation:isUserLocation:floorOrdinal:", v5, objc_msgSend(v3, "isCurrentLocation"), 0x7FFFFFFFLL);

    }
    else
    {
      v6 = 0;
    }
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[NanoDirectionWaypoint directionWaypointForCurrentLocation:](NanoDirectionWaypoint, "directionWaypointForCurrentLocation:", v6));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[NanoDirectionWaypoint directionWaypointWithGEOMapItem:](NanoDirectionWaypoint, "directionWaypointWithGEOMapItem:", v7));

    v9 = objc_opt_class(GEOComposedWaypointToRoute);
    if ((objc_opt_isKindOfClass(v3, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "route"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentData"));
      v12 = (void *)v8[8];
      v8[8] = v11;

    }
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "findMyHandleID"));
    objc_msgSend(v8, "setFindMyHandleID:", v6);
  }

  return v8;
}

+ (id)directionWaypointForCurrentLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setCurrentLocation:", 1);
  objc_msgSend(v5, "setLocation:", v4);

  return v5;
}

+ (id)directionWaypointForLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setLocation:", v4);

  return v5;
}

+ (id)directionWaypointForLocation:(id)a3 findMyHandleID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v9 = objc_msgSend(v6, "copy");

  objc_msgSend(v8, "setFindMyHandleID:", v9);
  objc_msgSend(v8, "setLocation:", v7);

  return v8;
}

+ (NanoDirectionWaypoint)directionWaypointWithGEOMapItem:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setGeoMapItem:", v4);
  v6 = objc_msgSend(objc_alloc((Class)GEOComposedWaypoint), "initWithMapItem:", v4);

  objc_msgSend(v5, "setComposedWaypoint:", v6);
  return (NanoDirectionWaypoint *)v5;
}

+ (NanoDirectionWaypoint)directionWaypointWithSearchString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setSearchString:", v4);

  return (NanoDirectionWaypoint *)v5;
}

+ (NanoDirectionWaypoint)directionWaypointWithLabel:(id)a3 muid:(unint64_t)a4 providerID:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = objc_alloc_init((Class)a1);
  objc_msgSend(v9, "setSearchString:", v8);

  objc_msgSend(v9, "setMuid:", a4);
  objc_msgSend(v9, "setProviderID:", v5);
  return (NanoDirectionWaypoint *)v9;
}

- (NSString)name
{
  GEOComposedWaypoint *composedWaypoint;
  uint64_t v4;
  NSString *v5;
  NSString *name;
  NSString *v7;
  void *v9;
  NSString *v10;
  NSString *searchString;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  composedWaypoint = self->_composedWaypoint;
  v4 = objc_opt_class(GEOComposedWaypointToRoute);
  if ((objc_opt_isKindOfClass(composedWaypoint, v4) & 1) != 0)
  {
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint name](self->_composedWaypoint, "name"));
LABEL_5:
    v7 = v5;
    return v7;
  }
  name = self->_name;
  if (name)
  {
    v5 = name;
    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](self->_composedWaypoint, "geoMapItem"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  searchString = v10;
  if (v10 || (searchString = self->_searchString) != 0)
  {
    v7 = searchString;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint geoMapItem](self, "geoMapItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    v14 = v13;
    if (v13)
    {
      v7 = v13;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Destination [Nano, Route Planning]"), CFSTR("localized string not found"), 0));

    }
  }

  return v7;
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint composedWaypoint](self, "composedWaypoint"));
  if (v3 || -[NanoDirectionWaypoint isCurrentLocation](self, "isCurrentLocation"))
  {
    v4 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint location](self, "location"));
    if (v6)
    {
      v4 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint geoMapItem](self, "geoMapItem"));
      if (v7)
      {
        v4 = 1;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint searchString](self, "searchString"));
        if (objc_msgSend(v8, "length"))
        {
          v4 = 1;
        }
        else if (-[NanoDirectionWaypoint muid](self, "muid"))
        {
          v4 = -[NanoDirectionWaypoint providerID](self, "providerID") > 0;
        }
        else
        {
          v4 = 0;
        }

      }
    }

  }
  return v4;
}

- (void)setComposedWaypoint:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_composedWaypoint, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint findMyHandleID](self, "findMyHandleID"));
  -[GEOComposedWaypoint setFindMyHandleID:](self->_composedWaypoint, "setFindMyHandleID:", v6);

}

- (void)refineWithTraits:(id)a3 auditToken:(id)a4 completionHandler:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  NSObject *v31;
  void *v32;
  NanoDirectionWaypoint *v33;
  NanoDirectionWaypoint *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  id *v45;
  NanoDirectionWaypoint *v46;
  _QWORD block[5];
  _QWORD *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id location;
  uint8_t buf[4];
  NanoDirectionWaypoint *v54;
  __int16 v55;
  uint64_t v56;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
    goto LABEL_40;
  if (!-[NanoDirectionWaypoint isValid](self, "isValid"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
    goto LABEL_40;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint geoMapItem](self, "geoMapItem"));
  if (v12
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint destinationRouteData](self, "destinationRouteData"))) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint composedWaypoint](self, "composedWaypoint"));

    if (v12)
    {

      if (v13)
        goto LABEL_14;
    }
    else
    {

      if (v13)
        goto LABEL_14;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint destinationRouteData](self, "destinationRouteData"));

    if (v14)
    {
      v15 = objc_alloc((Class)GEORouteBuilder_PersistentData);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint destinationRouteData](self, "destinationRouteData"));
      v17 = objc_msgSend(v15, "initWithPersistentData:", v16);

      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "buildRoute"));
      v19 = objc_msgSend(objc_alloc((Class)GEOComposedWaypointToRoute), "initWithRoute:", v18);
      -[NanoDirectionWaypoint setComposedWaypoint:](self, "setComposedWaypoint:", v19);

    }
    else
    {
      v20 = objc_alloc((Class)GEOComposedWaypoint);
      v17 = (id)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint geoMapItem](self, "geoMapItem"));
      v18 = objc_msgSend(v20, "initWithMapItem:", v17);
      -[NanoDirectionWaypoint setComposedWaypoint:](self, "setComposedWaypoint:", v18);
    }

  }
LABEL_14:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint composedWaypoint](self, "composedWaypoint"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint composedWaypoint](self, "composedWaypoint"));
    (*((void (**)(id, void *, _QWORD))v11 + 2))(v11, v22, 0);

  }
  else
  {
    if (-[NanoDirectionWaypoint isCurrentLocation](self, "isCurrentLocation"))
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceLocation"));
    else
      v23 = objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint location](self, "location"));
    v24 = (void *)v23;
    if (-[NanoDirectionWaypoint isCurrentLocation](self, "isCurrentLocation") && !v24)
    {
      v25 = sub_10043214C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Waypoint wants current location but none found on traits", buf, 2u);
      }

    }
    v46 = (NanoDirectionWaypoint *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint searchString](self, "searchString"));
    v27 = -[NanoDirectionWaypoint muid](self, "muid");
    v28 = -[NanoDirectionWaypoint providerID](self, "providerID");
    objc_initWeak(&location, self);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10095C410;
    v49[3] = &unk_1011DB628;
    v45 = &v51;
    objc_copyWeak(&v51, &location);
    v50 = v11;
    v29 = objc_retainBlock(v49);
    if (v24)
    {
      v30 = sub_10043214C();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "latLng"));
        objc_msgSend(v32, "lat");
        v34 = v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "latLng"));
        objc_msgSend(v35, "lng");
        *(_DWORD *)buf = 134283777;
        v54 = v34;
        v55 = 2049;
        v56 = v36;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Will refine location: %{private}#.3lf,%{private}#.3lf", buf, 0x16u);

      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[GEOComposedWaypoint composedWaypointForCurrentLocation:traits:auditToken:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForCurrentLocation:traits:auditToken:completionHandler:networkActivityHandler:", v24, v9, v10, v29, 0));
      objc_storeWeak((id *)&self->_refinementTicket, v37);

    }
    else if (v27)
    {
      v38 = sub_10043214C();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134283777;
        v54 = (NanoDirectionWaypoint *)v27;
        v55 = 1025;
        LODWORD(v56) = v28;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Will refine ID: %{private}llu/%{private}d", buf, 0x12u);
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue(+[GEOComposedWaypoint composedWaypointForID:resultsProviderID:contentProvider:traits:clientAttributes:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForID:resultsProviderID:contentProvider:traits:clientAttributes:completionHandler:networkActivityHandler:", v27, v28, 0, v9, 0, v29, 0, &v51));
      objc_storeWeak((id *)&self->_refinementTicket, v40);

    }
    else
    {
      v41 = sub_10043214C();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      v43 = v42;
      if (v46)
      {
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v54 = v46;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Will refine address: %{private}@", buf, 0xCu);
        }

        v44 = (void *)objc_claimAutoreleasedReturnValue(+[GEOComposedWaypoint composedWaypointForSearchString:completionItem:traits:clientAttributes:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForSearchString:completionItem:traits:clientAttributes:completionHandler:networkActivityHandler:", v46, 0, v9, 0, v29, 0));
        objc_storeWeak((id *)&self->_refinementTicket, v44);

      }
      else
      {
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138477827;
          v54 = self;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Unable to refine: %{private}@", buf, 0xCu);
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10095C4CC;
        block[3] = &unk_1011AE240;
        block[4] = self;
        v48 = v29;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

    objc_destroyWeak(v45);
    objc_destroyWeak(&location);

  }
LABEL_40:

}

- (void)cancelRefinement
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_refinementTicket);
  objc_msgSend(WeakRetained, "cancel");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NanoDirectionWaypoint)initWithCoder:(id)a3
{
  id v4;
  NanoDirectionWaypoint *v5;
  id v6;
  uint64_t v7;
  NSString *name;
  id v9;
  uint64_t v10;
  GEOLocation *location;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSString *searchString;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  GEOMapItem *geoMapItem;
  id v24;
  uint64_t v25;
  GEOComposedWaypoint *composedWaypoint;
  id v27;
  uint64_t v28;
  NSString *findMyHandleID;
  id v30;
  uint64_t v31;
  GEOComposedGeometryRoutePersistentData *destinationRouteData;

  v4 = a3;
  v5 = -[NanoDirectionWaypoint init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("name"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOLocation), CFSTR("location"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    location = v5->_location;
    v5->_location = (GEOLocation *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("currentLocation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v5->_currentLocation = objc_msgSend(v13, "BOOLValue");

    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("searchString"));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v15;

    v17 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("muid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v5->_muid = (unint64_t)objc_msgSend(v18, "unsignedLongLongValue");

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("providerID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v5->_providerID = objc_msgSend(v20, "intValue");

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOMapItemStorage), CFSTR("geoMapItemStorage"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    geoMapItem = v5->_geoMapItem;
    v5->_geoMapItem = (GEOMapItem *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOComposedWaypoint), CFSTR("composedWaypoint"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    composedWaypoint = v5->_composedWaypoint;
    v5->_composedWaypoint = (GEOComposedWaypoint *)v25;

    v27 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("findMyHandleID"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    findMyHandleID = v5->_findMyHandleID;
    v5->_findMyHandleID = (NSString *)v28;

    v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOComposedGeometryRoutePersistentData), CFSTR("destinationRouteData"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    destinationRouteData = v5->_destinationRouteData;
    v5->_destinationRouteData = (GEOComposedGeometryRoutePersistentData *)v31;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  name = self->_name;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_location, CFSTR("location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_currentLocation));
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("currentLocation"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_searchString, CFSTR("searchString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_muid));
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("muid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_providerID));
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("providerID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", self->_geoMapItem));
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("geoMapItemStorage"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_composedWaypoint, CFSTR("composedWaypoint"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_findMyHandleID, CFSTR("findMyHandleID"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_destinationRouteData, CFSTR("destinationRouteData"));

}

- (id)description
{
  id v3;
  _QWORD *v4;
  void *v5;
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
  objc_super v17;
  _QWORD v18[4];
  id v19;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10095CD04;
  v18[3] = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v19 = v3;
  v4 = objc_retainBlock(v18);
  ((void (*)(_QWORD *, const __CFString *, NSString *))v4[2])(v4, CFSTR("name"), self->_name);
  ((void (*)(_QWORD *, const __CFString *, GEOLocation *))v4[2])(v4, CFSTR("location"), self->_location);
  if (self->_currentLocation)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    ((void (*)(_QWORD *, const __CFString *, void *))v4[2])(v4, CFSTR("currentLocation"), v5);

  }
  else
  {
    ((void (*)(_QWORD *, const __CFString *, _QWORD))v4[2])(v4, CFSTR("currentLocation"), 0);
  }
  ((void (*)(_QWORD *, const __CFString *, NSString *))v4[2])(v4, CFSTR("searchString"), self->_searchString);
  if (self->_muid)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    ((void (*)(_QWORD *, const __CFString *, void *))v4[2])(v4, CFSTR("muid"), v6);

  }
  else
  {
    ((void (*)(_QWORD *, const __CFString *))v4[2])(v4, CFSTR("muid"));
  }
  if (self->_providerID <= 0)
  {
    ((void (*)(_QWORD *, const __CFString *, _QWORD))v4[2])(v4, CFSTR("providerId"), 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
    ((void (*)(_QWORD *, const __CFString *, void *))v4[2])(v4, CFSTR("providerId"), v7);

  }
  ((void (*)(_QWORD *, const __CFString *, GEOMapItem *))v4[2])(v4, CFSTR("geoMapItem"), self->_geoMapItem);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint shortDescription](self->_composedWaypoint, "shortDescription"));
  ((void (*)(_QWORD *, const __CFString *, void *))v4[2])(v4, CFSTR("composedWaypoint"), v8);

  ((void (*)(_QWORD *, const __CFString *, NSString *))v4[2])(v4, CFSTR("findMyHandleID"), self->_findMyHandleID);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapItem _clientAttributes](self->_geoMapItem, "_clientAttributes"));
  ((void (*)(_QWORD *, const __CFString *, void *))v4[2])(v4, CFSTR("clientAttrbutes"), v9);

  if (self->_destinationRouteData)
    v10 = &__kCFBooleanTrue;
  else
    v10 = 0;
  ((void (*)(_QWORD *, const __CFString *, void *))v4[2])(v4, CFSTR("destinationRouteData"), v10);
  v17.receiver = self;
  v17.super_class = (Class)NanoDirectionWaypoint;
  v11 = -[NanoDirectionWaypoint description](&v17, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint name](self, "name"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v12, v13, v14));

  return v15;
}

- (id)debugDescription
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10095CFDC;
  v16[3] = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v17 = v3;
  v4 = objc_retainBlock(v16);
  ((void (*)(_QWORD *, const __CFString *, NSString *))v4[2])(v4, CFSTR("name"), self->_name);
  ((void (*)(_QWORD *, const __CFString *, GEOLocation *))v4[2])(v4, CFSTR("location"), self->_location);
  if (self->_currentLocation)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    ((void (*)(_QWORD *, const __CFString *, void *))v4[2])(v4, CFSTR("currentLocation"), v5);

  }
  else
  {
    ((void (*)(_QWORD *, const __CFString *, _QWORD))v4[2])(v4, CFSTR("currentLocation"), 0);
  }
  ((void (*)(_QWORD *, const __CFString *, NSString *))v4[2])(v4, CFSTR("searchString"), self->_searchString);
  if (self->_muid)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    ((void (*)(_QWORD *, const __CFString *, void *))v4[2])(v4, CFSTR("muid"), v6);

  }
  else
  {
    ((void (*)(_QWORD *, const __CFString *))v4[2])(v4, CFSTR("muid"));
  }
  if (self->_providerID <= 0)
  {
    ((void (*)(_QWORD *, const __CFString *, _QWORD))v4[2])(v4, CFSTR("providerId"), 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
    ((void (*)(_QWORD *, const __CFString *, void *))v4[2])(v4, CFSTR("providerId"), v7);

  }
  ((void (*)(_QWORD *, const __CFString *, GEOMapItem *))v4[2])(v4, CFSTR("geoMapItem"), self->_geoMapItem);
  ((void (*)(_QWORD *, const __CFString *, GEOComposedWaypoint *))v4[2])(v4, CFSTR("composedWaypoint"), self->_composedWaypoint);
  ((void (*)(_QWORD *, const __CFString *, NSString *))v4[2])(v4, CFSTR("findMyHandleID"), self->_findMyHandleID);
  if (self->_destinationRouteData)
    v8 = &__kCFBooleanTrue;
  else
    v8 = 0;
  ((void (*)(_QWORD *, const __CFString *, void *))v4[2])(v4, CFSTR("destinationRouteData"), v8);
  v15.receiver = self;
  v15.super_class = (Class)NanoDirectionWaypoint;
  v9 = -[NanoDirectionWaypoint description](&v15, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint name](self, "name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",\n")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ {\n%@\n}"), v10, v11, v12));

  return v13;
}

- (BOOL)isCurrentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(BOOL)a3
{
  self->_currentLocation = a3;
}

- (GEOLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (GEOMapItem)geoMapItem
{
  return self->_geoMapItem;
}

- (void)setGeoMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_geoMapItem, a3);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int)providerID
{
  return self->_providerID;
}

- (void)setProviderID:(int)a3
{
  self->_providerID = a3;
}

- (NSString)findMyHandleID
{
  return self->_findMyHandleID;
}

- (void)setFindMyHandleID:(id)a3
{
  objc_storeStrong((id *)&self->_findMyHandleID, a3);
}

- (GEOComposedGeometryRoutePersistentData)destinationRouteData
{
  return self->_destinationRouteData;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (GEOComposedWaypoint)composedWaypoint
{
  return self->_composedWaypoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedWaypoint, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_destinationRouteData, 0);
  objc_storeStrong((id *)&self->_findMyHandleID, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_destroyWeak((id *)&self->_refinementTicket);
}

- (id)companionWaypoint
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v3 = objc_alloc_init((Class)GEOCompanionWaypoint);
  objc_msgSend(v3, "setIsCurrentLocation:", -[NanoDirectionWaypoint isCurrentLocation](self, "isCurrentLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint geoMapItem](self, "geoMapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v4));
  objc_msgSend(v3, "setMapItem:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint composedWaypoint](self, "composedWaypoint"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypoint"));
  objc_msgSend(v3, "setWaypointTyped:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint searchString](self, "searchString"));
  objc_msgSend(v3, "setSearchString:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint findMyHandleID](self, "findMyHandleID"));
  objc_msgSend(v3, "setFindMyHandleID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint destinationRouteData](self, "destinationRouteData"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint destinationRouteData](self, "destinationRouteData"));
    v14 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v14));

    objc_msgSend(v3, "setRouteData:", v12);
  }
  return v3;
}

@end
