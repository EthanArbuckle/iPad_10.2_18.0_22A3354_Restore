@implementation NIServerFindingService

- (NIServerFindingService)initWithLabel:(id)a3
{
  id v4;
  NIServerFindingService *v5;
  const char *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSUUID *v11;
  NSUUID *serviceIdentifier;
  NSUUID *v13;
  NSUUID *algorithmsIdentifier;
  uint64_t v15;
  NSMapTable *findingClients;
  NSMutableDictionary *v17;
  NSMutableDictionary *findingConfigurations;
  NSMutableDictionary *v19;
  NSMutableDictionary *clientRunStates;
  NSMutableDictionary *v21;
  NSMutableDictionary *sessionSummary;
  NIDiscoveryToken *findingToken;
  NIFindingConfiguration *configuration;
  NSObject *v25;
  NSUUID *v26;
  DetailsViewAnalytics *v27;
  DetailsViewAnalytics *detailsViewAnalytics;
  objc_super v30;
  uint8_t buf[4];
  NSUUID *v32;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NIServerFindingService;
  v5 = -[NIServerFindingService init](&v30, "init");
  if (v5)
  {
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "cStringUsingEncoding:", 4);
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -2);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create(v6, v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new(NSUUID);
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = v11;

    v13 = objc_opt_new(NSUUID);
    algorithmsIdentifier = v5->_algorithmsIdentifier;
    v5->_algorithmsIdentifier = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    findingClients = v5->_findingClients;
    v5->_findingClients = (NSMapTable *)v15;

    v17 = objc_opt_new(NSMutableDictionary);
    findingConfigurations = v5->_findingConfigurations;
    v5->_findingConfigurations = v17;

    v19 = objc_opt_new(NSMutableDictionary);
    clientRunStates = v5->_clientRunStates;
    v5->_clientRunStates = v19;

    v5->_serviceState = 0;
    v21 = objc_opt_new(NSMutableDictionary);
    sessionSummary = v5->_sessionSummary;
    v5->_sessionSummary = v21;

    findingToken = v5->_findingToken;
    v5->_findingToken = 0;

    configuration = v5->_configuration;
    v5->_configuration = 0;

    v25 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v5->_serviceIdentifier;
      *(_DWORD *)buf = 138543362;
      v32 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#find-ses,Service initialized (%{public}@)", buf, 0xCu);
    }
    v27 = -[DetailsViewAnalytics initWithCurrentTime:]([DetailsViewAnalytics alloc], "initWithCurrentTime:", sub_10000883C());
    detailsViewAnalytics = v5->_detailsViewAnalytics;
    v5->_detailsViewAnalytics = v27;

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  NSUUID *serviceIdentifier;
  objc_super v5;
  uint8_t buf[4];
  NSUUID *v7;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    serviceIdentifier = self->_serviceIdentifier;
    *(_DWORD *)buf = 138543362;
    v7 = serviceIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Service deallocated (%{public}@)", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)NIServerFindingService;
  -[NIServerFindingService dealloc](&v5, "dealloc");
}

- (id)addClient:(id)a3 identifier:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  NSErrorUserInfoKey v26;
  const __CFString *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_1001ECF94;
    v24 = sub_1001ECFA4;
    v25 = 0;
    queue = self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001ECFAC;
    v15[3] = &unk_10080E098;
    v15[4] = self;
    v16 = v9;
    v17 = v8;
    v18 = v10;
    v19 = &v20;
    dispatch_sync((dispatch_queue_t)queue, v15);
    v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v26 = NSLocalizedFailureReasonErrorKey;
    v27 = CFSTR("Finding Service Client can't be nil");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v13));

  }
  return v12;
}

- (void)clientWithIdentifier:(id)a3 updatedStateToRunning:(BOOL)a4 dueToTimeout:(BOOL)a5
{
  id v8;
  OS_dispatch_queue *queue;
  id v10;
  _QWORD block[4];
  id v12;
  NIServerFindingService *v13;
  BOOL v14;
  BOOL v15;

  v8 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001ED34C;
  block[3] = &unk_10080E0C0;
  v12 = v8;
  v13 = self;
  v14 = a4;
  v15 = a5;
  v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)removeClientWithIdentifier:(id)a3 dueToTimeout:(BOOL)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[4];
  id v10;
  NIServerFindingService *v11;
  BOOL v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001ED618;
  block[3] = &unk_100809E88;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);

}

- (void)relayInfoToNewObserver:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001ED914;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)processUpdatedConfiguration:(id)a3 forClientIdentifier:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EDAA4;
  block[3] = &unk_100809CB0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)processVisionInput:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EDB50;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)processClientDiscoveryEventWithSharedConfigurationData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  OS_dispatch_queue *queue;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingAdvertisement advertisementFromByteRepresentation:](NIServerFindingAdvertisement, "advertisementFromByteRepresentation:", v4));
  v6 = (id)qword_10085F520;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    *(_DWORD *)buf = 138478083;
    v12 = v7;
    v13 = 2113;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-ses,Service processClientDiscoveryEvent [%{private}@]. Adv: %{private}@", buf, 0x16u);

  }
  if (v5)
  {
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001EDD3C;
    v9[3] = &unk_1007FA518;
    v9[4] = self;
    v10 = v5;
    dispatch_sync((dispatch_queue_t)queue, v9);

  }
}

- (void)processClientRemovePeerEvent
{
  NSObject *v3;
  void *v4;
  OS_dispatch_queue *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    *(_DWORD *)buf = 138477827;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Service processClientRemovePeerEvent [%{private}@]", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EDE88;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)processSelfLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  OS_dispatch_queue *queue;
  _QWORD v8[4];
  id v9;
  NIServerFindingService *v10;
  _BYTE v11[24];

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    sub_1003DAFCC(v6, (uint64_t)v4, (uint64_t)v11);
  }

  if (!self->_enableLocalLocationManager)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001EDFC8;
    v8[3] = &unk_1007FA518;
    v9 = v4;
    v10 = self;
    dispatch_sync((dispatch_queue_t)queue, v8);

  }
}

- (void)processSelfHeading:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  OS_dispatch_queue *queue;
  _QWORD v8[4];
  id v9;
  NIServerFindingService *v10;
  _BYTE v11[24];

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    sub_1003DB010(v6, (uint64_t)v4, (uint64_t)v11);
  }

  if (!self->_enableLocalLocationManager)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001EE228;
    v8[3] = &unk_1007FA518;
    v9 = v4;
    v10 = self;
    dispatch_sync((dispatch_queue_t)queue, v8);

  }
}

