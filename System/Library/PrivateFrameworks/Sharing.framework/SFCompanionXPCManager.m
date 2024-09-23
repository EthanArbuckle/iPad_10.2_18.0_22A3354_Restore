@implementation SFCompanionXPCManager

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_16);
}

void __35__SFCompanionXPCManager_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  uint64_t v40;
  _QWORD v41[7];

  v41[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBA48);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sXPCManagerInterface;
  sXPCManagerInterface = v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6BC4D0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sServiceManagerClientInterface;
  sServiceManagerClientInterface = v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBAA8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)sServiceManagerInterface;
  sServiceManagerInterface = v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B6020);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)sUnlockClientInterface;
  sUnlockClientInterface = v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBB08);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)sUnlockInterface;
  sUnlockInterface = v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6BD980);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)sAutheticationStateChangeObserverInterface;
  sAutheticationStateChangeObserverInterface = v10;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B7810);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)sHotspotClientInterface;
  sHotspotClientInterface = v12;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBB68);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)sHotspotInterface;
  sHotspotInterface = v14;

  objc_msgSend((id)sXPCManagerInterface, "setInterface:forSelector:argumentIndex:ofReply:", sServiceManagerClientInterface, sel_createCompanionServiceManagerWithIdentifier_clientProxy_reply_, 1, 0);
  objc_msgSend((id)sXPCManagerInterface, "setInterface:forSelector:argumentIndex:ofReply:", sServiceManagerInterface, sel_createCompanionServiceManagerWithIdentifier_clientProxy_reply_, 0, 1);
  objc_msgSend((id)sXPCManagerInterface, "setInterface:forSelector:argumentIndex:ofReply:", sUnlockInterface, sel_createUnlockManagerWithReply_, 0, 1);
  objc_msgSend((id)sXPCManagerInterface, "setInterface:forSelector:argumentIndex:ofReply:", sHotspotClientInterface, sel_createHotspotSessionForClientProxy_reply_, 0, 0);
  objc_msgSend((id)sXPCManagerInterface, "setInterface:forSelector:argumentIndex:ofReply:", sHotspotInterface, sel_createHotspotSessionForClientProxy_reply_, 0, 1);
  v16 = (void *)sXPCManagerInterface;
  v17 = (void *)MEMORY[0x1E0C99E60];
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  v41[2] = objc_opt_class();
  v41[3] = objc_opt_class();
  v41[4] = objc_opt_class();
  v41[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_createStreamsForMessage_reply_, 0, 0);

  objc_msgSend((id)sXPCManagerInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_createStreamsForMessage_reply_, 0, 1);
  objc_msgSend((id)sServiceManagerInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_enableService_, 0, 0);
  objc_msgSend((id)sServiceManagerInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_disableService_, 0, 0);
  objc_msgSend((id)sServiceManagerClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_streamToService_withFileHandle_acceptReply_, 0, 0);
  objc_msgSend((id)sServiceManagerClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_streamToService_withFileHandle_acceptReply_, 1, 0);
  v20 = (void *)sHotspotInterface;
  v21 = (void *)MEMORY[0x1E0C99E60];
  v40 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_enableHotspotForDevice_withCompletionHandler_, 0, 0);

  v24 = (void *)sHotspotClientInterface;
  v25 = (void *)MEMORY[0x1E0C99E60];
  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_updatedFoundDeviceList_, 0, 0);

  v28 = (void *)MEMORY[0x1E0C99E60];
  v33 = objc_opt_class();
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29, v33, v34, v35, v36, v37);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_unlockStateForDevice_completionHandler_, 0, 1);
  v31 = (void *)sUnlockInterface;
  objc_msgSend(v30, "setByAddingObject:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_eligibleAutoUnlockDevicesWithCompletionHandler_, 0, 1);

  objc_msgSend((id)sUnlockInterface, "setInterface:forSelector:argumentIndex:ofReply:", sUnlockClientInterface, sel_enableAutoUnlockWithDevice_passcode_clientProxy_, 2, 0);
  objc_msgSend((id)sUnlockInterface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_enableAutoUnlockWithDevice_passcode_clientProxy_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_cancelEnablingAutoUnlockForDevice_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_disableAutoUnlockForDevice_completionHandler_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_listEligibleDevicesForAuthenticationType_completionHandler_, 0, 1);
  objc_msgSend((id)sUnlockInterface, "setInterface:forSelector:argumentIndex:ofReply:", sUnlockClientInterface, sel_attemptAutoUnlockWithClientProxy_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setInterface:forSelector:argumentIndex:ofReply:", sUnlockClientInterface, sel_attemptAutoUnlockWithoutNotifyingWatchWithClientProxy_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setInterface:forSelector:argumentIndex:ofReply:", sUnlockClientInterface, sel_attemptAutoUnlockForSiriWithClientProxy_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setInterface:forSelector:argumentIndex:ofReply:", sUnlockClientInterface, sel_enableUsingClientProxy_authenticationType_device_passcode_sessionID_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_enableUsingClientProxy_authenticationType_device_passcode_sessionID_, 2, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_enableUsingClientProxy_authenticationType_device_passcode_sessionID_, 3, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_enableUsingClientProxy_authenticationType_device_passcode_sessionID_, 4, 0);
  objc_msgSend((id)sUnlockInterface, "setInterface:forSelector:argumentIndex:ofReply:", sUnlockClientInterface, sel_requestEnablementUsingClientProxy_authenticationType_device_sessionID_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_requestEnablementUsingClientProxy_authenticationType_device_sessionID_, 2, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_requestEnablementUsingClientProxy_authenticationType_device_sessionID_, 3, 0);
  objc_msgSend((id)sUnlockInterface, "setInterface:forSelector:argumentIndex:ofReply:", sUnlockClientInterface, sel_disableUsingClientProxy_authenticationType_device_sessionID_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_disableUsingClientProxy_authenticationType_device_sessionID_, 2, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_disableUsingClientProxy_authenticationType_device_sessionID_, 3, 0);
  objc_msgSend((id)sUnlockInterface, "setInterface:forSelector:argumentIndex:ofReply:", sUnlockClientInterface, sel_authenticateUsingClientProxy_type_sessionID_options_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateUsingClientProxy_type_sessionID_options_, 2, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateUsingClientProxy_type_sessionID_options_, 3, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_cancelAuthenticationSessionWithID_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setInterface:forSelector:argumentIndex:ofReply:", sUnlockClientInterface, sel_registerForApprovalRequestsUsingClientProxy_forType_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_reportUserApprovalWithACMToken_error_sessionID_, 0, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_reportUserApprovalWithACMToken_error_sessionID_, 1, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_reportUserApprovalWithACMToken_error_sessionID_, 2, 0);
  objc_msgSend((id)sUnlockInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authPromptInfoWithCompletionHandler_, 0, 1);
  objc_msgSend((id)sUnlockInterface, "setInterface:forSelector:argumentIndex:ofReply:", sAutheticationStateChangeObserverInterface, sel_startObservingAuthentationStateChangesWithObserver_forIdentifier_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_beganAttemptWithDevice_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_completedUnlockWithDevice_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_keyDeviceLocked_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_enabledDevice_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_failedToEnableDevice_error_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_enabledAuthenticationSessionWithID_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_failedToEnableDeviceForSessionID_error_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_failedToEnableDeviceForSessionID_error_, 1, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_startedAuthenticationSessionWithID_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_completedAuthenticationSessionWithID_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_failedAuthenticationSessionWithID_error_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_failedAuthenticationSessionWithID_error_, 1, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_receivedApproveRequestForSessionID_info_, 0, 0);
  objc_msgSend((id)sUnlockClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_receivedApproveRequestForSessionID_info_, 1, 0);

}

+ (id)xpcManagerInterface
{
  return (id)sXPCManagerInterface;
}

+ (id)serviceManagerClientInterface
{
  return (id)sServiceManagerClientInterface;
}

+ (id)serviceManagerInterface
{
  return (id)sServiceManagerInterface;
}

+ (id)unlockInterface
{
  return (id)sUnlockInterface;
}

+ (id)hotspotClientInterface
{
  return (id)sHotspotClientInterface;
}

+ (id)hotspotInterface
{
  return (id)sHotspotInterface;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_295);
  return (id)sharedManager_manager_0;
}

void __38__SFCompanionXPCManager_sharedManager__block_invoke()
{
  SFCompanionXPCManager *v0;
  void *v1;

  v0 = objc_alloc_init(SFCompanionXPCManager);
  v1 = (void *)sharedManager_manager_0;
  sharedManager_manager_0 = (uint64_t)v0;

}

- (SFCompanionXPCManager)init
{
  SFCompanionXPCManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *xpcSetupQueue;
  NSXPCConnection *connection;
  NSMutableArray *v6;
  NSMutableArray *observers;
  _QWORD handler[4];
  SFCompanionXPCManager *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFCompanionXPCManager;
  v2 = -[SFCompanionXPCManager init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.sharing.xpc", 0);
    xpcSetupQueue = v2->_xpcSetupQueue;
    v2->_xpcSetupQueue = (OS_dispatch_queue *)v3;

    *(_WORD *)&v2->_invalid = 0;
    connection = v2->_connection;
    v2->_connection = 0;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v2->_observers;
    v2->_observers = v6;

    -[SFCompanionXPCManager setupConnection](v2, "setupConnection");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __29__SFCompanionXPCManager_init__block_invoke;
    handler[3] = &unk_1E482FB48;
    v10 = v2;
    notify_register_dispatch("com.apple.sharingd.daemon.started", &v2->_listenerResumedToken, MEMORY[0x1E0C80D38], handler);

  }
  return v2;
}

uint64_t __29__SFCompanionXPCManager_init__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (!*(_QWORD *)(*(_QWORD *)(result + 32) + 16))
  {
    v1 = result;
    streams_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "Reconnecting to sharingd", v3, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 32), "setupConnection");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFCompanionXPCManager;
  -[SFCompanionXPCManager dealloc](&v3, sel_dealloc);
}

