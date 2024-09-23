@implementation ChromeNavigationDisplayRateThrottle

+ (void)initialize
{
  void *v3;
  id v4;

  if ((id)objc_opt_class(ChromeNavigationDisplayRateThrottle) == a1)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_defaultSettings"));
    objc_msgSend(v4, "registerDefaults:", v3);

  }
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_ChromeNavigationDisplayRateAllowThrottling, off_1014B2F28);
}

+ (id)_defaultSettings
{
  return &off_1012744D0;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  id v5;
  objc_super v6;

  self->_enabled = 0;
  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimer);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)&self->_idleTimer, 0);
  v5 = objc_loadWeakRetained((id *)&self->_temporaryDisplayRateTimer);
  objc_msgSend(v5, "invalidate");

  objc_storeWeak((id *)&self->_temporaryDisplayRateTimer, 0);
  v6.receiver = self;
  v6.super_class = (Class)ChromeNavigationDisplayRateThrottle;
  -[ChromeNavigationDisplayRateThrottle dealloc](&v6, "dealloc");
}

- (ChromeNavigationDisplayRateThrottle)init
{
  ChromeNavigationDisplayRateThrottle *v2;
  ChromeNavigationDisplayRateThrottle *v3;
  ChromeNavigationDisplayRateThrottle *v4;
  ChromeNavigationDisplayRateThrottle *v5;
  objc_super v7;

  v2 = self;
  if (objc_msgSend((id)objc_opt_class(self), "isAvailable"))
  {
    v7.receiver = v2;
    v7.super_class = (Class)ChromeNavigationDisplayRateThrottle;
    v3 = -[ChromeNavigationDisplayRateThrottle init](&v7, "init");
    v4 = v3;
    if (v3)
      -[ChromeNavigationDisplayRateThrottle _readFromDefaults](v3, "_readFromDefaults");
    v2 = v4;
    v5 = v2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setEnabled:(BOOL)a3
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  MNLocation *latestMovingLocation;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  ChromeNavigationDisplayRateThrottle *v13;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    v5 = sub_1003675C4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a3)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Enabling throttle: %@", buf, 0xCu);
      }

      if (self->_settings.throttleWhenIdle)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
        objc_msgSend(v8, "registerObserver:", self);

        -[ChromeNavigationDisplayRateThrottle _waitForNoMovement](self, "_waitForNoMovement");
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Disabling throttle", buf, 2u);
      }

      latestMovingLocation = self->_latestMovingLocation;
      self->_latestMovingLocation = 0;

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      objc_msgSend(v10, "unregisterObserver:", self);

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100367604;
      v11[3] = &unk_1011AC860;
      v11[4] = self;
      -[ChromeNavigationDisplayRateThrottle _notifyAfterChanges:](self, "_notifyAfterChanges:", v11);
    }
  }
}

- (void)setIdle:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _DWORD v7[2];

  if (self->_idle != a3)
  {
    v3 = a3;
    self->_idle = a3;
    v5 = sub_1003675C4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting idle: %d", (uint8_t *)v7, 8u);
    }

    -[ChromeNavigationDisplayRateThrottle _notifyDelegateOfDisplayRate:](self, "_notifyDelegateOfDisplayRate:", -[ChromeNavigationDisplayRateThrottle calculateThrottledDisplayRate](self, "calculateThrottledDisplayRate"));
  }
}