- (void)processPeerLocation:(id)a3 forPeer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *queue;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  NIServerFindingService *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    *(_DWORD *)buf = 138478339;
    v18 = v12;
    v19 = 2113;
    v20 = v7;
    v21 = 2113;
    v22 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#find-ses,Service processPeerLocationForPeer [%{private}@]: %{private}@. Location: %{private}@", buf, 0x20u);

  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EE44C;
  block[3] = &unk_100809CB0;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (id)_startService
{
  NSObject *v3;
  void *v4;
  OS_dispatch_source *pauseDelayTimer;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NIFindingConfiguration *v13;
  NIFindingConfiguration *configuration;
  NSObject *v15;
  NIDiscoveryToken *findingToken;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  unsigned int v30;
  double v31;
  NIServerFindingDiscoveryProvider *v32;
  id v33;
  NIServerFindingDiscoveryProvider *v34;
  NIServerFindingDiscoveryProvider *discoveryProvider;
  NIServerFindingRangingProvider *v36;
  id v37;
  OS_dispatch_queue *queue;
  NIServerFindingRangingProvider *v39;
  NIServerFindingRangingProvider *rangingProvider;
  std::__shared_weak_count *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;
  NIServerFindingDiscoveryProvider *v44;
  NIServerFindingRangingProvider *v45;
  void *v46;
  NIServerFindingPeerTracking *v47;
  NIServerFindingPeerTracking *peerTracking;
  void *v49;
  NSObject *v50;
  _BOOL4 enableDeviceFinding;
  NIServerFindingDiscoveryProvider *v52;
  void *v53;
  id v54;
  unsigned int v55;
  NSObject *v56;
  char *v57;
  uint8_t *v58;
  NIServerFindingAdvertisement *v59;
  id v60;
  NIServerFindingRangingProvider *v61;
  NSObject *v62;
  id v63;
  void *v64;
  _BOOL4 v65;
  _DWORD *v66;
  int v67;
  void *v68;
  uint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  unint64_t *v73;
  unint64_t v74;
  NSOperationQueue *v75;
  NSOperationQueue *motionUpdateOpQueue;
  _DWORD *v77;
  _DWORD *v78;
  CMMotionManager *v79;
  CMMotionManager *motionManager;
  CMMotionManager *v81;
  CMAltimeter *v82;
  CMAltimeter *altimeterManager;
  NSObject *v84;
  CMOdometryManager *v85;
  CMOdometryManager *pdrManager;
  NSObject *v87;
  unsigned int v88;
  NSObject *v89;
  void *v90;
  unsigned int v91;
  NSObject *v92;
  _BOOL4 enableLocalLocationManager;
  _DWORD *v94;
  NSObject *v95;
  CLLocationManager *v96;
  CLLocationManager *locationManager;
  NIGnssExtensionsManager *v98;
  NIGnssExtensionsManager *gnssExtensionsManager;
  id v101;
  void *v102[3];
  void *__p;
  void *v104;
  _DWORD *v105;
  uint64_t v106;
  std::__shared_weak_count *v107;
  uint8_t v108[4];
  uint8_t *v109;
  NSErrorUserInfoKey v110;
  const __CFString *v111;
  uint8_t buf[24];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pauseDelayTimer)
  {
    v3 = (id)qword_10085F520;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Service [%{public}@] canceled pending pause", buf, 0xCu);

    }
    dispatch_source_cancel((dispatch_source_t)self->_pauseDelayTimer);
    pauseDelayTimer = self->_pauseDelayTimer;
    self->_pauseDelayTimer = 0;

  }
  if (self->_serviceState)
  {
    v6 = (id)qword_10085F520;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = sub_1002B69FC((uint64_t)"SessionResumed", 1, self->_findingToken, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServicePool sharedInstance](NIServerFindingServicePool, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: SessionResumed"), v10));
    objc_msgSend(v9, "logSessionEvent:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v12, CFSTR("[A2|SES] Resum"));
  }
  else
  {
    v13 = (NIFindingConfiguration *)objc_claimAutoreleasedReturnValue(-[NIServerFindingService _getCommonConfiguration](self, "_getCommonConfiguration"));
    configuration = self->_configuration;
    self->_configuration = v13;

    v15 = (id)qword_10085F520;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      findingToken = self->_findingToken;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cfg: %@"), self->_configuration));
      v18 = sub_1002B69FC((uint64_t)"SessionStarted", 1, findingToken, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServicePool sharedInstance](NIServerFindingServicePool, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: SessionStarted"), v21));
    objc_msgSend(v20, "logSessionEvent:", v22);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v12, CFSTR("[A1|SES] Start"));
  }

  -[DetailsViewAnalytics setEnteredFromActiveFindingUI:](self->_detailsViewAnalytics, "setEnteredFromActiveFindingUI:", (id)-[NIFindingConfiguration preferredUpdateRate](self->_configuration, "preferredUpdateRate") == (id)2);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NIFindingConfiguration debugParameters](self->_configuration, "debugParameters"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("DisableBTDiscovery")));
  v25 = objc_msgSend(v24, "BOOLValue");

  if (v25)
  {
    v26 = qword_10085F520;
    v27 = 0;
    if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v28 = "#find-ses,Debug configuration enabled to disable BT discovery";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
    v27 = 0;
    goto LABEL_20;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v30 = objc_msgSend(v29, "BOOLForKey:", CFSTR("FindingSessionDisableBTDiscovery"));

  if (v30)
  {
    v26 = qword_10085F520;
    v27 = 0;
    if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v28 = "#find-ses,Defaults write to disable BT discovery";
    goto LABEL_18;
  }
  v27 = 1;
LABEL_20:
  v31 = sub_1002B6778(CFSTR("FindingBTDiscoveryTimeoutSecondsOverride"), 120.0);
  v32 = [NIServerFindingDiscoveryProvider alloc];
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_serviceIdentifier, "UUIDString")));
  sub_10000BF04(buf, (char *)objc_msgSend(v33, "UTF8String"));
  v34 = -[NIServerFindingDiscoveryProvider initWithIdentifier:isFinder:enableBluetooth:launchOnDemand:scanRate:discoveryTimeout:oobRefreshPeriod:consumer:queue:](v32, "initWithIdentifier:isFinder:enableBluetooth:launchOnDemand:scanRate:discoveryTimeout:oobRefreshPeriod:consumer:queue:", buf, 1, v27, 0, 50, self, v31, sub_1002B6740(-[NIServerFindingService _useCase](self, "_useCase")), self->_queue);
  discoveryProvider = self->_discoveryProvider;
  self->_discoveryProvider = v34;

  if ((char)buf[23] < 0)
    operator delete(*(void **)buf);

  v36 = [NIServerFindingRangingProvider alloc];
  v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_serviceIdentifier, "UUIDString")));
  sub_10000BF04(buf, (char *)objc_msgSend(v37, "UTF8String"));
  queue = self->_queue;
  v106 = 0;
  v107 = 0;
  v39 = -[NIServerFindingRangingProvider initWithIdentifier:isFinder:consumer:queue:pbLogger:](v36, "initWithIdentifier:isFinder:consumer:queue:pbLogger:", buf, 1, self, queue, &v106);
  rangingProvider = self->_rangingProvider;
  self->_rangingProvider = v39;

  v41 = v107;
  if (v107)
  {
    p_shared_owners = (unint64_t *)&v107->__shared_owners_;
    do
      v43 = __ldaxr(p_shared_owners);
    while (__stlxr(v43 - 1, p_shared_owners));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  if ((char)buf[23] < 0)
    operator delete(*(void **)buf);

  v44 = self->_discoveryProvider;
  if (v44 && self->_rangingProvider)
  {
    -[NIServerFindingDiscoveryProvider activate](v44, "activate");
    -[NIServerFindingRangingProvider activate](self->_rangingProvider, "activate");
    v45 = self->_rangingProvider;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[NIFindingConfiguration debugParameters](self->_configuration, "debugParameters"));
    -[NIServerFindingRangingProvider setDebugParameters:](v45, "setDebugParameters:", v46);

    v47 = (NIServerFindingPeerTracking *)objc_claimAutoreleasedReturnValue(+[NIServerFindingPeerTracking peerTrackingInitialState](NIServerFindingPeerTracking, "peerTrackingInitialState"));
    peerTracking = self->_peerTracking;
    self->_peerTracking = v47;

    -[NIServerFindingService _updatePeerTrackingClientWantsUpdates:](self, "_updatePeerTrackingClientWantsUpdates:", (id)-[NIFindingConfiguration preferredUpdateRate](self->_configuration, "preferredUpdateRate") != (id)3);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    self->_enableDeviceFinding = objc_msgSend(v49, "BOOLForKey:", CFSTR("EnableDeviceFindingOnPhone"));

    v50 = (id)qword_10085F520;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      enableDeviceFinding = self->_enableDeviceFinding;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = enableDeviceFinding;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#find-ses,For rdar://102527413 (Test hook to use Wenda arrow interface on phone), enabling device finding on phone, %d", buf, 8u);
    }

    -[NIServerFindingService _resetUpdatesEngine](self, "_resetUpdatesEngine");
    self->_cachedSolutionMacAddr = 0;
    self->_lastLogMachContTime = 0.0;
    v52 = self->_discoveryProvider;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", self->_findingToken));
    v54 = -[NIServerFindingDiscoveryProvider setPeersEligibleForDiscovery:requestScan:](v52, "setPeersEligibleForDiscovery:requestScan:", v53, 1);

    v55 = -[NIServerFindingRangingProvider rangingTriggerType](self->_rangingProvider, "rangingTriggerType");
    v56 = (id)qword_10085F520;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = v55 ? "TriggerRequired" : "NoTriggerRequired";
      sub_10000BF04(buf, v57);
      v58 = (buf[23] & 0x80u) == 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)v108 = 136315138;
      v109 = v58;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "#find-ses,ranging trigger type = %s", v108, 0xCu);
      if ((char)buf[23] < 0)
        operator delete(*(void **)buf);
    }

    if (!v55)
    {
      v59 = [NIServerFindingAdvertisement alloc];
      *(_WORD *)&buf[4] = 0;
      *(_DWORD *)buf = 0;
      v60 = -[NIServerFindingAdvertisement initForFinder:address:](v59, "initForFinder:address:", 0, buf);
      objc_msgSend(v60, "setCanRange:", 1);
      v61 = self->_rangingProvider;
      if (v61)
        -[NIServerFindingRangingProvider supportedTechnologies](v61, "supportedTechnologies");
      else
        memset(buf, 0, sizeof(buf));
      v65 = sub_1002B7410(buf, 1);
      __p = 0;
      v104 = 0;
      v105 = 0;
      v66 = operator new(4uLL);
      if (v65)
        v67 = 1;
      else
        v67 = 2;
      __p = v66;
      *v66 = v67;
      v104 = v66 + 1;
      v105 = v66 + 1;
      objc_msgSend(v60, "setSupportedTechnologies:", &__p);
      if (__p)
      {
        v104 = __p;
        operator delete(__p);
      }
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)&buf[8] = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }
      objc_msgSend(v60, "setProtocolVersion:", 1);
      v68 = sub_1002CA108();
      v69 = *((_QWORD *)v68 + 406);
      v70 = (std::__shared_weak_count *)*((_QWORD *)v68 + 407);
      *(_QWORD *)buf = v69;
      *(_QWORD *)&buf[8] = v70;
      if (v70)
      {
        v71 = (unint64_t *)&v70->__shared_owners_;
        do
          v72 = __ldxr(v71);
        while (__stxr(v72 + 1, v71));
      }
      sub_1002A4D2C(v69);
      objc_msgSend(v60, "setNarrowBandMask:", sub_10036C1C0((unsigned __int8 **)v102));
      if (v102[0])
      {
        v102[1] = v102[0];
        operator delete(v102[0]);
      }
      if (v70)
      {
        v73 = (unint64_t *)&v70->__shared_owners_;
        do
          v74 = __ldaxr(v73);
        while (__stlxr(v74 - 1, v73));
        if (!v74)
        {
          ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
          std::__shared_weak_count::__release_weak(v70);
        }
      }
      -[NIServerFindingService _updatePeerTrackingDiscoveryState:](self, "_updatePeerTrackingDiscoveryState:", 2);
      -[NIServerFindingService _tryToStartRangingWithPeerAdvertisement:](self, "_tryToStartRangingWithPeerAdvertisement:", v60);

    }
    -[NIServerFindingService _startOrUpdateAdvertising](self, "_startOrUpdateAdvertising");
    v75 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    motionUpdateOpQueue = self->_motionUpdateOpQueue;
    self->_motionUpdateOpQueue = v75;

    -[NSOperationQueue setUnderlyingQueue:](self->_motionUpdateOpQueue, "setUnderlyingQueue:", self->_queue);
    v77 = sub_100004784();
    if (sub_100360EFC(v77[144]) || (v78 = sub_100004784(), sub_1000069CC(v78[144])) || self->_enableDeviceFinding)
    {
      v79 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
      motionManager = self->_motionManager;
      self->_motionManager = v79;

      v81 = self->_motionManager;
      if (v81)
      {
        -[CMMotionManager setDeviceMotionUpdateInterval:](v81, "setDeviceMotionUpdateInterval:", 0.01);
        -[NIServerFindingService _startDeviceMotionUpdates](self, "_startDeviceMotionUpdates");
      }
    }
    v82 = (CMAltimeter *)objc_alloc_init((Class)CMAltimeter);
    altimeterManager = self->_altimeterManager;
    self->_altimeterManager = v82;

    if (self->_altimeterManager)
    {
      -[NIServerFindingService _startAltitudeUpdates](self, "_startAltitudeUpdates");
    }
    else
    {
      v84 = (id)qword_10085F520;
      if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT))
        sub_1003DB108();

    }
    v85 = (CMOdometryManager *)objc_alloc_init((Class)CMOdometryManager);
    pdrManager = self->_pdrManager;
    self->_pdrManager = v85;

    if (self->_pdrManager)
    {
      -[NIServerFindingService _startDevicePDRUpdates](self, "_startDevicePDRUpdates");
    }
    else
    {
      v87 = (id)qword_10085F520;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        sub_1003DB0DC();

    }
    v101 = 0;
    v88 = +[CLLocationManager _checkAndExerciseAuthorizationForBundleID:error:](CLLocationManager, "_checkAndExerciseAuthorizationForBundleID:error:", CFSTR("com.apple.findmy"), &v101);
    v63 = v101;
    if (v63)
    {
      v89 = (id)qword_10085F520;
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = CFSTR("com.apple.findmy");
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v63;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "#find-ses,Authorization error for %{public}@,error,%{public}@", buf, 0x16u);
      }

    }
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v91 = objc_msgSend(v90, "BOOLForKey:", CFSTR("FindingSessionDisableLocationManagerWorkaround_r108262579"));

    self->_enableLocalLocationManager = v88 & (v91 ^ 1);
    v92 = (id)qword_10085F520;
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      enableLocalLocationManager = self->_enableLocalLocationManager;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v88;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v91;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = enableLocalLocationManager;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "#find-ses,findMyAppIsAuthorizedForLocations,%d,FindingSessionDisableLocationManagerWorkaround_r108262579,%d,enableLocalLocationManager,%d", buf, 0x14u);
    }

    if (self->_enableLocalLocationManager)
    {
      v94 = sub_100004784();
      if (sub_1000069CC(v94[144]))
      {
        v95 = (id)qword_10085F520;
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "#find-ses,Using a temporary location manager until rdar://107853227 lands", buf, 2u);
        }

        v96 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundleIdentifier:delegate:onQueue:", CFSTR("com.apple.findmy"), self, self->_queue);
        locationManager = self->_locationManager;
        self->_locationManager = v96;

        -[CLLocationManager setActivityType:](self->_locationManager, "setActivityType:", 3);
        -[CLLocationManager setDistanceFilter:](self->_locationManager, "setDistanceFilter:", kCLDistanceFilterNone);
        -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", kCLLocationAccuracyBest);
        -[CLLocationManager setHeadingFilter:](self->_locationManager, "setHeadingFilter:", kCLHeadingFilterNone);
        -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
        -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
        -[CLLocationManager startUpdatingHeading](self->_locationManager, "startUpdatingHeading");
      }
    }
    if (!self->_gnssExtensionsManager)
    {
      v98 = -[NIGnssExtensionsManager initWithQueue:bundleId:reason:]([NIGnssExtensionsManager alloc], "initWithQueue:bundleId:reason:", self->_queue, CFSTR("com.apple.findmy"), CFSTR("NIServerFindingService"));
      gnssExtensionsManager = self->_gnssExtensionsManager;
      self->_gnssExtensionsManager = v98;

      -[NIGnssExtensionsManager setDelegate:](self->_gnssExtensionsManager, "setDelegate:", self);
    }
    -[NIServerAnalyticsManager sessionSuccessfullyRanWithConfig:withTimestamp:](self->_analyticsManager, "sessionSuccessfullyRanWithConfig:withTimestamp:", self->_configuration, sub_10000883C());
    self->_serviceState = 1;
    v64 = 0;
    self->_serviceStartTimeSeconds = sub_10000883C();
  }
  else
  {
    v62 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DB054((uint64_t)self, (uint64_t *)&self->_configuration, v62);
    v110 = NSLocalizedFailureReasonErrorKey;
    v111 = CFSTR("Providers could not be initialized ");
    v63 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1));
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v63));
  }

  return v64;
}

