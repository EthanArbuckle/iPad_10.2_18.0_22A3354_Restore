@implementation NCBulletinNotificationSource

- (void)observer:(id)a3 noteBulletinsLoadedForSectionID:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__NCBulletinNotificationSource_observer_noteBulletinsLoadedForSectionID___block_invoke;
  v7[3] = &unk_1E8D1B3A0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v5, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCBulletinNotificationSource sectionInfoById](self, "sectionInfoById");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasEnabledSettings"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);
  objc_msgSend(MEMORY[0x1E0DC6018], "notificationSectionSettingsForBBSectionInfo:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCBulletinNotificationSource dispatcher](self, "dispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__NCBulletinNotificationSource_observer_updateSectionInfo___block_invoke;
  v12[3] = &unk_1E8D1B3A0;
  v13 = v9;
  v14 = v8;
  v10 = v8;
  v11 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __73__NCBulletinNotificationSource_observer_noteBulletinsLoadedForSectionID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dispatcher");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationsLoadedForSectionIdentifier:", *(_QWORD *)(a1 + 40));

}

- (NCNotificationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (NSMutableDictionary)sectionInfoById
{
  return self->_sectionInfoById;
}

uint64_t __59__NCBulletinNotificationSource_observer_updateSectionInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateNotificationSectionSettings:", *(_QWORD *)(a1 + 40));
}

- (NCBulletinNotificationSource)init
{
  -[NCBulletinNotificationSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (NCBulletinNotificationSource)initWithDispatcher:(id)a3
{
  NSObject *v5;
  id v6;
  dispatch_queue_t v7;
  void *v8;
  NCBulletinNotificationSource *v9;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a3;
  v7 = dispatch_queue_create("com.apple.UserNotificationsUI.BulletinNotificationSource", v5);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D036B8]), "initWithQueue:calloutQueue:", v7, v7);
  v9 = -[NCBulletinNotificationSource initWithDispatcher:observer:queue:](self, "initWithDispatcher:observer:queue:", v6, v8, v7);

  return v9;
}

- (NCBulletinNotificationSource)initWithDispatcher:(id)a3 observer:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  NCBulletinNotificationSource *v12;
  NCBulletinNotificationSource *v13;
  uint64_t v14;
  NSMutableDictionary *sectionInfoById;
  uint64_t v16;
  NSMutableDictionary *bulletinFeeds;
  uint64_t v18;
  NSMutableDictionary *bulletinsToUUIDs;
  uint64_t v20;
  NSMutableDictionary *uuidsToRequests;
  uint64_t v22;
  DNDEventBehaviorResolutionService *eventBehaviorResolutionService;
  id v24;
  uint64_t v25;
  BBSettingsGateway *settingsGateway;
  NSObject *queue;
  NCBulletinNotificationSource *v28;
  void *v29;
  _QWORD block[4];
  NCBulletinNotificationSource *v32;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)NCBulletinNotificationSource;
  v12 = -[NCBulletinNotificationSource init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a5);
    objc_storeStrong((id *)&v13->_observer, a4);
    -[BBObserver setObserverFeed:](v13->_observer, "setObserverFeed:", 0xFFFFLL);
    -[BBObserver setDelegate:](v13->_observer, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_dispatcher, a3);
    -[NCNotificationDispatcher addDispatcherSourceDelegate:](v13->_dispatcher, "addDispatcherSourceDelegate:", v13);
    v14 = objc_opt_new();
    sectionInfoById = v13->_sectionInfoById;
    v13->_sectionInfoById = (NSMutableDictionary *)v14;

    v16 = objc_opt_new();
    bulletinFeeds = v13->_bulletinFeeds;
    v13->_bulletinFeeds = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    bulletinsToUUIDs = v13->_bulletinsToUUIDs;
    v13->_bulletinsToUUIDs = (NSMutableDictionary *)v18;

    v20 = objc_opt_new();
    uuidsToRequests = v13->_uuidsToRequests;
    v13->_uuidsToRequests = (NSMutableDictionary *)v20;

    objc_msgSend(MEMORY[0x1E0D1D5D8], "serviceForClientIdentifier:", CFSTR("com.apple.springboard.NCBulletinNotificationSource"));
    v22 = objc_claimAutoreleasedReturnValue();
    eventBehaviorResolutionService = v13->_eventBehaviorResolutionService;
    v13->_eventBehaviorResolutionService = (DNDEventBehaviorResolutionService *)v22;

    v24 = (id)objc_msgSend(MEMORY[0x1E0CEC8B8], "sharedInstance");
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D036D8]), "initWithQueue:", v13->_queue);
    settingsGateway = v13->_settingsGateway;
    v13->_settingsGateway = (BBSettingsGateway *)v25;

    queue = v13->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__NCBulletinNotificationSource_initWithDispatcher_observer_queue___block_invoke;
    block[3] = &unk_1E8D1B568;
    v28 = v13;
    v32 = v28;
    dispatch_async(queue, block);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v28, sel__applicationIconChanged_, CFSTR("com.apple.LaunchServices.applicationIconChanged"), 0);

  }
  return v13;
}

