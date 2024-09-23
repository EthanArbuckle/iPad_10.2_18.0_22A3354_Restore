@implementation MapsSavedRoutesManager

+ (void)fetchSavedRoutesWithType:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;

  v6 = a4;
  if (v6)
  {
    v7 = sub_1008B8D14();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "+[MapsSavedRoutesManager fetchSavedRoutesWithType:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("createTime"), 0));
    v10 = objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions);
    v18 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v12 = objc_msgSend(v10, "initWithPredicate:sortDescriptors:range:", 0, v11, 0);

    v13 = (void *)objc_opt_new(MSUserRouteRequest);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1008B8D54;
    v14[3] = &unk_1011DA878;
    v15 = v6;
    v16 = a1;
    v17 = a3;
    objc_msgSend(v13, "fetchWithOptions:completionHandler:", v12, v14);

  }
}

+ (void)fetchSavedRoutesWithTourMuid:(unint64_t)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  char *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  unint64_t v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;

  v5 = a4;
  if (v5)
  {
    if (a3)
    {
      v6 = (void *)objc_opt_new(MSUserRouteRequest);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
      v22 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", CFSTR("tourIdentifier == %@"), v8));

      v10 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v9, 0, 0);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1008B98A4;
      v19[3] = &unk_1011DA8E0;
      v21 = a3;
      v20 = v5;
      objc_msgSend(v6, "fetchWithOptions:completionHandler:", v10, v19);

    }
    else
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tourMuid of 0 is not valid.")));
        *(_DWORD *)buf = 136316162;
        v24 = "+[MapsSavedRoutesManager fetchSavedRoutesWithTourMuid:completion:]";
        v25 = 2080;
        v26 = "MapsSavedRoutesManager.m";
        v27 = 1024;
        v28 = 253;
        v29 = 2080;
        v30 = "tourMuid != 0";
        v31 = 2112;
        v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v14 = sub_1004318FC();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v24 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      v17 = sub_1008B8D14();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "tourMuid of 0 is not valid.", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
    }
  }

}

+ (void)saveRouteData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  MSUserRoute *v18;
  _QWORD v19[4];
  MSUserRoute *v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  unsigned int v29;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: routeData != nil", buf, 2u);
    }
    __break(1u);
  }
  v8 = v7;
  v9 = sub_1008B8D14();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anchorPoints"));
    *(_DWORD *)buf = 138478083;
    v27 = v11;
    v28 = 1024;
    v29 = objc_msgSend(v12, "count");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saving route. Name: %{private}@, Anchors: %d", buf, 0x12u);

  }
  objc_msgSend(v6, "prepareForSaving");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1008B9D4C;
  v22[3] = &unk_1011DA930;
  v13 = v6;
  v23 = v13;
  v25 = a1;
  v14 = v8;
  v24 = v14;
  v15 = objc_retainBlock(v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storageID"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storageID"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1008B9FDC;
    v19[3] = &unk_1011ADA50;
    v20 = (MSUserRoute *)v13;
    v21 = v15;
    +[MapsSavedRoutesManager _fetchSavedRoutesWithStorageID:handler:](MapsSavedRoutesManager, "_fetchSavedRoutesWithStorageID:handler:", v17, v19);

    v18 = v20;
  }
  else
  {
    v18 = objc_opt_new(MSUserRoute);
    ((void (*)(_QWORD *, MSUserRoute *))v15[2])(v15, v18);
  }

}

+ (void)deleteRoute:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "storageID"));
  objc_msgSend(a1, "deleteRouteStorageID:completion:", v7, v6);

}

+ (void)deleteRouteStorageID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1008BA258;
    v11[3] = &unk_1011DA980;
    v13 = v7;
    v14 = a1;
    v12 = v6;
    +[MapsSavedRoutesManager _fetchSavedRoutesWithStorageID:handler:](MapsSavedRoutesManager, "_fetchSavedRoutesWithStorageID:handler:", v12, v11);

  }
  else if (v7)
  {
    v9 = sub_1008B8D14();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Can't delete a routeData that is nil or has no storageID.", buf, 2u);
    }

    v8[2](v8, 0);
  }

}

