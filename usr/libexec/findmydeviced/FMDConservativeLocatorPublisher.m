@implementation FMDConservativeLocatorPublisher

- (FMDConservativeLocatorPublisher)init
{
  FMDConservativeLocatorPublisher *v2;
  FMDConservativeLocatorPublisher *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDConservativeLocatorPublisher;
  v2 = -[FMDConservativeLocatorPublisher init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[FMDConservativeLocatorPublisher setStartThreshold:](v2, "setStartThreshold:", &off_1002D8840);
    -[FMDConservativeLocatorPublisher setEndThreshold:](v3, "setEndThreshold:", &off_1002D8850);
    -[FMDConservativeLocatorPublisher setDecayFactor:](v3, "setDecayFactor:", &off_1002D8860);
    -[FMDConservativeLocatorPublisher setCachedLocationValidityTimeInterval:](v3, "setCachedLocationValidityTimeInterval:", &off_1002D8870);
    -[FMDConservativeLocatorPublisher setPublishTimeInterval:](v3, "setPublishTimeInterval:", &off_1002D8218);
    -[FMDConservativeLocatorPublisher setMinimumDistance:](v3, "setMinimumDistance:", &off_1002D8880);
  }
  return v3;
}

- (void)startPublishingWithBlock:(id)a3
{
  void *v4;
  id v5;

  -[FMDConservativeLocatorPublisher setPublishingBlock:](self, "setPublishingBlock:", a3);
  -[FMDConservativeLocatorPublisher setStartedPublishing:](self, "setStartedPublishing:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher startThreshold](self, "startThreshold"));
  -[FMDConservativeLocatorPublisher setCurrentThreshold:](self, "setCurrentThreshold:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[FMDConservativeLocatorPublisher setLaunchDate:](self, "setLaunchDate:", v5);

}

- (void)updatedLocations:(id)a3
{
  -[FMDConservativeLocatorPublisher updatedLocations:reason:](self, "updatedLocations:reason:", a3, 0);
}

- (void)updatedLocations:(id)a3 reason:(int64_t)a4
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  id v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  BOOL v51;
  id v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  BOOL v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  _BOOL4 v66;
  id v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  NSNumber *v76;
  NSNumber *v77;
  NSNumber *currentThreshold;
  double v79;
  double v80;
  void *v81;
  double v82;
  _BOOL4 v83;
  id v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  id v88;
  NSObject *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  id v98;
  NSObject *v99;
  void *v100;
  id v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  NSObject *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  BOOL v112;
  id v113;
  void *v114;
  uint64_t v115;
  void *v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  double v122;
  double v123;
  void *v124;
  void *v125;
  double v126;
  id v127;
  void *v128;
  double v129;
  double v130;
  uint64_t v131;
  double v132;
  id v133;
  double v134;
  double v135;
  void *v136;
  double v137;
  id v138;
  NSObject *v139;
  void *v140;
  void *v141;
  id v142;
  id v143;
  _QWORD v144[4];
  NSObject *v145;
  id v146[2];
  uint8_t buf[4];
  void *v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  id v152;
  __int16 v153;
  double v154;

  v5 = a3;
  if (!-[FMDConservativeLocatorPublisher startedPublishing](self, "startedPublishing"))
  {
    v17 = sub_100052EEC();
    v6 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10022D538(v6);
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    if (!v6)
    {
LABEL_12:

      goto LABEL_13;
    }
    v7 = sub_100052EEC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10022D3F4(self, v6, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject horizontalAccuracy](v6, "horizontalAccuracy"));
    objc_msgSend(v9, "doubleValue");
    v11 = v10 < 0.0;

    if (v11)
    {
      v12 = sub_100052EEC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject horizontalAccuracy](v6, "horizontalAccuracy"));
        objc_msgSend(v15, "doubleValue");
        *(_DWORD *)buf = 138412546;
        v148 = v14;
        v149 = 2048;
        v150 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ Location has a -ve horizontalAccuracy (%.2f). Not using it", buf, 0x16u);

      }
