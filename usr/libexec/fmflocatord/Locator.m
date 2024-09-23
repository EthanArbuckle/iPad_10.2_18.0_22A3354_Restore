@implementation Locator

- (void)dealloc
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD block[4];
  _QWORD *v10;
  _QWORD v11[5];

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100033818(self);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008970;
  v11[3] = &unk_100055230;
  v11[4] = self;
  v5 = objc_retainBlock(v11);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    ((void (*)(_QWORD *))v5[2])(v5);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000089C8;
    block[3] = &unk_100055258;
    v10 = v5;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Locator finishedTimer](self, "finishedTimer"));
  objc_msgSend(v6, "invalidate");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Locator publishTimer](self, "publishTimer"));
  objc_msgSend(v7, "invalidate");

  v8.receiver = self;
  v8.super_class = (Class)Locator;
  -[Locator dealloc](&v8, "dealloc");
}

- (Locator)initWithLocationManager:(id)a3
{
  id v5;
  char *v6;
  Locator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Locator;
  v6 = -[Locator init](&v9, "init");
  v7 = (Locator *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 40) = xmmword_100049D50;
    *(_OWORD *)(v6 + 24) = xmmword_100049D60;
    *(_OWORD *)(v6 + 56) = xmmword_100049D70;
    objc_storeStrong((id *)v6 + 12, a3);
    -[CLLocationManager setDelegate:](v7->_locManager, "setDelegate:", v7);
    -[CLLocationManager setDesiredAccuracy:](v7->_locManager, "setDesiredAccuracy:", v7->_desiredAccuracy);
    -[CLLocationManager setDistanceFilter:](v7->_locManager, "setDistanceFilter:", kCLDistanceFilterNone);
  }

  return v7;
}

- (id)powerAssertionName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%lX"), CFSTR("Locating"), self);
}

- (id)xpcTransactionName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Locating-%lX"), self);
}

- (void)startLocator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;

  if (!-[Locator locatorRunning](self, "locatorRunning"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PowerMgr sharedInstance](PowerMgr, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[Locator powerAssertionName](self, "powerAssertionName"));
    objc_msgSend(v3, "powerAssertionEnableWithReason:timeout:", v4, (uint64_t)(self->_duration + 2.0));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[Locator xpcTransactionName](self, "xpcTransactionName"));
    objc_msgSend(v5, "beginTransaction:", v6);

    -[Locator setFinished:](self, "setFinished:", 0);
    -[Locator setLocatorRunning:](self, "setLocatorRunning:", 1);
    self->_launchTime = CFAbsoluteTimeGetCurrent();
    self->_currentDecayMultiplier = 0;
    self->_numPublished = 0;
    self->_currentThreshold = self->_startThreshold;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_processStopTimeout:", 0, 0, self->_duration));
    -[Locator setFinishedTimer:](self, "setFinishedTimer:", v7);

    v8 = sub_10001C4E8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
      v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ Starting location service now", (uint8_t *)&v11, 0xCu);

    }
    -[CLLocationManager startUpdatingLocation](self->_locManager, "startUpdatingLocation");
  }
}

- (void)stopLocator
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
    v15 = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Stopping location service now", (uint8_t *)&v15, 0xCu);

  }
  -[Locator setLocatorRunning:](self, "setLocatorRunning:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Locator locManager](self, "locManager"));

  if (v6)
    -[Locator _discardLocationManager](self, "_discardLocationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Locator finishedTimer](self, "finishedTimer"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[Locator finishedTimer](self, "finishedTimer"));
    objc_msgSend(v8, "invalidate");

    -[Locator setFinishedTimer:](self, "setFinishedTimer:", 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[Locator publishTimer](self, "publishTimer"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[Locator publishTimer](self, "publishTimer"));
    objc_msgSend(v10, "invalidate");

    -[Locator setPublishTimer:](self, "setPublishTimer:", 0);
  }
  self->_numPublished = 0;
  -[Locator setLastLocation:](self, "setLastLocation:", 0);
  -[Locator setLocationForPublish:](self, "setLocationForPublish:", 0);
  if (self->_stoppedLocatorBlock)
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, self->_stoppedLocatorBlock);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PowerMgr sharedInstance](PowerMgr, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[Locator powerAssertionName](self, "powerAssertionName"));
  objc_msgSend(v11, "powerAssertionDisableWithReason:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[Locator xpcTransactionName](self, "xpcTransactionName"));
  objc_msgSend(v13, "endTransaction:", v14);

}