- (void)setSettings:(id *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  *(_OWORD *)&self->_settings.type = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  v5 = *(_OWORD *)&a3->var4;
  v6 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_settings.maxMapSpan = *(_OWORD *)&a3->var8;
  *(_OWORD *)&self->_settings.maxZoomLevel = v6;
  *(_OWORD *)&self->_settings.maximumRate = v5;
  *(_OWORD *)&self->_settings.constantRate = v4;
  v7 = *(_OWORD *)&a3->var10;
  v8 = *(_OWORD *)&a3->var12;
  v9 = *(_OWORD *)&a3->var14;
  *(_QWORD *)&self->_settings.ignoreCameraStyle = *(_QWORD *)&a3->var16;
  *(_OWORD *)&self->_settings.idleTimeThreshold = v9;
  *(_OWORD *)&self->_settings.idleDisplayRate = v8;
  *(_OWORD *)&self->_settings.temporaryDisplayRateDuration = v7;
  if (-[ChromeNavigationDisplayRateThrottle isEnabled](self, "isEnabled"))
    -[ChromeNavigationDisplayRateThrottle _notifyDelegateOfDisplayRate:](self, "_notifyDelegateOfDisplayRate:", -[ChromeNavigationDisplayRateThrottle calculateThrottledDisplayRate](self, "calculateThrottledDisplayRate"));
}

- (int64_t)calculateThrottledDisplayRate
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  int64_t temporaryDisplayRate;
  uint64_t idleDisplayRate;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  unint64_t type;
  id v14;
  NSObject *v15;
  const char *v16;
  unint64_t mapSpanSubtype;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double minZoomLevel;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double maxZoomLevel;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  int64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  MKMapPoint v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  CLLocationDegrees v60;
  CLLocationDegrees v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  int64_t v72;
  id v73;
  uint8_t v75[24];
  CLLocationCoordinate2D v76;
  CLLocationCoordinate2D v77;
  MKMapPoint v78;

  v3 = sub_1003675C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v75 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Calculating throttled display rate", v75, 2u);
  }

  if (-[ChromeNavigationDisplayRateThrottle isEnabled](self, "isEnabled"))
  {
    if (self->_temporaryDisplayRate >= 1)
    {
      -[ChromeNavigationDisplayRateThrottle _rememberNewDisplayRate:reason:](self, "_rememberNewDisplayRate:reason:");
      v5 = sub_1003675C4();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        temporaryDisplayRate = self->_temporaryDisplayRate;
        *(_DWORD *)v75 = 134217984;
        *(_QWORD *)&v75[4] = temporaryDisplayRate;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Returning temporary display rate %ld", v75, 0xCu);
      }

      return self->_temporaryDisplayRate;
    }
    if (-[ChromeNavigationDisplayRateThrottle isIdle](self, "isIdle") && self->_settings.throttleWhenIdle)
    {
      idleDisplayRate = self->_settings.idleDisplayRate;
      if (idleDisplayRate <= 0)
        idleDisplayRate = self->_settings.minimumRate;
      -[ChromeNavigationDisplayRateThrottle _rememberNewDisplayRate:reason:](self, "_rememberNewDisplayRate:reason:", idleDisplayRate, CFSTR("idle"));
      v11 = sub_1003675C4();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v75 = 134217984;
        *(_QWORD *)&v75[4] = idleDisplayRate;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Returning idle display rate %ld", v75, 0xCu);
      }

      return idleDisplayRate;
    }
    type = self->_settings.type;
    if (type != 3)
    {
      if (type != 2)
      {
        if (type == 1)
        {
          idleDisplayRate = self->_settings.constantRate;
          v14 = sub_1003675C4();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
LABEL_60:

            goto LABEL_61;
          }
          *(_DWORD *)v75 = 134217984;
          *(_QWORD *)&v75[4] = idleDisplayRate;
          v16 = "Returning constant display rate %ld";
LABEL_59:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v16, v75, 0xCu);
          goto LABEL_60;
        }
        idleDisplayRate = 0;
