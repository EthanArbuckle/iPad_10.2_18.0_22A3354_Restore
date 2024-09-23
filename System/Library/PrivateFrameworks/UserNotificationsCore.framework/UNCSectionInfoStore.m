@implementation UNCSectionInfoStore

- (UNCSectionInfoStore)initWithEffectiveSettings:(id)a3 persistence:(id)a4
{
  id v7;
  id v8;
  UNCSectionInfoStore *v9;
  UNCSectionInfoStore *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *gatewayQueue;
  UNCBulletinServerConnection *v17;
  UNCBulletinServerConnection *bbServerConnection;
  NSObject *v19;
  UNCSectionInfoStore *v20;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *queue_sectionInfoByID;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *queue_clearedSectionsByID;
  _QWORD block[4];
  UNCSectionInfoStore *v29;
  objc_super v30;

  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)UNCSectionInfoStore;
  v9 = -[UNCSectionInfoStore init](&v30, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settings, a3);
    objc_storeStrong((id *)&v10->_persistence, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.usernotificationserver.SectionInfoStore", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.usernotificationserver.SectionInfoStore.gateway", v14);
    gatewayQueue = v10->_gatewayQueue;
    v10->_gatewayQueue = (OS_dispatch_queue *)v15;

    v17 = -[UNCBulletinServerConnection initWithQueue:]([UNCBulletinServerConnection alloc], "initWithQueue:", v10->_gatewayQueue);
    bbServerConnection = v10->_bbServerConnection;
    v10->_bbServerConnection = v17;

    v19 = v10->_gatewayQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__UNCSectionInfoStore_initWithEffectiveSettings_persistence___block_invoke;
    block[3] = &unk_251AE02A0;
    v20 = v10;
    v29 = v20;
    dispatch_async(v19, block);
    -[UNCNotificationSettingsPersistentStore readSectionInfo](v10->_persistence, "readSectionInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "mutableCopy");
    queue_sectionInfoByID = v20->_queue_sectionInfoByID;
    v20->_queue_sectionInfoByID = (NSMutableDictionary *)v22;

    -[UNCNotificationSettingsPersistentStore readClearedSections](v10->_persistence, "readClearedSections");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "mutableCopy");
    queue_clearedSectionsByID = v20->_queue_clearedSectionsByID;
    v20->_queue_clearedSectionsByID = (NSMutableDictionary *)v25;

  }
  return v10;
}

void __61__UNCSectionInfoStore_initWithEffectiveSettings_persistence___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  _QWORD *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "activeSectionIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[1];
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __61__UNCSectionInfoStore_initWithEffectiveSettings_persistence___block_invoke_2;
  v14 = &unk_251AE01A0;
  v15 = v4;
  v6 = v3;
  v16 = v6;
  dispatch_async(v5, &v11);
  v7 = (void *)*MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v9 = v7;
    v10 = objc_msgSend(v8, "count", v11, v12, v13, v14, v15);
    *(_DWORD *)buf = 134217984;
    v18 = v10;
    _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "Initial fetch of activeSectionIDs count: %lu", buf, 0xCu);

  }
}

void __61__UNCSectionInfoStore_initWithEffectiveSettings_persistence___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_sectionInfoForSectionID:(id)a3 effective:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKey:](self->_queue_sectionInfoByID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UNCSectionInfoStore _queue_effectiveSectionInfoForSectionInfo:](self, "_queue_effectiveSectionInfoForSectionInfo:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (v7 && (objc_msgSend(v7, "sectionID"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_ERROR))
      -[UNCSectionInfoStore _queue_sectionInfoForSectionID:effective:].cold.1((uint64_t)v6, (uint64_t)v7, v11);
    -[UNCSectionInfoStore _queue_removeSectionWithID:](self, "_queue_removeSectionWithID:", v6);
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__UNCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke;
  v11[3] = &unk_251AE1328;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v14 = a4;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __57__UNCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_sectionInfoForSectionID:effective:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v6, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNCSectionInfoStore _queue_sortSectionIDs:usingGuideArray:](self, "_queue_sortSectionIDs:usingGuideArray:", v10, self->_queue_sortedSectionIDs);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[UNCSectionInfoStore _queue_sectionInfoForSectionID:effective:](self, "_queue_sectionInfoForSectionID:effective:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), v4, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v7, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v7;
}

