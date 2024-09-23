@implementation ChromeMapSettings

+ (void)initialize
{
  if ((id)objc_opt_class(ChromeMapSettings, a2) == a1)
    _objc_msgSend(a1, "_registerDefaultsIfNeeded");
}

- (ChromeMapSettings)init
{
  return -[ChromeMapSettings initWithType:userInterfaceIdiom:](self, "initWithType:userInterfaceIdiom:", 0, -1);
}

- (ChromeMapSettings)initWithType:(unint64_t)a3 userInterfaceIdiom:(int64_t)a4
{
  ChromeMapSettings *v6;
  ChromeMapSettings *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ChromeMapSettings;
  v6 = -[ChromeMapSettings init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[ChromeMapSettings setUserInterfaceIdiom:](v6, "setUserInterfaceIdiom:", a4);
    -[ChromeMapSettings setType:](v7, "setType:", a3);
  }
  return v7;
}

- (void)reload
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings _defaultsKeysForType:](self, "_defaultsKeysForType:", self->_type));
  -[ChromeMapSettings _readFromUserDefaultsWithKeys:](self, "_readFromUserDefaultsWithKeys:", v3);

}

- (void)setType:(unint64_t)a3
{
  id v5;
  NSString *v6;
  NSString *name;
  id v8;

  if (self->_type != a3)
  {
    -[ChromeMapSettings _saveIfNeeded](self, "_saveIfNeeded");
    self->_type = a3;
    v5 = objc_msgSend((id)objc_opt_class(self), "_nameForType:", self->_type);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(v5);
    name = self->_name;
    self->_name = v6;

    v8 = (id)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings _defaultsKeysForType:](self, "_defaultsKeysForType:", self->_type));
    -[ChromeMapSettings _readFromUserDefaultsWithKeys:](self, "_readFromUserDefaultsWithKeys:", v8);

  }
}

+ (id)_nameForType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("other");
  if (a3 == 2)
    v3 = CFSTR("navigation-overview");
  if (a3 == 1)
    return CFSTR("browsing");
  else
    return (id)v3;
}

- (id)_defaultsKeysForType:(unint64_t)a3
{
  const __CFString **v4;
  const __CFString **v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  const __CFString *v10;
  const __CFString *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  if ((id)-[ChromeMapSettings userInterfaceIdiom](self, "userInterfaceIdiom") != (id)3)
  {
    if (a3 == 1)
    {
      v8[0] = CFSTR("centerCoordinate.latitude");
      v8[1] = CFSTR("centerCoordinate.longitude");
      v9[0] = CFSTR("map.browse.centerCoordinate.latitude");
      v9[1] = CFSTR("map.browse.centerCoordinate.longitude");
      v8[2] = CFSTR("zoomLevel");
      v8[3] = CFSTR("pitched");
      v9[2] = CFSTR("map.browse.zoomLevel");
      v9[3] = CFSTR("map.browse.pitched");
      v8[4] = CFSTR("trackingMode");
      v9[4] = CFSTR("map.browse.trackingMode");
      v4 = (const __CFString **)v9;
      v5 = (const __CFString **)v8;
      goto LABEL_7;
    }
    return 0;
  }
  if (a3 == 2)
  {
    v10 = CFSTR("zoomLevel");
    v11 = CFSTR("StarkNavigationOverviewZoomLevel");
    v4 = &v11;
    v5 = &v10;
    v6 = 1;
    return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v5, v6));
  }
  if (a3 != 1)
    return 0;
  v12[0] = CFSTR("centerCoordinate.latitude");
  v12[1] = CFSTR("centerCoordinate.longitude");
  v13[0] = CFSTR("StarkMapCenterLatitude");
  v13[1] = CFSTR("StarkMapCenterLongitude");
  v12[2] = CFSTR("zoomLevel");
  v12[3] = CFSTR("pitched");
  v13[2] = CFSTR("StarkMapZoomLevel");
  v13[3] = CFSTR("StarkEnter3DMode");
  v12[4] = CFSTR("trackingMode");
  v13[4] = CFSTR("StarkUserTrackingMode");
  v4 = (const __CFString **)v13;
  v5 = (const __CFString **)v12;
LABEL_7:
  v6 = 5;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v5, v6));
}

