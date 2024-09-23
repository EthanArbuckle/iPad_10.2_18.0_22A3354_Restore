@implementation PedestrianARVKMapViewMapDelegate

- (PedestrianARVKMapViewMapDelegate)initWithMapView:(id)a3
{
  id v5;
  char *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v5 = a3;
  if (!v5)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[PedestrianARVKMapViewMapDelegate initWithMapView:]";
      v20 = 2080;
      v21 = "PedestrianARVKMapViewMapDelegate.m";
      v22 = 1024;
      v23 = 93;
      v24 = 2080;
      v25 = "mapView != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)PedestrianARVKMapViewMapDelegate;
  v6 = -[PedestrianARVKMapViewMapDelegate init](&v17, "init");
  if (v6)
  {
    v7 = sub_10091B27C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)v6 + 1, a3);
    objc_msgSend(*((id *)v6 + 1), "setMapDelegate:", v6);
    *((_QWORD *)v6 + 3) = 0;
    *(_OWORD *)(v6 + 56) = xmmword_100E3C7D0;
    *((_QWORD *)v6 + 9) = 0x7FEFFFFFFFFFFFFFLL;
    v9 = objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___PedestrianARVKMapViewObserver, 0);
    v10 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v9;

  }
  return (PedestrianARVKMapViewMapDelegate *)v6;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARVKMapViewMapDelegate *v7;

  v3 = sub_10091B27C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocing", buf, 0xCu);
  }

  -[VKMapView setMapDelegate:](self->_mapView, "setMapDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARVKMapViewMapDelegate;
  -[PedestrianARVKMapViewMapDelegate dealloc](&v5, "dealloc");
}

- (NSArray)currentFeatureMapping
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate activeFeatureSetMapEntry](self, "activeFeatureSetMapEntry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "featureEntries"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate latestFeatureSetMapEntry](self, "latestFeatureSetMapEntry"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "featureEntries"));

  }
  return (NSArray *)v6;
}

- (VKARWalkingFeatureSet)currentFeatureSet
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate activeFeatureSetMapEntry](self, "activeFeatureSetMapEntry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "featureSet"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate latestFeatureSetMapEntry](self, "latestFeatureSetMapEntry"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "featureSet"));

  }
  return (VKARWalkingFeatureSet *)v6;
}

- (BOOL)hasActiveFeatureSet
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate activeFeatureSetMapEntry](self, "activeFeatureSetMapEntry"));
  v3 = v2 != 0;

  return v3;
}

- (void)updateFeatureMapping:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PedestrianARFeatureSetMapEntry *v11;
  VKARWalkingFeature *currentFeature;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  PedestrianARVKMapViewMapDelegate *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = sub_10091B27C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v16 = 134349314;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updated feature mapping: %@", (uint8_t *)&v16, 0x16u);
  }

  v7 = sub_10039DCD4(v4, &stru_1011DBF88);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate mapView](self, "mapView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "setARWalkingFeatureSet:", v8));

  if (objc_msgSend(v8, "count"))
  {
    v11 = -[PedestrianARFeatureSetMapEntry initWithFeatureSet:featureEntries:]([PedestrianARFeatureSetMapEntry alloc], "initWithFeatureSet:featureEntries:", v10, v4);
    -[PedestrianARVKMapViewMapDelegate setLatestFeatureSetMapEntry:](self, "setLatestFeatureSetMapEntry:", v11);

  }
  else
  {
    -[PedestrianARVKMapViewMapDelegate setLatestFeatureSetMapEntry:](self, "setLatestFeatureSetMapEntry:", 0);
    -[PedestrianARVKMapViewMapDelegate setActiveFeatureSetMapEntry:](self, "setActiveFeatureSetMapEntry:", 0);
    currentFeature = self->_currentFeature;
    self->_currentFeature = 0;

    self->_currentIdentifier = 0;
    *(_OWORD *)&self->_currentFeaturePosition.latitude = xmmword_100E3C7D0;
    self->_currentFeaturePosition.altitude = 1.79769313e308;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate activeFeatureSetMapEntry](self, "activeFeatureSetMapEntry"));

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate observers](self, "observers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate mapView](self, "mapView"));
    objc_msgSend(v14, "mapLayer:updatedFeatures:", v15, v8);

  }
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  PedestrianARVKMapViewMapDelegate *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = sub_10091B27C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134349314;
      v9 = self;
      v10 = 2112;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Adding observer: %@", (uint8_t *)&v8, 0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate observers](self, "observers"));
    objc_msgSend(v7, "registerObserver:", v4);

  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  PedestrianARVKMapViewMapDelegate *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = sub_10091B27C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134349314;
      v9 = self;
      v10 = 2112;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Removing observer: %@", (uint8_t *)&v8, 0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate observers](self, "observers"));
    objc_msgSend(v7, "unregisterObserver:", v4);

  }
}