- (id)sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__UNCSectionInfoStore_sortedSectionInfoForSectionIDs_effective___block_invoke;
  v11[3] = &unk_251AE1328;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v14 = a4;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __64__UNCSectionInfoStore_sortedSectionInfoForSectionIDs_effective___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_sortedSectionInfoForSectionIDs:effective:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)sectionInfosByIDForSectionIDs:(id)a3 effective:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  UNCSectionInfoStore *v16;
  id v17;
  BOOL v18;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__UNCSectionInfoStore_sectionInfosByIDForSectionIDs_effective___block_invoke;
  v14[3] = &unk_251AE1350;
  v15 = v6;
  v16 = self;
  v18 = a4;
  v9 = v7;
  v17 = v9;
  v10 = v6;
  dispatch_sync(queue, v14);
  v11 = v17;
  v12 = v9;

  return v12;
}

void __63__UNCSectionInfoStore_sectionInfosByIDForSectionIDs_effective___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "_queue_sectionInfoForSectionID:effective:", v7, *(unsigned __int8 *)(a1 + 56), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)_queue_effectiveSectionInfoForSectionInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    objc_msgSend(v4, "factorySectionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5
      || (-[UNCSectionInfoStore _queue_sectionInfoForSectionID:effective:](self, "_queue_sectionInfoForSectionID:effective:", v5, 0), (v6 = objc_claimAutoreleasedReturnValue()) == 0)|| (v7 = (void *)v6, objc_msgSend(v4, "effectiveSectionInfoWithFactoryInfo:defaultContentPreviewSetting:globalAnnounceSetting:globalScheduledDeliverySetting:hasPairedVehiclesForCarPlay:hasDestinationForRemoteNotifications:", v6, -[UNCEffectiveSettings effectiveGlobalContentPreviewSetting](self->_settings, "effectiveGlobalContentPreviewSetting"), -[UNCEffectiveSettings effectiveGlobalAnnounceSetting](self->_settings, "effectiveGlobalAnnounceSetting"), -[UNCEffectiveSettings effectiveGlobalScheduledDeliverySetting](self->_settings, "effectiveGlobalScheduledDeliverySetting"), -[UNCEffectiveSettings hasPairedVehiclesForCarPlay](self->_settings, "hasPairedVehiclesForCarPlay"),
            1),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          !v8))
    {
      objc_msgSend(v4, "effectiveSectionInfoWithDefaultContentPreviewSetting:globalAnnounceSetting:globalScheduledDeliverySetting:hasPairedVehiclesForCarPlay:hasDestinationForRemoteNotifications:", -[UNCEffectiveSettings effectiveGlobalContentPreviewSetting](self->_settings, "effectiveGlobalContentPreviewSetting"), -[UNCEffectiveSettings effectiveGlobalAnnounceSetting](self->_settings, "effectiveGlobalAnnounceSetting"), -[UNCEffectiveSettings effectiveGlobalScheduledDeliverySetting](self->_settings, "effectiveGlobalScheduledDeliverySetting"), -[UNCEffectiveSettings hasPairedVehiclesForCarPlay](self->_settings, "hasPairedVehiclesForCarPlay"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)effectiveSectionInfoForSectionInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__14;
    v16 = __Block_byref_object_dispose__14;
    v17 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__UNCSectionInfoStore_effectiveSectionInfoForSectionInfo___block_invoke;
    block[3] = &unk_251AE0278;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(queue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __58__UNCSectionInfoStore_effectiveSectionInfoForSectionInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveSectionInfoForSectionInfo:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
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
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__UNCSectionInfoStore_setSectionInfo_forSectionID___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __51__UNCSectionInfoStore_setSectionInfo_forSectionID___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", a1[5], a1[6]);
  objc_msgSend(*(id *)(a1[4] + 72), "writeSectionInfo:", *(_QWORD *)(a1[4] + 24));
  return objc_msgSend(*(id *)(a1[4] + 64), "refreshSectionInfoForID:", a1[6]);
}

- (void)_queue_removeSectionWithID:(id)a3
{
  NSMutableDictionary *queue_sectionInfoByID;
  id v5;

  queue_sectionInfoByID = self->_queue_sectionInfoByID;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](queue_sectionInfoByID, "removeObjectForKey:", v5);
  -[NSMutableSet removeObject:](self->_queue_activeSectionIDs, "removeObject:", v5);
  -[NSMutableArray removeObject:](self->_queue_sortedSectionIDs, "removeObject:", v5);

  -[UNCNotificationSettingsPersistentStore writeSectionInfo:](self->_persistence, "writeSectionInfo:", self->_queue_sectionInfoByID);
  -[UNCNotificationSettingsPersistentStore writeClearedSections:](self->_persistence, "writeClearedSections:", self->_queue_clearedSectionsByID);
}

- (void)removeSectionWithID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__UNCSectionInfoStore_removeSectionWithID___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __43__UNCSectionInfoStore_removeSectionWithID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeSectionWithID:", *(_QWORD *)(a1 + 40));
}

