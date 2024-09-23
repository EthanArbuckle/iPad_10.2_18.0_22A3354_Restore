@implementation NSDictionary

- (id)_mapstest_arrayWithJSONForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v10;

  if (!a3)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
    v10 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v5, 1, &v10));
    v7 = objc_opt_class(NSArray);
    v8 = 0;
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      v8 = v6;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)_mapstest_serialSubTests
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSArray *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("serialSubTests")));
  v3 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSArray)_mapstest_readSubTestsFromTestSerial
{
  void *v2;
  id v3;
  id v4;
  _UNKNOWN **v5;
  void *i;
  void *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _UNKNOWN **v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableDictionary *v42;
  NSMutableDictionary *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  NSMutableDictionary *v54;
  uint64_t v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[7];
  _QWORD v62[7];
  _QWORD v63[2];
  _QWORD v64[2];
  _BYTE v65[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _mapstest_arrayWithJSONForKey:](self, "_mapstest_arrayWithJSONForKey:", CFSTR("testSerial")));
  if (!v2)
  {
    v3 = 0;
    goto LABEL_30;
  }
  v3 = objc_alloc_init((Class)NSMutableArray);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v49 = v2;
  v4 = v2;
  v56 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (!v56)
    goto LABEL_28;
  v5 = MKPlaceCollectionsLogicController_ptr;
  v55 = *(_QWORD *)v58;
  v50 = v4;
  v51 = v3;
  do
  {
    for (i = 0; i != v56; i = (char *)i + 1)
    {
      if (*(_QWORD *)v58 != v55)
        objc_enumerationMutation(v4);
      v7 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
      v8 = (char *)objc_msgSend(v4, "indexOfObject:", v7);
      v9 = objc_opt_class(v5[332]);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("selector")));
        v11 = v10;
        if (v10)
        {
          v12 = v5;
          if ((objc_msgSend(v10, "hasSuffix:", CFSTR(":")) & 1) == 0)
          {
            v13 = v3;
            v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR(":")));

            v11 = (void *)v14;
LABEL_17:
            v43 = objc_opt_new(NSMutableDictionary);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v43, "setObject:forKeyedSubscript:", v11, CFSTR("selector"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("subTestName")));
            if (v44)
              v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("subTestName")));
            else
              v45 = v11;
            v35 = v45;

            if (objc_msgSend(v35, "hasSuffix:", CFSTR(":")))
            {
              v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "substringToIndex:", (char *)objc_msgSend(v35, "length") - 1));

              v35 = (void *)v46;
            }
            if ((unint64_t)objc_msgSend(v4, "count") >= 2)
            {
              v47 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("step%lu-%@"), v8 + 1, v35));

              v35 = (void *)v47;
            }
            objc_msgSend(v7, "removeObjectForKey:", CFSTR("selector"));
            objc_msgSend(v7, "removeObjectForKey:", CFSTR("subTestName"));
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("subTestName"));
            v42 = v43;
            -[NSMutableDictionary setObject:forKeyedSubscript:](v43, "setObject:forKeyedSubscript:", v7, CFSTR("options"));
            v3 = v13;
            objc_msgSend(v13, "addObject:", v42);
            v5 = v12;
            goto LABEL_25;
          }
        }
        else
        {
          v12 = v5;
        }
        v13 = v3;
        goto LABEL_17;
      }
      v15 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v7, v15) & 1) == 0)
        continue;
      v54 = v7;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary componentsSeparatedByString:](v54, "componentsSeparatedByString:", CFSTR(" ")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 1));
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 2));
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 3));
      objc_msgSend(v25, "doubleValue");
      v27 = v26;

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 4));
      objc_msgSend(v28, "doubleValue");
      v30 = v29;

      v31 = cos(v30 * 0.0174532925);
      v32 = 5.0;
      if (objc_msgSend(v11, "count") == (id)6)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 5));
        objc_msgSend(v33, "doubleValue");
        v32 = v34;

      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("step%lu"), v8 + 1));
      v63[0] = CFSTR("selector");
      v63[1] = CFSTR("options");
      v64[0] = CFSTR("setCenterCoordinateFull:");
      v61[0] = CFSTR("latitude");
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
      v62[0] = v53;
      v61[1] = CFSTR("longitude");
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
      v62[1] = v52;
      v61[2] = CFSTR("altitude");
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24 * v31));
      v62[2] = v36;
      v61[3] = CFSTR("yaw");
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27));
      v62[3] = v37;
      v61[4] = CFSTR("pitch");
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30));
      v62[4] = v38;
      v61[5] = CFSTR("duration");
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
      v61[6] = CFSTR("subTestName");
      v62[5] = v39;
      v62[6] = v35;
      v5 = MKPlaceCollectionsLogicController_ptr;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 7));
      v64[1] = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 2));

      v3 = v51;
      objc_msgSend(v51, "addObject:", v41);

      v4 = v50;
      v42 = v54;