- (void)_discardLocationManager
{
  void *v3;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Locator locManager](self, "locManager"));

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008F38;
    block[3] = &unk_100055230;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  id v29;
  NSObject *v30;
  id v31;
  double v32;
  id v33;
  void *v34;
  double startThreshold;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double launchTime;
  id v45;
  NSObject *v46;
  void *v47;
  double cachedLocValidityDuration;
  uint64_t v49;
  int v50;
  uint64_t v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  double v64;
  double v65;
  id v66;
  NSObject *v67;
  void *v68;
  double currentThreshold;
  int v70;
  double v71;
  double v72;
  double v73;
  id v74;
  NSObject *v75;
  void *v76;
  double v77;
  id v78;
  NSObject *v79;
  void *v80;
  double endThreshold;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  _BOOL4 v87;
  uint64_t v88;
  NSObject *v89;
  double v90;
  id v91;
  void *v92;
  double v93;
  void *v94;
  unsigned int v95;
  void *v96;
  unsigned int v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  double v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  void *v119;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v9 = v8;
    if (!v8)
    {
LABEL_39:

      goto LABEL_40;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CommonUtil stringForLocationType:](CommonUtil, "stringForLocationType:", objc_msgSend(v8, "type")));
    v11 = sub_10001C558();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
      objc_msgSend(v9, "horizontalAccuracy");
      v15 = v14;
      objc_msgSend(v9, "coordinate");
      v17 = v16;
      objc_msgSend(v9, "coordinate");
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timestamp"));
      *(_DWORD *)buf = 138413571;
      v109 = v13;
      v110 = 2112;
      v111 = (uint64_t)v10;
      v112 = 2049;
      v113 = v15;
      v114 = 2049;
      v115 = v17;
      v116 = 2049;
      v117 = v19;
      v118 = 2112;
      v119 = v20;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ Received location with Position Type = %@, Accuracy = %{private}f, Latitude = %{private}f, Longitude = %{private}f, Timestamp = %@", buf, 0x3Eu);

    }
    if (!-[Locator locatorRunning](self, "locatorRunning"))
    {
      v29 = sub_10001C4E8();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        sub_100033894(self);

      objc_msgSend(v6, "setDelegate:", 0);
      objc_msgSend(v6, "stopUpdatingLocation");
      v31 = (id)objc_claimAutoreleasedReturnValue(-[Locator locManager](self, "locManager"));

      if (v31 == v6)
        -[Locator _discardLocationManager](self, "_discardLocationManager");
      goto LABEL_38;
    }
    objc_msgSend(v9, "horizontalAccuracy");
    if (v21 < 0.0)
    {
      v22 = sub_10001C4E8();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
        objc_msgSend(v9, "horizontalAccuracy");
        *(_DWORD *)buf = 138412546;
        v109 = v24;
        v110 = 2048;
        v111 = v25;
        v26 = "%@ Location has a -ve horizontalAccuracy (%.2f). Not using it";
LABEL_9:
        v27 = v23;
        v28 = 22;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);

        goto LABEL_37;
      }
      goto LABEL_37;
    }
    objc_msgSend(v9, "horizontalAccuracy");
    if (v32 > self->_startThreshold)
    {
      v33 = sub_10001C4E8();
      v23 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
        objc_msgSend(v9, "horizontalAccuracy");
        startThreshold = self->_startThreshold;
        *(_DWORD *)buf = 138412802;
        v109 = v34;
        v110 = 2048;
        v111 = v36;
        v112 = 2048;
        v113 = *(_QWORD *)&startThreshold;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ Location has a horizontalAccuracy of %.2f > start threshold %.2f. Not using it", buf, 0x20u);

      }
      goto LABEL_37;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timestamp"));
    objc_msgSend(v37, "timeIntervalSinceReferenceDate");
    v39 = v38;
    v40 = self->_launchTime - self->_cachedLocValidityDuration;

    if (v39 <= v40)
    {
      v63 = sub_10001C4E8();
      v23 = objc_claimAutoreleasedReturnValue(v63);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
      *(_DWORD *)buf = 138412290;
      v109 = v24;
      v26 = "%@ Location is really old. Discarding it & waiting for a newer one";
      goto LABEL_35;
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timestamp"));
    objc_msgSend(v41, "timeIntervalSinceReferenceDate");
    v43 = v42;
    launchTime = self->_launchTime;

    if (v43 < launchTime)
    {
      v45 = sub_10001C4E8();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
        cachedLocValidityDuration = self->_cachedLocValidityDuration;
        *(_DWORD *)buf = 138412546;
        v109 = v47;
        v110 = 2048;
        v111 = *(_QWORD *)&cachedLocValidityDuration;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%@ Location is an old cached one but not older than %.0f seconds before the start of this cycle. Considering it for later use", buf, 0x16u);

      }
      v49 = 0;
      v50 = 1;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v9, "horizontalAccuracy");
    if (v64 <= self->_endThreshold)
    {
      v78 = sub_10001C4E8();
      v79 = objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
        endThreshold = self->_endThreshold;
        *(_DWORD *)buf = 138412546;
        v109 = v80;
        v110 = 2048;
        v111 = *(_QWORD *)&endThreshold;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%@ Location has accuracy below the end threshold %f. Publishing it immediately & finishing the locate cycle", buf, 0x16u);

      }
      -[Locator setLocationForPublish:](self, "setLocationForPublish:", v9);
      -[Locator setLastPublishReason:](self, "setLastPublishReason:", 3);
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[Locator publishTimer](self, "publishTimer"));

      if (v82)
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[Locator publishTimer](self, "publishTimer"));
        objc_msgSend(v83, "invalidate");

        -[Locator setPublishTimer:](self, "setPublishTimer:", 0);
      }
      -[Locator setFinished:](self, "setFinished:", 1);
      -[Locator _publishResultLocation:](self, "_publishResultLocation:", 0);
      -[Locator performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "stopLocator", 0, 0);
      goto LABEL_38;
    }
    objc_msgSend(v9, "horizontalAccuracy");
    if (v65 >= self->_currentThreshold)
    {
      v50 = 0;
      v49 = 0;
    }
    else
    {
      v66 = sub_10001C4E8();
      v67 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
        currentThreshold = self->_currentThreshold;
        *(_DWORD *)buf = 138412802;
        v109 = v68;
        v110 = 2048;
        v111 = *(_QWORD *)&currentThreshold;
        v112 = 2048;
        v113 = 0x4000000000000000;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%@ Location has accuracy within current publish threshold of %.2f. Publishing it within the next %f seconds", buf, 0x20u);

      }
      do
      {
        v70 = self->_currentDecayMultiplier + 1;
        self->_currentDecayMultiplier = v70;
        v71 = self->_startThreshold;
        v72 = v71 * exp(-(self->_decayFactor * (double)v70));
        self->_currentThreshold = v72;
        objc_msgSend(v9, "horizontalAccuracy");
      }
      while (v72 >= v73);
      v74 = sub_10001C4E8();
      v75 = objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
        v77 = self->_currentThreshold;
        *(_DWORD *)buf = 138412546;
        v109 = v76;
        v110 = 2048;
        v111 = *(_QWORD *)&v77;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%@ New publish threshold is %.2f", buf, 0x16u);

      }
      v50 = 1;
      v49 = 2;
    }
    v88 = objc_claimAutoreleasedReturnValue(-[Locator lastLocation](self, "lastLocation"));
    if (v88)
    {
      v89 = v88;
    }
    else
    {
      objc_msgSend(v9, "horizontalAccuracy");
      if (v90 > self->_startThreshold)
      {
LABEL_68:
        v94 = (void *)objc_claimAutoreleasedReturnValue(-[Locator lastLocation](self, "lastLocation"));

        if (!v94 || !objc_msgSend(v9, "type"))
          goto LABEL_23;
        v107 = v49;
        v95 = objc_msgSend(v9, "type");
        v96 = (void *)objc_claimAutoreleasedReturnValue(-[Locator lastLocation](self, "lastLocation"));
        v97 = objc_msgSend(v96, "type");

        if (v95 == v97)
        {
          v49 = v107;
        }
        else
        {
          v99 = (void *)objc_claimAutoreleasedReturnValue(-[Locator lastLocation](self, "lastLocation"));
          objc_msgSend(v99, "distanceFromLocation:", v9);
          v101 = v100;

          v49 = v107;
          if (v101 >= 5.0)
          {
            v102 = sub_10001C4E8();
            v46 = objc_claimAutoreleasedReturnValue(v102);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              v103 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
              v104 = (void *)objc_claimAutoreleasedReturnValue(-[Locator lastLocation](self, "lastLocation"));
              v105 = (void *)objc_claimAutoreleasedReturnValue(+[CommonUtil stringForLocationType:](CommonUtil, "stringForLocationType:", objc_msgSend(v104, "type")));
              v106 = (void *)objc_claimAutoreleasedReturnValue(+[CommonUtil stringForLocationType:](CommonUtil, "stringForLocationType:", objc_msgSend(v9, "type")));
              *(_DWORD *)buf = 138413058;
              v109 = v103;
              v110 = 2112;
              v111 = (uint64_t)v105;
              v112 = 2112;
              v113 = (uint64_t)v106;
              v114 = 2048;
              v115 = v101;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%@ Location type changed from %@ to %@ with distance traveled %.2lf. Publishing it immediately", buf, 0x2Au);

            }
            v50 = 2;
            v49 = 4;
            goto LABEL_22;
          }
        }
LABEL_23:
        v51 = objc_claimAutoreleasedReturnValue(-[Locator lastLocation](self, "lastLocation"));
        if (!v51)
          goto LABEL_25;
        v52 = (void *)v51;
        objc_msgSend(v9, "horizontalAccuracy");
        v54 = v53;
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[Locator lastLocation](self, "lastLocation"));
        objc_msgSend(v55, "horizontalAccuracy");
        v57 = v56;

        if (v54 <= v57)
        {
LABEL_25:
          v58 = sub_10001C4E8();
          v59 = objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
            *(_DWORD *)buf = 138412290;
            v109 = v60;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%@ Storing this location as the best last known location in this locate cycle", buf, 0xCu);

          }
          -[Locator setLastLocation:](self, "setLastLocation:", v9);
        }
        -[Locator setLocationForPublish:](self, "setLocationForPublish:", v9);
        -[Locator setLastPublishReason:](self, "setLastPublishReason:", v49);
        if (v50)
        {
          if (v50 != 1)
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(-[Locator publishTimer](self, "publishTimer"));

            if (v61)
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue(-[Locator publishTimer](self, "publishTimer"));
              objc_msgSend(v62, "invalidate");

              -[Locator setPublishTimer:](self, "setPublishTimer:", 0);
            }
            -[Locator _publishResultLocation:](self, "_publishResultLocation:", 0);
            goto LABEL_38;
          }
          v85 = (void *)objc_claimAutoreleasedReturnValue(-[Locator publishTimer](self, "publishTimer"));

          v86 = sub_10001C4E8();
          v23 = objc_claimAutoreleasedReturnValue(v86);
          v87 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (!v85)
          {
            if (v87)
            {
              v98 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
              *(_DWORD *)buf = 138412546;
              v109 = v98;
              v110 = 2048;
              v111 = 0x4000000000000000;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ Scheduling the location to be published in %f seconds", buf, 0x16u);

            }
            v23 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_publishResultLocation:", 0, 0, 2.0));
            -[Locator setPublishTimer:](self, "setPublishTimer:", v23);
            goto LABEL_37;
          }
          if (v87)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
            *(_DWORD *)buf = 138412546;
            v109 = v24;
            v110 = 2048;
            v111 = 0x4000000000000000;
            v26 = "%@ A timer is already running to publish the location within the next %f seconds";
            goto LABEL_9;
          }
