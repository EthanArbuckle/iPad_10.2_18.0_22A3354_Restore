@implementation STKSIMToolkitAlertSessionManager

id __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke_3(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
    return (id)objc_msgSend(result, "sendSIMToolkitDisplayReady:", 0);
  return result;
}

void __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  _QWORD block[4];
  _QWORD *v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[4];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke_3;
  block[3] = &unk_24D563080;
  v4 = v1;
  dispatch_async(v2, block);

}

- (STKSIMToolkitAlertSessionManager)initWithSubscriptionMonitor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  STKSIMToolkitAlertSessionManager *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  STKIncomingCallUIStateMonitor *incomingCallUIStateMonitor;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UNUserNotificationCenter *userNotificationCenter;
  uint64_t v18;
  STKDeviceLockMonitor *deviceLockMonitor;
  OS_dispatch_group *notificationGroup;
  uint64_t v21;
  CoreTelephonyClient *telephonyClient;
  NSObject *v23;
  uint64_t v24;
  STKSIMToolkitAlertSessionManager *v25;
  int *p_atHomeScreenNotifyToken;
  NSObject *v27;
  STKSIMToolkitAlertSessionManager *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  STKSIMToolkitAlertSessionManager *v34;
  _QWORD block[4];
  STKSIMToolkitAlertSessionManager *v36;
  objc_super v37;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  STKSIMToolkitLog();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37.receiver = self;
  v37.super_class = (Class)STKSIMToolkitAlertSessionManager;
  v8 = -[STKAlertSessionManager initWithEventQueue:logger:](&v37, sel_initWithEventQueue_logger_, v6, v7);

  if (v8)
  {
    v9 = BSDispatchQueueCreateWithQualityOfService();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v8->_subscriptionMonitor, a3);
    +[STKIncomingCallUIStateMonitor sharedInstance](STKIncomingCallUIStateMonitor, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    incomingCallUIStateMonitor = v8->_incomingCallUIStateMonitor;
    v8->_incomingCallUIStateMonitor = (STKIncomingCallUIStateMonitor *)v11;

    -[STKIncomingCallUIStateMonitor addObserver:](v8->_incomingCallUIStateMonitor, "addObserver:", v8);
    v13 = (__CFString *)(id)*MEMORY[0x24BDC2E08];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "processName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "isEqual:", CFSTR("ctnotifytool")))
    {

      v13 = CFSTR("com.apple.ctnotifytool");
    }
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", v13);
    userNotificationCenter = v8->_userNotificationCenter;
    v8->_userNotificationCenter = (UNUserNotificationCenter *)v16;

    +[STKDeviceLockMonitor sharedInstance](STKDeviceLockMonitor, "sharedInstance");
    v18 = objc_claimAutoreleasedReturnValue();
    deviceLockMonitor = v8->_deviceLockMonitor;
    v8->_deviceLockMonitor = (STKDeviceLockMonitor *)v18;

    -[STKDeviceLockMonitor addObserver:](v8->_deviceLockMonitor, "addObserver:", v8);
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_lock_deviceLocked = 0;
    notificationGroup = v8->_notificationGroup;
    v8->_notificationGroup = 0;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v8->_queue);
    telephonyClient = v8->_telephonyClient;
    v8->_telephonyClient = (CoreTelephonyClient *)v21;

    v23 = v8->_queue;
    v24 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke;
    block[3] = &unk_24D563080;
    v25 = v8;
    v36 = v25;
    dispatch_sync(v23, block);
    p_atHomeScreenNotifyToken = &v25->_atHomeScreenNotifyToken;
    v27 = v8->_queue;
    v30 = v24;
    v31 = 3221225472;
    v32 = __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke_2;
    v33 = &unk_24D563460;
    v28 = v25;
    v34 = v28;
    notify_register_dispatch("com.apple.springboard.homescreenunlocked", p_atHomeScreenNotifyToken, v27, &v30);
    -[STKSIMToolkitAlertSessionManager incomingCallUIStateDidChange:](v28, "incomingCallUIStateDidChange:", -[STKIncomingCallUIStateMonitor isShowingIncomingCallUI](v8->_incomingCallUIStateMonitor, "isShowingIncomingCallUI", v30, v31, v32, v33));
    -[STKSIMToolkitAlertSessionManager deviceLockStateChanged:](v28, "deviceLockStateChanged:", -[STKDeviceLockMonitor isDeviceLocked](v8->_deviceLockMonitor, "isDeviceLocked"));

  }
  return v8;
}

void __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke(uint64_t a1)
{
  STKTelephonySelectionListItemsProvider *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_startListening");
  v2 = -[STKTelephonySelectionListItemsProvider initWithTelephonyClient:]([STKTelephonySelectionListItemsProvider alloc], "initWithTelephonyClient:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v2;

}

- (void)handleSIMToolkitEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__STKSIMToolkitAlertSessionManager_handleSIMToolkitEvent_responder_userInfo___block_invoke;
  v13[3] = &unk_24D5630F8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

uint64_t __77__STKSIMToolkitAlertSessionManager_handleSIMToolkitEvent_responder_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleSIMToolkitEvent:responder:userInfo:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_showNotification
{
  OUTLINED_FUNCTION_0(&dword_216439000, a2, a3, "Something wrong with localization; using default language: %@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

void __53__STKSIMToolkitAlertSessionManager__showNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __53__STKSIMToolkitAlertSessionManager__showNotification__block_invoke_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)_removeNotification
{
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[STKAlertSessionManager log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = CFSTR("SIMToolkit_Carrier");
    _os_log_impl(&dword_216439000, v3, OS_LOG_TYPE_DEFAULT, "Remove notifications with Identifier='%@'", buf, 0xCu);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("SIMToolkit_Carrier"), 0);
  -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](self->_userNotificationCenter, "removePendingNotificationRequestsWithIdentifiers:", v4);
  -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](self->_userNotificationCenter, "removeDeliveredNotificationsWithIdentifiers:", v4);

}