- (BOOL)hasCenterCoordinate
{
  double latitude;
  double longitude;
  BOOL v4;

  latitude = self->_centerCoordinate.latitude;
  longitude = self->_centerCoordinate.longitude;
  v4 = longitude >= -180.0;
  if (longitude > 180.0)
    v4 = 0;
  if (latitude < -90.0)
    v4 = 0;
  return latitude <= 90.0 && v4;
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3
{
  if (vabdd_f64(a3.latitude, self->_centerCoordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_centerCoordinate.longitude) >= 0.00000000999999994)
  {
    self->_centerCoordinate = a3;
    -[ChromeMapSettings setNeedsSaving](self, "setNeedsSaving");
  }
}

- (BOOL)hasZoomLevel
{
  return self->_zoomLevel != 0;
}

- (double)zoomLevel
{
  float v2;

  -[NSNumber floatValue](self->_zoomLevel, "floatValue");
  return v2;
}

- (void)setZoomLevel:(double)a3
{
  id v5;
  NSObject *v6;
  ChromeMapSettings *v7;
  ChromeMapSettings *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSNumber *zoomLevel;
  float v16;
  NSNumber *v17;
  NSNumber *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  double v22;

  v5 = sub_100452354();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2048;
    v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] setZoomLevel (%f)", buf, 0x16u);

  }
  zoomLevel = self->_zoomLevel;
  if (!zoomLevel || (-[NSNumber floatValue](zoomLevel, "floatValue"), v16 != a3))
  {
    if (a3 <= 0.0)
      v17 = 0;
    else
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v18 = self->_zoomLevel;
    self->_zoomLevel = v17;

    -[ChromeMapSettings setNeedsSaving](self, "setNeedsSaving");
  }
}

- (BOOL)hasTrackingMode
{
  return self->_trackingMode != 0;
}

- (int64_t)trackingMode
{
  return -[NSNumber integerValue](self->_trackingMode, "integerValue");
}

- (void)setTrackingMode:(int64_t)a3
{
  NSNumber *trackingMode;
  id v6;
  NSObject *v7;
  ChromeMapSettings *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSNumber *v18;
  NSNumber *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  trackingMode = self->_trackingMode;
  if (trackingMode && -[NSNumber integerValue](trackingMode, "integerValue") == a3)
    return;
  v6 = sub_100452354();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_9;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_9:

    v15 = v14;
    if ((unint64_t)a3 >= 3)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown %@"), v17));

    }
    else
    {
      v16 = *(&off_1011B7418 + a3);
    }
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] setTrackingMode (%{public}@)", buf, 0x16u);

  }
  v18 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v19 = self->_trackingMode;
  self->_trackingMode = v18;

  if (a3)
    self->_centerCoordinate = *(CLLocationCoordinate2D *)MKCoordinateInvalid;
  -[ChromeMapSettings setNeedsSaving](self, "setNeedsSaving");
}

- (BOOL)hasPitched
{
  return self->_pitched != 0;
}

- (BOOL)pitched
{
  return -[NSNumber BOOLValue](self->_pitched, "BOOLValue");
}

- (void)setPitched:(BOOL)a3
{
  _BOOL8 v3;
  NSNumber *pitched;
  NSNumber *v6;
  NSNumber *v7;

  v3 = a3;
  pitched = self->_pitched;
  if (!pitched || -[NSNumber BOOLValue](pitched, "BOOLValue") != a3)
  {
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    v7 = self->_pitched;
    self->_pitched = v6;

    -[ChromeMapSettings setNeedsSaving](self, "setNeedsSaving");
  }
}

- (void)setMapView:(id)a3
{
  MKMapView **p_mapView;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_mapView = &self->_mapView;
  WeakRetained = objc_loadWeakRetained((id *)p_mapView);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_mapView, obj);
    v6 = obj;
  }

}

- (void)readFromMapView
{
  void *v3;
  id v4;
  double v5;
  double v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings mapView](self, "mapView"));
  if (v3)
  {
    v7 = v3;
    v4 = objc_msgSend(v3, "userTrackingMode");
    if (v4)
    {
      v5 = MKCoordinateInvalid[0];
      v6 = MKCoordinateInvalid[1];
    }
    else
    {
      objc_msgSend(v7, "centerCoordinate");
    }
    -[ChromeMapSettings setCenterCoordinate:](self, "setCenterCoordinate:", v5, v6);
    -[ChromeMapSettings setTrackingMode:](self, "setTrackingMode:", v4);
    objc_msgSend(v7, "_zoomLevel");
    -[ChromeMapSettings setZoomLevel:](self, "setZoomLevel:");
    -[ChromeMapSettings setPitched:](self, "setPitched:", objc_msgSend(v7, "_isPitched"));
    v3 = v7;
  }

}

- (void)readFromMapSettings:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    if (objc_msgSend(v4, "hasCenterCoordinate"))
    {
      objc_msgSend(v4, "centerCoordinate");
      -[ChromeMapSettings setCenterCoordinate:](self, "setCenterCoordinate:");
    }
    if (objc_msgSend(v4, "hasTrackingMode"))
      -[ChromeMapSettings setTrackingMode:](self, "setTrackingMode:", objc_msgSend(v4, "trackingMode"));
    if (objc_msgSend(v4, "hasZoomLevel"))
    {
      objc_msgSend(v4, "zoomLevel");
      -[ChromeMapSettings setZoomLevel:](self, "setZoomLevel:");
    }
    if (objc_msgSend(v4, "hasPitched"))
      -[ChromeMapSettings setPitched:](self, "setPitched:", objc_msgSend(v4, "pitched"));
  }

}

