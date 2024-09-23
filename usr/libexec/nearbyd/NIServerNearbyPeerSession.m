@implementation NIServerNearbyPeerSession

- (NIServerNearbyPeerSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NIServerNearbyPeerSession *v14;
  NIServerNearbyPeerSession *v15;
  uint64_t v16;
  OS_dispatch_queue *clientQueue;
  NINearbyPeerConfiguration *v18;
  NINearbyPeerConfiguration *configuration;
  void *v20;
  uint64_t v21;
  NSString *containerUniqueIdentifier;
  NINearbyUpdatesEngine *v23;
  NINearbyPeerConfiguration *v24;
  OS_dispatch_queue *v25;
  void *v26;
  NINearbyUpdatesEngine *v27;
  NINearbyUpdatesEngine *updatesEngine;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  NSOperationQueue *v32;
  NSOperationQueue *deviceOperationQueue;
  NSObject *v34;
  NIServerNearbyPeerSession *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  NSObject *v39;
  int v40;
  const __CFString *v41;
  unsigned int v42;
  NSObject *v43;
  _BOOL4 v44;
  NIServerNearbyPeerNbammsSession *v45;
  NIServerNearbyPeerSubspecializationProtocol *subspecializedPeerSession;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  objc_super v53;
  uint8_t buf[24];

  v9 = a3;
  v50 = a4;
  v11 = objc_opt_class(v50, v10);
  if (v11 != objc_opt_class(NINearbyPeerConfiguration, v12))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerNearbyPeerSession.mm"), 109, CFSTR("NIServerNearbyPeerSession given invalid configuration."));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));

  if (!v13)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerNearbyPeerSession.mm"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourcesManager.serverSessionIdentifier"));

  }
  v53.receiver = self;
  v53.super_class = (Class)NIServerNearbyPeerSession;
  v14 = -[NIServerBaseSession initWithResourcesManager:configuration:error:](&v53, "initWithResourcesManager:configuration:error:", v9, v50, a5);
  v15 = v14;
  if (!v14)
    goto LABEL_19;
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientConnectionQueue"));
  clientQueue = v14->_clientQueue;
  v14->_clientQueue = (OS_dispatch_queue *)v16;

  v18 = (NINearbyPeerConfiguration *)objc_msgSend(v50, "copy");
  configuration = v14->_configuration;
  v14->_configuration = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
  containerUniqueIdentifier = v14->_containerUniqueIdentifier;
  v14->_containerUniqueIdentifier = (NSString *)v21;

  -[NIConfiguration setSupportsCameraAssistance:](v14->_configuration, "setSupportsCameraAssistance:", +[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture"));
  v23 = [NINearbyUpdatesEngine alloc];
  v24 = v14->_configuration;
  v25 = v14->_clientQueue;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "analytics"));
  if (v9)
  {
    objc_msgSend(v9, "protobufLogger");
  }
  else
  {
    v51 = 0;
    v52 = 0;
  }
  v27 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:](v23, "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:", v24, v25, v14, v14, v26, &v51, a5);
  updatesEngine = v14->_updatesEngine;
  v14->_updatesEngine = v27;

  v29 = v52;
  if (v52)
  {
    p_shared_owners = (unint64_t *)&v52->__shared_owners_;
    do
      v31 = __ldaxr(p_shared_owners);
    while (__stlxr(v31 - 1, p_shared_owners));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }

  if (!v14->_updatesEngine)
  {
    v34 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Failed to create updates engine, cannot create session.", buf, 2u);
    }
LABEL_19:
    v35 = 0;
    goto LABEL_38;
  }
  v32 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  deviceOperationQueue = v14->_deviceOperationQueue;
  v14->_deviceOperationQueue = v32;

  -[NSOperationQueue setUnderlyingQueue:](v14->_deviceOperationQueue, "setUnderlyingQueue:", v14->_clientQueue);
  v14->_sensorsOn = 0;
  v14->_backgroundedClientsSupported = 1;
  if (v9)
  {
    objc_msgSend(v9, "powerBudgetProvider");
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
  }
  sub_1000145E8((uint64_t)&v14->_powerBudgetProvider, (__int128 *)buf);
  v36 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v37 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  v39 = (id)qword_10085F520;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = sub_10016E628();
    v41 = CFSTR("No");
    if (v40)
      v41 = CFSTR("Yes");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v41;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Power budget reporting to CPMS is supported: %@", buf, 0xCu);
  }

  v42 = -[NINearbyPeerConfiguration isExtendedDistanceMeasurementEnabled](v15->_configuration, "isExtendedDistanceMeasurementEnabled");
  v43 = qword_10085F520;
  v44 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
  if (v42)
  {
    if (v44)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,extended distance measurement is enabled. Using NMI session", buf, 2u);
    }
    v45 = -[NIServerNearbyPeerNbammsSession initWithDataSource:delegate:clientQueue:]([NIServerNearbyPeerNbammsSession alloc], "initWithDataSource:delegate:clientQueue:", v15, v15, v15->_clientQueue);
  }
  else
  {
    if (v44)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,extended distance measurement not enabled. Using GR session", buf, 2u);
    }
    v45 = -[NIServerNearbyPeerGrSession initWithDataSource:delegate:clientQueue:]([NIServerNearbyPeerGrSession alloc], "initWithDataSource:delegate:clientQueue:", v15, v15, v15->_clientQueue);
  }
  subspecializedPeerSession = v15->_subspecializedPeerSession;
  v15->_subspecializedPeerSession = (NIServerNearbyPeerSubspecializationProtocol *)v45;

  v15->_cachedSolutionMacAddr = 0;
  v35 = v15;
LABEL_38:

  return v35;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture");
}

- (BOOL)supportsBackgroundedClients
{
  return self->_backgroundedClientsSupported;
}

- (unint64_t)requiresUWBToRun
{
  return 2;
}

- (unint64_t)requiresNarrowbandToRun
{
  if (!self->_subspecializedPeerSession)
    sub_1003E0AA8();
  if (-[NIServerNearbyPeerSession isExtendedDistanceMeasurementEnabled](self, "isExtendedDistanceMeasurementEnabled"))
    return 2;
  else
    return 0;
}

- (unint64_t)requiresSpatialInteractionBluetoothResource
{
  return 2;
}

- (id)getQueueForInputingData
{
  return self->_clientQueue;
}

