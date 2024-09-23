@implementation CLActivityBasedBeaconPayloadCache

- (id)initInUniverse:(id)a3 withExternal:(shared_ptr<CLAvengerHarvestInterface:(CLSubHarvesterAvengerSettings *)a5 :External>)a4 withSettings:
{
  __shared_weak_count *cntrl;
  uint64_t *ptr;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  objc_super v22;

  cntrl = a4.__cntrl_;
  ptr = (uint64_t *)a4.__ptr_;
  v22.receiver = self;
  v22.super_class = (Class)CLActivityBasedBeaconPayloadCache;
  v8 = -[CLActivityBasedBeaconPayloadCache init](&v22, "init", a3, a4.__ptr_, a4.__cntrl_, a5);
  if (v8)
  {
    *((_QWORD *)v8 + 1) = a3;
    sub_100349198((_QWORD *)v8 + 2, ptr);
    v9 = *(_OWORD *)((char *)cntrl + 24);
    v10 = *(_OWORD *)((char *)cntrl + 40);
    v11 = *(_OWORD *)((char *)cntrl + 56);
    *(_OWORD *)(v8 + 40) = *(_OWORD *)((char *)cntrl + 8);
    *(_OWORD *)(v8 + 88) = v11;
    *(_OWORD *)(v8 + 72) = v10;
    *(_OWORD *)(v8 + 56) = v9;
    v12 = *(_OWORD *)((char *)cntrl + 88);
    v13 = *(_OWORD *)((char *)cntrl + 104);
    v14 = *(_OWORD *)((char *)cntrl + 120);
    *(_OWORD *)(v8 + 104) = *(_OWORD *)((char *)cntrl + 72);
    *(_OWORD *)(v8 + 152) = v14;
    *(_OWORD *)(v8 + 136) = v13;
    *(_OWORD *)(v8 + 120) = v12;
    v15 = *(_OWORD *)((char *)cntrl + 152);
    v16 = *(_OWORD *)((char *)cntrl + 168);
    v17 = *(_OWORD *)((char *)cntrl + 184);
    *(_OWORD *)(v8 + 168) = *(_OWORD *)((char *)cntrl + 136);
    *(_OWORD *)(v8 + 216) = v17;
    *(_OWORD *)(v8 + 200) = v16;
    *(_OWORD *)(v8 + 184) = v15;
    v18 = *(_OWORD *)((char *)cntrl + 216);
    v19 = *(_OWORD *)((char *)cntrl + 232);
    v20 = *((_QWORD *)cntrl + 31);
    *(_OWORD *)(v8 + 232) = *(_OWORD *)((char *)cntrl + 200);
    *((_QWORD *)v8 + 35) = v20;
    *(_OWORD *)(v8 + 264) = v19;
    *(_OWORD *)(v8 + 248) = v18;
    *((_QWORD *)v8 + 36) = objc_alloc_init((Class)SPFinderInterface);
    *((_QWORD *)v8 + 38) = objc_alloc_init((Class)NSMutableArray);
    *((_QWORD *)v8 + 39) = objc_alloc_init((Class)NSMutableArray);
    v8[320] = 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLActivityBasedBeaconPayloadCache;
  -[CLActivityBasedBeaconPayloadCache dealloc](&v3, "dealloc");
}

- (void)receiveBeaconPayload:(id)a3
{
  -[NSMutableArray addObject:](self->_beaconPayloadCache, "addObject:", a3);
  -[CLActivityBasedBeaconPayloadCache pruneActivityBasedBeaconPayloadCache](self, "pruneActivityBasedBeaconPayloadCache");
}

- (void)pruneActivityBasedBeaconPayloadCache
{
  NSObject *v3;
  id v4;
  id v5;
  NSDate *v6;
  id v7;
  uint64_t v8;
  id v9;
  double v10;
  uint64_t v11;
  id v12;
  id v13;
  void **i;
  NSObject *v15;
  id v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021A7E80);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
  {
    v4 = -[NSMutableArray count](self->_beaconPayloadCache, "count");
    v17 = 68289538;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2050;
    v22 = v4;
    v23 = 2050;
    v24 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"pruneActivityBasedBeaconPayloadCache\", \"activityBasedBeaconPayloadCache count\":%{public}lu, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&v17, 0x26u);
  }
  if (-[NSMutableArray count](self->_beaconPayloadCache, "count"))
  {
    -[NSMutableArray sortUsingComparator:](self->_beaconPayloadCache, "sortUsingComparator:", &stru_1021A7E38);
    v5 = +[NSCountedSet set](NSCountedSet, "set");
    v6 = +[NSDate now](NSDate, "now");
    v7 = -[NSMutableArray count](self->_beaconPayloadCache, "count");
    if ((uint64_t)v7 - 1 >= 0)
    {
      v8 = (uint64_t)v7;
      while (1)
      {
        v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_beaconPayloadCache, "objectAtIndexedSubscript:", --v8);
        -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:", objc_msgSend(objc_msgSend(v9, "advertisement"), "scanDate"));
        if (v10 > (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 28))(&self->_settings))
          break;
        objc_msgSend(v5, "addObject:", objc_msgSend(objc_msgSend(v9, "advertisement"), "address"));
        v12 = objc_msgSend(v5, "countForObject:", objc_msgSend(objc_msgSend(v9, "advertisement"), "address"));
        if ((unint64_t)v12 > (*((int (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings
                                      + 30))(&self->_settings))
        {
          v11 = 3;
          goto LABEL_12;
        }
LABEL_13:
        if (v8 <= 0)
          goto LABEL_14;
      }
      v11 = 1;
LABEL_12:
      objc_msgSend(objc_msgSend(v9, "location"), "horizontalAccuracy");
      -[CLActivityBasedBeaconPayloadCache collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:](self, "collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:", v11);
      -[NSMutableArray removeObjectAtIndex:](self->_beaconPayloadCache, "removeObjectAtIndex:", v8);
      goto LABEL_13;
    }
LABEL_14:
    v13 = -[NSMutableArray count](self->_beaconPayloadCache, "count");
    for (i = self->_settings._vptr$Settings;
          (unint64_t)v13 > ((int (*)(CLSubHarvesterAvengerSettings *))i[6])(&self->_settings);
          i = self->_settings._vptr$Settings)
    {
      objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_beaconPayloadCache, "firstObject"), "location"), "horizontalAccuracy");
      -[CLActivityBasedBeaconPayloadCache collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:](self, "collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:", 2);
      -[NSMutableArray removeObjectAtIndex:](self->_beaconPayloadCache, "removeObjectAtIndex:", 0);
      v13 = -[NSMutableArray count](self->_beaconPayloadCache, "count");
    }
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A7E80);
    v15 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
    {
      v16 = -[NSMutableArray count](self->_beaconPayloadCache, "count");
      v17 = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2049;
      v22 = v16;
      v23 = 2050;
      v24 = 11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"pruneActivityBasedBeaconPayloadCache\", \"prunedBeaconPayloads count\":%{private}lu, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&v17, 0x26u);
    }
  }
}