void __66__NCBulletinNotificationSource_initWithDispatcher_observer_queue___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD block[4];
  id v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "settingsGateway");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveGlobalScheduledDeliverySetting") == 2;

  objc_msgSend(*(id *)(a1 + 32), "settingsGateway");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveGlobalScheduledDeliverySetting") == -1;

  objc_msgSend(*(id *)(a1 + 32), "settingsGateway");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "effectiveGlobalScheduledDeliveryShowNextSummarySetting") == 2;

  objc_msgSend(*(id *)(a1 + 32), "settingsGateway");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectiveGlobalScheduledDeliveryTimes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC6020];
  objc_msgSend(*(id *)(a1 + 32), "settingsGateway");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "listDisplayStyleSettingForBBNotificationListDisplayStyleSetting:", objc_msgSend(v11, "effectiveGlobalNotificationListDisplayStyleSetting"));

  objc_msgSend(*(id *)(a1 + 32), "settingsGateway");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "effectiveGlobalSummarizationSetting") == 2;

  objc_msgSend(*(id *)(a1 + 32), "settingsGateway");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "effectiveGlobalHighlightsSetting") == 2;

  LOBYTE(v19) = v16;
  objc_msgSend(MEMORY[0x1E0DC6020], "notificationSystemSettingsForScheduledDeliveryEnabled:scheduledDeliveryUninitialized:scheduledDeliveryShowNextSummary:scheduledDeliveryTimes:listDisplayStyleSetting:summarizationEnabled:highlightsEnabled:", v3, v5, v7, v9, v12, v14, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NCBulletinNotificationSource_initWithDispatcher_observer_queue___block_invoke_2;
  block[3] = &unk_1E8D1B3A0;
  v21 = *(id *)(a1 + 32);
  v22 = v17;
  v18 = v17;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __66__NCBulletinNotificationSource_initWithDispatcher_observer_queue___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dispatcher");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateNotificationSystemSettings:", *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  objc_super v3;

  -[BBObserver invalidate](self->_observer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NCBulletinNotificationSource;
  -[NCBulletinNotificationSource dealloc](&v3, sel_dealloc);
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7
{
  _BOOL8 v8;
  id v12;
  NSObject *queue;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
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
  BOOL v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  void *v38;
  _BOOL8 v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  _QWORD block[4];
  id v50;
  id v51;
  id v52;
  BOOL v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v8 = a6;
  v62 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v46 = a7;
  queue = self->_queue;
  v14 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v12, "publisherMatchID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)*MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "un_logDigest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v55 = v19;
    v56 = 2114;
    v57 = v20;
    v58 = 2048;
    v59 = a5;
    v60 = 2114;
    v61 = v21;
    _os_log_impl(&dword_1CFC3D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ adding bulletin %{public}@ for feed %lu in section %{public}@", buf, 0x2Au);

  }
  -[NCBulletinNotificationSource bulletinFeeds](self, "bulletinFeeds", v46);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = v15;
  if (v15)
  {
    -[NCBulletinNotificationSource bulletinFeeds](self, "bulletinFeeds");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    a5 = -[NCBulletinNotificationSource _updateFeedForCoverSheetDestination:storedFeed:](self, "_updateFeedForCoverSheetDestination:storedFeed:", a5, objc_msgSend(v25, "unsignedIntegerValue"));
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "unsignedIntegerValue") | a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NCBulletinNotificationSource bulletinFeeds](self, "bulletinFeeds");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "publisherMatchID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v26, v28);

  }
  -[NCBulletinNotificationSource _queue_sectionInfoForBulletin:](self, "_queue_sectionInfoForBulletin:", v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publisherMatchID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCBulletinNotificationSource _requestUUIDForBulletinPublisherMatchID:](self, "_requestUUIDForBulletinPublisherMatchID:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v8;
  objc_msgSend(MEMORY[0x1E0DC6008], "notificationRequestForBulletin:observer:sectionInfo:feed:playLightsAndSirens:uuid:", v12, v14, v29, a5, v8, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "requestDestinations");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
    -[NSMutableDictionary setObject:forKey:](self->_uuidsToRequests, "setObject:forKey:", v33, v31);
  -[NCBulletinNotificationSource _updatedRequestWithAlertOptions:](self, "_updatedRequestWithAlertOptions:", v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v32;
  if ((a5 & 0x80B) != 0)
  {
    if (v23)
    {
      +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "modifiedNotificationRequest:", v36);
    }
    else
    {
      v39 = (a5 & 0xA) != 0;
      objc_msgSend(MEMORY[0x1E0DC6018], "notificationSectionSettingsForBBSectionInfo:", v29);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v39;
      v37 = v32;
      objc_msgSend(v40, "receivedNotification:withProminence:sectionSettings:", v36, v41, v38);

    }
  }
  -[NCBulletinNotificationSource dispatcher](self, "dispatcher");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__NCBulletinNotificationSource_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke;
  block[3] = &unk_1E8D1F5A8;
  v50 = v42;
  v51 = v36;
  v52 = v47;
  v53 = v37;
  v43 = v47;
  v44 = v36;
  v45 = v42;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __91__NCBulletinNotificationSource_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "postNotificationWithRequest:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56));
  return result;
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5
{
  NSObject *queue;
  id v9;
  id v10;

  queue = self->_queue;
  v9 = a4;
  v10 = a3;
  dispatch_assert_queue_V2(queue);
  -[NCBulletinNotificationSource observer:addBulletin:forFeed:playLightsAndSirens:withReply:](self, "observer:addBulletin:forFeed:playLightsAndSirens:withReply:", v10, v9, a5, 1, 0);

}

- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  os_log_t v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  unint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v9, "publisherMatchID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (os_log_t *)MEMORY[0x1E0DC5F80];
  v12 = (void *)*MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "un_logDigest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v15;
    v39 = 2114;
    v40 = v16;
    v41 = 2048;
    v42 = a5;
    _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying bulletin %{public}@ for feed %lu", buf, 0x20u);

  }
  -[NCBulletinNotificationSource bulletinFeeds](self, "bulletinFeeds");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v18)
  {
    -[NCBulletinNotificationSource bulletinFeeds](self, "bulletinFeeds");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publisherMatchID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      a5 &= objc_msgSend(v21, "unsignedIntegerValue");
    v22 = -[NCBulletinNotificationSource _updateFeedForCoverSheetDestination:storedFeed:](self, "_updateFeedForCoverSheetDestination:storedFeed:", a5, objc_msgSend(v21, "unsignedIntegerValue"));
    -[NCBulletinNotificationSource _queue_sectionInfoForBulletin:](self, "_queue_sectionInfoForBulletin:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publisherMatchID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCBulletinNotificationSource _requestUUIDForBulletinPublisherMatchID:](self, "_requestUUIDForBulletinPublisherMatchID:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC6008], "notificationRequestForBulletin:observer:sectionInfo:feed:uuid:", v9, v8, v23, v22, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_uuidsToRequests, "setObject:forKey:", v26, v25);
    -[NCBulletinNotificationSource _updatedRequestWithAlertOptions:](self, "_updatedRequestWithAlertOptions:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCBulletinNotificationSource dispatcher](self, "dispatcher");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __64__NCBulletinNotificationSource_observer_modifyBulletin_forFeed___block_invoke;
    v34[3] = &unk_1E8D1B3A0;
    v35 = v28;
    v36 = v27;
    v29 = v27;
    v30 = v28;
    dispatch_async(MEMORY[0x1E0C80D38], v34);

  }
  else
  {
    v31 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      objc_msgSend(v10, "un_logDigest");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v33;
      _os_log_impl(&dword_1CFC3D000, v32, OS_LOG_TYPE_DEFAULT, "Bulletin %{public}@ was not found and can't be modified", buf, 0xCu);

    }
  }

}

