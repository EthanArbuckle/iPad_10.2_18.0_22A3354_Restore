@implementation NIServerBaseSession

- (NIServerBaseSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  NIServerBaseSession *v12;
  NIServerBaseSession *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerBaseSession.mm"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

    if (a5)
      goto LABEL_4;
    goto LABEL_9;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerBaseSession.mm"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourcesManager"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_9:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerBaseSession.mm"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

LABEL_4:
  v18.receiver = self;
  v18.super_class = (Class)NIServerBaseSession;
  v12 = -[NIServerBaseSession init](&v18, "init");
  v13 = v12;
  if (v12)
  {
    v12->_isVoucherSet = 0;
    objc_storeWeak((id *)&v12->_resourcesManager, v9);
  }

  return v13;
}

- (duration<long)nominalCycleRate
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v4) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v4, 2u);
  }
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    v4 = 136315650;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    v6 = 1024;
    v7 = 60;
    v8 = 2080;
    v9 = "-[NIServerBaseSession nominalCycleRate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v4, 0x1Cu);
  }
  abort();
}

- (id)lastConfiguration
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v4) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v4, 2u);
  }
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    v4 = 136315650;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    v6 = 1024;
    v7 = 65;
    v8 = 2080;
    v9 = "-[NIServerBaseSession lastConfiguration]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v4, 0x1Cu);
  }
  abort();
}

- (id)configure
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v4) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v4, 2u);
  }
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    v4 = 136315650;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    v6 = 1024;
    v7 = 70;
    v8 = 2080;
    v9 = "-[NIServerBaseSession configure]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v4, 0x1Cu);
  }
  abort();
}

- (id)run
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v4) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v4, 2u);
  }
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    v4 = 136315650;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    v6 = 1024;
    v7 = 75;
    v8 = 2080;
    v9 = "-[NIServerBaseSession run]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v4, 0x1Cu);
  }
  abort();
}

- (id)pauseWithSource:(int64_t)a3
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v5) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v5, 2u);
  }
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    v5 = 136315650;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    v7 = 1024;
    v8 = 80;
    v9 = 2080;
    v10 = "-[NIServerBaseSession pauseWithSource:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v5, 0x1Cu);
  }
  abort();
}

- (BOOL)updateConfiguration:(id)a3
{
  return 0;
}

- (BOOL)supportsSessionObservers
{
  return 0;
}

- (BOOL)supportsBackgroundedClients
{
  return 0;
}

- (BOOL)supportsCameraAssistance
{
  return 0;
}

- (unint64_t)requiresUWBToRun
{
  return 0;
}

- (unint64_t)requiresNarrowbandToRun
{
  return 0;
}

- (unint64_t)requiresSpatialInteractionBluetoothResource
{
  return 0;
}

- (id)disableAllServices
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "btResource"));
  objc_msgSend(v3, "stopAndClearState");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lifecycleSupervisor"));
  objc_msgSend(v4, "stoppedDiscoveringAllPeers");

  return 0;
}

- (void)invalidate
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v4 = (id)qword_10085F520;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "serverSessionIdentifier"));
    v10 = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-base,Terminating NIServerBaseSession. Session identifier: %@", (uint8_t *)&v10, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession disableAllServices](self, "disableAllServices"));
  if (v6)
  {
    v7 = (id)qword_10085F520;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "serverSessionIdentifier"));
      sub_1003E4BF8(v8, (uint64_t)v6, (uint8_t *)&v10, v7);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lifecycleSupervisor"));
  objc_msgSend(v9, "invalidateCalled");

}

- (id)addObject:(id)a3
{
  id v3;

  v3 = -[NIServerBaseSession deleteURSKs]_0();
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)deleteURSKs
{
  void *v0;
  void *v1;
  NSErrorUserInfoKey v3;
  const __CFString *v4;

  v3 = NSLocalizedDescriptionKey;
  v4 = CFSTR("This function is not supported for this configuration.");
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5889, v0));

  return v1;
}

- (id)removeObject:(id)a3
{
  id v3;

  v3 = -[NIServerBaseSession deleteURSKs]_0();
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (NIServerDataResponse)processDCKMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NIServerDataResponse result;

  v3 = -[NIServerBaseSession deleteURSKs]_0();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = 0;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (id)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 monotonicTimeSec:(double)a6 response:(id *)a7
{
  *a7 = 0;
  return -[NIServerBaseSession deleteURSKs]_0();
}

- (NIServerNumberResponse)isRangingLimitExceeded
{
  id v2;
  void *v3;
  void *v4;
  NIServerNumberResponse result;

  v2 = -[NIServerBaseSession deleteURSKs]_0();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = 0;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  id v4;

  v4 = -[NIServerBaseSession deleteURSKs]_0();
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)_processCarKeyEvent:(id)a3
{
  id v3;

  v3 = -[NIServerBaseSession deleteURSKs]_0();
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)_processFindingEvent:(id)a3
{
  id v3;

  v3 = -[NIServerBaseSession deleteURSKs]_0();
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)_processSystemEvent:(id)a3
{
  id v3;

  v3 = -[NIServerBaseSession deleteURSKs]_0();
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "remote"));
  v6 = sub_10028E648(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "uwbSessionDidFailWithError:", v7);

}

