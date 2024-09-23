@implementation MapsSiriContextProvider

+ (id)sharedContextProvider
{
  if (qword_1014D3C00 != -1)
    dispatch_once(&qword_1014D3C00, &stru_1011DE828);
  return (id)qword_1014D3BF8;
}

- (BOOL)allowContextProvider:(id)a3
{
  return 1;
}

- (id)getCurrentContext
{
  const char *label;
  const char *v4;
  BOOL v5;
  void *v6;
  __objc2_class **v7;
  id v8;
  void *v9;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 136316418;
        v17 = "-[MapsSiriContextProvider getCurrentContext]";
        v18 = 2080;
        v19 = "MapsSiriContextProvider.m";
        v20 = 1024;
        v21 = 55;
        v22 = 2080;
        v23 = "dispatch_get_main_queue()";
        v24 = 2080;
        v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v26 = 2080;
        v27 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v16,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v13 = sub_1004318FC();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v16 = 138412290;
          v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);

        }
      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  if (objc_msgSend(v6, "isChromeAvailable")
    && (objc_msgSend(v6, "isCurrentlyConnectedToCarAppScene") & 1) != 0)
  {
    v7 = off_1011960B8;
  }
  else
  {
    v7 = &off_101196D80;
  }
  v8 = objc_alloc_init(*v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSiriContextProvider _contextFromProvider:](self, "_contextFromProvider:", v8));

  return v9;
}

- (id)_contextFromProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapRegion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSiriContextProvider _siriMapViewportWithRegion:](self, "_siriMapViewportWithRegion:", v7));

  if (v8)
    objc_msgSend(v5, "addObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchResults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedResult"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedPOI"));
  if (v11)
    v13 = (uint64_t)objc_msgSend(v10, "indexOfObject:", v11);
  else
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12)
    v14 = v12;
  else
    v14 = v11;
  v15 = v14;
  if (v15 && v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v10, "addObject:", v15);
    v13 = (uint64_t)objc_msgSend(v10, "count") - 1;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSiriContextProvider _siriSearchContextWithResults:selectedIndex:](self, "_siriSearchContextWithResults:selectedIndex:", v10, v13));
  if (v16)
    objc_msgSend(v5, "addObject:", v16);
  v17 = objc_msgSend(v5, "copy");

  return v17;
}

- (id)_siriMapViewportWithRegion:(id)a3
{
  id v3;
  id v4;
  double v5;
  double v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)SALocalSearchMapViewport);
  objc_msgSend(v3, "eastLng");
  objc_msgSend(v4, "setEastLongitude:");
  objc_msgSend(v3, "westLng");
  objc_msgSend(v4, "setWestLongitude:");
  objc_msgSend(v3, "northLat");
  objc_msgSend(v4, "setNorthLatitude:");
  objc_msgSend(v3, "southLat");
  v6 = v5;

  objc_msgSend(v4, "setSouthLatitude:", v6);
  return v4;
}

- (id)_siriSearchContextWithResults:(id)a3 selectedIndex:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_alloc_init((Class)SALocalSearchMapItemList);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSiriContextProvider _siriMapItemFromConvertibleObject:](self, "_siriMapItemFromConvertibleObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), (_QWORD)v18));
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v15 = objc_msgSend(v8, "copy");
    objc_msgSend(v7, "setDomainObjects:", v15);

    if (a4 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)objc_msgSend(v9, "count") > a4)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
      objc_msgSend(v7, "setSelectedIndex:", v16);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_siriMapItemFromConvertibleObject:(id)a3
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = objc_alloc_init((Class)SALocalSearchMapItem);
  objc_msgSend(v3, "coordinate");
  v6 = v5;
  v8 = v7;
  v9 = objc_alloc_init((Class)SALocation);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
  objc_msgSend(v9, "setLatitude:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  objc_msgSend(v9, "setLongitude:", v11);

  objc_msgSend(v4, "setLocation:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  objc_msgSend(v4, "setLabel:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_placeDataAsData"));
  if (v14)
    objc_msgSend(v4, "setPlaceData2:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_detourInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "detourInfoAsData"));

  if (v16)
    objc_msgSend(v4, "setResultDetourInfoData:", v16);
  if (objc_msgSend(v3, "isDynamicCurrentLocation"))
    objc_msgSend(v4, "setDetailType:", SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue);
  if (objc_msgSend(v3, "businessID"))
  {
    v17 = objc_alloc_init((Class)SALocalSearchBusiness2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("urn:places:%lld"), objc_msgSend(v3, "businessID")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));

    objc_msgSend(v17, "setIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "localSearchProviderID")));
    objc_msgSend(v4, "setLocalSearchProviderId:", v20);

    objc_msgSend(v4, "setDetailType:", SALocalSearchMapItemMapItemTypeBUSINESS_ITEMValue);
    objc_msgSend(v4, "setDetail:", v17);

  }
  return v4;
}

@end