uint64_t __64__NCBulletinNotificationSource_observer_modifyBulletin_forFeed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "modifyNotificationWithRequest:", *(_QWORD *)(a1 + 40));
}

- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  NSMutableDictionary *bulletinsToUUIDs;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  void *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  unint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v9, "publisherMatchID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (os_log_t *)MEMORY[0x1E0DC5F80];
  v12 = (void *)*MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "un_logDigest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v15;
    v50 = 2114;
    v51 = v16;
    v52 = 2048;
    v53 = a5;
    _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ removing bulletin %{public}@ for feed %lu", buf, 0x20u);

  }
  -[NCBulletinNotificationSource bulletinFeeds](self, "bulletinFeeds");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v18)
  {
    -[NCBulletinNotificationSource bulletinFeeds](self, "bulletinFeeds");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publisherMatchID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    v23 = v22 & ~a5;
    -[NCBulletinNotificationSource bulletinFeeds](self, "bulletinFeeds");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22 & ~a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "publisherMatchID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKey:", v26, v27);

    }
    else
    {
      objc_msgSend(v24, "removeObjectForKey:", v10);
    }

    -[NCBulletinNotificationSource _queue_sectionInfoForBulletin:](self, "_queue_sectionInfoForBulletin:", v9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publisherMatchID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCBulletinNotificationSource _requestUUIDForBulletinPublisherMatchID:](self, "_requestUUIDForBulletinPublisherMatchID:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC6008], "notificationRequestForBulletin:observer:sectionInfo:feed:uuid:", v9, v8, v31, a5, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCBulletinNotificationSource _updatedRequestWithAlertOptions:](self, "_updatedRequestWithAlertOptions:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCBulletinNotificationSource dispatcher](self, "dispatcher");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = __64__NCBulletinNotificationSource_observer_removeBulletin_forFeed___block_invoke;
    v45 = &unk_1E8D1B3A0;
    v37 = v36;
    v46 = v37;
    v38 = v35;
    v47 = v38;
    dispatch_async(MEMORY[0x1E0C80D38], &v42);
    if (!v23)
    {
      bulletinsToUUIDs = self->_bulletinsToUUIDs;
      objc_msgSend(v9, "publisherMatchID", v42, v43, v44, v45, v46);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](bulletinsToUUIDs, "removeObjectForKey:", v40);

      if (v33)
        -[NSMutableDictionary removeObjectForKey:](self->_uuidsToRequests, "removeObjectForKey:", v33);
      +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "removedNotificationRequest:", v38);

    }
  }
  else
  {
    v28 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      objc_msgSend(v10, "un_logDigest");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v30;
      _os_log_impl(&dword_1CFC3D000, v29, OS_LOG_TYPE_DEFAULT, "Bulletin %{public}@ was already removed!", buf, 0xCu);

    }
  }

}