- (void)applyToMapViewAnimated:(BOOL)a3 duration:(double)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  ChromeMapSettings *v10;
  ChromeMapSettings *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  dispatch_queue_global_t global_queue;
  NSObject *v24;
  NSMutableDictionary *applicationsByRunIndex;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  NSObject *v31;
  ChromeMapSettings *v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  char v47;
  void *v48;
  unsigned __int8 v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  unsigned int v57;
  id v58;
  NSObject *v59;
  ChromeMapSettings *v60;
  objc_class *v61;
  NSString *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __CFString *v68;
  void *v69;
  id v70;
  NSObject *v71;
  ChromeMapSettings *v72;
  objc_class *v73;
  NSString *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  id v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  __n128 v92;
  __n128 v93;
  __n128 v94;
  __n128 v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  id v103;
  void *v104;
  double v105;
  void *v106;
  id v107;
  NSObject *v108;
  void *v109;
  double v110;
  double v111;
  void *v112;
  unsigned int v113;
  id v114;
  NSObject *v115;
  ChromeMapSettings *v116;
  objc_class *v117;
  NSString *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  NSObject *v124;
  ChromeMapSettings *v125;
  objc_class *v126;
  NSString *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  NSString *v132;
  void *v133;
  ChromeMapSettingsApplication *v134;
  unint64_t runningApplicationCount;
  NSMutableDictionary *v136;
  unint64_t v137;
  NSMutableDictionary *v138;
  NSMutableDictionary *v139;
  void *v140;
  id v141;
  NSObject *v142;
  ChromeMapSettings *v143;
  objc_class *v144;
  NSString *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  __CFString *v150;
  __CFString *v151;
  __CFString *v152;
  __CFString *v153;
  void *v154;
  char v155;
  void *v156;
  id v157;
  _QWORD *v158;
  _QWORD *v159;
  void *v160;
  ChromeMapSettingsApplication *v161;
  unsigned __int8 v162;
  __CFString *v163;
  id v164;
  id v166;
  _BOOL4 v167;
  id v168;
  void *v169;
  void (**v170)(id, _QWORD);
  _QWORD v171[5];
  id v172;
  id v173[3];
  BOOL v174;
  unsigned __int8 v175;
  _QWORD v176[5];
  id v177;
  NSObject *v178;
  __CFString *v179;
  id location;
  __int128 v181;
  uint64_t v182;
  __int128 v183;
  uint64_t v184;
  _QWORD block[5];
  id v186;
  id v187;
  uint8_t buf[24];
  __CFString *v189;
  __int16 v190;
  double v191;
  __int16 v192;
  __CFString *v193;
  CGRect v194;

  v167 = a3;
  v170 = (void (**)(id, _QWORD))a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  v8 = sub_100452354();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    goto LABEL_17;
  v10 = self;
  v11 = v10;
  if (!v10)
  {
    v17 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v12 = (objc_class *)objc_opt_class(v10);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
    v16 = v15;
    if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
    {
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

      goto LABEL_8;
    }

  }
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_8:

LABEL_10:
  if (v167)
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  v19 = v18;
  if (v170)
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  v21 = v20;
  *(_DWORD *)buf = 138544386;
  *(_QWORD *)&buf[4] = v17;
  *(_WORD *)&buf[12] = 2114;
  *(_QWORD *)&buf[14] = v7;
  *(_WORD *)&buf[22] = 2114;
  v189 = v19;
  v190 = 2048;
  v191 = a4;
  v192 = 2114;
  v193 = v21;
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] applyToMapViewAnimated:duration:completion: %{public}@ (animated:%{public}@, duration:%#.2lfs, completion:%{public}@)", buf, 0x34u);

LABEL_17:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
  global_queue = dispatch_get_global_queue(-2, 0);
  v24 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100453AC0;
  block[3] = &unk_1011AD238;
  block[4] = self;
  v168 = v7;
  v186 = v168;
  v166 = v22;
  v187 = v166;
  dispatch_async(v24, block);

  v169 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings dictionaryRepresentation](self, "dictionaryRepresentation"));
  applicationsByRunIndex = self->_applicationsByRunIndex;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_runningApplicationCount));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](applicationsByRunIndex, "objectForKeyedSubscript:", v26));

  if (!v27
    || (v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "settingsDictionary")),
        v29 = objc_msgSend(v28, "isEqualToDictionary:", v169),
        v28,
        !v29))
  {
    v39 = objc_claimAutoreleasedReturnValue(-[ChromeMapSettings mapView](self, "mapView"));
    v31 = v39;
    if (!v39)
      goto LABEL_138;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject window](v39, "window"));
    if (v40)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject window](v31, "window"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "windowScene"));
      if (objc_msgSend(v42, "activationState") == (id)2)
      {

      }
      else
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject window](v31, "window"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "windowScene"));
        v45 = objc_msgSend(v44, "activationState") == (id)-1;

        if (!v45)
          goto LABEL_32;
      }
    }
    v167 = 0;
