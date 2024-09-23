@implementation VLFSessionHomeWorkMonitor

- (VLFSessionHomeWorkMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6;
  id v7;
  VLFSessionHomeWorkMonitor *v8;
  id v9;
  NSObject *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSObject *v15;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  char *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  char *v26;
  _QWORD block[4];
  VLFSessionHomeWorkMonitor *v28;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v17 = sub_1004318FC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v31 = "-[VLFSessionHomeWorkMonitor initWithObserver:locationManager:]";
      v32 = 2080;
      v33 = "VLFSessionHomeWorkMonitor.m";
      v34 = 1024;
      v35 = 49;
      v36 = 2080;
      v37 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v31 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v22 = sub_1004318FC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v31 = "-[VLFSessionHomeWorkMonitor initWithObserver:locationManager:]";
      v32 = 2080;
      v33 = "VLFSessionHomeWorkMonitor.m";
      v34 = 1024;
      v35 = 50;
      v36 = 2080;
      v37 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v31 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)VLFSessionHomeWorkMonitor;
  v8 = -[VLFSessionMonitor initWithObserver:](&v29, "initWithObserver:", v6);
  if (v8)
  {
    v9 = sub_1002BF784();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v31 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v8->_locationManager, a4);
    -[MKLocationManager listenForLocationUpdates:](v8->_locationManager, "listenForLocationUpdates:", v8);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.Maps.VLFSessionHomeWorkMonitor", v12);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;

    v15 = v8->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002BF7C4;
    block[3] = &unk_1011AC860;
    v28 = v8;
    dispatch_async(v15, block);

  }
  return v8;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  _QWORD *v7;
  const char *label;
  const char *v9;
  BOOL v10;
  void *v11;
  objc_super v12;
  _QWORD v13[2];
  void (*v14)(uint64_t);
  void *v15;
  VLFSessionHomeWorkMonitor *v16;
  uint8_t buf[4];
  VLFSessionHomeWorkMonitor *v18;

  v3 = sub_1002BF784();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  -[MKLocationManager stopListeningForLocationUpdates:](self->_locationManager, "stopListeningForLocationUpdates:", self);
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v14 = sub_1002BF9A8;
  v15 = &unk_1011AC860;
  v16 = self;
  v6 = queue;
  v7 = v13;
  label = dispatch_queue_get_label(v6);
  v9 = dispatch_queue_get_label(0);
  if (label == v9 || (label ? (v10 = v9 == 0) : (v10 = 1), !v10 && !strcmp(label, v9)))
  {
    v11 = objc_autoreleasePoolPush();
    v14((uint64_t)v7);
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    dispatch_sync(v6, v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)VLFSessionHomeWorkMonitor;
  -[VLFSessionHomeWorkMonitor dealloc](&v12, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionHomeWorkMonitorEnabled, off_1014B3EF8);
}

- (double)distanceThreshold
{
  return GEOConfigGetDouble(MapsConfig_VLFSessionHomeWorkMonitorDistanceThreshold, off_1014B3F28);
}

- (BOOL)shouldProcessHomeItems
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionHomeWorkMonitorHomeCheckEnabled, off_1014B3F08);
}

- (BOOL)shouldProcessWorkItems
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionHomeWorkMonitorWorkCheckEnabled, off_1014B3F18);
}

