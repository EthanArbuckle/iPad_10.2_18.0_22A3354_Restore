@implementation NIServerHomeDeviceSession

- (NIServerHomeDeviceSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  unsigned int v32;
  BOOL v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  char *v39;
  void *v41;
  void *v42;
  __int128 v43;
  objc_super v44;

  v9 = a3;
  v10 = a4;
  v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(NIHomeDeviceConfiguration, v13))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerHomeDeviceSession.mm"), 383, CFSTR("NIServerHomeDeviceSession given invalid configuration."));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));

  if (!v14)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerHomeDeviceSession.mm"), 384, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourcesManager.serverSessionIdentifier"));

  }
  v44.receiver = self;
  v44.super_class = (Class)NIServerHomeDeviceSession;
  v15 = -[NIServerBaseSession initWithResourcesManager:configuration:error:](&v44, "initWithResourcesManager:configuration:error:", v9, v10, a5);
  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uwbResource"));
    v17 = (void *)*((_QWORD *)v15 + 29);
    *((_QWORD *)v15 + 29) = v16;

    if (v9)
      objc_msgSend(v9, "protobufLogger");
    else
      v43 = 0uLL;
    sub_1000145E8((uint64_t)(v15 + 48), &v43);
    v18 = (std::__shared_weak_count *)*((_QWORD *)&v43 + 1);
    if (*((_QWORD *)&v43 + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&v43 + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v15[200] = 100;
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientConnectionQueue"));
    v22 = (void *)*((_QWORD *)v15 + 10);
    *((_QWORD *)v15 + 10) = v21;

    v23 = objc_msgSend(v10, "copy");
    v24 = (void *)*((_QWORD *)v15 + 84);
    *((_QWORD *)v15 + 84) = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
    v27 = (void *)*((_QWORD *)v15 + 11);
    *((_QWORD *)v15 + 11) = v26;

    v15[96] = 0;
    *((_QWORD *)v15 + 26) = 3;
    v28 = operator new(0x88uLL);
    v28[1] = 0;
    v28[2] = 0;
    *v28 = off_100809EB8;
    *(_QWORD *)&v43 = sub_1002AD140((_BYTE *)v28 + 24);
    *((_QWORD *)&v43 + 1) = v28;
    sub_1000145E8((uint64_t)(v15 + 352), &v43);
    v29 = (std::__shared_weak_count *)*((_QWORD *)&v43 + 1);
    if (*((_QWORD *)&v43 + 1))
    {
      v30 = (unint64_t *)(*((_QWORD *)&v43 + 1) + 8);
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    v32 = objc_msgSend(*((id *)v15 + 29), "currentServiceState");
    v33 = 1;
    if (v32 != 1)
      v33 = objc_msgSend(*((id *)v15 + 29), "currentServiceState") == 2;
    v15[97] = v33;
    v15[98] = 1;
    atomic_store(1u, (unsigned __int8 *)v15 + 368);
    v34 = objc_alloc_init((Class)NSOperationQueue);
    v35 = (void *)*((_QWORD *)v15 + 47);
    *((_QWORD *)v15 + 47) = v34;

    objc_msgSend(*((id *)v15 + 47), "setUnderlyingQueue:", *((_QWORD *)v15 + 10));
    v36 = objc_alloc_init((Class)CMMotionManager);
    v37 = (void *)*((_QWORD *)v15 + 48);
    *((_QWORD *)v15 + 48) = v36;

    objc_msgSend(*((id *)v15 + 48), "setMagnetometerUpdateInterval:", 0.05);
    *((_QWORD *)v15 + 69) = 0;
    sub_100186C64((uint64_t)(v15 + 560));
    *((_QWORD *)v15 + 77) = 1;
    *(_OWORD *)(v15 + 600) = xmmword_100471388;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerHomeDeviceService sharedInstance](NIServerHomeDeviceService, "sharedInstance"));
    objc_msgSend(v38, "addServiceClient:identifier:configuration:", v15, *((_QWORD *)v15 + 11), *((_QWORD *)v15 + 84));

    v39 = v15;
  }

  return (NIServerHomeDeviceSession *)v15;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (BOOL)supportsSessionObservers
{
  return 1;
}

- (id)configure
{
  NSObject *v3;
  NIHomeDeviceConfiguration *configuration;
  void *v5;
  NSObject *v6;
  const char *v7;
  id v8;
  unsigned int v10;
  BOOL v11;
  NIServerSessionResourceManager *v12;
  void *v13;
  NINearbyUpdatesEngine *v14;
  NIHomeDeviceConfiguration *v15;
  OS_dispatch_queue *clientQueue;
  void *v17;
  __shared_weak_count *cntrl;
  unint64_t *v19;
  unint64_t v20;
  NINearbyUpdatesEngine *v21;
  NINearbyUpdatesEngine *updatesEngine;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  int64_t v34;
  void *v35;
  BOOL v36;
  void *v37;
  int64_t v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *i;
  void *v44;
  int v45;
  id v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53[2];
  id v54;
  Logger *ptr;
  __shared_weak_count *v56;
  objc_super v57;
  _BYTE v58[128];
  NSErrorUserInfoKey v59;
  void *v60;
  uint8_t buf[4];
  NIHomeDeviceConfiguration *v62;
  char v63;
  NSErrorUserInfoKey v64;
  void *v65;
  NSErrorUserInfoKey v66;
  void *v67;
  NSErrorUserInfoKey v68;
  const __CFString *v69;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_configuration)
    sub_1003D9C5C();
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    *(_DWORD *)buf = 138412290;
    v62 = configuration;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-home,Configure. Configuration given: %@", buf, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v5, "BOOLForKey:", CFSTR("NIHomeDisable")))
  {
    v6 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "#ses-home,NIHomeDisable set in defaults. Skip configuring session";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (!self->_isRunning)
  {
    v10 = -[PRUWBServiceProviding currentServiceState](self->_uwbResource, "currentServiceState");
    v11 = 1;
    if (v10 != 1)
      v11 = -[PRUWBServiceProviding currentServiceState](self->_uwbResource, "currentServiceState") == 2;
    self->_uwbSystemAvailable = v11;
    self->_shouldHandleUWBStateReadinessUpdates = 1;
    -[NIServerHomeDeviceSession setupBackoffResumeManager](self, "setupBackoffResumeManager");
    v57.receiver = self;
    v57.super_class = (Class)NIServerHomeDeviceSession;
    v12 = -[NIServerBaseSession resourcesManager](&v57, "resourcesManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (!self->_updatesEngine)
    {
      v14 = [NINearbyUpdatesEngine alloc];
      v15 = self->_configuration;
      clientQueue = self->_clientQueue;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "analytics"));
      cntrl = self->_pbLogger.__cntrl_;
      ptr = self->_pbLogger.__ptr_;
      v56 = cntrl;
      if (cntrl)
      {
        v19 = (unint64_t *)((char *)cntrl + 8);
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      v54 = 0;
      v21 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:](v14, "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:", v15, clientQueue, self, self, v17, &ptr, &v54);
      v8 = v54;
      updatesEngine = self->_updatesEngine;
      self->_updatesEngine = v21;

      v23 = (std::__shared_weak_count *)v56;
      if (v56)
      {
        v24 = (unint64_t *)((char *)v56 + 8);
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }

      if (!self->_updatesEngine)
        goto LABEL_62;

    }
    if (!-[NIHomeDeviceConfiguration allowedDevices](self->_configuration, "allowedDevices"))
    {
      v68 = NSLocalizedDescriptionKey;
      v69 = CFSTR("NIRelationshipSpecifierNone is not a valid relationship specifier for this configuration.");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v27));
      goto LABEL_61;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](self->_configuration, "sessionKey"));
    v27 = v26;
    if (v26 && objc_msgSend(v26, "length") != (id)16)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sessionKey has invalid length. Expected: %d bytes. Got: %lu"), 16, objc_msgSend(v27, "length")));
      v66 = NSLocalizedDescriptionKey;
      v67 = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v32));

      goto LABEL_61;
    }
    if (!-[NIHomeDeviceConfiguration isAnchor](self->_configuration, "isAnchor")
      && -[NIHomeDeviceConfiguration antennaDiversityOverride](self->_configuration, "antennaDiversityOverride"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("antenna diversity option is invalid for responders")));
      v64 = NSLocalizedDescriptionKey;
      v65 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1));
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v29));

LABEL_61:
LABEL_62:

      goto LABEL_12;
    }
    v30 = *((_DWORD *)sub_100004784() + 144);
    if (-[NIHomeDeviceConfiguration isAnchor](self->_configuration, "isAnchor"))
    {
      self->_currentSessionRole = 0;
      if (!self->_initiatorSession.__ptr_ && self->_uwbSystemAvailable)
      {
        -[NIServerHomeDeviceSession _prepareServiceRequestWithConfig:](self, "_prepareServiceRequestWithConfig:", sub_1003610AC(v30));
        if (!v63)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to prepare service request.")));
          v59 = NSLocalizedDescriptionKey;
          v60 = v47;
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
          v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v48));

          goto LABEL_61;
        }
        -[NIServerHomeDeviceSession _buildRoseSession:](self, "_buildRoseSession:", buf);
        if (!v53[0] || !*(_BYTE *)(v53[0] + 682))
        {
          v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
          sub_10001AE68((uint64_t)v53);
          goto LABEL_61;
        }
        sub_100021C24(&self->_initiatorSession.__ptr_, v53);
        sub_10001AE68((uint64_t)v53);
      }
    }
    else
    {
      self->_currentSessionRole = 1;
    }
    v33 = sub_100361058(v30);
    v34 = 10;
    if (!v33)
      v34 = 0;
    self->_recommendedProcessingOptions.regionSizeCategory = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("NIHomeLocalRegionSizeRecommendationOverride")));
    v36 = v35 == 0;

    if (v36)
    {
LABEL_51:
      v39 = objc_alloc_init((Class)NSMutableArray);
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration monitoredRegions](self->_configuration, "monitoredRegions"));
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v42)
              objc_enumerationMutation(v40);
            v44 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            if (!objc_msgSend(v44, "regionSizeCategory"))
              objc_msgSend(v39, "addObject:", v44);
          }
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        }
        while (v41);
      }

      v45 = -[NIServerHomeDeviceSession nominalCycleRate](self, "nominalCycleRate");
      v46 = objc_msgSend(v39, "copy");
      sub_100211BAC((uint64_t)&self->_handoffCAManager, v46, v45);

      v8 = 0;
      goto LABEL_61;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("NIHomeLocalRegionSizeRecommendationOverride")));
    if ((objc_msgSend(v37, "isEqualToString:", CFSTR("Default")) & 1) != 0)
    {
      v38 = 0;
    }
    else
    {
      if (!objc_msgSend(v37, "isEqualToString:", CFSTR("Large")))
      {
LABEL_50:

        goto LABEL_51;
      }
      v38 = 10;
    }
    self->_recommendedProcessingOptions.regionSizeCategory = v38;
    goto LABEL_50;
  }
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v7 = "#ses-home,Session is running, skip re-configure";
    goto LABEL_10;
  }
LABEL_11:
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)run
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NIServerSessionResourceManager *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  CBAdvertiser *v16;
  CBAdvertiser *leechingAidingAdvertiser;
  void *v18;
  void *v19;
  void *v20;
  NIServerHomeDeviceSession *v21;
  void *v22;
  NIServerHomeDeviceSession *v23;
  _QWORD *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  id v34;
  char v35;
  id v36;
  void *v37;
  OS_dispatch_queue *clientQueue;
  _QWORD *v39;
  NSObject *v40;
  uint8_t v42[8];
  _QWORD v43[4];
  id v44;
  _QWORD block[4];
  id v46;
  NIServerHomeDeviceSession *v47;
  void *__p[2];
  uint64_t v49;
  uint8_t buf[16];
  uint64_t v51;
  objc_super v52;
  _BYTE v53[12];
  _QWORD v54[3];
  _QWORD *v55;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("NIHomeDisable")))
  {
    v4 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-home,NIHomeDisable set in defaults. Skip running session", buf, 2u);
    }
    v5 = 0;
    goto LABEL_49;
  }
  if (self->_currentSessionRole != 100)
  {
    v6 = sub_10001D534();
    atomic_store(sub_1000227DC((uint64_t)v6), (unsigned __int8 *)&self->_wifiServiceAllowsRanging);
    v52.receiver = self;
    v52.super_class = (Class)NIServerHomeDeviceSession;
    v7 = -[NIServerBaseSession resourcesManager](&v52, "resourcesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "btResource"));
    objc_msgSend(v9, "setDeviceRelationshipFlags:", -[NIHomeDeviceConfiguration allowedDevices](self->_configuration, "allowedDevices"));

    if (-[NIServerHomeDeviceSession _isWifiRangingAllowed](self, "_isWifiRangingAllowed"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "btResource"));
      objc_msgSend(v10, "setWifiRangingActiveAdvertisement");
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "btResource"));
      objc_msgSend(v10, "clearWifiRangingActiveAdvertisement");
    }

    if (self->_isRunning)
    {
      v11 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-home,Session is running, return", buf, 2u);
      }
      v5 = 0;
LABEL_48:

      goto LABEL_49;
    }
    self->_firstWifiMeasurementsReceived = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "btResource"));
    objc_msgSend(v12, "startAdvertising");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("HomeDeviceSessionBTLeechingEnabled"));

    if (v14)
    {
      v15 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-home,Disable UWB-aided handoff with HomeDeviceSessionBTLeechingEnabled", buf, 2u);
      }
      v16 = objc_opt_new(CBAdvertiser);
      leechingAidingAdvertiser = self->_leechingAidingAdvertiser;
      self->_leechingAidingAdvertiser = v16;

      -[CBAdvertiser setDispatchQueue:](self->_leechingAidingAdvertiser, "setDispatchQueue:", self->_clientQueue);
      -[CBAdvertiser setLabel:](self->_leechingAidingAdvertiser, "setLabel:", CFSTR("ProximityLeechingAidForHomeDeviceSession"));
      -[CBAdvertiser setAdvertiseRate:](self->_leechingAidingAdvertiser, "setAdvertiseRate:", 50);
      -[CBAdvertiser setNearbyActionType:](self->_leechingAidingAdvertiser, "setNearbyActionType:", 17);
      -[CBAdvertiser setNearbyActionFlags:](self->_leechingAidingAdvertiser, "setNearbyActionFlags:", 64);
      -[CBAdvertiser activateWithCompletion:](self->_leechingAidingAdvertiser, "activateWithCompletion:", &stru_10080D780);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "devicePresenceResource"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "internalObserver"));
      objc_msgSend(v19, "startBTScanningWithMaxRateForPrototypeHomeSession:", self);

    }
    if ((-[NIConfiguration suspensionPolicy](self->_configuration, "suspensionPolicy") & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "btResource"));
      objc_msgSend(v20, "allowScreenOffOperation:", 1);

    }
    v21 = self;
    sub_10000BF04(buf, (char *)-[NSString UTF8String](v21->_containerUniqueIdentifier, "UTF8String"));
    v22 = sub_10001D534();
    if (SHIBYTE(v51) < 0)
    {
      sub_100004678(__p, *(void **)buf, *(unint64_t *)&buf[8]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)buf;
      v49 = v51;
    }
    v23 = v21;
    v54[0] = off_10080D7D8;
    v54[1] = v23;
    v55 = v54;
    sub_10001DCDC((uint64_t)v22, (__int128 *)__p, (uint64_t)v54, self->_clientQueue);
    v24 = v55;
    if (v55 == v54)
    {
      v25 = 4;
      v24 = v54;
    }
    else
    {
      if (!v55)
      {
LABEL_30:
        if (SHIBYTE(v49) < 0)
          operator delete(__p[0]);
        objc_msgSend(v3, "doubleForKey:", CFSTR("HomeDeviceInitialScanBurstDurationSecondsOverride"));
        v27 = v26;
        v28 = 5.0;
        if (v26 > 0.0)
        {
          v29 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v53 = 134217984;
            *(double *)&v53[4] = v27;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ses-home,* Initial scan burst duration set from defaults write: %0.2f seconds", v53, 0xCu);
          }
          v28 = v27;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "btResource"));
        objc_msgSend(v30, "startScanningWithBurstPeriod:", v28);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lifecycleSupervisor"));
        objc_msgSend(v31, "runWithConfigurationCalled");

        v32 = sub_10000883C();
        sub_100211BE0((uint64_t)&v23->_handoffCAManager, v32);
        sub_1002AD984((uint64_t)v23->_wifiCAManager.__ptr_, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "btResource"));
        v34 = objc_msgSend(v33, "nonConnectableAdvertisingAddress");
        if (v35)
        {
          *(_QWORD *)v53 = v34;
          v36 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v53, 6);
          v37 = sub_10001D534();
          sub_10001D5C8((uint64_t)v37, v36);

        }
        if (v23->_initiatorSession.__ptr_)
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession _triggerInitiatorRanging](v23, "_triggerInitiatorRanging"));
        else
          v5 = 0;
        self->_isRunning = v5 == 0;
        v23->_shouldDeliverUpdates = v5 == 0;
        if (self->_isRunning)
        {
          clientQueue = self->_clientQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1001DDDC0;
          block[3] = &unk_1007FA518;
          v46 = v8;
          v47 = v23;
          dispatch_async((dispatch_queue_t)clientQueue, block);

        }
        objc_initWeak((id *)v53, v23);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_1001DDE20;
        v43[3] = &unk_10080D7A8;
        objc_copyWeak(&v44, (id *)v53);
        v39 = objc_retainBlock(v43);
        -[CMMotionManager startMagnetometerUpdatesToQueue:withHandler:](v23->_motionManager, "startMagnetometerUpdatesToQueue:withHandler:", v23->_operationQueue, v39);
        v40 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#ses-home,streaming raw magnetometer data started", v42, 2u);
        }

        objc_destroyWeak(&v44);
        objc_destroyWeak((id *)v53);

        if (SHIBYTE(v51) < 0)
          operator delete(*(void **)buf);

        goto LABEL_48;
      }
      v25 = 5;
    }
    (*(void (**)(void))(*v24 + 8 * v25))();
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003D9C84();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
LABEL_49:

  return v5;
}