LABEL_32:
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings delegate](self, "delegate"));
    v47 = objc_opt_respondsToSelector(v46, "mapSettings:shouldApplyAnimated:");

    if ((v47 & 1) == 0)
      goto LABEL_35;
    LOBYTE(location) = v167;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings delegate](self, "delegate"));
    v49 = objc_msgSend(v48, "mapSettings:shouldApplyAnimated:", self, &location);

    if ((v49 & 1) != 0)
    {
      v167 = (_BYTE)location != 0;
LABEL_35:
      v162 = -[ChromeMapSettings pitched](self, "pitched");
      v164 = -[ChromeMapSettings trackingMode](self, "trackingMode");
      -[ChromeMapSettings zoomLevel](self, "zoomLevel");
      if (v50 <= 0.0)
        v51 = 15.0;
      else
        v51 = v50;
      -[ChromeMapSettings centerCoordinate](self, "centerCoordinate");
      v53 = v52;
      v55 = v54;
      if (v164)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
        v57 = objc_msgSend(v56, "isAuthorizedForPreciseLocation");

        if (v57)
        {
          memset(buf, 0, sizeof(buf));
          -[NSObject _userTrackingBehavior](v31, "_userTrackingBehavior");
          buf[0] = 0;
          v184 = *(_QWORD *)&buf[16];
          v183 = *(_OWORD *)buf;
          -[NSObject _setUserTrackingBehavior:](v31, "_setUserTrackingBehavior:", &v183);
        }
        else
        {
          v181 = *(_OWORD *)VKAnnotationTrackingBehaviorDefault;
          v182 = VKAnnotationTrackingBehaviorDefault[2];
          -[NSObject _setUserTrackingBehavior:](v31, "_setUserTrackingBehavior:", &v181);
        }
      }
      else if (-[NSObject userTrackingMode](v31, "userTrackingMode"))
      {
        -[NSObject setUserTrackingMode:animated:](v31, "setUserTrackingMode:animated:", 0, 0);
      }
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userLocation](v31, "userLocation"));
      v68 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "location"));
      if (v68)
      {

      }
      else
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
        v68 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "lastLocation"));

        if (!v68)
          goto LABEL_65;
      }
      if (v164 || v55 < -180.0 || v55 > 180.0 || v53 < -90.0 || v53 > 90.0)
      {
        v70 = sub_100452354();
        v71 = objc_claimAutoreleasedReturnValue(v70);
        if (!os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
LABEL_64:

          -[__CFString coordinate](v68, "coordinate");
          v53 = v79;
          v55 = v80;
          goto LABEL_65;
        }
        v72 = self;
        v73 = (objc_class *)objc_opt_class(v72);
        v74 = NSStringFromClass(v73);
        v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
        if ((objc_opt_respondsToSelector(v72, "accessibilityIdentifier") & 1) != 0)
        {
          v76 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v72, "performSelector:", "accessibilityIdentifier"));
          v77 = v76;
          if (v76 && !objc_msgSend(v76, "isEqualToString:", v75))
          {
            v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v75, v72, v77));

            goto LABEL_63;
          }

        }
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v75, v72));
LABEL_63:

        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v78;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v168;
        *(_WORD *)&buf[22] = 2112;
        v189 = v68;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "[%{public}@] Will try to use centerCoordinate from userLocation: %{public}@ %@", buf, 0x20u);

        goto LABEL_64;
      }