LABEL_25:

    }
    v56 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  }
  while (v56);
LABEL_28:

  v2 = v49;
LABEL_30:

  return (NSArray *)v3;
}

- (id)_mapstest_addressDictionaryForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v4, 0, 0));

  return v5;
}

- (int64_t)_mapstest_integerValueForKey:(id)a3 defaultValue:(int64_t)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a3));
  v6 = v5;
  if (v5)
    a4 = (int64_t)objc_msgSend(v5, "integerValue");

  return a4;
}

- (double)_mapstest_doubleValueForKey:(id)a3 defaultValue:(double)a4
{
  void *v5;
  void *v6;
  double v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a3));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    a4 = v7;
  }

  return a4;
}

- (void)_mapstest_getSelectedFeatures:(unint64_t *)a3 disabled:(unint64_t *)a4
{
  uint64_t v7;
  uint64_t v8;

  v8 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("enable")));
  v7 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("disable")));
  if (v7 | v8)
  {
    if (a3)
      *a3 = sub_10042C7A8((void *)v8);
    if (a4)
      *a4 = sub_10042C7A8((void *)v7);
  }

}

- (int64_t)_mapstest_viewModeWithDefaultType:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("viewMode")));
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("standard")) & 1) != 0)
    {
      a3 = 0;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("driving")) & 1) != 0)
    {
      a3 = 7;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("transit")) & 1) != 0)
    {
      a3 = 3;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("satelliteFlyover")) & 1) != 0)
    {
      a3 = 6;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("satellite")) & 1) != 0)
    {
      a3 = 2;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("hybrid")))
    {
      a3 = 1;
    }
  }

  return a3;
}

- (unint64_t)_mapstest_mapTypeWithDefaultType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("mapType")));
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("standard")) & 1) != 0)
    {
      a3 = 0;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("transit")) & 1) != 0)
    {
      a3 = 104;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("satellite")) & 1) != 0)
    {
      a3 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("satelliteFlyover")) & 1) != 0)
    {
      a3 = 3;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("hybrid")))
    {
      a3 = 2;
    }
  }

  return a3;
}

- (BOOL)_mapstest_hasViewMode
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", CFSTR("viewMode")));
  if (v2)
  {
    v3 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v2, v3);
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (int64_t)_mapstest_viewMode
{
  return -[NSDictionary _mapstest_viewModeWithDefaultType:](self, "_mapstest_viewModeWithDefaultType:", 0);
}

- (BOOL)_mapstest_hasMapType
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", CFSTR("mapType")));
  if (v2)
  {
    v3 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v2, v3);
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)_mapstest_mapType
{
  return -[NSDictionary _mapstest_mapTypeWithDefaultType:](self, "_mapstest_mapTypeWithDefaultType:", 0);
}