- (void)_pauseServiceDueToClientTimeout:(BOOL)a3
{
  _BOOL4 v3;
  NIServerFindingService *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  NSObject *v16;
  OS_dispatch_source *v17;
  OS_dispatch_source *pauseDelayTimer;
  OS_dispatch_source **p_pauseDelayTimer;
  OS_dispatch_source *v20;
  dispatch_time_t v21;
  OS_dispatch_source *v22;
  _QWORD handler[4];
  id v24;
  uint8_t buf[4];
  double v26;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v3)
  {
    v5 = self;
    v6 = 1;
LABEL_5:
    -[NIServerFindingService _resetServiceStateForOperation:](v5, "_resetServiceStateForOperation:", v6);
    return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("FindingDisableServicePauseDelay"));

  if (v8)
  {
    v5 = self;
    v6 = 0;
    goto LABEL_5;
  }
  if (!self->_pauseDelayTimer)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("FindingServicePauseDelayOverrideSeconds")));
    v11 = 1000000000;

    if (v10)
    {
      v13 = objc_opt_class(NSNumber, v12);
      if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
      {
        objc_msgSend(v10, "doubleValue");
        v15 = v14;
        v16 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v26 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#find-ses,Pause delay override: %0.1f s", buf, 0xCu);
        }
        v11 = (unint64_t)(v15 * 1000000000.0);
      }
    }
    v17 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    p_pauseDelayTimer = &self->_pauseDelayTimer;
    pauseDelayTimer = self->_pauseDelayTimer;
    self->_pauseDelayTimer = v17;

    v20 = self->_pauseDelayTimer;
    v21 = dispatch_time(0, v11);
    dispatch_source_set_timer((dispatch_source_t)v20, v21, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak((id *)buf, self);
    v22 = self->_pauseDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001EF754;
    handler[3] = &unk_1007FA078;
    objc_copyWeak(&v24, (id *)buf);
    dispatch_source_set_event_handler((dispatch_source_t)v22, handler);
    dispatch_resume((dispatch_object_t)*p_pauseDelayTimer);
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_processUpdatedCommonConfigurationIfNecessary
{
  void *v3;
  NIFindingConfiguration **p_configuration;
  NSObject *v5;
  NIDiscoveryToken *findingToken;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;

  if (self->_serviceState == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingService _getCommonConfiguration](self, "_getCommonConfiguration"));
    p_configuration = &self->_configuration;
    if (!-[NIFindingConfiguration isEqual:](self->_configuration, "isEqual:", v3))
    {
      v5 = (id)qword_10085F520;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        findingToken = self->_findingToken;
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Old: %@. New: %@"), self->_configuration, v3));
        v8 = sub_1002B69FC((uint64_t)"UpdateConfig", 1, findingToken, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        *(_DWORD *)buf = 138543362;
        v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

      }
      objc_storeStrong((id *)&self->_configuration, v3);
      -[NIServerFindingService _updatePeerTrackingClientWantsUpdates:](self, "_updatePeerTrackingClientWantsUpdates:", (id)-[NIFindingConfiguration preferredUpdateRate](*p_configuration, "preferredUpdateRate") != (id)3);
      if ((id)-[NIFindingConfiguration preferredUpdateRate](*p_configuration, "preferredUpdateRate") == (id)3)
        -[NIServerFindingService _resetUpdatesEngine](self, "_resetUpdatesEngine");
      -[NIServerFindingService _startOrUpdateAdvertising](self, "_startOrUpdateAdvertising");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider discoveredPeers](self->_discoveryProvider, "discoveredPeers"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", self->_findingToken));

      if (v11)
        -[NIServerFindingService _tryToStartRangingWithPeerAdvertisement:](self, "_tryToStartRangingWithPeerAdvertisement:", v11);

    }
  }
}