LABEL_37:

LABEL_38:
          goto LABEL_39;
        }
        v84 = sub_10001C4E8();
        v23 = objc_claimAutoreleasedReturnValue(v84);
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          goto LABEL_37;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
        *(_DWORD *)buf = 138412290;
        v109 = v24;
        v26 = "%@ Not publishing this location";
LABEL_35:
        v27 = v23;
        v28 = 12;
        goto LABEL_36;
      }
      v91 = sub_10001C4E8();
      v89 = objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
        v93 = self->_startThreshold;
        *(_DWORD *)buf = 138412546;
        v109 = v92;
        v110 = 2048;
        v111 = *(_QWORD *)&v93;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "%@ This is the first location with accuracy below the start threshold %.2f. Publishing it immediately", buf, 0x16u);

      }
      v50 = 2;
      v49 = 1;
    }

    goto LABEL_68;
  }
LABEL_40:

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;

  v5 = a4;
  v6 = sub_10001C4E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Location updates failed with error: %@", (uint8_t *)&v13, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (!objc_msgSend(v9, "isEqualToString:", kCLErrorDomain))
  {

    goto LABEL_9;
  }
  v10 = objc_msgSend(v5, "code");

  if (v10)
  {
LABEL_9:
    -[Locator stopLocator](self, "stopLocator");
    goto LABEL_10;
  }
  v11 = sub_10001C4E8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not stopping the locator service because the error is temporary.", (uint8_t *)&v13, 2u);
  }