uint64_t __64__NCBulletinNotificationSource_observer_removeBulletin_forFeed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "withdrawNotificationWithRequest:", *(_QWORD *)(a1 + 40));
}

- (void)observer:(id)a3 removeBulletin:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  -[NCBulletinNotificationSource observer:removeBulletin:forFeed:](self, "observer:removeBulletin:forFeed:", v8, v7, 65023);

}

- (void)observer:(id)a3 removeSection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NCBulletinNotificationSource dispatcher](self, "dispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__NCBulletinNotificationSource_observer_removeSection___block_invoke;
  v9[3] = &unk_1E8D1B3A0;
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __55__NCBulletinNotificationSource_observer_removeSection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeNotificationSectionWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__NCBulletinNotificationSource_observer_noteServerConnectionStateChanged___block_invoke;
    v7[3] = &unk_1E8D1F5D0;
    v7[4] = self;
    v8 = v6;
    objc_msgSend(v8, "getSectionInfoWithCompletion:", v7);

  }
}

void __74__NCBulletinNotificationSource_observer_noteServerConnectionStateChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
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
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "observer:updateSectionInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "requestNoticesBulletinsForAllSections");

}

- (void)observer:(id)a3 updateGlobalSettings:(id)a4
{
  NSObject *queue;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(MEMORY[0x1E0DC6020], "notificationSystemSettingsForBBGlobalSettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__NCBulletinNotificationSource_observer_updateGlobalSettings___block_invoke;
  v9[3] = &unk_1E8D1B3A0;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __62__NCBulletinNotificationSource_observer_updateGlobalSettings___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dispatcher");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateNotificationSystemSettings:", *(_QWORD *)(a1 + 40));

}