- (unsigned)_mapstest_searchTestACMode
{
  void *v2;
  uint64_t v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("searchTestACMode")));
  v3 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0
    && (objc_msgSend(v2, "isEqualToString:", CFSTR("SearchTestFullAC")) & 1) == 0)
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SearchTestMiniAC")) & 1) != 0)
    {
      v4 = 1;
    }
    else if (objc_msgSend(v2, "isEqualToString:", CFSTR("SearchTestNoAC")))
    {
      v4 = 2;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)_mapstest_directionIntentType
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("directionIntentMode")));
  v3 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Directions")) & 1) != 0)
    {
      v4 = 1;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("DirectionsTo")) & 1) != 0)
    {
      v4 = 2;
    }
    else if (objc_msgSend(v2, "isEqualToString:", CFSTR("DirectionsToFrom")))
    {
      v4 = 3;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_mapstest_hasMapRegion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("westLng")));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("eastLng")));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("southLat")));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("northLat")));
        v7 = v6 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (GEOMapRegion)_mapstest_mapRegion
{
  GEOMapRegion *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_new(GEOMapRegion);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self, "valueForKey:", CFSTR("westLng")));
  objc_msgSend(v4, "doubleValue");
  -[GEOMapRegion setWestLng:](v3, "setWestLng:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self, "valueForKey:", CFSTR("eastLng")));
  objc_msgSend(v5, "doubleValue");
  -[GEOMapRegion setEastLng:](v3, "setEastLng:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self, "valueForKey:", CFSTR("southLat")));
  objc_msgSend(v6, "doubleValue");
  -[GEOMapRegion setSouthLat:](v3, "setSouthLat:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self, "valueForKey:", CFSTR("northLat")));
  objc_msgSend(v7, "doubleValue");
  -[GEOMapRegion setNorthLat:](v3, "setNorthLat:");

  return v3;
}

- (BOOL)_mapstest_hasLatitudeAndLongitude
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("latitude")));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("longitude")));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CLLocation)_mapstest_location
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("latitude")));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("longitude")));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return (CLLocation *)objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v5, v8);
}

- (CLLocationCoordinate2D)_mapstest_locationCoordinate2D
{
  void *v3;
  double v4;
  CLLocationDegrees v5;
  void *v6;
  double v7;
  CLLocationDegrees v8;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v11;
  CLLocationCoordinate2D result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("latitude")));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("longitude")));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v11 = CLLocationCoordinate2DMake(v5, v8);
  longitude = v11.longitude;
  latitude = v11.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_mapstest_VKLocationCoordinate2D
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("latitude")));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("longitude")));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  VKLocationCoordinate2DMake(v5, v8);
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpPoint
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("latitude")));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("longitude")));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  v9 = -[NSDictionary _mapstest_doubleValueForKey:defaultValue:](self, "_mapstest_doubleValueForKey:defaultValue:", CFSTR("regionSize"), 1.0);
  v11 = VKLocationCoordinate3DMake(v9, v5, v8, v10);
  v13 = v12;
  v15 = v14;

  v16 = v11;
  v17 = v13;
  v18 = v15;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (int)_maptest_lookAroundOffsetTapPositionX
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("offsetTapPointX")));
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)_maptest_lookAroundOffsetTapPositionY
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("offsetTapPointY")));
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)_maptest_lookAroundNavigationTaps
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("totalTaps")));
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)_maptest_lookAroundNavigationAmountToTurnInDegrees
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("amountToTurnInDegrees")));
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (BOOL)_mapstest_hasStartPoint
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("startLatitude")));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("startLongitude")));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_startPoint
{
  double v2;
  double v3;
  double v4;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[NSDictionary _mapstest_pointWithKeys:](self, "_mapstest_pointWithKeys:", &off_101273248);
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)_mapstest_hasEndPoint
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("endLatitude")));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("endLongitude")));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_endPoint
{
  double v2;
  double v3;
  double v4;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[NSDictionary _mapstest_pointWithKeys:](self, "_mapstest_pointWithKeys:", &off_101273260);
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)_mapstest_hasMidPoint
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("midLatitude")));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("midLongitude")));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_midPoint
{
  double v2;
  double v3;
  double v4;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[NSDictionary _mapstest_pointWithKeys:](self, "_mapstest_pointWithKeys:", &off_101273278);
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_pointWithKeys:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if ((unint64_t)v5 > 2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v11));
    objc_msgSend(v12, "doubleValue");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v15));
    objc_msgSend(v16, "doubleValue");
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 2));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v19));
    v21 = objc_msgSend(v20, "doubleValue");
    v6 = VKLocationCoordinate3DMake(v21, v14, v18, v22);
    v8 = v23;
    v10 = v24;

  }
  else
  {
    v6 = VKLocationCoordinate3DMake(v5, 0.0, 0.0, 0.0);
    v8 = v7;
    v10 = v9;
  }

  v25 = v6;
  v26 = v8;
  v27 = v10;
  result.var2 = v27;
  result.var1 = v26;
  result.var0 = v25;
  return result;
}