- (id)_getCommonConfiguration
{
  NIFindingConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[NIFindingConfiguration initWithRole:discoveryToken:preferredUpdateRate:]([NIFindingConfiguration alloc], "initWithRole:discoveryToken:preferredUpdateRate:", 0, self->_findingToken, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_findingConfigurations, "objectEnumerator"));
  v5 = 0;
  while (1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextObject"));

    if (!v6)
      break;
    if (objc_msgSend(v6, "preferredUpdateRate") != (id)3)
      -[NIFindingConfiguration setPreferredUpdateRate:](v3, "setPreferredUpdateRate:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugParameters"));

    v5 = v6;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugParameters"));
      -[NIFindingConfiguration setDebugParameters:](v3, "setDebugParameters:", v8);

      v5 = v6;
    }
  }
  -[NIFindingConfiguration setCameraAssistanceEnabled:](v3, "setCameraAssistanceEnabled:", +[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture"));

  return v3;
}

- (int)_useCase
{
  _DWORD *v2;

  v2 = sub_100004784();
  return !sub_1000069CC(v2[144]);
}

- (BOOL)_isAnyClientRunning
{
  NSMutableDictionary *clientRunStates;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  clientRunStates = self->_clientRunStates;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001EFBD8;
  v5[3] = &unk_10080E0E8;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientRunStates, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_resetServiceStateForOperation:(int)a3
{
  OS_dispatch_source *pauseDelayTimer;
  OS_dispatch_source *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NINearbyObject *v14;
  void *v15;
  NIDiscoveryToken *findingToken;
  NINearbyObject *v17;
  NIFindingConfiguration *configuration;
  NIDiscoveryToken *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  NSMutableDictionary *sessionSummary;
  NIServerFindingDiscoveryProvider *discoveryProvider;
  NIServerFindingRangingProvider *rangingProvider;
  NINearbyUpdatesEngine *updatesEngine;
  NIServerAnalyticsManager *analyticsManager;
  NIServerFindingPeerTracking *peerTracking;
  NIVisionInput *cachedVisionInput;
  CMMotionManager *motionManager;
  CMMotionManager *v42;
  CMAltimeter *altimeterManager;
  CMAltimeter *v44;
  CMOdometryManager *pdrManager;
  CMOdometryManager *v46;
  CLLocationManager *locationManager;
  CLLocationManager *v48;
  NIGnssExtensionsManager *gnssExtensionsManager;
  NIGnssExtensionsManager *v50;
  _QWORD v51[4];
  NINearbyObject *v52;
  uint8_t buf[4];
  void *v54;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  pauseDelayTimer = self->_pauseDelayTimer;
  if (pauseDelayTimer)
  {
    dispatch_source_cancel((dispatch_source_t)pauseDelayTimer);
    v6 = self->_pauseDelayTimer;
    self->_pauseDelayTimer = 0;

  }
  if ((a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      -[NIServerFindingService _removeAlgorithmOutputFlagsFromPeerTrackingState:](self, "_removeAlgorithmOutputFlagsFromPeerTrackingState:", 255);
      v20 = (id)qword_10085F520;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = sub_1002B69FC((uint64_t)"SessionTimeout", 1, self->_findingToken, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138543362;
        v54 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServicePool sharedInstance](NIServerFindingServicePool, "sharedInstance"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: SessionTimeout"), v24));
      objc_msgSend(v23, "logSessionEvent:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v26, CFSTR("[A4|SES] T/out"));
    }
    else
    {
      -[NIServerFindingService _removeAlgorithmOutputFlagsFromPeerTrackingState:](self, "_removeAlgorithmOutputFlagsFromPeerTrackingState:", 255);
      v27 = (id)qword_10085F520;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = sub_1002B69FC((uint64_t)"SessionPaused", 1, self->_findingToken, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)buf = 138543362;
        v54 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServicePool sharedInstance](NIServerFindingServicePool, "sharedInstance"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: SessionPaused"), v31));
      objc_msgSend(v30, "logSessionEvent:", v32);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v26, CFSTR("[A3|SES] Pause"));
    }

    -[NIServerFindingService _logSessionSummary](self, "_logSessionSummary");
    -[DetailsViewAnalytics submitAnalytics](self->_detailsViewAnalytics, "submitAnalytics");
    self->_serviceState = 2;
  }
  else
  {
    -[NIServerFindingService _removeAlgorithmOutputFlagsFromPeerTrackingState:](self, "_removeAlgorithmOutputFlagsFromPeerTrackingState:", 255);
    if (self->_findingToken)
    {
      v7 = (id)qword_10085F520;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = sub_1002B69FC((uint64_t)"SessionStopped", 1, self->_findingToken, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        *(_DWORD *)buf = 138543362;
        v54 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServicePool sharedInstance](NIServerFindingServicePool, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: SessionStopped"), v11));
      objc_msgSend(v10, "logSessionEvent:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v13, CFSTR("[A5|SES] Stop "));

      v14 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", self->_findingToken);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServiceObserverRelay sharedInstance](NIServerFindingServiceObserverRelay, "sharedInstance"));
      findingToken = self->_findingToken;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1001F02A8;
      v51[3] = &unk_10080E110;
      v17 = v14;
      v52 = v17;
      objc_msgSend(v15, "relayToObserversForToken:blockToRelay:", findingToken, v51);

    }
    -[NIServerFindingService _logSessionSummary](self, "_logSessionSummary");
    -[DetailsViewAnalytics submitAnalytics](self->_detailsViewAnalytics, "submitAnalytics");
    configuration = self->_configuration;
    self->_configuration = 0;

    v19 = self->_findingToken;
    self->_findingToken = 0;

    self->_serviceState = 0;
    -[NSMapTable removeAllObjects](self->_findingClients, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_findingConfigurations, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_clientRunStates, "removeAllObjects");
  }
  v33 = objc_opt_new(NSMutableDictionary);
  sessionSummary = self->_sessionSummary;
  self->_sessionSummary = v33;

  -[NIServerFindingDiscoveryProvider invalidate](self->_discoveryProvider, "invalidate");
  discoveryProvider = self->_discoveryProvider;
  self->_discoveryProvider = 0;

  -[NIServerFindingRangingProvider invalidate](self->_rangingProvider, "invalidate");
  rangingProvider = self->_rangingProvider;
  self->_rangingProvider = 0;

  -[NINearbyUpdatesEngine invalidate](self->_updatesEngine, "invalidate");
  updatesEngine = self->_updatesEngine;
  self->_updatesEngine = 0;

  analyticsManager = self->_analyticsManager;
  self->_analyticsManager = 0;

  peerTracking = self->_peerTracking;
  self->_peerTracking = 0;

  self->_cachedSolutionMacAddr = 0;
  self->_lastLogMachContTime = 0.0;
  cachedVisionInput = self->_cachedVisionInput;
  self->_cachedVisionInput = 0;

  motionManager = self->_motionManager;
  if (motionManager)
  {
    -[CMMotionManager stopDeviceMotionUpdates](motionManager, "stopDeviceMotionUpdates");
    v42 = self->_motionManager;
    self->_motionManager = 0;

  }
  altimeterManager = self->_altimeterManager;
  if (altimeterManager)
  {
    -[CMAltimeter stopRelativeAltitudeUpdates](altimeterManager, "stopRelativeAltitudeUpdates");
    v44 = self->_altimeterManager;
    self->_altimeterManager = 0;

  }
  pdrManager = self->_pdrManager;
  if (pdrManager)
  {
    -[CMOdometryManager stopOdometryUpdates](pdrManager, "stopOdometryUpdates");
    v46 = self->_pdrManager;
    self->_pdrManager = 0;

  }
  locationManager = self->_locationManager;
  if (locationManager)
  {
    -[CLLocationManager stopUpdatingLocation](locationManager, "stopUpdatingLocation");
    -[CLLocationManager stopUpdatingHeading](self->_locationManager, "stopUpdatingHeading");
    v48 = self->_locationManager;
    self->_locationManager = 0;

  }
  gnssExtensionsManager = self->_gnssExtensionsManager;
  if (gnssExtensionsManager)
  {
    -[NIGnssExtensionsManager invalidate](gnssExtensionsManager, "invalidate");
    v50 = self->_gnssExtensionsManager;
    self->_gnssExtensionsManager = 0;

  }
}

- (void)_logSessionSummary
{
  NSMutableDictionary **p_sessionSummary;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NIDiscoveryToken *findingToken;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;

  p_sessionSummary = &self->_sessionSummary;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[A1|SES] Start")));

  if (v4)
    v5 = CFSTR("[A1|SES] Start");
  else
    v5 = CFSTR("[A2|SES] Resum");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_sessionSummary, "objectForKeyedSubscript:", v5));
  v7 = v6;
  if (v6)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001F05BC;
    v19[3] = &unk_10080E138;
    v19[4] = self;
    v20 = v6;
    objc_msgSend(&off_10082C328, "enumerateKeysAndObjectsUsingBlock:", v19);

  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001F06A8;
  v18[3] = &unk_10080AD38;
  v18[4] = self;
  objc_msgSend(&off_10082BD58, "enumerateObjectsUsingBlock:", v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001F076C;
  v17[3] = &unk_10080AD38;
  v17[4] = self;
  objc_msgSend(&off_10082BD70, "enumerateObjectsUsingBlock:", v17);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001F084C;
  v16[3] = &unk_10080AD38;
  v16[4] = self;
  objc_msgSend(&off_10082BD88, "enumerateObjectsUsingBlock:", v16);
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    findingToken = self->_findingToken;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Summary: %@"), self->_sessionSummary));
    v11 = sub_1002B69FC((uint64_t)"SessionSummary", 1, findingToken, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543362;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServicePool sharedInstance](NIServerFindingServicePool, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v14, self->_sessionSummary));
  objc_msgSend(v13, "logSessionSummary:", v15);

}

- (void)_resetUpdatesEngine
{
  NINearbyUpdatesEngine *updatesEngine;
  NINearbyUpdatesEngine *v4;
  NIServerAnalyticsManager *analyticsManager;
  _DWORD *v6;
  _BOOL4 v7;
  NIServerAnalyticsManager *v8;
  const __CFString *v9;
  NIServerAnalyticsManager *v10;
  NIServerAnalyticsManager *v11;
  NSUUID *v12;
  NSUUID *algorithmsIdentifier;
  NINearbyUpdatesEngine *v14;
  NIFindingConfiguration *configuration;
  OS_dispatch_queue *queue;
  NIServerAnalyticsManager *v17;
  _QWORD *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  NINearbyUpdatesEngine *v22;
  id v23;
  NINearbyUpdatesEngine *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  std::__shared_weak_count *v30;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  updatesEngine = self->_updatesEngine;
  if (updatesEngine)
  {
    -[NINearbyUpdatesEngine invalidate](updatesEngine, "invalidate");
    v4 = self->_updatesEngine;
  }
  else
  {
    v4 = 0;
  }
  self->_updatesEngine = 0;

  analyticsManager = self->_analyticsManager;
  self->_analyticsManager = 0;

  -[NIServerFindingService _removeAlgorithmOutputFlagsFromPeerTrackingState:](self, "_removeAlgorithmOutputFlagsFromPeerTrackingState:", 255);
  v6 = sub_100004784();
  v7 = sub_1000069CC(v6[144]);
  v8 = [NIServerAnalyticsManager alloc];
  if (v7)
    v9 = CFSTR("com.apple.findmy");
  else
    v9 = CFSTR("com.apple.NanoSettingsViewService");
  v10 = -[NIServerAnalyticsManager initWithBundleIdentifier:](v8, "initWithBundleIdentifier:", v9);
  v11 = self->_analyticsManager;
  self->_analyticsManager = v10;

  v12 = objc_opt_new(NSUUID);
  algorithmsIdentifier = self->_algorithmsIdentifier;
  self->_algorithmsIdentifier = v12;

  v14 = [NINearbyUpdatesEngine alloc];
  configuration = self->_configuration;
  queue = self->_queue;
  v17 = self->_analyticsManager;
  v18 = sub_1002CA108();
  v19 = (std::__shared_weak_count *)v18[21];
  v29 = v18[20];
  v30 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldxr(p_shared_owners);
    while (__stxr(v21 + 1, p_shared_owners));
  }
  v28 = 0;
  v22 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:](v14, "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:", configuration, queue, self, self, v17, &v29, &v28);
  v23 = v28;
  v24 = self->_updatesEngine;
  self->_updatesEngine = v22;

  v25 = v30;
  if (v30)
  {
    v26 = (unint64_t *)&v30->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  if (v23 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003DB134();

}

- (void)_startDeviceMotionUpdates
{
  void ***v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1001F0BC4;
  v7 = &unk_10080CE48;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMMotionManager startDeviceMotionUpdatesToQueue:withHandler:](self->_motionManager, "startDeviceMotionUpdatesToQueue:withHandler:", self->_motionUpdateOpQueue, v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startAltitudeUpdates
{
  void ***v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1001F0F48;
  v7 = &unk_10080CCE0;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMAltimeter startRelativeAltitudeUpdatesToQueue:withHandler:](self->_altimeterManager, "startRelativeAltitudeUpdatesToQueue:withHandler:", self->_motionUpdateOpQueue, v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startDevicePDRUpdates
{
  void ***v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1001F116C;
  v7 = &unk_10080CE00;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMOdometryManager setOdometryUpdateInterval:](self->_pdrManager, "setOdometryUpdateInterval:", 0.1, v4, v5, v6, v7);
  -[CMOdometryManager startOdometryUpdatesToQueue:withHandler:](self->_pdrManager, "startOdometryUpdatesToQueue:withHandler:", self->_motionUpdateOpQueue, v3);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)didDiscoverPeer:(id)a3 advertisement:(id)a4 overBluetooth:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  NIDiscoveryToken *findingToken;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v8))
  {
    v10 = (id)qword_10085F520;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      findingToken = self->_findingToken;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BT: %d. PeerAdv: %@"), v5, v9));
      v13 = sub_1002B69FC((uint64_t)"DiscoveredPeer", 1, findingToken, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543362;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

    }
    if (v5)
      v15 = 2;
    else
      v15 = 1;
    -[NIServerFindingService _updatePeerTrackingDiscoveryState:](self, "_updatePeerTrackingDiscoveryState:", v15);
    -[NIServerFindingService _tryToStartRangingWithPeerAdvertisement:](self, "_tryToStartRangingWithPeerAdvertisement:", v9);
  }

}

- (void)didLosePeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v4))
  {
    v5 = (id)qword_10085F520;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = sub_1002B69FC((uint64_t)"LostPeer", 1, self->_findingToken, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v8, 0xCu);

    }
    -[NIServerFindingService _updatePeerTrackingDiscoveryState:](self, "_updatePeerTrackingDiscoveryState:", 4);
  }

}