+ (void)_fetchSavedRoutesWithStorageID:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (v5)
    {
      v7 = objc_opt_new(MSUserRouteRequest);
      v22 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
      v9 = (char *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", CFSTR("identifier == %@"), v8));

      v10 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v9, 0, 0);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1008BA9D8;
      v19[3] = &unk_1011ADA50;
      v20 = v5;
      v21 = v6;
      -[NSObject fetchWithOptions:completionHandler:](v7, "fetchWithOptions:completionHandler:", v10, v19);

      goto LABEL_4;
    }
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "+[MapsSavedRoutesManager _fetchSavedRoutesWithStorageID:handler:]";
      v25 = 2080;
      v26 = "MapsSavedRoutesManager.m";
      v27 = 1024;
      v28 = 376;
      v29 = 2080;
      v30 = "storageID != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v24 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "+[MapsSavedRoutesManager _fetchSavedRoutesWithStorageID:handler:]";
      v25 = 2080;
      v26 = "MapsSavedRoutesManager.m";
      v27 = 1024;
      v28 = 371;
      v29 = 2080;
      v30 = "handler != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v13 = sub_1004318FC();
      v7 = objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      v9 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_4:

LABEL_5:
    }
  }

}

+ (void)_updateUserRoute:(id)a3 withRouteData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userProvidedName"));
  objc_msgSend(v31, "setCustomName:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userProvidedNotes"));
  objc_msgSend(v31, "setCustomNote:", v7);

  objc_msgSend(v31, "setTourIdentifier:", objc_msgSend(v5, "tourMuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "transportType")));
  objc_msgSend(v31, "setTransportType:", v8);

  objc_msgSend(v5, "distance");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v31, "setLength:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0));
  objc_msgSend(v31, "setAddressObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anchorPoints"));
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anchorPoints"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

    objc_msgSend(v15, "coordinate");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v31, "setOriginLatitude:", v16);

    objc_msgSend(v15, "coordinate");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17));
    objc_msgSend(v31, "setOriginLongitude:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "elevationProfile"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "elevationProfile"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (float)objc_msgSend(v20, "sumElevationGainCm") * 0.01));
    objc_msgSend(v31, "setTotalAscent:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "elevationProfile"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (float)objc_msgSend(v22, "sumElevationLossCm") * 0.01));
    objc_msgSend(v31, "setTotalDescent:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boundingMapRegion"));
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "northLat");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v31, "setNorthLatitude:", v26);

    objc_msgSend(v25, "southLat");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v31, "setSouthLatitude:", v27);

    objc_msgSend(v25, "eastLng");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v31, "setEastLongitude:", v28);

    objc_msgSend(v25, "westLng");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v31, "setWestLongitude:", v29);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0));
  objc_msgSend(v31, "setRouteGeometry:", v30);

}