LABEL_10:
}

- (void)_processStopTimeout:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Location Services ending now after timeout", (uint8_t *)&v8, 0xCu);

  }
  -[Locator setLocatorRunning:](self, "setLocatorRunning:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Locator lastLocation](self, "lastLocation"));

  if (v7)
  {
    -[Locator setFinished:](self, "setFinished:", 1);
    -[Locator setLastPublishReason:](self, "setLastPublishReason:", 5);
    -[Locator _publishResultLocation:](self, "_publishResultLocation:", 0);
  }
  -[Locator stopLocator](self, "stopLocator");
}

- (void)_publishResultLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void (**receivedLocationBlock)(id, void *, BOOL, int64_t, double);
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  int64_t v21;

  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[Locator fm_logID](self, "fm_logID"));
    v18 = 138412546;
    v19 = v6;
    v20 = 2048;
    v21 = -[Locator lastPublishReason](self, "lastPublishReason");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Publishing the location to the server for reason %ld", (uint8_t *)&v18, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Locator publishTimer](self, "publishTimer"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[Locator publishTimer](self, "publishTimer"));
    objc_msgSend(v8, "invalidate");

    -[Locator setPublishTimer:](self, "setPublishTimer:", 0);
  }
  -[Locator lastPublishedAccuracy](self, "lastPublishedAccuracy");
  v9 = 0.0;
  if (v10 > 0.0)
  {
    -[Locator lastPublishedAccuracy](self, "lastPublishedAccuracy");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[Locator locationForPublish](self, "locationForPublish"));
    objc_msgSend(v13, "horizontalAccuracy");
    v9 = v12 - v14;

  }
  receivedLocationBlock = (void (**)(id, void *, BOOL, int64_t, double))self->_receivedLocationBlock;
  if (receivedLocationBlock)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[Locator locationForPublish](self, "locationForPublish"));
    receivedLocationBlock[2](receivedLocationBlock, v16, -[Locator finished](self, "finished"), -[Locator lastPublishReason](self, "lastPublishReason"), v9);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[Locator locationForPublish](self, "locationForPublish"));
  objc_msgSend(v17, "horizontalAccuracy");
  -[Locator setLastPublishedAccuracy:](self, "setLastPublishedAccuracy:");

  ++self->_numPublished;
}