LABEL_65:
      if (v55 < -180.0 || v55 > 180.0 || v53 < -90.0 || v53 > 90.0)
      {
        v107 = sub_100452354();
        v108 = objc_claimAutoreleasedReturnValue(v107);
        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v168;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v68;
          _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "Will not apply %{public}@ due to invalid center  coordinate, userLocation: %@", buf, 0x16u);
        }

        if (v170)
          v170[2](v170, 0);
        goto LABEL_137;
      }
      -[NSObject bounds](v31, "bounds");
      v82 = v81;
      v84 = v83;
      v85 = -[NSObject _edgeInsets](v31, "_edgeInsets");
      v88 = v82 - (v86 + v87);
      v91 = v84 - (v89 + v90);
      v92.n128_f64[0] = MKCoordinateRegionMakeWithZoomLevel(v85, v53, v55, v51, v88, v91);
      v99 = MKMapRectForCoordinateRegion(v92, v93, v94, v95);
      v100 = v96;
      v101 = v97;
      v102 = v98;
      if (a4 < 0.0)
      {
        v103 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v99, v96, v97, v98);
        a4 = 0.0;
        if (v167)
        {
          v104 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _mapLayer](v31, "_mapLayer"));
          objc_msgSend(v104, "durationToAnimateToMapRegion:", v103);
          a4 = v105;

        }
      }
      v163 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v99, v100, v101, v102, v88, v91));
      if ((v162 & 1) != 0)
      {
        if (-[NSObject _isPitched](v31, "_isPitched"))
        {
          v106 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject camera](v31, "camera"));
          objc_msgSend(v106, "pitch");
          -[__CFString setPitch:](v163, "setPitch:");

        }
      }
      else
      {
        -[__CFString setPitch:](v163, "setPitch:", 0.0);
      }
      if (v164 == (id)2)
      {
        if (-[NSObject userTrackingMode](v31, "userTrackingMode") == (id)2)
        {
          v109 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject camera](v31, "camera"));
          objc_msgSend(v109, "heading");
          -[__CFString setHeading:](v163, "setHeading:");

        }
      }
      else
      {
        -[__CFString setHeading:](v163, "setHeading:", 0.0);
      }
      -[__CFString centerCoordinate](v163, "centerCoordinate");
      if (v111 >= -180.0 && v111 <= 180.0 && v110 >= -90.0 && v110 <= 90.0)
      {
        if (v164 == -[NSObject userTrackingMode](v31, "userTrackingMode"))
        {
          v112 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject camera](v31, "camera"));
          v113 = -[ChromeMapSettings _isCamera:equalToCamera:](self, "_isCamera:equalToCamera:", v163, v112);

          if (v113)
          {
            v114 = sub_100452354();
            v115 = objc_claimAutoreleasedReturnValue(v114);
            if (!os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
              goto LABEL_103;
            v116 = self;
            v117 = (objc_class *)objc_opt_class(v116);
            v118 = NSStringFromClass(v117);
            v119 = (void *)objc_claimAutoreleasedReturnValue(v118);
            if ((objc_opt_respondsToSelector(v116, "accessibilityIdentifier") & 1) != 0)
            {
              v120 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v116, "performSelector:", "accessibilityIdentifier"));
              v121 = v120;
              if (v120 && !objc_msgSend(v120, "isEqualToString:", v119))
              {
                v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v119, v116, v121));

                goto LABEL_102;
              }

            }
            v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v119, v116));
LABEL_102:

            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v122;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v168;
            _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_INFO, "[%{public}@] Will not apply %{public}@ because the map is already correctly framed", buf, 0x16u);

LABEL_103:
            if (v170)
              v170[2](v170, 1);
LABEL_136:

LABEL_137:
            goto LABEL_138;
          }
        }
        ++self->_runningApplicationCount;
        objc_initWeak(&location, self);
        v134 = -[ChromeMapSettingsApplication initWithSettingsDictionary:]([ChromeMapSettingsApplication alloc], "initWithSettingsDictionary:", v169);
        -[ChromeMapSettingsApplication addCompletionHandler:](v134, "addCompletionHandler:", v170);
        v161 = v134;
        runningApplicationCount = self->_runningApplicationCount;
        v136 = self->_applicationsByRunIndex;
        if (!v136)
        {
          v137 = self->_runningApplicationCount;
          v138 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v139 = self->_applicationsByRunIndex;
          self->_applicationsByRunIndex = v138;

          v136 = self->_applicationsByRunIndex;
          runningApplicationCount = v137;
        }
        v160 = (void *)runningApplicationCount;
        v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v136, "setObject:forKeyedSubscript:", v161, v140);

        v141 = sub_100452354();
        v142 = objc_claimAutoreleasedReturnValue(v141);
        if (!os_log_type_enabled(v142, OS_LOG_TYPE_INFO))
        {
LABEL_129:

          v154 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings delegate](self, "delegate"));
          v155 = objc_opt_respondsToSelector(v154, "mapSettings:willApplyAnimated:");

          if ((v155 & 1) != 0)
          {
            v156 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings delegate](self, "delegate"));
            objc_msgSend(v156, "mapSettings:willApplyAnimated:", self, v167);

          }
          v176[0] = _NSConcreteStackBlock;
          v176[1] = 3221225472;
          v176[2] = sub_100453C58;
          v176[3] = &unk_1011AF1B0;
          v176[4] = self;
          v157 = v168;
          v177 = v157;
          v178 = v31;
          v179 = v163;
          v158 = objc_retainBlock(v176);
          v171[0] = _NSConcreteStackBlock;
          v171[1] = 3221225472;
          v171[2] = sub_100453DEC;
          v171[3] = &unk_1011B7390;
          objc_copyWeak(v173, &location);
          v174 = v167;
          v175 = v162;
          v173[1] = v160;
          v173[2] = v164;
          v171[4] = self;
          v172 = v157;
          v159 = objc_retainBlock(v171);
          if (v167)
          {
            +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v158, v159, a4);
          }
          else
          {
            ((void (*)(_QWORD *))v158[2])(v158);
            ((void (*)(_QWORD *, uint64_t))v159[2])(v159, 1);
          }

          objc_destroyWeak(v173);
          objc_destroyWeak(&location);
          goto LABEL_136;
        }
        v143 = self;
        v144 = (objc_class *)objc_opt_class(v143);
        v145 = NSStringFromClass(v144);
        v146 = (void *)objc_claimAutoreleasedReturnValue(v145);
        if ((objc_opt_respondsToSelector(v143, "accessibilityIdentifier") & 1) != 0)
        {
          v147 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v143, "performSelector:", "accessibilityIdentifier"));
          v148 = v147;
          if (v147 && (objc_msgSend(v147, "isEqualToString:", v146) & 1) == 0)
          {
            v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v146, v143, v148));

            goto LABEL_122;
          }

        }
        v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v146, v143));