- (id)configure
{
  NINearbyPeerConfiguration *configuration;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSDictionary *v21;
  id v22;
  NSDictionary *peerTokenDict;
  void *v24;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  const char *v31;
  int64_t v32;
  id v33;
  void (**v34)(_QWORD, _QWORD);
  NSObject *v35;
  NIServerSessionResourceManager *v36;
  void *v37;
  NIServerBackgroundContinuationManager *v38;
  NSString *containerUniqueIdentifier;
  void *v40;
  OS_dispatch_queue *clientQueue;
  void *v42;
  NIServerBackgroundContinuationManager *v43;
  NIServerBackgroundContinuationManager *backgroundContinuationManager;
  void *v45;
  _QWORD v46[4];
  id v47;
  objc_super v48;
  objc_super v49;
  uint8_t buf[4];
  const char *v51;
  NSErrorUserInfoKey v52;
  const __CFString *v53;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  configuration = self->_configuration;
  if (!configuration)
    sub_1003E0AD0();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](configuration, "peerDiscoveryToken"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rawToken"));
    v7 = objc_msgSend(v6, "length");

    if ((unint64_t)v7 > 0xF)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
      v11 = sub_10028F154(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = v12;
      if (v12)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", &off_10082C0A0));
        if (v15 && (v16 = objc_opt_class(NSData, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", &off_10082C0B8));
          if (v18 && (v19 = objc_opt_class(NSData, v17), (objc_opt_isKindOfClass(v18, v19) & 1) != 0))
          {
            v20 = qword_10085F520;
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Discovery token is valid.", buf, 2u);
            }
            v21 = v13;
            v22 = 0;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
              sub_1003E0BD8();
            v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
            v21 = 0;
          }

        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003E0BAC();
          v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
          v21 = 0;
        }

      }
      else
      {
        v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
        v21 = 0;
      }

      v8 = v22;
      peerTokenDict = self->_peerTokenDict;
      self->_peerTokenDict = v21;

      if (v8)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003E0B4C();
        v9 = v8;
        v8 = v9;
        goto LABEL_26;
      }
      if (!self->_peerTokenDict)
        sub_1003E0AF8();
      if (-[NIServerNearbyPeerSession _peerSupportsLongRange](self, "_peerSupportsLongRange"))
      {
        v26 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Peer supports long range.", buf, 2u);
        }
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSubspecializationProtocol configure](self->_subspecializedPeerSession, "configure"));
      v28 = v27;
      if (v27)
      {
        v29 = v27;
      }
      else
      {
        v30 = (id)qword_10085F520;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = +[NIUtils NISessionBackgroundModeToString:](NIUtils, "NISessionBackgroundModeToString:", -[NINearbyPeerConfiguration backgroundMode](self->_configuration, "backgroundMode"));
          *(_DWORD *)buf = 136315138;
          v51 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Configuration background mode: %s", buf, 0xCu);
        }

        v32 = -[NINearbyPeerConfiguration backgroundMode](self->_configuration, "backgroundMode");
        if (v32 != 2)
        {
          if (v32 == 1)
          {
            v35 = qword_10085F520;
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Configured for background continuation", buf, 2u);
            }
            v48.receiver = self;
            v48.super_class = (Class)NIServerNearbyPeerSession;
            v36 = -[NIServerBaseSession resourcesManager](&v48, "resourcesManager");
            v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
            objc_initWeak((id *)buf, self);
            v38 = [NIServerBackgroundContinuationManager alloc];
            containerUniqueIdentifier = self->_containerUniqueIdentifier;
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "appStateMonitor"));
            clientQueue = self->_clientQueue;
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "analytics"));
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472;
            v46[2] = sub_10024C2A0;
            v46[3] = &unk_1007FB4C8;
            objc_copyWeak(&v47, (id *)buf);
            v43 = -[NIServerBackgroundContinuationManager initWithSessionIdentifier:appStateMonitor:queue:analyticsManager:backgroundAuthHandler:](v38, "initWithSessionIdentifier:appStateMonitor:queue:analyticsManager:backgroundAuthHandler:", containerUniqueIdentifier, v40, clientQueue, v42, v46);
            backgroundContinuationManager = self->_backgroundContinuationManager;
            self->_backgroundContinuationManager = v43;

            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lifecycleSupervisor"));
            objc_msgSend(v45, "setTimeoutOnPeerInactivity:", 0);

            objc_destroyWeak(&v47);
            objc_destroyWeak((id *)buf);

          }
          else if (!v32)
          {
            self->_backgroundedClientsSupported = 0;
            v49.receiver = self;
            v49.super_class = (Class)NIServerNearbyPeerSession;
            v33 = -[NIServerBaseSession backgroundSupportUpdateHandler](&v49, "backgroundSupportUpdateHandler");
            v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v33);
            ((void (**)(_QWORD, BOOL))v34)[2](v34, self->_backgroundedClientsSupported);

          }
          v24 = 0;
          goto LABEL_45;
        }
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
          sub_1003E0B20();
        v29 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
      }
      v24 = v29;
LABEL_45:

      goto LABEL_27;
    }
  }
  v52 = NSLocalizedFailureReasonErrorKey;
  v53 = CFSTR("Peer discovery token nil or invalid.");
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v8));
LABEL_26:
  v24 = v9;
LABEL_27:

  return v24;
}

- (id)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
  v12 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession _addPeers:](self, "_addPeers:", v4));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession getResourcesManager](self, "getResourcesManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lifecycleSupervisor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
    v11 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    objc_msgSend(v7, "startedDiscoveringPeersWithTokens:", v9);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSubspecializationProtocol run](self->_subspecializedPeerSession, "run"));
    if (!v5)
      self->_shouldDeliverUpdates = 1;
  }
  return v5;
}

- (id)pauseWithSource:(int64_t)a3
{
  void *v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  void *v7;
  objc_super v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  self->_shouldDeliverUpdates = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession _disableAllServicesAndSendHangupSignal:](self, "_disableAllServicesAndSendHangupSignal:", 0));
  v9.receiver = self;
  v9.super_class = (Class)NIServerNearbyPeerSession;
  v5 = -[NIServerBaseSession resourcesManager](&v9, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lifecycleSupervisor"));
  objc_msgSend(v7, "pauseCalled");

  return v4;
}

- (id)disableAllServices
{
  return -[NIServerNearbyPeerSession _disableAllServicesAndSendHangupSignal:](self, "_disableAllServicesAndSendHangupSignal:", 1);
}

- (void)invalidate
{
  id v3;
  objc_super v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = -[NIServerNearbyPeerSession disableAllServices](self, "disableAllServices");
  v4.receiver = self;
  v4.super_class = (Class)NIServerNearbyPeerSession;
  -[NIServerBaseSession invalidate](&v4, "invalidate");
  self->_shouldDeliverUpdates = 0;
}

- (void)deviceDiscovered:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!-[NIServerNearbyPeerSession _shouldBypassBluetoothDiscovery](self, "_shouldBypassBluetoothDiscovery")
    && (objc_opt_respondsToSelector(self->_subspecializedPeerSession, "deviceDiscovered:") & 1) != 0)
  {
    -[NIServerNearbyPeerSubspecializationProtocol deviceDiscovered:](self->_subspecializedPeerSession, "deviceDiscovered:", v4);
  }

}