- (void)updateGuidanceInfo:(id)a3 forFeature:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  char *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  char *v16;
  id v17;
  NSObject *v18;
  PedestrianARVKFeatureMapEntry *v19;
  PedestrianARFeatureSetMapEntry *v20;
  void *v21;
  void *v22;
  id v23;
  PedestrianARFeatureSetMapEntry *v24;
  void *v25;
  void *v26;
  char *v27;
  id v28;
  NSObject *v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  PedestrianARVKMapViewMapDelegate *v38;
  id v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  PedestrianARVKMapViewMapDelegate *v44;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  PedestrianARVKMapViewMapDelegate *v49;
  _QWORD v50[4];
  id v51;
  uint8_t buf[4];
  PedestrianARVKMapViewMapDelegate *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  _QWORD v57[2];

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v40 = sub_1004318FC();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v53 = (PedestrianARVKMapViewMapDelegate *)"-[PedestrianARVKMapViewMapDelegate updateGuidanceInfo:forFeature:]";
      v54 = 2080;
      v55 = "PedestrianARVKMapViewMapDelegate.m";
      v56 = 1024;
      LODWORD(v57[0]) = 184;
      WORD2(v57[0]) = 2080;
      *(_QWORD *)((char *)v57 + 6) = "guidanceInfo != nil";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v42 = sub_1004318FC();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = (PedestrianARVKMapViewMapDelegate *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v53 = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v45 = sub_1004318FC();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v53 = (PedestrianARVKMapViewMapDelegate *)"-[PedestrianARVKMapViewMapDelegate updateGuidanceInfo:forFeature:]";
      v54 = 2080;
      v55 = "PedestrianARVKMapViewMapDelegate.m";
      v56 = 1024;
      LODWORD(v57[0]) = 185;
      WORD2(v57[0]) = 2080;
      *(_QWORD *)((char *)v57 + 6) = "feature != nil";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v47 = sub_1004318FC();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = (PedestrianARVKMapViewMapDelegate *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v53 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v8 = sub_10091B27C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapsShortDescription"));
    *(_DWORD *)buf = 134349570;
    v53 = self;
    v54 = 2112;
    v55 = v10;
    v56 = 2112;
    v57[0] = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Updating guidance info: %@ for feature: %@", buf, 0x20u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate latestFeatureSetMapEntry](self, "latestFeatureSetMapEntry"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureEntries"));
  v13 = objc_msgSend(v12, "mutableCopy");

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_10091BF14;
  v50[3] = &unk_1011DBFB0;
  v14 = v7;
  v51 = v14;
  v15 = sub_10039E1FC(v13, v50);
  v16 = (char *)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    v17 = sub_10091B27C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v53 = self;
      v54 = 2112;
      v55 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Found current entry: %@", buf, 0x16u);
    }

    objc_msgSend(v13, "removeObject:", v16);
    v19 = -[PedestrianARVKFeatureMapEntry initWithFeature:guidanceInfo:]([PedestrianARVKFeatureMapEntry alloc], "initWithFeature:guidanceInfo:", v14, v6);
    objc_msgSend(v13, "addObject:", v19);
    v20 = [PedestrianARFeatureSetMapEntry alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate latestFeatureSetMapEntry](self, "latestFeatureSetMapEntry"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureSet"));
    v23 = objc_msgSend(v13, "copy");
    v24 = -[PedestrianARFeatureSetMapEntry initWithFeatureSet:featureEntries:](v20, "initWithFeatureSet:featureEntries:", v22, v23);
    -[PedestrianARVKMapViewMapDelegate setLatestFeatureSetMapEntry:](self, "setLatestFeatureSetMapEntry:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate latestFeatureSetMapEntry](self, "latestFeatureSetMapEntry"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "featureSet"));
    v27 = (char *)objc_msgSend(v26, "state") - 3;

    if ((unint64_t)v27 <= 1)
    {
      v28 = sub_10091B27C();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = (char *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate latestFeatureSetMapEntry](self, "latestFeatureSetMapEntry"));
        *(_DWORD *)buf = 134349314;
        v53 = self;
        v54 = 2112;
        v55 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}p] Latest feature set is already active; switching it to the active set: %@",
          buf,
          0x16u);

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate latestFeatureSetMapEntry](self, "latestFeatureSetMapEntry"));
      -[PedestrianARVKMapViewMapDelegate setActiveFeatureSetMapEntry:](self, "setActiveFeatureSetMapEntry:", v31);

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate observers](self, "observers"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate mapView](self, "mapView"));
    objc_msgSend(v32, "mapLayer:guidanceInfoDidUpdate:forFeature:", v33, v6, v14);

  }
  else
  {
    v34 = sub_1004318FC();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v53 = (PedestrianARVKMapViewMapDelegate *)"-[PedestrianARVKMapViewMapDelegate updateGuidanceInfo:forFeature:]";
      v54 = 2080;
      v55 = "PedestrianARVKMapViewMapDelegate.m";
      v56 = 1024;
      LODWORD(v57[0]) = 196;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v36 = sub_1004318FC();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = (PedestrianARVKMapViewMapDelegate *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v53 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v39 = sub_10091B27C();
    v19 = (PedestrianARVKFeatureMapEntry *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v53 = self;
      _os_log_impl((void *)&_mh_execute_header, &v19->super, OS_LOG_TYPE_ERROR, "[%{public}p] Cannot update guidance info for feature which does not exist in the mapping", buf, 0xCu);
    }
  }

}