- (void)receiveSignalEnvironment:(int)a3
{
  self->_recentSignalEnvironment = a3;
}

- (void)collectSecondGeotagMetricWithResult:(int64_t)a3 firstHorizontalAccuracy:(double)a4 secondHorizontalAccuracy:(double)a5 distance:(double)a6
{
  id v11;
  double v12;

  v11 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSDateComponents hour](-[NSCalendar components:fromDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "components:fromDate:", 32, +[NSDate now](NSDate, "now")), "hour")), CFSTR("timeOfDay"));
  if (self->_recentSignalEnvironment)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"), CFSTR("sigEnv"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3), CFSTR("result"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4), CFSTR("firstHAcc"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLActivityBasedBeaconPayloadCache binAccuracy:](self, "binAccuracy:", a4)), CFSTR("firstHAccBounded"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5), CFSTR("secondHAcc"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLActivityBasedBeaconPayloadCache binAccuracy:](self, "binAccuracy:", a5)), CFSTR("secondHAccBounded"));
  v12 = a5 - a4;
  objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12), CFSTR("deltaHAcc"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLActivityBasedBeaconPayloadCache binAccuracy:](self, "binAccuracy:", v12)), CFSTR("deltaHAccBounded"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6), CFSTR("distance"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLActivityBasedBeaconPayloadCache binAccuracy:](self, "binAccuracy:", a6)), CFSTR("distanceBounded"));
  AnalyticsSendEvent(CFSTR("com.apple.locationd.harvest.ba.secondgeotagging"), v11);
}