- (void)device:(id)a3 rediscovered:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v8 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138478083;
    v10 = v7;
    v11 = 2113;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,discoveredDevice:didUpdate: new: %{private}@, cached: %{private}@", (uint8_t *)&v9, 0x16u);
  }
  if (!-[NIServerNearbyPeerSession _shouldBypassBluetoothDiscovery](self, "_shouldBypassBluetoothDiscovery")
    && (objc_opt_respondsToSelector(self->_subspecializedPeerSession, "device:rediscovered:") & 1) != 0)
  {
    -[NIServerNearbyPeerSubspecializationProtocol device:rediscovered:](self->_subspecializedPeerSession, "device:rediscovered:", v6, v7);
  }

}

- (void)deviceLost:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)150;
}

- (BOOL)isExtendedDistanceMeasurementEnabled
{
  NIServerNearbyPeerSubspecializationProtocol *subspecializedPeerSession;
  uint64_t v3;

  subspecializedPeerSession = self->_subspecializedPeerSession;
  v3 = objc_opt_class(NIServerNearbyPeerNbammsSession, a2);
  return objc_opt_isKindOfClass(subspecializedPeerSession, v3) & 1;
}

- (id)getContainerUniqueIdentifier
{
  return self->_containerUniqueIdentifier;
}

- (id)getNIConfiguration
{
  return self->_configuration;
}

- (id)getResourcesManager
{
  NIServerSessionResourceManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NIServerNearbyPeerSession;
  v2 = -[NIServerBaseSession resourcesManager](&v4, "resourcesManager");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)isLegacyDiscoveryToken:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectInRawTokenOPACKDictForKey:", &off_10082C070));
  v4 = v3 == 0;

  return v4;
}

- (BOOL)shouldInitiate:(id)a3 peerDiscoveryToken:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  unsigned int v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  id v36;
  unint64_t v37;
  id v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint8_t buf[8];
  NSErrorUserInfoKey v53;
  const __CFString *v54;
  NSErrorUserInfoKey v55;
  const __CFString *v56;
  NSErrorUserInfoKey v57;
  const __CFString *v58;
  NSErrorUserInfoKey v59;
  const __CFString *v60;
  NSErrorUserInfoKey v61;
  const __CFString *v62;

  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
  if (!v10)
    goto LABEL_6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("role")));

  if (!v12)
    goto LABEL_6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("role")));
  v16 = objc_opt_class(NSNumber, v15);
  isKindOfClass = objc_opt_isKindOfClass(v14, v16);

  if ((isKindOfClass & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("role")));
    v20 = objc_msgSend(v19, "intValue");

    v21 = v20 == 0;
    if (v20 >= 2)
    {
      v61 = NSLocalizedFailureReasonErrorKey;
      v62 = CFSTR("Invalid debugParameters role");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v22));

      goto LABEL_26;
    }
  }
  else
  {
LABEL_6:
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rawToken"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rawToken"));
    v25 = objc_msgSend(v23, "isEqualToData:", v24);

    if (v25)
    {
      v59 = NSLocalizedFailureReasonErrorKey;
      v60 = CFSTR("Peer and local discovery token are identical");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10012, v26));

      goto LABEL_26;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectInRawTokenOPACKDictForKey:", &off_10082C070));
    if (!v27
      || (v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectInRawTokenOPACKDictForKey:", &off_10082C070)),
          v28,
          v27,
          !v28))
    {
      v32 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,shouldInitiate using legacy initiator selection logic", buf, 2u);
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rawToken"));
      if ((unint64_t)objc_msgSend(v33, "length") <= 7)
      {

      }
      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rawToken"));
        v35 = (unint64_t)objc_msgSend(v34, "length") < 8;

        if (!v35)
        {
          v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rawToken")));
          v37 = *(_QWORD *)objc_msgSend(v36, "bytes");

          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rawToken")));
          v39 = *(_QWORD *)objc_msgSend(v38, "bytes");

          if (v37 == v39)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rawToken"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_reverse"));

            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rawToken"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "_reverse"));

            v44 = objc_retainAutorelease(v41);
            v37 = *(_QWORD *)objc_msgSend(v44, "bytes");
            v45 = objc_retainAutorelease(v43);
            v39 = *(_QWORD *)objc_msgSend(v45, "bytes");
            if (v37 == v39)
            {
              v55 = NSLocalizedFailureReasonErrorKey;
              v56 = CFSTR("Relevant parts of discovery token are identical to local token");
              v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
              *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10012, v46));

              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
                sub_1003E0C04();

              goto LABEL_26;
            }

          }
          v21 = v37 > v39;
          goto LABEL_27;
        }
      }
      v57 = NSLocalizedFailureReasonErrorKey;
      v58 = CFSTR("Discovery token are too short");
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10012, v47));

LABEL_26:
      v21 = 0;
      goto LABEL_27;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getIRK"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getIRK"));
    if (objc_msgSend(v29, "length") == (id)16
      && objc_msgSend(v30, "length") == (id)16
      && !objc_msgSend(v29, "isEqualToData:", v30))
    {
      v51 = 0;
      *(_QWORD *)buf = 0;
      v49 = 0;
      v50 = 0;
      objc_msgSend(v29, "getBytes:range:", &v51, 0, 8);
      objc_msgSend(v29, "getBytes:range:", buf, 8, 8);
      objc_msgSend(v30, "getBytes:range:", &v49, 0, 8);
      objc_msgSend(v30, "getBytes:range:", &v50, 8, 8);
      if (*(_QWORD *)buf == v50)
        v21 = v51 > v49;
      else
        v21 = *(_QWORD *)buf > v50;
    }
    else
    {
      v53 = NSLocalizedFailureReasonErrorKey;
      v54 = CFSTR("Peer and local discovery token IRKs are identical or invalid");
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v31));

      v21 = 0;
    }

  }
LABEL_27:

  return v21;
}