- (BOOL)_showAfterDeviceUnlock:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  OS_dispatch_group *v6;
  OS_dispatch_group *notificationGroup;
  NSObject *v8;
  dispatch_time_t v9;
  _BOOL4 v10;
  OS_dispatch_group *v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_deviceLocked)
  {
    -[STKSIMToolkitAlertSessionManager _showNotification](self, "_showNotification");
    v6 = (OS_dispatch_group *)dispatch_group_create();
    notificationGroup = self->_notificationGroup;
    self->_notificationGroup = v6;

    dispatch_group_enter((dispatch_group_t)self->_notificationGroup);
    os_unfair_lock_unlock(p_lock);
    v8 = self->_notificationGroup;
    v9 = dispatch_time(0, 1000000000 * a3);
    v10 = dispatch_group_wait(v8, v9) == 0;
    os_unfair_lock_lock(p_lock);
    v11 = self->_notificationGroup;
    self->_notificationGroup = 0;

    -[STKSIMToolkitAlertSessionManager _removeNotification](self, "_removeNotification");
  }
  else
  {
    v10 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  -[STKAlertSessionManager log](self, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = "Don't show";
    if (v10)
      v13 = "Show";
    v14 = "timeout waiting for device unlock";
    if (v10)
      v14 = "device unlocked in-time";
    v16 = 136315394;
    v17 = v13;
    v18 = 2080;
    v19 = v14;
    _os_log_impl(&dword_216439000, v12, OS_LOG_TYPE_DEFAULT, "%s STK alert; %s", (uint8_t *)&v16, 0x16u);
  }

  return v10;
}