- (id)pauseWithSource:(int64_t)a3
{
  void *v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  void *v7;
  double v8;
  objc_super v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  self->_isRunning = 0;
  self->_shouldDeliverUpdates = 0;
  sub_100186C64((uint64_t)&self->_cachedRegionUpdateEvent);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession _disableAllServicesAndSendHangupSignal:](self, "_disableAllServicesAndSendHangupSignal:", 0));
  v10.receiver = self;
  v10.super_class = (Class)NIServerHomeDeviceSession;
  v5 = -[NIServerBaseSession resourcesManager](&v10, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lifecycleSupervisor"));
  objc_msgSend(v7, "pauseCalled");

  v8 = sub_10000883C();
  sub_100211C40((uint64_t)&self->_handoffCAManager, v8);
  sub_1002AD334(self->_wifiCAManager.__ptr_);
  self->_firstWifiMeasurementsReceived = 0;
  return v4;
}

- (void)setupBackoffResumeManager
{
  NIHomeDeviceConfiguration *configuration;
  int v4;
  unsigned int v5;
  NSObject *v6;
  uint64_t *p_backoffResumeManager;
  __shared_weak_count *cntrl;
  NIServerHomeDeviceSession *v9;
  _QWORD *v10;
  NIServerHomeDeviceSession *v11;
  OS_dispatch_queue *clientQueue;
  NSString *containerUniqueIdentifier;
  NIServerHomeDeviceSession *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t (***v17)();
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  __int128 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  _QWORD v28[3];
  _QWORD *v29;
  uint64_t (**v30)();
  NIServerHomeDeviceSession *v31;
  uint64_t (***v32)();
  uint8_t buf[8];
  NIServerHomeDeviceSession *v34;
  uint8_t *v35;

  configuration = self->_configuration;
  if (!configuration)
    sub_1003D9D1C();
  v26 = 1;
  v27 = 0x3FF0000000000000;
  v25 = -[NIConfiguration suspensionPolicy](configuration, "suspensionPolicy") & 1;
  if (-[NIHomeDeviceConfiguration isAnchor](self->_configuration, "isAnchor"))
  {
    LOBYTE(v4) = 0;
    *(_WORD *)((char *)&v25 + 1) = 0;
  }
  else
  {
    BYTE1(v25) = (-[NIConfiguration suspensionPolicy](self->_configuration, "suspensionPolicy") & 2) != 0;
    v5 = -[NIConfiguration suspensionPolicy](self->_configuration, "suspensionPolicy");
    v4 = (v5 >> 2) & 1;
    BYTE2(v25) = (v5 & 4) != 0;
    if (!self->_uwbSystemAvailable)
    {
      v6 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-home,Overriding lock screen only suspension policy: ENABLED.", buf, 2u);
      }
      LOBYTE(v4) = 1;
      BYTE2(v25) = 1;
    }
  }
  p_backoffResumeManager = (uint64_t *)&self->_backoffResumeManager;
  cntrl = self->_backoffResumeManager.__cntrl_;
  if (cntrl && (*((_QWORD *)cntrl + 1) & 0x8000000000000000) == 0)
  {
    buf[0] = v4;
    sub_100266370(*p_backoffResumeManager, buf);
    return;
  }
  v9 = self;
  v10 = operator new(0x118uLL);
  v10[1] = 0;
  v10[2] = 0;
  *v10 = off_10080A2E8;
  v11 = v9;
  *(_QWORD *)buf = off_10080D858;
  v34 = v11;
  v35 = buf;
  clientQueue = v9->_clientQueue;
  containerUniqueIdentifier = v9->_containerUniqueIdentifier;
  v30 = off_10080D8D8;
  v31 = v11;
  v32 = &v30;
  v14 = v31;
  v28[0] = off_10080D958;
  v28[1] = v14;
  v29 = v28;
  sub_100265B2C(v10 + 3, &v25, buf, clientQueue, containerUniqueIdentifier, &v30, v28);
  v15 = v29;
  if (v29 == v28)
  {
    v16 = 4;
    v15 = v28;
  }
  else
  {
    if (!v29)
      goto LABEL_16;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_16:
  v17 = v32;
  if (v32 == &v30)
  {
    v18 = 4;
    v17 = &v30;
  }
  else
  {
    if (!v32)
      goto LABEL_21;
    v18 = 5;
  }
  (*v17)[v18]();
LABEL_21:
  v19 = v35;
  if (v35 == buf)
  {
    v20 = 4;
    v19 = buf;
    goto LABEL_25;
  }
  if (v35)
  {
    v20 = 5;
LABEL_25:
    (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
  }
  *(_QWORD *)&v24 = v10 + 3;
  *((_QWORD *)&v24 + 1) = v10;
  sub_10001B020((uint64_t)&v24, v10 + 3, (uint64_t)(v10 + 3));
  sub_1000145E8((uint64_t)p_backoffResumeManager, &v24);
  v21 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v22 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  sub_100265F7C((uint64_t *)*p_backoffResumeManager);

}

- (BOOL)updateConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  id *p_configuration;
  uint64_t v7;
  id v8;
  unsigned __int8 v9;
  NSObject *v10;
  _BOOL4 v11;
  NIHomeDeviceConfiguration *v12;
  NSObject *v13;
  NIHomeDeviceConfiguration *v14;
  const char *v15;
  NIHomeDeviceConfiguration *configuration;
  NIHomeDeviceConfiguration *v17;
  int v19;
  NIHomeDeviceConfiguration *v20;
  __int16 v21;
  id v22;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_isRunning)
  {
    v13 = qword_10085F520;
    v9 = 0;
    if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    configuration = self->_configuration;
    v19 = 138412546;
    v20 = configuration;
    v21 = 2112;
    v22 = v4;
    v15 = "#ses-home,Can't update configuration, not running\nOld: %@\nNew: %@";
    goto LABEL_13;
  }
  p_configuration = (id *)&self->_configuration;
  if (!v4
    || !*p_configuration
    || (v7 = objc_opt_class(NIHomeDeviceConfiguration, v5), (objc_opt_isKindOfClass(v4, v7) & 1) == 0))
  {
    v13 = qword_10085F520;
    v9 = 0;
    if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v14 = (NIHomeDeviceConfiguration *)*p_configuration;
    v19 = 138412546;
    v20 = v14;
    v21 = 2112;
    v22 = v4;
    v15 = "#ses-home,Can't update configuration, one is nil or wrong type\nOld: %@\nNew: %@";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, 0x16u);
    v9 = 0;
    goto LABEL_17;
  }
  v8 = objc_msgSend(v4, "copy");
  v9 = objc_msgSend(*p_configuration, "canUpdateToConfiguration:", v8);
  v10 = qword_10085F520;
  v11 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0)
  {
    if (v11)
    {
      v12 = (NIHomeDeviceConfiguration *)*p_configuration;
      v19 = 138412546;
      v20 = v12;
      v21 = 2112;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-home,Update configuration\nOld: %@\nNew: %@", (uint8_t *)&v19, 0x16u);
    }
    objc_storeStrong(p_configuration, v8);
  }
  else if (v11)
  {
    v17 = (NIHomeDeviceConfiguration *)*p_configuration;
    v19 = 138412546;
    v20 = v17;
    v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-home,Can't update configuration, parameters are too different\nOld: %@\nNew: %@", (uint8_t *)&v19, 0x16u);
  }

LABEL_17:
  return v9;
}

- (id)addObject:(id)a3
{
  id v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  id v13;
  id v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v12.receiver = self;
  v12.super_class = (Class)NIServerHomeDeviceSession;
  v5 = -[NIServerBaseSession resourcesManager](&v12, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v14 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession _addPeers:](self, "_addPeers:", v7));

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D9D44();
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lifecycleSupervisor"));
    objc_msgSend(v9, "failedToAddPeer");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lifecycleSupervisor"));
    v13 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v9, "startedDiscoveringPeersWithTokens:", v10);

  }
  return 0;
}

- (id)removeObject:(id)a3
{
  id v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  objc_super v16;
  id v17;
  NSErrorUserInfoKey v18;
  void *v19;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v16.receiver = self;
  v16.super_class = (Class)NIServerHomeDeviceSession;
  v5 = -[NIServerBaseSession resourcesManager](&v16, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v15.receiver = self;
  v15.super_class = (Class)NIServerHomeDeviceSession;
  v7 = -[NIServerBaseSession identifierFromDiscoveryToken:](&v15, "identifierFromDiscoveryToken:", v4);
  if (v8)
  {
    v9 = 0;
    -[NIServerHomeDeviceSession _removePeerObject:uwbIdentifier:withReason:](self, "_removePeerObject:uwbIdentifier:withReason:", v4, v7, 2);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Token %@ has no associated identifier."), v4));
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D9DC0();
    v18 = NSLocalizedDescriptionKey;
    v19 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v11));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lifecycleSupervisor"));
  v17 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  objc_msgSend(v12, "stoppedDiscoveringPeersWithTokens:", v13);

  return 0;
}

- (id)disableAllServices
{
  return -[NIServerHomeDeviceSession _disableAllServicesAndSendHangupSignal:](self, "_disableAllServicesAndSendHangupSignal:", 1);
}

- (BOOL)_isWifiRangingAllowed
{
  unsigned __int8 v3;
  unsigned __int8 v5;

  if ((-[NIConfiguration enabledGestures](self->_configuration, "enabledGestures") & 2) == 0)
    return 0;
  v3 = atomic_load((unsigned __int8 *)&self->_wifiServiceAllowsRanging);
  if ((v3 & 1) == 0)
    return 0;
  v5 = atomic_load((unsigned __int8 *)&self->_wifiRangingAllowedLockscreen);
  return v5 & 1;
}

- (void)_resumeWifiRanging
{
  NIServerSessionResourceManager *v3;
  void *v4;
  void *v5;
  _QWORD *next;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  __n128 buf;
  id v13;
  id v14;
  char v15;
  objc_super v16;

  if (-[NIServerHomeDeviceSession _isWifiRangingAllowed](self, "_isWifiRangingAllowed"))
  {
    v16.receiver = self;
    v16.super_class = (Class)NIServerHomeDeviceSession;
    v3 = -[NIServerBaseSession resourcesManager](&v16, "resourcesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btResource"));
    objc_msgSend(v5, "setWifiRangingActiveAdvertisement");

    if (self->_wifiSessions.__table_.__p2_.__value_)
    {
      next = self->_wifiSessions.__table_.__p1_.__value_.__next_;
      if (next)
      {
        sub_1001E7D98(&buf, next[3] + 120);
        if (v15)
        {

          v7 = next[3];
          sub_1001E7D98(&buf, v7 + 120);
          if (v15)
            sub_10002E2FC(v7, (uint64_t)&buf);
          sub_10000BA44();
        }
        v8 = next[2];
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configuration](self, "configuration"));
        if (objc_msgSend(v9, "isAnchor"))
          v10 = 2;
        else
          v10 = 1;
        sub_10002D868((uint64_t)&buf, v8, v10);

        sub_10002E2FC(next[3], (uint64_t)&buf);
      }
    }

  }
  else
  {
    v11 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      buf.n128_u16[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-home,wifi ranging is not allowed at this time", (uint8_t *)&buf, 2u);
    }
  }
}

- (void)_pauseWifiRanging
{
  NIServerSessionResourceManager *v3;
  void *v4;
  void *v5;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *>>> *i;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NIServerHomeDeviceSession;
  v3 = -[NIServerBaseSession resourcesManager](&v7, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btResource"));
  objc_msgSend(v5, "clearWifiRangingActiveAdvertisement");

  if (self->_wifiSessions.__table_.__p2_.__value_)
  {
    for (i = &self->_wifiSessions.__table_.__p1_; ; sub_10002DF44((uint64_t)i[3].__value_.__next_))
    {
      i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *>>> *)i->__value_.__next_;
      if (!i)
        break;
    }
  }

}

- (void)invalidate
{
  CBAdvertiser *leechingAidingAdvertiser;
  NIServerSessionResourceManager *v4;
  void *v5;
  void *v6;
  void *v7;
  BackoffResumeManager *ptr;
  CMMotionManager *motionManager;
  id v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;
  void *__p[2];
  uint64_t v16;
  void *v17[2];
  uint64_t v18;
  objc_super v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  self->_isRunning = 0;
  self->_shouldDeliverUpdates = 0;
  self->_shouldHandleUWBStateReadinessUpdates = 0;
  -[CBAdvertiser invalidate](self->_leechingAidingAdvertiser, "invalidate");
  leechingAidingAdvertiser = self->_leechingAidingAdvertiser;
  self->_leechingAidingAdvertiser = 0;

  v19.receiver = self;
  v19.super_class = (Class)NIServerHomeDeviceSession;
  v4 = -[NIServerBaseSession resourcesManager](&v19, "resourcesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "devicePresenceResource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "internalObserver"));
  objc_msgSend(v7, "stopBTScanningWithMaxRateForPrototypeHomeSession");

  sub_100186C64((uint64_t)&self->_cachedRegionUpdateEvent);
  ptr = self->_backoffResumeManager.__ptr_;
  if (ptr)
  {
    sub_100265CD4((uint64_t)ptr);
    sub_100180AF4(&self->_backoffResumeManager.__ptr_);
  }
  motionManager = self->_motionManager;
  self->_motionManager = 0;

  v10 = -[NIServerHomeDeviceSession disableAllServices](self, "disableAllServices");
  v11 = sub_10000883C();
  sub_100211C40((uint64_t)&self->_handoffCAManager, v11);
  sub_1002AD334(self->_wifiCAManager.__ptr_);
  sub_10000BF04(v17, (char *)-[NSString UTF8String](self->_containerUniqueIdentifier, "UTF8String"));
  v12 = sub_10001D534();
  if (SHIBYTE(v18) < 0)
  {
    sub_100004678(__p, v17[0], (unint64_t)v17[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v17;
    v16 = v18;
  }
  sub_10001DF00((uint64_t)v12, (const void **)__p);
  if (SHIBYTE(v16) < 0)
    operator delete(__p[0]);
  self->_firstWifiMeasurementsReceived = 0;
  v14.receiver = self;
  v14.super_class = (Class)NIServerHomeDeviceSession;
  -[NIServerBaseSession invalidate](&v14, "invalidate");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerHomeDeviceService sharedInstance](NIServerHomeDeviceService, "sharedInstance"));
  objc_msgSend(v13, "removeServiceClientWithIdentifier:", self->_containerUniqueIdentifier);

  if (SHIBYTE(v18) < 0)
    operator delete(v17[0]);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerHomeDeviceService sharedInstance](NIServerHomeDeviceService, "sharedInstance"));
  objc_msgSend(v3, "removeServiceClientWithIdentifier:", self->_containerUniqueIdentifier);

  v4.receiver = self;
  v4.super_class = (Class)NIServerHomeDeviceSession;
  -[NIServerHomeDeviceSession dealloc](&v4, "dealloc");
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)150;
}

- (unint64_t)requiresUWBToRun
{
  return 1;
}

- (unint64_t)requiresSpatialInteractionBluetoothResource
{
  return 2;
}