LABEL_57:

      goto LABEL_12;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject horizontalAccuracy](v6, "horizontalAccuracy"));
    objc_msgSend(v18, "doubleValue");
    v20 = v19;
    -[NSNumber doubleValue](self->_startThreshold, "doubleValue");
    v22 = v20 > v21;

    if (v22)
    {
      v23 = sub_100052EEC();
      v13 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject horizontalAccuracy](v6, "horizontalAccuracy"));
        objc_msgSend(v25, "doubleValue");
        v27 = v26;
        -[NSNumber doubleValue](self->_startThreshold, "doubleValue");
        *(_DWORD *)buf = 138412802;
        v148 = v24;
        v149 = 2048;
        v150 = v27;
        v151 = 2048;
        v152 = v28;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ Location has a horizontalAccuracy of %.2f > start threshold %.2f. Not using it", buf, 0x20u);

      }
      goto LABEL_57;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject timestamp](v6, "timestamp"));
    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    v31 = v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher launchDate](self, "launchDate"));
    objc_msgSend(v32, "timeIntervalSinceReferenceDate");
    v34 = v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher cachedLocationValidityTimeInterval](self, "cachedLocationValidityTimeInterval"));
    objc_msgSend(v35, "doubleValue");
    v37 = v36;

    if (v31 <= v34 - v37)
    {
      v55 = sub_100052EEC();
      v13 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
        *(_DWORD *)buf = 138412290;
        v148 = v56;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ Location is really old. Waiting for a newer one", buf, 0xCu);

      }
      goto LABEL_57;
    }
    if (v31 < v34)
    {
      v38 = sub_100052EEC();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
        -[NSNumber doubleValue](self->_cachedLocationValidityTimeInterval, "doubleValue");
        *(_DWORD *)buf = 138412546;
        v148 = v40;
        v149 = 2048;
        v150 = v41;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%@ Location is an old cached one but not older than %.0f seconds before the start of this cycle. Considering it for later use", buf, 0x16u);

      }
      v42 = 0;
      v43 = 1;
      goto LABEL_23;
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject horizontalAccuracy](v6, "horizontalAccuracy"));
    objc_msgSend(v57, "doubleValue");
    v59 = v58;
    -[NSNumber doubleValue](self->_endThreshold, "doubleValue");
    v61 = v59 > v60;

    if (!v61)
    {
      v88 = sub_100052EEC();
      v89 = objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
        -[NSNumber doubleValue](self->_endThreshold, "doubleValue");
        *(_DWORD *)buf = 138412546;
        v148 = v90;
        v149 = 2048;
        v150 = v91;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "%@ Location has accuracy below the end threshold %f. Publishing it immediately & finishing the locate cycle", buf, 0x16u);

      }
      -[FMDConservativeLocatorPublisher setStartedPublishing:](self, "setStartedPublishing:", 0);
      -[FMDConservativeLocatorPublisher _cancelPublishTimer](self, "_cancelPublishTimer");
      -[FMDConservativeLocatorPublisher _publishResultLocation:reason:](self, "_publishResultLocation:reason:", v6, 3);
      goto LABEL_12;
    }
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject horizontalAccuracy](v6, "horizontalAccuracy"));
    objc_msgSend(v62, "doubleValue");
    v64 = v63;
    -[NSNumber doubleValue](self->_currentThreshold, "doubleValue");
    v66 = v64 < v65;

    if (v66)
    {
      v67 = sub_100052EEC();
      v68 = objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
        -[NSNumber doubleValue](self->_currentThreshold, "doubleValue");
        v71 = v70;
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher publishTimeInterval](self, "publishTimeInterval"));
        *(_DWORD *)buf = 138412802;
        v148 = v69;
        v149 = 2048;
        v150 = v71;
        v151 = 2048;
        v152 = objc_msgSend(v72, "longValue");
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%@ Location has accuracy within current publish threshold of %.2f. Publishing it within the next %ld seconds", buf, 0x20u);

      }
      do
      {
        ++self->_currentDecayMultiplier;
        -[NSNumber doubleValue](self->_startThreshold, "doubleValue");
        v74 = v73;
        -[NSNumber doubleValue](self->_decayFactor, "doubleValue");
        v76 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(v74 * exp(-(v75 * (double)self->_currentDecayMultiplier))));
        v77 = (NSNumber *)objc_claimAutoreleasedReturnValue(v76);
        currentThreshold = self->_currentThreshold;
        self->_currentThreshold = v77;

        -[NSNumber doubleValue](self->_currentThreshold, "doubleValue");
        v80 = v79;
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject horizontalAccuracy](v6, "horizontalAccuracy"));
        objc_msgSend(v81, "doubleValue");
        v83 = v80 < v82;

      }
      while (!v83);
      v84 = sub_100052EEC();
      v85 = objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
        -[NSNumber doubleValue](self->_currentThreshold, "doubleValue");
        *(_DWORD *)buf = 138412546;
        v148 = v86;
        v149 = 2048;
        v150 = v87;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%@ New publish threshold is %.2f", buf, 0x16u);

      }
      v43 = 1;
      v42 = 2;
    }
    else
    {
      v43 = 0;
      v42 = 0;
    }
    v107 = objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher lastLocation](self, "lastLocation"));
    if (!v107)
    {
      v108 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject horizontalAccuracy](v6, "horizontalAccuracy"));
      objc_msgSend(v108, "doubleValue");
      v110 = v109;
      -[NSNumber doubleValue](self->_startThreshold, "doubleValue");
      v112 = v110 > v111;

      if (v112)
        goto LABEL_65;
      v113 = sub_100052EEC();
      v107 = objc_claimAutoreleasedReturnValue(v113);
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        v114 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
        -[NSNumber doubleValue](self->_startThreshold, "doubleValue");
        *(_DWORD *)buf = 138412546;
        v148 = v114;
        v149 = 2048;
        v150 = v115;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "%@ This is the first location with accuracy below the start threshold %.2f. Publishing it immediately", buf, 0x16u);

      }
      v43 = 2;
      v42 = 1;
    }