- (void)collectSecondGeotagMetricWithResult:(int64_t)a3 firstHorizontalAccuracy:(double)a4
{
  -[CLActivityBasedBeaconPayloadCache collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:secondHorizontalAccuracy:distance:](self, "collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:secondHorizontalAccuracy:distance:", a3, a4, NAN, NAN);
}

- (void)regeotagBeaconPayloads
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  External *ptr;
  NSObject *v22;
  _QWORD block[8];
  _QWORD v24[9];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t buf;
  __int16 v31;
  const char *v32;
  __int16 v33;
  uint64_t v34;

  -[CLActivityBasedBeaconPayloadCache pruneActivityBasedBeaconPayloadCache](self, "pruneActivityBasedBeaconPayloadCache");
  v3 = -[NSMutableArray copy](self->_beaconPayloadCache, "copy");
  -[NSMutableArray removeAllObjects](self->_beaconPayloadCache, "removeAllObjects");
  if (objc_msgSend(v3, "count"))
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A7E80);
    v4 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289282;
      v31 = 2082;
      v32 = "";
      v33 = 2050;
      v34 = 11;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"regeotagBeaconPayloads: regeotag beacon payloads in cache for motion transition\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x1Cu);
    }
    v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = dispatch_group_create();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v3);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          dispatch_group_enter(v6);
          v12 = objc_msgSend(objc_msgSend(v11, "advertisement"), "scanDate");
          objc_msgSend(objc_msgSend(v11, "location"), "speedAccuracy");
          v14 = fmax(v13, 0.0);
          objc_msgSend(objc_msgSend(v11, "location"), "speed");
          v16 = fmax(v15, 0.0);
          v17 = (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 23))(&self->_settings);
          v18 = v14 + v16;
          v19 = (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 32))(&self->_settings);
          if (v19 >= v18)
            v19 = v18;
          if (v17 < v19)
            v17 = v19;
          v20 = objc_msgSend(objc_alloc((Class)RTEstimatedLocationOptions), "initWithAverageSpeed:enableFallbackModel:timeInterval:", 1, v17, (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 33))(&self->_settings));
          ptr = self->_external.__ptr_;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1011E8680;
          v24[3] = &unk_1021A7E60;
          v24[4] = v12;
          v24[5] = self;
          v24[6] = v11;
          v24[7] = v5;
          v24[8] = v6;
          (*(void (**)(External *, id, id, _QWORD *))(*(_QWORD *)ptr + 208))(ptr, v12, v20, v24);
        }
        v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }
    v22 = objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "queue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1011E87A8;
    block[3] = &unk_102150F38;
    block[4] = v6;
    block[5] = self;
    block[6] = v5;
    block[7] = v3;
    dispatch_group_notify(v6, v22, block);
  }
}