LABEL_122:

        if (v167)
          v150 = CFSTR("YES");
        else
          v150 = CFSTR("NO");
        v151 = v150;
        if (v170)
          v152 = CFSTR("YES");
        else
          v152 = CFSTR("NO");
        v153 = v152;
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v149;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v168;
        *(_WORD *)&buf[22] = 2112;
        v189 = v151;
        v190 = 2048;
        v191 = a4;
        v192 = 2112;
        v193 = v153;
        _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_INFO, "[%{public}@] Will apply %{public}@ (animated:%@, duration:%#.2lfs, completion:%@)", buf, 0x34u);

        goto LABEL_129;
      }
      v123 = sub_100452354();
      v124 = objc_claimAutoreleasedReturnValue(v123);
      if (!os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
      {
LABEL_112:

        if (v170)
          v170[2](v170, 0);
        goto LABEL_136;
      }
      v125 = self;
      v126 = (objc_class *)objc_opt_class(v125);
      v127 = NSStringFromClass(v126);
      v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
      if ((objc_opt_respondsToSelector(v125, "accessibilityIdentifier") & 1) != 0)
      {
        v129 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v125, "performSelector:", "accessibilityIdentifier"));
        v130 = v129;
        if (v129 && !objc_msgSend(v129, "isEqualToString:", v128))
        {
          v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v128, v125, v130));

          goto LABEL_111;
        }

      }
      v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v128, v125));
LABEL_111:

      -[NSObject bounds](v31, "bounds");
      v132 = NSStringFromCGRect(v194);
      v133 = (void *)objc_claimAutoreleasedReturnValue(v132);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v131;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v168;
      *(_WORD *)&buf[22] = 2112;
      v189 = v163;
      v190 = 2112;
      v191 = *(double *)&v133;
      _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_ERROR, "[%{public}@] Will not apply %{public}@ due to invalid center coordinate on the camera. Camera is %@ and map view bounds is %@", buf, 0x2Au);

      goto LABEL_112;
    }
    v58 = sub_100452354();
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (!os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
LABEL_50:

      if (v170)
        v170[2](v170, 0);
      goto LABEL_138;
    }
    v60 = self;
    v61 = (objc_class *)objc_opt_class(v60);
    v62 = NSStringFromClass(v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    if ((objc_opt_respondsToSelector(v60, "accessibilityIdentifier") & 1) != 0)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v60, "performSelector:", "accessibilityIdentifier"));
      v65 = v64;
      if (v64 && !objc_msgSend(v64, "isEqualToString:", v63))
      {
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v63, v60, v65));

        goto LABEL_49;
      }

    }
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v63, v60));
LABEL_49:

    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v66;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v168;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "[%{public}@] Will not apply, not permitted by delegate %{public}@", buf, 0x16u);

    goto LABEL_50;
  }
  objc_msgSend(v27, "addCompletionHandler:", v170);
  v30 = sub_100452354();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = self;
    v33 = (objc_class *)objc_opt_class(v32);
    v34 = NSStringFromClass(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    if ((objc_opt_respondsToSelector(v32, "accessibilityIdentifier") & 1) != 0)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v32, "performSelector:", "accessibilityIdentifier"));
      v37 = v36;
      if (v36 && !objc_msgSend(v36, "isEqualToString:", v35))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v35, v32, v37));

        goto LABEL_25;
      }

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v35, v32));
LABEL_25:

    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v168;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[%{public}@] piggy-backing on an in-flight application %{public}@", buf, 0x16u);

  }
LABEL_138:

}