- (void)deviceDiscovered:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSString *containerUniqueIdentifier;
  NIServerSessionResourceManager *v10;
  void *v11;
  void *v12;
  _BOOL4 uwbSystemAvailable;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  int v25;
  int v26;
  unsigned int v27;
  int64_t regionSizeCategory;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _QWORD *v33;
  const char *v34;
  uint64_t v35;
  _QWORD *v36;
  const std::locale::facet *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  const std::locale::facet *v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  const std::locale::facet *v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  const std::locale::facet *v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  void *v53;
  double v54;
  Logger *ptr;
  id v56;
  void *v57;
  void *v58;
  unsigned int v59;
  NSObject *v60;
  const char *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  uint64_t *v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  double v74;
  char v75;
  NSObject *v76;
  id v77;
  const char *v78;
  const __CFString *v79;
  id v80;
  id v81;
  unint64_t *v82;
  unint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  unsigned __int8 v89;
  NSObject *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  int v95;
  double v96;
  NSObject *v97;
  _QWORD *v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  void *v102;
  __int128 v103;
  id v104;
  __int128 v105;
  uint64_t v106;
  objc_super v107;
  std::locale v108;
  _BYTE v109[22];
  __int16 v110;
  id v111;
  __int16 v112;
  int v113;
  __int128 v114;
  _BYTE buf[24];
  id v116[10];
  char v117;
  _BYTE v118[384];
  void *v119;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_currentSessionRole == 100)
    goto LABEL_118;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("HomeDeviceSessionBTLeechingEnabled"));

  v7 = qword_10085F520;
  v8 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      containerUniqueIdentifier = self->_containerUniqueIdentifier;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = containerUniqueIdentifier;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,Device discovered. Session Identifier: %@. Device: %@", buf, 0x16u);
    }
    v107.receiver = self;
    v107.super_class = (Class)NIServerHomeDeviceSession;
    v10 = -[NIServerBaseSession resourcesManager](&v107, "resourcesManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "wifiResource"));
    v101 = objc_msgSend(v12, "deviceCapabilities");

    if (objc_msgSend(v4, "isUwbCapable"))
      uwbSystemAvailable = self->_uwbSystemAvailable;
    else
      uwbSystemAvailable = 0;
    v100 = objc_msgSend(v4, "isWifiRangingCapable");
    v105 = xmmword_1004713A0;
    v106 = 1;
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (objc_msgSend(v4, "systemKeyRelationship"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cbDevice"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));

      if (!v15)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003D9E20();
        goto LABEL_117;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectForKey:", CFSTR("NIHomeDisableAllowListPolicy")));
      v17 = v16 == 0;

      if (v17)
        v18 = 0;
      else
        v18 = objc_msgSend(v102, "BOOLForKey:", CFSTR("NIHomeDisableAllowListPolicy"));
      v25 = sub_1001E035C(v15);
      v26 = v25;
      if ((uwbSystemAvailable & (v18 ^ 1)) == 1 && (v25 & 0x3FD) == 0x3E5)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003D9E4C();
        goto LABEL_117;
      }
      LOBYTE(v105) = -[NIServerHomeDeviceSession _biasCorrectionRequirementFromModelString:](self, "_biasCorrectionRequirementFromModelString:", v15);
      DWORD1(v105) = -[NIServerHomeDeviceSession _magneticFieldStrengthCheckOptionFromModelString:](self, "_magneticFieldStrengthCheckOptionFromModelString:", v15);
      v27 = sub_1003610AC(v26);
      LODWORD(v106) = -[NIServerHomeDeviceSession _intentPredictorConfigFromModelString:](self, "_intentPredictorConfigFromModelString:", v15);
      if ((id)-[NIServerHomeDeviceSession _regionCategoryFromModelString:](self, "_regionCategoryFromModelString:", v15) == (id)10)
      {
        regionSizeCategory = 10;
      }
      else
      {
        regionSizeCategory = self->_recommendedProcessingOptions.regionSizeCategory;
        if (regionSizeCategory != 10)
          regionSizeCategory = 0;
      }
      *((_QWORD *)&v105 + 1) = regionSizeCategory;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lifecycleSupervisor"));
      v99 = v27;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "discoveryToken"));
      v119 = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v119, 1));
      objc_msgSend(v29, "startedDiscoveringPeersWithTokens:", v31);

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "discoveryToken"));
      LOBYTE(v105) = -[NIServerHomeDeviceSession _biasCorrectionRequirementFromDiscoveryToken:](self, "_biasCorrectionRequirementFromDiscoveryToken:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "discoveryToken"));
      DWORD1(v105) = -[NIServerHomeDeviceSession _magneticFieldStrengthCheckOptionFromDiscoveryToken:](self, "_magneticFieldStrengthCheckOptionFromDiscoveryToken:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "discoveryToken"));
      v99 = -[NIServerHomeDeviceSession _homeAnchorVariantFromDiscoveryToken:](self, "_homeAnchorVariantFromDiscoveryToken:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "discoveryToken"));
      LODWORD(v106) = -[NIServerHomeDeviceSession _intentPredictorConfigFromDiscoveryToken:](self, "_intentPredictorConfigFromDiscoveryToken:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "discoveryToken"));
      v24 = -[NIServerHomeDeviceSession _regionCategoryFromDiscoveryToken:](self, "_regionCategoryFromDiscoveryToken:", v23);

      if (v24 == 10 || self->_recommendedProcessingOptions.regionSizeCategory == 10)
        *((_QWORD *)&v105 + 1) = 10;
      else
        *((_QWORD *)&v105 + 1) = 0;
    }
    v32 = (id)qword_10085F520;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000537E4((uint64_t)buf);
      v33 = sub_100054C60(&buf[16], (uint64_t)"require bias correction: ", 25);
      if ((_BYTE)v105)
        v34 = "yes";
      else
        v34 = "no";
      if ((_BYTE)v105)
        v35 = 3;
      else
        v35 = 2;
      v36 = sub_100054C60(v33, (uint64_t)v34, v35);
      std::ios_base::getloc((const std::ios_base *)((char *)v36 + *(_QWORD *)(*v36 - 24)));
      v37 = std::locale::use_facet(&v108, &std::ctype<char>::id);
      v38 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v37->__vftable[2].~facet_0)(v37, 10);
      std::locale::~locale(&v108);
      std::ostream::put(v36, v38);
      std::ostream::flush(v36);
      v39 = sub_100054C60(&buf[16], (uint64_t)"magnetic field strength check options: ", 39);
      v40 = (_QWORD *)std::ostream::operator<<(v39, DWORD1(v105));
      std::ios_base::getloc((const std::ios_base *)((char *)v40 + *(_QWORD *)(*v40 - 24)));
      v41 = std::locale::use_facet(&v108, &std::ctype<char>::id);
      v42 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v41->__vftable[2].~facet_0)(v41, 10);
      std::locale::~locale(&v108);
      std::ostream::put(v40, v42);
      std::ostream::flush(v40);
      v43 = sub_100054C60(&buf[16], (uint64_t)"region size category: ", 22);
      v44 = (_QWORD *)std::ostream::operator<<(v43, DWORD2(v105));
      std::ios_base::getloc((const std::ios_base *)((char *)v44 + *(_QWORD *)(*v44 - 24)));
      v45 = std::locale::use_facet(&v108, &std::ctype<char>::id);
      v46 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v45->__vftable[2].~facet_0)(v45, 10);
      std::locale::~locale(&v108);
      std::ostream::put(v44, v46);
      std::ostream::flush(v44);
      v47 = sub_100054C60(&buf[16], (uint64_t)"intent predictor config: ", 25);
      v48 = (_QWORD *)std::ostream::operator<<(v47, v106);
      std::ios_base::getloc((const std::ios_base *)((char *)v48 + *(_QWORD *)(*v48 - 24)));
      v49 = std::locale::use_facet(&v108, &std::ctype<char>::id);
      v50 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v49->__vftable[2].~facet_0)(v49, 10);
      std::locale::~locale(&v108);
      std::ostream::put(v48, v50);
      std::ostream::flush(v48);
      std::stringbuf::str(v116);
      *(_QWORD *)&buf[16] = v51;
      if (v117 < 0)
        operator delete(v116[8]);
      std::streambuf::~streambuf(v116);
      std::ios::~ios(v118);
      v52 = v109;
      if (v110 < 0)
        v52 = *(_BYTE **)v109;
      LODWORD(v114) = 136315138;
      *(_QWORD *)((char *)&v114 + 4) = v52;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#ses-home,processing options are %s", (uint8_t *)&v114, 0xCu);
      if (SHIBYTE(v110) < 0)
        operator delete(*(void **)v109);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NINearbyObject objectFromBluetoothDevice:](NINearbyObject, "objectFromBluetoothDevice:", v4));
    if (!v15)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D9EAC();
      goto LABEL_117;
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remote"));
    objc_msgSend(v53, "didDiscoverNearbyObject:", v15);

    if (self->_pbLogger.__ptr_)
    {
      v54 = sub_10000883C();
      ptr = self->_pbLogger.__ptr_;
      v56 = objc_msgSend(v4, "u64Identifier");
      sub_100268FEC(v15, (uint64_t)buf);
      sub_100274790((uint64_t)ptr, (uint64_t)v56, (uint64_t)buf, v54);
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)&buf[8] = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }
    }
    if (!-[NIServerHomeDeviceSession _shouldRespondToDevice:](self, "_shouldRespondToDevice:", v4))
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D9FF0();
      goto LABEL_117;
    }
    if (uwbSystemAvailable)
    {
      if (!self->_currentSessionRole)
        goto LABEL_117;
      if (self->_currentSessionRole != 1)
        __assert_rtn("-[NIServerHomeDeviceSession deviceDiscovered:]", "NIServerHomeDeviceSession.mm", 1119, "_currentSessionRole == Role::Responder");
      if ((objc_msgSend(v102, "BOOLForKey:", CFSTR("NIHomeAllowMobileAsAnchor")) & 1) == 0)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cbDevice"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "model"));
        v59 = objc_msgSend(v58, "hasPrefix:", CFSTR("iPhone"));

        if (v59)
        {
          v60 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v4;
            v61 = "#ses-home,No uwb responding to another mobile: %@";
LABEL_100:
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, v61, buf, 0xCu);
            goto LABEL_117;
          }
          goto LABEL_117;
        }
      }
      -[NIServerHomeDeviceSession _prepareServiceRequestWithConfig:](self, "_prepareServiceRequestWithConfig:", v99);
      if (!v118[376])
        goto LABEL_117;
      -[NIServerHomeDeviceSession _buildRoseSession:](self, "_buildRoseSession:", buf);
      if ((_QWORD)v114)
      {
        v104 = objc_msgSend(v4, "u64Identifier");
        v66 = sub_1000550B8(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v104);
        if (v66)
        {
          v67 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v109 = 134217984;
            *(_QWORD *)&v109[4] = v104;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "#ses-home,Evicting previous UWB session with same identitifer: 0x%llx", v109, 0xCu);
          }
          v68 = v66[3];
          v69 = v66[4];
          *(_QWORD *)v109 = v68;
          *(_QWORD *)&v109[8] = v69;
          if (v69)
          {
            v70 = (unint64_t *)(v69 + 8);
            do
              v71 = __ldxr(v70);
            while (__stxr(v71 + 1, v70));
          }
          if (v68)
            sub_1002AE5BC(v68);
          sub_1001E0874(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, v66);
          sub_10001AE68((uint64_t)v109);
        }
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession objectFromIdentifier:](self, "objectFromIdentifier:", v104));
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "discoveryToken"));

        if (v73)
        {
          v74 = sub_10000883C();
          sub_100211764((uint64_t)&self->_handoffCAManager, (unint64_t)objc_msgSend(v73, "hash"), (int)-[NIServerHomeDeviceSession nominalCycleRate](self, "nominalCycleRate"), v74);
        }
        v108.__locale_ = (std::locale::__imp *)&v104;
        *(_QWORD *)v109 = &v114;
        *(_QWORD *)&v109[8] = &v105;
        sub_1001E8738((uint64_t)&self->_responderSessions, (uint64_t *)&v104, (uint64_t)&unk_100472CF8, &v108, (uint64_t)v109);
        if (!v75 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003D9F64();
        v76 = (id)qword_10085F520;
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          v77 = objc_msgSend(v4, "u64Identifier");
          if ((_BYTE)v105)
            v78 = "YES";
          else
            v78 = "NO";
          v79 = sub_100268EE4(*((uint64_t *)&v105 + 1));
          v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v79));
          v81 = objc_msgSend(v80, "UTF8String");
          *(_DWORD *)v109 = 134218754;
          *(_QWORD *)&v109[4] = v77;
          *(_WORD *)&v109[12] = 2080;
          *(_QWORD *)&v109[14] = v78;
          v110 = 2080;
          v111 = v81;
          v112 = 1024;
          v113 = DWORD1(v105);
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "#ses-home,recorded mac addr 0x%llx needs bias correction: %s, regionCategory: %s, magnetic field strength check option: %d", v109, 0x26u);

        }
        v103 = v114;
        if (*((_QWORD *)&v114 + 1))
        {
          v82 = (unint64_t *)(*((_QWORD *)&v114 + 1) + 8);
          do
            v83 = __ldxr(v82);
          while (__stxr(v83 + 1, v82));
        }
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession _triggerResponderRangingForSession:initiatorDevice:](self, "_triggerResponderRangingForSession:initiatorDevice:", &v103, v4));
        sub_10001AE68((uint64_t)&v103);
        if (v84)
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003D9F04();
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remote"));
          objc_msgSend(v85, "uwbSessionDidFailWithError:", v84);

        }
        sub_10001AE68((uint64_t)&v114);
        goto LABEL_117;
      }
      sub_10001AE68((uint64_t)&v114);
    }
    else
    {
      if ((v100 & v101) == 0)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003D9FC4();
        goto LABEL_117;
      }
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cbDevice"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "model"));
      if ((objc_msgSend(v63, "hasPrefix:", CFSTR("AudioAccessory")) & 1) != 0)
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configuration](self, "configuration"));
        v65 = objc_msgSend(v64, "isAnchor");

        if (v65)
        {
          v60 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v4;
            v61 = "#ses-home,No wifi responding to another anchor: %@";
            goto LABEL_100;
          }
LABEL_117:

          goto LABEL_118;
        }
      }
      else
      {

      }
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cbDevice"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "model"));
      if ((objc_msgSend(v87, "hasPrefix:", CFSTR("iPhone")) & 1) != 0)
      {
        v88 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configuration](self, "configuration"));
        v89 = objc_msgSend(v88, "isAnchor");

        if ((v89 & 1) == 0)
        {
          v60 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v4;
            v61 = "#ses-home,No wifi initiating to another mobile: %@";
            goto LABEL_100;
          }
          goto LABEL_117;
        }
      }
      else
      {

      }
      v90 = (id)qword_10085F520;
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cbDevice"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "model"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v92;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "#ses-home,Starting a wifi session with a peer model: %@", buf, 0xCu);

      }
      -[NIServerHomeDeviceSession _buildWifiSession](self, "_buildWifiSession");
      if (*(_QWORD *)v109)
      {
        v93 = objc_msgSend(v4, "u64Identifier");
        v94 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configuration](self, "configuration"));
        if (objc_msgSend(v94, "isAnchor"))
          v95 = 2;
        else
          v95 = 1;
        sub_10002D868((uint64_t)buf, (uint64_t)v93, v95);

        v96 = sub_10000883C();
        sub_1002ADA70((uint64_t)self->_wifiCAManager.__ptr_, v96);
        if (-[NIServerHomeDeviceSession _isWifiRangingAllowed](self, "_isWifiRangingAllowed"))
          sub_10002E2FC(*(uint64_t *)v109, (uint64_t)buf);
        v97 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v114) = 0;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "#ses-home,WiFi ranging is not allowed at this time.", (uint8_t *)&v114, 2u);
        }
        v108.__locale_ = (std::locale::__imp *)objc_msgSend(v4, "u64Identifier");
        *(_QWORD *)&v114 = &v108;
        v98 = sub_1001E8AA4((uint64_t)&self->_wifiSessions, (unint64_t *)&v108, (uint64_t)&unk_100472CF8, (_QWORD **)&v114);
        sub_100021C24(v98 + 3, (uint64_t *)v109);

        sub_10001AE68((uint64_t)v109);
        goto LABEL_117;
      }
      sub_10001AE68((uint64_t)v109);
    }
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D9ED8();
    goto LABEL_117;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,Disable UWB-aided handoff with HomeDeviceSessionBTLeechingEnabled", buf, 2u);
  }
LABEL_118:

}

- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v5 = a3;
  v3 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v5, 6);
  v4 = sub_10001D534();
  sub_10001D5C8((uint64_t)v4, v3);

}

- (void)device:(id)a3 rediscovered:(id)a4
{
  id v6;
  NSObject *v7;
  NSString *containerUniqueIdentifier;
  NIServerSessionResourceManager *v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  double v19;
  void *v20;
  Logger *ptr;
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  char v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  NSObject *v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  std::__shared_weak_count *v40;
  unint64_t *p_shared_owners;
  unint64_t v42;
  void *v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  uint64_t v53;
  const char *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint32_t v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned int v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t *v64;
  unint64_t v65;
  unint64_t *v66;
  NSObject *v67;
  unint64_t *v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned __int8 v72;
  NSObject *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  void *v78;
  int v79;
  double v80;
  void *v81;
  NSObject *v82;
  _QWORD *v83;
  unordered_map<unsigned long long, std::shared_ptr<WiFiRanging::Session>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::shared_ptr<WiFiRanging::Session>>>> *p_wifiSessions;
  _QWORD *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  std::__shared_weak_count *v90;
  id v91;
  id v92;
  objc_super v93;
  uint8_t v94[8];
  _BYTE v95[22];
  _BYTE buf[32];
  uint64_t v97;
  void *v98;

  v88 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = containerUniqueIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v88;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,Device re-discovered. Session Identifier: %@. New Device: %@, cached device: %@", buf, 0x20u);
  }
  v93.receiver = self;
  v93.super_class = (Class)NIServerHomeDeviceSession;
  v9 = -[NIServerBaseSession resourcesManager](&v93, "resourcesManager");
  v87 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v92 = objc_msgSend(v88, "u64Identifier");
  v10 = (unint64_t)sub_1000550B8(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v92);
  p_wifiSessions = &self->_wifiSessions;
  v11 = (unint64_t)sub_1000550B8(&self->_wifiSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v92);
  v12 = objc_msgSend(v6, "isWifiRangingCapable");
  v13 = objc_msgSend(v88, "isWifiRangingCapable");
  if (v10 | v11)
  {
    v14 = v13;
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "discoveryToken"));
    if (!v86)
      goto LABEL_14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "lifecycleSupervisor"));
    if ((objc_msgSend(v15, "isTrackingPeer:", v86) & 1) == 0)
    {
      v16 = objc_msgSend(v6, "systemKeyRelationship");

      if (!v16)
        goto LABEL_14;
      v17 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v86;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#ses-home,Re-discovered peer has systemKeyRelationship but isn't being tracked, retracking peer with token: %@", buf, 0xCu);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "lifecycleSupervisor", p_wifiSessions));
      v98 = v86;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v98, 1));
      objc_msgSend(v15, "startedDiscoveringPeersWithTokens:", v18);

    }