- (void)didReceiveNewSolution:(const void *)a3
{
  double v5;
  unint64_t *p_cachedSolutionMacAddr;
  void *v7;
  NIServerSessionResourceManager *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  objc_super v21;

  if (*((_BYTE *)a3 + 24))
  {
    v5 = *((double *)a3 + 2);
    p_cachedSolutionMacAddr = &self->_cachedSolutionMacAddr;
    self->_cachedSolutionMacAddr = *((_QWORD *)a3 + 5);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003E0C5C();
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession discoveryTokenFromIdentifier:](self, "discoveryTokenFromIdentifier:", *p_cachedSolutionMacAddr));
    if (v7)
    {
      v21.receiver = self;
      v21.super_class = (Class)NIServerNearbyPeerSession;
      v8 = -[NIServerBaseSession resourcesManager](&v21, "resourcesManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lifecycleSupervisor"));
      v11 = objc_msgSend(v10, "isTrackingPeer:", v7);

      if ((v11 & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
        if (!v12)
          goto LABEL_13;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("enableAdditionalUWBSignalFeatures")));

        if (!v14)
          goto LABEL_13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("enableAdditionalUWBSignalFeatures")));

        if (v16 && (v17 = objc_msgSend(v16, "BOOLValue"), v16, (v17 & 1) != 0))
        {
          v19 = xmmword_1004734E8;
          v20 = 1;
          -[NINearbyUpdatesEngine acceptRoseSolution:withProcessingOptions:](self->_updatesEngine, "acceptRoseSolution:withProcessingOptions:", a3, &v19);
        }
        else
        {
LABEL_13:
          -[NINearbyUpdatesEngine acceptRoseSolution:](self->_updatesEngine, "acceptRoseSolution:", a3);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lifecycleSupervisor"));
        objc_msgSend(v18, "measurementReceivedForToken:contTimestamp:", v7, v5);

        -[NIServerBackgroundContinuationManager measurementReceived](self->_backgroundContinuationManager, "measurementReceived");
      }

    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E0C30();
  }
}

- (void)didReceiveUnsuccessfulSolution:(const void *)a3
{
  void *v5;
  NIServerSessionResourceManager *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  objc_super v10;

  if (*((_BYTE *)a3 + 24))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession discoveryTokenFromIdentifier:](self, "discoveryTokenFromIdentifier:", *((_QWORD *)a3 + 5)));
    if (v5)
    {
      v10.receiver = self;
      v10.super_class = (Class)NIServerNearbyPeerSession;
      v6 = -[NIServerBaseSession resourcesManager](&v10, "resourcesManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lifecycleSupervisor"));
      v9 = objc_msgSend(v8, "isTrackingPeer:", v5);

      if ((v9 & 1) != 0)
        -[NINearbyUpdatesEngine acceptUnsuccessfulRoseSolution:](self->_updatesEngine, "acceptUnsuccessfulRoseSolution:", a3);

    }
  }
}

- (void)didReceiveRemoteData:(const void *)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  _DWORD *v8;
  BOOL v9;
  NSObject *v10;
  _BYTE *v11;
  NSObject *v12;
  int v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t v19[16];
  uint64_t v20;
  BOOL v21;
  _BYTE __p[12];
  __int16 v23;
  void *v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  __int16 v34;

  if (self->_configuration)
  {
    if (-[NIServerNearbyPeerSession isExtendedDistanceMeasurementEnabled](self, "isExtendedDistanceMeasurementEnabled"))
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
        sub_1003E0D48();
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession discoveryTokenFromIdentifier:](self, "discoveryTokenFromIdentifier:", *((_QWORD *)a3 + 5)));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
        v7 = objc_msgSend(v5, "isEqual:", v6);

        if ((v7 & 1) != 0)
        {
          sub_10000BF04(__p, "Receive");
          sub_10021411C((uint64_t **)__p, (unsigned __int8 **)a3 + 1);
          if (v25 < 0)
            operator delete(*(void **)__p);
          __p[0] = 0;
          BYTE2(v24) = 0;
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v33 = 0;
          v34 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v8 = sub_100004784();
          v9 = sub_1000069CC(v8[144]);
          v20 = 0;
          v21 = v9;
          if ((sub_100213960((uint64_t)a3 + 8, (uint64_t)__p, (uint64_t)&v20) & 1) != 0)
          {
            v30 = *((_QWORD *)a3 + 4);
            LOBYTE(v31) = 1;
            -[NINearbyUpdatesEngine acceptPeerData:fromPeer:](self->_updatesEngine, "acceptPeerData:fromPeer:", __p, v5);
            if (BYTE1(v20) && (_BYTE)v20)
            {
              v10 = qword_10085F520;
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v19 = 0;
                _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Received hangup signal", v19, 2u);
              }
              -[NIServerNearbyPeerSession _peerHungUp:](self, "_peerHungUp:", v5);
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          {
            sub_1003E0D1C();
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
        sub_1003E0CBC();
      }

    }
    else
    {
      v11 = (_BYTE *)*((_QWORD *)a3 + 1);
      if (*((_QWORD *)a3 + 2) - (_QWORD)v11 > 0xFuLL)
      {
        if (*v11 == 2)
        {
          v13 = v11[1];
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
            sub_1003E0D48();
          v15 = *((_QWORD *)a3 + 5);
          v14 = (uint64_t *)((char *)a3 + 40);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession discoveryTokenFromIdentifier:](self, "discoveryTokenFromIdentifier:", v15));
          if (v16)
          {
            if (v13)
            {
              v17 = qword_10085F520;
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
              {
                v18 = *v14;
                *(_DWORD *)__p = 134283779;
                *(_QWORD *)&__p[4] = v18;
                v23 = 2113;
                v24 = v16;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,#hangup Received hangup from 0x%{private}llx. Token: %{private}@", __p, 0x16u);
              }
              -[NIServerNearbyPeerSession _peerHungUp:](self, "_peerHungUp:", v16);
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          {
            sub_1003E0CBC();
          }

        }
        else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        {
          sub_1003E0E04();
        }
      }
      else
      {
        v12 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003E0D74((_DWORD *)a3 + 4, (_DWORD *)a3 + 2, v12);
      }
    }
  }
}

- (void)didServiceRequestUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  int var2;
  uint64_t v4;
  NIServerSessionResourceManager *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void **v11;
  void **v12;
  void **v13;
  NINearbyPeerConfiguration *configuration;
  void *v15;
  void *v16;
  void *v17;
  void *__p[2];
  char v19;
  void *v20[2];
  char v21;
  objc_super v22;
  void *v23;
  uint8_t buf[4];
  void **v25;
  __int16 v26;
  void **v27;

  var2 = a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  v22.receiver = self;
  v22.super_class = (Class)NIServerNearbyPeerSession;
  v6 = -[NIServerBaseSession resourcesManager](&v22, "resourcesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lifecycleSupervisor"));

  v9 = (id)qword_10085F520;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000BF04(v20, off_10080FDC0[v4 >> 32]);
    v10 = v21;
    v11 = (void **)v20[0];
    sub_10000BF04(__p, off_10080FE38[var2]);
    v12 = v20;
    if (v10 < 0)
      v12 = v11;
    if (v19 >= 0)
      v13 = __p;
    else
      v13 = (void **)__p[0];
    *(_DWORD *)buf = 136315394;
    v25 = v12;
    v26 = 2080;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,serviceRequestDidUpdateStatus - update: %s, reason: %s", buf, 0x16u);
    if (v19 < 0)
      operator delete(__p[0]);
    if (v21 < 0)
      operator delete(v20[0]);
  }

  if (HIDWORD(v4) == 3)
  {
    objc_msgSend(v8, "positioningSensorSessionStopped");
  }
  else if (HIDWORD(v4) == 1)
  {
    objc_msgSend(v8, "positioningSensorSessionStarted");
    if (-[NIServerNearbyPeerSession isExtendedDistanceMeasurementEnabled](self, "isExtendedDistanceMeasurementEnabled"))
      -[NIServerNearbyPeerSession _activateSensors](self, "_activateSensors");
  }
  if (var2 == 8)
  {
    configuration = self->_configuration;
    if (configuration)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](configuration, "peerDiscoveryToken"));
      v23 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
      objc_msgSend(v8, "stoppedDiscoveringPeersWithTokens:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
      -[NIServerNearbyPeerSession peerInactivityPeriodExceeded:](self, "peerInactivityPeriodExceeded:", v17);

    }
  }

}

