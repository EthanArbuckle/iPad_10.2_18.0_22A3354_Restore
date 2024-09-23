@implementation _GDBAResolver

- (_GDBAResolver)init
{
  _GDBAResolver *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  os_log_t v7;
  OS_os_log *log;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GDBAResolver;
  v2 = -[_GDBAResolver init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.griddatad.locmonitor.queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = os_log_create("com.apple.gds", "geoDataReader");
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_10000CE40 != -1)
    dispatch_once(&qword_10000CE40, &stru_100008530);
  return (id)qword_10000CE38;
}

- (id)balancingAuthorityForLatitude:(double)a3 longitude:(double)a4 polygons:(id)a5
{
  uint64_t v8;
  OS_os_log *log;
  void *v10;
  const __CFString *v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  void *j;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  double v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  MKMapPoint v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  const CGPath *v69;
  int v70;
  NSObject *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  uint64_t v110;
  void *context;
  void *contexta;
  void *v113;
  id obj;
  void *v115;
  void *v116;
  _GDBAResolver *v117;
  uint64_t v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  double v123;
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint8_t buf[4];
  double v134;
  __int16 v135;
  double v136;
  __int16 v137;
  double v138;
  __int16 v139;
  void *v140;
  _BYTE v141[128];
  _QWORD v142[4];
  _QWORD v143[2];
  _QWORD v144[2];
  _BYTE v145[128];
  CLLocationCoordinate2D v146;
  CGPoint v147;

  v100 = a5;
  v99 = (void *)os_transaction_create("com.apple.griddatad.ba.algorithm", v8);
  v117 = self;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283777;
    v134 = a3;
    v135 = 2049;
    v136 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Looking for (%{private}lf, %{private}lf)", buf, 0x16u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("geoJsonDocuments")));
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  context = objc_autoreleasePoolPush();
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  obj = v10;
  v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v145, 16);
  if (v120)
  {
    v118 = *(_QWORD *)v130;
    v11 = CFSTR("geoJsonDocument");
    do
    {
      for (i = 0; i != v120; i = (char *)i + 1)
      {
        if (*(_QWORD *)v130 != v118)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("boundingBox")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 1));
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 3));
        objc_msgSend(v18, "doubleValue");
        v20 = v19;

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
        objc_msgSend(v21, "doubleValue");
        v23 = v22;

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 2));
        objc_msgSend(v24, "doubleValue");
        v26 = v25;

        v27 = v17 >= a3 || v20 <= a3;
        if (!v27 || (v17 > a3 ? (v28 = v20 < a3) : (v28 = 0), v28))
        {
          v29 = v23 >= a4 || v26 <= a4;
          if (!v29 || (v23 > a4 ? (v30 = v26 < a4) : (v30 = 0), v30))
          {
            *(double *)&v31 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v11)));
            v32 = v117->_log;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v134 = *(double *)&v31;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, " Within bounding box. GeoJSON: %@", buf, 0xCu);
            }
            v144[0] = v31;
            v143[0] = v11;
            v143[1] = CFSTR("boundingBox");
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17));
            v142[0] = v33;
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20));
            v142[1] = v34;
            v122 = (void *)v31;
            v35 = v11;
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
            v142[2] = v36;
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26));
            v142[3] = v37;
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v142, 4));
            v144[1] = v38;
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v144, v143, 2));
            objc_msgSend(v115, "addObject:", v39);

            v11 = v35;
          }
        }

      }
      v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v145, 16);
    }
    while (v120);
  }

  objc_autoreleasePoolPop(context);
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v40 = v115;
  v109 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v125, v141, 16);
  if (!v109)
  {
LABEL_68:
    v82 = 0;
    goto LABEL_69;
  }
  v110 = *(_QWORD *)v126;
  *(_QWORD *)&v41 = 134284291;
  v98 = v41;
  v107 = v40;
  while (2)
  {
    for (j = 0; j != v109; j = (char *)j + 1)
    {
      if (*(_QWORD *)v126 != v110)
        objc_enumerationMutation(v40);
      v43 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)j);
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("geoJsonDocument"), v98, v99));
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "dataUsingEncoding:", 4));
      v46 = objc_autoreleasePoolPush();
      v47 = objc_alloc_init((Class)MKGeoJSONDecoder);
      v124 = 0;
      v119 = (void *)v45;
      v48 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "geoJSONObjectsWithData:error:", v45, &v124)));
      v49 = v124;
      if (v48 == 0.0)
      {
        v83 = v117->_log;
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          sub_100004FC8(v83, v84, v85, v86, v87, v88, v89, v90);
        AnalyticsSendEventLazy(CFSTR("com.apple.gds.badetermination"), &stru_100008550);
        goto LABEL_67;
      }
      v50 = v117->_log;
      if (v49)
      {
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          sub_100005034((uint64_t)v49, v50, v91, v92, v93, v94, v95, v96);
LABEL_67:

        objc_autoreleasePoolPop(v46);
        goto LABEL_68;
      }
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v48;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Read GeoJSON %@", buf, 0xCu);
      }
      v116 = v44;

      objc_autoreleasePoolPop(v46);
      v51 = objc_autoreleasePoolPush();
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v48, "objectAtIndexedSubscript:", 0));
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "properties"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:"));
      *(double *)&v54 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("name"))));
      v123 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("abbrev"))));
      v55 = v117->_log;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v134 = *(double *)&v54;
        v135 = 2112;
        v136 = v123;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Name %@ %@", buf, 0x16u);
      }
      v121 = (void *)v54;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "geometry"));
      if (objc_msgSend(v56, "count"))
      {
        contexta = v52;
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", 0));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "polygons"));

        v146.latitude = a3;
        v146.longitude = a4;
        v59 = MKMapPointForCoordinate(v146);
        if (objc_msgSend(v58, "count"))
        {
          v108 = v51;
          v60 = 0;
          while (1)
          {
            v61 = objc_autoreleasePoolPush();
            v62 = objc_alloc((Class)MKPolygonRenderer);
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v60));
            v64 = objc_msgSend(v62, "initWithPolygon:", v63);

            objc_msgSend(v64, "pointForMapPoint:", v59.x, v59.y);
            v66 = v65;
            v68 = v67;
            v69 = (const CGPath *)objc_msgSend(v64, "path");
            v147.x = v66;
            v147.y = v68;
            if (CGPathContainsPoint(v69, 0, v147, 1))
              break;

            objc_autoreleasePoolPop(v61);
            if ((unint64_t)objc_msgSend(v58, "count") <= ++v60)
            {
              v70 = 0;
              goto LABEL_55;
            }
          }
          v71 = v117->_log;
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v98;
            v134 = a3;
            v135 = 2049;
            v136 = a4;
            v137 = 2112;
            v138 = v123;
            v139 = 2112;
            v140 = v121;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Coordinate (%{private}f,%{private}f) inside %@ %@", buf, 0x2Au);
          }
          v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("boundingBox")));
          v104 = objc_alloc((Class)_GDSBalancingAuthorityOutput);
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectAtIndexedSubscript:", 0));
          objc_msgSend(v106, "doubleValue");
          v73 = v72;
          v70 = 1;
          v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectAtIndexedSubscript:", 1));
          objc_msgSend(v105, "doubleValue");
          v75 = v74;
          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectAtIndexedSubscript:", 2));
          objc_msgSend(v101, "doubleValue");
          v77 = v76;
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectAtIndexedSubscript:", 3));
          objc_msgSend(v78, "doubleValue");
          v80 = v79;
          v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          v103 = objc_msgSend(v104, "initWithIdentifier:name:latitudeStart:latitudeEnd:longitudeStart:longitudeEnd:updateDate:", v121, *(_QWORD *)&v123, v81, v73, v75, v77, v80);

          objc_autoreleasePoolPop(v61);
LABEL_55:
          v40 = v107;
          v51 = v108;
        }
        else
        {
          v70 = 0;
        }

        v52 = contexta;
      }
      else
      {
        v70 = 5;
      }

      objc_autoreleasePoolPop(v51);
      if (v70 != 5 && v70)
      {
        v82 = v103;
        goto LABEL_69;
      }
    }
    v82 = 0;
    v109 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v125, v141, 16);
    if (v109)
      continue;
    break;
  }
LABEL_69:

  return v82;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