- (id)remoteAlertDescriptorForSession:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  STKSIMToolkitAlertSession *currentSession;
  uint64_t v12;
  CoreTelephonyClient *telephonyClient;
  id v14;
  uint64_t v15;
  NSObject *v16;
  STKSIMToolkitAlertSession *v17;
  _STKRemoteAlertDescriptor *v18;
  uint64_t v19;
  CoreTelephonyClient *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  id v28;
  CoreTelephonyClient *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  STKYesNoSessionAction *v41;
  void *v42;
  void *v43;
  STKTextSessionData *v44;
  void *v45;
  STKMutableTextInputSessionData *v46;
  STKTextSessionAction *v47;
  const __CFString *v48;
  STKListItemsSessionData *v49;
  void *v50;
  uint64_t v51;
  __CFString *v52;
  const __CFString *v53;
  void *v54;
  const void *v55;
  uint64_t v56;
  STKMutableTextInputSessionData *v57;
  void *v58;
  void *v59;
  STKListItemsSessionData *v60;
  void *v61;
  void *v62;
  void *v63;
  STKYesNoSessionAction *v64;
  id *v65;
  void *v66;
  STKListItemsSessionData *v67;
  void *v68;
  STKListItemsSessionAction *v69;
  __CFString *v70;
  const __CFString *v71;
  STKMutableCallSetupSessionData *v72;
  void *v73;
  STKCallSetupSessionAction *v74;
  STKNotifySessionData *v75;
  void *v76;
  STKNotifySessionAction *v77;
  STKTextInputSessionAction *v79;
  STKTextInputSessionAction *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  _QWORD v91[4];
  STKListItemsSessionData *v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[4];
  id v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[4];
  STKListItemsSessionData *v104;
  id v105[2];
  id v106;
  uint8_t buf[4];
  const __CFString *v108;
  __int16 v109;
  uint64_t v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "event");
    objc_msgSend(v6, "valueForKey:", *MEMORY[0x24BDC2F10]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (int)objc_msgSend(v8, "intValue");

    -[STKAlertSessionManager log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      currentSession = self->_currentSession;
      *(_DWORD *)buf = 134218240;
      v108 = (const __CFString *)currentSession;
      v109 = 2048;
      v110 = v9;
      _os_log_impl(&dword_216439000, v10, OS_LOG_TYPE_DEFAULT, "Session <%p> - SlotID %ld", buf, 0x16u);
    }

    -[STKCarrierSubscriptionMonitor subscriptionContextForSlot:](self->_subscriptionMonitor, "subscriptionContextForSlot:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    v82 = v7;
    if (-[STKCarrierSubscriptionMonitor numAvailableSubscriptions](self->_subscriptionMonitor, "numAvailableSubscriptions") < 2)
    {
      v84 = 0;
      v88 = 0;
    }
    else
    {
      telephonyClient = self->_telephonyClient;
      v106 = 0;
      -[CoreTelephonyClient getSimLabel:error:](telephonyClient, "getSimLabel:error:", v12, &v106);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v106;
      if (v14)
      {
        v15 = (uint64_t)v14;
        v84 = v14;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[STKSIMToolkitAlertSessionManager remoteAlertDescriptorForSession:].cold.3(v9, v12, v15);
      }
      else
      {
        v84 = 0;
      }
    }
    objc_msgSend(v6, "bs_safeStringForKey:", *MEMORY[0x24BDC2F18]);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[STKSIMToolkitAlertSessionManager _newSessionBehaviorFromOptions:](self, "_newSessionBehaviorFromOptions:", v6);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
    v20 = self->_telephonyClient;
    v105[1] = 0;
    v87 = (void *)v19;
    v21 = -[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v20, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v12, CFSTR("AllowSTKAlertInLockScreen"));
    v22 = 0;
    v90 = (void *)v12;
    v86 = (void *)v21;
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[STKAlertSessionManager log](self, "log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v108 = CFSTR("AllowSTKAlertInLockScreen");
        v109 = 2112;
        v110 = (uint64_t)v86;
        _os_log_impl(&dword_216439000, v23, OS_LOG_TYPE_DEFAULT, "Carrier bundle: key=%@; value=%@", buf, 0x16u);
      }

      v24 = objc_msgSend(v86, "BOOLValue");
    }
    else
    {
      -[STKAlertSessionManager log](self, "log");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[STKSIMToolkitAlertSessionManager remoteAlertDescriptorForSession:].cold.2();

      v24 = 0;
    }
    -[STKAlertSessionManager log](self, "log");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = "Don't allow";
      if (v24)
        v27 = "Allow";
      *(_DWORD *)buf = 136315138;
      v108 = (const __CFString *)v27;
      _os_log_impl(&dword_216439000, v26, OS_LOG_TYPE_DEFAULT, "%s STK alerts when device is locked", buf, 0xCu);
    }

    if ((v24 & 1) != 0)
    {
      v28 = v22;
    }
    else
    {
      v29 = self->_telephonyClient;
      v105[0] = v22;
      v30 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v29, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v12, CFSTR("STKAlertLockScreenNotificationTimeoutSeconds"), v87, v105);
      v28 = v105[0];

      if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[STKAlertSessionManager log](self, "log");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v108 = CFSTR("STKAlertLockScreenNotificationTimeoutSeconds");
          v109 = 2112;
          v110 = (uint64_t)v30;
          _os_log_impl(&dword_216439000, v31, OS_LOG_TYPE_DEFAULT, "Carrier bundle: key=%@; value=%@", buf, 0x16u);
        }

        v32 = objc_msgSend(v30, "unsignedIntegerValue");
        if (v32)
          v33 = v32;
        else
          v33 = 29;
      }
      else
      {
        -[STKAlertSessionManager log](self, "log");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[STKSIMToolkitAlertSessionManager remoteAlertDescriptorForSession:].cold.1();

        v33 = 29;
      }
      -[STKAlertSessionManager log](self, "log");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v108 = (const __CFString *)v33;
        _os_log_impl(&dword_216439000, v35, OS_LOG_TYPE_DEFAULT, "Show STK alerts notification with timeout = %ld secs", buf, 0xCu);
      }

      v36 = -[STKSIMToolkitAlertSessionManager _showAfterDeviceUnlock:](self, "_showAfterDeviceUnlock:", v33);
      if (!v36)
      {
        v37 = v5;
        objc_msgSend(v5, "sendResponse:", 2);
        v41 = 0;
        v18 = 0;
        v42 = v90;
        v43 = v84;
LABEL_76:

        goto LABEL_77;
      }
    }
    v37 = v5;
    v38 = v82;
    switch(v82)
    {
      case 1:
      case 2:
      case 3:
      case 4:
        goto LABEL_41;
      case 5:
        if (v89)
        {
          v85 = v28;
          v44 = [STKTextSessionData alloc];
          objc_msgSend(v88, "text");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = -[STKTextSessionData initWithText:simLabel:](v44, "initWithText:simLabel:", v89, v45);

          v47 = [STKTextSessionAction alloc];
          v103[0] = MEMORY[0x24BDAC760];
          v103[1] = 3221225472;
          v103[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke;
          v103[3] = &unk_24D5632F0;
          v104 = (STKListItemsSessionData *)v5;
          v41 = -[STKTextSessionAction initWithBehavior:inputData:response:](v47, "initWithBehavior:inputData:response:", v16, v46, v103);
          v48 = CFSTR("STKTextAlertViewController");
          v49 = v104;
          goto LABEL_72;
        }
        v89 = 0;
LABEL_79:
        v48 = 0;
        v41 = 0;
        v43 = v84;
        goto LABEL_75;
      case 6:
        v85 = v28;
        objc_msgSend(v5, "options", v90);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *MEMORY[0x24BDC2DC8];
        objc_msgSend(v50, "bs_safeStringForKey:", *MEMORY[0x24BDC2DC8]);
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v52)
          v53 = v52;
        else
          v53 = &stru_24D563A28;

        objc_msgSend(v6, "bs_safeStringForKey:", v51);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (const void *)*MEMORY[0x24BDC2DD8];
        v56 = objc_msgSend(v54, "isEqualToString:", *MEMORY[0x24BDC2DD8]);

        v57 = [STKMutableTextInputSessionData alloc];
        objc_msgSend(v88, "text");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[STKTextInputSessionData initWithText:simLabel:](v57, "initWithText:simLabel:", v89, v58);

        -[STKMutableTextInputSessionData setIsSecure:](v46, "setIsSecure:", objc_msgSend(v6, "bs_BOOLForKey:", *MEMORY[0x24BDC2DA8]));
        objc_msgSend(v6, "bs_safeStringForKey:", *MEMORY[0x24BDC2D98]);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[STKMutableTextInputSessionData setDefaultText:](v46, "setDefaultText:", v59);

        -[STKMutableTextInputSessionData setIsDigitsOnly:](v46, "setIsDigitsOnly:", v56);
        objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BDC2DB8]);
        v60 = (STKListItemsSessionData *)objc_claimAutoreleasedReturnValue();
        v49 = v60;
        if (v60)
          -[STKMutableTextInputSessionData setMinimumInputLength:](v46, "setMinimumInputLength:", -[STKListItemsSessionData unsignedIntegerValue](v60, "unsignedIntegerValue"));
        objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BDC2DB0]);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v61;
        if (v61)
          -[STKMutableTextInputSessionData setMaximumInputLength:](v46, "setMaximumInputLength:", objc_msgSend(v61, "unsignedIntegerValue"));
        objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BDC2DA0]);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v62;
        v83 = v63;
        if (v63 && (objc_msgSend(v63, "BOOLValue") & 1) == 0)
        {
          v79 = [STKTextInputSessionAction alloc];
          v101[0] = MEMORY[0x24BDAC760];
          v101[1] = 3221225472;
          v101[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_2;
          v101[3] = &unk_24D5634B0;
          v65 = &v102;
          v102 = v37;
          v41 = -[STKTextInputSessionAction initWithBehavior:inputData:response:](v79, "initWithBehavior:inputData:response:", v16, v46, v101);
          v48 = CFSTR("STKOneShotInputAlertViewController");
          goto LABEL_84;
        }
        if (CFEqual(v53, (CFTypeRef)*MEMORY[0x24BDC2DD0]))
        {
          v64 = [STKYesNoSessionAction alloc];
          v99[0] = MEMORY[0x24BDAC760];
          v99[1] = 3221225472;
          v99[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_3;
          v99[3] = &unk_24D5634D8;
          v65 = &v100;
          v100 = v37;
          v41 = -[STKYesNoSessionAction initWithBehavior:inputData:response:](v64, "initWithBehavior:inputData:response:", v16, v46, v99);
          v48 = CFSTR("STKYesNoInputAlertViewController");
LABEL_84:

          v43 = v84;
          v62 = v81;
          goto LABEL_85;
        }
        if (CFEqual(v53, (CFTypeRef)*MEMORY[0x24BDC2DE0]) || CFEqual(v53, v55))
        {
          v80 = [STKTextInputSessionAction alloc];
          v97[0] = MEMORY[0x24BDAC760];
          v97[1] = 3221225472;
          v97[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_4;
          v97[3] = &unk_24D5634B0;
          v65 = &v98;
          v98 = v37;
          v41 = -[STKTextInputSessionAction initWithBehavior:inputData:response:](v80, "initWithBehavior:inputData:response:", v16, v46, v97);
          v48 = CFSTR("STKStandardInputAlertViewController");
          goto LABEL_84;
        }
        v48 = 0;
        v41 = 0;
        v43 = v84;
LABEL_85:

        goto LABEL_73;
      case 7:
        v38 = 5;
LABEL_41:
        v39 = (uint64_t)v89;
        if (v89)
          goto LABEL_71;
        if (v38 == 2)
        {
          v40 = (_QWORD *)MEMORY[0x24BDC2EE8];
          goto LABEL_69;
        }
        if (v38 == 3)
        {
          v40 = (_QWORD *)MEMORY[0x24BDC2EF8];
LABEL_69:
          objc_msgSend(v6, "bs_safeStringForKey:", *v40);
          v39 = objc_claimAutoreleasedReturnValue();
          goto LABEL_71;
        }
        v39 = 0;
LABEL_71:
        v85 = v28;
        v75 = [STKNotifySessionData alloc];
        objc_msgSend(v88, "text");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = (void *)v39;
        v46 = -[STKNotifySessionData initWithText:simLabel:notifyType:](v75, "initWithText:simLabel:notifyType:", v39, v76, v38);

        v77 = [STKNotifySessionAction alloc];
        v91[0] = MEMORY[0x24BDAC760];
        v91[1] = 3221225472;
        v91[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_7;
        v91[3] = &unk_24D5632F0;
        v92 = v37;
        v41 = -[STKTextSessionAction initWithBehavior:inputData:response:](v77, "initWithBehavior:inputData:response:", v16, v46, v91);
        v48 = CFSTR("STKNotifyAlertViewController");
        v49 = v92;
LABEL_72:
        v43 = v84;
LABEL_73:

        v28 = v85;
LABEL_74:

LABEL_75:
        v18 = -[_STKRemoteAlertDescriptor initWithAction:viewControllerName:]([_STKRemoteAlertDescriptor alloc], "initWithAction:viewControllerName:", v41, v48);
        v42 = v90;
        break;
      case 8:
        -[STKTelephonyListItemsProvider selectionListItemsForContext:options:](self->_listItemsProvider, "selectionListItemsForContext:options:", v90, v6);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[STKSIMToolkitAlertSessionManager _listItemsFromCTItems:](self, "_listItemsFromCTItems:", v66);
        v46 = (STKMutableTextInputSessionData *)objc_claimAutoreleasedReturnValue();

        if (!-[STKMutableTextInputSessionData count](v46, "count"))
          goto LABEL_67;
        v85 = v28;
        v67 = [STKListItemsSessionData alloc];
        objc_msgSend(v88, "text");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[STKListItemsSessionData initWithText:simLabel:listItems:](v67, "initWithText:simLabel:listItems:", v89, v68, v46);

        v69 = [STKListItemsSessionAction alloc];
        v95[0] = MEMORY[0x24BDAC760];
        v95[1] = 3221225472;
        v95[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_5;
        v95[3] = &unk_24D5634D8;
        v96 = v5;
        v41 = -[STKListItemsSessionAction initWithBehavior:inputData:response:](v69, "initWithBehavior:inputData:response:", v16, v49, v95);

        v48 = CFSTR("STKListDisplayAlertViewController");
        goto LABEL_72;
      case 9:
        objc_msgSend(v6, "bs_safeObjectForKey:ofType:", *MEMORY[0x24BDC2D48], objc_opt_class());
        v46 = (STKMutableTextInputSessionData *)objc_claimAutoreleasedReturnValue();
        if (!v46)
        {
LABEL_67:
          v48 = 0;
          v41 = 0;
          v43 = v84;
          goto LABEL_74;
        }
        v85 = v28;
        objc_msgSend(v6, "bs_safeObjectForKey:ofType:", *MEMORY[0x24BDC2D50], objc_opt_class());
        v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v70)
          v71 = v70;
        else
          v71 = &stru_24D563A28;

        v72 = [STKMutableCallSetupSessionData alloc];
        objc_msgSend(v88, "text");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[STKCallSetupSessionData initWithText:simLabel:phoneNumber:](v72, "initWithText:simLabel:phoneNumber:", v89, v73, v46);

        -[STKListItemsSessionData setIsHighPriority:](v49, "setIsHighPriority:", CFEqual(v71, (CFTypeRef)*MEMORY[0x24BDC2D58]) != 0);
        v74 = [STKCallSetupSessionAction alloc];
        v93[0] = MEMORY[0x24BDAC760];
        v93[1] = 3221225472;
        v93[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_6;
        v93[3] = &unk_24D5632F0;
        v94 = v5;
        v41 = -[STKTextSessionAction initWithBehavior:inputData:response:](v74, "initWithBehavior:inputData:response:", v16, v49, v93);

        v48 = CFSTR("STKSetupCallAlertViewController");
        goto LABEL_72;
      default:
        goto LABEL_79;
    }
    goto LABEL_76;
  }
  -[STKAlertSessionManager log](self, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_currentSession;
    *(_DWORD *)buf = 134217984;
    v108 = (const __CFString *)v17;
    _os_log_impl(&dword_216439000, v16, OS_LOG_TYPE_DEFAULT, "Session <%p> - session isKindOfClass is NULL", buf, 0xCu);
  }
  v18 = 0;
LABEL_77:

  return v18;
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendResponse:", a2);
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "sendResponse:", a2);
  else
    return objc_msgSend(v3, "sendResponse:withStringResult:", 0, a3);
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
    return objc_msgSend(*(id *)(a1 + 32), "sendResponse:withBOOLResult:", a2, objc_msgSend(a3, "BOOLValue"));
  else
    return objc_msgSend(*(id *)(a1 + 32), "sendResponse:", a2);
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "sendResponse:", a2);
  else
    return objc_msgSend(v3, "sendResponse:withStringResult:", 0, a3);
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
    return objc_msgSend(*(id *)(a1 + 32), "sendSuccessWithSelectedIndex:", objc_msgSend(a3, "unsignedIntegerValue"));
  else
    return objc_msgSend(*(id *)(a1 + 32), "sendResponse:", a2);
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendResponse:", a2);
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendResponse:", a2);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__STKSIMToolkitAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_24D563120;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __67__STKSIMToolkitAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "alertHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
      v6 = 134217984;
      v7 = v5;
      _os_log_impl(&dword_216439000, v4, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleDeactivated", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentSession:", 0);
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "removeObserver:", self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__STKSIMToolkitAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke;
  block[3] = &unk_24D563500;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __77__STKSIMToolkitAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "alertHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 134218242;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_216439000, v4, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated with error: %{public}@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentSession:", 0);
  }
}