LABEL_61:
        -[ChromeNavigationDisplayRateThrottle _rememberNewDisplayRate:reason:](self, "_rememberNewDisplayRate:reason:", idleDisplayRate, CFSTR("calculated"), *(_OWORD *)v75);
        return idleDisplayRate;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayRateThrottle mapView](self, "mapView"));
      objc_msgSend(v32, "_minimumZoomLevel");
      v34 = v33;

      minZoomLevel = self->_settings.minZoomLevel;
      if (v34 <= minZoomLevel)
        v36 = self->_settings.minZoomLevel;
      else
        v36 = v34;
      if (minZoomLevel <= 0.0)
        v37 = v34;
      else
        v37 = v36;
      v38 = ceil(v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayRateThrottle mapView](self, "mapView"));
      objc_msgSend(v39, "_maximumZoomLevel");
      v41 = v40;

      maxZoomLevel = self->_settings.maxZoomLevel;
      if (v41 >= maxZoomLevel)
        v43 = self->_settings.maxZoomLevel;
      else
        v43 = v41;
      if (maxZoomLevel <= 0.0)
        v44 = v41;
      else
        v44 = v43;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayRateThrottle mapView](self, "mapView"));
      objc_msgSend(v45, "_zoomLevel");
      v47 = ceil(v46);

      if (v47 > v38)
      {
        if (v47 < ceil(v44))
        {
          -[ChromeNavigationDisplayRateThrottle _scaleFactorWithValue:maximumValue:minimumValue:](self, "_scaleFactorWithValue:maximumValue:minimumValue:", v47);
          v49 = vcvtpd_s64_f64(v48 * (double)self->_settings.maximumRate);
          if (self->_settings.minimumRate <= v49)
            idleDisplayRate = v49;
          else
            idleDisplayRate = self->_settings.minimumRate;
          v50 = sub_1003675C4();
          v15 = objc_claimAutoreleasedReturnValue(v50);
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            goto LABEL_60;
          *(_DWORD *)v75 = 134217984;
          *(_QWORD *)&v75[4] = idleDisplayRate;
          v16 = "Returning zoom level display rate %ld";
          goto LABEL_59;
        }
        goto LABEL_53;
      }
      goto LABEL_52;
    }
    mapSpanSubtype = self->_settings.mapSpanSubtype;
    if (mapSpanSubtype == 2)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayRateThrottle mapView](self, "mapView"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "userLocation"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "location"));
      objc_msgSend(v53, "coordinate");
      v54 = MKMapPointForCoordinate(v76);

      v55 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "route"));

      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "destination"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "latLng"));

      objc_msgSend(v58, "lat");
      v60 = v59;
      objc_msgSend(v58, "lng");
      v77 = CLLocationCoordinate2DMake(v60, v61);
      v78 = MKMapPointForCoordinate(v77);
      v18 = MKMetersBetweenMapPoints(v54, v78);

    }
    else
    {
      if (mapSpanSubtype == 1)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayRateThrottle mapView](self, "mapView"));
        objc_msgSend(v62, "visibleMapRect");
        v64 = v63;
        v66 = v65;
        v68 = v67;
        v70 = v69;

        v30 = v64 + v68 * 0.5;
        v29 = v66 + v70;
        v31 = v66;
        v28 = v30;
        goto LABEL_49;
      }
      v18 = 0.0;
      if (!mapSpanSubtype)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayRateThrottle mapView](self, "mapView"));
        objc_msgSend(v19, "visibleMapRect");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;

        v28 = v21 + v25;
        v29 = v23 + v27;
        v30 = v21;
        v31 = v23;
LABEL_49:
        v18 = MKMetersBetweenMapPoints(*(MKMapPoint *)&v30, *(MKMapPoint *)&v28);
      }
    }
    if (v18 <= self->_settings.minMapSpan)
    {
LABEL_53:
      idleDisplayRate = self->_settings.maximumRate;
      goto LABEL_61;
    }
    if (v18 <= self->_settings.maxMapSpan)
    {
      -[ChromeNavigationDisplayRateThrottle _scaleFactorWithValue:maximumValue:minimumValue:](self, "_scaleFactorWithValue:maximumValue:minimumValue:", v18);
      v72 = vcvtpd_s64_f64((1.0 - v71) * (double)self->_settings.maximumRate);
      if (self->_settings.minimumRate <= v72)
        idleDisplayRate = v72;
      else
        idleDisplayRate = self->_settings.minimumRate;
      v73 = sub_1003675C4();
      v15 = objc_claimAutoreleasedReturnValue(v73);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        goto LABEL_60;
      *(_DWORD *)v75 = 134217984;
      *(_QWORD *)&v75[4] = idleDisplayRate;
      v16 = "Returning map span level display rate %ld";
      goto LABEL_59;
    }
