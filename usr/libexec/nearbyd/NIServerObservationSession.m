@implementation NIServerObservationSession

- (NIServerObservationSession)initWithClientInfo:(const NIServerClientInfo *)a3 connection:(id)a4
{
  id v6;
  NIServerObservationSession *v7;
  NIServerObservationSession *v8;
  uint64_t v9;
  NIServerClient *remote;
  NIServerObservationSession *v11;
  NSObject *v12;
  void *v14;
  objc_super v15;

  v6 = a4;
  if (!v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerObservationSession.mm"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  v15.receiver = self;
  v15.super_class = (Class)NIServerObservationSession;
  v7 = -[NIServerObservationSession init](&v15, "init");
  v8 = v7;
  if (v7)
  {
    atomic_store(0, (unsigned __int8 *)&v7->_shouldDeliverUpdates);
    atomic_store(0, (unsigned __int8 *)&v7->_activated);
    atomic_store(0, (unsigned __int8 *)&v7->_runOnce);
    v9 = objc_claimAutoreleasedReturnValue(+[NIServerClient delegateProxyWithConnection:](NIServerClient, "delegateProxyWithConnection:", v6));
    remote = v8->_remote;
    v8->_remote = (NIServerClient *)v9;

    operator new();
  }
  if ((objc_msgSend(0, "validateClientPermissions") & 1) != 0)
  {
    v11 = (NIServerObservationSession *)0;
  }
  else
  {
    v12 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D619C(v12);
    v11 = 0;
  }

  return v11;
}

- (BOOL)validateClientPermissions
{
  _BOOL4 v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  uint8_t v18[16];

  v3 = -[PRAppStateMonitor isDaemon](self->_appStateMonitor, "isDaemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.locationd"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.intelligentroutingd"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.milod"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("proxtool"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Hello UWB"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.WirelessStress"));

  if (os_variant_allows_internal_security_policies("com.apple.nearbyd") && v11 | v13 | v15)
  {
    v16 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#obsrvr, Internal tool permitted to be an obervation client.", v18, 2u);
    }
    return 1;
  }
  else if (!v3 | v5)
  {
    return v3;
  }
  else
  {
    return v7 | v9;
  }
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  NSString *sessionIdentifier;
  void *v6;
  NIServerClient *remote;
  int v8;
  void *v9;
  __int16 v10;
  NSString *v11;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerObservationSession signingIdentity](self, "signingIdentity"));
    sessionIdentifier = self->_sessionIdentifier;
    v8 = 138478083;
    v9 = v4;
    v10 = 2113;
    v11 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#obsrvr, Invalidate: %{private}@ [%{private}@]", (uint8_t *)&v8, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerHomeDeviceService sharedInstance](NIServerHomeDeviceService, "sharedInstance"));
  objc_msgSend(v6, "removeServiceClientWithIdentifier:", self->_sessionIdentifier);

  atomic_store(0, (unsigned __int8 *)&self->_shouldDeliverUpdates);
  remote = self->_remote;
  self->_remote = 0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerHomeDeviceService sharedInstance](NIServerHomeDeviceService, "sharedInstance"));
  objc_msgSend(v3, "removeServiceClientWithIdentifier:", self->_sessionIdentifier);

  v4.receiver = self;
  v4.super_class = (Class)NIServerObservationSession;
  -[NIServerObservationSession dealloc](&v4, "dealloc");
}

- (int)pid
{
  NIServerClientInfo *value;

  value = self->_clientInfo.__ptr_.__value_;
  if (value)
    return value->var1;
  else
    return 0;
}

- (id)signingIdentity
{
  NIServerClientInfo *value;

  value = self->_clientInfo.__ptr_.__value_;
  if (value)
    return value->var0;
  else
    return CFSTR("(null)");
}

- (void)activate:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  void *v6;
  NSString *sessionIdentifier;
  int v8;
  void *v9;
  __int16 v10;
  NSString *v11;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerObservationSession signingIdentity](self, "signingIdentity"));
    sessionIdentifier = self->_sessionIdentifier;
    v8 = 138478083;
    v9 = v6;
    v10 = 2113;
    v11 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#obsrvr, Activate: %{private}@ [%{private}@]", (uint8_t *)&v8, 0x16u);

  }
  v4[2](v4, &__NSDictionary0__struct, 0);
  atomic_store(1u, (unsigned __int8 *)&self->_activated);

}

