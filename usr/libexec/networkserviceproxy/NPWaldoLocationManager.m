@implementation NPWaldoLocationManager

- (NPWaldoLocationManager)initWithWaldo:(id)a3
{
  id v4;
  NPWaldoLocationManager *v5;
  NPWaldoLocationManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NPWaldoLocationManager;
  v5 = -[NPWaldoLocationManager init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_waldoInfo, v4);

  return v6;
}

- (BOOL)shouldCheckLocation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  double v59;
  int v60;
  double v61;
  __int16 v62;
  void *v63;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locationExpiration"));

    if (v5)
    {
      v9 = nplog_obj(v6, v7, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v60) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Location expiration set, should check location", (uint8_t *)&v60, 2u);
      }
      goto LABEL_24;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "useGeohashFromServer"));

    if (!v13
      || (v10 = objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"))) == 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
      if (!v10)
        goto LABEL_13;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject timestamp](v10, "timestamp"));
    objc_msgSend(v14, "timeIntervalSinceNow");
    v16 = fabs(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "locationCheckInterval"));
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    if (v16 > v20)
      goto LABEL_13;
    v21 = -[NPWaldoLocationManager sortEdgesByDistanceWithNewLocation:checkOnly:](self, "sortEdgesByDistanceWithNewLocation:checkOnly:", v10, 1);
    if (v21)
    {
      v24 = nplog_obj(v21, v22, v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v60) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Current location might have moved substantially, should check location", (uint8_t *)&v60, 2u);
      }
    }
    else
    {
LABEL_13:
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "locationCheckTimestamp"));
      if (v27)
      {
        v28 = (void *)v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "locationCheckTimestamp"));
        objc_msgSend(v30, "timeIntervalSinceNow");
        v32 = fabs(v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "locationCheckInterval"));
        objc_msgSend(v34, "doubleValue");
        v36 = v35;

        if (v32 <= v36)
        {
          v40 = nplog_obj(v37, v38, v39);
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "locationCheckTimestamp"));
            objc_msgSend(v58, "timeIntervalSinceNow");
            v60 = 134217984;
            v61 = fabs(v59);
            _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Last location check was %f seconds ago, do not check location", (uint8_t *)&v60, 0xCu);

          }
          v11 = 0;
          goto LABEL_25;
        }
      }
      else
      {

      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "locationCheckTimestamp"));

      if (!v43)
        goto LABEL_23;
      v47 = nplog_obj(v44, v45, v46);
      v25 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "locationCheckTimestamp"));
        objc_msgSend(v49, "timeIntervalSinceNow");
        v51 = fabs(v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "locationCheckInterval"));
        v60 = 134218242;
        v61 = v51;
        v62 = 2112;
        v63 = v53;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Last location check was %f seconds ago (interval is %@), should check location", (uint8_t *)&v60, 0x16u);

      }
    }

LABEL_23:
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    objc_msgSend(v55, "setLocationCheckTimestamp:", v54);

LABEL_24:
    v11 = 1;
LABEL_25:

    return v11;
  }
  return 0;
}

- (void)handleNewLocation:(id)a3
{
  id v4;

  if (!-[NPWaldoLocationManager sortEdgesByDistanceWithNewLocation:checkOnly:](self, "sortEdgesByDistanceWithNewLocation:checkOnly:", a3, 1))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    objc_msgSend(v4, "setLocationExpiration:", 0);

  }
}

- (void)setCurrentLatitude:(double)a3 longitude:(double)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  CLLocationCoordinate2D v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v9 = objc_alloc((Class)CLLocation);
  v10 = CLLocationCoordinate2DMake(a3, a4);
  v11 = objc_msgSend(v9, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v8, v10.latitude, v10.longitude, 0.0, 0.0, -1.0);

  -[NPWaldoLocationManager setLatestLocation:](self, "setLatestLocation:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "useGeohashFromServer"));
  if (!v13)
  {

    goto LABEL_5;
  }
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));

  if (!v15)
  {
LABEL_5:
    v16 = (id)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
    -[NPWaldoLocationManager handleNewLocation:](self, "handleNewLocation:", v16);

  }
}