- (void)dispatcher:(id)a3 requestsClearingNotificationRequests:(id)a4
{
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  -[NCBulletinNotificationSource _bulletinsPerSectionIdForNotificationRequests:](self, "_bulletinsPerSectionIdForNotificationRequests:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequests___block_invoke;
  block[3] = &unk_1E8D1CB40;
  objc_copyWeak(&v10, &location);
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __80__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequests___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "clearBulletins:inSection:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)dispatcher:(id)a3 requestsClearingNotificationRequests:(id)a4 fromDestinations:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v7 = a5;
  v8 = a4;
  -[NCBulletinNotificationSource _bulletinsPerSectionIdForNotificationRequests:](self, "_bulletinsPerSectionIdForNotificationRequests:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCBulletinNotificationSource _bulletinsToClearPerSectionIdForNotificationRequests:removingDestinations:](self, "_bulletinsToClearPerSectionIdForNotificationRequests:removingDestinations:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequests_fromDestinations___block_invoke;
  block[3] = &unk_1E8D1D238;
  objc_copyWeak(&v19, &location);
  v16 = v7;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __97__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequests_fromDestinations___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1[4], "containsObject:", CFSTR("BulletinDestinationLockScreen")) & 1) != 0
    || objc_msgSend(a1[4], "containsObject:", CFSTR("BulletinDestinationCoverSheet")))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(a1[5], "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(a1[5], "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "removeBulletins:inSection:fromFeed:", v10, v9, 8);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(a1[6], "allKeys", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
          objc_msgSend(a1[6], "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "clearBulletins:inSection:", v17, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v13);
    }

  }
}

- (void)dispatcher:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequestsInSections___block_invoke;
  block[3] = &unk_1E8D1B8F8;
  v9 = v5;
  v7 = v5;
  objc_copyWeak(&v10, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __90__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequestsInSections___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = (id *)(a1 + 40);
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained(v6);
        objc_msgSend(WeakRetained, "observer", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "clearSection:", v8);
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)dispatcher:(id)a3 requestsClearingNotificationRequestsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequestsFromDate_toDate_inSections___block_invoke;
  block[3] = &unk_1E8D1D238;
  objc_copyWeak(&v20, &location);
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(queue, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __106__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequestsFromDate_toDate_inSections___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "observer");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "clearBulletinsFromDate:toDate:inSections:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)dispatcher:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__NCBulletinNotificationSource_dispatcher_setAllowsNotifications_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  v6 = a4;
  -[NCBulletinNotificationSource _modifySectionIdentifier:handler:](self, "_modifySectionIdentifier:handler:", a5, v5);
}

uint64_t __87__NCBulletinNotificationSource_dispatcher_setAllowsNotifications_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 32))
    v2 = 2;
  else
    v2 = 1;
  return objc_msgSend(a2, "setAuthorizationStatus:", v2);
}

- (void)dispatcher:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__NCBulletinNotificationSource_dispatcher_setDeliverQuietly_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  v6 = a4;
  -[NCBulletinNotificationSource _modifySectionIdentifier:handler:](self, "_modifySectionIdentifier:handler:", a5, v5);
}