- (void)_updateMeCard
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  VLFSessionHomeWorkMonitor *v11;

  v3 = sub_1002BF784();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Updating me card", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v5 = sub_100B3A5D4();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "oneFavorites"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002BFB90;
  v8[3] = &unk_1011AFE50;
  objc_copyWeak(&v9, (id *)buf);
  objc_msgSend(v7, "readMeCardWithHandler:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)_updateHomeWorkEntries:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  id v18;
  NSObject *v19;
  VLFSessionHomeWorkMonitor *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  VLFSessionHomeWorkMonitor *v25;
  int v26;
  VLFSessionHomeWorkMonitor *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;

  v4 = a3;
  if (!v4)
  {
    v21 = sub_1004318FC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = 136315906;
      v27 = (VLFSessionHomeWorkMonitor *)"-[VLFSessionHomeWorkMonitor _updateHomeWorkEntries:]";
      v28 = 2080;
      v29 = "VLFSessionHomeWorkMonitor.m";
      v30 = 1024;
      v31 = 126;
      v32 = 2080;
      v33 = "meCard != nil";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v26, 0x26u);
    }

    if (sub_100A70734())
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (VLFSessionHomeWorkMonitor *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v26 = 138412290;
        v27 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);

      }
    }
  }
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v17 = dispatch_queue_get_label(0);
        v26 = 136316418;
        v27 = (VLFSessionHomeWorkMonitor *)"-[VLFSessionHomeWorkMonitor _updateHomeWorkEntries:]";
        v28 = 2080;
        v29 = "VLFSessionHomeWorkMonitor.m";
        v30 = 1024;
        v31 = 129;
        v32 = 2080;
        v33 = "dispatch_get_main_queue()";
        v34 = 2080;
        v35 = v16;
        v36 = 2080;
        v37 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v26,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v18 = sub_1004318FC();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = (VLFSessionHomeWorkMonitor *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v26 = 138412290;
          v27 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);

        }
      }
    }
  }
  v8 = sub_1002BF784();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v26 = 134349056;
    v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Updating home and work entries", (uint8_t *)&v26, 0xCu);
  }

  if (-[VLFSessionHomeWorkMonitor shouldProcessHomeItems](self, "shouldProcessHomeItems"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItemsForHome"));
    -[VLFSessionHomeWorkMonitor setHomeMapItems:](self, "setHomeMapItems:", v10);

  }
  else
  {
    -[VLFSessionHomeWorkMonitor setHomeMapItems:](self, "setHomeMapItems:", 0);
  }
  if (-[VLFSessionHomeWorkMonitor shouldProcessWorkItems](self, "shouldProcessWorkItems"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItemsForWork"));
    -[VLFSessionHomeWorkMonitor setWorkMapItems:](self, "setWorkMapItems:", v11);

  }
  else
  {
    -[VLFSessionHomeWorkMonitor setWorkMapItems:](self, "setWorkMapItems:", 0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor locationManager](self, "locationManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastLocation"));
  -[VLFSessionHomeWorkMonitor _updateStateWithLocation:](self, "_updateStateWithLocation:", v13);

}

- (void)_updateStateWithLocation:(id)a3
{
  char *v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double Double;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double DistanceCoordinates;
  NSObject *v24;
  void *v25;
  id v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint32_t v30;
  id v31;
  id v32;
  NSObject *v33;
  const char *v34;
  unsigned __int8 v35;
  id v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  id v40;
  unsigned __int8 v41;
  id v42;
  NSObject *v43;
  _BOOL4 v44;
  id v45;
  NSObject *v46;
  const char *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *i;
  uint64_t v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  id v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  id v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  VLFSessionHomeWorkMonitor *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  VLFSessionHomeWorkMonitor *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  _BYTE v76[14];
  __int16 v77;
  const char *v78;
  __int16 v79;
  const char *v80;

  v4 = (char *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v61 = sub_1004318FC();
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v72 = (VLFSessionHomeWorkMonitor *)"-[VLFSessionHomeWorkMonitor _updateStateWithLocation:]";
        v73 = 2080;
        v74 = "VLFSessionHomeWorkMonitor.m";
        v75 = 1024;
        *(_DWORD *)v76 = 141;
        *(_WORD *)&v76[4] = 2080;
        *(_QWORD *)&v76[6] = "dispatch_get_main_queue()";
        v77 = 2080;
        v78 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v79 = 2080;
        v80 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v63 = sub_1004318FC();
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v65 = (VLFSessionHomeWorkMonitor *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v72 = v65;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v8 = sub_1002BF784();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor lastLocation](self, "lastLocation"));
    *(_DWORD *)buf = 134349571;
    v72 = self;
    v73 = 2113;
    v74 = v4;
    v75 = 2113;
    *(_QWORD *)v76 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Got a new location: %{private}@, lastLocation: %{private}@", buf, 0x20u);

  }
  if (!v4)
  {
    v26 = sub_1002BF784();
    v24 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      goto LABEL_60;
    *(_DWORD *)buf = 134349056;
    v72 = self;
    v27 = "[%{public}p] Location is nil; ignoring";
    v28 = v24;
    v29 = OS_LOG_TYPE_INFO;
    v30 = 12;
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v28, v29, v27, buf, v30);
    goto LABEL_60;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor lastLocation](self, "lastLocation"));

  if (v11)
  {
    Double = GEOConfigGetDouble(MapsConfig_VLFSessionHomeWorkMonitorLocationUpdateDistanceThreshold, off_1014B4878);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor lastLocation](self, "lastLocation"));
    objc_msgSend(v13, "coordinate");
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor lastLocation](self, "lastLocation"));
    objc_msgSend(v16, "coordinate");
    v18 = v17;
    objc_msgSend(v4, "coordinate");
    v20 = v19;
    v21 = objc_msgSend(v4, "coordinate");
    DistanceCoordinates = CLClientGetDistanceCoordinates(v21, v15, v18, v20, v22);

    if (DistanceCoordinates < Double)
    {
      v31 = sub_1002BF784();
      v24 = objc_claimAutoreleasedReturnValue(v31);
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        goto LABEL_60;
      *(_DWORD *)buf = 134349568;
      v72 = self;
      v73 = 2048;
      v74 = *(const char **)&DistanceCoordinates;
      v75 = 2048;
      *(double *)v76 = Double;
      v27 = "[%{public}p] New location is too close to the last location (%f < %f); ignoring";
      v28 = v24;
      v29 = OS_LOG_TYPE_DEBUG;
      v30 = 32;
      goto LABEL_18;
    }
  }
  -[VLFSessionHomeWorkMonitor setLastLocation:](self, "setLastLocation:", v4);
  v24 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor homeMapItems](self, "homeMapItems"));
  if (v25)
  {

  }
  else if (-[VLFSessionHomeWorkMonitor shouldProcessHomeItems](self, "shouldProcessHomeItems"))
  {
    v32 = sub_1002BF784();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v72 = self;
      v34 = "[%{public}p] Home map items are not available yet; ignoring";
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, v34, buf, 0xCu);
    }