LABEL_52:
    idleDisplayRate = self->_settings.minimumRate;
    goto LABEL_61;
  }
  -[ChromeNavigationDisplayRateThrottle _rememberNewDisplayRate:reason:](self, "_rememberNewDisplayRate:reason:", 0, CFSTR("disabled"));
  v9 = sub_1003675C4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v75 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "We are disabled; use 0 display rate", v75, 2u);
  }

  return 0;
}

- (double)_scaleFactorWithValue:(double)a3 maximumValue:(double)a4 minimumValue:(double)a5
{
  double v5;

  v5 = 1.0;
  if (!self->_settings.scaling)
    return (a3 - a5) / (a4 - a5);
  return v5;
}

- (void)setTemporaryDisplayRate:(int64_t)a3 forDuration:(double)temporaryDisplayRateDuration
{
  id v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  int64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  int64_t v15;
  __int16 v16;
  double v17;

  v7 = sub_1003675C4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v15 = a3;
    v16 = 2048;
    v17 = temporaryDisplayRateDuration;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting temporary display rate: %ld for duration: %f", buf, 0x16u);
  }

  if (temporaryDisplayRateDuration == -1.0)
    temporaryDisplayRateDuration = self->_settings.temporaryDisplayRateDuration;
  if (temporaryDisplayRateDuration < 0.0)
    temporaryDisplayRateDuration = 0.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_temporaryDisplayRateTimer);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)&self->_temporaryDisplayRateTimer, 0);
  if (a3 >= 1 && temporaryDisplayRateDuration > 0.0)
  {
    objc_initWeak((id *)buf, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100367F44;
    v12[3] = &unk_1011ADF20;
    objc_copyWeak(&v13, (id *)buf);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v12, temporaryDisplayRateDuration));
    objc_storeWeak((id *)&self->_temporaryDisplayRateTimer, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  v11 = a3 & ~(a3 >> 63);
  if (self->_temporaryDisplayRate != v11)
  {
    self->_temporaryDisplayRate = v11;
    -[ChromeNavigationDisplayRateThrottle _notifyDelegateOfDisplayRate:](self, "_notifyDelegateOfDisplayRate:", -[ChromeNavigationDisplayRateThrottle calculateThrottledDisplayRate](self, "calculateThrottledDisplayRate"));
  }
}

- (void)_rememberNewDisplayRate:(int64_t)a3 reason:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;

  v7 = a4;
  if (self->_lastCalculatedDisplayRate != a3)
  {
    v8 = sub_1003675C4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_lastCalculatedDisplayRate));
      v12 = 138412802;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Navigation display rate change (new rate: %@, previous rate: %@, reason: %@)", (uint8_t *)&v12, 0x20u);

    }
    self->_lastCalculatedDisplayRate = a3;
    objc_storeStrong((id *)&self->_lastCalculatedDisplayRateReason, a4);
  }

}

- (void)_notifyDelegateOfDisplayRate:(int64_t)a3
{
  id v5;

  if (self->_batchingUpdates)
  {
    self->_finalBatchedDisplayRate = a3;
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayRateThrottle delegate](self, "delegate"));
    objc_msgSend(v5, "throttle:calculatedNewDisplayRate:", self, a3);

  }
}

