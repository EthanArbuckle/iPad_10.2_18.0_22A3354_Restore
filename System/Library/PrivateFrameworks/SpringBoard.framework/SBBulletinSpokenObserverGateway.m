@implementation SBBulletinSpokenObserverGateway

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SBBulletinSpokenObserverGateway_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (id)sharedInstance_sharedInstance;
}

void __49__SBBulletinSpokenObserverGateway_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (SBBulletinSpokenObserverGateway)init
{
  SBBulletinSpokenObserverGateway *v2;
  uint64_t v3;
  AFSiriAnnouncementRequestCapabilityManager *announcementRequestCapabilityManager;
  AFSiriAnnouncementRequestCapabilityManager *v5;
  SBBulletinSpokenObserverGateway *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  _QWORD v11[4];
  SBBulletinSpokenObserverGateway *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBBulletinSpokenObserverGateway;
  v2 = -[SBBulletinSpokenObserverGateway init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE9C0]), "initWithPlatform:", 1);
    announcementRequestCapabilityManager = v2->_announcementRequestCapabilityManager;
    v2->_announcementRequestCapabilityManager = (AFSiriAnnouncementRequestCapabilityManager *)v3;

    -[AFSiriAnnouncementRequestCapabilityManager addObserver:](v2->_announcementRequestCapabilityManager, "addObserver:", v2);
    v5 = v2->_announcementRequestCapabilityManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__SBBulletinSpokenObserverGateway_init__block_invoke;
    v11[3] = &unk_1E8EA3A88;
    v6 = v2;
    v12 = v6;
    -[AFSiriAnnouncementRequestCapabilityManager fetchAvailableAnnouncementRequestTypesWithCompletion:](v5, "fetchAvailableAnnouncementRequestTypesWithCompletion:", v11);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.springboard.SBBulletinSpokenObserverGateway", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

uint64_t __39__SBBulletinSpokenObserverGateway_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "availableAnnouncementRequestTypesChanged:onPlatform:", a2, 1);
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  os_log_t *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  _BOOL4 canAnnounceNotifications;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  NSObject *queue;
  os_log_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD block[4];
  id v43;
  id v44;
  SBBulletinSpokenObserverGateway *v45;
  void (**v46)(id, _QWORD);
  unint64_t v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  _BYTE v51[10];
  unint64_t v52;
  _BYTE v53[10];
  __int16 v54;
  _BOOL4 v55;
  uint64_t v56;

  v8 = a6;
  v56 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD))a7;
  v14 = (os_log_t *)MEMORY[0x1E0DC5F80];
  v15 = (void *)*MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "publisherMatchID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "un_logDigest");
    v20 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v49 = v18;
    v50 = 2114;
    *(_QWORD *)v51 = v21;
    *(_WORD *)&v51[8] = 2048;
    v52 = a5;
    *(_WORD *)v53 = 2114;
    *(_QWORD *)&v53[2] = v22;
    v54 = 1024;
    v55 = v8;
    _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "%@ adding bulletin %{public}@ for feed %lu in section %{public}@ playLightsAndSirens: %{BOOL}u", buf, 0x30u);

    v14 = (os_log_t *)MEMORY[0x1E0DC5F80];
    v11 = v20;

  }
  if (!v8)
  {
    if (!v13)
      goto LABEL_16;
    v36 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v36;
      objc_msgSend(v12, "publisherMatchID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "un_logDigest");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v39;
      _os_log_impl(&dword_1D0540000, v37, OS_LOG_TYPE_DEFAULT, "Notification %{public}@ cannot be spoken because BulletinBoard suppressed it", buf, 0xCu);

    }
LABEL_15:
    v13[2](v13, 0);
    goto LABEL_16;
  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isUILocked");

  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "inCall");

  +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "inFaceTime");

  canAnnounceNotifications = 0;
  if (v24 && (v26 & 1) == 0 && (v28 & 1) == 0)
    canAnnounceNotifications = self->_canAnnounceNotifications;
  v30 = *v14;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    objc_msgSend(v12, "publisherMatchID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "un_logDigest");
    v40 = v11;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = self->_canAnnounceNotifications;
    *(_DWORD *)buf = 138544642;
    v49 = v33;
    v50 = 1024;
    *(_DWORD *)v51 = canAnnounceNotifications;
    *(_WORD *)&v51[4] = 1024;
    *(_DWORD *)&v51[6] = v24;
    LOWORD(v52) = 1024;
    *(_DWORD *)((char *)&v52 + 2) = v26;
    HIWORD(v52) = 1024;
    *(_DWORD *)v53 = v28;
    *(_WORD *)&v53[4] = 1024;
    *(_DWORD *)&v53[6] = v34;
    _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEFAULT, "Notification %{public}@ should be spoken: %{BOOL}u [ isUILocked: %{BOOL}u inCall: %{BOOL}u inFaceTime: %{BOOL}u canAnnounce: %{BOOL}u ]", buf, 0x2Au);

    v11 = v40;
  }
  if (!canAnnounceNotifications)
    goto LABEL_15;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke;
  block[3] = &unk_1E8E9FBF0;
  v43 = v12;
  v47 = a5;
  v44 = v11;
  v45 = self;
  v46 = v13;
  dispatch_async(queue, block);