uint64_t __82__NCBulletinNotificationSource_dispatcher_setDeliverQuietly_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deliverQuietly:", *(unsigned __int8 *)(a1 + 32));
}

- (void)dispatcher:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;

  v11 = a5;
  v12 = a7;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__NCBulletinNotificationSource_dispatcher_setMuted_untilDate_forSectionIdentifier_threadIdentifier___block_invoke;
  v15[3] = &unk_1E8D1F618;
  v18 = a4;
  v16 = v12;
  v17 = v11;
  v13 = v11;
  v14 = v12;
  -[NCBulletinNotificationSource _modifySectionIdentifier:handler:](self, "_modifySectionIdentifier:handler:", a6, v15);

}

void __100__NCBulletinNotificationSource_dispatcher_setMuted_untilDate_forSectionIdentifier_threadIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    if (v4)
      objc_msgSend(v3, "muteThreadIdentifier:untilDate:", v4, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v3, "muteSectionUntilDate:", *(_QWORD *)(a1 + 40));
  }
  else if (v4)
  {
    objc_msgSend(v3, "unmuteThreadIdentifier:");
  }
  else
  {
    objc_msgSend(v3, "unmuteSection");
  }

}

- (void)dispatcher:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__NCBulletinNotificationSource_dispatcher_setAllowsCriticalAlerts_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  v6 = a4;
  -[NCBulletinNotificationSource _modifySectionIdentifier:handler:](self, "_modifySectionIdentifier:handler:", a5, v5);
}

uint64_t __88__NCBulletinNotificationSource_dispatcher_setAllowsCriticalAlerts_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 32))
    v2 = 2;
  else
    v2 = 1;
  return objc_msgSend(a2, "setCriticalAlertSetting:", v2);
}

- (void)dispatcher:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__NCBulletinNotificationSource_dispatcher_setAllowsTimeSensitive_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  v6 = a4;
  -[NCBulletinNotificationSource _modifySectionIdentifier:handler:](self, "_modifySectionIdentifier:handler:", a5, v5);
}

void __87__NCBulletinNotificationSource_dispatcher_setAllowsTimeSensitive_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(a1 + 32))
    v2 = 2;
  else
    v2 = 1;
  v3 = a2;
  objc_msgSend(v3, "setTimeSensitiveSetting:", v2);
  objc_msgSend(v3, "setUserConfiguredTimeSensitiveSetting:", 1);

}

- (void)dispatcher:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__NCBulletinNotificationSource_dispatcher_setAllowsDirectMessages_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  v6 = a4;
  -[NCBulletinNotificationSource _modifySectionIdentifier:handler:](self, "_modifySectionIdentifier:handler:", a5, v5);
}

void __88__NCBulletinNotificationSource_dispatcher_setAllowsDirectMessages_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(a1 + 32))
    v2 = 2;
  else
    v2 = 1;
  v3 = a2;
  objc_msgSend(v3, "setDirectMessagesSetting:", v2);
  objc_msgSend(v3, "setUserConfiguredDirectMessagesSetting:", 1);

}

- (void)dispatcher:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__NCBulletinNotificationSource_dispatcher_setScheduledDelivery_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  v6 = a4;
  -[NCBulletinNotificationSource _modifySectionIdentifier:handler:](self, "_modifySectionIdentifier:handler:", a5, v5);
}

void __85__NCBulletinNotificationSource_dispatcher_setScheduledDelivery_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(a1 + 32))
    v2 = 2;
  else
    v2 = 1;
  v3 = a2;
  objc_msgSend(v3, "setScheduledDeliverySetting:", v2);
  objc_msgSend(v3, "makeAuthorizationPermanent");

}

- (void)dispatcher:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;
  id location;

  v7 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__NCBulletinNotificationSource_dispatcher_setSystemScheduledDeliveryEnabled_scheduledDeliveryTimes___block_invoke;
  v10[3] = &unk_1E8D1F640;
  objc_copyWeak(&v12, &location);
  v13 = a4;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __100__NCBulletinNotificationSource_dispatcher_setSystemScheduledDeliveryEnabled_scheduledDeliveryTimes___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "settingsGateway");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v4, "setEffectiveGlobalScheduledDeliverySetting:", v3);
  objc_msgSend(v4, "setEffectiveGlobalScheduledDeliveryTimes:", *(_QWORD *)(a1 + 32));

}