- (double)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (void)setDesiredAccuracy:(double)a3
{
  self->_desiredAccuracy = a3;
}

- (double)startThreshold
{
  return self->_startThreshold;
}

- (void)setStartThreshold:(double)a3
{
  self->_startThreshold = a3;
}

- (double)endThreshold
{
  return self->_endThreshold;
}

- (void)setEndThreshold:(double)a3
{
  self->_endThreshold = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)cachedLocValidityDuration
{
  return self->_cachedLocValidityDuration;
}

- (void)setCachedLocValidityDuration:(double)a3
{
  self->_cachedLocValidityDuration = a3;
}

- (double)decayFactor
{
  return self->_decayFactor;
}

- (void)setDecayFactor:(double)a3
{
  self->_decayFactor = a3;
}

- (id)receivedLocationBlock
{
  return self->_receivedLocationBlock;
}

- (void)setReceivedLocationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)stoppedLocatorBlock
{
  return self->_stoppedLocatorBlock;
}

- (void)setStoppedLocatorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)locatorRunning
{
  return self->_locatorRunning;
}

- (void)setLocatorRunning:(BOOL)a3
{
  self->_locatorRunning = a3;
}

- (double)launchTime
{
  return self->_launchTime;
}

- (void)setLaunchTime:(double)a3
{
  self->_launchTime = a3;
}