LABEL_16:
}

void __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC6008];
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v4 = (void **)(a1 + 32);
  v6 = objc_alloc_init(MEMORY[0x1E0D036C8]);
  objc_msgSend(v2, "notificationRequestForBulletin:observer:sectionInfo:feed:", v3, v5, v6, v4[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*((id *)v4[2] + 2), "nc_shouldSuppressNotificationRequest:", v7) & 1) != 0)
  {
    v8 = (void *)*MEMORY[0x1E0DC5F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *v4;
      v10 = v8;
      objc_msgSend(v9, "publisherMatchID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "un_logDigest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Notification %{public}@ cannot be spoken because DND suppressed it", buf, 0xCu);

    }
    v13 = *(_QWORD *)(a1 + 56);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEC6F8], "notificationForBulletin:", *v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)*MEMORY[0x1E0DC5F80];
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
      {
        v16 = *v4;
        v17 = v15;
        objc_msgSend(v16, "publisherMatchID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "un_logDigest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v19;
        _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Speak notification %{public}@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "sectionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_10;
      v23[3] = &unk_1E8E9E248;
      v24 = *(id *)(a1 + 32);
      v25 = v14;
      v26 = v20;
      v27 = *(id *)(a1 + 56);
      v21 = v20;
      dispatch_async(MEMORY[0x1E0C80D38], v23);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_ERROR))
        __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_cold_1(v4, v15);
      v22 = *(_QWORD *)(a1 + 56);
      if (v22)
        (*(void (**)(uint64_t, _QWORD))(v22 + 16))(v22, 0);
    }

  }
}

void __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "summary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA10]), "initWithSummary:summaryType:error:", v3, 2, 0);
  else
    v4 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA08]), "initWithUserNotification:sourceAppId:platform:summaryDecision:summary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, 1, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_2;
  v6[3] = &unk_1E8E9F230;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v5, "performRequestWithCompletion:", v6);

}

uint64_t __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t result;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "publisherMatchID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 1024;
    v13 = a2;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Did speak notification %{public}@: %{BOOL}u", (uint8_t *)&v10, 0x12u);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)availableAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4
{
  unint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  BBObserver *bbObserver;
  BBObserver *v10;
  DNDEventBehaviorResolutionService *dndEventBehaviorResolutionService;
  void *v12;
  BBObserver *v13;
  BBObserver *v14;
  DNDEventBehaviorResolutionService *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a4 == 1)
  {
    v5 = a3 & 1;
    if (self->_canAnnounceNotifications != (a3 & 1))
    {
      v6 = (void *)*MEMORY[0x1E0DC5F80];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        AFSiriAnnouncementPlatformGetName();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v8;
        v18 = 1024;
        v19 = v5;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Notification announcements on %@ changed to %{BOOL}d", (uint8_t *)&v16, 0x12u);

      }
      self->_canAnnounceNotifications = v5;
      bbObserver = self->_bbObserver;
      if (v5)
      {
        if (!bbObserver)
        {
          v12 = (void *)MEMORY[0x1E0C80D38];
          objc_msgSend(MEMORY[0x1E0D036B8], "gatewayWithQueue:calloutQueue:name:priority:", MEMORY[0x1E0C80D38], MEMORY[0x1E0C80D38], CFSTR("SpokenGateway"), 1);
          v13 = (BBObserver *)objc_claimAutoreleasedReturnValue();
          v14 = self->_bbObserver;
          self->_bbObserver = v13;

          -[BBObserver setDelegate:](self->_bbObserver, "setDelegate:", self);
          -[BBObserver setObserverFeed:](self->_bbObserver, "setObserverFeed:", 256);
        }
        if (!self->_dndEventBehaviorResolutionService)
        {
          objc_msgSend(MEMORY[0x1E0D1D5D8], "serviceForClientIdentifier:", CFSTR("com.apple.springboard.SBBulletinSpokenObserverGateway"));
          v15 = (DNDEventBehaviorResolutionService *)objc_claimAutoreleasedReturnValue();
          dndEventBehaviorResolutionService = self->_dndEventBehaviorResolutionService;
          self->_dndEventBehaviorResolutionService = v15;
          goto LABEL_14;
        }
      }
      else
      {
        if (bbObserver)
        {
          -[BBObserver invalidate](bbObserver, "invalidate");
          v10 = self->_bbObserver;
          self->_bbObserver = 0;

        }
        dndEventBehaviorResolutionService = self->_dndEventBehaviorResolutionService;
        if (dndEventBehaviorResolutionService)
        {
          self->_dndEventBehaviorResolutionService = 0;
LABEL_14:

        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_announcementRequestCapabilityManager, 0);
  objc_storeStrong((id *)&self->_dndEventBehaviorResolutionService, 0);
  objc_storeStrong((id *)&self->_bbObserver, 0);
}

void __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "publisherMatchID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v5;
  _os_log_error_impl(&dword_1D0540000, v3, OS_LOG_TYPE_ERROR, "Notification %{public}@ cannot be spoken because notification is nil", (uint8_t *)&v6, 0xCu);

}

@end