- (void)_notifyAfterChanges:(id)a3
{
  void (**v4)(_QWORD);
  unint64_t batchingUpdates;
  id v6;
  NSObject *v7;
  unint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    batchingUpdates = self->_batchingUpdates;
    if (!batchingUpdates)
    {
      v6 = sub_1003675C4();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting batched rate changes", buf, 2u);
      }

      self->_initialBatchedDisplayRate = self->_lastCalculatedDisplayRate;
      batchingUpdates = self->_batchingUpdates;
    }
    self->_batchingUpdates = batchingUpdates + 1;
    v4[2](v4);
    v8 = self->_batchingUpdates - 1;
    self->_batchingUpdates = v8;
    if (!v8)
    {
      v9 = sub_1003675C4();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ending batched rate changes", v12, 2u);
      }

      if (self->_initialBatchedDisplayRate != self->_finalBatchedDisplayRate)
      {
        -[ChromeNavigationDisplayRateThrottle _rememberNewDisplayRate:reason:](self, "_rememberNewDisplayRate:reason:");
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayRateThrottle delegate](self, "delegate"));
        objc_msgSend(v11, "throttle:calculatedNewDisplayRate:", self, self->_finalBatchedDisplayRate);

      }
      self->_initialBatchedDisplayRate = 0;
      self->_finalBatchedDisplayRate = 0;
    }
  }

}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v6;

  v6 = a4;
  if (!-[ChromeNavigationDisplayRateThrottle _isLocationStationary:](self, "_isLocationStationary:"))
  {
    objc_storeStrong((id *)&self->_latestMovingLocation, a4);
    -[ChromeNavigationDisplayRateThrottle setIdle:](self, "setIdle:", 0);
  }
  -[ChromeNavigationDisplayRateThrottle _waitForNoMovement](self, "_waitForNoMovement");

}

- (void)_waitForNoMovement
{
  NSTimer **p_idleTimer;
  id WeakRetained;
  double idleCheckInterval;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  p_idleTimer = &self->_idleTimer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimer);
  if (WeakRetained)
  {

  }
  else if (self->_settings.throttleWhenIdle)
  {
    objc_initWeak(&location, self);
    idleCheckInterval = self->_settings.idleCheckInterval;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100368410;
    v7[3] = &unk_1011ADF20;
    objc_copyWeak(&v8, &location);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v7, idleCheckInterval));
    objc_storeWeak((id *)p_idleTimer, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelWaitForNoMovement
{
  ChromeNavigationDisplayRateThrottle *v2;
  id WeakRetained;

  v2 = self;
  -[ChromeNavigationDisplayRateThrottle setIdle:](self, "setIdle:", 0);
  v2 = (ChromeNavigationDisplayRateThrottle *)((char *)v2 + 48);
  WeakRetained = objc_loadWeakRetained((id *)&v2->super.isa);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)&v2->super.isa, 0);
}

- (BOOL)_isLocationStationary:(id)a3
{
  double v4;

  objc_msgSend(a3, "speed");
  return v4 >= 0.0 && v4 <= self->_settings.idleSpeedThreshold;
}

- (void)_checkForRecentMovement
{
  void *v3;
  MNLocation *latestMovingLocation;
  void *v5;
  double v6;
  double v7;
  double idleTimeThreshold;
  NSTimer **p_idleTimer;
  id WeakRetained;
  id obj;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastLocation"));

  if (!-[ChromeNavigationDisplayRateThrottle _isLocationStationary:](self, "_isLocationStationary:", obj))
    objc_storeStrong((id *)&self->_latestMovingLocation, obj);
  if (-[ChromeNavigationDisplayRateThrottle isEnabled](self, "isEnabled")
    && (latestMovingLocation = self->_latestMovingLocation) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNLocation originalDate](latestMovingLocation, "originalDate"));
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = fabs(v6);
    idleTimeThreshold = self->_settings.idleTimeThreshold;

    -[ChromeNavigationDisplayRateThrottle setIdle:](self, "setIdle:", v7 >= idleTimeThreshold);
    if (v7 >= idleTimeThreshold)
      goto LABEL_9;
  }
  else
  {
    -[ChromeNavigationDisplayRateThrottle setIdle:](self, "setIdle:", 0);
  }
  if (!-[ChromeNavigationDisplayRateThrottle isEnabled](self, "isEnabled"))
  {
LABEL_9:
    p_idleTimer = &self->_idleTimer;
    WeakRetained = objc_loadWeakRetained((id *)p_idleTimer);
    objc_msgSend(WeakRetained, "invalidate");

    objc_storeWeak((id *)p_idleTimer, 0);
  }

}