- (void)didStopAdvertisingToPeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v4))
  {
    v5 = (id)qword_10085F520;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = sub_1002B69FC((uint64_t)"NotifyStopAdv", 1, v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v8, 0xCu);

    }
    -[NIServerFindingService _updatePeerTrackingAdvertisingState:](self, "_updatePeerTrackingAdvertisingState:", 2);
  }

}

- (void)didGenerateAdvertisement:(id)a3 toSendOOBToPeer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NIDiscoveryToken *findingToken;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NINearbyObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NIDiscoveryToken *v19;
  id v20;
  NINearbyObject *v21;
  _QWORD v22[4];
  id v23;
  NINearbyObject *v24;
  uint8_t buf[4];
  void *v26;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v7))
  {
    v8 = (id)qword_10085F520;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      findingToken = self->_findingToken;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SelfAdv: %@"), v6));
      v11 = sub_1002B69FC((uint64_t)"GeneratedAdv", 1, findingToken, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "byteRepresentation"));
    v14 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", self->_findingToken);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_findingClients, "objectEnumerator"));
    v16 = 0;
    while (1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nextObject"));

      if (!v17)
        break;
      v16 = v17;
      objc_msgSend(v17, "serviceDidGenerateShareableConfigurationData:forObject:", v13, v14);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServiceObserverRelay sharedInstance](NIServerFindingServiceObserverRelay, "sharedInstance"));
    v19 = self->_findingToken;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001F1D14;
    v22[3] = &unk_10080E160;
    v20 = v13;
    v23 = v20;
    v21 = v14;
    v24 = v21;
    objc_msgSend(v18, "relayToObserversForToken:blockToRelay:", v19, v22);

  }
}

- (void)bluetoothDiscoveryFinishedActivating
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = sub_1002B69FC((uint64_t)"DiscActivated", 1, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v6, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)bluetoothDiscoveryBecameUnavailable
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = sub_1002B69FC((uint64_t)"DiscUnavailable", 1, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v6, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)bluetoothDiscoveryBecameAvailable
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = sub_1002B69FC((uint64_t)"DiscAvailable", 1, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v6, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)didRangeWithPeer:(id)a3 newSolution:(const void *)a4
{
  id v6;
  int v7;
  int *v8;
  NSObject *v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v6))
  {
    v8 = (int *)((char *)a4 + 32);
    v7 = *((_DWORD *)a4 + 8);
    if ((v7 - 2) < 4 || v7 == 0)
    {
      v10 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003DB400(v8, (uint64_t)v6, v10);
    }
    else
    {
      v11 = 0.0;
      if (v7 == 1)
      {
        if (!*((_BYTE *)a4 + 600))
          __assert_rtn("-[NIServerFindingService didRangeWithPeer:newSolution:]", "NIServerFindingSession.mm", 1619, "solution.raw_rose_measurement.has_value()");
        v11 = *((double *)a4 + 44);
      }
      if (*((_BYTE *)a4 + 24))
      {
        -[DetailsViewAnalytics updateWithMostRecentRawDistance:](self->_detailsViewAnalytics, "updateWithMostRecentRawDistance:", v11);
        -[NIServerFindingService _logSuccessfulRange:](self, "_logSuccessfulRange:", v11);
        -[NIServerFindingService _updatePeerTrackingRangingState:](self, "_updatePeerTrackingRangingState:", 3);
        self->_cachedSolutionMacAddr = *((_QWORD *)a4 + 5);
        sub_1001D0140(0x2B73040Cu, 0, 0, 0, 0, 0);
        -[NINearbyUpdatesEngine acceptRoseSolution:](self->_updatesEngine, "acceptRoseSolution:", a4);
      }
      else
      {
        sub_1001D0140(0x2B730410u, 0, 0, 0, 0, 0);
        v12 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003DB398(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003DB484();
  }

}

- (void)didAttemptRangingWithPeer:(id)a3 unsuccessfulSolution:(const void *)a4
{
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v6))
  {
    if (!*((_BYTE *)a4 + 600))
      __assert_rtn("-[NIServerFindingService didAttemptRangingWithPeer:unsuccessfulSolution:]", "NIServerFindingSession.mm", 1657, "solution.raw_rose_measurement.has_value()");
    -[NIServerFindingService _logUnsuccessfulRange](self, "_logUnsuccessfulRange");
    if (*((_BYTE *)a4 + 600) && *((_WORD *)a4 + 72) == 96)
      -[NIServerFindingService _updatePeerTrackingRangingState:](self, "_updatePeerTrackingRangingState:", 2);
    sub_1001D0140(0x2B730414u, 0, 0, 0, 0, 0);
    -[NINearbyUpdatesEngine acceptUnsuccessfulRoseSolution:](self->_updatesEngine, "acceptUnsuccessfulRoseSolution:", a4);
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003DB4B0();
  }

}