LABEL_14:
    if (self->_pbLogger.__ptr_)
    {
      v19 = sub_10000883C();
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NINearbyObject objectFromBluetoothDevice:](NINearbyObject, "objectFromBluetoothDevice:", v6));
      if (v20)
      {
        ptr = self->_pbLogger.__ptr_;
        v22 = objc_msgSend(v6, "u64Identifier");
        sub_100268FEC(v20, (uint64_t)buf);
        sub_100274790((uint64_t)ptr, (uint64_t)v22, (uint64_t)buf, v19);
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      {
        sub_1003D9EAC();
      }

    }
    v23 = objc_msgSend(v6, "u64Identifier", p_wifiSessions);
    v24 = objc_msgSend(v88, "u64Identifier");
    v25 = v24;
    v26 = v12 ^ v14;
    if (v23 == v24 || self->_currentSessionRole != 1)
    {
      if (v23 == v24)
      {
        v27 = 0;
LABEL_28:
        if (((v27 | v26) & 1) == 0)
        {
          if ((objc_msgSend(v88, "isWifiRangingCapable") & 1) == 0)
          {
            v53 = qword_10085F520;
            if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
              goto LABEL_111;
            *(_WORD *)buf = 0;
            v54 = "#ses-home,Device rediscovered decision: not restarting session since address is the same and role != r"
                  "esponder and wifi ranging bit is unchanged and wifi ranging not enabled.";
            v55 = v53;
            v56 = OS_LOG_TYPE_DEFAULT;
            v57 = 2;
LABEL_68:
            _os_log_impl((void *)&_mh_execute_header, v55, v56, v54, buf, v57);
            goto LABEL_111;
          }
          LOBYTE(v27) = 0;
        }
LABEL_31:
        v28 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = v23 != v25;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v26;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ses-home,adjusting ranging parameters command due to peer address roll or wifi ranging capable bit update. advAddressChanged: %d, wifiRangingChanged: %d", buf, 0xEu);
        }
        v91 = objc_msgSend(v6, "u64Identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "wifiResource"));
        v30 = objc_msgSend(v29, "deviceCapabilities");

        v31 = !v27;
        if (!v10)
          v31 = 1;
        if ((v31 & 1) == 0)
        {
          v32 = *(_QWORD *)(v10 + 32);
          *(_QWORD *)buf = *(_QWORD *)(v10 + 24);
          *(_QWORD *)&buf[8] = v32;
          if (v32)
          {
            v33 = (unint64_t *)(v32 + 8);
            do
              v34 = __ldxr(v33);
            while (__stxr(v34 + 1, v33));
          }
          *(_OWORD *)&buf[16] = *(_OWORD *)(v10 + 40);
          v97 = *(_QWORD *)(v10 + 56);
          sub_1001E8D00(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)(v10 + 16));
          *(_QWORD *)v94 = &v91;
          *(_QWORD *)v95 = buf;
          *(_QWORD *)&v95[8] = &buf[16];
          sub_1001E8738((uint64_t)&self->_responderSessions, (uint64_t *)&v91, (uint64_t)&unk_100472CF8, (_QWORD **)v94, (uint64_t)v95);
          v35 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v95 = 134218240;
            *(_QWORD *)&v95[4] = v92;
            *(_WORD *)&v95[12] = 2048;
            *(_QWORD *)&v95[14] = v91;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#ses-home,updated mac addr 0x%llx -> 0x%llx in processing info dictionary", v95, 0x16u);
          }
          v89 = *(_QWORD *)buf;
          v90 = *(std::__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v36 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v37 = __ldxr(v36);
            while (__stxr(v37 + 1, v36));
          }
          v38 = objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession _triggerResponderRangingForSession:initiatorDevice:](self, "_triggerResponderRangingForSession:initiatorDevice:", &v89, v6));
          v39 = (void *)v38;
          v40 = v90;
          if (!v90)
            goto LABEL_48;
          p_shared_owners = (unint64_t *)&v90->__shared_owners_;
          do
            v42 = __ldaxr(p_shared_owners);
          while (__stlxr(v42 - 1, p_shared_owners));
          if (!v42)
          {
            ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
            std::__shared_weak_count::__release_weak(v40);
            if (!v39)
              goto LABEL_52;
          }
          else
          {
LABEL_48:
            if (!v38)
              goto LABEL_52;
          }
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003DA124();
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "remote"));
          objc_msgSend(v43, "uwbSessionDidFailWithError:", v39);

LABEL_52:
          v44 = *(std::__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v45 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v46 = __ldaxr(v45);
            while (__stlxr(v46 - 1, v45));
LABEL_89:
            if (!v46)
            {
              ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
              std::__shared_weak_count::__release_weak(v44);
            }
            goto LABEL_111;
          }
          goto LABEL_111;
        }
        if (v11)
        {
          if (objc_msgSend(v6, "isWifiRangingCapable"))
          {
            v47 = *(_QWORD *)(v11 + 32);
            *(_QWORD *)v95 = *(_QWORD *)(v11 + 24);
            *(_QWORD *)&v95[8] = v47;
            if (v47)
            {
              v48 = (unint64_t *)(v47 + 8);
              do
                v49 = __ldxr(v48);
              while (__stxr(v49 + 1, v48));
            }
            sub_1001E8D00(v85, (unint64_t *)(v11 + 16));
            sub_1001E8D4C((uint64_t)v85, (unint64_t *)&v91, &v91, (uint64_t *)v95);
            v50 = (uint64_t)v91;
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configuration](self, "configuration"));
            if (objc_msgSend(v51, "isAnchor"))
              v52 = 2;
            else
              v52 = 1;
            sub_10002D868((uint64_t)buf, v50, v52);

            sub_10002DF44(*(uint64_t *)v95);
            if (-[NIServerHomeDeviceSession _isWifiRangingAllowed](self, "_isWifiRangingAllowed"))
              sub_10002E2FC(*(uint64_t *)v95, (uint64_t)buf);
            v67 = qword_10085F520;
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v94 = 0;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "#ses-home,not ranging to rediscovered device because wifi ranging is not currently allowed", v94, 2u);
            }

            v44 = *(std::__shared_weak_count **)&v95[8];
            if (!*(_QWORD *)&v95[8])
              goto LABEL_111;
            v68 = (unint64_t *)(*(_QWORD *)&v95[8] + 8);
            do
              v46 = __ldaxr(v68);
            while (__stlxr(v46 - 1, v68));
          }
          else
          {
            if ((objc_msgSend(v6, "isWifiRangingCapable") & 1) != 0)
              goto LABEL_111;
            v63 = *(_QWORD *)(v11 + 32);
            *(_QWORD *)buf = *(_QWORD *)(v11 + 24);
            *(_QWORD *)&buf[8] = v63;
            if (v63)
            {
              v64 = (unint64_t *)(v63 + 8);
              do
                v65 = __ldxr(v64);
              while (__stxr(v65 + 1, v64));
            }
            sub_1001E8D00(v85, (unint64_t *)(v11 + 16));
            sub_1001E8D4C((uint64_t)v85, (unint64_t *)&v91, &v91, (uint64_t *)buf);
            sub_10002DF44(*(uint64_t *)buf);
            v44 = *(std::__shared_weak_count **)&buf[8];
            if (!*(_QWORD *)&buf[8])
              goto LABEL_111;
            v66 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v46 = __ldaxr(v66);
            while (__stlxr(v46 - 1, v66));
          }
          goto LABEL_89;
        }
        if ((objc_msgSend(v6, "isWifiRangingCapable") & v30) != 1)
        {
LABEL_111:

          goto LABEL_112;
        }
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "cbDevice"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "model"));
        if ((objc_msgSend(v59, "hasPrefix:", CFSTR("AudioAccessory")) & 1) != 0)
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configuration](self, "configuration"));
          v61 = objc_msgSend(v60, "isAnchor");

          if (v61)
          {
            v62 = qword_10085F520;
            if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
              goto LABEL_111;
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v88;
            v54 = "#ses-home,No wifi responding to another anchor: %@";
            goto LABEL_96;
          }
        }
        else
        {

        }
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "cbDevice"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "model"));
        if ((objc_msgSend(v70, "hasPrefix:", CFSTR("iPhone")) & 1) != 0)
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configuration](self, "configuration"));
          v72 = objc_msgSend(v71, "isAnchor");

          if ((v72 & 1) == 0)
          {
            v62 = qword_10085F520;
            if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
              goto LABEL_111;
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v88;
            v54 = "#ses-home,No wifi initiating to another mobile: %@";
LABEL_96:
            v55 = v62;
            v56 = OS_LOG_TYPE_INFO;
            v57 = 12;
            goto LABEL_68;
          }
        }
        else
        {

        }
        v73 = (id)qword_10085F520;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "cbDevice"));
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "model"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v75;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "#ses-home,Starting a wifi session with a peer model: %@", buf, 0xCu);

        }
        -[NIServerHomeDeviceSession _buildWifiSession](self, "_buildWifiSession");
        v76 = (uint64_t)v85;
        if (*(_QWORD *)v95)
        {
          v77 = objc_msgSend(v88, "u64Identifier");
          v78 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configuration](self, "configuration"));
          if (objc_msgSend(v78, "isAnchor"))
            v79 = 2;
          else
            v79 = 1;
          sub_10002D868((uint64_t)buf, (uint64_t)v77, v79);

          v80 = sub_10000883C();
          sub_1002ADA70((uint64_t)self->_wifiCAManager.__ptr_, v80);
          if (-[NIServerHomeDeviceSession _isWifiRangingAllowed](self, "_isWifiRangingAllowed"))
            sub_10002E2FC(*(uint64_t *)v95, (uint64_t)buf);
          v82 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v94 = 0;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "#ses-home,WiFi ranging is not allowed at this time.", v94, 2u);
          }

          v81 = 0;
          v76 = (uint64_t)v85;
        }
        else
        {
          v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
        }
        *(_QWORD *)v94 = objc_msgSend(v88, "u64Identifier");
        *(_QWORD *)buf = v94;
        v83 = sub_1001E8AA4(v76, (unint64_t *)v94, (uint64_t)&unk_100472CF8, (_QWORD **)buf);
        sub_100021C24(v83 + 3, (uint64_t *)v95);
        sub_10001AE68((uint64_t)v95);

        goto LABEL_111;
      }
    }
    else if (v10)
    {
      LOBYTE(v27) = 1;
      goto LABEL_31;
    }
    v27 = v11 != 0;
    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003DA0F8();
  -[NIServerHomeDeviceSession deviceDiscovered:](self, "deviceDiscovered:", v6, p_wifiSessions);
LABEL_112:

}

- (void)deviceLost:(id)a3
{
  id v4;
  unordered_map<unsigned long long, std::shared_ptr<WiFiRanging::Session>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::shared_ptr<WiFiRanging::Session>>>> *p_wifiSessions;
  _QWORD *v6;
  NSObject *v7;
  unsigned int v8;
  NSObject *v9;
  unint64_t *v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  id v17;
  uint8_t buf[8];
  std::__shared_weak_count *v19;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v17 = objc_msgSend(v4, "u64Identifier");
  p_wifiSessions = &self->_wifiSessions;
  v6 = sub_1000550B8(p_wifiSessions, (unint64_t *)&v17);
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v4, "isWifiRangingCapable");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,device lost, current wifi capabilities from cached device: %d", buf, 8u);
  }

  if (v6)
  {
    v9 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-home,stopping wifi ranging session due to lost device", buf, 2u);
    }
    v10 = v6 + 2;
    v12 = v6[3];
    v11 = (std::__shared_weak_count *)v6[4];
    *(_QWORD *)buf = v12;
    v19 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    sub_1001E8D00(p_wifiSessions, v10);
    sub_10002DF44(v12);
    if (v11)
    {
      v15 = (unint64_t *)&v11->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }

}

- (void)didReceiveNewSolution:(const void *)a3
{
  double v5;
  unint64_t v6;
  id v7;
  void *v8;
  NIServerSessionResourceManager *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  _QWORD *v13;
  AlgorithmProcessingOptions *p_recommendedProcessingOptions;
  NSObject *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  objc_super v19;
  objc_super v20;
  unint64_t v21;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if ((*((_DWORD *)a3 + 8) - 1) >= 3)
  {
    v15 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003DA2D0((int *)a3 + 8, v15);
  }
  else
  {
    if (*((_BYTE *)a3 + 24))
    {
      v5 = *((double *)a3 + 2);
      v6 = *((_QWORD *)a3 + 5);
      v20.receiver = self;
      v20.super_class = (Class)NIServerHomeDeviceSession;
      v21 = v6;
      v7 = -[NIServerBaseSession discoveryTokenFromIdentifier:](&v20, "discoveryTokenFromIdentifier:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      if (!v8)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003DA1B0();
        goto LABEL_19;
      }
      v19.receiver = self;
      v19.super_class = (Class)NIServerHomeDeviceSession;
      v9 = -[NIServerBaseSession resourcesManager](&v19, "resourcesManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lifecycleSupervisor"));
      v12 = objc_msgSend(v11, "isTrackingPeer:", v8);

      if ((v12 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003DA270();
        goto LABEL_18;
      }
      if (self->_currentSessionRole == 1)
      {
        v13 = sub_1000550B8(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, &v21);
        if (!v13)
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003DA210();
          goto LABEL_18;
        }
        p_recommendedProcessingOptions = (AlgorithmProcessingOptions *)(v13 + 5);
      }
      else
      {
        p_recommendedProcessingOptions = &self->_recommendedProcessingOptions;
      }
      v17 = *(_OWORD *)&p_recommendedProcessingOptions->requiresBiasCorrection;
      v18 = *(_QWORD *)&p_recommendedProcessingOptions->intentPredictorConfiguration;
      -[NINearbyUpdatesEngine acceptRoseSolution:withProcessingOptions:](self->_updatesEngine, "acceptRoseSolution:withProcessingOptions:", a3, &v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lifecycleSupervisor"));
      objc_msgSend(v16, "measurementReceivedForToken:contTimestamp:", v8, v5);

LABEL_18:
LABEL_19:

      return;
    }
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DA184();
  }
}

- (void)didReceiveDeviceMotion:(const void *)a3
{
  __int128 v5;
  double v6;
  uint64_t v7;
  double v8;
  float64x2_t v9;
  double v10;
  BOOL v11;
  double v12;
  BOOL v13;
  uint64_t v14;
  double v21;
  float v22;
  optional<double> *p_filteredMFStrength;
  __int128 v24;
  __int128 v25;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  -[NINearbyUpdatesEngine acceptDeviceMotion:](self->_updatesEngine, "acceptDeviceMotion:", a3);
  v6 = *(double *)a3;
  v7 = *(_QWORD *)&self->_anon_1c8[32];
  if (v7 != *(_QWORD *)&self->_anon_1c8[24])
  {
    v8 = v6 - *(double *)(v7 - 8);
    if (v8 > 0.02 || v8 < 0.0)
      return;
  }
  v9 = *((float64x2_t *)a3 + 8);
  v10 = *((double *)a3 + 18);
  v11 = v9.f64[0] == 0.0;
  v12 = *((double *)a3 + 17);
  if (v9.f64[1] != 0.0)
    v11 = 0;
  v13 = v10 == 0.0 && v11;
  v14 = *(_QWORD *)&self->_anon_1c8[8];
  if (v14 == *(_QWORD *)self->_anon_1c8 || !self->_anon_1a0[24] || *(double *)&self->_anon_1a0[8] < v6 + -60.0)
  {
    if (v13)
      return;
    goto LABEL_16;
  }
  if (!v13)
  {
LABEL_16:
    *(float32x2_t *)&v5 = vcvt_f32_f64(v9);
    v22 = v10;
    *((float *)&v5 + 2) = v22;
    v24 = *((_OWORD *)a3 + 8);
    v25 = v5;
    sub_1001E1C70((void **)self->_anon_1f8, &v25, v6);
    -[NIServerHomeDeviceSession _calculateMagneticFieldBias](self, "_calculateMagneticFieldBias");
    v21 = sqrt(v12 * v12 + *(double *)&v24 * *(double *)&v24 + v10 * v10);
    goto LABEL_17;
  }
  _S2 = vsubq_f32(*(float32x4_t *)(v14 - 16), (float32x4_t)self[408]).i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  v21 = sqrtf(_S1);
LABEL_17:
  p_filteredMFStrength = &self->_filteredMFStrength;
  if (self->_filteredMFStrength.__engaged_)
    v21 = v21 * 0.3 + p_filteredMFStrength->var0.__val_ * 0.7;
  else
    self->_filteredMFStrength.__engaged_ = 1;
  p_filteredMFStrength->var0.__val_ = v21;
  -[NINearbyUpdatesEngine acceptMagneticFieldStrength:](self->_updatesEngine, "acceptMagneticFieldStrength:", v24);
}

- (void)didReceiveMagnetometerData:(NIServerHomeDeviceSession *)self at:(SEL)a2
{
  __int128 *v2;
  double v3;
  double v4;
  __int128 *v5;
  __int128 v7;

  v4 = v3;
  v5 = v2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v7 = *v5;
  sub_1001E1C70((void **)self->_anon_1c8, &v7, v4);
  -[NIServerHomeDeviceSession _calculateMagneticFieldBias](self, "_calculateMagneticFieldBias");
}

- (void)didReceiveRemoteData:(const void *)a3
{
  _BYTE *v3;
  _DWORD *v4;
  _DWORD *v5;
  NSObject *v6;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v4 = (char *)a3 + 8;
  v3 = (_BYTE *)*((_QWORD *)a3 + 1);
  v5 = (char *)a3 + 16;
  if (*((_QWORD *)a3 + 2) - (_QWORD)v3 > 0xFuLL)
  {
    if (*v3 == 2)
    {
      if (v3[1])
      {
        v9 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          v10 = *((_QWORD *)a3 + 5);
          v11 = 134283521;
          v12 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-home,#hangup Received hangup from 0x%{private}llx.", (uint8_t *)&v11, 0xCu);
        }
        -[NIServerHomeDeviceSession _peerHungUp:](self, "_peerHungUp:", *((_QWORD *)a3 + 5));
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003DA3FC();
    }
  }
  else
  {
    v6 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DA36C(v5, v4, v6);
  }
}