- (void)clearAllSettings
{
  objc_msgSend((id)objc_opt_class(self), "_clearAllSettings");
  -[ChromeNavigationDisplayRateThrottle _readFromDefaults](self, "_readFromDefaults");
}

+ (void)_clearAllSettings
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];

  v3 = sub_1003675C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing throttle user defaults", buf, 2u);
  }

  v5 = objc_msgSend((id)objc_opt_class(a1), "_defaultSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v13, "removeObjectForKey:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v14, "synchronize");

}

- (void)_readFromDefaults
{
  uint64_t Dictionary;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint8_t v41[16];
  uint8_t buf[16];

  Dictionary = GEOConfigGetDictionary(MapsConfig_ChromeNavigationDisplayRateConfiguration, off_1014B2F38);
  v4 = (void *)objc_claimAutoreleasedReturnValue(Dictionary);
  v5 = sub_1003675C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reading throttle GEO defaults", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleType")));
    self->_settings.type = (unint64_t)objc_msgSend(v8, "integerValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleScaling")));
    self->_settings.scaling = (unint64_t)objc_msgSend(v9, "integerValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateIgnoreCameraStyle")));
    self->_settings.ignoreCameraStyle = objc_msgSend(v10, "BOOLValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateIgnoreConnectionType")));
    self->_settings.ignoreConnectionType = objc_msgSend(v11, "BOOLValue");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleMinimum")));
    self->_settings.minimumRate = (int64_t)objc_msgSend(v12, "integerValue");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleMaximum")));
    self->_settings.maximumRate = (int64_t)objc_msgSend(v13, "integerValue");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleConstant")));
    self->_settings.constantRate = (int64_t)objc_msgSend(v14, "integerValue");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleZoomLevelMin")));
    objc_msgSend(v15, "doubleValue");
    self->_settings.minZoomLevel = v16;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleZoomLevelMax")));
    objc_msgSend(v17, "doubleValue");
    self->_settings.maxZoomLevel = v18;

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleMapSpanMin")));
    objc_msgSend(v19, "doubleValue");
    self->_settings.minMapSpan = v20;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleMapSpanMax")));
    objc_msgSend(v21, "doubleValue");
    self->_settings.maxMapSpan = v22;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleMapSpanSubtype")));
    self->_settings.mapSpanSubtype = (unint64_t)objc_msgSend(v23, "integerValue");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateTemporaryDuration")));
    objc_msgSend(v24, "doubleValue");
    self->_settings.temporaryDisplayRateDuration = v25;

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleWhenIdle")));
    self->_settings.throttleWhenIdle = objc_msgSend(v26, "BOOLValue");

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleIdleRate")));
    self->_settings.idleDisplayRate = (int64_t)objc_msgSend(v27, "integerValue");

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleIdleCheckInterval")));
    objc_msgSend(v28, "doubleValue");
    self->_settings.idleCheckInterval = v29;

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleIdleTimeThreshold")));
    objc_msgSend(v30, "doubleValue");
    self->_settings.idleTimeThreshold = v31;

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromeNavigationDisplayRateThrottleIdleSpeedThreshold")));
    objc_msgSend(v32, "doubleValue");
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reading throttle user defaults", v41, 2u);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    self->_settings.type = (unint64_t)objc_msgSend(v32, "integerForKey:", CFSTR("ChromeNavigationDisplayRateThrottleType"));
    self->_settings.scaling = (unint64_t)objc_msgSend(v32, "integerForKey:", CFSTR("ChromeNavigationDisplayRateThrottleScaling"));
    self->_settings.ignoreCameraStyle = objc_msgSend(v32, "BOOLForKey:", CFSTR("ChromeNavigationDisplayRateIgnoreCameraStyle"));
    self->_settings.ignoreConnectionType = objc_msgSend(v32, "BOOLForKey:", CFSTR("ChromeNavigationDisplayRateIgnoreConnectionType"));
    self->_settings.minimumRate = (int64_t)objc_msgSend(v32, "integerForKey:", CFSTR("ChromeNavigationDisplayRateThrottleMinimum"));
    self->_settings.maximumRate = (int64_t)objc_msgSend(v32, "integerForKey:", CFSTR("ChromeNavigationDisplayRateThrottleMaximum"));
    self->_settings.constantRate = (int64_t)objc_msgSend(v32, "integerForKey:", CFSTR("ChromeNavigationDisplayRateThrottleConstant"));
    objc_msgSend(v32, "doubleForKey:", CFSTR("ChromeNavigationDisplayRateThrottleZoomLevelMin"));
    self->_settings.minZoomLevel = v34;
    objc_msgSend(v32, "doubleForKey:", CFSTR("ChromeNavigationDisplayRateThrottleZoomLevelMax"));
    self->_settings.maxZoomLevel = v35;
    objc_msgSend(v32, "doubleForKey:", CFSTR("ChromeNavigationDisplayRateThrottleMapSpanMin"));
    self->_settings.minMapSpan = v36;
    objc_msgSend(v32, "doubleForKey:", CFSTR("ChromeNavigationDisplayRateThrottleMapSpanMax"));
    self->_settings.maxMapSpan = v37;
    self->_settings.mapSpanSubtype = (unint64_t)objc_msgSend(v32, "integerForKey:", CFSTR("ChromeNavigationDisplayRateThrottleMapSpanSubtype"));
    objc_msgSend(v32, "doubleForKey:", CFSTR("ChromeNavigationDisplayRateTemporaryDuration"));
    self->_settings.temporaryDisplayRateDuration = v38;
    self->_settings.throttleWhenIdle = objc_msgSend(v32, "BOOLForKey:", CFSTR("ChromeNavigationDisplayRateThrottleWhenIdle"));
    self->_settings.idleDisplayRate = (int64_t)objc_msgSend(v32, "integerForKey:", CFSTR("ChromeNavigationDisplayRateThrottleIdleRate"));
    objc_msgSend(v32, "doubleForKey:", CFSTR("ChromeNavigationDisplayRateThrottleIdleCheckInterval"));
    self->_settings.idleCheckInterval = v39;
    objc_msgSend(v32, "doubleForKey:", CFSTR("ChromeNavigationDisplayRateThrottleIdleTimeThreshold"));
    self->_settings.idleTimeThreshold = v40;
    objc_msgSend(v32, "doubleForKey:", CFSTR("ChromeNavigationDisplayRateThrottleIdleSpeedThreshold"));
  }
  self->_settings.idleSpeedThreshold = v33;

}