- (void)setCurrentGeohash:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  if (a3)
  {
    v10 = 0.0;
    v11 = 0.0;
    if (geohashToLatitudeLongitude(a3, &v11, &v10))
    {
      v4 = objc_alloc((Class)CLLocation);
      v5 = objc_msgSend(v4, "initWithLatitude:longitude:", v11, v10);
      -[NPWaldoLocationManager setLatestGeohashLocation:](self, "setLatestGeohashLocation:", v5);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "useGeohashFromServer"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));

      if (!v9)
        return;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));
      -[NPWaldoLocationManager handleNewLocation:](self, "handleNewLocation:", v6);
    }

  }
}

- (BOOL)sortEdgesByDistanceWithNewLocation:(id)a3 checkOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NPWaldoLocationManager *v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  NPWaldoLocationManager *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *i;
  void *v55;
  id v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  unint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  unint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  unsigned int v86;
  void *v87;
  id v88;
  void *v89;
  NPWaldoLocationManager *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  id v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSObject *v114;
  _BOOL4 v115;
  void *v116;
  void *v117;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  NPWaldoLocationManager *v123;
  _BOOL4 v124;
  NSObject *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint8_t v130[128];
  uint8_t buf[4];
  double v132;
  __int16 v133;
  void *v134;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));

  if (!v7)
  {
    v30 = nplog_obj(v8, v9, v10);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failed to sort edges with location, no waldoInfo", buf, 2u);
    }
    goto LABEL_37;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cachedLocation"));
  if (!v12)
  {
    v19 = self;
    v28 = 0.0;
    v29 = 1;
    goto LABEL_8;
  }
  v13 = (void *)v12;
  v124 = v4;
  v14 = objc_alloc((Class)CLLocation);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cachedLocation"));
  objc_msgSend(v16, "latitude");
  v18 = v17;
  v19 = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cachedLocation"));
  objc_msgSend(v21, "longtitude");
  v23 = objc_msgSend(v14, "initWithLatitude:longitude:", v18, v22);

  if (v23)
  {
    objc_msgSend(v23, "distanceFromLocation:", v6);
    v28 = v27;
    v29 = 0;
    v11 = v23;
    v4 = v124;
LABEL_8:

    goto LABEL_10;
  }
  v28 = 0.0;
  v29 = 1;
  v4 = v124;
LABEL_10:
  v32 = nplog_obj(v24, v25, v26);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v132 = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Moved %f meters since last location", buf, 0xCu);
  }

  if ((v29 & 1) == 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v19, "waldoInfo"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "locationToleranceDistance"));
    objc_msgSend(v38, "doubleValue");
    v40 = v39;

    if (v28 <= v40)
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v90 = v19;
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v19, "waldoInfo"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "cachedLocation"));
      objc_msgSend(v92, "setTimestamp:", v89);

      v96 = nplog_obj(v93, v94, v95);
      v31 = objc_claimAutoreleasedReturnValue(v96);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v121 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v90, "waldoInfo"));
        v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "locationToleranceDistance"));
        *(_DWORD *)buf = 134218242;
        v132 = v28;
        v133 = 2112;
        v134 = v122;
        _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Location change (%f meters) is within tolerance (%@ meters), no need to re-sort edges", buf, 0x16u);

      }