- (void)setupConnection
{
  NSObject *xpcSetupQueue;
  _QWORD block[5];

  xpcSetupQueue = self->_xpcSetupQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SFCompanionXPCManager_setupConnection__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_sync(xpcSetupQueue, block);
}

uint64_t __40__SFCompanionXPCManager_setupConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onQueue_setupConnection");
}

- (void)onQueue_setupConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  SFCompanionXPCManager *v5;
  uint64_t v6;
  SFCompanionXPCManager *v7;
  NSXPCConnection *v8;
  SFCompanionXPCManager *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  SFCompanionXPCManager *v14;
  _QWORD v15[4];
  SFCompanionXPCManager *v16;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.sharingd.nsxpc"), 0);
  connection = self->_connection;
  self->_connection = v3;

  -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_xpcSetupQueue);
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", sXPCManagerInterface);
  v5 = self;
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__SFCompanionXPCManager_onQueue_setupConnection__block_invoke;
  v15[3] = &unk_1E482DF78;
  v7 = v5;
  v16 = v7;
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v15);
  v10 = v6;
  v11 = 3221225472;
  v12 = __48__SFCompanionXPCManager_onQueue_setupConnection__block_invoke_308;
  v13 = &unk_1E482DF78;
  v14 = v7;
  v8 = self->_connection;
  v9 = v7;
  -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", &v10);
  -[NSXPCConnection resume](self->_connection, "resume", v10, v11, v12, v13);
  -[SFCompanionXPCManager setInvalid:](v9, "setInvalid:", 0);
  -[SFCompanionXPCManager notifyOfResume](v9, "notifyOfResume");

}