- (BOOL)_isCamera:(id)a3 equalToCamera:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "centerCoordinate");
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(v6, "centerCoordinate");
  if (CLCoordinateEqualToCoordinateEpsilon(v11, v8, v10, v12, v13, 0.000000999999997)
    && (objc_msgSend(v5, "heading"), v15 = v14, objc_msgSend(v6, "heading"), v15 == v16)
    && (objc_msgSend(v5, "pitch"), v18 = v17, objc_msgSend(v6, "pitch"), v18 == v19))
  {
    objc_msgSend(v5, "altitude");
    v21 = v20;
    objc_msgSend(v6, "altitude");
    v23 = v21 == v22;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (void)_registerDefaultsIfNeeded
{
  if (qword_1014D2578 != -1)
    dispatch_once(&qword_1014D2578, &stru_1011B73B0);
}

- (void)clear
{
  id v3;
  NSObject *v4;
  ChromeMapSettings *v5;
  ChromeMapSettings *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSNumber *trackingMode;
  NSNumber *zoomLevel;
  NSNumber *pitched;
  uint8_t buf[4];
  __CFString *v17;

  v3 = sub_100452354();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Resetting to original default values", buf, 0xCu);

  }
  self->_centerCoordinate = *(CLLocationCoordinate2D *)MKCoordinateInvalid;
  trackingMode = self->_trackingMode;
  self->_trackingMode = 0;

  zoomLevel = self->_zoomLevel;
  self->_zoomLevel = 0;

  pitched = self->_pitched;
  self->_pitched = 0;

  -[ChromeMapSettings save](self, "save");
  -[ChromeMapSettings reload](self, "reload");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ChromeMapSettings;
  v3 = -[ChromeMapSettings description](&v13, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[ChromeMapSettings type](self, "type")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&self->_centerCoordinate.latitude, *(_QWORD *)&self->_centerCoordinate.longitude));
  v8 = -[NSNumber integerValue](self->_trackingMode, "integerValue");
  if (v8 >= 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown %@"), v10));

  }
  else
  {
    v9 = *(&off_1011B7418 + v8);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <name:%@, type:%@, centerCoordinate:%@, trackingMode:%@, zoomLevel:%@, pitched:%@>"), v4, v5, v6, v7, v9, self->_zoomLevel, self->_pitched));

  return v11;
}

- (void)setNeedsSaving
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12[2];
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings saveTimer](self, "saveTimer"));
  objc_msgSend(v3, "invalidate");

  -[ChromeMapSettings setSaveTimer:](self, "setSaveTimer:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings _defaultsKeysForType:](self, "_defaultsKeysForType:", -[ChromeMapSettings type](self, "type")));
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[ChromeMapSettings type](self, "type");
    objc_initWeak(&location, self);
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = sub_100454934;
    v10 = &unk_1011B73D8;
    objc_copyWeak(v12, &location);
    v12[1] = v5;
    v11 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v7, 1.0));
    -[ChromeMapSettings setSaveTimer:](self, "setSaveTimer:", v6, v7, v8, v9, v10);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

}

- (void)save
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings saveTimer](self, "saveTimer"));
  objc_msgSend(v3, "invalidate");

  -[ChromeMapSettings setSaveTimer:](self, "setSaveTimer:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings _defaultsKeysForType:](self, "_defaultsKeysForType:", -[ChromeMapSettings type](self, "type")));
  if (objc_msgSend(v4, "count"))
    -[ChromeMapSettings _writeToUserDefaultsWithKeys:](self, "_writeToUserDefaultsWithKeys:", v4);

}

- (void)_saveIfNeeded
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings saveTimer](self, "saveTimer"));

  if (v3)
    -[ChromeMapSettings save](self, "save");
}

- (void)_readFromUserDefaultsWithKeys:(id)a3
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
  CLLocationCoordinate2D *p_centerCoordinate;
  double v15;
  CLLocationDegrees v16;
  CLLocationDegrees v17;
  NSNumber *zoomLevel;
  NSNumber *v19;
  NSNumber *v20;
  NSNumber *trackingMode;
  id *p_trackingMode;
  id v23;
  NSNumber *v24;
  NSNumber *pitched;
  id v26;
  NSObject *v27;
  ChromeMapSettings *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings saveTimer](self, "saveTimer"));
  objc_msgSend(v5, "invalidate");

  -[ChromeMapSettings setSaveTimer:](self, "setSaveTimer:", 0);
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("centerCoordinate.latitude")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("centerCoordinate.longitude")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zoomLevel")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackingMode")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pitched")));
    if (v7)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));

      if (v8)
      {
LABEL_4:
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v8));
        p_centerCoordinate = &self->_centerCoordinate;
        v40 = (void *)v13;
        if (v12 && v13)
        {
          objc_msgSend(v6, "doubleForKey:", v7);
          v16 = v15;
          objc_msgSend(v6, "doubleForKey:", v8);
          self->_centerCoordinate.latitude = v16;
          self->_centerCoordinate.longitude = v17;
          if (!v9)
          {
LABEL_7:
            zoomLevel = self->_zoomLevel;
            self->_zoomLevel = 0;
            goto LABEL_12;
          }
LABEL_11:
          v19 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v9));
          zoomLevel = self->_zoomLevel;
          self->_zoomLevel = v19;