LABEL_37:
      LOBYTE(v43) = 0;
      goto LABEL_46;
    }
  }
  v41 = nplog_obj(v34, v35, v36);
  v42 = objc_claimAutoreleasedReturnValue(v41);
  v31 = v42;
  if (v4)
  {
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v119 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v19, "waldoInfo"));
      v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "locationToleranceDistance"));
      *(_DWORD *)buf = 134218242;
      v132 = v28;
      v133 = 2112;
      v134 = v120;
      _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Check Only: Location change (%f meters) exceeded tolerance (%@ meters)", buf, 0x16u);

    }
    LOBYTE(v43) = 1;
  }
  else
  {
    v44 = v19;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v19, "waldoInfo"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "locationToleranceDistance"));
      *(_DWORD *)buf = 134218242;
      v132 = v28;
      v133 = 2112;
      v134 = v46;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Location change (%f meters) exceeded tolerance (%@ meters), sorting edges by distance", buf, 0x16u);

    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v44, "waldoInfo"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "edges"));
    v125 = objc_msgSend(v48, "copy");

    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v123 = v44;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v44, "waldoInfo"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "edges"));

    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v127;
      do
      {
        for (i = 0; i != v52; i = (char *)i + 1)
        {
          if (*(_QWORD *)v127 != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * (_QWORD)i);
          v56 = objc_alloc((Class)CLLocation);
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "location"));
          objc_msgSend(v57, "latitude");
          v59 = v58;
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "location"));
          objc_msgSend(v60, "longtitude");
          v62 = objc_msgSend(v56, "initWithLatitude:longitude:", v59, v61);

          objc_msgSend(v6, "distanceFromLocation:", v62);
          objc_msgSend(v55, "setDistance:");

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
      }
      while (v52);
    }

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v123, "waldoInfo"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "edges"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "sortedArrayUsingSelector:", "compareByDistance:"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v123, "waldoInfo"));
    objc_msgSend(v66, "setEdges:", v65);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v123, "waldoInfo"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "edges"));
    v69 = objc_msgSend(v68, "count");

    if (v69)
    {
      v70 = 0;
      do
      {
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v123, "waldoInfo"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "edges"));
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectAtIndexedSubscript:", v70));
        objc_msgSend(v73, "setIndex:", v70);

        ++v70;
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v123, "waldoInfo"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "edges"));
        v76 = objc_msgSend(v75, "count");

      }
      while (v70 < (unint64_t)v76);
    }
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v123, "waldoInfo"));
    v78 = objc_msgSend(v77, "probeSize");

    if (v78)
    {
      v79 = 0;
      do
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v125, "objectAtIndexedSubscript:", v79));
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "label"));
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v123, "waldoInfo"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "edges"));
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectAtIndexedSubscript:", v79));
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "label"));
        v86 = objc_msgSend(v81, "isEqualToString:", v85);

        if ((v86 & 1) == 0)
          break;
        ++v79;
        v87 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v123, "waldoInfo"));
        v88 = objc_msgSend(v87, "probeSize");

      }
      while (v79 < (unint64_t)v88);
      v43 = v86 ^ 1;
    }
    else
    {
      v43 = 0;
    }
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v123, "waldoInfo"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "edges"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectAtIndexedSubscript:", 0));

    v100 = objc_alloc((Class)NPLocation);
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "location"));
    objc_msgSend(v101, "latitude");
    v103 = v102;
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "location"));
    objc_msgSend(v104, "longtitude");
    v106 = v105;
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v108 = objc_msgSend(v100, "initWithLatitude:longtitude:timestamp:", v107, v103, v106);
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v123, "waldoInfo"));
    objc_msgSend(v109, "setCachedLocation:", v108);

    v113 = nplog_obj(v110, v111, v112);
    v114 = objc_claimAutoreleasedReturnValue(v113);
    v115 = os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT);
    if (v43)
    {
      if (v115)
      {
        v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "label"));
        *(_DWORD *)buf = 138412290;
        v132 = *(double *)&v116;
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Location change resulted in new view, closet edge is %@", buf, 0xCu);

      }
      v114 = objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v123, "waldoInfo"));
      -[NSObject linkLatenciesAllSignatures:](v114, "linkLatenciesAllSignatures:", 0);
    }
    else if (v115)
    {
      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "label"));
      *(_DWORD *)buf = 138412290;
      v132 = *(double *)&v117;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Location change resulted in same view, closet edge is %@", buf, 0xCu);

    }
    v31 = v125;
  }
LABEL_46:

  return v43;
}

- (BOOL)exceededLocationTTL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  int v68;
  double v69;
  __int16 v70;
  void *v71;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cachedLocation"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationExpiration"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    v8 = v7;
    if (v6)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentNetworkLastUsed"));

      v13 = nplog_obj(v10, v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "locationExpiration"));
        v68 = 138412546;
        v69 = *(double *)&v9;
        v70 = 2112;
        v71 = v60;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Network last used %@, location expiration %@", (uint8_t *)&v68, 0x16u);

      }
      if (v9)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "locationExpiration"));
        v17 = -[NSObject compare:](v9, "compare:", v16);

        if (v17 == (id)1)
        {
          v21 = nplog_obj(v18, v19, v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v68) = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Location expiration date passed, invalidate cached location", (uint8_t *)&v68, 2u);
          }

          v4 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
          objc_msgSend(v4, "setCachedLocation:", 0);

          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
          objc_msgSend(v23, "setLocationExpiration:", 0);

          LOBYTE(v4) = 1;
          goto LABEL_20;
        }
      }
LABEL_19:
      LOBYTE(v4) = 0;