uint64_t __48__SFCompanionXPCManager_onQueue_setupConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v6[16];

  streams_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "XPC Manager Connection Interrupted", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setInterrupted:", 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  objc_msgSend(*(id *)(a1 + 32), "onQueue_setupConnection");
  return objc_msgSend(*(id *)(a1 + 32), "notifyOfInterruption");
}

uint64_t __48__SFCompanionXPCManager_onQueue_setupConnection__block_invoke_308(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  uint8_t v8[16];

  streams_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "XPC Manager Connection Invalidated", v8, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  v5 = objc_msgSend(*(id *)(a1 + 32), "interrupted");
  v6 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
    return objc_msgSend(v6, "setInterrupted:", 0);
  objc_msgSend(v6, "setInvalid:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "notifyOfInvalidation");
}

- (void)notifyOfInterruption
{
  SFCompanionXPCManager *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_observers, "copy");
  objc_sync_exit(v2);

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "xpcManagerConnectionInterrupted", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)notifyOfResume
{
  SFCompanionXPCManager *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_observers, "copy");
  objc_sync_exit(v2);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "xpcManagerDidResumeConnection:", v2, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)notifyOfInvalidation
{
  SFCompanionXPCManager *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_observers, "copy");
  objc_sync_exit(v2);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "xpcManagerDidInvalidate:", v2, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)registerObserver:(id)a3
{
  SFCompanionXPCManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((-[NSMutableArray containsObject:](v4->_observers, "containsObject:", v5) & 1) == 0)
    -[NSMutableArray addObject:](v4->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)unregisterObserver:(id)a3
{
  SFCompanionXPCManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)serviceManagerProxyForIdentifier:(id)a3 client:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSXPCConnection *connection;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_connection)
  {
    v11 = _os_activity_create(&dword_1A2830000, "Sharing/SFCompanionXPC/createCompanionServiceManagerWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    connection = self->_connection;
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E482E490;
    v14 = v10;
    v19 = v14;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke_314;
    v16[3] = &unk_1E482FB70;
    v17 = v14;
    objc_msgSend(v15, "createCompanionServiceManagerWithIdentifier:clientProxy:reply:", v8, v9, v16);

    os_activity_scope_leave(&state);
  }

}