- (void)_roseSession:(shared_ptr<rose:(int)a4 :(float)a5 objects:(float)a6 :(int)a7 RoseBaseSession>)a3 didChangeRangingUpdateRate:newThrottleRate:prevThrottleRate:effectiveSinceCycleInde:
{
  int var1;
  RoseBaseSession *var0;
  NIServerSessionResourceManager *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *next;
  int v19;
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  BOOL v25;
  unint64_t v26;
  void *v27;
  void *v28;
  duration<long long, std::ratio<1, 1000>> v29;
  double v30;
  NSObject *v31;
  objc_super v32;
  NSErrorUserInfoKey v33;
  const __CFString *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  int v42;

  var1 = (int)a3.var1;
  var0 = a3.var0;
  v32.receiver = self;
  v32.super_class = (Class)NIServerHomeDeviceSession;
  v13 = -[NIServerBaseSession resourcesManager](&v32, "resourcesManager", a3.var0, a3.var1, *(_QWORD *)&a4, *(_QWORD *)&a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (var1)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DA454();
    v33 = NSLocalizedDescriptionKey;
    v34 = CFSTR("Failed to adjust ranging rate.");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "remote"));
    objc_msgSend(v17, "uwbSessionDidFailWithError:", v16);

  }
  else
  {
    next = self->_responderSessions.__table_.__p1_.__value_.__next_;
    if (!next)
      goto LABEL_29;
    v19 = 0;
    v20 = 0;
    do
    {
      v21 = next[3];
      v22 = (std::__shared_weak_count *)next[4];
      if (v22)
      {
        p_shared_owners = (unint64_t *)&v22->__shared_owners_;
        do
          v24 = __ldxr(p_shared_owners);
        while (__stxr(v24 + 1, p_shared_owners));
        v25 = v21 == *(_QWORD *)var0;
        if (v25)
          v20 = next[2];
        v19 |= v25;
        do
          v26 = __ldaxr(p_shared_owners);
        while (__stlxr(v26 - 1, p_shared_owners));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      else
      {
        if (v21 == *(_QWORD *)var0)
          v20 = next[2];
        v19 |= v21 == *(_QWORD *)var0;
      }
      next = (_QWORD *)*next;
    }
    while (next);
    if ((v19 & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession objectFromIdentifier:](self, "objectFromIdentifier:", v20));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "discoveryToken"));
      v29.__rep_ = (int64_t)-[NIServerHomeDeviceSession nominalCycleRate](self, "nominalCycleRate");
      *(float *)&v30 = a5;
      -[NIServerHomeDeviceSession _updateAnalyticsAboutRangingRateForDevice:responseSkipRatio:cycleRate:](self, "_updateAnalyticsAboutRangingRateForDevice:responseSkipRatio:cycleRate:", v28, v29.__rep_, v30);

      v31 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v36 = v27;
        v37 = 2048;
        v38 = a5;
        v39 = 2048;
        v40 = a6;
        v41 = 1024;
        v42 = a4;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#ses-home,#throttle Adjusting throttle rate succeeded for object %@. New rate %0.2f, old rate: %0.2f, cycle index: %d", buf, 0x26u);
      }

    }
    else
    {
LABEL_29:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DA428();
    }
  }

}

- (BOOL)supportsDevicePresence
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("HomeDeviceSessionBTLeechingEnabled"));

  return v3;
}

- (id)getQueueForInputingData
{
  return self->_clientQueue;
}

- (BOOL)isInterestedInSamplesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  if ((-[NIHomeDeviceConfiguration allowedDevices](self->_configuration, "allowedDevices") | 4) == 4)
    goto LABEL_2;
  if (!objc_msgSend(v4, "rssi"))
  {
    v10 = (id)qword_10085F520;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
      v15 = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-home,Dropping BT RSSI sample for device: %@ which is of model: %@ because reported RSSI is UNKNOWN", (uint8_t *)&v15, 0x16u);

    }
LABEL_10:

    goto LABEL_2;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceID"));

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("NONE"));

      if (!v9)
      {
        LOBYTE(v5) = ((unint64_t)objc_msgSend(v4, "deviceFlags") & 0x380) != 0;
        goto LABEL_3;
      }
    }
    v10 = (id)qword_10085F520;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceID"));
      v15 = 138412290;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-home,Dropping BT RSSI sample for device: %@ which does not have model info", (uint8_t *)&v15, 0xCu);

    }
    goto LABEL_10;
  }
  v14 = qword_10085F520;
  if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    goto LABEL_3;
  LOWORD(v15) = 0;
  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-home,Dropping BT RSSI sample for device with idsDeviceID is nil", (uint8_t *)&v15, 2u);
LABEL_2:
  LOBYTE(v5) = 0;
LABEL_3:

  return (char)v5;
}

- (void)consumeBluetoothSample:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  NIDiscoveryToken *v9;
  void *v10;
  void *v11;
  NIDiscoveryToken *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NINearbyObject *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  id v29;
  void *__p[2];
  char v31;
  _QWORD *v32[5];
  char v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("HomeDeviceSessionBTLeechingEnabled"));

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));

      if (v8)
      {
        v9 = [NIDiscoveryToken alloc];
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));
        v12 = -[NIDiscoveryToken initWithBytes:](v9, "initWithBytes:", v11);

        v37 = 0;
        v38 = 0;
        v39 = 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataUsingEncoding:", 4));

        v15 = objc_msgSend(v14, "length");
        v16 = 0;
        if (v15)
        {
          sub_10003F150((unint64_t *)&v37, (size_t)v15);
          v16 = v37;
        }
        else if (v38 != v37)
        {
          v38 = v37;
        }
        objc_msgSend(v14, "getBytes:length:", v16, objc_msgSend(v14, "length"));
        v32[0] = (_QWORD *)-[NIDiscoveryToken hash](v12, "hash");
        if (!sub_1000550B8(&self->_btIdentifierHashToObjectMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)v32))
        {
          v17 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
          -[NINearbyObject setDeviceIdentifier:](v17, "setDeviceIdentifier:", v18);

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
          -[NINearbyObject setName:](v17, "setName:", v19);

          v36 = -[NIDiscoveryToken hash](v12, "hash");
          v32[0] = &v36;
          v20 = sub_100187E74((uint64_t)&self->_btIdentifierHashToObjectMap, &v36, (uint64_t)&unk_100472CF8, v32);
          v21 = (void *)v20[3];
          v20[3] = v17;

        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partIdentifier"));
        if (v22)
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partIdentifier"));
        else
          v23 = &stru_10081D5E0;

        if (-[__CFString isEqual:](v23, "isEqual:", &stru_10081D5E0)
          && -[__CFString hash](v23, "hash")
          && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        {
          sub_1003DA540();
        }
        objc_msgSend(v4, "machContinuousTimeSeconds");
        v25 = v24;
        objc_msgSend(v4, "rssi");
        v27 = v26;
        v28 = objc_msgSend(v4, "channel");
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model")));
        sub_10000BF04(__p, (char *)objc_msgSend(v29, "UTF8String"));
        sub_100187824((uint64_t)v32, v28, (__int128 *)__p, (uint64_t)&v37, -[NIDiscoveryToken hash](v12, "hash"), (uint64_t)-[__CFString hash](v23, "hash"), v25, v27);
        if (v31 < 0)
          operator delete(__p[0]);

        -[NINearbyUpdatesEngine acceptBluetoothSample:](self->_updatesEngine, "acceptBluetoothSample:", v32);
        if (v34)
        {
          v35 = v34;
          operator delete(v34);
        }
        if (v33 < 0)
          operator delete(v32[3]);

        if (v37)
        {
          v38 = v37;
          operator delete(v37);
        }

      }
      else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
        sub_1003DA4E0();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003DA480();
    }
  }

}

- (id)printableState
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  GRSession *ptr;
  uint64_t v7;
  char *next;
  int v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  unint64_t *v16;
  unint64_t v17;
  int currentSessionRole;
  char *v19;
  int v20;
  void **v21;
  _BOOL8 isRunning;
  _BOOL8 uwbSystemAvailable;
  const char *v24;
  void **v25;
  void *v26;
  void *v27;
  void *__p[2];
  std::__shared_weak_count *v30;
  __int128 v31;
  uint64_t v32;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[")));
  ptr = self->_initiatorSession.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 682))
      v7 = *((unsigned __int16 *)ptr + 340);
    else
      v7 = 0;
    objc_msgSend(v4, "appendFormat:", CFSTR("%d"), v7);
  }
  next = (char *)self->_responderSessions.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v9 = 1;
    do
    {
      v10 = *((_QWORD *)next + 3);
      __p[0] = *((void **)next + 2);
      __p[1] = (void *)v10;
      v11 = (std::__shared_weak_count *)*((_QWORD *)next + 4);
      v30 = v11;
      if (v11)
      {
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          v13 = __ldxr(p_shared_owners);
        while (__stxr(v13 + 1, p_shared_owners));
      }
      v31 = *(_OWORD *)(next + 40);
      v32 = *((_QWORD *)next + 7);
      if (v10)
      {
        if (*(_BYTE *)(v10 + 682))
          v14 = *(unsigned __int16 *)(v10 + 680);
        else
          v14 = 0;
        if (v9)
          v15 = CFSTR("%d");
        else
          v15 = CFSTR(", %d");
        objc_msgSend(v5, "appendFormat:", v15, v14);
        v9 = 0;
      }
      if (v11)
      {
        v16 = (unint64_t *)&v11->__shared_owners_;
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      next = *(char **)next;
    }
    while (next);
  }
  objc_msgSend(v4, "appendString:", CFSTR("]"));
  objc_msgSend(v5, "appendString:", CFSTR("]"));
  currentSessionRole = self->_currentSessionRole;
  if (currentSessionRole == 100)
  {
    v19 = "Unspecified";
  }
  else if (currentSessionRole == 1)
  {
    v19 = "Responder";
  }
  else
  {
    v19 = "Initiator";
  }
  sub_10000BF04(__p, v19);
  v20 = SHIBYTE(v30);
  v21 = (void **)__p[0];
  isRunning = self->_isRunning;
  uwbSystemAvailable = self->_uwbSystemAvailable;
  v24 = +[NIUtils NINearbyObjectUpdateRateToString:](NIUtils, "NINearbyObjectUpdateRateToString:", self->_minimumPreferredUpdateRate);
  v25 = __p;
  if (v20 < 0)
    v25 = v21;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Role: %s. Running: %d. UWB available: %d. Min upd rate: %s"), v25, isRunning, uwbSystemAvailable, v24));
  -[NSMutableArray addObject:](v3, "addObject:", v26);

  if (SHIBYTE(v30) < 0)
    operator delete(__p[0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UWB ranging: initiator tickets %@, responder tickets %@. WiFi ranging: %d sessions"), v4, v5, self->_wifiSessions.__table_.__p2_.__value_));
  -[NSMutableArray addObject:](v3, "addObject:", v27);

  return v3;
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  if ((a3 - 1) < 2)
  {
    -[NIServerHomeDeviceSession _handleUWBSystemStateReadinessUpdate:](self, "_handleUWBSystemStateReadinessUpdate:", 1, *(_QWORD *)&a4);
  }
  else if ((a3 - 3) >= 2)
  {
    if (!a3)
      sub_1003DA56C();
  }
  else
  {
    -[NIServerHomeDeviceSession _handleUWBSystemStateReadinessUpdate:](self, "_handleUWBSystemStateReadinessUpdate:", 0, *(_QWORD *)&a4);
  }
}

- (void)_handleUWBSystemStateReadinessUpdate:(BOOL)a3
{
  int v3;
  NIServerSessionResourceManager *v5;
  void *v6;
  int uwbSystemAvailable;
  NSObject *v8;
  const char *v9;
  const char *v10;
  void *v11;
  NIHomeDeviceConfiguration *configuration;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_shouldHandleUWBStateReadinessUpdates)
  {
    v19.receiver = self;
    v19.super_class = (Class)NIServerHomeDeviceSession;
    v5 = -[NIServerBaseSession resourcesManager](&v19, "resourcesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uwbSystemAvailable = self->_uwbSystemAvailable;
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "Y";
      if (uwbSystemAvailable)
        v10 = "Y";
      else
        v10 = "N";
      if (!v3)
        v9 = "N";
      *(_DWORD *)buf = 136315394;
      v21 = v10;
      v22 = 2080;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-home,UWB system readiness update. Previously ready? %s. Now ready? %s", buf, 0x16u);
    }
    if (uwbSystemAvailable == v3)
      goto LABEL_32;
    self->_uwbSystemAvailable = v3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remote"));
    objc_msgSend(v11, "didUpdateHomeDeviceUWBRangingAvailability:", self->_uwbSystemAvailable);

    configuration = self->_configuration;
    if (!configuration)
      __assert_rtn("-[NIServerHomeDeviceSession _handleUWBSystemStateReadinessUpdate:]", "NIServerHomeDeviceSession.mm", 1736, "_configuration");
    if (self->_backoffResumeManager.__ptr_)
    {
      v18 = (-[NIConfiguration suspensionPolicy](configuration, "suspensionPolicy") & 4) != 0;
      if (!self->_uwbSystemAvailable)
      {
        v13 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-home,Overriding lock screen only suspension policy: ENABLED.", buf, 2u);
        }
        v18 = 1;
      }
      sub_100266370((uint64_t)self->_backoffResumeManager.__ptr_, (unsigned __int8 *)&v18);
    }
    if (!self->_isRunning)
      goto LABEL_32;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession pauseWithSource:](self, "pauseWithSource:", 2));
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DA680();
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configure](self, "configure"));
      if (v14)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003DA620();
      }
      else
      {
        v15 = objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession run](self, "run"));
        v16 = qword_10085F520;
        if (!v15)
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-home,Successfully re-configured and re-ran session to handle UWB state change", buf, 2u);
          }
          goto LABEL_32;
        }
        v14 = (void *)v15;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003DA5C0();
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remote"));
    objc_msgSend(v17, "uwbSessionDidFailWithError:", v14);

LABEL_32:
    return;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003DA594();
}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequestWithConfig:(SEL)a3
{
  void *v6;
  NSObject *v7;
  int v8;
  unsigned int v9;
  char v10;
  NSObject *v11;
  unsigned int v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  unsigned int v16;
  __int16 v17;
  int64_t v18;
  NSObject *v19;
  const char *v20;
  unsigned int v21;
  char v22;
  NSObject *v23;
  unsigned __int8 v24;
  __int128 v25;
  void *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  NSObject *v31;
  void *v32;
  _BOOL4 v33;
  int v34;
  void *v35;
  _BOOL4 v36;
  NSObject *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  unint64_t *v44;
  unint64_t v45;
  optional<rose::RoseServiceRequest> *result;
  uint8_t v48[16];
  uint8_t buf[504];
  __int16 v50;
  char v51;
  int v52;
  char v53;
  char v54;
  char v55;
  char v56;
  int v57;
  int v58;
  int v59;
  __int128 v60;
  __int16 v61;
  int v62;
  char v63;
  char v64;
  __int16 v65;
  __int16 v66;
  char v67;
  int v68;

  if (!self->_configuration)
    sub_1003DA6E0();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v6, "BOOLForKey:", CFSTR("HomeDeviceEnableSensorFusion")))
  {
    v7 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,sensor fusion is turned on for handoff from defaults write", buf, 2u);
    }
    v8 = 4;
  }
  else
  {
    v8 = 2;
  }
  v9 = objc_msgSend(v6, "BOOLForKey:", CFSTR("HomeDeviceWantsChannelDiversity"));
  v10 = v9;
  if (v9)
  {
    v11 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-home,* Channel diversity turned ON from default writes.", buf, 2u);
    }
  }
  v12 = -[NIHomeDeviceConfiguration isAnchor](self->_configuration, "isAnchor");
  v13 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("No");
    if (v12)
      v14 = CFSTR("Yes");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-home,Should initiate (is anchor): %@.", buf, 0xCu);
  }
  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("NIHomeAnchorForceAntennaDiversity")));

    if (v15)
      v16 = objc_msgSend(v6, "BOOLForKey:", CFSTR("NIHomeAnchorForceAntennaDiversity"));
    else
      v16 = 0;
    v18 = -[NIHomeDeviceConfiguration antennaDiversityOverride](self->_configuration, "antennaDiversityOverride");
    if (v18 == 1)
    {
      v16 = 1;
    }
    else if (v18 == 2)
    {
      v16 = 0;
    }
    else if (!v15)
    {
      v17 = 0;
      goto LABEL_29;
    }
    v19 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v20 = "enabled";
      if (!v16)
        v20 = "disabled";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ses-home,Override antenna diversity to %s", buf, 0xCu);
    }
    v17 = 1;
  }
  else
  {
    v17 = 0;
    LOWORD(v16) = 0;
  }
LABEL_29:
  v21 = objc_msgSend(v6, "BOOLForKey:", CFSTR("NIHomePreferAlternativeAntenna"));
  v22 = v21;
  if (v21)
  {
    v23 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#ses-home,Using alternative antenna for NI Home ranging", buf, 2u);
    }
  }
  v24 = objc_msgSend(v6, "BOOLForKey:", CFSTR("NIHomeDisableDeviceSpecificSTS"));
  v50 = 0;
  v51 = 0;
  v52 = 68354305;
  v53 = 0;
  v54 = 0;
  v55 = 0;
  v56 = 0;
  v57 = 3;
  v58 = v8;
  v59 = 3;
  if ((v24 & 1) != 0)
  {
    v60 = 0uLL;
  }
  else
  {
    if (a4.var0 == 999)
    {
      *(_QWORD *)&v25 = -1;
      *((_QWORD *)&v25 + 1) = -1;
    }
    else
    {
      v25 = 0uLL;
      if (a4.var0 == 2)
        v25 = xmmword_1004722A0;
    }
    v60 = v25;
  }
  v61 = 0;
  v62 = 6;
  v63 = v10;
  v64 = v22 ^ 1;
  v65 = v16 | (v17 << 8);
  v66 = 0;
  v67 = 1;
  v68 = 7;
  v26 = sub_1002CA108();
  v27 = *((_QWORD *)v26 + 406);
  v28 = (std::__shared_weak_count *)*((_QWORD *)v26 + 407);
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v30 = __ldxr(p_shared_owners);
    while (__stxr(v30 + 1, p_shared_owners));
  }
  if (v27)
  {
    if (sub_1002A4728(v27, (char *)&v50, (unsigned __int8 *)&v50 + 1, 0))
    {
      if (v12)
        sub_100163C14((char *)&v50, (uint64_t)buf);
      else
        sub_100164128((char *)&v50, (uint64_t)buf);
      v31 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v48 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#ses-home,[WatchNearbyDevices] sleep will be turned off", v48, 2u);
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](self->_configuration, "sessionKey"));
      v33 = v32 == 0;

      if (v33)
      {
        v37 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v48 = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#ses-home,No session key provided. Use default cipher blob.", v48, 2u);
        }
      }
      else
      {
        v34 = *((_DWORD *)sub_100004784() + 187);
        if (v34)
        {
          if (v34 == 2)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](self->_configuration, "sessionKey"));
            v39 = objc_msgSend(v38, "length") == (id)16;

            if (v39)
            {
LABEL_65:
              memset(v48, 0, sizeof(v48));
              v40 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](self->_configuration, "sessionKey"));
              objc_msgSend(v40, "getBytes:length:", v48, 16);

              *(_OWORD *)&buf[218] = *(_OWORD *)v48;
              if (!buf[234])
                buf[234] = 1;
              goto LABEL_75;
            }
            v41 = (id)qword_10085F520;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](self->_configuration, "sessionKey"));
              sub_1003DA734(v42, (uint64_t)v48);
            }
          }
          else
          {
            if (v34 != 1)
              goto LABEL_75;
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](self->_configuration, "sessionKey"));
            v36 = objc_msgSend(v35, "length") == (id)16;

            if (v36)
              goto LABEL_65;
            v41 = (id)qword_10085F520;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](self->_configuration, "sessionKey"));
              sub_1003DA734(v43, (uint64_t)v48);
            }
          }

          goto LABEL_75;
        }
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003DA778();
      }