- (id)guidanceInfoForFeature:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v4 = a3;
  if (!v4)
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[PedestrianARVKMapViewMapDelegate guidanceInfoForFeature:]";
      v20 = 2080;
      v21 = "PedestrianARVKMapViewMapDelegate.m";
      v22 = 1024;
      v23 = 218;
      v24 = 2080;
      v25 = "feature != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate currentFeatureMapping](self, "currentFeatureMapping"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10091C150;
  v16[3] = &unk_1011DBFB0;
  v17 = v4;
  v6 = v4;
  v7 = sub_10039E1FC(v5, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "guidanceInfo"));
  return v9;
}

- (void)mapLayer:(id)a3 arWalkingFeatureSetStateDidUpdate:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  PedestrianARVKMapViewMapDelegate *v22;
  __int16 v23;
  id v24;

  v5 = a4;
  v6 = sub_10091B27C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v21 = 134349314;
    v22 = self;
    v23 = 2112;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] VK updated AR walking feature set: %@", (uint8_t *)&v21, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate latestFeatureSetMapEntry](self, "latestFeatureSetMapEntry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "featureSet"));
  v10 = (char *)objc_msgSend(v9, "state") - 3;

  if ((unint64_t)v10 <= 1)
  {
    v11 = sub_10091B27C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate latestFeatureSetMapEntry](self, "latestFeatureSetMapEntry"));
      v21 = 134349314;
      v22 = self;
      v23 = 2112;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Latest feature set is now active; switching it to the active set: %@",
        (uint8_t *)&v21,
        0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate latestFeatureSetMapEntry](self, "latestFeatureSetMapEntry"));
    -[PedestrianARVKMapViewMapDelegate setActiveFeatureSetMapEntry:](self, "setActiveFeatureSetMapEntry:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate activeFeatureSetMapEntry](self, "activeFeatureSetMapEntry"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureEntries"));
    v17 = sub_10039DCD4(v16, &stru_1011DBFD0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate observers](self, "observers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate mapView](self, "mapView"));
    objc_msgSend(v19, "mapLayer:updatedFeatures:", v20, v18);

  }
}

- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  VKARWalkingFeature *v10;
  VKARWalkingFeature *currentFeature;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  PedestrianARVKMapViewMapDelegate *v17;
  __int16 v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = sub_10091B27C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = 134349314;
    v17 = self;
    v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] VK updated active AR walking feature: %@", (uint8_t *)&v16, 0x16u);
  }

  v10 = (VKARWalkingFeature *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "feature"));
  currentFeature = self->_currentFeature;
  self->_currentFeature = v10;

  self->_currentIdentifier = (unint64_t)objc_msgSend(v6, "featureLabelIdentifier");
  objc_msgSend(v6, "labelPosition");
  self->_currentFeaturePosition.latitude = v12;
  self->_currentFeaturePosition.longitude = v13;
  self->_currentFeaturePosition.altitude = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate observers](self, "observers"));
  objc_msgSend(v15, "mapLayer:activeARWalkingFeatureDidUpdate:", v7, v6);

}

- (void)mapLayer:(id)a3 arWalkingElevationRequestFailure:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  PedestrianARVKMapViewMapDelegate *v12;
  __int16 v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = sub_10091B27C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = 134349312;
    v12 = self;
    v13 = 2048;
    v14 = objc_msgSend(v6, "reason");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}p] Detected elevation request failure: %ld", (uint8_t *)&v11, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKMapViewMapDelegate observers](self, "observers"));
  objc_msgSend(v10, "mapLayer:failedElevationRequestWithReason:", v7, objc_msgSend(v6, "reason"));

}

- (VKMapView)mapView
{
  return self->_mapView;
}

- (VKARWalkingFeature)currentFeature
{
  return self->_currentFeature;
}

- (unint64_t)currentIdentifier
{
  return self->_currentIdentifier;
}

- ($1AB5FA073B851C12C2339EC22442E995)currentFeaturePosition
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_currentFeaturePosition.latitude;
  longitude = self->_currentFeaturePosition.longitude;
  altitude = self->_currentFeaturePosition.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (PedestrianARFeatureSetMapEntry)latestFeatureSetMapEntry
{
  return self->_latestFeatureSetMapEntry;
}

- (void)setLatestFeatureSetMapEntry:(id)a3
{
  objc_storeStrong((id *)&self->_latestFeatureSetMapEntry, a3);
}

- (PedestrianARFeatureSetMapEntry)activeFeatureSetMapEntry
{
  return self->_activeFeatureSetMapEntry;
}

- (void)setActiveFeatureSetMapEntry:(id)a3
{
  objc_storeStrong((id *)&self->_activeFeatureSetMapEntry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeFeatureSetMapEntry, 0);
  objc_storeStrong((id *)&self->_latestFeatureSetMapEntry, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentFeature, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