- (void)userEventDidOccur:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__STKSIMToolkitAlertSessionManager_userEventDidOccur___block_invoke;
  block[3] = &unk_24D563080;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__STKSIMToolkitAlertSessionManager_userEventDidOccur___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_216439000, v2, OS_LOG_TYPE_DEFAULT, "UserEventDidOccur", v9, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  if (v4)
  {
    objc_msgSend(v4, "sendResponse:", 7);
    v3 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v3 + 120), "invalidate");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 128);
  *(_QWORD *)(v7 + 128) = 0;

}

- (void)incomingCallUIStateDidChange:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *haltEventQueueProcessingAssertion;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (a3)
  {
    if (self->_haltEventQueueProcessingAssertion)
      return;
    -[STKAlertSessionManager log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216439000, v4, OS_LOG_TYPE_DEFAULT, "Halting event queue processing due to incoming call ui being visible.", buf, 2u);
    }

    -[STKAlertSessionManager eventQueue](self, "eventQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acquireEventQueueHaltingAssertionForReason:", CFSTR("incomingCallUIVisible"));
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    haltEventQueueProcessingAssertion = self->_haltEventQueueProcessingAssertion;
    self->_haltEventQueueProcessingAssertion = v6;

  }
  else
  {
    -[STKAlertSessionManager log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_216439000, v8, OS_LOG_TYPE_DEFAULT, "Resulting event queue processing due to incoming call ui being removed.", v9, 2u);
    }

    -[BSInvalidatable invalidate](self->_haltEventQueueProcessingAssertion, "invalidate");
    v5 = self->_haltEventQueueProcessingAssertion;
    self->_haltEventQueueProcessingAssertion = 0;
  }

}