- (CLLocationManager)locManager
{
  return self->_locManager;
}

- (void)setLocManager:(id)a3
{
  objc_storeStrong((id *)&self->_locManager, a3);
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSTimer)finishedTimer
{
  return self->_finishedTimer;
}

- (void)setFinishedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_finishedTimer, a3);
}

- (NSTimer)publishTimer
{
  return self->_publishTimer;
}

- (void)setPublishTimer:(id)a3
{
  objc_storeStrong((id *)&self->_publishTimer, a3);
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (CLLocation)locationForPublish
{
  return self->_locationForPublish;
}

- (void)setLocationForPublish:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)lastPublishReason
{
  return self->_lastPublishReason;
}

- (void)setLastPublishReason:(int64_t)a3
{
  self->_lastPublishReason = a3;
}

- (double)lastPublishedAccuracy
{
  return self->_lastPublishedAccuracy;
}

- (void)setLastPublishedAccuracy:(double)a3
{
  self->_lastPublishedAccuracy = a3;
}

- (double)currentThreshold
{
  return self->_currentThreshold;
}

- (void)setCurrentThreshold:(double)a3
{
  self->_currentThreshold = a3;
}

- (int)currentDecayMultiplier
{
  return self->_currentDecayMultiplier;
}

- (void)setCurrentDecayMultiplier:(int)a3
{
  self->_currentDecayMultiplier = a3;
}

- (int)numPublished
{
  return self->_numPublished;
}

- (void)setNumPublished:(int)a3
{
  self->_numPublished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationForPublish, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_publishTimer, 0);
  objc_storeStrong((id *)&self->_finishedTimer, 0);
  objc_storeStrong((id *)&self->_locManager, 0);
  objc_storeStrong(&self->_stoppedLocatorBlock, 0);
  objc_storeStrong(&self->_receivedLocationBlock, 0);
}

@end