- (void)_logSuccessfulRange:(double)a3
{
  double v5;
  NIDiscoveryToken *findingToken;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  double v23;
  _BOOL4 v24;
  void *v25;
  uint8_t buf[4];
  void *v27;

  v5 = sub_10000883C();
  findingToken = self->_findingToken;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Range: %0.2f m"), *(_QWORD *)&a3));
  v8 = sub_1002B69FC((uint64_t)"RangeSuccess", 1, findingToken, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = qword_10085F520;
  if (v5 - self->_lastLogMachContTime <= 5.0)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003DB4DC();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }
    self->_lastLogMachContTime = v5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[E1|RNG] Good ")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v11, "unsignedIntegerValue") + 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v12, CFSTR("[E1|RNG] Good "));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[E3|RNG] First")));
  LODWORD(v11) = v13 == 0;

  if ((_DWORD)v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v14, CFSTR("[E3|RNG] First"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v15, CFSTR("[E5|RNG] Max  "));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v16, CFSTR("[E6|RNG] Min  "));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v17, CFSTR("[E4|RNG] Last "));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[E5|RNG] Max  ")));
  objc_msgSend(v18, "doubleValue");
  v20 = v19 < a3;

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v21, CFSTR("[E5|RNG] Max  "));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[E6|RNG] Min  ")));
  objc_msgSend(v22, "doubleValue");
  v24 = v23 > a3;

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v25, CFSTR("[E6|RNG] Min  "));

  }
}

- (void)_logUnsuccessfulRange
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[24];

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = sub_1002B69FC((uint64_t)"RangeFailure", 1, self->_findingToken, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    sub_1003DB53C(v5, v8, v3);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[E2|RNG] Miss ")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v6, "unsignedIntegerValue") + 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v7, CFSTR("[E2|RNG] Miss "));

}

- (void)didStopRangingWithPeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sub_1002B69FC((uint64_t)"NotifyStopRange", 1, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v8, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerFindingService _handleRangingTerminatedCallbackForPeer:](self, "_handleRangingTerminatedCallbackForPeer:", v4);

}

- (void)didRangingAuthorizationFailForPeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sub_1002B69FC((uint64_t)"NotifyAuthFail", 1, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v8, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerFindingService _handleRangingTerminatedCallbackForPeer:](self, "_handleRangingTerminatedCallbackForPeer:", v4);

}

- (void)_handleRangingTerminatedCallbackForPeer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  __int16 v15;
  double v16;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v5, "doubleForKey:", CFSTR("FindingServiceRangingTriggerTimeLimitOverrideSeconds"));
    v7 = v6;

    if (v7 <= 0.0)
      v7 = 1200.0;
    v8 = sub_10000883C() - self->_serviceStartTimeSeconds;
    if (v8 > v7)
    {
      v9 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 134218240;
        v14 = v8;
        v15 = 2048;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-ses,Ranging terminated and too much time elapsed (%0.1f s > %0.1f s), stop ranging triggers", (uint8_t *)&v13, 0x16u);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider setPeersEligibleForDiscovery:requestScan:](self->_discoveryProvider, "setPeersEligibleForDiscovery:requestScan:", 0, 0));
      if (v10 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003DB64C();
      -[NIServerFindingService _updatePeerTrackingDiscoveryState:](self, "_updatePeerTrackingDiscoveryState:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider stopAdvertisingToPeer:](self->_discoveryProvider, "stopAdvertisingToPeer:", v4));
      if (v11 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003DB5EC();
      -[NIServerFindingService _updatePeerTrackingAdvertisingState:](self, "_updatePeerTrackingAdvertisingState:", 2);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingRangingProvider stopRangingWithPeer:](self->_rangingProvider, "stopRangingWithPeer:", v4));
    if (v12 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003DB58C();
    -[NIServerFindingService _updatePeerTrackingRangingState:](self, "_updatePeerTrackingRangingState:", 4);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003DB6AC();
  }

}

- (void)didReceiveRangingDataForPeer:(id)a3 algorithmAidingData:(const void *)a4 signallingData:(const void *)a5
{
  NINearbyUpdatesEngine *updatesEngine;

  -[NINearbyUpdatesEngine acceptPeerData:fromPeer:](self->_updatesEngine, "acceptPeerData:fromPeer:", a4, a3);
  updatesEngine = self->_updatesEngine;
  if (updatesEngine)
    -[NINearbyUpdatesEngine acceptPeerDeviceType:](updatesEngine, "acceptPeerDeviceType:", *((unsigned __int8 *)a5 + 8));
}

- (void)_updatePeerTrackingDiscoveryState:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  objc_msgSend(v5, "setDiscoveryState:", v3);
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);

}

- (void)_updatePeerTrackingAdvertisingState:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  objc_msgSend(v5, "setAdvertisingState:", v3);
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);

}

- (void)_updatePeerTrackingRangingState:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  objc_msgSend(v5, "setRangingState:", v3);
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);

}

- (void)_updatePeerTrackingClientWantsUpdates:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  objc_msgSend(v5, "setClientWantsUpdates:", v3);
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);

}

- (void)_addAlgorithmOutputFlagsToPeerTrackingState:(unsigned __int8)a3
{
  int v3;
  id v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  objc_msgSend(v5, "setAlgorithmOutputFlags:", objc_msgSend(v5, "algorithmOutputFlags") | v3);
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);

}

- (void)_removeAlgorithmOutputFlagsFromPeerTrackingState:(unsigned __int8)a3
{
  int v3;
  id v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  objc_msgSend(v5, "setAlgorithmOutputFlags:", objc_msgSend(v5, "algorithmOutputFlags") & ~v3);
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);

}

- (void)_updatePeerTrackingOverallState:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  NSObject *v10;
  NIDiscoveryToken *findingToken;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  NINearbyObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  NINearbyObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  uint8_t buf[4];
  id v54;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = objc_msgSend(v4, "copy");
  v6 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  v7 = v6;
  if (!v6 || !v5)
    goto LABEL_89;
  if (objc_msgSend(v6, "rangingState") == 3
    && (objc_msgSend(v5, "rangingState") == 1 || objc_msgSend(v5, "rangingState") == 2))
  {
    objc_msgSend(v5, "setRangingState:", objc_msgSend(v7, "rangingState"));
  }
  if (objc_msgSend(v7, "rangingState") == 2 && objc_msgSend(v5, "rangingState") == 1)
    objc_msgSend(v5, "setRangingState:", objc_msgSend(v7, "rangingState"));
  if (!objc_msgSend(v7, "discoveryState") && objc_msgSend(v5, "discoveryState"))
  {
    if (objc_msgSend(v5, "discoveryState") == 2)
    {
      v8 = 1;
    }
    else
    {
      if (objc_msgSend(v5, "discoveryState") != 1)
        goto LABEL_17;
      v8 = 3;
    }
    -[NIServerAnalyticsManager updateWithAcquisitionReason:](self->_analyticsManager, "updateWithAcquisitionReason:", v8);
  }
