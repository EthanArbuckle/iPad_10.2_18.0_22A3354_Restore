@implementation DMDServer

- (DMDServer)init
{
  DMDServer *v2;
  DMDActivationPredicateObserverManager *v3;
  DMDPolicyPersistence *v4;
  DMDTaskServerDelegate *v5;
  DMDTaskServerDelegate *taskServerDelegate;
  CATTaskServer *v7;
  DMDTaskServerListenerDelegate *v8;
  DMDTaskServerListenerDelegate *taskServerListenerDelegate;
  id v10;
  NSXPCListener *v11;
  NSXPCListener *taskOperationServiceListener;
  NSXPCListener *v13;
  uint64_t v14;
  void *v15;
  DMDPolicyServerListenerDelegate *v16;
  DMDPolicyServerListenerDelegate *policyServerListenerDelegate;
  id v18;
  NSXPCListener *v19;
  NSXPCListener *policyServerListener;
  DMDEmergencyModeListenerDelegate *v21;
  DMDEmergencyModeListenerDelegate *emergencyModeListenerDelegate;
  id v23;
  NSXPCListener *v24;
  NSXPCListener *emergencyModeListener;
  DMDEventStreamDispatcher *v26;
  void *v27;
  DMDEventStreamDispatcher *v28;
  DMDEventStreamDispatcher *eventStreamDispatcher;
  objc_super v31;
  _QWORD v32[2];

  v31.receiver = self;
  v31.super_class = (Class)DMDServer;
  v2 = -[DMDServer init](&v31, "init");
  if (v2)
  {
    +[NSFileManager dmd_createUserDMDDirectoryDataVault](NSFileManager, "dmd_createUserDMDDirectoryDataVault");
    v3 = objc_opt_new(DMDActivationPredicateObserverManager);
    v4 = objc_opt_new(DMDPolicyPersistence);
    v5 = (DMDTaskServerDelegate *)objc_msgSend(objc_alloc((Class)objc_opt_class(DMDiPhoneOSTaskServerDelegate)), "initWithPolicyPersistence:activationManager:", v4, v3);
    taskServerDelegate = v2->_taskServerDelegate;
    v2->_taskServerDelegate = v5;

    v7 = objc_opt_new(CATTaskServer);
    -[CATTaskServer setDelegate:](v7, "setDelegate:", v2->_taskServerDelegate);
    v8 = -[DMDTaskServerListenerDelegate initWithTaskServer:]([DMDTaskServerListenerDelegate alloc], "initWithTaskServer:", v7);
    taskServerListenerDelegate = v2->_taskServerListenerDelegate;
    v2->_taskServerListenerDelegate = v8;

    v10 = objc_alloc((Class)NSXPCListener);
    v11 = (NSXPCListener *)objc_msgSend(v10, "initWithMachServiceName:", DMFMachServiceName);
    taskOperationServiceListener = v2->_taskOperationServiceListener;
    v2->_taskOperationServiceListener = v11;

    v13 = v2->_taskOperationServiceListener;
    v14 = CATGetCatalystQueue();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[NSXPCListener _setQueue:](v13, "_setQueue:", v15);

    -[NSXPCListener setDelegate:](v2->_taskOperationServiceListener, "setDelegate:", v2->_taskServerListenerDelegate);
    v16 = -[DMDPolicyServerListenerDelegate initWithPolicyPersistence:]([DMDPolicyServerListenerDelegate alloc], "initWithPolicyPersistence:", v4);
    policyServerListenerDelegate = v2->_policyServerListenerDelegate;
    v2->_policyServerListenerDelegate = v16;

    v18 = objc_alloc((Class)NSXPCListener);
    v19 = (NSXPCListener *)objc_msgSend(v18, "initWithMachServiceName:", DMFPolicyMachServiceName);
    policyServerListener = v2->_policyServerListener;
    v2->_policyServerListener = v19;

    -[NSXPCListener setDelegate:](v2->_policyServerListener, "setDelegate:", v2->_policyServerListenerDelegate);
    v21 = -[DMDEmergencyModeListenerDelegate initWithPolicyPersistence:]([DMDEmergencyModeListenerDelegate alloc], "initWithPolicyPersistence:", v4);
    emergencyModeListenerDelegate = v2->_emergencyModeListenerDelegate;
    v2->_emergencyModeListenerDelegate = v21;

    v23 = objc_alloc((Class)NSXPCListener);
    v24 = (NSXPCListener *)objc_msgSend(v23, "initWithMachServiceName:", DMFEmergencyModeMachServiceName);
    emergencyModeListener = v2->_emergencyModeListener;
    v2->_emergencyModeListener = v24;

    -[NSXPCListener setDelegate:](v2->_emergencyModeListener, "setDelegate:", v2->_emergencyModeListenerDelegate);
    v26 = [DMDEventStreamDispatcher alloc];
    v32[0] = v3;
    v32[1] = v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
    v28 = -[DMDEventStreamDispatcher initWithListeners:](v26, "initWithListeners:", v27);
    eventStreamDispatcher = v2->_eventStreamDispatcher;
    v2->_eventStreamDispatcher = v28;

  }
  return v2;
}