void __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char *v4;

  v3 = a2;
  streams_log();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke_314(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)streamsForMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  os_activity_scope_state_s state;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_connection)
  {
    v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFCompanionXPC/createStreamsForMessage", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    connection = self->_connection;
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E482E490;
    v11 = v7;
    v18 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_316;
    v15[3] = &unk_1E482FB98;
    v16 = v11;
    objc_msgSend(v12, "createStreamsForMessage:reply:", v6, v15);

    os_activity_scope_leave(&state);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("XPC Connection Down");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 64, v14);
    v8 = objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, NSObject *))v7 + 2))(v7, 0, v8);
  }

}

void __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char *v4;

  v3 = a2;
  streams_log();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_316(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unlockManagerWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSXPCConnection *connection;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  os_activity_scope_state_s buf;

  v4 = a3;
  if (-[SFCompanionXPCManager isInvalid](self, "isInvalid"))
  {
    auto_unlock_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.opaque[0]) = 0;
      _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Re-establishing connection", (uint8_t *)&buf, 2u);
    }

    -[SFCompanionXPCManager setupConnection](self, "setupConnection");
  }
  if (self->_connection)
  {
    v6 = _os_activity_create(&dword_1A2830000, "Sharing/SFCompanionXPC/createUnlockManagerWithReply", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    buf.opaque[0] = 0;
    buf.opaque[1] = 0;
    os_activity_scope_enter(v6, &buf);
    connection = self->_connection;
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__SFCompanionXPCManager_unlockManagerWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E482E490;
    v9 = v4;
    v14 = v9;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __60__SFCompanionXPCManager_unlockManagerWithCompletionHandler___block_invoke_320;
    v11[3] = &unk_1E482FBC0;
    v12 = v9;
    objc_msgSend(v10, "createUnlockManagerWithReply:", v11);

    os_activity_scope_leave(&buf);
  }

}

void __60__SFCompanionXPCManager_unlockManagerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char *v4;

  v3 = a2;
  auto_unlock_log();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__SFCompanionXPCManager_unlockManagerWithCompletionHandler___block_invoke_320(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remoteHotspotSessionForClient:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  if (self->_connection)
  {
    v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFCompanionXPC/createHotspotSessionForClientProxy", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    connection = self->_connection;
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__SFCompanionXPCManager_remoteHotspotSessionForClient_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E482E490;
    v11 = v7;
    v16 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __77__SFCompanionXPCManager_remoteHotspotSessionForClient_withCompletionHandler___block_invoke_322;
    v13[3] = &unk_1E482FBE8;
    v14 = v11;
    objc_msgSend(v12, "createHotspotSessionForClientProxy:reply:", v6, v13);

    os_activity_scope_leave(&state);
  }

}