- (NSString)description
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _OWORD v14[8];
  uint64_t v15;

  v3 = *(_OWORD *)&self->_settings.temporaryDisplayRateDuration;
  v4 = *(_OWORD *)&self->_settings.idleTimeThreshold;
  v14[6] = *(_OWORD *)&self->_settings.idleDisplayRate;
  v14[7] = v4;
  v15 = *(_QWORD *)&self->_settings.ignoreCameraStyle;
  v5 = *(_OWORD *)&self->_settings.constantRate;
  v6 = *(_OWORD *)&self->_settings.maxZoomLevel;
  v14[2] = *(_OWORD *)&self->_settings.maximumRate;
  v14[3] = v6;
  v14[4] = *(_OWORD *)&self->_settings.maxMapSpan;
  v14[5] = v3;
  v14[0] = *(_OWORD *)&self->_settings.type;
  v14[1] = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayRateThrottle _descriptionComponentsForSettings:](self, "_descriptionComponentsForSettings:", v14));
  v13.receiver = self;
  v13.super_class = (Class)ChromeNavigationDisplayRateThrottle;
  v8 = -[ChromeNavigationDisplayRateThrottle description](&v13, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", ")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v9, v10));

  return (NSString *)v11;
}

- (id)_descriptionComponentsForSettings:(id *)a3
{
  void *v4;
  unint64_t var0;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  var0 = a3->var0;
  v6 = sub_1003692E8(a3->var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("type: %@"), v7));
  objc_msgSend(v4, "addObject:", v8);

  switch(var0)
  {
    case 3uLL:
      v11 = sub_1003693D8(a3->var9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("subtype: %@"), v12));
      objc_msgSend(v4, "addObject:", v13);

      v14 = sub_100369364(a3->var1);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("scaling: %@"), v15));
      objc_msgSend(v4, "addObject:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->var3));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("min rate: %@"), v17));
      objc_msgSend(v4, "addObject:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var7));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("at min span: %@"), v19));
      objc_msgSend(v4, "addObject:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->var4));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("max rate: %@"), v21));
      objc_msgSend(v4, "addObject:", v22);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var8));
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("at max span: %@"), v9);
      break;
    case 2uLL:
      v23 = sub_100369364(a3->var1);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("scaling: %@"), v24));
      objc_msgSend(v4, "addObject:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->var4));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("max rate: %@"), v26));
      objc_msgSend(v4, "addObject:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var6));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("at max zoom: %@"), v28));
      objc_msgSend(v4, "addObject:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->var3));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("min rate: %@"), v30));
      objc_msgSend(v4, "addObject:", v31);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var5));
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("at min zoom: %@"), v9);
      break;
    case 1uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->var2));
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("constant rate: %@"), v9);
      break;
    default:
      goto LABEL_8;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v4, "addObject:", v32);