- (double)_mapstest_pitch
{
  double result;

  -[NSDictionary _mapstest_doubleValueForKey:defaultValue:](self, "_mapstest_doubleValueForKey:defaultValue:", CFSTR("pitch"), 0.0);
  return result;
}

- (double)_mapstest_yaw
{
  double result;

  -[NSDictionary _mapstest_doubleValueForKey:defaultValue:](self, "_mapstest_doubleValueForKey:defaultValue:", CFSTR("yaw"), 0.0);
  return result;
}

- (double)_mapstest_altitude
{
  double result;

  -[NSDictionary _mapstest_doubleValueForKey:defaultValue:](self, "_mapstest_doubleValueForKey:defaultValue:", CFSTR("altitude"), 0.0);
  return result;
}

- (BOOL)_mapstest_hasAltitude
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("altitude")));
  v3 = v2 != 0;

  return v3;
}

- (double)_mapstest_duration
{
  double result;

  -[NSDictionary _mapstest_doubleValueForKey:defaultValue:](self, "_mapstest_doubleValueForKey:defaultValue:", CFSTR("duration"), 0.0);
  return result;
}

- (unint64_t)_mapstest_flyoverTourId
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("tourId")));
  v3 = objc_msgSend(v2, "longLongValue");

  return (unint64_t)v3;
}

- (double)_mapstest_animationDurationWithDefault:(double)a3
{
  double result;

  -[NSDictionary _mapstest_doubleValueForKey:defaultValue:](self, "_mapstest_doubleValueForKey:defaultValue:", CFSTR("animDuration"), a3);
  return result;
}

- (NSString)_mapstest_originString
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("originString"));
}

- (NSString)_mapstest_destinationString
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("destinationString"));
}

- (NSArray)_mapstest_waypointStrings
{
  return (NSArray *)-[NSDictionary _mapstest_arrayWithJSONForKey:](self, "_mapstest_arrayWithJSONForKey:", CFSTR("waypointsAsJSON"));
}

- (int)_mapstest_transportType
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("transportType")));
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSDate)_mapstest_customDepartureDate
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("leaveOnNextWeekday")));
  v4 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("leaveAtHour")));
  v5 = (void *)v4;
  if (v3)
  {
    v6 = objc_msgSend(v3, "integerValue");
    if (v5)
      v7 = (uint64_t)objc_msgSend(v5, "integerValue");
    else
      v7 = 9;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_nextWeekday:atHour:timeZone:", v6, v7, v10));
  }
  else
  {
    if (!v4)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = objc_msgSend(v5, "integerValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_nextDayAtHour:timeZone:", v9, v10));
  }
  v12 = (void *)v11;

LABEL_9:
  return (NSDate *)v12;
}

- (DirectionsPlan)_mapstest_directionsPlan
{
  return (DirectionsPlan *)-[NSDictionary _mapstest_directionsPlanWithResolvedDestination:](self, "_mapstest_directionsPlanWithResolvedDestination:", 0);
}