- (void)dispatcher:(id)a3 setNotificationSystemSettings:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__NCBulletinNotificationSource_dispatcher_setNotificationSystemSettings___block_invoke;
  block[3] = &unk_1E8D1CB40;
  objc_copyWeak(&v10, &location);
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __73__NCBulletinNotificationSource_dispatcher_setNotificationSystemSettings___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "settingsGateway");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "isScheduledDeliveryEnabled"))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v5, "setEffectiveGlobalScheduledDeliverySetting:", v3);
  objc_msgSend(*(id *)(a1 + 32), "scheduledDeliveryTimes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffectiveGlobalScheduledDeliveryTimes:", v4);
  objc_msgSend(v5, "setEffectiveGlobalNotificationListDisplayStyleSetting:", objc_msgSend(MEMORY[0x1E0DC6020], "bbListDisplayStyleSettingForNCNotificationListDisplayStyleSetting:", objc_msgSend(*(id *)(a1 + 32), "listDisplayStyleSetting")));

}

- (void)dispatcher:(id)a3 didExecuteAction:(id)a4 forNotificationRequest:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a5;
  v7 = a4;
  +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "executedActionWithIdentifier:forNotificationRequest:", v8, v6);
}

- (id)dispatcher:(id)a3 notificationRequestForUUID:(id)a4
{
  if (!a4)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_uuidsToRequests, "objectForKey:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_requestUUIDForBulletinPublisherMatchID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_bulletinsToUUIDs, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = (void *)objc_opt_new();
      -[NSMutableDictionary setObject:forKey:](self->_bulletinsToUUIDs, "setObject:forKey:", v5, v4);
    }
  }
  else
  {
    v6 = (void *)*MEMORY[0x1E0DC5F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_ERROR))
      -[NCBulletinNotificationSource _requestUUIDForBulletinPublisherMatchID:].cold.1(v6);
    v5 = (void *)objc_opt_new();
  }

  return v5;
}

- (void)_modifySectionIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__NCBulletinNotificationSource__modifySectionIdentifier_handler___block_invoke;
  v11[3] = &unk_1E8D1EC28;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __65__NCBulletinNotificationSource__modifySectionIdentifier_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "settingsGateway");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sectionInfoForSectionID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v5, "setSectionInfo:forSectionID:", v4, *(_QWORD *)(a1 + 32));

}

- (void)_applicationIconChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *MEMORY[0x1E0DC5F80];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEBUG))
        -[NCBulletinNotificationSource _applicationIconChanged:].cold.1((uint64_t)v6, v7);
      objc_initWeak(&location, self);
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__NCBulletinNotificationSource__applicationIconChanged___block_invoke;
      block[3] = &unk_1E8D1CB40;
      objc_copyWeak(&v11, &location);
      v10 = v6;
      dispatch_async(queue, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }

  }
}

void __56__NCBulletinNotificationSource__applicationIconChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "observer");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "requestNoticesBulletinsForSectionID:", *(_QWORD *)(a1 + 32));
}

- (id)_queue_sectionInfoForBulletin:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NCBulletinNotificationSource sectionInfoById](self, "sectionInfoById");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_bulletinsPerSectionIdForNotificationRequests:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "sectionIdentifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKey:", v12, v11);
        }
        objc_msgSend(v10, "bulletin");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bs_safeAddObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_bulletinsToClearPerSectionIdForNotificationRequests:(id)a3 removingDestinations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "sectionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "requestDestinations");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");

        objc_msgSend(v16, "minusSet:", v6);
        if ((objc_msgSend(v16, "containsObject:", CFSTR("BulletinDestinationLockScreen")) & 1) == 0
          && (objc_msgSend(v16, "containsObject:", CFSTR("BulletinDestinationNotificationCenter")) & 1) == 0)
        {
          if (!v14)
          {
            v14 = (void *)objc_opt_new();
            objc_msgSend(v7, "setObject:forKey:", v14, v13);
          }
          objc_msgSend(v12, "bulletin");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bs_safeAddObject:", v17);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v7;
}