LABEL_8:
  if (a3->var17)
    v33 = CFSTR("YES");
  else
    v33 = CFSTR("NO");
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ignore connection type: %@"), v33));
  objc_msgSend(v4, "addObject:", v34);

  if (a3->var16)
    v35 = CFSTR("YES");
  else
    v35 = CFSTR("NO");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ignore camera style: %@"), v35));
  objc_msgSend(v4, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var10));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("temporary rate duration: %@"), v37));
  objc_msgSend(v4, "addObject:", v38);

  if (a3->var11)
    v39 = CFSTR("YES");
  else
    v39 = CFSTR("NO");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("throttle when idle: %@"), v39));
  objc_msgSend(v4, "addObject:", v40);

  if (a3->var11)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var13));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idle check every: %@s"), v41));
    objc_msgSend(v4, "addObject:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var14));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idle after: %@s"), v43));
    objc_msgSend(v4, "addObject:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var15));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idle speed threshold: %@m/s"), v45));
    objc_msgSend(v4, "addObject:", v46);

  }
  v47 = objc_msgSend(v4, "copy");

  return v47;
}

- (ChromeNavigationDisplayRateThrottleDelegate)delegate
{
  return (ChromeNavigationDisplayRateThrottleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isIdle
{
  return self->_idle;
}

- ($0B703381901B85F5D0D61E0B9597699D)settings
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].var6;
  v4 = *(_OWORD *)&self[1].var10;
  *(_OWORD *)&retstr->var12 = *(_OWORD *)&self[1].var8;
  *(_OWORD *)&retstr->var14 = v4;
  *(_QWORD *)&retstr->var16 = self[1].var12;
  v5 = *(_OWORD *)&self->var15;
  v6 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var6 = v6;
  *(_OWORD *)&retstr->var8 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var10 = v3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var13;
  *(_OWORD *)&retstr->var2 = v5;
  return self;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_idleTimer);
  objc_destroyWeak((id *)&self->_temporaryDisplayRateTimer);
  objc_storeStrong((id *)&self->_latestMovingLocation, 0);
  objc_storeStrong((id *)&self->_lastCalculatedDisplayRateReason, 0);
}

@end