+ (DMDServer)sharedServer
{
  if (qword_1000EBA80 != -1)
    dispatch_once(&qword_1000EBA80, &stru_1000BBCB8);
  return (DMDServer *)(id)qword_1000EBA78;
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running Server", v7, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer taskServerDelegate](self, "taskServerDelegate"));
  objc_msgSend(v3, "run");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer taskOperationServiceListener](self, "taskOperationServiceListener"));
  objc_msgSend(v4, "resume");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer policyServerListener](self, "policyServerListener"));
  objc_msgSend(v5, "resume");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer emergencyModeListener](self, "emergencyModeListener"));
  objc_msgSend(v6, "resume");

}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer taskServer](self, "taskServer"));
  objc_msgSend(v3, "invalidate");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer taskOperationServiceListener](self, "taskOperationServiceListener"));
  objc_msgSend(v4, "invalidate");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer policyServerListener](self, "policyServerListener"));
  objc_msgSend(v5, "invalidate");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DMDServer emergencyModeListener](self, "emergencyModeListener"));
  objc_msgSend(v6, "invalidate");

}

- (DMDTaskServerDelegate)taskServerDelegate
{
  return self->_taskServerDelegate;
}

- (NSXPCListener)taskOperationServiceListener
{
  return self->_taskOperationServiceListener;
}

- (DMDTaskServerListenerDelegate)taskServerListenerDelegate
{
  return self->_taskServerListenerDelegate;
}

- (CATTaskServer)taskServer
{
  return self->_taskServer;
}

- (DMDPolicyServerListenerDelegate)policyServerListenerDelegate
{
  return self->_policyServerListenerDelegate;
}

- (NSXPCListener)policyServerListener
{
  return self->_policyServerListener;
}

- (DMDEmergencyModeListenerDelegate)emergencyModeListenerDelegate
{
  return self->_emergencyModeListenerDelegate;
}

- (NSXPCListener)emergencyModeListener
{
  return self->_emergencyModeListener;
}

- (DMDEventStreamDispatcher)eventStreamDispatcher
{
  return self->_eventStreamDispatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStreamDispatcher, 0);
  objc_storeStrong((id *)&self->_emergencyModeListener, 0);
  objc_storeStrong((id *)&self->_emergencyModeListenerDelegate, 0);
  objc_storeStrong((id *)&self->_policyServerListener, 0);
  objc_storeStrong((id *)&self->_policyServerListenerDelegate, 0);
  objc_storeStrong((id *)&self->_taskServer, 0);
  objc_storeStrong((id *)&self->_taskServerListenerDelegate, 0);
  objc_storeStrong((id *)&self->_taskOperationServiceListener, 0);
  objc_storeStrong((id *)&self->_taskServerDelegate, 0);
}

@end