- (void)didInvalidateUWBSession
{
  NSObject *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Invalidating ni peer session", buf, 2u);
  }
  -[NIServerNearbyPeerSession invalidate](self, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)NIServerNearbyPeerSession;
  v4 = -[NIServerBaseSession invalidationHandler](&v7, "invalidationHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
  ((void (**)(_QWORD, void *))v5)[2](v5, v6);

}

- (BOOL)_longRangeEnabled
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession resourcesManager](self, "resourcesManager"));
  v4 = objc_msgSend(v3, "longRangeEnabled");

  v5 = -[NINearbyPeerConfiguration isLongRangeEnabled](self->_configuration, "isLongRangeEnabled");
  v6 = -[NIServerNearbyPeerSession _peerSupportsLongRange](self, "_peerSupportsLongRange");
  v7 = v6;
  if ((v4 & v5 & 1) == 0)
  {
    if (v6)
    {
      v8 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,WARNING: longRange is disabled locally, but the peer supports it.", buf, 2u);
      }
    }
  }
  if (((v4 & v5 ^ 1 | v7) & 1) == 0)
  {
    v9 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,longRange is supported locally, but the peer does NOT support it.", v11, 2u);
    }
  }
  return v4 & v7 & v5;
}

- (BOOL)_peerSupportsLongRange
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;

  if (self->_configuration)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_peerTokenDict, "objectForKeyedSubscript:", &off_10082C088));
    if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
      v5 = (unint64_t)objc_msgSend(v3, "unsignedIntValue") & 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  optional<rose::finding::SignallingData> *p_currentSignallingData;
  _DWORD *v8;
  BOOL v9;
  _BOOL4 engaged;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  void *v14;
  id v15;
  duration<long long, std::ratio<1, 1000>> v16;
  uint64_t v17;
  uint64_t v19;
  NIServerNearbyPeerSubspecializationProtocol *subspecializedPeerSession;
  duration<long long, std::ratio<1, 1000>> v21;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v22;
  NIServerNearbyPeerSubspecializationProtocol *v23;
  NINearbyPeerConfiguration *configuration;
  NIServerBackgroundContinuationManager *backgroundContinuationManager;
  objc_super v26;
  std::chrono::nanoseconds __ns;
  _BYTE buf[24];

  if (!self->_configuration)
    return 0;
  v3 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NIServerNearbyPeerSession;
  v5 = -[NIServerBaseSession disableAllServices](&v26, "disableAllServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (-[NIServerNearbyPeerSession isExtendedDistanceMeasurementEnabled](self, "isExtendedDistanceMeasurementEnabled"))
  {
    if (v3)
    {
      if (!self->_currentFindeeData.__engaged_)
      {
        memset(&buf[7], 0, 17);
        self->_currentFindeeData.var0.__null_state_ = 0;
        self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_ = 0;
        self->_currentFindeeData.var0.__val_.measured_displacement.var0.__null_state_ = 0;
        self->_currentFindeeData.var0.__val_.measured_displacement.__engaged_ = 0;
        self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
        self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ = 0;
        *(_OWORD *)(&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ + 1) = *(_OWORD *)buf;
        *(_QWORD *)(&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ + 1) = *(_QWORD *)&buf[16];
        self->_currentFindeeData.var0.__val_.location_data.__engaged_ = 0;
        self->_currentFindeeData.var0.__val_.good_gnss_conditions_detected = 0;
        self->_currentFindeeData.__engaged_ = 1;
      }
      p_currentSignallingData = &self->_currentSignallingData;
      if (!self->_currentSignallingData.__engaged_)
      {
        v8 = sub_100004784();
        v9 = sub_1000069CC(v8[144]);
        engaged = self->_currentSignallingData.__engaged_;
        *(_QWORD *)&p_currentSignallingData->var0.__null_state_ = 0;
        self->_currentSignallingData.var0.__val_.isPhone = v9;
        if (!engaged)
          self->_currentSignallingData.__engaged_ = 1;
      }
      *(_WORD *)&p_currentSignallingData->var0.__null_state_ = 257;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
        sub_1003E0E30();
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("FindingDisableHangup"));

      if (v12)
      {
        v13 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Would set hangup bit, but it's disabled in defaults writes", buf, 2u);
        }
        if (!self->_currentSignallingData.__engaged_)
          sub_10000BA44();
        *(_WORD *)&p_currentSignallingData->var0.__null_state_ = 256;
      }
      if (!self->_currentFindeeData.__engaged_)
        sub_10000BA44();
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
      v15 = -[NIServerNearbyPeerSession setDataFrame:forPeer:](self, "setDataFrame:forPeer:", &self->_currentFindeeData, v14);

      v16.__rep_ = (int64_t)-[NIServerNearbyPeerSession nominalCycleRate](self, "nominalCycleRate");
      if (v16.__rep_ >= 1)
      {
        v17 = 1000000 * v16.__rep_;
        if ((unint64_t)v16.__rep_ >= 0x8637BD057A0)
          v17 = 0x7FFFFFFFFFFFFFFFLL;
        *(_QWORD *)buf = v17;
        std::this_thread::sleep_for ((const std::chrono::nanoseconds *)buf);
      }
    }
    if (self->_currentFindeeData.__engaged_)
      self->_currentFindeeData.__engaged_ = 0;
    if (self->_currentSignallingData.__engaged_)
      self->_currentSignallingData.__engaged_ = 0;
    -[NIServerNearbyPeerSession _deactivateSensors](self, "_deactivateSensors");
  }
  else if (!-[NIServerNearbyPeerSession _longRangeEnabled](self, "_longRangeEnabled") && v3)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003E0E30();
    LOBYTE(__ns.__rep_) = 0;
    sub_100191910(buf, 0x10uLL, &__ns);
    v19 = *(_QWORD *)buf;
    **(_WORD **)buf = 258;
    *(_QWORD *)(v19 + 2) = 0;
    *(_QWORD *)(v19 + 8) = 0;
    subspecializedPeerSession = self->_subspecializedPeerSession;
    if (subspecializedPeerSession)
    {
      -[NIServerNearbyPeerSubspecializationProtocol updatePeerData:](subspecializedPeerSession, "updatePeerData:", buf);
      v21.__rep_ = (int64_t)-[NIServerNearbyPeerSession nominalCycleRate](self, "nominalCycleRate");
      if (v21.__rep_ >= 1)
      {
        v22 = 1000000 * v21.__rep_;
        if ((unint64_t)v21.__rep_ >= 0x8637BD057A0)
          v22 = 0x7FFFFFFFFFFFFFFFLL;
        __ns.__rep_ = v22;
        std::this_thread::sleep_for (&__ns);
      }
    }
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }
  }
  v23 = self->_subspecializedPeerSession;
  if (v23)
    -[NIServerNearbyPeerSubspecializationProtocol invalidate](v23, "invalidate");
  configuration = self->_configuration;
  self->_configuration = 0;

  self->_cachedSolutionMacAddr = 0;
  -[NIServerBackgroundContinuationManager invalidate](self->_backgroundContinuationManager, "invalidate");
  backgroundContinuationManager = self->_backgroundContinuationManager;
  self->_backgroundContinuationManager = 0;

  return v6;
}