LABEL_75:
      memcpy(retstr, buf, 0x1F8uLL);
      retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
      if (!v28)
        goto LABEL_80;
      goto LABEL_76;
    }
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003DA7A4();
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003DA708();
  }
  retstr->var0.__null_state_ = 0;
  retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  if (!v28)
    goto LABEL_80;
LABEL_76:
  v44 = (unint64_t *)&v28->__shared_owners_;
  do
    v45 = __ldaxr(v44);
  while (__stlxr(v45 - 1, v44));
  if (!v45)
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
LABEL_80:

  return result;
}

- (shared_ptr<WiFiRanging::Session>)_buildWifiSession
{
  uint64_t *v2;
  uint64_t *v3;
  NIServerHomeDeviceSession *v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  NIServerHomeDeviceSession *v12;
  NIServerHomeDeviceSession *v13;
  NIServerHomeDeviceSession *v14;
  OS_dispatch_queue *clientQueue;
  __shared_weak_count *cntrl;
  unint64_t *v17;
  unint64_t v18;
  __shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  Session *v34;
  __shared_weak_count *v35;
  void *__p[2];
  char v37;
  objc_super v38;
  NIServerProximityWifiCAManager *v39;
  std::__shared_weak_count *v40;
  Logger *ptr;
  std::__shared_weak_count *v42;
  _QWORD v43[3];
  _QWORD *v44;
  _QWORD v45[3];
  _QWORD *v46;
  _QWORD v47[3];
  _QWORD *v48;
  shared_ptr<WiFiRanging::Session> result;

  v3 = v2;
  v4 = self;
  v38.receiver = v4;
  v38.super_class = (Class)NIServerHomeDeviceSession;
  v5 = -[NIServerBaseSession resourcesManager](&v38, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverSessionIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

  v9 = objc_retainAutorelease(v8);
  sub_10000BF04(__p, (char *)objc_msgSend(v9, "UTF8String"));
  v10 = operator new(0x1B0uLL);
  v10[1] = 0;
  v10[2] = 0;
  *v10 = off_10080D9D8;
  v11 = (uint64_t)(v10 + 3);
  v12 = v4;
  v47[0] = off_10080DA28;
  v47[1] = v12;
  v48 = v47;
  v13 = v12;
  v45[0] = off_10080DAE0;
  v45[1] = v13;
  v46 = v45;
  v14 = v13;
  v43[0] = off_10080DB60;
  v43[1] = v14;
  v44 = v43;
  clientQueue = v4->_clientQueue;
  ptr = v4->_pbLogger.__ptr_;
  cntrl = v4->_pbLogger.__cntrl_;
  v42 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    v17 = (unint64_t *)((char *)cntrl + 8);
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  v39 = v4->_wifiCAManager.__ptr_;
  v19 = v4->_wifiCAManager.__cntrl_;
  v40 = (std::__shared_weak_count *)v19;
  if (v19)
  {
    v20 = (unint64_t *)((char *)v19 + 8);
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  sub_10002DC3C(v11, (__int128 *)__p, (uint64_t)v47, (uint64_t)v45, (uint64_t)v43, clientQueue, &ptr, &v39);
  v22 = v40;
  if (v40)
  {
    p_shared_owners = (unint64_t *)&v40->__shared_owners_;
    do
      v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = v42;
  if (v42)
  {
    v26 = (unint64_t *)&v42->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v28 = v44;
  if (v44 == v43)
  {
    v29 = 4;
    v28 = v43;
  }
  else
  {
    if (!v44)
      goto LABEL_22;
    v29 = 5;
  }
  (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_22:
  v30 = v46;
  if (v46 == v45)
  {
    v31 = 4;
    v30 = v45;
  }
  else
  {
    if (!v46)
      goto LABEL_27;
    v31 = 5;
  }
  (*(void (**)(void))(*v30 + 8 * v31))();
LABEL_27:
  v32 = v48;
  if (v48 == v47)
  {
    v33 = 4;
    v32 = v47;
  }
  else
  {
    if (!v48)
      goto LABEL_32;
    v33 = 5;
  }
  (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_32:
  *v3 = v11;
  v3[1] = (uint64_t)v10;
  if (v37 < 0)
    operator delete(__p[0]);

  result.__cntrl_ = v35;
  result.__ptr_ = v34;
  return result;
}

- (shared_ptr<rose::objects::GRSession>)_buildRoseSession:(const void *)a3
{
  _QWORD *v3;
  _QWORD *v5;
  NIServerHomeDeviceSession *v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  NIServerHomeDeviceSession *v9;
  NIServerHomeDeviceSession *v10;
  NIServerHomeDeviceSession *v11;
  NIServerHomeDeviceSession *v12;
  NIServerHomeDeviceSession *v13;
  NIServerHomeDeviceSession *v14;
  __shared_weak_count *cntrl;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  GRSession *v48;
  __shared_weak_count *v49;
  _QWORD *v50;
  std::__shared_weak_count *v51;
  void *__p[2];
  char v53;
  Logger *ptr;
  std::__shared_weak_count *v55;
  _QWORD v56[3];
  _QWORD *v57;
  _BYTE v58[24];
  _BYTE *v59;
  _BYTE v60[24];
  _BYTE *v61;
  _QWORD v62[3];
  _QWORD *v63;
  _BYTE v64[24];
  _BYTE *v65;
  _QWORD v66[3];
  _QWORD *v67;
  _QWORD v68[3];
  _QWORD *v69;
  _QWORD v70[3];
  _QWORD *v71;
  uint8_t buf[8];
  NIServerHomeDeviceSession *v73;
  uint8_t *v74;
  shared_ptr<rose::objects::GRSession> result;

  v5 = v3;
  v6 = self;
  sub_10000BF04(__p, (char *)-[NSString UTF8String](v6->_containerUniqueIdentifier, "UTF8String"));
  v7 = (std::__shared_weak_count *)operator new(0x5D8uLL);
  v7->__shared_owners_ = 0;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)off_10080C460;
  v8 = (uint64_t)&v7[1];
  v9 = v6;
  *(_QWORD *)buf = off_10080DBE0;
  v73 = v9;
  v74 = buf;
  v10 = v9;
  v70[0] = off_10080DC60;
  v70[1] = v10;
  v71 = v70;
  v11 = v10;
  v68[0] = off_10080DCE0;
  v68[1] = v11;
  v69 = v68;
  v12 = v11;
  v66[0] = off_10080DD60;
  v66[1] = v12;
  v67 = v66;
  v65 = 0;
  v13 = v12;
  v62[0] = off_10080DE18;
  v62[1] = v13;
  v63 = v62;
  v61 = 0;
  v59 = 0;
  v14 = v13;
  v56[0] = off_10080DED0;
  v56[1] = v14;
  v57 = v56;
  ptr = v6->_pbLogger.__ptr_;
  cntrl = v6->_pbLogger.__cntrl_;
  v55 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    v16 = (unint64_t *)((char *)cntrl + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  sub_1002ADC18(v8, (__int128 *)__p, (void *)a3, (uint64_t)buf, (uint64_t)v70, (uint64_t)v68, (uint64_t)v66, (uint64_t)v64, (uint64_t)v62, (uint64_t)v60, (uint64_t)v58, (uint64_t)v56, &ptr);
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)off_10080C7D0;
  v7[1].__shared_owners_ = (uint64_t)off_10080C898;
  v18 = v55;
  if (v55)
  {
    p_shared_owners = (unint64_t *)&v55->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v57;
  if (v57 == v56)
  {
    v22 = 4;
    v21 = v56;
  }
  else
  {
    if (!v57)
      goto LABEL_14;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_14:
  v23 = v59;
  if (v59 == v58)
  {
    v24 = 4;
    v23 = v58;
  }
  else
  {
    if (!v59)
      goto LABEL_19;
    v24 = 5;
  }
  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_19:
  v25 = v61;
  if (v61 == v60)
  {
    v26 = 4;
    v25 = v60;
  }
  else
  {
    if (!v61)
      goto LABEL_24;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_24:
  v27 = v63;
  if (v63 == v62)
  {
    v28 = 4;
    v27 = v62;
  }
  else
  {
    if (!v63)
      goto LABEL_29;
    v28 = 5;
  }
  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_29:
  v29 = v65;
  if (v65 == v64)
  {
    v30 = 4;
    v29 = v64;
  }
  else
  {
    if (!v65)
      goto LABEL_34;
    v30 = 5;
  }
  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_34:
  v31 = v67;
  if (v67 == v66)
  {
    v32 = 4;
    v31 = v66;
  }
  else
  {
    if (!v67)
      goto LABEL_39;
    v32 = 5;
  }
  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_39:
  v33 = v69;
  if (v69 == v68)
  {
    v34 = 4;
    v33 = v68;
  }
  else
  {
    if (!v69)
      goto LABEL_44;
    v34 = 5;
  }
  (*(void (**)(void))(*v33 + 8 * v34))();
LABEL_44:
  v35 = v71;
  if (v71 == v70)
  {
    v36 = 4;
    v35 = v70;
  }
  else
  {
    if (!v71)
      goto LABEL_49;
    v36 = 5;
  }
  (*(void (**)(void))(*v35 + 8 * v36))();
LABEL_49:
  v37 = v74;
  if (v74 == buf)
  {
    v38 = 4;
    v37 = buf;
  }
  else
  {
    if (!v74)
      goto LABEL_54;
    v38 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v37 + 8 * v38))();
LABEL_54:
  v50 = &v7[1].__vftable;
  v51 = v7;
  sub_10001B020((uint64_t)&v50, &v7[1].__shared_weak_owners_, v8);
  v39 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#ses-home,Registering for UWB service.", buf, 2u);
  }
  v40 = sub_1002AEA48((uint64_t)v50);
  if (v40)
  {
    v41 = (id)qword_10085F520;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      sub_1002B48B0(v40, buf);
      sub_1003DA80C();
    }

    *v5 = 0;
    v5[1] = 0;
  }
  else
  {
    v42 = v51;
    *v5 = v50;
    v5[1] = v42;
    if (!v42)
      goto LABEL_68;
    v43 = (unint64_t *)&v42->__shared_owners_;
    do
      v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
  }
  v45 = v51;
  if (v51)
  {
    v46 = (unint64_t *)&v51->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
LABEL_68:
  if (v53 < 0)
    operator delete(__p[0]);

  result.__cntrl_ = v49;
  result.__ptr_ = v48;
  return result;
}

- (void)_stopWiFiSessionsWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  unordered_map<unsigned long long, std::shared_ptr<WiFiRanging::Session>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::shared_ptr<WiFiRanging::Session>>>> *p_wifiSessions;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *>>> *i;
  int v8;
  id v9;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-home,Stop WiFi sessions with reason: [%@]", (uint8_t *)&v8, 0xCu);
  }
  p_wifiSessions = &self->_wifiSessions;
  if (p_wifiSessions->__table_.__p2_.__value_)
  {
    for (i = &p_wifiSessions->__table_.__p1_; ; sub_10002DE08((const std::string *)i[3].__value_.__next_))
    {
      i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *>>> *)i->__value_.__next_;
      if (!i)
        break;
    }
    sub_1001EAE54((uint64_t)p_wifiSessions);
  }

}

- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  NSObject *v7;
  NINearbyUpdatesEngine *updatesEngine;
  __shared_weak_count *cntrl;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, UWBResponderInformation>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, UWBResponderInformation>, void *>>> *i;
  std::__shared_weak_count *next;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v26;
  std::__shared_weak_count *v27;
  GRSession *ptr;
  __shared_weak_count *v29;
  objc_super v30;
  uint8_t buf[4];
  unint64_t v32;

  v3 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NIServerHomeDeviceSession;
  v5 = -[NIServerBaseSession disableAllServices](&v30, "disableAllServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100186C64((uint64_t)&self->_cachedRegionUpdateEvent);
  -[CMMotionManager stopMagnetometerUpdates](self->_motionManager, "stopMagnetometerUpdates");
  if (self->_filteredMFStrength.__engaged_)
    self->_filteredMFStrength.__engaged_ = 0;
  *(_QWORD *)&self->_anon_1c8[8] = *(_QWORD *)self->_anon_1c8;
  *(_QWORD *)&self->_anon_1c8[32] = *(_QWORD *)&self->_anon_1c8[24];
  *(_QWORD *)&self->_anon_1f8[8] = *(_QWORD *)self->_anon_1f8;
  *(_QWORD *)&self->_anon_1f8[32] = *(_QWORD *)&self->_anon_1f8[24];
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,streaming raw magnetometer data stopped", buf, 2u);
  }
  -[NINearbyUpdatesEngine invalidate](self->_updatesEngine, "invalidate");
  updatesEngine = self->_updatesEngine;
  self->_updatesEngine = 0;

  if (self->_initiatorSession.__ptr_)
  {
    if (v3)
    {
      cntrl = self->_initiatorSession.__cntrl_;
      ptr = self->_initiatorSession.__ptr_;
      v29 = cntrl;
      if (cntrl)
      {
        v10 = (unint64_t *)((char *)cntrl + 8);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }
      -[NIServerHomeDeviceSession _sendHangupSignalForSession:](self, "_sendHangupSignalForSession:", &ptr);
      v12 = (std::__shared_weak_count *)v29;
      if (v29)
      {
        v13 = (unint64_t *)((char *)v29 + 8);
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
    }
    sub_1002AE5BC((uint64_t)self->_initiatorSession.__ptr_);
    sub_100180AF4(&self->_initiatorSession.__ptr_);
  }
  if (self->_responderSessions.__table_.__p2_.__value_)
  {
    v15 = qword_10085F520;
    if (v3)
    {
      v16 = (id)qword_10085F520;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_responderSessions.__table_.__p2_.__value_
            * (_QWORD)-[NIServerHomeDeviceSession nominalCycleRate](self, "nominalCycleRate");
        *(_DWORD *)buf = 134217984;
        v32 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-home,Cleaning responder sessions. sendHangupSignal = YES. This will take (%llu ms).", buf, 0xCu);
      }

    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-home,Cleaning responder sessions.", buf, 2u);
    }
    for (i = &self->_responderSessions.__table_.__p1_; ; sub_1002AE5BC((uint64_t)i[3].__value_.__next_))
    {
      i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, UWBResponderInformation>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, UWBResponderInformation>, void *>>> *)i->__value_.__next_;
      if (!i)
        break;
      if (v3)
      {
        next = (std::__shared_weak_count *)i[4].__value_.__next_;
        v26 = i[3].__value_.__next_;
        v27 = next;
        if (next)
        {
          p_shared_owners = (unint64_t *)&next->__shared_owners_;
          do
            v21 = __ldxr(p_shared_owners);
          while (__stxr(v21 + 1, p_shared_owners));
        }
        -[NIServerHomeDeviceSession _sendHangupSignalForSession:](self, "_sendHangupSignalForSession:", &v26);
        v22 = v27;
        if (v27)
        {
          v23 = (unint64_t *)&v27->__shared_owners_;
          do
            v24 = __ldaxr(v23);
          while (__stlxr(v24 - 1, v23));
          if (!v24)
          {
            ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
            std::__shared_weak_count::__release_weak(v22);
          }
        }
      }
    }
    sub_1001EAE54((uint64_t)&self->_responderSessions);
  }
  -[NIServerHomeDeviceSession _stopWiFiSessionsWithReason:](self, "_stopWiFiSessionsWithReason:", CFSTR("_disableAllServices"), v26);
  return v6;
}

- (void)_peerHungUp:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  NIServerSessionResourceManager *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  objc_super v13;
  objc_super v14;
  uint8_t buf[4];
  unint64_t v16;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283521;
    v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-home,#hangup from address 0x%{private}llx.", buf, 0xCu);
  }
  v14.receiver = self;
  v14.super_class = (Class)NIServerHomeDeviceSession;
  v6 = -[NIServerBaseSession discoveryTokenFromIdentifier:](&v14, "discoveryTokenFromIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)NIServerHomeDeviceSession;
    v8 = -[NIServerBaseSession resourcesManager](&v13, "resourcesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lifecycleSupervisor"));
    v11 = objc_msgSend(v10, "isTrackingPeer:", v7);

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lifecycleSupervisor"));
      objc_msgSend(v12, "peerHangupReceived:", v7);

      -[NIServerHomeDeviceSession _removePeerObject:uwbIdentifier:withReason:](self, "_removePeerObject:uwbIdentifier:withReason:", v7, a3, 1);
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003DA85C();
  }

}