LABEL_34:

    goto LABEL_60;
  }
  v35 = -[VLFSessionHomeWorkMonitor shouldProcessHomeItems](self, "shouldProcessHomeItems");
  v36 = sub_1002BF784();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG);
  if ((v35 & 1) != 0)
  {
    if (v38)
    {
      *(_DWORD *)buf = 134349056;
      v72 = self;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "[%{public}p] Processing home map items", buf, 0xCu);
    }

    v37 = objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor homeMapItems](self, "homeMapItems"));
    -[NSObject addObjectsFromArray:](v24, "addObjectsFromArray:", v37);
  }
  else if (v38)
  {
    *(_DWORD *)buf = 134349056;
    v72 = self;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "[%{public}p] Home map items are not enabled; will not process",
      buf,
      0xCu);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor workMapItems](self, "workMapItems"));
  if (!v39)
  {
    if (!-[VLFSessionHomeWorkMonitor shouldProcessWorkItems](self, "shouldProcessWorkItems"))
      goto LABEL_35;
    v40 = sub_1002BF784();
    v33 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v72 = self;
      v34 = "[%{public}p] Work map items are not available yet; ignoring";
      goto LABEL_33;
    }
    goto LABEL_34;
  }

LABEL_35:
  v41 = -[VLFSessionHomeWorkMonitor shouldProcessWorkItems](self, "shouldProcessWorkItems");
  v42 = sub_1002BF784();
  v43 = objc_claimAutoreleasedReturnValue(v42);
  v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG);
  if ((v41 & 1) != 0)
  {
    if (v44)
    {
      *(_DWORD *)buf = 134349056;
      v72 = self;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "[%{public}p] Processing work map items", buf, 0xCu);
    }

    v43 = objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor workMapItems](self, "workMapItems"));
    -[NSObject addObjectsFromArray:](v24, "addObjectsFromArray:", v43);
  }
  else if (v44)
  {
    *(_DWORD *)buf = 134349056;
    v72 = self;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "[%{public}p] Work map items are not enabled; will not process",
      buf,
      0xCu);
  }

  v45 = sub_1002BF784();
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    -[VLFSessionHomeWorkMonitor distanceThreshold](self, "distanceThreshold");
    *(_DWORD *)buf = 134349313;
    v72 = self;
    v73 = 2049;
    v74 = v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "[%{public}p] Computing distances to map items with threshold: %{private}f", buf, 0x16u);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v24 = v24;
  v48 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v67;
    while (2)
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v50)
          objc_enumerationMutation(v24);
        v52 = MapsSuggestionsLocationForMapItem(*(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i));
        v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        objc_msgSend(v4, "distanceFromLocation:", v53, (_QWORD)v66);
        v55 = v54;
        -[VLFSessionHomeWorkMonitor distanceThreshold](self, "distanceThreshold");
        if (v55 <= v56)
        {
          if (-[VLFSessionMonitor state](self, "state"))
          {
            v59 = sub_1002BF784();
            v60 = objc_claimAutoreleasedReturnValue(v59);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349056;
              v72 = self;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "[%{public}p] User is too close to one of the map items; updating state",
                buf,
                0xCu);
            }

            -[VLFSessionMonitor setState:](self, "setState:", 0);
          }

          goto LABEL_60;
        }

      }
      v49 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      if (v49)
        continue;
      break;
    }
  }

  if ((id)-[VLFSessionMonitor state](self, "state") != (id)2)
  {
    v57 = sub_1002BF784();
    v58 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v72 = self;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "[%{public}p] User is not sufficiently close to any map item; updating state",
        buf,
        0xCu);
    }

    -[VLFSessionMonitor setState:](self, "setState:", 2);
  }