void __77__SFCompanionXPCManager_remoteHotspotSessionForClient_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char *v4;

  v3 = a2;
  tethering_log();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__SFCompanionXPCManager_remoteHotspotSessionForClient_withCompletionHandler___block_invoke_322(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  const char *v10;
  NSObject *v11;
  NSXPCConnection *connection;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  os_activity_scope_state_s state;
  uint64_t v25;
  _QWORD v26[2];

  v6 = a4;
  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (self->_connection)
  {
    if (!v6)
    {
      v10 = "Sharing/SFRemoteHotspotSession/removeLowLatencyFilter";
LABEL_7:
      v11 = _os_activity_create(&dword_1A2830000, v10, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v11, &state);
      os_activity_scope_leave(&state);

      connection = self->_connection;
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __71__SFCompanionXPCManager_updateLowLatencyFilter_isAddFilter_completion___block_invoke;
      v22 = &unk_1E482E490;
      v13 = v9;
      v23 = v13;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateLowLatencyFilter:isAddFilter:completion:", v8, v6, v13, v19, v20, v21, v22);

      v15 = v23;
LABEL_9:

      goto LABEL_10;
    }
LABEL_6:
    v10 = "Sharing/SFRemoteHotspotSession/addLowLatencyFilter";
    goto LABEL_7;
  }
  if (!v6)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2FE0];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("XPC Connection Down");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 64, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v9 + 2))(v9, v15);
    goto LABEL_9;
  }
  -[SFCompanionXPCManager setupConnection](self, "setupConnection");
  if (self->_connection)
    goto LABEL_6;
LABEL_10:

}

void __71__SFCompanionXPCManager_updateLowLatencyFilter_isAddFilter_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  tethering_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__SFCompanionXPCManager_updateLowLatencyFilter_isAddFilter_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)appleAccountSignedIn
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v5;

  if (self->_connection || (-[SFCompanionXPCManager setupConnection](self, "setupConnection"), self->_connection))
  {
    v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFCompanionXPC/appleAccountSignedIn", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    os_activity_scope_enter(v3, &v5);
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_324);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleAccountSignedIn");

    os_activity_scope_leave(&v5);
  }
}

void __45__SFCompanionXPCManager_appleAccountSignedIn__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char *v3;

  v2 = a2;
  daemon_log();
  v3 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    __45__SFCompanionXPCManager_appleAccountSignedIn__block_invoke_cold_1(v2, v3);

}

- (void)appleAccountSignedOut
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v5;

  if (self->_connection || (-[SFCompanionXPCManager setupConnection](self, "setupConnection"), self->_connection))
  {
    v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFCompanionXPC/appleAccountSignedOut", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    os_activity_scope_enter(v3, &v5);
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_325);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleAccountSignedOut");

    os_activity_scope_leave(&v5);
  }
}

void __46__SFCompanionXPCManager_appleAccountSignedOut__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char *v3;

  v2 = a2;
  daemon_log();
  v3 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    __46__SFCompanionXPCManager_appleAccountSignedOut__block_invoke_cold_1(v2, v3);

}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (OS_dispatch_queue)xpcSetupQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXpcSetupQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int)listenerResumedToken
{
  return self->_listenerResumedToken;
}

- (void)setListenerResumedToken:(int)a3
{
  self->_listenerResumedToken = a3;
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (NSMutableArray)observers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_xpcSetupQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (void *)OUTLINED_FUNCTION_2_0(a1, a2);
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_1A2830000, v4, v5, "Service Manager: Error occured on XPC Manager when getting remote object %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_0();
}

void __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (void *)OUTLINED_FUNCTION_2_0(a1, a2);
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_1A2830000, v4, v5, "Error occured on XPC Manager when getting remote object %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_0();
}

void __71__SFCompanionXPCManager_updateLowLatencyFilter_isAddFilter_completion___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1A2830000, v0, OS_LOG_TYPE_ERROR, "Error occured on XPC Manager when getting remote object %@", v1, 0xCu);
}

void __45__SFCompanionXPCManager_appleAccountSignedIn__block_invoke_cold_1(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (void *)OUTLINED_FUNCTION_2_0(a1, a2);
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_1A2830000, v4, v5, "appleAccountSignedIn: Error occured on XPC Manager when getting remote object %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_0();
}

void __46__SFCompanionXPCManager_appleAccountSignedOut__block_invoke_cold_1(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (void *)OUTLINED_FUNCTION_2_0(a1, a2);
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_1A2830000, v4, v5, "appleAccountSignedOut: Error occured on XPC Manager when getting remote object %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_0();
}

@end