- (id)createActivityRefreshBeaconPayloadIfNeededWithLocation:(id)a3 payload:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  id v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CLActivityBasedBeaconPayloadCache *v55;
  uint64_t v56;
  double v57;
  double v58;
  id v59;
  double v60;
  double v61;
  double v62;
  double v63;
  id v64;
  id v65;
  id v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;
  NSObject *v82;
  uint64_t v83;
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
  double v94;
  double v95;
  double v96;
  double v98;
  double v99;
  double v100;
  double v101;
  uint8_t buf[4];
  int v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  uint64_t v119;
  __int16 v120;
  id v121;
  __int16 v122;
  uint64_t v123;

  if (!a3)
  {
    v59 = objc_msgSend(a4, "location");
    objc_msgSend(v59, "horizontalAccuracy");
    v61 = v60;
    v62 = (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 2))(&self->_settings);
    v63 = v61
        + v62
        * (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 23))(&self->_settings);
    v64 = objc_alloc((Class)SPEstimatedLocation);
    v65 = objc_msgSend(objc_msgSend(a4, "advertisement"), "scanDate");
    (*((void (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 29))(&self->_settings);
    v66 = objc_msgSend(v65, "dateByAddingTimeInterval:");
    objc_msgSend(v59, "latitude");
    v68 = v67;
    objc_msgSend(v59, "longitude");
    v70 = v69;
    objc_msgSend(v59, "altitude");
    v72 = v71;
    objc_msgSend(v59, "verticalAccuracy");
    v74 = v73;
    objc_msgSend(v59, "speed");
    v76 = v75;
    objc_msgSend(v59, "speedAccuracy");
    v78 = v77;
    objc_msgSend(v59, "course");
    v80 = v79;
    objc_msgSend(v59, "courseAccuracy");
    v50 = objc_msgSend(v64, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floorLevel:", v66, 0, v68, v70, v63, v72, v74, v76, v78, v80, v81);
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A7E80);
    v82 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(objc_msgSend(a4, "location"), "latitude");
      v84 = v83;
      objc_msgSend(objc_msgSend(a4, "location"), "longitude");
      v86 = v85;
      objc_msgSend(objc_msgSend(a4, "location"), "horizontalAccuracy");
      v88 = v87;
      objc_msgSend(v50, "latitude");
      v90 = v89;
      objc_msgSend(v50, "longitude");
      v92 = v91;
      objc_msgSend(v50, "horizontalAccuracy");
      *(_DWORD *)buf = 68290819;
      v103 = 0;
      v104 = 2082;
      v105 = "";
      v106 = 2049;
      v107 = v84;
      v108 = 2049;
      v109 = v86;
      v110 = 2049;
      v111 = v88;
      v112 = 2049;
      v113 = v90;
      v114 = 2049;
      v115 = v92;
      v116 = 2049;
      v117 = v93;
      v118 = 2050;
      v119 = 11;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"createActivityRefreshBeaconPayloadIfNeeded:estimatedLocation is invalid\", \"old location latitude\":\"%{private}f\", \"old location longitude\":\"%{private}f\", \"old location horizontalAccuracy\":\"%{private}f\", \"new location latitude\":\"%{private}f\", \"new location longitude\":\"%{private}f\", \"new location horizontalAccuracy\":\"%{private}f\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x58u);
    }
    objc_msgSend(objc_msgSend(a4, "location"), "horizontalAccuracy");
    v95 = v94;
    objc_msgSend(v50, "horizontalAccuracy");
    v54 = v96;
    v58 = 0.0;
    v55 = self;
    v56 = 4;
    v57 = v95;
    goto LABEL_13;
  }
  objc_msgSend(a3, "coordinate");
  v8 = v7;
  objc_msgSend(a3, "coordinate");
  v10 = v9;
  objc_msgSend(objc_msgSend(a4, "location"), "latitude");
  v12 = v11;
  objc_msgSend(objc_msgSend(a4, "location"), "longitude");
  v14 = sub_100124100(v8, v10, v12, v13);
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021A7E80);
  v15 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(objc_msgSend(a4, "location"), "latitude");
    v17 = v16;
    objc_msgSend(objc_msgSend(a4, "location"), "longitude");
    v19 = v18;
    objc_msgSend(objc_msgSend(a4, "location"), "horizontalAccuracy");
    v21 = v20;
    objc_msgSend(a3, "coordinate");
    v23 = v22;
    objc_msgSend(a3, "coordinate");
    v25 = v24;
    objc_msgSend(a3, "horizontalAccuracy");
    *(_DWORD *)buf = 68291331;
    v104 = 2082;
    v103 = 0;
    v105 = "";
    v106 = 2049;
    v107 = v17;
    v108 = 2049;
    v109 = v19;
    v110 = 2049;
    v111 = v21;
    v112 = 2049;
    v113 = v23;
    v114 = 2049;
    v115 = v25;
    v116 = 2049;
    v117 = v26;
    v118 = 2049;
    v119 = *(_QWORD *)&v14;
    v120 = 2113;
    v121 = objc_msgSend(objc_msgSend(a4, "advertisement"), "scanDate");
    v122 = 2050;
    v123 = 11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"createActivityRefreshBeaconPayloadIfNeeded\", \"old location latitude\":\"%{private}f\", \"old location longitude\":\"%{private}f\", \"old location horizontalAccuracy\":\"%{private}f\", \"new location latitude\":\"%{private}f\", \"new location longitude\":\"%{private}f\", \"new location horizontalAccuracy\":\"%{private}f\", \"distance between above two locations\":\"%{private}f\", \"scan date\":%{private, location:escape_only}@, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x6Cu);
  }
  objc_msgSend(objc_msgSend(a4, "location"), "horizontalAccuracy");
  v28 = v27;
  objc_msgSend(a3, "horizontalAccuracy");
  if (-[CLActivityBasedBeaconPayloadCache isResubmitNeededwithOldLocationHacc:newLocationHacc:distance:](self, "isResubmitNeededwithOldLocationHacc:newLocationHacc:distance:", v28, v29, v14))
  {
    v30 = objc_alloc((Class)SPEstimatedLocation);
    v31 = objc_msgSend(objc_msgSend(a4, "advertisement"), "scanDate");
    (*((void (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 29))(&self->_settings);
    v32 = objc_msgSend(v31, "dateByAddingTimeInterval:");
    objc_msgSend(a3, "coordinate");
    v34 = v33;
    objc_msgSend(a3, "coordinate");
    v36 = v35;
    objc_msgSend(a3, "horizontalAccuracy");
    v38 = v37;
    objc_msgSend(a3, "altitude");
    v40 = v39;
    objc_msgSend(a3, "verticalAccuracy");
    v42 = v41;
    objc_msgSend(a3, "speed");
    v44 = v43;
    objc_msgSend(a3, "speedAccuracy");
    v101 = v14;
    v46 = v45;
    objc_msgSend(a3, "course");
    v48 = v47;
    objc_msgSend(a3, "courseAccuracy");
    v50 = objc_msgSend(v30, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floorLevel:", v32, 0, v34, v36, v38, v40, v42, v44, v46, v48, v49);
    objc_msgSend(objc_msgSend(a4, "location"), "horizontalAccuracy");
    v52 = v51;
    objc_msgSend(v50, "horizontalAccuracy");
    v54 = v53;
    v55 = self;
    v56 = 6;
    v57 = v52;
    v58 = v101;
LABEL_13:
    -[CLActivityBasedBeaconPayloadCache collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:secondHorizontalAccuracy:distance:](v55, "collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:secondHorizontalAccuracy:distance:", v56, v57, v54, v58);
    return -[CLActivityBasedBeaconPayloadCache createNewBeaconPayloadwithNewLocation:oldBeaconPayload:](self, "createNewBeaconPayloadwithNewLocation:oldBeaconPayload:", v50, a4);
  }
  objc_msgSend(objc_msgSend(a4, "location"), "horizontalAccuracy");
  v99 = v98;
  objc_msgSend(a3, "horizontalAccuracy");
  -[CLActivityBasedBeaconPayloadCache collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:secondHorizontalAccuracy:distance:](self, "collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:secondHorizontalAccuracy:distance:", 5, v99, v100, v14);
  return 0;
}

- (id)createNewBeaconPayloadwithNewLocation:(id)a3 oldBeaconPayload:(id)a4
{
  SEL v7;
  id v8;
  uint64_t v9;
  NSInvocation *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v29;
  char v30;

  if (+[SPAdvertisement instancesRespondToSelector:](SPAdvertisement, "instancesRespondToSelector:", NSSelectorFromString(CFSTR("initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:"))))
  {
    v7 = NSSelectorFromString(CFSTR("isPosh"));
    v8 = objc_msgSend(a4, "advertisement");
    v10 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", objc_msgSend((id)objc_opt_class(v8, v9), "instanceMethodSignatureForSelector:", v7));
    -[NSInvocation setSelector:](v10, "setSelector:", v7);
    -[NSInvocation setTarget:](v10, "setTarget:", objc_msgSend(a4, "advertisement"));
    -[NSInvocation invoke](v10, "invoke");
    v30 = 0;
    -[NSInvocation getReturnValue:](v10, "getReturnValue:", &v30);
    v11 = objc_alloc((Class)SPAdvertisement);
    v12 = objc_msgSend(objc_msgSend(a4, "advertisement"), "address");
    v13 = objc_msgSend(objc_msgSend(a4, "advertisement"), "advertisementData");
    v14 = objc_msgSend(objc_msgSend(a4, "advertisement"), "status");
    v15 = objc_msgSend(objc_msgSend(a4, "advertisement"), "reserved");
    v16 = objc_msgSend(objc_msgSend(a4, "advertisement"), "rssi");
    v17 = objc_msgSend(objc_msgSend(a4, "advertisement"), "scanDate");
    (*((void (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 29))(&self->_settings);
    v18 = objc_msgSend(v17, "dateByAddingTimeInterval:");
    LOBYTE(v29) = v30;
    v19 = objc_msgSend(v11, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:", v12, v13, v14, v15, v16, v18, v29);
  }
  else
  {
    v20 = objc_alloc((Class)SPAdvertisement);
    v21 = objc_msgSend(objc_msgSend(a4, "advertisement"), "address");
    v22 = objc_msgSend(objc_msgSend(a4, "advertisement"), "advertisementData");
    v23 = objc_msgSend(objc_msgSend(a4, "advertisement"), "status");
    v24 = objc_msgSend(objc_msgSend(a4, "advertisement"), "reserved");
    v25 = objc_msgSend(objc_msgSend(a4, "advertisement"), "rssi");
    v26 = objc_msgSend(objc_msgSend(a4, "advertisement"), "scanDate");
    (*((void (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 29))(&self->_settings);
    v19 = objc_msgSend(v20, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:", v21, v22, v23, v24, v25, objc_msgSend(v26, "dateByAddingTimeInterval:"));
  }
  v27 = objc_msgSend(objc_alloc((Class)SPBeaconPayload), "initWithAdvertisement:location:", v19, a3);
  objc_msgSend(v27, "setObservationValue:", 3);
  objc_msgSend(v27, "setRefreshGeotag:", 1);
  return v27;
}

- (BOOL)isResubmitNeededwithOldLocationHacc:(double)a3 newLocationHacc:(double)a4 distance:(double)a5
{
  double v8;

  -[CLActivityBasedBeaconPayloadCache computeCircleIntersectionAreaWithDistance:firstRadius:secondRadius:](self, "computeCircleIntersectionAreaWithDistance:firstRadius:secondRadius:", a5, a3, a4);
  return v8 / (a4 * 3.14159265 * a4 + a3 * 3.14159265 * a3 - v8) < (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings
                                                                    + 31))(&self->_settings);
}

- (void)uploadBeaconPayloadsIfAllowed
{
  NSObject *v3;
  id v4;
  _BOOL4 isCameraAppRunning;
  id v6;
  id v7;
  _QWORD v8[5];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  uint64_t v18;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (-[NSMutableArray count](self->_beaconPayloadsToUpload, "count") && !self->_isCameraAppRunning)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A7E80);
    v3 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
    {
      v4 = -[NSMutableArray count](self->_beaconPayloadsToUpload, "count");
      isCameraAppRunning = self->_isCameraAppRunning;
      *(_DWORD *)buf = 68289795;
      v11 = 2082;
      v10 = 0;
      v12 = "";
      v13 = 2049;
      v14 = v4;
      v15 = 1025;
      v16 = isCameraAppRunning;
      v17 = 2050;
      v18 = 11;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"uploadBeaconPayloadsIfAllowed\", \"refreshedBeaconPayloads count\":%{private}lu, \"isCameraAppRunning\":%{private}hhd, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x2Cu);
    }
    v6 = -[NSMutableArray copy](self->_beaconPayloadsToUpload, "copy");
    -[NSMutableArray removeAllObjects](self->_beaconPayloadsToUpload, "removeAllObjects");
    v7 = -[SPFinderInterface beaconPayloadCache](self->_finderInterface, "beaconPayloadCache");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1011E9348;
    v8[3] = &unk_102143618;
    v8[4] = self;
    objc_msgSend(v7, "saveBeaconPayloads:completion:", v6, v8);

  }
}

- (void)updateCameraRunning:(BOOL)a3
{
  self->_isCameraAppRunning = a3;
  -[CLActivityBasedBeaconPayloadCache uploadBeaconPayloadsIfAllowed](self, "uploadBeaconPayloadsIfAllowed");
}

- (int)binAccuracy:(double)a3
{
  if (a3 <= 0.0)
    return 0;
  if (a3 <= 5.0)
    return 5;
  if (a3 <= 10.0)
    return 10;
  if (a3 <= 15.0)
    return 15;
  if (a3 <= 25.0)
    return 25;
  if (a3 <= 50.0)
    return 50;
  if (a3 <= 75.0)
    return 75;
  if (a3 <= 100.0)
    return 100;
  if (a3 <= 125.0)
    return 125;
  if (a3 <= 250.0)
    return 250;
  if (a3 <= 500.0)
    return 500;
  if (a3 <= 750.0)
    return 750;
  if (a3 <= 1000.0)
    return 1000;
  if (a3 <= 5000.0)
    return 5000;
  if (a3 <= 10000.0)
    return 10000;
  return 20000;
}

- (double)computeCircleIntersectionAreaWithDistance:(double)a3 firstRadius:(double)a4 secondRadius:(double)a5
{
  double v5;
  double v6;
  BOOL v8;
  double result;
  long double v10;

  v5 = a5;
  v6 = a4;
  v8 = a4 <= a5;
  if (a4 >= a5)
    a4 = a5;
  if (!v8)
    a5 = v6;
  result = 0.0;
  if (a4 + a5 > a3 && a3 >= 0.0 && a4 > 0.0 && a5 > 0.0)
  {
    if (a4 + a3 <= a5)
    {
      return a4 * (a4 * 3.14159265);
    }
    else
    {
      v10 = v6 * v6 * acos((a3 * a3 + v6 * v6 - v5 * v5) / (a3 + a3) / v6);
      return v10
           + v5 * v5 * acos((a3 * a3 - v6 * v6 + v5 * v5) / (a3 + a3) / v5)
           + sqrt((a3 + v6 + v5) * ((a3 + v6 - v5) * ((v6 - a3 + v5) * (a3 - v6 + v5)))) * -0.5;
    }
  }
  return result;
}

- (NSMutableArray)beaconPayloadCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 304, 1);
}

- (void)setBeaconPayloadCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSMutableArray)beaconPayloadsToUpload
{
  return (NSMutableArray *)objc_getProperty(self, a2, 312, 1);
}

- (void)setBeaconPayloadsToUpload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  sub_100261F44((uint64_t)&self->_external);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = off_1021A5968;
  *(_OWORD *)((char *)self + 40) = xmmword_101C1F230;
  *(_OWORD *)((char *)self + 56) = xmmword_101C1F240;
  *((_QWORD *)self + 9) = 0x12000001F4;
  *((_DWORD *)self + 20) = 72;
  *((_QWORD *)self + 11) = 0x40CC200000000000;
  *((_BYTE *)self + 96) = 1;
  *((_DWORD *)self + 25) = 1;
  *(_OWORD *)((char *)self + 104) = xmmword_101C1F250;
  *(_OWORD *)((char *)self + 120) = xmmword_101C1F260;
  *((_QWORD *)self + 17) = 0x40B2C00000000000;
  *((_BYTE *)self + 144) = 0;
  *(_OWORD *)((char *)self + 152) = xmmword_101C1F270;
  *((_DWORD *)self + 42) = 1;
  *((_OWORD *)self + 11) = xmmword_101C16BE0;
  *((_OWORD *)self + 12) = xmmword_101C16BF0;
  *((_OWORD *)self + 13) = xmmword_101C16C00;
  *((_OWORD *)self + 14) = xmmword_101C16C10;
  *((_OWORD *)self + 15) = xmmword_101C16C20;
  *((_DWORD *)self + 64) = 4;
  *((_QWORD *)self + 33) = 0x3FECCCCCCCCCCCCDLL;
  *((_OWORD *)self + 17) = xmmword_101C16C30;
  return self;
}

@end