LABEL_60:

}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionHomeWorkMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionHomeWorkMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (NSString)debugDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = v10;
  v12 = -[VLFSessionMonitor state](self, "state");
  v13 = CFSTR("Hide");
  if (v12 == 1)
    v13 = CFSTR("EnablePuck");
  if (v12 == 2)
    v14 = CFSTR("EnablePuckAndBanner");
  else
    v14 = v13;
  -[VLFSessionHomeWorkMonitor distanceThreshold](self, "distanceThreshold");
  v16 = v15;
  if (-[VLFSessionHomeWorkMonitor shouldProcessHomeItems](self, "shouldProcessHomeItems"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v18 = v17;
  if (-[VLFSessionHomeWorkMonitor shouldProcessWorkItems](self, "shouldProcessWorkItems"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor mapItemsAndDistances](self, "mapItemsAndDistances"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@\nisEnabled: %@,\naffectsPuckVisibility: %@,\naffectsBannerVisibility: %@,\ncurrentState: %@,\nthreshold: %f,\nhome: %@,\nwork: %@,\nmapItems: %@>"), v5, v7, v9, v11, v14, v16, v18, v20, v21));

  return (NSString *)v22;
}

- (id)mapItemsAndDistances
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor locationManager](self, "locationManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastLocation"));

  if (!v4)
    goto LABEL_17;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor homeMapItems](self, "homeMapItems"));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor workMapItems](self, "workMapItems"));

    if (v6)
      goto LABEL_5;
LABEL_17:
    v23 = 0;
    goto LABEL_18;
  }

LABEL_5:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor homeMapItems](self, "homeMapItems"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor homeMapItems](self, "homeMapItems"));
    objc_msgSend(v7, "addObjectsFromArray:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor workMapItems](self, "workMapItems"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHomeWorkMonitor workMapItems](self, "workMapItems"));
    objc_msgSend(v7, "addObjectsFromArray:", v11);

  }
  v12 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v7, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v19 = MapsSuggestionsLocationForMapItem(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        objc_msgSend(v4, "distanceFromLocation:", v20, (_QWORD)v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        objc_msgSend(v12, "setObject:forKey:", v21, v22);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

  v23 = objc_msgSend(v12, "copy");
LABEL_18:

  return v23;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = "-[VLFSessionHomeWorkMonitor locationManagerUpdatedLocation:]";
        v16 = 2080;
        v17 = "VLFSessionHomeWorkMonitor.m";
        v18 = 1024;
        v19 = 265;
        v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
  -[VLFSessionHomeWorkMonitor _updateStateWithLocation:](self, "_updateStateWithLocation:", v8);

}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  VLFSessionHomeWorkMonitor *v13;

  v5 = a4;
  v6 = sub_1002BF784();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Got a new me card", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002C1164;
  v9[3] = &unk_1011AD1E8;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v5;
  v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "description");
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (NSArray)homeMapItems
{
  return self->_homeMapItems;
}

- (void)setHomeMapItems:(id)a3
{
  objc_storeStrong((id *)&self->_homeMapItems, a3);
}

- (NSArray)workMapItems
{
  return self->_workMapItems;
}

- (void)setWorkMapItems:(id)a3
{
  objc_storeStrong((id *)&self->_workMapItems, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workMapItems, 0);
  objc_storeStrong((id *)&self->_homeMapItems, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
}

@end