LABEL_65:
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher lastLocation](self, "lastLocation"));

    if (!v116)
      goto LABEL_24;
    if (!-[NSObject locationType](v6, "locationType"))
      goto LABEL_24;
    v117 = -[NSObject locationType](v6, "locationType");
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher lastLocation](self, "lastLocation"));
    LOBYTE(v117) = v117 == objc_msgSend(v118, "locationType");

    if ((v117 & 1) != 0)
      goto LABEL_24;
    v119 = objc_alloc((Class)CLLocation);
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher lastLocation](self, "lastLocation"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "latitude"));
    objc_msgSend(v121, "doubleValue");
    v123 = v122;
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher lastLocation](self, "lastLocation"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "longitude"));
    objc_msgSend(v125, "doubleValue");
    v39 = objc_msgSend(v119, "initWithLatitude:longitude:", v123, v126);

    v127 = objc_alloc((Class)CLLocation);
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject latitude](v6, "latitude"));
    objc_msgSend(v128, "doubleValue");
    v130 = v129;
    v131 = objc_claimAutoreleasedReturnValue(-[NSObject longitude](v6, "longitude"));
    objc_msgSend((id)v131, "doubleValue");
    v133 = objc_msgSend(v127, "initWithLatitude:longitude:", v130, v132);

    -[NSObject distanceFromLocation:](v39, "distanceFromLocation:", v133);
    v135 = v134;
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher minimumDistance](self, "minimumDistance"));
    objc_msgSend(v136, "doubleValue");
    LOBYTE(v131) = v135 < v137;

    if ((v131 & 1) == 0)
    {
      v138 = sub_100052EEC();
      v139 = objc_claimAutoreleasedReturnValue(v138);
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
      {
        v140 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
        v141 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher lastLocation](self, "lastLocation"));
        v142 = objc_msgSend(v141, "locationType");
        v143 = -[NSObject locationType](v6, "locationType");
        *(_DWORD *)buf = 138413058;
        v148 = v140;
        v149 = 2048;
        v150 = (uint64_t)v142;
        v151 = 2048;
        v152 = v143;
        v153 = 2048;
        v154 = v135;
        _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "%@ Location type changed from %ld to %ld with distance traveled %.2lf. Publishing it immediately", buf, 0x2Au);

      }
      v43 = 2;
      v42 = 4;
    }