- (id)_mapstest_directionsPlanWithResolvedDestination:(id)a3
{
  id v4;
  DirectionsPlan *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  DirectionsPlan *v36;
  char *v37;
  id v38;
  id v39;
  _QWORD v40[2];

  v4 = a3;
  v5 = objc_alloc_init(DirectionsPlan);
  v6 = objc_alloc((Class)GEOComposedWaypoint);
  v7 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithLatitude:longitude:", 0.0, 0.0);
  v8 = objc_msgSend(v6, "initWithLocation:isCurrentLocation:", v7, 1);

  -[DirectionsPlan setDisplayMethod:](v5, "setDisplayMethod:", 1);
  v9 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
  -[DirectionsPlan setRouteRequestStorage:](v5, "setRouteRequestStorage:", v9);

  v10 = -[NSDictionary _mapstest_transportType](self, "_mapstest_transportType");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v5, "routeRequestStorage"));
  objc_msgSend(v11, "setTransportType:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _mapstest_waypointStrings](self, "_mapstest_waypointStrings"));
  v13 = v12;
  if (v12)
  {
    v14 = (char *)objc_msgSend(v12, "count") - 1;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10042DA24;
    v33[3] = &unk_1011B60B0;
    v34 = v8;
    v37 = v14;
    v35 = v4;
    v36 = v5;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v33);

    goto LABEL_11;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _mapstest_originString](self, "_mapstest_originString"));
  -[DirectionsPlan setOriginString:](v5, "setOriginString:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _mapstest_destinationString](self, "_mapstest_destinationString"));
  -[DirectionsPlan setDestinationString:](v5, "setDestinationString:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan originString](v5, "originString"));
  v18 = objc_msgSend(v17, "_mapstest_isCurrentLocationString");

  if (v4)
  {
    if ((v18 & 1) == 0)
    {
      v32 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Invalid waypoint pairs"), 0));
      objc_exception_throw(v32);
    }
    -[DirectionsPlan setOriginString:](v5, "setOriginString:", 0);
    -[DirectionsPlan setDestinationString:](v5, "setDestinationString:", 0);
    v40[0] = v8;
    v40[1] = v4;
    v19 = (id *)v40;
    v20 = 2;
    goto LABEL_10;
  }
  if (v18)
  {
    -[DirectionsPlan setOriginString:](v5, "setOriginString:", 0);
    v39 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
    v22 = objc_msgSend(v21, "mutableCopy");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v5, "routeRequestStorage"));
    objc_msgSend(v23, "setWaypoints:", v22);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan destinationString](v5, "destinationString"));
  v25 = objc_msgSend(v24, "_mapstest_isCurrentLocationString");

  if (v25)
  {
    -[DirectionsPlan setDestinationString:](v5, "setDestinationString:", 0);
    v38 = v8;
    v19 = &v38;
    v20 = 1;
LABEL_10:
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, v20));
    v27 = objc_msgSend(v26, "mutableCopy");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v5, "routeRequestStorage"));
    objc_msgSend(v28, "setWaypoints:", v27);

  }
LABEL_11:
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _mapstest_customDepartureDate](self, "_mapstest_customDepartureDate"));
  v30 = v29;
  if (v29)
  {
    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    -[DirectionsPlan setDepartureTime:](v5, "setDepartureTime:");
  }

  return v5;
}

- (int64_t)_mapstest_orientation
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("orientation")));
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("landscape")))
    v3 = 4;
  else
    v3 = 1;

  return v3;
}

- (int64_t)_mapstest_guidanceStepSwipeCount
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("swipeCount")));
  v3 = v2;
  if (v2)
    v4 = (int64_t)objc_msgSend(v2, "integerValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)_mapstest_isUsingSampleProactiveData
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("isUsingSampleProactiveData")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEqual:", CFSTR("YES"));
  else
    v4 = 0;

  return v4;
}

- (int)_mapstest_waitSecondsForMapViewSetup
{
  return -[NSDictionary _mapstest_integerValueForKey:defaultValue:](self, "_mapstest_integerValueForKey:defaultValue:", CFSTR("waitSecondsForMapViewSetup"), 0);
}

- (NSArray)_mapstest_rptTestActions
{
  return (NSArray *)-[NSDictionary _mapstest_arrayWithJSONForKey:](self, "_mapstest_arrayWithJSONForKey:", CFSTR("actions"));
}

+ (BOOL)dictionary:(id)a3 isEqualToDictionary:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend((id)v5, "isEqualToDictionary:", v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_maps_writeBinaryPlist:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;
  id v17;

  v6 = a3;
  v17 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", self, 200, 0, &v17));
  v8 = v17;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (*a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByDeletingLastPathComponent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    if ((objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v11, 0) & 1) == 0)
      objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, 0);
    v16 = 0;
    v10 = objc_msgSend(v7, "writeToFile:options:error:", v6, 1, &v16);
    v13 = v16;
    v14 = v13;
    if (v13)
    {
      v10 = 0;
      if (*a4)
        *a4 = objc_retainAutorelease(v13);
    }

  }
  return v10;
}

@end