- (void)addActiveSectionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__UNCSectionInfoStore_addActiveSectionID___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __42__UNCSectionInfoStore_addActiveSectionID___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (id)activeSectionIDs
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__UNCSectionInfoStore_activeSectionIDs__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__UNCSectionInfoStore_activeSectionIDs__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (id)allSortedActiveSections:(BOOL)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__14;
  v12 = __Block_byref_object_dispose__14;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__UNCSectionInfoStore_allSortedActiveSections___block_invoke;
  block[3] = &unk_251AE1378;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(queue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __47__UNCSectionInfoStore_allSortedActiveSections___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_sortedSectionInfoForSectionIDs:effective:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(unsigned __int8 *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)sortedSectionIDs
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__UNCSectionInfoStore_sortedSectionIDs__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__UNCSectionInfoStore_sortedSectionIDs__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)_queue_sortSectionIDs:(id)a3 usingGuideArray:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  os_log_t *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id obj;
  uint64_t v36;
  UNCSectionInfoStore *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v37 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_msgSend(v7, "count");
    if (v6 != v7)
    {
      if (v8)
      {
        v34 = v7;
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v6, "mutableCopy");
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v33 = v6;
        obj = v6;
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        if (v39)
        {
          v36 = *(_QWORD *)v56;
          v11 = (os_log_t *)MEMORY[0x24BDF89F8];
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v56 != v36)
                objc_enumerationMutation(obj);
              v44 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
              -[UNCSectionInfoStore _queue_sectionInfoForSectionID:effective:](v37, "_queue_sectionInfoForSectionID:effective:");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "dataProviderIDs");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v14, "count"))
              {
                v41 = v13;
                v42 = i;
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = 0u;
                v52 = 0u;
                v53 = 0u;
                v54 = 0u;
                v40 = v14;
                v16 = v14;
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v52;
                  do
                  {
                    for (j = 0; j != v18; ++j)
                    {
                      if (*(_QWORD *)v52 != v19)
                        objc_enumerationMutation(v16);
                      v21 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
                      if (objc_msgSend(v10, "containsObject:", v21))
                      {
                        if ((objc_msgSend(v9, "containsObject:", v21) & 1) == 0)
                          objc_msgSend(v15, "addObject:", v21);
                      }
                      else
                      {
                        v22 = *v11;
                        if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          v61 = v21;
                          v62 = 2112;
                          v63 = v44;
                          _os_log_error_impl(&dword_2499A5000, v22, OS_LOG_TYPE_ERROR, "UNCSectionInfoStore: unknown subsection \"%@\" (of \"%@\") cannot be sorted.", buf, 0x16u);
                        }
                      }
                    }
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
                  }
                  while (v18);
                }

                if (objc_msgSend(v15, "count"))
                {
                  objc_msgSend(v38, "setObject:forKey:", v15, v44);
                  objc_msgSend(v43, "removeObjectsInArray:", v15);
                }

                v13 = v41;
                i = v42;
                v14 = v40;
              }

            }
            v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
          }
          while (v39);
        }

        v49[0] = MEMORY[0x24BDAC760];
        v49[1] = 3221225472;
        v49[2] = __61__UNCSectionInfoStore__queue_sortSectionIDs_usingGuideArray___block_invoke;
        v49[3] = &unk_251AE13A0;
        v50 = v34;
        objc_msgSend(v43, "sortUsingComparator:", v49);
        v23 = v38;
        if (objc_msgSend(v38, "count"))
        {
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend(v38, "allKeys");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v46;
            do
            {
              for (k = 0; k != v26; ++k)
              {
                if (*(_QWORD *)v46 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
                objc_msgSend(v38, "objectForKey:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v43, "indexOfObject:", v29);
                if (v31 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v31 + 1, objc_msgSend(v30, "count"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "insertObjects:atIndexes:", v30, v32);

                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
            }
            while (v26);
          }

          v23 = v38;
        }
        objc_msgSend(obj, "removeAllObjects");
        objc_msgSend(obj, "addObjectsFromArray:", v43);

        v6 = v33;
        v7 = v34;
      }
    }
  }

}