- (id)_addPeers:(id)a3
{
  id v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NIServerNearbyPeerSession;
  v5 = -[NIServerBaseSession resourcesManager](&v20, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btResource", (_QWORD)v16));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rawToken"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addPeerDiscoveryToken:", v13));

      if (v14)
        break;
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v14 = 0;
  }

  return v14;
}

- (void)_peerHungUp:(id)a3
{
  id v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NIServerNearbyPeerSession;
  v5 = -[NIServerBaseSession resourcesManager](&v12, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btResource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rawToken"));
  v10 = objc_msgSend(v8, "isCachedByTokenData:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lifecycleSupervisor"));
    objc_msgSend(v11, "peerHangupReceived:", v4);

    -[NIServerNearbyPeerSession _removePeerObject:withReason:](self, "_removePeerObject:withReason:", v4, 1);
  }

}

- (void)_removePeerObject:(id)a3 withReason:(unint64_t)a4
{
  id v6;
  NIServerSessionResourceManager *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  NINearbyObject *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  NSObject *v19;
  NSString *containerUniqueIdentifier;
  void *v21;
  NSObject *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  _BYTE v27[18];
  NINearbyObject *v28;

  v6 = a3;
  -[NINearbyUpdatesEngine clearStateForToken:](self->_updatesEngine, "clearStateForToken:", v6);
  v23.receiver = self;
  v23.super_class = (Class)NIServerNearbyPeerSession;
  v7 = -[NIServerBaseSession resourcesManager](&v23, "resourcesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "btResource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceCache"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rawToken"));
  v12 = objc_msgSend(v10, "uncacheDeviceByTokenData:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lifecycleSupervisor"));
    v14 = objc_msgSend(v13, "isTracking");

    if (v14)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E0EE8();
    }
  }
  v15 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remote"));
  v28 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  objc_msgSend(v16, "didRemoveNearbyObjects:withReason:", v17, a4);

  if (a4)
  {
    if (a4 == 1)
    {
      v18 = CFSTR("Hangup");
    }
    else
    {
      if (a4 == 2)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
          sub_1003E0EBC();
        v22 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v25 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerNearbyPeerSession.mm";
          v26 = 1024;
          *(_DWORD *)v27 = 837;
          *(_WORD *)&v27[4] = 2080;
          *(_QWORD *)&v27[6] = "-[NIServerNearbyPeerSession _removePeerObject:withReason:]";
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "#ses-nrby-peer,%s:%d: assertion failure in %s", buf, 0x1Cu);
        }
        abort();
      }
      v18 = &stru_10081D5E0;
    }
  }
  else
  {
    v18 = CFSTR("Timeout");
  }
  v19 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 138412802;
    v25 = (const char *)v15;
    v26 = 2112;
    *(_QWORD *)v27 = v18;
    *(_WORD *)&v27[8] = 2112;
    *(_QWORD *)&v27[10] = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,_removePeerObject: %@ with reason: %@ for session identifier: %@", buf, 0x20u);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession _disableAllServicesAndSendHangupSignal:](self, "_disableAllServicesAndSendHangupSignal:", a4 != 1));
  if (v21 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003E0E5C();

}

- (BOOL)_shouldBypassBluetoothDiscovery
{
  unsigned int v2;
  void *v3;
  unsigned int v4;
  NSObject *v5;
  _DWORD v7[2];

  v2 = -[NIServerNearbyPeerSubspecializationProtocol shouldBypassBleDiscovery](self->_subspecializedPeerSession, "shouldBypassBleDiscovery");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = v2 | objc_msgSend(v3, "BOOLForKey:", CFSTR("FindingBypassDiscovery"));

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Should bypass Ble discovery %d", (uint8_t *)v7, 8u);
  }
  return v4;
}