- (void)runWithConfiguration:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  NSString *sessionIdentifier;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  id v15;
  void *v16;
  void *v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerObservationSession signingIdentity](self, "signingIdentity"));
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138478339;
    v21 = v9;
    v22 = 2113;
    v23 = sessionIdentifier;
    v24 = 2113;
    v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#obsrvr, Run: %{private}@ [%{private}@]. Config: %{private}@", buf, 0x20u);

  }
  v12 = objc_opt_class(NIHomeDeviceConfiguration, v11);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerHomeDeviceService sharedInstance](NIServerHomeDeviceService, "sharedInstance"));
    v14 = self->_sessionIdentifier;
    v15 = objc_msgSend(v6, "copy");
    objc_msgSend(v13, "addServiceClient:identifier:configuration:", self, v14, v15);

    atomic_store(1u, (unsigned __int8 *)&self->_shouldDeliverUpdates);
    atomic_store(1u, (unsigned __int8 *)&self->_runOnce);
    v7[2](v7, 0);
  }
  else
  {
    v18 = NSLocalizedDescriptionKey;
    v19 = CFSTR("This NIConfiguration subclass does not support observation.");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v16));

    ((void (**)(id, void *))v7)[2](v7, v17);
  }

}

- (void)pause:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  NSString *sessionIdentifier;
  int v8;
  void *v9;
  __int16 v10;
  NSString *v11;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerObservationSession signingIdentity](self, "signingIdentity"));
    sessionIdentifier = self->_sessionIdentifier;
    v8 = 138478083;
    v9 = v6;
    v10 = 2113;
    v11 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#obsrvr, Pause: %{private}@ [%{private}@]", (uint8_t *)&v8, 0x16u);

  }
  atomic_store(0, (unsigned __int8 *)&self->_shouldDeliverUpdates);
  v4[2](v4, 0);

}

- (void)_provideTruthTag:(id)a3
{
  sub_100056060(a3);
}

- (void)didDiscoverNearbyObject:(id)a3
{
  unsigned __int8 v4;
  id v5;

  v5 = a3;
  v4 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v4 & 1) != 0)
    -[NIServerClient didDiscoverNearbyObject:](self->_remote, "didDiscoverNearbyObject:", v5);

}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  unsigned __int8 v6;
  id v7;

  v7 = a3;
  v6 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v6 & 1) != 0)
    -[NIServerClient didRemoveNearbyObjects:withReason:](self->_remote, "didRemoveNearbyObjects:withReason:", v7, a4);

}

- (void)didUpdateNearbyObjects:(id)a3
{
  unsigned __int8 v4;
  id v5;

  v5 = a3;
  v4 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v4 & 1) != 0)
    -[NIServerClient didUpdateNearbyObjects:](self->_remote, "didUpdateNearbyObjects:", v5);

}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v10 & 1) != 0)
    -[NIServerClient object:didUpdateRegion:previousRegion:](self->_remote, "object:didUpdateRegion:previousRegion:", v11, v8, v9);

}

- (void)didUpdateMotionState:(int64_t)a3
{
  unsigned __int8 v3;

  v3 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v3 & 1) != 0)
    -[NIServerClient didUpdateMotionState:](self->_remote, "didUpdateMotionState:", a3);
}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  unsigned __int8 v4;
  unsigned __int8 v5;

  v4 = atomic_load((unsigned __int8 *)&self->_activated);
  if ((v4 & 1) != 0)
  {
    v5 = atomic_load((unsigned __int8 *)&self->_runOnce);
    if ((v5 & 1) != 0)
      -[NIServerClient uwbSessionInterruptedWithReason:timestamp:](self->_remote, "uwbSessionInterruptedWithReason:timestamp:", a3, a4);
  }
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  unsigned __int8 v4;
  unsigned __int8 v5;

  v4 = atomic_load((unsigned __int8 *)&self->_activated);
  if ((v4 & 1) != 0)
  {
    v5 = atomic_load((unsigned __int8 *)&self->_runOnce);
    if ((v5 & 1) != 0)
      -[NIServerClient uwbSessionInterruptionReasonEnded:timestamp:](self->_remote, "uwbSessionInterruptionReasonEnded:timestamp:", a3, a4);
  }
}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v6;
  unsigned __int8 v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v7 & 1) != 0)
    -[NIServerClient didUpdateAlgorithmState:forObject:](self->_remote, "didUpdateAlgorithmState:forObject:", v8, v6);

}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  unsigned __int8 v3;

  v3 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v3 & 1) != 0)
    -[NIServerClient didUpdateHomeDeviceUWBRangingAvailability:](self->_remote, "didUpdateHomeDeviceUWBRangingAvailability:", a3);
}

- (NSString)sessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  sub_1001AA1A8((id **)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_remote, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