- (void)deviceLockStateChanged:(BOOL)a3
{
  os_unfair_lock_s *p_lock;
  NSObject *notificationGroup;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_deviceLocked = a3;
  if (!a3)
  {
    notificationGroup = self->_notificationGroup;
    if (notificationGroup)
      dispatch_group_leave(notificationGroup);
    -[STKSIMToolkitAlertSessionManager _removeNotification](self, "_removeNotification");
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_queue_setCurrentSession:(id)a3
{
  STKSIMToolkitAlertSession *v4;
  STKSIMToolkitAlertSession *currentSession;
  void *v6;
  STKSIMToolkitAlertSession *v7;
  STKSIMToolkitAlertSession *v8;
  id v9;

  v4 = (STKSIMToolkitAlertSession *)a3;
  BSDispatchQueueAssert();
  currentSession = self->_currentSession;
  if (currentSession != v4)
  {
    -[STKAlertSession alertHandle](currentSession, "alertHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

    -[STKAlertSession invalidate](self->_currentSession, "invalidate");
  }
  v7 = self->_currentSession;
  self->_currentSession = v4;
  v8 = v4;

  -[STKAlertSession alertHandle](self->_currentSession, "alertHandle");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObserver:", self);
}

- (void)_queue_handleSIMToolkitEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5
{
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  STKUserEventMonitor *v13;
  STKUserEventMonitor *userEventMonitor;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  STKSIMToolkitAlertSession *currentSession;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  STKSIMToolkitAlertSession *v22;
  NSObject *v23;
  STKSIMToolkitAlertSession *v24;
  void *v25;
  NSObject *v26;
  __CFString *v27;
  const __CFString *v28;
  dispatch_semaphore_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  NSObject *v40;
  int v41;
  char v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  BOOL v48;
  NSObject *v49;
  NSObject *v50;
  const __CFArray *v51;
  const __CFArray *v52;
  CFTypeRef Value;
  const __CFLocale *v54;
  NSObject *v55;
  const __CFLocale *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  STKSIMToolkitAlertSession *v69;
  id v70;
  STKSIMToolkitAlertSession *v71;
  _QWORD v72[5];
  STKSIMToolkitAlertSession *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  NSObject *v79;
  _BYTE *v80;
  uint64_t state64;
  int out_token;
  uint8_t v83[4];
  STKSIMToolkitAlertSession *v84;
  __int16 v85;
  _BOOL4 v86;
  __int16 v87;
  int v88;
  __int16 v89;
  void *v90;
  uint8_t v91[128];
  _BYTE buf[24];
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v70 = a4;
  v9 = a5;
  BSDispatchQueueAssert();
  -[STKAlertSessionManager log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSTKSIMToolkitEvent(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_216439000, v10, OS_LOG_TYPE_DEFAULT, "Event received: %{public}@ with options: %@", buf, 0x16u);

  }
  if (a3 != 14)
  {
    v71 = self->_currentSession;
    -[STKSIMToolkitAlertSession behavior](v71, "behavior");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "dismissesAfterUserEvent"))
    {
      v16 = -[STKAlertSession hasSentResponse](v71, "hasSentResponse");

      if (!v16)
        goto LABEL_14;
      -[STKAlertSessionManager log](self, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        currentSession = self->_currentSession;
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = currentSession;
        _os_log_impl(&dword_216439000, v17, OS_LOG_TYPE_DEFAULT, "Session <%p> - Dismissing because [currentAlert dismissesAfterNextEvent] && [currentAlert hasSentResponse]", buf, 0xCu);
      }

      -[STKSIMToolkitAlertSessionManager _queue_setCurrentSession:](self, "_queue_setCurrentSession:", 0);
      v15 = v71;
      v71 = 0;
    }

LABEL_14:
    if (a3 == 7)
    {
      -[STKAlertSessionManager log](self, "log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_216439000, v23, OS_LOG_TYPE_DEFAULT, "Session <%p> - Play Tone userInfo: %{public}@", buf, 0x16u);
      }

      +[STKSoundFactory soundForOptions:](STKSoundFactory, "soundForOptions:", v9);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 == 13)
      {
        v19 = *MEMORY[0x24BDC2F00];
        objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC2F00]);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[STKAlertSession options](v71, "options");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v19);
        v67 = (id)objc_claimAutoreleasedReturnValue();

        if (v71 && BSEqualObjects())
        {
          -[STKAlertSessionManager log](self, "log");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = self->_currentSession;
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v22;
            _os_log_impl(&dword_216439000, v21, OS_LOG_TYPE_DEFAULT, "Session <%p> - Dismissing because kCTSIMToolkitSessionCompleteNotification", buf, 0xCu);
          }

          -[STKSIMToolkitAlertSessionManager _queue_setCurrentSession:](self, "_queue_setCurrentSession:", 0);
        }
        goto LABEL_99;
      }
      v68 = 0;
    }
    v67 = -[STKSIMToolkitAlertSessionManager _newSessionBehaviorFromOptions:](self, "_newSessionBehaviorFromOptions:", v9);
    v24 = [STKSIMToolkitAlertSession alloc];
    -[STKAlertSessionManager log](self, "log");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = -[STKSIMToolkitAlertSession initWithLogger:responseProvider:event:options:behavior:sound:](v24, "initWithLogger:responseProvider:event:options:behavior:sound:", v25, v70, a3, v9, v67, v68);

    if (v71 && !-[STKAlertSession hasSentResponse](v71, "hasSentResponse"))
    {
      -[STKAlertSessionManager log](self, "log");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v69;
        _os_log_impl(&dword_216439000, v43, OS_LOG_TYPE_DEFAULT, "Session <%p> - Returning early because an existing session already exists and needs a response", buf, 0xCu);
      }

      -[STKAlertSession sendResponse:](v69, "sendResponse:", 5);
      -[STKAlertSession invalidate](v69, "invalidate");
      goto LABEL_98;
    }
    switch(a3)
    {
      case 5:
        -[STKAlertSessionManager log](self, "log");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v69;
          _os_log_impl(&dword_216439000, v26, OS_LOG_TYPE_DEFAULT, "Session <%p> - Text session", buf, 0xCu);
        }

        objc_msgSend(v9, "bs_safeStringForKey:", *MEMORY[0x24BDC2D88]);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v27)
          v28 = v27;
        else
          v28 = &stru_24D563A28;

        if (CFEqual(v28, (CFTypeRef)*MEMORY[0x24BDC2D90]))
          goto LABEL_91;
        out_token = -1;
        state64 = 0;
        notify_register_check((const char *)*MEMORY[0x24BEB0ED0], &out_token);
        if (out_token != -1)
        {
          notify_get_state(out_token, &state64);
          notify_cancel(out_token);
        }
        v64 = state64;
        v29 = dispatch_semaphore_create(0);
        objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v93 = __Block_byref_object_copy__0;
        v94 = __Block_byref_object_dispose__0;
        v95 = 0;
        v78[0] = MEMORY[0x24BDAC760];
        v78[1] = 3221225472;
        v78[2] = __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke;
        v78[3] = &unk_24D563528;
        v80 = buf;
        v30 = v29;
        v79 = v30;
        objc_msgSend(v66, "setTransitionHandler:", v78);
        objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v66);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v30;
        dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "elements");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v91, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v75 != v34)
                objc_enumerationMutation(v32);
              v36 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
              if (objc_msgSend(v36, "isUIApplicationElement"))
              {
                objc_msgSend(v36, "bundleIdentifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "length") == 0;

                if (!v38)
                {
                  objc_msgSend(v36, "bundleIdentifier");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "addObject:", v39);

                }
              }
            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v91, 16);
          }
          while (v33);
        }

        objc_msgSend(v65, "invalidate");
        if (v64 || objc_msgSend(v31, "count") && (objc_msgSend(v31, "isEqual:", &unk_24D56C9D0) & 1) == 0)
        {
          -[STKAlertSessionManager log](self, "log");
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = objc_msgSend(v31, "count");
            *(_DWORD *)v83 = 134218754;
            v84 = v69;
            v85 = 1024;
            v86 = v64 != 0;
            v87 = 1024;
            v88 = v41;
            v89 = 2112;
            v90 = v31;
            _os_log_impl(&dword_216439000, v40, OS_LOG_TYPE_DEFAULT, "Session <%p> - Sending busy response because locked: %d, applicationCount: %d, applications: %@", v83, 0x22u);
          }

          -[STKAlertSession sendResponse:](v69, "sendResponse:", 5);
          -[STKAlertSession invalidate](v69, "invalidate");
          v42 = 0;
        }
        else
        {
          v42 = 1;
        }

        _Block_object_dispose(buf, 8);
        if ((v42 & 1) != 0)
          goto LABEL_91;
        goto LABEL_98;
      case 9:
        -[STKAlertSessionManager log](self, "log");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v69;
          _os_log_impl(&dword_216439000, v46, OS_LOG_TYPE_DEFAULT, "Session <%p> - Call setup session", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "deviceClass") == 0;

        if (!v48)
        {
          -[STKAlertSessionManager log](self, "log");
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v69;
            _os_log_impl(&dword_216439000, v49, OS_LOG_TYPE_DEFAULT, "Session <%p> - Call setup session not supported", buf, 0xCu);
          }

          -[STKAlertSession sendResponse:](v69, "sendResponse:", 6);
          -[STKAlertSession invalidate](v69, "invalidate");