- (id)setDataFrame:(const void *)a3 forPeer:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  optional<rose::finding::FindeeData> *p_currentFindeeData;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _DWORD *v31;
  BOOL v32;
  NIServerNearbyPeerSubspecializationProtocol *subspecializedPeerSession;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  void *__p[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _OWORD v47[2];
  unsigned __int8 *v48;
  unsigned __int8 *v49;
  uint64_t v50;
  NSErrorUserInfoKey v51;
  const __CFString *v52;
  NSErrorUserInfoKey v53;
  const __CFString *v54;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    p_currentFindeeData = &self->_currentFindeeData;
    v10 = *(_OWORD *)a3;
    v11 = *((_OWORD *)a3 + 2);
    if (self->_currentFindeeData.__engaged_)
    {
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v11;
      *(_OWORD *)&p_currentFindeeData->var0.__null_state_ = v10;
      v12 = *((_OWORD *)a3 + 3);
      v13 = *((_OWORD *)a3 + 4);
      v14 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1 = v14;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = v12;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementV = v13;
      v15 = *((_OWORD *)a3 + 7);
      v16 = *((_OWORD *)a3 + 8);
      v17 = *((_OWORD *)a3 + 9);
      *(_OWORD *)((char *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.uncertainty + 2) = *(_OWORD *)((char *)a3 + 154);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = v16;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.easterlyOffsetM = v17;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ = v15;
    }
    else
    {
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v11;
      *(_OWORD *)&p_currentFindeeData->var0.__null_state_ = v10;
      v20 = *((_OWORD *)a3 + 3);
      v21 = *((_OWORD *)a3 + 4);
      v22 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1 = v22;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = v20;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementV = v21;
      v23 = *((_OWORD *)a3 + 7);
      v24 = *((_OWORD *)a3 + 8);
      v25 = *((_OWORD *)a3 + 10);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.easterlyOffsetM = *((_OWORD *)a3 + 9);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.__engaged_ = v25;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ = v23;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = v24;
      self->_currentFindeeData.__engaged_ = 1;
    }
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v26 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.easterlyOffsetM;
    v46 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_;
    v47[0] = v26;
    *(_OWORD *)((char *)v47 + 10) = *(_OWORD *)((char *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.uncertainty
                                              + 2);
    v27 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_;
    v42 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementV;
    v43 = v27;
    v28 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_;
    v44 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1;
    v45 = v28;
    v29 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_;
    *(_OWORD *)__p = *(_OWORD *)&p_currentFindeeData->var0.__null_state_;
    v39 = v29;
    v30 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementH1;
    v40 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp;
    v41 = v30;
    if (self->_currentSignallingData.__engaged_)
    {
      v36 = *(_QWORD *)&self->_currentSignallingData.var0.__null_state_;
      LOBYTE(v37) = self->_currentSignallingData.var0.__val_.isPhone;
    }
    else
    {
      v31 = sub_100004784();
      v32 = sub_1000069CC(v31[144]);
      v36 = 0;
      LOBYTE(v37) = v32;
    }
    if (sub_100212F4C((uint64_t)&v48, (uint64_t)__p, (unsigned __int8 *)&v36))
    {
      sub_10000BF04(__p, "Send");
      sub_10021411C((uint64_t **)__p, &v48);
      if (SBYTE7(v39) < 0)
        operator delete(__p[0]);
      subspecializedPeerSession = self->_subspecializedPeerSession;
      if (subspecializedPeerSession)
        -[NIServerNearbyPeerSubspecializationProtocol updatePeerData:](subspecializedPeerSession, "updatePeerData:", &v48, v36, v37);
      v19 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E0F48();
      v51 = NSLocalizedFailureReasonErrorKey;
      v52 = CFSTR("FindingDataFrameFormat::encode failed");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1, v36, v37, __p[0], __p[1], v39, v40, v41, v42, v43, v44, v45, v46, v47[0],
                        *(_QWORD *)&v47[1],
                        *((_QWORD *)&v47[1] + 1)));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v34));

    }
    if (v48)
    {
      v49 = v48;
      operator delete(v48);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E0F74();
    v53 = NSLocalizedFailureReasonErrorKey;
    v54 = CFSTR("Not Ranging with specified peer");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v18));

  }
  return v19;
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
  v6 = sub_10024ECD4;
  v7 = &unk_10080CCE0;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMAltimeter startRelativeAltitudeUpdatesToQueue:withHandler:](self->_altimeterManager, "startRelativeAltitudeUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startPedometerDataUpdates
{
  void ***v3;
  CMPedometer *pedometerManager;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_10024EF24;
  v9 = &unk_10080CD28;
  objc_copyWeak(&v10, &location);
  v3 = objc_retainBlock(&v6);
  pedometerManager = self->_pedometerManager;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now", v6, v7, v8, v9));
  -[CMPedometer startPedometerUpdatesFromDate:withHandler:](pedometerManager, "startPedometerUpdatesFromDate:withHandler:", v5, v3);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_startPedometerEventUpdates
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
  v6 = sub_10024F33C;
  v7 = &unk_10080CD70;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMPedometer startPedometerEventUpdatesWithHandler:](self->_pedometerManager, "startPedometerEventUpdatesWithHandler:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startMotionActivityUpdates
{
  void ***v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_10024F628;
  v7 = &unk_10080CDB8;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](self->_motionActivityManager, "startActivityUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3, v4, v5, v6, v7);

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
  v6 = sub_10024F8B8;
  v7 = &unk_10080CE00;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMOdometryManager setOdometryUpdateInterval:](self->_pdrManager, "setOdometryUpdateInterval:", 0.1, v4, v5, v6, v7);
  -[CMOdometryManager startOdometryUpdatesToQueue:withHandler:](self->_pdrManager, "startOdometryUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
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
  v6 = sub_10024FF00;
  v7 = &unk_10080CE48;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMMotionManager setDeviceMotionUpdateInterval:](self->_motionManager, "setDeviceMotionUpdateInterval:", 0.01, v4, v5, v6, v7);
  -[CMMotionManager startDeviceMotionUpdatesToQueue:withHandler:](self->_motionManager, "startDeviceMotionUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_activateSensors
{
  NSObject *v3;
  _BOOL4 sensorsOn;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  CMMotionManager *v10;
  CMMotionManager *motionManager;
  CMAltimeter *v12;
  CMAltimeter *altimeterManager;
  CMPedometer *v14;
  CMPedometer *pedometerManager;
  CMMotionActivityManager *v16;
  CMMotionActivityManager *motionActivityManager;
  NSObject *v18;
  CMOdometryManager *v19;
  CMOdometryManager *pdrManager;
  uint64_t v21;
  __int16 v22;
  uint8_t v23[16];
  uint8_t v24[16];
  __int16 v25;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,turning on sensors for peer algorithms.", buf, 2u);
  }
  sensorsOn = self->_sensorsOn;
  v5 = qword_10085F520;
  v6 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
  if (sensorsOn)
  {
    if (!v6)
      return;
    v25 = 0;
    v7 = "#ses-nrby-peer,sensors already ON";
    v8 = (uint8_t *)&v25;
    v9 = v5;
    goto LABEL_32;
  }
  if (v6)
  {
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,turning on motion sensors for peer algorithms.", v24, 2u);
  }
  v10 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
  motionManager = self->_motionManager;
  self->_motionManager = v10;

  if (self->_motionManager)
  {
    -[NIServerNearbyPeerSession _startDeviceMotionUpdates](self, "_startDeviceMotionUpdates");
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    sub_1003E14A0();
  }
  v12 = (CMAltimeter *)objc_alloc_init((Class)CMAltimeter);
  altimeterManager = self->_altimeterManager;
  self->_altimeterManager = v12;

  if (self->_altimeterManager)
  {
    -[NIServerNearbyPeerSession _startAltitudeUpdates](self, "_startAltitudeUpdates");
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    sub_1003E1474();
  }
  v14 = (CMPedometer *)objc_alloc_init((Class)CMPedometer);
  pedometerManager = self->_pedometerManager;
  self->_pedometerManager = v14;

  if (self->_pedometerManager)
  {
    -[NIServerNearbyPeerSession _startPedometerDataUpdates](self, "_startPedometerDataUpdates");
    -[NIServerNearbyPeerSession _startPedometerEventUpdates](self, "_startPedometerEventUpdates");
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    sub_1003E1448();
  }
  v16 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
  motionActivityManager = self->_motionActivityManager;
  self->_motionActivityManager = v16;

  if (self->_motionActivityManager)
  {
    -[NIServerNearbyPeerSession _startMotionActivityUpdates](self, "_startMotionActivityUpdates");
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    sub_1003E141C();
  }
  v18 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,turning on PDR for peer algorithms.", v23, 2u);
  }
  v19 = (CMOdometryManager *)objc_alloc_init((Class)CMOdometryManager);
  pdrManager = self->_pdrManager;
  self->_pdrManager = v19;

  if (self->_pdrManager)
  {
    -[NIServerNearbyPeerSession _startDevicePDRUpdates](self, "_startDevicePDRUpdates");
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E13F0();
  }
  self->_sensorsOn = 1;
  v21 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 0;
    v7 = "#ses-nrby-peer,turned on sensors for peer algorithms.";
    v8 = (uint8_t *)&v22;
    v9 = v21;
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
  }
}