LABEL_23:
LABEL_24:
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher lastLocation](self, "lastLocation"));
    if (!v44)
      goto LABEL_26;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject horizontalAccuracy](v6, "horizontalAccuracy"));
    objc_msgSend(v45, "doubleValue");
    v47 = v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher lastLocation](self, "lastLocation"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "horizontalAccuracy"));
    objc_msgSend(v49, "doubleValue");
    v51 = v47 > v50;

    if (!v51)
    {
LABEL_26:
      v52 = sub_100052EEC();
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
        *(_DWORD *)buf = 138412290;
        v148 = v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%@ Storing this location as the best last known location in this locate cycle", buf, 0xCu);

      }
      -[FMDConservativeLocatorPublisher setLastLocation:](self, "setLastLocation:", v6);
    }
    if (v43)
    {
      if (v43 == 1)
      {
        -[FMDConservativeLocatorPublisher _cancelPublishTimer](self, "_cancelPublishTimer");
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher nextPublishTimerFireDate](self, "nextPublishTimerFireDate"));
        if (!v92)
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher publishTimeInterval](self, "publishTimeInterval"));
          objc_msgSend(v93, "doubleValue");
          v95 = v94;

          v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v95));
          -[FMDConservativeLocatorPublisher setNextPublishTimerFireDate:](self, "setNextPublishTimerFireDate:", v92);
        }
        objc_msgSend(v92, "timeIntervalSinceNow");
        if (v96 >= 0.0)
          v97 = v96;
        else
          v97 = 0.0;
        v98 = sub_100052EEC();
        v99 = objc_claimAutoreleasedReturnValue(v98);
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          v100 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
          *(_DWORD *)buf = 138412546;
          v148 = v100;
          v149 = 2048;
          v150 = (uint64_t)v97;
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "%@ Scheduling the location to be published in %ld seconds", buf, 0x16u);

        }
        objc_initWeak((id *)buf, self);
        v101 = objc_alloc((Class)FMDispatchTimer);
        v102 = &_dispatch_main_q;
        v144[0] = _NSConcreteStackBlock;
        v144[1] = 3221225472;
        v144[2] = sub_1000B0BBC;
        v144[3] = &unk_1002C4D48;
        objc_copyWeak(v146, (id *)buf);
        v6 = v6;
        v145 = v6;
        v146[1] = (id)v42;
        v103 = objc_msgSend(v101, "initWithQueue:timeout:completion:", &_dispatch_main_q, v144, v97);
        -[FMDConservativeLocatorPublisher setPublishTimer:](self, "setPublishTimer:", v103);

        v104 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher publishTimer](self, "publishTimer"));
        objc_msgSend(v104, "start");

        objc_destroyWeak(v146);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        -[FMDConservativeLocatorPublisher _cancelPublishTimer](self, "_cancelPublishTimer");
        -[FMDConservativeLocatorPublisher _publishResultLocation:reason:](self, "_publishResultLocation:reason:", v6, v42);
      }
      goto LABEL_12;
    }
    v105 = sub_100052EEC();
    v13 = objc_claimAutoreleasedReturnValue(v105);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
      *(_DWORD *)buf = 138412290;
      v148 = v106;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ Not publishing this location", buf, 0xCu);

    }
    goto LABEL_57;
  }
LABEL_13:

}

- (void)flushLocations
{
  id v3;
  unsigned int v4;
  id v5;

  -[FMDConservativeLocatorPublisher _cancelPublishTimer](self, "_cancelPublishTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher lastLocation](self, "lastLocation"));
  if (v5)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher lastPublishedLocation](self, "lastPublishedLocation"));
    if (v5 == v3)
    {

    }
    else
    {
      v4 = -[FMDConservativeLocatorPublisher startedPublishing](self, "startedPublishing");

      if (v4)
      {
        -[FMDConservativeLocatorPublisher _publishResultLocation:reason:](self, "_publishResultLocation:reason:", v5, 5);
        -[FMDConservativeLocatorPublisher setLastLocation:](self, "setLastLocation:", 0);
      }
    }
  }
  -[FMDConservativeLocatorPublisher setStartedPublishing:](self, "setStartedPublishing:", 0);

}