+ (id)routeDataForMapsSyncUserRoute:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSUUID *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;

  v3 = a3;
  if (v3)
  {
    v4 = objc_opt_class(GEOComposedGeometryRoutePersistentData);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeGeometry"));
    v24 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v4, v5, &v24));
    v7 = v24;

    if (v7 || !v6)
    {
      v21 = sub_1008B8D14();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error converting MSUserRoute to GEOComposedGeometryRoutePersistentData: %@", buf, 0xCu);
      }

      v20 = 0;
    }
    else
    {
      v8 = objc_msgSend(v6, "version");
      if (v8 != objc_msgSend(v6, "originalVersion"))
      {
        v9 = sub_1008B8D14();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = objc_msgSend(v6, "originalVersion");
          v12 = objc_msgSend(v6, "version");
          *(_DWORD *)buf = 134218240;
          v26 = v11;
          v27 = 2048;
          v28 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Updated route data from version %llu to %llu.", buf, 0x16u);
        }

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
      objc_msgSend(v6, "setStorageID:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storageID"));
      if (!v14)
      {
        v15 = sub_1008B8D14();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v3;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "didn't get an identifier from %@", buf, 0xCu);
        }

        v17 = objc_opt_new(NSUUID);
        objc_msgSend(v6, "setStorageID:", v17);

      }
      if (!objc_msgSend(v6, "source"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tourIdentifier"));

        if (v18)
          v19 = 2;
        else
          v19 = 3;
        objc_msgSend(v6, "setSource:", v19);
      }
      v20 = v6;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)didThisDeviceCreateRouteData:(id)a3
{
  id v3;
  uint64_t Array;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  Array = GEOConfigGetArray(MapsConfig_LocallyCreatedRoutesList, off_1014B54A8);
  v5 = objc_claimAutoreleasedReturnValue(Array);
  v6 = (void *)v5;
  v7 = &__NSArray0__struct;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storageID", (_QWORD)v17));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
        LOBYTE(v13) = objc_msgSend(v15, "isEqualToString:", v13);

        if ((v13 & 1) != 0)
        {
          LOBYTE(v10) = 1;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v10;
}

+ (void)_updateLocalListWithKnownRoutes:(id)a3
{
  id v3;
  uint64_t Array;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  Array = GEOConfigGetArray(MapsConfig_LocallyCreatedRoutesList, off_1014B54A8);
  v5 = objc_claimAutoreleasedReturnValue(Array);
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = &__NSArray0__struct;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v7));

  v9 = objc_opt_new(NSMutableSet);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "storageID", (_QWORD)v20));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));

        if (v16 && objc_msgSend(v8, "containsObject:", v16))
        {
          objc_msgSend(v8, "removeObject:", v16);
          -[NSMutableSet addObject:](v9, "addObject:", v16);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v8, "count"))
  {
    v17 = sub_1008B8D14();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "These routes were deleted: %{public}@", buf, 0xCu);
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9, "allObjects", (_QWORD)v20));
  GEOConfigSetArray(MapsConfig_LocallyCreatedRoutesList, off_1014B54A8, v19);

}

+ (void)_saveToLocalListWithRoute:(id)a3
{
  id v3;
  uint64_t Array;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  Array = GEOConfigGetArray(MapsConfig_LocallyCreatedRoutesList, off_1014B54A8);
  v5 = objc_claimAutoreleasedReturnValue(Array);
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = &__NSArray0__struct;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storageID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

  if (v10)
  {
    objc_msgSend(v8, "addObject:", v10);
  }
  else
  {
    v11 = sub_1008B8D14();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Route data didn't have a storageID at creation", v13, 2u);
    }

  }
}

+ (void)_deleteIDFromLocalListWithRoute:(id)a3
{
  id v3;
  uint64_t Array;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  Array = GEOConfigGetArray(MapsConfig_LocallyCreatedRoutesList, off_1014B54A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(Array);
  v6 = v5;
  if (!v5)
    v5 = &__NSArray0__struct;
  v7 = objc_msgSend(v5, "mutableCopy");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  if (v8)
  {
    objc_msgSend(v7, "removeObject:", v8);
  }
  else
  {
    v9 = sub_1008B8D14();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Route data didn't have a storageID at deletion", v11, 2u);
    }

  }
  GEOConfigSetArray(MapsConfig_LocallyCreatedRoutesList, off_1014B54A8, v7);

}

+ (unint64_t)savedRoutesCount
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;

  v2 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", 0, 0, 0);
  v3 = (void *)objc_opt_new(MSUserRouteRequest);
  v10 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchSyncWithOptions:error:", v2, &v10));
  v5 = v10;
  v6 = objc_msgSend(v4, "count");

  if (v5)
  {
    v7 = sub_1008B8D14();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to get route count, error: %{public}@", buf, 0xCu);
    }

  }
  return (unint64_t)v6;
}

@end