- (void)_deactivateSensors
{
  NSObject *v3;
  CMAltimeter *altimeterManager;
  CMPedometer *pedometerManager;
  CMMotionActivityManager *motionActivityManager;
  CMMotionManager *motionManager;
  CMOdometryManager *pdrManager;
  uint8_t v9[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,turning off sensors for findee algorithms.  ", v9, 2u);
  }
  if (self->_sensorsOn)
  {
    -[CMAltimeter stopRelativeAltitudeUpdates](self->_altimeterManager, "stopRelativeAltitudeUpdates");
    altimeterManager = self->_altimeterManager;
    self->_altimeterManager = 0;

    -[CMPedometer stopPedometerUpdates](self->_pedometerManager, "stopPedometerUpdates");
    -[CMPedometer stopPedometerEventUpdates](self->_pedometerManager, "stopPedometerEventUpdates");
    pedometerManager = self->_pedometerManager;
    self->_pedometerManager = 0;

    -[CMMotionActivityManager stopActivityUpdates](self->_motionActivityManager, "stopActivityUpdates");
    motionActivityManager = self->_motionActivityManager;
    self->_motionActivityManager = 0;

    -[CMMotionManager stopDeviceMotionUpdates](self->_motionManager, "stopDeviceMotionUpdates");
    motionManager = self->_motionManager;
    self->_motionManager = 0;

    -[CMOdometryManager stopOdometryUpdates](self->_pdrManager, "stopOdometryUpdates");
    pdrManager = self->_pdrManager;
    self->_pdrManager = 0;

    self->_sensorsOn = 0;
  }
}

- (void)_handleSessionBackgroundContinuationAuth:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  BOOL *p_backgroundedClientsSupported;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  objc_super v10;
  uint8_t buf[4];
  const char *v12;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)buf = 136315138;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Background continuation auth? %s", buf, 0xCu);
  }
  p_backgroundedClientsSupported = &self->_backgroundedClientsSupported;
  self->_backgroundedClientsSupported = v3;
  v10.receiver = self;
  v10.super_class = (Class)NIServerNearbyPeerSession;
  v8 = -[NIServerBaseSession backgroundSupportUpdateHandler](&v10, "backgroundSupportUpdateHandler");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v8);
  ((void (**)(_QWORD, BOOL))v9)[2](v9, *p_backgroundedClientsSupported);

}

- (void)processVisionInput:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  -[NINearbyUpdatesEngine acceptVisionInput:](self->_updatesEngine, "acceptVisionInput:", v4);

}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  NINearbyUpdatesEngine *v6;
  id v7;
  OS_dispatch_queue *clientQueue;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = (NINearbyUpdatesEngine *)a3;
  v7 = a4;
  if (self->_updatesEngine != v6)
    __assert_rtn("-[NIServerNearbyPeerSession updatesEngine:didUpdateNearbyObjects:]", "NIServerNearbyPeerSession.mm", 1270, "engine == _updatesEngine");
  clientQueue = self->_clientQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10025089C;
  v10[3] = &unk_1007FA518;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async((dispatch_queue_t)clientQueue, v10);

}

- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5
{
  NINearbyUpdatesEngine *v8;
  id v9;
  id v10;
  OS_dispatch_queue *clientQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v8 = (NINearbyUpdatesEngine *)a3;
  v9 = a4;
  v10 = a5;
  if (self->_updatesEngine != v8)
    __assert_rtn("-[NIServerNearbyPeerSession updatesEngine:didUpdateAlgorithmConvergenceState:forObject:]", "NIServerNearbyPeerSession.mm", 1314, "engine == _updatesEngine");
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100250A54;
  block[3] = &unk_100809CB0;
  block[4] = self;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async((dispatch_queue_t)clientQueue, block);

}

- (void)updatesEngine:(id)a3 didUpdateFindeeData:(const void *)a4 forToken:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;

  v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003E14CC();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession setDataFrame:forPeer:](self, "setDataFrame:forPeer:", a4, v7));
  if (v8)
  {
    v9 = (id)qword_10085F520;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description")));
      v11 = 136315138;
      v12 = objc_msgSend(v10, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,sent peer data to ranging provider with error: %s", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (id)objectFromIdentifier:(unint64_t)a3
{
  void *v3;
  NINearbyObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken", a3));
  if (v3)
    v4 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  return -[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken", a3);
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

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  -[NIServerNearbyPeerSession _removePeerObject:withReason:](self, "_removePeerObject:withReason:", v4, 0);

}

- (NINearbyPeerConfiguration)configuration
{
  return (NINearbyPeerConfiguration *)objc_getProperty(self, a2, 440, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_pdrManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_pedometerManager, 0);
  objc_storeStrong((id *)&self->_altimeterManager, 0);
  objc_storeStrong((id *)&self->_deviceOperationQueue, 0);
  objc_storeStrong((id *)&self->_backgroundContinuationManager, 0);
  objc_storeStrong((id *)&self->_peerTokenDict, 0);
  sub_10001AE68((uint64_t)&self->_powerBudgetProvider);
  objc_storeStrong((id *)&self->_subspecializedPeerSession, 0);
  objc_storeStrong((id *)&self->_containerUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_updatesEngine, 0);
}

- (id).cxx_construct
{
  self->_powerBudgetProvider.__ptr_ = 0;
  self->_powerBudgetProvider.__cntrl_ = 0;
  sub_10028D4BC(&self->_machTimeConverter, a2);
  self->_currentFindeeData.var0.__null_state_ = 0;
  self->_currentFindeeData.__engaged_ = 0;
  self->_currentSignallingData.var0.__null_state_ = 0;
  self->_currentSignallingData.__engaged_ = 0;
  return self;
}

@end