- (void)_publishResultLocation:(id)a3 reason:(int64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int64_t v15;

  v6 = a3;
  v7 = sub_100052EEC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher fm_logID](self, "fm_logID"));
    v12 = 138412546;
    v13 = v9;
    v14 = 2048;
    v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Publishing the location to the server for reason %li", (uint8_t *)&v12, 0x16u);

  }
  -[FMDConservativeLocatorPublisher _cancelPublishTimer](self, "_cancelPublishTimer");
  -[FMDConservativeLocatorPublisher setLastPublishedLocation:](self, "setLastPublishedLocation:", v6);
  v10 = objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher publishingBlock](self, "publishingBlock"));
  v11 = (void *)v10;
  if (v10)
    (*(void (**)(uint64_t, _QWORD, id, int64_t))(v10 + 16))(v10, 0, v6, a4);

}

- (void)_cancelPublishTimer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher publishTimer](self, "publishTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDConservativeLocatorPublisher publishTimer](self, "publishTimer"));
    objc_msgSend(v4, "cancel");

    -[FMDConservativeLocatorPublisher setPublishTimer:](self, "setPublishTimer:", 0);
    -[FMDConservativeLocatorPublisher setNextPublishTimerFireDate:](self, "setNextPublishTimerFireDate:", 0);
  }
}

- (NSNumber)startThreshold
{
  return self->_startThreshold;
}

- (void)setStartThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_startThreshold, a3);
}

- (NSNumber)endThreshold
{
  return self->_endThreshold;
}

- (void)setEndThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_endThreshold, a3);
}

- (NSNumber)decayFactor
{
  return self->_decayFactor;
}

- (void)setDecayFactor:(id)a3
{
  objc_storeStrong((id *)&self->_decayFactor, a3);
}

- (NSNumber)publishTimeInterval
{
  return self->_publishTimeInterval;
}

- (void)setPublishTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_publishTimeInterval, a3);
}

- (NSNumber)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(id)a3
{
  objc_storeStrong((id *)&self->_minimumDistance, a3);
}

- (NSNumber)cachedLocationValidityTimeInterval
{
  return self->_cachedLocationValidityTimeInterval;
}

- (void)setCachedLocationValidityTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLocationValidityTimeInterval, a3);
}

- (id)publishingBlock
{
  return self->_publishingBlock;
}

- (void)setPublishingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)startedPublishing
{
  return self->_startedPublishing;
}

- (void)setStartedPublishing:(BOOL)a3
{
  self->_startedPublishing = a3;
}

- (NSDate)launchDate
{
  return self->_launchDate;
}

- (void)setLaunchDate:(id)a3
{
  objc_storeStrong((id *)&self->_launchDate, a3);
}

- (NSNumber)currentThreshold
{
  return self->_currentThreshold;
}

- (void)setCurrentThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_currentThreshold, a3);
}

- (int)currentDecayMultiplier
{
  return self->_currentDecayMultiplier;
}

- (void)setCurrentDecayMultiplier:(int)a3
{
  self->_currentDecayMultiplier = a3;
}

- (FMGeoLocatable)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (FMGeoLocatable)lastPublishedLocation
{
  return self->_lastPublishedLocation;
}

- (void)setLastPublishedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastPublishedLocation, a3);
}

- (FMDispatchTimer)publishTimer
{
  return self->_publishTimer;
}

- (void)setPublishTimer:(id)a3
{
  objc_storeStrong((id *)&self->_publishTimer, a3);
}

- (NSDate)nextPublishTimerFireDate
{
  return self->_nextPublishTimerFireDate;
}

- (void)setNextPublishTimerFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextPublishTimerFireDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextPublishTimerFireDate, 0);
  objc_storeStrong((id *)&self->_publishTimer, 0);
  objc_storeStrong((id *)&self->_lastPublishedLocation, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_currentThreshold, 0);
  objc_storeStrong((id *)&self->_launchDate, 0);
  objc_storeStrong(&self->_publishingBlock, 0);
  objc_storeStrong((id *)&self->_cachedLocationValidityTimeInterval, 0);
  objc_storeStrong((id *)&self->_minimumDistance, 0);
  objc_storeStrong((id *)&self->_publishTimeInterval, 0);
  objc_storeStrong((id *)&self->_decayFactor, 0);
  objc_storeStrong((id *)&self->_endThreshold, 0);
  objc_storeStrong((id *)&self->_startThreshold, 0);
}

@end