LABEL_12:

          if (v10)
          {
            v20 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v10));
            p_trackingMode = (id *)&self->_trackingMode;
            trackingMode = self->_trackingMode;
            self->_trackingMode = v20;
          }
          else
          {
            p_trackingMode = (id *)&self->_trackingMode;
            trackingMode = self->_trackingMode;
            self->_trackingMode = 0;
          }

          if (objc_msgSend(*p_trackingMode, "isEqual:", &off_10126D4B0))
          {
            v23 = *p_trackingMode;
            *p_trackingMode = &off_10126D480;

          }
          if (v11)
          {
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v11));
            pitched = self->_pitched;
            self->_pitched = v24;
          }
          else
          {
            pitched = self->_pitched;
            self->_pitched = 0;
          }

          v26 = sub_100452354();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            goto LABEL_27;
          v38 = v11;
          v28 = self;
          v29 = (objc_class *)objc_opt_class(v28);
          v30 = NSStringFromClass(v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          v39 = v10;
          if ((objc_opt_respondsToSelector(v28, "accessibilityIdentifier") & 1) != 0)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v28, "performSelector:", "accessibilityIdentifier"));
            v33 = v32;
            if (v32 && !objc_msgSend(v32, "isEqualToString:", v31))
            {
              v34 = v8;
              v35 = v9;
              v36 = v7;
              v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v31, v28, v33));

              goto LABEL_26;
            }

          }
          v34 = v8;
          v35 = v9;
          v36 = v7;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v31, v28));
LABEL_26:

          *(_DWORD *)buf = 138543362;
          v42 = v37;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}@] Read from defaults", buf, 0xCu);

          v7 = v36;
          v9 = v35;
          v8 = v34;
          v11 = v38;
          v10 = v39;
LABEL_27:

          goto LABEL_28;
        }
LABEL_10:
        *p_centerCoordinate = *(CLLocationCoordinate2D *)MKCoordinateInvalid;
        if (!v9)
          goto LABEL_7;
        goto LABEL_11;
      }
    }
    else
    {
      v12 = 0;
      if (v8)
        goto LABEL_4;
    }
    v40 = 0;
    p_centerCoordinate = &self->_centerCoordinate;
    goto LABEL_10;
  }
LABEL_28:

}

- (void)_writeToUserDefaultsWithKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  ChromeMapSettings *v8;
  ChromeMapSettings *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double longitude;
  double latitude;
  void *v25;
  NSNumber *trackingMode;
  uint8_t buf[4];
  __CFString *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings saveTimer](self, "saveTimer"));
  objc_msgSend(v5, "invalidate");

  -[ChromeMapSettings setSaveTimer:](self, "setSaveTimer:", 0);
  if (!objc_msgSend(v4, "count"))
    goto LABEL_32;
  v6 = sub_100452354();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSettings performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_9;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Saving to defaults", buf, 0xCu);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("centerCoordinate.latitude")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("centerCoordinate.longitude")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zoomLevel")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackingMode")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pitched")));
  if (v17 && v18)
  {
    v22 = 0;
    longitude = self->_centerCoordinate.longitude;
    if (longitude < -180.0 || longitude > 180.0 || (latitude = self->_centerCoordinate.latitude, latitude < -90.0))
    {
      v25 = 0;
    }
    else
    {
      v25 = 0;
      if (latitude <= 90.0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_centerCoordinate.longitude));
      }
    }
    objc_msgSend(v16, "setObject:forKey:", v22, v17);
    objc_msgSend(v16, "setObject:forKey:", v25, v18);

  }
  if (v19)
    objc_msgSend(v16, "setObject:forKey:", self->_zoomLevel, v19);
  if (v20)
  {
    if ((id)-[ChromeMapSettings userInterfaceIdiom](self, "userInterfaceIdiom") == (id)3
      && (-[NSNumber isEqual:](self->_trackingMode, "isEqual:", &off_10126D4B0) & 1) != 0)
    {
      trackingMode = (NSNumber *)&off_10126D480;
    }
    else
    {
      trackingMode = self->_trackingMode;
    }
    objc_msgSend(v16, "setObject:forKey:", trackingMode, v20);
  }
  if (v21)
    objc_msgSend(v16, "setObject:forKey:", self->_pitched, v21);

LABEL_32:
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (-[ChromeMapSettings hasCenterCoordinate](self, "hasCenterCoordinate"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&self->_centerCoordinate.latitude, *(_QWORD *)&self->_centerCoordinate.longitude));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("centerCoordinate"));

  }
  if (-[ChromeMapSettings hasPitched](self, "hasPitched"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_pitched, CFSTR("pitched"));
  if (-[ChromeMapSettings hasTrackingMode](self, "hasTrackingMode"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_trackingMode, CFSTR("trackingMode"));
  if (-[ChromeMapSettings hasZoomLevel](self, "hasZoomLevel"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_zoomLevel, CFSTR("zoomLevel"));
  v5 = objc_msgSend(v3, "copy");

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (ChromeMapSettingsDelegate)delegate
{
  return (ChromeMapSettingsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CLLocationCoordinate2D)centerCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_centerCoordinate.latitude;
  longitude = self->_centerCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  self->_userInterfaceIdiom = a3;
}

- (NSTimer)saveTimer
{
  return self->_saveTimer;
}

- (void)setSaveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_saveTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_applicationsByRunIndex, 0);
  objc_storeStrong((id *)&self->_pitched, 0);
  objc_storeStrong((id *)&self->_trackingMode, 0);
  objc_storeStrong((id *)&self->_zoomLevel, 0);
}

@end