- (void)_sendHangupSignalForSession:(shared_ptr<rose::objects::GRSession>)a3
{
  uint64_t *ptr;
  NSObject *v5;
  int v6;
  _QWORD *v7;
  duration<long long, std::ratio<1, 1000>> v8;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9;
  std::chrono::nanoseconds __ns;
  uint8_t buf[8];
  _QWORD *v12;

  if (*(_QWORD *)a3.__ptr_)
  {
    ptr = (uint64_t *)a3.__ptr_;
    v5 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      if ((*(_DWORD *)(*ptr + 680) & 0xFF0000) != 0)
        v6 = (unsigned __int16)*(_DWORD *)(*ptr + 680);
      else
        v6 = 0xFFFF;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-home,#hangup Sending hangup signal for session with ticket ID: %d", buf, 8u);
    }
    LOBYTE(__ns.__rep_) = 0;
    sub_100191910(buf, 0x10uLL, &__ns);
    v7 = *(_QWORD **)buf;
    **(_WORD **)buf = 258;
    *(_QWORD *)((char *)v7 + 2) = 0;
    v7[1] = 0;
    sub_1002B1E34(*ptr, (uint64_t)buf);
    v8.__rep_ = (int64_t)-[NIServerHomeDeviceSession nominalCycleRate](self, "nominalCycleRate");
    if (v8.__rep_ >= 1)
    {
      v9 = 1000000 * v8.__rep_;
      if ((unint64_t)v8.__rep_ >= 0x8637BD057A0)
        v9 = 0x7FFFFFFFFFFFFFFFLL;
      __ns.__rep_ = v9;
      std::this_thread::sleep_for (&__ns);
    }
    if (*(_QWORD *)buf)
    {
      v12 = *(_QWORD **)buf;
      operator delete(*(void **)buf);
    }
  }
}

- (id)_addPeers:(id)a3
{
  NIServerSessionResourceManager *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  void *i;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  __int128 v25;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  uint8_t buf[4];
  unsigned int v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v27 = a3;
  v33.receiver = self;
  v33.super_class = (Class)NIServerHomeDeviceSession;
  v4 = -[NIServerBaseSession resourcesManager](&v33, "resourcesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "btResource"));

  if (-[NIHomeDeviceConfiguration isAnchor](self->_configuration, "isAnchor"))
    goto LABEL_8;
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-home,Not an anchor session, verifying responder limit hasn't been reached.", buf, 2u);
  }
  if ((uint64_t)objc_msgSend(v28, "currentPeerCount") < 4)
  {
LABEL_8:
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("NIHomeDisableAllowListPolicy")));
    v10 = v9 == 0;

    if (v10)
      v11 = 0;
    else
      v11 = objc_msgSend(v26, "BOOLForKey:", CFSTR("NIHomeDisableAllowListPolicy"));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v27;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v13)
    {
      v15 = *(_QWORD *)v30;
      *(_QWORD *)&v14 = 67109378;
      v25 = v14;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v18 = -[NIServerHomeDeviceSession _homeAnchorVariantFromDiscoveryToken:](self, "_homeAnchorVariantFromDiscoveryToken:", v17, v25);
          v19 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v35 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ses-home,#allow-list anchor variant from discovery token: %u", buf, 8u);
          }
          if (v18 < 0x3E7)
            v20 = 1;
          else
            v20 = v11;
          if ((v20 & 1) != 0)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rawToken"));
            v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "addPeerDiscoveryToken:", v21));

            if (v8)
              goto LABEL_30;
          }
          else
          {
            v22 = (id)qword_10085F520;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "descriptionInternal"));
              *(_DWORD *)buf = v25;
              v35 = v18;
              v36 = 2112;
              v37 = v23;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#ses-home,#allow-list peer device anchor variant (%u) not supported. Will not attempt to range with %@", buf, 0x12u);

            }
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v13);
    }
    v8 = 0;
LABEL_30:

  }
  else
  {
    v7 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DA8BC(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5885, 0));
  }

  return v8;
}

- (void)_roseSession:(shared_ptr<rose:(int)a4 :objects::RoseBaseSession>)a3 invalidatedWithReason:
{
  int var1;
  NSObject *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  objc_super v10;
  _QWORD v11[3];

  var1 = (int)a3.var1;
  v6 = (id)qword_10085F520;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1002B48E0(var1, v11);
    sub_1003DA934();
  }

  -[NIServerHomeDeviceSession invalidate](self, "invalidate");
  v10.receiver = self;
  v10.super_class = (Class)NIServerHomeDeviceSession;
  v7 = -[NIServerBaseSession invalidationHandler](&v10, "invalidationHandler");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
  ((void (**)(_QWORD, void *))v8)[2](v8, v9);

}

- (BOOL)_shouldRespondToDevice:(id)a3
{
  return self->_responderSessions.__table_.__p2_.__value_ < 5;
}

- (id)_triggerInitiatorRanging
{
  GRSession *ptr;
  void *v3;
  __int128 v5;
  char v6;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  int v12;

  ptr = self->_initiatorSession.__ptr_;
  if (!ptr)
    sub_1003DA984();
  LOBYTE(v5) = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0;
  if (sub_1002B1704((uint64_t)ptr, &v5))
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
  else
    v3 = 0;
  return v3;
}

- (id)_triggerResponderRangingForSession:(shared_ptr<rose:(id)a4 :objects::GRSession>)a3 initiatorDevice:
{
  uint64_t *ptr;
  __shared_weak_count *v6;
  __shared_weak_count *v7;
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  const char *v13;
  int v14;
  _QWORD v15[3];
  __int128 v16;
  __int16 v17;
  char v18;
  int v19;
  __int16 v20;
  char v21;
  char v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int v28;

  ptr = (uint64_t *)a3.__ptr_;
  v6 = a3.__cntrl_;
  v7 = v6;
  if (!*ptr)
  {
    v13 = "session";
    v14 = 2207;
    goto LABEL_11;
  }
  if (self->_currentSessionRole != 1)
  {
    v13 = "_currentSessionRole == Role::Responder";
    v14 = 2208;
LABEL_11:
    __assert_rtn("-[NIServerHomeDeviceSession _triggerResponderRangingForSession:initiatorDevice:]", "NIServerHomeDeviceSession.mm", v14, v13);
  }
  v8 = -[__shared_weak_count btAdvertisingAddress](v6, "btAdvertisingAddress");
  v19 = (int)v8;
  v20 = WORD2(v8);
  LODWORD(v16) = 2;
  BYTE4(v16) = 0;
  v17 = 0;
  v18 = 0;
  v21 = 1;
  v22 = 1;
  v23 = 0;
  v24 = 0;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0;
  v9 = sub_1002B1704(*ptr, &v16);
  if (v9)
  {
    v10 = (id)qword_10085F520;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_1002B48B0(v9, v15);
      sub_1003DA9AC();
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_notifyPeerRemoval:(id)a3 withReason:(unint64_t)a4
{
  id v6;
  NIServerSessionResourceManager *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  const __CFString *v13;
  NSObject *v14;
  NSString *containerUniqueIdentifier;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  NSString *v22;
  id v23;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v16.receiver = self;
  v16.super_class = (Class)NIServerHomeDeviceSession;
  v7 = -[NIServerBaseSession resourcesManager](&v16, "resourcesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remote"));
  v23 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  objc_msgSend(v9, "didRemoveNearbyObjects:withReason:", v10, a4);

  v11 = sub_10000883C();
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "discoveryToken"));
  sub_100211A6C((uint64_t)&self->_handoffCAManager, (unint64_t)objc_msgSend(v12, "hash"), v11);

  if (a4 >= 3)
    v13 = &stru_10081D5E0;
  else
    v13 = *(&off_10080E058 + a4);
  v14 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 138412802;
    v18 = v6;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-home,_notifyPeerRemoval: %@ with reason: %@ for session identifier: %@", buf, 0x20u);
  }

}

- (void)_removePeerObject:(id)a3 uwbIdentifier:(unint64_t)a4 withReason:(unint64_t)a5
{
  id v8;
  NIServerSessionResourceManager *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t *v13;
  NSObject *v14;
  int v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  NSObject *v22;
  char v23;
  _QWORD *v24;
  _QWORD *v25;
  const std::string *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  NSObject *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  objc_super v39;
  unint64_t v40;
  uint8_t buf[4];
  _QWORD v42[2];

  v8 = a3;
  v40 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v39.receiver = self;
  v39.super_class = (Class)NIServerHomeDeviceSession;
  v9 = -[NIServerBaseSession resourcesManager](&v39, "resourcesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (self->_currentSessionRole != 1)
  {
LABEL_21:
    v23 = 1;
    goto LABEL_22;
  }
  v11 = sub_1000550B8(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, &v40);
  v12 = v11;
  if (v11)
  {
    v13 = v11 + 3;
    if (v11[3])
    {
      v14 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        if ((*(_DWORD *)(*v13 + 680) & 0xFF0000) != 0)
          v15 = (unsigned __int16)*(_DWORD *)(*v13 + 680);
        else
          v15 = 0xFFFF;
        *(_DWORD *)buf = 67109376;
        LODWORD(v42[0]) = v15;
        WORD2(v42[0]) = 1024;
        *(_DWORD *)((char *)v42 + 6) = a5 != 1;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-home,Invalidating session with ticket ID: %d. Send hangup signal: %d", buf, 0xEu);
      }
      if (a5 != 1)
      {
        v16 = (std::__shared_weak_count *)v12[4];
        v37 = v12[3];
        v38 = v16;
        if (v16)
        {
          p_shared_owners = (unint64_t *)&v16->__shared_owners_;
          do
            v18 = __ldxr(p_shared_owners);
          while (__stxr(v18 + 1, p_shared_owners));
        }
        -[NIServerHomeDeviceSession _sendHangupSignalForSession:](self, "_sendHangupSignalForSession:", &v37);
        v19 = v38;
        if (v38)
        {
          v20 = (unint64_t *)&v38->__shared_owners_;
          do
            v21 = __ldaxr(v20);
          while (__stlxr(v21 - 1, v20));
          if (!v21)
          {
            ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
            std::__shared_weak_count::__release_weak(v19);
          }
        }
      }
      sub_1002AE5BC(*v13);
      sub_100180AF4(v12 + 3);
    }
    sub_10002A5A0(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, v12, (uint64_t)buf);
    sub_1001E86F4((uint64_t)buf, 0);
    v22 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v42[0] = v40;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ses-home,removing 0x%llx from tracked devices", buf, 0xCu);
    }
    goto LABEL_21;
  }
  v23 = 0;
LABEL_22:
  v24 = sub_1000550B8(&self->_wifiSessions.__table_.__bucket_list_.__ptr_.__value_, &v40);
  v25 = v24;
  if (v24)
  {
    v26 = (const std::string *)v24[3];
    if (v26)
      sub_10002DE08(v26);
    sub_10002A5A0(&self->_wifiSessions.__table_.__bucket_list_.__ptr_.__value_, v25, (uint64_t)buf);
    sub_1001E86F4((uint64_t)buf, 0);
  }
  else if ((v23 & 1) == 0)
  {
    v27 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42[0] = v8;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#ses-home,Did not find a UWB or WiFi ToF session for token: %@", buf, 0xCu);
    }
  }
  -[NINearbyUpdatesEngine clearStateForToken:](self->_updatesEngine, "clearStateForToken:", v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession objectFromIdentifier:](self, "objectFromIdentifier:", v40));
  if (v28)
  {
    -[NIServerHomeDeviceSession _notifyPeerRemoval:withReason:](self, "_notifyPeerRemoval:withReason:", v28, a5);
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003DAA5C();
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btResource"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rawToken"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "removePeerDiscoveryToken:", v30));

  if (v31)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DA9FC();
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btResource"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "deviceCache"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rawToken"));
    v35 = objc_msgSend(v33, "uncacheDeviceByTokenData:", v34);

    if ((v35 & 1) == 0)
    {
      v36 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v42[0] = v8;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#ses-home,Peer discovery token wasn't cached, so nothing to uncache. Peer likely hadn't been discovered yet. Token: %@", buf, 0xCu);
      }
    }
  }

}

- (int64_t)_roseMotionStateToNIMotionActivityState:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (a3 == 1)
    return 2;
  else
    return a3 == 2;
}

- (void)_handleMotionStateChange:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void **v6;
  int64_t v7;
  NIServerSessionResourceManager *v8;
  void *v9;
  void *v10;
  optional<NIServerRegionUpdateEvent> *p_cachedRegionUpdateEvent;
  NINearbyObject *v12;
  NIRegionPredicate *v13;
  NIRegionPredicate *v14;
  void *v15;
  NSObject *v16;
  objc_super v17;
  void *__p[2];
  char v19;
  uint8_t buf[4];
  void **v21;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_1001CD9B8(v3, __p);
    v6 = v19 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-home,received new motion state %s", buf, 0xCu);
    if (v19 < 0)
      operator delete(__p[0]);
  }

  v7 = -[NIServerHomeDeviceSession _roseMotionStateToNIMotionActivityState:](self, "_roseMotionStateToNIMotionActivityState:", v3);
  if (self->_motionState != v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)NIServerHomeDeviceSession;
    v8 = -[NIServerBaseSession resourcesManager](&v17, "resourcesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    self->_motionState = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remote"));
    objc_msgSend(v10, "didUpdateMotionState:", v7);

    if (v7 == 2 && self->_shouldDeliverUpdates)
    {
      p_cachedRegionUpdateEvent = &self->_cachedRegionUpdateEvent;
      if (self->_cachedRegionUpdateEvent.__engaged_)
      {
        v12 = self->_cachedRegionUpdateEvent.var0.__val_._object;
        if (!p_cachedRegionUpdateEvent->__engaged_)
          sub_10000BA44();
        v13 = p_cachedRegionUpdateEvent->var0.__val_._currentRegion;
        if (!p_cachedRegionUpdateEvent->__engaged_)
          sub_10000BA44();
        v14 = p_cachedRegionUpdateEvent->var0.__val_._previousRegion;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remote"));
        objc_msgSend(v15, "object:didUpdateRegion:previousRegion:", v12, v13, v14);

        v16 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(__p[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-home,delivered cached region update event", (uint8_t *)__p, 2u);
        }
        sub_100186C64((uint64_t)p_cachedRegionUpdateEvent);

      }
    }

  }
}

- (void)_handleScreenStateChange:(int)a3
{
  double v5;
  NIServerSessionResourceManager *v6;
  void *v7;
  void *v8;
  objc_super v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5 = sub_10000883C();
  v9.receiver = self;
  v9.super_class = (Class)NIServerHomeDeviceSession;
  v6 = -[NIServerBaseSession resourcesManager](&v9, "resourcesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (a3 == 2)
  {
    atomic_store(0, (unsigned __int8 *)&self->_wifiRangingAllowedLockscreen);
    -[NIServerHomeDeviceSession _stopWiFiSessionsWithReason:](self, "_stopWiFiSessionsWithReason:", CFSTR("Not on lock screen."));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "btResource"));
    objc_msgSend(v8, "clearWifiRangingActiveAdvertisement");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    sub_1002AD8A4((uint64_t)self->_wifiCAManager.__ptr_, v5);
    atomic_store(1u, (unsigned __int8 *)&self->_wifiRangingAllowedLockscreen);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "btResource"));
    objc_msgSend(v8, "setWifiRangingActiveAdvertisement");
LABEL_5:

  }
}

- (void)_handleBackoffManagerRecommendation:(int)a3 machContinuousTimeSec:(double)a4
{
  NSObject *v7;
  void **v8;
  NIServerSessionResourceManager *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_super v15;
  void *__p[2];
  char v17;
  uint8_t buf[4];
  void **v19;
  __int16 v20;
  double v21;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_1002678BC(a3, __p);
    v8 = v17 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315394;
    v19 = v8;
    v20 = 2048;
    v21 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,#backoff received backoff-resume manager decision: %s, machContTimeSeconds %f", buf, 0x16u);
    if (v17 < 0)
      operator delete(__p[0]);
  }

  v15.receiver = self;
  v15.super_class = (Class)NIServerHomeDeviceSession;
  v9 = -[NIServerBaseSession resourcesManager](&v15, "resourcesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (a3)
  {
    if (a3 == 1)
    {
      v11 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-home,#backoff notifying interruption ended.", (uint8_t *)__p, 2u);
      }
      objc_msgSend(v10, "interruptionReasonEnded:monotonicTimeSeconds:", 3, a4);
      if (-[NIServerHomeDeviceSession _isWifiRangingAllowed](self, "_isWifiRangingAllowed"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btResource"));
        objc_msgSend(v12, "setWifiRangingActiveAdvertisement");

      }
    }
  }
  else
  {
    v13 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-home,#backoff notifying interruption started.", (uint8_t *)__p, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btResource"));
    objc_msgSend(v14, "clearWifiRangingActiveAdvertisement");

    objc_msgSend(v10, "interruptSessionWithReason:monotonicTimeSeconds:", 3, a4);
  }

}

- (void)_handleWifiRangingAvailableUpdate:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-home,wifi ranging availability update", buf, 2u);
  }
  atomic_store(v3, (unsigned __int8 *)&self->_wifiServiceAllowsRanging);
  v6 = qword_10085F520;
  v7 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-home,wifi is now available, so wifi ranging is resuming", v9, 2u);
    }
    -[NIServerHomeDeviceSession _resumeWifiRanging](self, "_resumeWifiRanging");
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-home,wifi is no longer available, so pausing wifi ranging", v8, 2u);
    }
    -[NIServerHomeDeviceSession _pauseWifiRanging](self, "_pauseWifiRanging");
  }
}

- (BOOL)_biasCorrectionRequirementFromModelString:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("AudioAccessory6,1"));
}

- (int64_t)_regionCategoryFromModelString:(id)a3
{
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("AudioAccessory6,1")))
    return 10;
  else
    return 0;
}

- (int)_magneticFieldStrengthCheckOptionFromModelString:(id)a3
{
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("AudioAccessory6,1")))
    return 2;
  else
    return 1;
}

