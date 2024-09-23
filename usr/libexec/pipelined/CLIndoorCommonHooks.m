@implementation CLIndoorCommonHooks

+ (id)filterLocationGroups:(id)a3 isRegionalSupported:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v5, "copy");
  }
  else
  {
    v7 = objc_alloc_init((Class)NSMutableArray);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
          if (!+[CLLocationContextUtil isRegional:](CLLocationContextUtil, "isRegional:", objc_msgSend(v12, "locationContext", (_QWORD)v14)))objc_msgSend(v7, "addObject:", v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  return v7;
}

+ (id)nearestVenues:()time_point<std:(std:()std:(1000000000>>>)a3 :(id)a4 ratio<1 :(id)a5 chrono:(double)a6 :(const NearestVenueSettings *)a7 duration<long)long :(BOOL)a8 chrono::steady_clock availableVenues:latestPosition:availabilityZScoreConfidenceInterval:settings:isAllowedMultipleVenues:
{
  id v13;
  id var2;
  GeographicCoordinate *v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  id v28;
  id v29;
  uint64_t v30;
  double v31;
  void *j;
  void *v33;
  double v34;
  double v35;
  double v36;
  id v37;
  std::string::size_type size;
  std::string *v39;
  void *v40;
  void *v42;
  id v43;
  id v44;
  const NearestVenueSettings *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  std::string v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  std::string v55;
  _OWORD v56[10];
  _BYTE v57[128];
  _BYTE v58[128];

  v44 = a4;
  v43 = a5;
  if (!a7->var0)
  {
    if (!a7->var2 && (objc_msgSend(v43, "isStaleFix:", a3.var0.__rep_) & 1) != 0)
    {
      v13 = 0;
      goto LABEL_45;
    }
    v45 = a7;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorCommonHooks filterLocationGroups:isRegionalSupported:](CLIndoorCommonHooks, "filterLocationGroups:isRegionalSupported:", v44, a7->var3));
    if (!objc_msgSend(v42, "count"))
    {
      v13 = 0;
LABEL_44:

      goto LABEL_45;
    }
    var2 = a7->var2;
    if (var2 || (var2 = v43) != 0)
      objc_msgSend(var2, "gpsLocation");
    else
      memset(v56, 0, 156);
    v15 = -[GeographicCoordinate initWithLatitude:longitude:andAltitude:]([GeographicCoordinate alloc], "initWithLatitude:longitude:andAltitude:", *(_OWORD *)((char *)v56 + 4), 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ECEFCoordinate fromLatLon:](ECEFCoordinate, "fromLatLon:", v15));

    v17 = *(double *)((char *)&v56[1] + 4) * a6;
    if (a8)
    {
      v13 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v42, "count"));
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v18 = v42;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v47 != v20)
              objc_enumerationMutation(v18);
            v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "groupId"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("G"), "stringByAppendingString:", v23));

            if ((objc_msgSend(v13, "containsObject:", v24) & 1) == 0)
            {
              objc_msgSend(v22, "distance:", v16);
              v26 = v25;
              objc_msgSend(v22, "tolerance");
              if (v26 - v17 - v27 < v45->var1)
                objc_msgSend(v13, "addObject:", v24);
            }

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
        }
        while (v19);
      }

      goto LABEL_43;
    }
    memset(&v55, 0, sizeof(v55));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v28 = v42;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v52;
      v31 = INFINITY;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(_QWORD *)v52 != v30)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v33, "distance:", v16);
          v35 = v34;
          if (v34 < v31)
          {
            objc_msgSend(v33, "tolerance");
            if (v35 <= v17 + v36)
            {
              v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "groupId")));
              std::string::assign(&v55, (const std::string::value_type *)objc_msgSend(v37, "UTF8String"));

              v31 = v35;
            }
          }
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      }
      while (v29);
    }

    size = HIBYTE(v55.__r_.__value_.__r.__words[2]);
    if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v55.__r_.__value_.__l.__size_;
    if (size)
    {
      std::operator+<char>("G", &v55);
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v55.__r_.__value_.__l.__data_);
      v55 = v50;
      if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v39 = &v55;
      else
        v39 = (std::string *)v50.__r_.__value_.__r.__words[0];
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v39));
      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v40));

      if ((*((_BYTE *)&v55.__r_.__value_.__s + 23) & 0x80) == 0)
        goto LABEL_43;
    }
    else
    {
      v13 = 0;
      if ((*((_BYTE *)&v55.__r_.__value_.__s + 23) & 0x80) == 0)
        goto LABEL_43;
    }
    operator delete(v55.__r_.__value_.__l.__data_);
LABEL_43:

    goto LABEL_44;
  }
  v13 = a7->var0;
LABEL_45:

  return v13;
}

@end