- (void)processAcwgM3Msg:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "remote"));
  v5 = sub_10028E648(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "uwbSessionDidFailWithError:", v6);

}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "remote"));
  v6 = sub_10028E648(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "uwbSessionDidFailWithError:", v7);

}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "remote"));
  v6 = sub_10028E648(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "uwbSessionDidFailWithError:", v7);

}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "remote"));
  v5 = sub_10028E648(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "uwbSessionDidFailWithError:", v6);

}

- (BOOL)isInterestedInSamplesForDevice:(id)a3
{
  return 0;
}

- (BOOL)isInteresetedInSample:(id)a3
{
  return 0;
}

- (BOOL)supportsDevicePresence
{
  return 0;
}

- (id)getQueueForInputingData
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v4) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v4, 2u);
  }
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    v4 = 136315650;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    v6 = 1024;
    v7 = 263;
    v8 = 2080;
    v9 = "-[NIServerBaseSession getQueueForInputingData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v4, 0x1Cu);
  }
  abort();
}

- (id)printableState
{
  return objc_opt_new(NSArray);
}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  unint64_t v3;
  id WeakRetained;
  unint64_t v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3.var0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lifecycleSupervisor"));
  v5 = HIDWORD(v3);

  if ((_DWORD)v5 == 3)
  {
    objc_msgSend(v7, "positioningSensorSessionStopped");
    v6 = v7;
  }
  else if ((_DWORD)v5 == 5)
  {
    objc_msgSend(v7, "positioningSensorSessionStarted");
    v6 = v7;
  }
  else
  {
    v6 = v7;
    if ((_DWORD)v5 == 6)
    {
      objc_msgSend(v7, "stoppedDiscoveringAllPeers");
      v6 = v7;
    }
  }

}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NIDiscoveryToken *v8;
  void *v9;
  NIDiscoveryToken *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "btResource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceForIdentifier:", a3));

  if (v7)
  {
    v8 = [NIDiscoveryToken alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryTokenData"));
    v10 = -[NIDiscoveryToken initWithBytes:](v8, "initWithBytes:", v9);

  }
  else
  {
    v11 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E4C5C(a3, v11, v12, v13, v14, v15, v16, v17);
    v10 = 0;
  }

  return v10;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  $BEC950A715106DE229A2E4BA1089E24D v14;
  _BOOL8 v15;
  optional<unsigned long long> result;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "btResource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rawToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceForTokenData:", v8));

  if (v9)
  {
    v10 = (unint64_t)objc_msgSend(v9, "u64Identifier");
    v11 = v10 & 0xFFFFFFFFFFFFFF00;
    v12 = v10;
    v13 = 1;
  }
  else
  {
    v13 = 0;
    v12 = 0;
    v11 = 0;
  }

  v14.__val_ = v11 | v12;
  v15 = v13;
  result.__engaged_ = v15;
  result.var0 = v14;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "btResource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceForIdentifier:", a3));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NINearbyObject objectFromBluetoothDevice:](NINearbyObject, "objectFromBluetoothDevice:", v7));
  }
  else
  {
    v9 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E4C5C(a3, v9, v10, v11, v12, v13, v14, v15);
    v8 = 0;
  }

  return v8;
}

- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id WeakRetained;
  void *v6;
  id v7;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  id v9;

  v3 = v1;
  v9 = v2;
  WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "serverSessionIdentifier"));

  if (!v6)
    __assert_rtn("-[NIServerBaseSession uniqueIdentifierForEngine:]", "NIServerBaseSession.mm", 349, "identifier != nil");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString")));
  sub_10000BF04(retstr, (char *)objc_msgSend(v7, "UTF8String"));

  return result;
}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;

  v3 = a3;
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v6) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v6, 2u);
  }
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    v8 = 1024;
    v9 = 360;
    v10 = 2080;
    v11 = "-[NIServerBaseSession peerInactivityPeriodExceeded:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v6, 0x1Cu);
  }
  abort();
}

- (void)setClientVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_clientVoucher, a3);
  self->_isVoucherSet = 1;
}

- (BOOL)adoptVoucher
{
  return 0;
}

- (BOOL)releaseVoucher
{
  return 0;
}

- (NIServerSessionResourceManager)resourcesManager
{
  return (NIServerSessionResourceManager *)objc_loadWeakRetained((id *)&self->_resourcesManager);
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)backgroundSupportUpdateHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setBackgroundSupportUpdateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundSupportUpdateHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_destroyWeak((id *)&self->_resourcesManager);
  objc_storeStrong((id *)&self->_clientVoucher, 0);
}

@end