- (void)_calculateMagneticFieldBias
{
  unsigned __int8 *anon_1c8;
  unsigned __int8 *anon_1f8;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  float32x4_t *v9;
  float32x4_t v10;
  float32x4_t v11;
  int32x2_t v12;
  float32x4_t *v13;
  float32x4_t *v14;
  float32x4_t v15;
  float32x4_t v16;
  int32x2_t v17;
  float32x4_t v18;
  int v19;
  double v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;

  anon_1c8 = self->_anon_1c8;
  if (sub_1001E6540(self->_anon_1c8))
  {
    anon_1f8 = self->_anon_1f8;
    if (sub_1001E6540(self->_anon_1f8))
    {
      v5 = *((_QWORD *)anon_1c8 + 4);
      if (v5 == *((_QWORD *)anon_1c8 + 3))
        sub_1003DAA88();
      v6 = *(_QWORD *)&self->_anon_1f8[32];
      if (v6 == *(_QWORD *)&self->_anon_1f8[24])
        sub_1003DAAB0();
      v7 = *(double *)(v5 - 8);
      v8 = *(double *)(v6 - 8);
      if (vabdd_f64(v7, v8) < 0.025)
      {
        v9 = *(float32x4_t **)anon_1c8;
        v10 = 0uLL;
        while (v9 != *((float32x4_t **)anon_1c8 + 1))
        {
          v11 = *v9++;
          v10 = vaddq_f32(v10, v11);
        }
        v22 = v10;
        *(float *)v12.i32 = (float)(unint64_t)sub_1001E6540(anon_1c8);
        v23 = vdivq_f32(v22, (float32x4_t)vdupq_lane_s32(v12, 0));
        v13 = *(float32x4_t **)anon_1f8;
        v14 = *(float32x4_t **)&self->_anon_1f8[8];
        v15 = 0uLL;
        if (*(float32x4_t **)anon_1f8 != v14)
        {
          do
          {
            v16 = *v13++;
            v15 = vaddq_f32(v15, v16);
          }
          while (v13 != v14);
        }
        v21 = v15;
        *(float *)v17.i32 = (float)(unint64_t)sub_1001E6540(self->_anon_1f8);
        v18 = vsubq_f32(v23, vdivq_f32(v21, (float32x4_t)vdupq_lane_s32(v17, 0)));
        v19 = self->_anon_1a0[24];
        if (v8 >= v7)
          v20 = v8;
        else
          v20 = v7;
        *(float32x4_t *)&self->_estMagneticFieldBias.var0.__null_state_ = v18;
        *(double *)&self->_anon_1a0[8] = v20;
        if (!v19)
          self->_anon_1a0[24] = 1;
      }
    }
  }
}

- (int)_intentPredictorConfigFromModelString:(id)a3
{
  if (sub_1001E035C(a3) == 201)
    return 2;
  else
    return 1;
}

- (BOOL)_validateDiscoveryTokenDict:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_10082BFE0));
    if (v6 && (v7 = objc_opt_class(NSData, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", &off_10082BFF8));
      if (v9 && (v10 = objc_opt_class(NSData, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
      {
        v11 = 1;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003DAB58();
        v11 = 0;
      }

    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DAB2C();
      v11 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DAB00();
    v11 = 0;
  }

  return v11;
}

- (unsigned)_flagsFromDiscoveryToken:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;

  v4 = sub_10028F154(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[NIServerHomeDeviceSession _validateDiscoveryTokenDict:](self, "_validateDiscoveryTokenDict:", v5))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10082C010));
    if (v7 && (v8 = objc_opt_class(NSNumber, v6), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
      v9 = objc_msgSend(v7, "unsignedIntValue");
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_biasCorrectionRequirementFromDiscoveryToken:(id)a3
{
  return (-[NIServerHomeDeviceSession _flagsFromDiscoveryToken:](self, "_flagsFromDiscoveryToken:", a3) >> 1) & 1;
}

- (int)_magneticFieldStrengthCheckOptionFromDiscoveryToken:(id)a3
{
  if (-[NIServerHomeDeviceSession _homeAnchorVariantFromDiscoveryToken:](self, "_homeAnchorVariantFromDiscoveryToken:", a3) == 2)return 2;
  else
    return 1;
}

- (int64_t)_regionCategoryFromDiscoveryToken:(id)a3
{
  if ((-[NIServerHomeDeviceSession _flagsFromDiscoveryToken:](self, "_flagsFromDiscoveryToken:", a3) & 4) != 0)
    return 10;
  else
    return 0;
}

- (unsigned)_homeAnchorVariantFromDiscoveryToken:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  NSObject *v10;
  uint8_t v12[16];

  v4 = sub_10028F154(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[NIServerHomeDeviceSession _validateDiscoveryTokenDict:](self, "_validateDiscoveryTokenDict:", v5))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10082C028));
    if (v7)
    {
      v8 = objc_opt_class(NSNumber, v6);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = sub_1003610D4((uint64_t)objc_msgSend(v7, "unsignedIntValue"));
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003DAB84();
        v9 = 999;
      }
    }
    else
    {
      v10 = qword_10085F520;
      v9 = 0;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-home,nil value for HomeAnchorVariant", v12, 2u);
        v9 = 0;
      }
    }

  }
  else
  {
    v9 = 999;
  }

  return v9;
}

- (int)_intentPredictorConfigFromDiscoveryToken:(id)a3
{
  if (-[NIServerHomeDeviceSession _homeAnchorVariantFromDiscoveryToken:](self, "_homeAnchorVariantFromDiscoveryToken:", a3) == 2)return 2;
  else
    return 1;
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  NINearbyUpdatesEngine *v6;
  id v7;
  void *v8;
  BackoffResumeManager *ptr;
  void *v10;
  unsigned __int8 v11;
  OS_dispatch_queue *clientQueue;
  id v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  void *i;
  id v19;
  double v20;
  _QWORD block[5];
  id v22;
  unsigned __int8 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = (NINearbyUpdatesEngine *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_updatesEngine != v6)
    __assert_rtn("-[NIServerHomeDeviceSession updatesEngine:didUpdateNearbyObjects:]", "NIServerHomeDeviceSession.mm", 2664, "engine == _updatesEngine");
  if (!self->_firstWifiMeasurementsReceived)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = 0;
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v19, "distanceMeasurementQuality") == (id)2
            || objc_msgSend(v19, "distanceMeasurementQuality") == (id)3)
          {
            v16 = 1;
          }

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);

      if ((v16 & 1) != 0)
      {
        v20 = sub_10000883C();
        sub_1002ADB50((uint64_t)self->_wifiCAManager.__ptr_, v20);
        self->_firstWifiMeasurementsReceived = 1;
      }
    }
    else
    {

    }
  }
  ptr = self->_backoffResumeManager.__ptr_;
  if (ptr)
    sub_100266AF4((uint64_t)ptr, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("HomeDeviceSessionBTLeechingEnabled"));

  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E6C28;
  block[3] = &unk_100809E88;
  v23 = v11;
  block[4] = self;
  v22 = v8;
  v13 = v8;
  dispatch_async((dispatch_queue_t)clientQueue, block);

}

- (void)updatesEngine:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6 regionTransitionSuppressed:(BOOL)a7
{
  NINearbyUpdatesEngine *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  OS_dispatch_queue *clientQueue;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v12 = (NINearbyUpdatesEngine *)a3;
  v13 = a4;
  v14 = (unint64_t)a5;
  v15 = (unint64_t)a6;
  if (self->_updatesEngine != v12)
    __assert_rtn("-[NIServerHomeDeviceSession updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:]", "NIServerHomeDeviceSession.mm", 2694, "engine == _updatesEngine");
  -[NIServerHomeDeviceSession adjustResponderThrottleRateIfNeeded:object:](self, "adjustResponderThrottleRateIfNeeded:object:", v14, v13);
  if (v14 | v15 && !a7)
  {
    clientQueue = self->_clientQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001E6E28;
    v17[3] = &unk_10080A2B8;
    v17[4] = self;
    v18 = v13;
    v19 = (id)v14;
    v20 = (id)v15;
    dispatch_async((dispatch_queue_t)clientQueue, v17);

  }
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  objc_super v12;
  unint64_t v13;

  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v12.receiver = self;
  v12.super_class = (Class)NIServerHomeDeviceSession;
  v5 = -[NIServerBaseSession objectFromIdentifier:](&v12, "objectFromIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
LABEL_5:
    v10 = v8;
    goto LABEL_6;
  }
  v9 = sub_1000550B8(&self->_btIdentifierHashToObjectMap.__table_.__bucket_list_.__ptr_.__value_, &v13);
  if (v9)
  {
    v8 = (id)v9[3];
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003DABB0();
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4;
  id v5;
  char v6;
  NINearbyObject *v7;
  objc_super v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v8.receiver = self;
  v8.super_class = (Class)NIServerHomeDeviceSession;
  v5 = -[NIServerBaseSession identifierFromDiscoveryToken:](&v8, "identifierFromDiscoveryToken:", v4);
  if (v6)
  {
    -[NIServerHomeDeviceSession _removePeerObject:uwbIdentifier:withReason:](self, "_removePeerObject:uwbIdentifier:withReason:", v4, v5, 0);
  }
  else
  {
    v7 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", v4);
    -[NIServerHomeDeviceSession _notifyPeerRemoval:withReason:](self, "_notifyPeerRemoval:withReason:", v7, 0);

  }
}

- (void)didUpdateMinimumPreferredUpdateRate:(int64_t)a3
{
  OS_dispatch_queue *clientQueue;
  _QWORD v4[6];

  clientQueue = self->_clientQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001E731C;
  v4[3] = &unk_100809CD8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)clientQueue, v4);
}

- (void)adjustResponderThrottleRateIfNeeded:(id)a3 object:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  float v21;
  NSObject *v22;
  id minimumPreferredUpdateRate;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  unint64_t *v30;
  unint64_t v31;
  objc_super v32;
  id v33;
  uint64_t v34;
  _BYTE v35[32];
  uint8_t buf[4];
  double v37;
  __int16 v38;
  _BYTE v39[18];
  __int16 v40;
  void *v41;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_currentSessionRole == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryToken"));
    v32.receiver = self;
    v32.super_class = (Class)NIServerHomeDeviceSession;
    v33 = -[NIServerBaseSession identifierFromDiscoveryToken:](&v32, "identifierFromDiscoveryToken:", v9);
    v34 = v10;

    if ((_BYTE)v34)
    {
      v11 = sub_1000550B8(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v33);
      if (v11)
      {
        v13 = v11[3];
        v12 = (std::__shared_weak_count *)v11[4];
        if (v12)
        {
          p_shared_owners = (unint64_t *)&v12->__shared_owners_;
          do
            v15 = __ldxr(p_shared_owners);
          while (__stxr(v15 + 1, p_shared_owners));
        }
        if (v13)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", v13, v12));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("NIHomeForceThrottleRate")));

          if (v17 && (v19 = objc_opt_class(NSNumber, v18), (objc_opt_isKindOfClass(v17, v19) & 1) != 0))
          {
            objc_msgSend(v17, "doubleValue");
            v21 = v20;
            v22 = qword_10085F520;
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v37 = v21;
              v38 = 2112;
              *(_QWORD *)v39 = v8;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded. Force throttle rate: %0.2f. Object: %@", buf, 0x16u);
            }
          }
          else
          {
            if (v6)
              minimumPreferredUpdateRate = objc_msgSend(v6, "preferredUpdateRate");
            else
              minimumPreferredUpdateRate = 0;
            if (+[NIUtils nearbyObjectUpdateRate:isGreaterThan:](NIUtils, "nearbyObjectUpdateRate:isGreaterThan:", self->_minimumPreferredUpdateRate, minimumPreferredUpdateRate))
            {
              minimumPreferredUpdateRate = (id)self->_minimumPreferredUpdateRate;
            }
            if (minimumPreferredUpdateRate)
            {
              if (minimumPreferredUpdateRate == (id)1)
              {
                v21 = 0.38;
              }
              else
              {
                v21 = 0.0;
                if (minimumPreferredUpdateRate == (id)3)
                {
                  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
                    sub_1003DAD9C();
                  v24 = qword_10085F520;
                  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315650;
                    v37 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerHomeDeviceSession.mm");
                    v38 = 1024;
                    *(_DWORD *)v39 = 2853;
                    *(_WORD *)&v39[4] = 2080;
                    *(_QWORD *)&v39[6] = "-[NIServerHomeDeviceSession adjustResponderThrottleRateIfNeeded:object:]";
                    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "#ses-home,%s:%d: assertion failure in %s", buf, 0x1Cu);
                  }
                  abort();
                }
              }
            }
            else
            {
              v21 = 0.75;
            }
            v25 = (id)qword_10085F520;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = +[NIUtils NINearbyObjectUpdateRateToString:](NIUtils, "NINearbyObjectUpdateRateToString:", minimumPreferredUpdateRate);
              *(_DWORD *)buf = 136315906;
              v37 = *(double *)&v26;
              v38 = 2048;
              *(double *)v39 = v21;
              *(_WORD *)&v39[8] = 2112;
              *(_QWORD *)&v39[10] = v6;
              v40 = 2112;
              v41 = v8;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded. Update rate: %s. Throttle rate: %0.2f. Region: %@. Object: %@", buf, 0x2Au);
            }

          }
          v27 = sub_1002B18F4(v13, v21);
          v28 = qword_10085F520;
          if (v27)
          {
            v29 = (id)qword_10085F520;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              sub_1002B48B0(v27, buf);
              sub_1003DAD30((uint64_t *)buf, (uint64_t)v35, v29, v21);
            }

          }
          else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v37 = v21;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ses-home,#throttle success scheduling throttling request for rate %0.2f", buf, 0xCu);
          }

        }
        else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        {
          sub_1003DACD0();
        }
        if (v12)
        {
          v30 = (unint64_t *)&v12->__shared_owners_;
          do
            v31 = __ldaxr(v30);
          while (__stlxr(v31 - 1, v30));
          if (!v31)
          {
            ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
            std::__shared_weak_count::__release_weak(v12);
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
        sub_1003DAC70();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003DAC10();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003DAE08();
  }

}

- (void)_updateAnalyticsAboutRangingRateForDevice:(id)a3 responseSkipRatio:(float)a4 cycleRate:(duration<long)long
{
  id v8;
  double v9;
  id v10;

  v10 = a3;
  v8 = objc_msgSend(v10, "hash");
  v9 = sub_10000883C();
  sub_1002114F0((uint64_t)&self->_handoffCAManager, (unint64_t)v8, (int)((a4 * 19.0 + 1.0) * (double)a5.__rep_), v9);

}

- (NIHomeDeviceConfiguration)configuration
{
  return (NIHomeDeviceConfiguration *)objc_getProperty(self, a2, 672, 1);
}

- (void).cxx_destruct
{
  unsigned __int8 *anon_1f8;
  void *v4;
  void *v5;
  unsigned __int8 *anon_1c8;
  void *v7;
  void *v8;

  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_leechingAidingAdvertiser, 0);
  sub_10018839C((uint64_t)&self->_btIdentifierHashToObjectMap);
  sub_1001878CC((uint64_t)&self->_cachedRegionUpdateEvent);
  anon_1f8 = self->_anon_1f8;
  v4 = *(void **)&self->_anon_1f8[24];
  if (v4)
  {
    *(_QWORD *)&self->_anon_1f8[32] = v4;
    operator delete(v4);
  }
  v5 = *(void **)anon_1f8;
  if (*(_QWORD *)anon_1f8)
  {
    *(_QWORD *)&self->_anon_1f8[8] = v5;
    operator delete(v5);
  }
  anon_1c8 = self->_anon_1c8;
  v7 = *(void **)&self->_anon_1c8[24];
  if (v7)
  {
    *(_QWORD *)&self->_anon_1c8[32] = v7;
    operator delete(v7);
  }
  v8 = *(void **)anon_1c8;
  if (*(_QWORD *)anon_1c8)
  {
    *(_QWORD *)&self->_anon_1c8[8] = v8;
    operator delete(v8);
  }
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  sub_10001AE68((uint64_t)&self->_wifiCAManager);

  sub_1001E8034((uint64_t)&self->_handoffCAManager.fHandoffCADeviceManagerMap, (_QWORD *)self->_handoffCAManager.fHandoffCADeviceManagerMap.__tree_.__pair1_.__value_.__left_);
  sub_10003E3F0((uint64_t)&self->_handoffCAManager, (_QWORD *)self->_handoffCAManager.fTimeSpentInSecondsRangingWithkDevices.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_uwbResource, 0);
  sub_10001AE68((uint64_t)&self->_backoffResumeManager);
  sub_1001EAEE4((uint64_t)&self->_wifiSessions);
  sub_1001EAEE4((uint64_t)&self->_responderSessions);
  sub_10001AE68((uint64_t)&self->_initiatorSession);
  objc_storeStrong((id *)&self->_containerUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_updatesEngine, 0);
  sub_10001AE68((uint64_t)&self->_pbLogger);
}

- (id).cxx_construct
{
  self->_pbLogger.__ptr_ = 0;
  self->_pbLogger.__cntrl_ = 0;
  self->_initiatorSession.__ptr_ = 0;
  self->_initiatorSession.__cntrl_ = 0;
  self->_responderSessions.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_responderSessions.__table_.__p1_.__value_.__next_ = 0u;
  self->_responderSessions.__table_.__p3_.__value_ = 1.0;
  self->_wifiSessions.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_wifiSessions.__table_.__p1_.__value_.__next_ = 0u;
  self->_wifiSessions.__table_.__p3_.__value_ = 1.0;
  self->_backoffResumeManager.__ptr_ = 0;
  self->_backoffResumeManager.__cntrl_ = 0;
  sub_1002114EC(&self->_handoffCAManager, a2);
  self->_wifiCAManager.__ptr_ = 0;
  self->_wifiCAManager.__cntrl_ = 0;
  self->_filteredMFStrength.var0.__null_state_ = 0;
  self->_filteredMFStrength.__engaged_ = 0;
  self->_estMagneticFieldBias.var0.__null_state_ = 0;
  self->_anon_1a0[24] = 0;
  *(_OWORD *)self->_anon_1c8 = 0u;
  *(_OWORD *)&self->_anon_1c8[16] = 0u;
  *(_OWORD *)&self->_anon_1c8[32] = 0u;
  *(_OWORD *)self->_anon_1f8 = 0u;
  *(_OWORD *)&self->_anon_1f8[16] = 0u;
  *(_OWORD *)&self->_anon_1f8[32] = 0u;
  self->_cachedRegionUpdateEvent.var0.__null_state_ = 0;
  self->_cachedRegionUpdateEvent.__engaged_ = 0;
  self->_btIdentifierHashToObjectMap.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_btIdentifierHashToObjectMap.__table_.__p1_.__value_.__next_ = 0u;
  self->_btIdentifierHashToObjectMap.__table_.__p3_.__value_ = 1.0;
  return self;
}

@end