- (unint64_t)_updateFeedForCoverSheetDestination:(unint64_t)a3 storedFeed:(unint64_t)a4
{
  BOOL v4;
  unint64_t v5;

  v4 = (a4 & 8) == 0 || (a3 & 1) == 0;
  v5 = a3 | 8;
  if (v4)
    v5 = a3;
  return v5 | a4 & ((v5 & 8) != 0);
}

- (id)_updatedRequestWithAlertOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "eventBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[DNDEventBehaviorResolutionService nc_behaviorForNotificationRequest:](self->_eventBehaviorResolutionService, "nc_behaviorForNotificationRequest:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[NCBulletinNotificationSource _alertOptionsWithBehavior:](self, "_alertOptionsWithBehavior:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v10, "setAlertOptions:", v9);
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

- (id)_alertOptionsWithBehavior:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0DC5FC0]);
  v5 = objc_msgSend(v3, "interruptionSuppression");
  if ((unint64_t)(v5 - 1) >= 2)
  {
    objc_msgSend(v4, "setSuppression:", 0);
    v9 = objc_msgSend(v3, "intelligentBehavior");
    if ((unint64_t)(v9 - 1) >= 3)
      v10 = 0;
    else
      v10 = v9;
    objc_msgSend(v4, "setIntelligentBehavior:", v10);
    v11 = objc_msgSend(v3, "resolutionReason") - 13;
    if (v11 > 6)
      v8 = 1;
    else
      v8 = qword_1CFD91D30[v11];
  }
  else
  {
    objc_msgSend(v4, "setSuppression:", v5);
    v6 = objc_msgSend(v3, "intelligentBehavior");
    if ((unint64_t)(v6 - 1) >= 3)
      v7 = 0;
    else
      v7 = v6;
    objc_msgSend(v4, "setIntelligentBehavior:", v7);
    v8 = 0;
  }
  objc_msgSend(v4, "setReason:", v8);
  objc_msgSend(v3, "activeModeUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActiveModeUUID:", v12);

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (BBObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (BBSettingsGateway)settingsGateway
{
  return self->_settingsGateway;
}

- (void)setSettingsGateway:(id)a3
{
  objc_storeStrong((id *)&self->_settingsGateway, a3);
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (void)setSectionInfoById:(id)a3
{
  objc_storeStrong((id *)&self->_sectionInfoById, a3);
}

- (NSMutableDictionary)bulletinFeeds
{
  return self->_bulletinFeeds;
}

- (void)setBulletinFeeds:(id)a3
{
  objc_storeStrong((id *)&self->_bulletinFeeds, a3);
}

- (NSMutableDictionary)bulletinsToUUIDs
{
  return self->_bulletinsToUUIDs;
}

- (void)setBulletinsToUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bulletinsToUUIDs, a3);
}

- (NSMutableDictionary)uuidsToRequests
{
  return self->_uuidsToRequests;
}

- (void)setUuidsToRequests:(id)a3
{
  objc_storeStrong((id *)&self->_uuidsToRequests, a3);
}

- (DNDEventBehaviorResolutionService)eventBehaviorResolutionService
{
  return self->_eventBehaviorResolutionService;
}

- (void)setEventBehaviorResolutionService:(id)a3
{
  objc_storeStrong((id *)&self->_eventBehaviorResolutionService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBehaviorResolutionService, 0);
  objc_storeStrong((id *)&self->_uuidsToRequests, 0);
  objc_storeStrong((id *)&self->_bulletinsToUUIDs, 0);
  objc_storeStrong((id *)&self->_bulletinFeeds, 0);
  objc_storeStrong((id *)&self->_sectionInfoById, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_requestUUIDForBulletinPublisherMatchID:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1CFC3D000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Requested uuid for bulletin without a publisherMatchID", (uint8_t *)&v4, 0xCu);

}

- (void)_applicationIconChanged:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1CFC3D000, a2, OS_LOG_TYPE_DEBUG, "App icon changed for section %{public}@. Requesting repost of notifications for this section.", (uint8_t *)&v2, 0xCu);
}

@end