LABEL_17:
  if (objc_msgSend(v7, "discoveryState") == 3
    && (objc_msgSend(v5, "discoveryState") == 1 || objc_msgSend(v5, "discoveryState") == 2))
  {
    objc_msgSend(v5, "setDiscoveryState:", objc_msgSend(v7, "discoveryState"));
  }
  if (objc_msgSend(v7, "discoveryState") == 1 && objc_msgSend(v5, "discoveryState") == 2
    || objc_msgSend(v7, "discoveryState") == 2 && objc_msgSend(v5, "discoveryState") == 1)
  {
    objc_msgSend(v5, "setDiscoveryState:", 3);
  }
  v9 = objc_msgSend(v5, "hasReceivedRangingData")
    && (objc_msgSend(v5, "algorithmOutputFlags") & 1) != 0;
  objc_msgSend(v5, "setTellClientAboutPeer:", v9);
  if ((objc_msgSend(v7, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_peerTracking, v5);
    v10 = (id)qword_10085F520;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      findingToken = self->_findingToken;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Change: %@ -> %@"), v7, v5));
      v13 = sub_1002B69FC((uint64_t)"StateChange", 1, findingToken, v12);
      v14 = (id)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543362;
      v54 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServicePool sharedInstance](NIServerFindingServicePool, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v16, v5));
    objc_msgSend(v15, "logSessionEvent:", v17);

    if (self->_findingToken)
    {
      if ((objc_msgSend(v7, "hasReceivedRangingData") & 1) == 0
        && objc_msgSend(v5, "hasReceivedRangingData"))
      {
        -[NINearbyUpdatesEngine acceptDiscoveryEventForPeer:](self->_updatesEngine, "acceptDiscoveryEventForPeer:", self->_findingToken);
      }
      if (self->_findingToken)
      {
        if ((objc_msgSend(v7, "tellClientAboutPeer") & 1) == 0
          && objc_msgSend(v5, "tellClientAboutPeer"))
        {
          v18 = (id)qword_10085F520;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = sub_1002B69FC((uint64_t)"NotifiedClient", 1, self->_findingToken, CFSTR("Sent: didDiscoverNearbyObject"));
            v20 = (id)objc_claimAutoreleasedReturnValue(v19);
            *(_DWORD *)buf = 138543362;
            v54 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[D1|FND] Show ")));
          v22 = v21 == 0;

          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v23, CFSTR("[D1|FND] Show "));

          }
          v24 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", self->_findingToken);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_findingClients, "objectEnumerator"));
          v26 = 0;
          while (1)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "nextObject"));

            if (!v27)
              break;
            v26 = v27;
            objc_msgSend(v27, "serviceDidDiscoverNearbyObject:", v24);
          }
          -[DetailsViewAnalytics updateDistanceAnalytics:](self->_detailsViewAnalytics, "updateDistanceAnalytics:", 1);
          -[DetailsViewAnalytics updateTimeAnalytics:currentTime:](self->_detailsViewAnalytics, "updateTimeAnalytics:currentTime:", 1, sub_10000883C());

        }
        if (self->_findingToken)
        {
          if (objc_msgSend(v7, "rangingState") != 3
            && objc_msgSend(v5, "rangingState") == 3)
          {
            -[DetailsViewAnalytics updateTimeAnalytics:currentTime:](self->_detailsViewAnalytics, "updateTimeAnalytics:currentTime:", 0, sub_10000883C());
          }
          if (self->_findingToken)
          {
            if ((objc_msgSend(v7, "clientWantsUpdates") & 1) == 0
              && objc_msgSend(v5, "clientWantsUpdates"))
            {
              -[DetailsViewAnalytics updateDistanceAnalytics:](self->_detailsViewAnalytics, "updateDistanceAnalytics:", 2);
              -[DetailsViewAnalytics updateTimeAnalytics:currentTime:](self->_detailsViewAnalytics, "updateTimeAnalytics:currentTime:", 2, sub_10000883C());
            }
            if (self->_findingToken)
            {
              if (objc_msgSend(v7, "clientWantsUpdates")
                && (objc_msgSend(v5, "clientWantsUpdates") & 1) == 0)
              {
                -[DetailsViewAnalytics updateDistanceAnalytics:](self->_detailsViewAnalytics, "updateDistanceAnalytics:", 3);
                -[DetailsViewAnalytics updateTimeAnalytics:currentTime:](self->_detailsViewAnalytics, "updateTimeAnalytics:currentTime:", 3, sub_10000883C());
              }
              if (self->_findingToken
                && objc_msgSend(v7, "tellClientAboutPeer")
                && (objc_msgSend(v5, "tellClientAboutPeer") & 1) == 0)
              {
                v28 = (id)qword_10085F520;
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  v29 = sub_1002B69FC((uint64_t)"NotifiedClient", 1, self->_findingToken, CFSTR("Sent: didRemoveNearbyObject"));
                  v30 = (id)objc_claimAutoreleasedReturnValue(v29);
                  *(_DWORD *)buf = 138543362;
                  v54 = v30;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);

                }
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[D5|FND] Revok")));
                v32 = v31 == 0;

                if (v32)
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v33, CFSTR("[D5|FND] Revok"));

                }
                v34 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", self->_findingToken);
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_findingClients, "objectEnumerator"));
                v36 = 0;
                while (1)
                {
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "nextObject"));

                  if (!v37)
                    break;
                  v36 = v37;
                  objc_msgSend(v37, "serviceDidRemoveNearbyObject:", v34);
                }

              }
            }
          }
        }
      }
    }
    if (objc_msgSend(v5, "clientWantsUpdates"))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[D3|FND] Press")));
      v39 = v38 == 0;

      if (v39)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v40, CFSTR("[D3|FND] Press"));

      }
    }
    if (objc_msgSend(v5, "discoveryState") == 2 || objc_msgSend(v5, "discoveryState") == 3)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[B1|TRG] BT   ")));
      v42 = v41 == 0;

      if (v42)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v43, CFSTR("[B1|TRG] BT   "));

      }
    }
    if (objc_msgSend(v5, "discoveryState") == 1 || objc_msgSend(v5, "discoveryState") == 3)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[B3|TRG] OOB  ")));
      v45 = v44 == 0;

      if (v45)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v46, CFSTR("[B3|TRG] OOB  "));

      }
    }
    if (objc_msgSend(v5, "rangingState") == 3)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[C3|RNG] Meas ")));
      v48 = v47 == 0;

      if (v48)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v49, CFSTR("[C3|RNG] Meas "));

      }
    }
    if (objc_msgSend(v7, "rangingState") == 1 && objc_msgSend(v5, "rangingState") == 2)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionSummary, "objectForKeyedSubscript:", CFSTR("[C1|RNG] Poll ")));
      v51 = v50 == 0;

      if (v51)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionSummary, "setObject:forKeyedSubscript:", v52, CFSTR("[C1|RNG] Poll "));

      }
    }
  }
LABEL_89:

}

- (BOOL)_sessionConfiguredToRange
{
  return 1;
}

- (void)_startOrUpdateAdvertising
{
  NIServerFindingAdvertisement *v3;
  uint64_t v4;
  id v5;
  NIServerFindingRangingProvider *rangingProvider;
  void *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  void *v18[3];
  void *__p;
  void *v20;
  uint64_t v21;

  v3 = [NIServerFindingAdvertisement alloc];
  v4 = (uint64_t)-[NIServerFindingDiscoveryProvider advertisingAddress](self->_discoveryProvider, "advertisingAddress");
  LODWORD(v16) = v4;
  WORD2(v16) = WORD2(v4);
  v5 = -[NIServerFindingAdvertisement initForFinder:address:](v3, "initForFinder:address:", 1, &v16);
  objc_msgSend(v5, "setCanRange:", -[NIServerFindingService _sessionConfiguredToRange](self, "_sessionConfiguredToRange"));
  objc_msgSend(v5, "setUseCase:", -[NIServerFindingService _useCase](self, "_useCase"));
  rangingProvider = self->_rangingProvider;
  if (rangingProvider)
  {
    -[NIServerFindingRangingProvider supportedTechnologies](rangingProvider, "supportedTechnologies");
  }
  else
  {
    __p = 0;
    v20 = 0;
    v21 = 0;
  }
  objc_msgSend(v5, "setSupportedTechnologies:", &__p);
  if (__p)
  {
    v20 = __p;
    operator delete(__p);
  }
  objc_msgSend(v5, "setProtocolVersion:", 1);
  v7 = sub_1002CA108();
  v8 = *((_QWORD *)v7 + 406);
  v9 = (std::__shared_weak_count *)*((_QWORD *)v7 + 407);
  v16 = v8;
  v17 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  sub_1002A4D2C(v8);
  v12 = sub_10036C1C0((unsigned __int8 **)v18);
  objc_msgSend(v5, "setNarrowBandMask:", v12, v16, v17);
  if (v18[0])
  {
    v18[1] = v18[0];
    operator delete(v18[0]);
  }
  if (v9)
  {
    v13 = (unint64_t *)&v9->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  -[NIServerFindingService _updatePeerTrackingAdvertisingState:](self, "_updatePeerTrackingAdvertisingState:", 1);
  v15 = -[NIServerFindingDiscoveryProvider startAdvertisingToPeer:advertisement:timeout:](self->_discoveryProvider, "startAdvertisingToPeer:advertisement:timeout:", self->_findingToken, v5, 0.0);

}

- (void)_tryToStartRangingWithPeerAdvertisement:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  NIServerFindingRangingProvider *rangingProvider;
  _BOOL4 v10;
  unsigned int v11;
  NSObject *v12;
  const char *v13;
  _BYTE *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _DWORD *v18;
  BOOL v19;
  NIServerFindingRangingProvider *v20;
  _DWORD *v21;
  _BYTE v22[2];
  void *v23;
  void *v24;
  _BYTE *v25;
  void *__p[3];
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  _BOOL4 v30;

  v4 = a3;
  v5 = objc_msgSend(v4, "selectedTechnology");
  v6 = objc_msgSend(v4, "canRange");
  v7 = -[NIServerFindingService _sessionConfiguredToRange](self, "_sessionConfiguredToRange");
  v8 = -[NIServerFindingRangingProvider canRangeWithPeer:technology:](self->_rangingProvider, "canRangeWithPeer:technology:", self->_findingToken, v5);
  rangingProvider = self->_rangingProvider;
  if (rangingProvider)
    -[NIServerFindingRangingProvider supportedTechnologies](rangingProvider, "supportedTechnologies");
  else
    memset(__p, 0, sizeof(__p));
  v10 = sub_1002B7410(__p, (int)v5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if ((v6 & v7 & v10 & v8 & 1) != 0)
  {
    -[NIServerFindingService _updatePeerTrackingRangingState:](self, "_updatePeerTrackingRangingState:", 1);
    if (objc_msgSend(v4, "narrowBandMask"))
    {
      v11 = objc_msgSend(v4, "narrowBandMask");
    }
    else
    {
      v14 = operator new(1uLL);
      v23 = v14;
      *v14 = 1;
      v24 = v14 + 1;
      v25 = v14 + 1;
      v11 = sub_10036C1C0((unsigned __int8 **)&v23);
      if (v23)
      {
        v24 = v23;
        operator delete(v23);
      }
    }
    v15 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(__p[0]) = 67109120;
      HIDWORD(__p[0]) = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-ses,Negotiated nb_mask %hu", (uint8_t *)__p, 8u);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nbUwbAcquisitionChannelIdx"));
    v22[0] = objc_msgSend(v16, "intValue");
    v22[1] = v11;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingRangingProvider startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:](self->_rangingProvider, "startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:", self->_findingToken, v5, v4, v22));
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DB6D8();
      -[NIServerFindingService _updatePeerTrackingRangingState:](self, "_updatePeerTrackingRangingState:", 4);
    }
    else
    {
      if ((id)-[NIFindingConfiguration preferredUpdateRate](self->_configuration, "preferredUpdateRate") == (id)3)
      {
        v18 = sub_100004784();
        v19 = sub_1000069CC(v18[144]);
        v20 = self->_rangingProvider;
        __p[0] = (void *)0x100000000000000;
      }
      else
      {
        v21 = sub_100004784();
        v19 = sub_1000069CC(v21[144]);
        v20 = self->_rangingProvider;
        __p[0] = (void *)0x101000000000000;
      }
      LOBYTE(__p[1]) = v19;
      -[NIServerFindingRangingProvider setSignallingData:forPeer:](v20, "setSignallingData:forPeer:", __p, self->_findingToken);
    }

  }
  else
  {
    v12 = (id)qword_10085F520;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = sub_1002B73E4((int)v5);
      LODWORD(__p[0]) = 136316162;
      *(void **)((char *)__p + 4) = (void *)v13;
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = v6;
      WORD1(__p[2]) = 1024;
      HIDWORD(__p[2]) = v7;
      v27 = 1024;
      v28 = v8;
      v29 = 1024;
      v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-ses,Not attempting to range (selectedTech: %s). peerDeviceCanRange: %d. sessionConfiguredToRange: %d. localDeviceCanRange: %d. localDeviceSupportsTech: %d.", (uint8_t *)__p, 0x24u);
    }

  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  NINearbyUpdatesEngine *v12;
  _QWORD v13[5];

  v12 = (NINearbyUpdatesEngine *)a3;
  v6 = a4;
  if (self->_updatesEngine != v12)
    __assert_rtn("-[NIServerFindingService updatesEngine:didUpdateNearbyObjects:]", "NIServerFindingSession.mm", 2081, "engine == _updatesEngine");
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001F40A8;
  v13[3] = &unk_10080E188;
  v13[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("FindingGateObjectUpdatesOnDiscovery"));

  if (!v8
    || -[NIServerFindingPeerTracking discoveryState](self->_peerTracking, "discoveryState") == 2
    || -[NIServerFindingPeerTracking discoveryState](self->_peerTracking, "discoveryState") == 3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_findingClients, "objectEnumerator"));
    v10 = 0;
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));

      if (!v11)
        break;
      v10 = v11;
      objc_msgSend(v11, "serviceDidUpdateNearbyObjects:", v6);
    }

  }
}

- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NINearbyUpdatesEngine *v13;

  v13 = (NINearbyUpdatesEngine *)a3;
  v8 = a4;
  v9 = a5;
  if (self->_updatesEngine != v13)
    __assert_rtn("-[NIServerFindingService updatesEngine:didUpdateAlgorithmConvergenceState:forObject:]", "NIServerFindingSession.mm", 2112, "engine == _updatesEngine");
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_findingClients, "objectEnumerator"));
  v11 = 0;
  while (1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));

    if (!v12)
      break;
    v11 = v12;
    objc_msgSend(v12, "serviceDidUpdateAlgorithmConvergenceState:forObject:", v8, v9);
  }

}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  return self->_findingToken;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  unint64_t cachedSolutionMacAddr;
  _BOOL8 v4;
  optional<unsigned long long> result;

  cachedSolutionMacAddr = self->_cachedSolutionMacAddr;
  v4 = 1;
  result.__engaged_ = v4;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)cachedSolutionMacAddr;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  NINearbyObject *v3;

  if (self->_findingToken)
    v3 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", self->_findingToken);
  else
    v3 = 0;
  return v3;
}

- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v5;
  id v6;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  id v8;

  v3 = v1;
  v8 = v2;
  v5 = *(void **)(v3 + 24);
  if (!v5)
    __assert_rtn("-[NIServerFindingService uniqueIdentifierForEngine:]", "NIServerFindingSession.mm", 2141, "_algorithmsIdentifier != nil");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString")));
  sub_10000BF04(retstr, (char *)objc_msgSend(v6, "UTF8String"));

  return result;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[8];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    v7 = qword_10085F520;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
        sub_1003DB764();
      objc_msgSend(v6, "coordinate");
      v31 = v8;
      objc_msgSend(v6, "coordinate");
      v30 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      v29 = v11;
      objc_msgSend(v6, "course");
      v13 = v12;
      objc_msgSend(v6, "courseAccuracy");
      v15 = v14;
      objc_msgSend(v6, "speed");
      v17 = v16;
      objc_msgSend(v6, "speedAccuracy");
      v19 = v18;
      objc_msgSend(v6, "horizontalAccuracy");
      v21 = v20;
      objc_msgSend(v6, "verticalAccuracy");
      v23 = v22;
      objc_msgSend(v6, "altitude");
      v25 = v24;
      objc_msgSend(v6, "ellipsoidalAltitude");
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "floor"));
      *(_QWORD *)buf = v31;
      v33 = v30;
      v34 = v29;
      v35 = v13;
      v36 = v15;
      v37 = v17;
      v38 = v19;
      v39 = v21;
      v40 = v23;
      v41 = v25;
      v42 = v27;
      v43 = objc_msgSend(v28, "level");
      v44 = objc_msgSend(v6, "type");
      v45 = objc_msgSend(v6, "signalEnvironmentType");

      -[NINearbyUpdatesEngine acceptSelfLocationData:](self->_updatesEngine, "acceptSelfLocationData:", buf);
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-ses,current location not updated", buf, 2u);
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    sub_1003DB738();
  }

}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
  {
    sub_1003DB7F0();
    if (v5)
      goto LABEL_3;
  }
  else if (v5)
  {
LABEL_3:
    objc_msgSend(v5, "magneticHeading");
    v7 = v6;
    objc_msgSend(v5, "trueHeading");
    v9 = v8;
    objc_msgSend(v5, "headingAccuracy");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timestamp"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14[0] = v7;
    v14[1] = v9;
    v14[2] = v11;
    v14[3] = v13;

    -[NINearbyUpdatesEngine acceptHeadingData:](self->_updatesEngine, "acceptHeadingData:", v14);
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003DB7C4();
LABEL_7:

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a4;
  v6 = objc_msgSend(v5, "code");
  if (v6)
  {
    if (v6 == (id)1)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
        sub_1003DB8DC();
    }
    else if (v6 == (id)3)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DB8B0();
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003DB850();
      -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
      -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
      -[CLLocationManager stopUpdatingHeading](self->_locationManager, "stopUpdatingHeading");
      -[CLLocationManager startUpdatingHeading](self->_locationManager, "startUpdatingHeading");
    }
  }
  else
  {
    v7 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-ses,location is unknown", v8, 2u);
    }
  }

}

- (void)DataCallback:(id)a3
{
  NINearbyUpdatesEngine *updatesEngine;
  void *__p[3];

  updatesEngine = self->_updatesEngine;
  +[NIGnssExtensionsManager getGnssSatelliteDataVecFromDict:](NIGnssExtensionsManager, "getGnssSatelliteDataVecFromDict:", a3);
  -[NINearbyUpdatesEngine acceptGnssSatelliteData:](updatesEngine, "acceptGnssSatelliteData:", __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsViewAnalytics, 0);
  objc_storeStrong((id *)&self->_altimeterManager, 0);
  objc_storeStrong((id *)&self->_pdrManager, 0);
  objc_storeStrong((id *)&self->_gnssExtensionsManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_motionUpdateOpQueue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_cachedVisionInput, 0);
  objc_storeStrong((id *)&self->_peerTracking, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_updatesEngine, 0);
  objc_storeStrong((id *)&self->_rangingProvider, 0);
  objc_storeStrong((id *)&self->_discoveryProvider, 0);
  objc_storeStrong((id *)&self->_pauseDelayTimer, 0);
  objc_storeStrong((id *)&self->_findingToken, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sessionSummary, 0);
  objc_storeStrong((id *)&self->_clientRunStates, 0);
  objc_storeStrong((id *)&self->_findingConfigurations, 0);
  objc_storeStrong((id *)&self->_findingClients, 0);
  objc_storeStrong((id *)&self->_algorithmsIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  sub_10028D4BC(&self->_machTimeConverter, a2);
  return self;
}

@end