LABEL_98:

LABEL_99:
          goto LABEL_100;
        }
        objc_msgSend(v9, "bs_safeStringForKey:", *MEMORY[0x24BDC2D50]);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualStrings())
        {
          v58 = (void *)CTCopyCurrentCalls();
          if (objc_msgSend(v58, "count"))
          {
            -[STKAlertSessionManager log](self, "log");
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v69;
              _os_log_impl(&dword_216439000, v59, OS_LOG_TYPE_DEFAULT, "Session <%p> - Call setup session busy (has existing phone calls)", buf, 0xCu);
            }

            -[STKAlertSession sendResponse:](v69, "sendResponse:", 5);
            -[STKAlertSession invalidate](v69, "invalidate");

            goto LABEL_98;
          }

        }
        goto LABEL_91;
      case 10:
        -[STKAlertSessionManager log](self, "log");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v69;
          _os_log_impl(&dword_216439000, v44, OS_LOG_TYPE_DEFAULT, "Session <%p> - Idle text session", buf, 0xCu);
        }

        objc_msgSend(v9, "bs_safeStringForKey:", *MEMORY[0x24BDC2F18]);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        SBSSetIdleText();
        -[STKAlertSession sendResponse:](v69, "sendResponse:", 0);
        -[STKAlertSession invalidate](v69, "invalidate");

        goto LABEL_98;
      case 11:
        -[STKAlertSessionManager log](self, "log");
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v69;
          _os_log_impl(&dword_216439000, v50, OS_LOG_TYPE_DEFAULT, "Session <%p> - Local information session", buf, 0xCu);
        }

        v51 = (const __CFArray *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x24BDBD568], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
        v52 = v51;
        if (v51 && CFArrayGetCount(v51) >= 1 && (Value = CFArrayGetValueAtIndex(v52, 0)) != 0)
        {
          v54 = 0;
        }
        else
        {
          v56 = CFLocaleCopyCurrent();
          v54 = v56;
          if (!v56 || (Value = CFLocaleGetValue(v56, (CFLocaleKey)*MEMORY[0x24BDBD418])) == 0)
          {
            -[STKAlertSession sendResponse:](v69, "sendResponse:", 3, Value);
LABEL_75:
            -[STKAlertSession invalidate](v69, "invalidate");
            if (v52)
              CFRelease(v52);
            if (v54)
              CFRelease(v54);
            goto LABEL_98;
          }
        }
        -[STKAlertSession sendResponse:withStringResult:](v69, "sendResponse:withStringResult:", 0, Value);
        goto LABEL_75;
      case 12:
        -[STKAlertSessionManager log](self, "log");
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v69;
          _os_log_impl(&dword_216439000, v55, OS_LOG_TYPE_DEFAULT, "Session <%p> - Language session", buf, 0xCu);
        }

        -[STKAlertSession sendResponse:](v69, "sendResponse:", 0);
        -[STKAlertSession invalidate](v69, "invalidate");
        goto LABEL_98;
      default:
LABEL_91:
        objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC2E00]);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if (v60 && objc_msgSend(v60, "BOOLValue"))
        {
          -[STKAlertSessionManager log](self, "log");
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v69;
            _os_log_impl(&dword_216439000, v62, OS_LOG_TYPE_DEFAULT, "Session <%p> - Not presenting because it asked not to be presented", buf, 0xCu);
          }

          -[STKAlertSession sendResponse:](v69, "sendResponse:", 0);
          -[STKAlertSession invalidate](v69, "invalidate");
        }
        else
        {
          v72[0] = MEMORY[0x24BDAC760];
          v72[1] = 3221225472;
          v72[2] = __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke_90;
          v72[3] = &unk_24D563318;
          v72[4] = self;
          v73 = v69;
          -[STKAlertSessionManager enqueuePresentationForSession:completion:](self, "enqueuePresentationForSession:completion:", v73, v72);

        }
        goto LABEL_98;
    }
  }
  -[STKAlertSessionManager log](self, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216439000, v12, OS_LOG_TYPE_DEFAULT, "Requested user attention", buf, 2u);
  }

  if (!self->_userEventMonitor)
  {
    v13 = objc_alloc_init(STKUserEventMonitor);
    userEventMonitor = self->_userEventMonitor;
    self->_userEventMonitor = v13;

    objc_storeStrong((id *)&self->_userEventResponder, a4);
    -[STKUserEventMonitor setDelegate:](self->_userEventMonitor, "setDelegate:", self);
    -[STKUserEventMonitor setEnabled:](self->_userEventMonitor, "setEnabled:", 1);
  }