uint64_t __61__UNCSectionInfoStore__queue_sortSectionIDs_usingGuideArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEqual:", v5, (_QWORD)v15) & 1) != 0)
          {
            v7 = -1;
            goto LABEL_16;
          }
          if ((objc_msgSend(v13, "isEqual:", v6) & 1) != 0)
          {
            v7 = 1;
            goto LABEL_16;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v7 = 0;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v7 = 0;
    }
LABEL_16:

  }
  return v7;
}

- (id)allUnsortedSectionInfoIDs
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__UNCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__UNCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allSortedSectionInfo:(BOOL)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__14;
  v12 = __Block_byref_object_dispose__14;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__UNCSectionInfoStore_allSortedSectionInfo___block_invoke;
  block[3] = &unk_251AE13C8;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(queue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __44__UNCSectionInfoStore_allSortedSectionInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_sortedSectionInfoForSectionIDs:effective:", v5, *(unsigned __int8 *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)sectionInfoByID
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__UNCSectionInfoStore_sectionInfoByID__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__UNCSectionInfoStore_sectionInfoByID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSectionInfoByID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__UNCSectionInfoStore_setSectionInfoByID___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __42__UNCSectionInfoStore_setSectionInfoByID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (id)clearedInfoForSectionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__UNCSectionInfoStore_clearedInfoForSectionID___block_invoke;
  block[3] = &unk_251AE0278;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __47__UNCSectionInfoStore_clearedInfoForSectionID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)clearedSectionsByID
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__UNCSectionInfoStore_clearedSectionsByID__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__UNCSectionInfoStore_clearedSectionsByID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)setClearedInfo:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  UNCSectionInfoStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__UNCSectionInfoStore_setClearedInfo_forSectionID___block_invoke;
  block[3] = &unk_251AE0250;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __51__UNCSectionInfoStore_setClearedInfo_forSectionID___block_invoke(_QWORD *a1)
{
  void *v2;
  char v3;

  if (a1[4]
    && (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isEqual:", a1[4]),
        v2,
        (v3 & 1) == 0))
  {
    return objc_msgSend(*(id *)(a1[5] + 48), "setObject:forKey:", a1[4], a1[6]);
  }
  else
  {
    return objc_msgSend(*(id *)(a1[5] + 48), "removeObjectForKey:", a1[6]);
  }
}

- (void)setClearedSectionsByID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__UNCSectionInfoStore_setClearedSectionsByID___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __46__UNCSectionInfoStore_setClearedSectionsByID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_bbServerConnection, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_queue_clearedSectionsByID, 0);
  objc_storeStrong((id *)&self->_queue_sortedSectionIDs, 0);
  objc_storeStrong((id *)&self->_queue_activeSectionIDs, 0);
  objc_storeStrong((id *)&self->_queue_sectionInfoByID, 0);
  objc_storeStrong((id *)&self->_gatewayQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_sectionInfoForSectionID:(os_log_t)log effective:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2499A5000, log, OS_LOG_TYPE_ERROR, "Produced invalid sectionInfo without ID for %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