LABEL_20:

      return (char)v4;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cachedLocation"));
    if ((objc_msgSend(v24, "isValid") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "cachedLocation"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "timestamp"));
      objc_msgSend(v27, "timeIntervalSinceNow");
      v29 = fabs(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "locationTTL"));
      objc_msgSend(v31, "doubleValue");
      v33 = v32;

      if (v29 > v33)
      {
        v37 = nplog_obj(v34, v35, v36);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "cachedLocation"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "timestamp"));
          objc_msgSend(v41, "timeIntervalSinceNow");
          v43 = fabs(v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "locationTTL"));
          v68 = 134218242;
          v69 = v43;
          v70 = 2112;
          v71 = v45;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Last valid location was timestamped %f seconds ago (threshold %@), exceeded TTL", (uint8_t *)&v68, 0x16u);

        }
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "locationTTL"));
        v48 = (uint64_t)objc_msgSend(v47, "integerValue") / 10;

        v49 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceNow:", (double)v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        objc_msgSend(v50, "setLocationExpiration:", v49);

        v54 = nplog_obj(v51, v52, v53);
        v9 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "locationExpiration"));
          v68 = 134218242;
          v69 = *(double *)&v48;
          v70 = 2112;
          v71 = v56;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Expiring cached location in %ld seconds at (%@)", (uint8_t *)&v68, 0x16u);

        }
        goto LABEL_19;
      }
    }
    else
    {

    }
    v57 = nplog_obj(v34, v35, v36);
    v9 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "cachedLocation"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "timestamp"));
      objc_msgSend(v63, "timeIntervalSinceNow");
      v65 = fabs(v64);
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "locationTTL"));
      v68 = 134218242;
      v69 = v65;
      v70 = 2112;
      v71 = v67;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Last valid location was timestamped %f seconds ago (threshold %@), within TTL", (uint8_t *)&v68, 0x16u);

    }
    goto LABEL_19;
  }
  return (char)v4;
}

- (void)sortEdgesByDistanceWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL8 v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  void *v33;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));

  if (!v5)
  {
    v28 = nplog_obj(v6, v7, v8);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Failed to sort edges with completionHandler, no waldoInfo", (uint8_t *)&v32, 2u);
    }

    v4[2](v4, 0);
    goto LABEL_19;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "useGeohashFromServer"));

  if (!v10
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"))) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
    if (!v11)
    {
      v30 = nplog_obj(0, v12, v13);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Not allowed to get current location", (uint8_t *)&v32, 2u);
      }

      ((void (**)(id, BOOL))v4)[2](v4, -[NPWaldoLocationManager exceededLocationTTL](self, "exceededLocationTTL"));
LABEL_19:
      v11 = 0;
      goto LABEL_20;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timestamp"));
  objc_msgSend(v14, "timeIntervalSinceNow");
  v16 = fabs(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "locationCheckInterval"));
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  v24 = nplog_obj(v21, v22, v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = v25;
  if (v16 > v20)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Current location is too old", (uint8_t *)&v32, 2u);
    }

    v27 = -[NPWaldoLocationManager exceededLocationTTL](self, "exceededLocationTTL");
LABEL_15:
    v4[2](v4, v27);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v32 = 138412290;
    v33 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Valid current location %@", (uint8_t *)&v32, 0xCu);
  }

  v27 = -[NPWaldoLocationManager sortEdgesByDistanceWithNewLocation:checkOnly:](self, "sortEdgesByDistanceWithNewLocation:checkOnly:", v11, 0);
  if (v4)
    goto LABEL_15;
LABEL_20:

}

- (id)copyCurrentGeohash
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "coordinate");
    v5 = v4;
    objc_msgSend(v3, "coordinate");
    v6 = latitudeLongitudeToGeohash(3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyCurrentGeohashFromServer
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));
  objc_msgSend(v7, "coordinate");
  v8 = latitudeLongitudeToGeohash(3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (double)dislocation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
  if (!v3)
    return -1.0;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));

  if (!v5)
    return -1.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));
  objc_msgSend(v6, "distanceFromLocation:", v7);
  v9 = v8;

  return v9;
}

- (NPWaldo)waldoInfo
{
  return (NPWaldo *)objc_loadWeakRetained((id *)&self->_waldoInfo);
}

- (void)setWaldoInfo:(id)a3
{
  objc_storeWeak((id *)&self->_waldoInfo, a3);
}

- (CLLocation)latestLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLatestLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CLLocation)latestGeohashLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLatestGeohashLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)locationCompletionHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setLocationCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_latestGeohashLocation, 0);
  objc_storeStrong((id *)&self->_latestLocation, 0);
  objc_destroyWeak((id *)&self->_waldoInfo);
}

@end