LABEL_100:

}

void __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v5 = v6;
  }

}

void __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke_90(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v4 = *(NSObject **)(v2 + 32);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke_2;
    v5[3] = &unk_24D563120;
    v5[4] = v2;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentSession:", *(_QWORD *)(a1 + 40));
}

- (id)_listItemsFromCTItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  STKListItem *v13;
  void *v14;
  STKListItem *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v11, "text", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v13 = [STKListItem alloc];
            objc_msgSend(v11, "text");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[STKListItem initWithText:selected:](v13, "initWithText:selected:", v14, objc_msgSend(v11, "selected"));
            objc_msgSend(v5, "addObject:", v15);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_newSessionBehaviorFromOptions:(id)a3
{
  id v3;
  STKMutableSessionBehavior *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(STKMutableSessionBehavior);
  objc_msgSend(v3, "bs_safeStringForKey:", *MEMORY[0x24BDC2D78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = BSEqualStrings();
  else
    v6 = 0;
  objc_msgSend(v3, "bs_safeNumberForKey:", *MEMORY[0x24BDC2F20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  -[STKMutableSessionBehavior setTimeout:](v4, "setTimeout:");

  -[STKMutableSessionBehavior setShouldSendResponseUponDisplay:](v4, "setShouldSendResponseUponDisplay:", v6);
  -[STKMutableSessionBehavior setDismissesAfterUserEvent:](v4, "setDismissesAfterUserEvent:", v6);

  return v4;
}

- (void)_queue_startListening
{
  __CTServerConnection *v3;
  CoreTelephonyClient *telephonyClient;

  BSDispatchQueueAssert();
  if (!self->_serverConnection)
  {
    v3 = (__CTServerConnection *)_CTServerConnectionCreate();
    self->_serverConnection = v3;
    if (v3)
    {
      _CTServerConnectionSetTargetQueue();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
    }
  }
  telephonyClient = self->_telephonyClient;
  if (telephonyClient)
    -[CoreTelephonyClient setDelegate:](telephonyClient, "setDelegate:", self);
}

- (STKTelephonyListItemsProvider)_listItemsProvider
{
  return self->_listItemsProvider;
}

- (void)_setListItemsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listItemsProvider, a3);
}

- (STKSIMToolkitAlertSession)currentSession
{
  return self->_currentSession;
}

- (STKCarrierSubscriptionMonitor)subscriptionMonitor
{
  return self->_subscriptionMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionMonitor, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_userEventResponder, 0);
  objc_storeStrong((id *)&self->_userEventMonitor, 0);
  objc_storeStrong((id *)&self->_listItemsProvider, 0);
  objc_storeStrong((id *)&self->_haltEventQueueProcessingAssertion, 0);
  objc_storeStrong((id *)&self->_notificationGroup, 0);
  objc_storeStrong((id *)&self->_deviceLockMonitor, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_incomingCallUIStateMonitor, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __53__STKSIMToolkitAlertSessionManager__showNotification__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216439000, a2, a3, "Unable to add notification request %@", a5, a6, a7, a8, 2u);
}

- (void)remoteAlertDescriptorForSession:.cold.1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 138412802;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_216439000, v0, (uint64_t)v0, "Carrier bundle: key=%@; value=%@; error:%@; ",
    (uint8_t *)v1);
}

- (void)remoteAlertDescriptorForSession:.cold.2()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 138412802;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_216439000, v0, (uint64_t)v0, "Carrier bundle: key=%@; value=%@; error:%@", (uint8_t *)v1);
}

- (void)remoteAlertDescriptorForSession:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = 136315650;
  v7 = CTSubscriptionSlotAsString();
  v8 = 2048;
  v9 = a2;
  v10 = 2112;
  v11 = a3;
  OUTLINED_FUNCTION_0_0(&dword_216439000, MEMORY[0x24BDACB70], v5, "Getting Sim label failed for %s and context(%p) with error %@", (uint8_t *)&v6);
}

@end
