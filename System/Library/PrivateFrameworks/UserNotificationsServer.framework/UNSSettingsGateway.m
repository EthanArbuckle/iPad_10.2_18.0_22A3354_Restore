@implementation UNSSettingsGateway

void __55__UNSSettingsGateway_effectiveSectionInfoForSectionID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveSectionInfoForSectionID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_effectiveSectionInfoForSectionID:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BDF89F8];
  v6 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_216DCB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting effective section info", (uint8_t *)&v10, 0xCu);
  }
  -[BBSettingsGateway effectiveSectionInfoForSectionID:](self->_settingsGateway, "effectiveSectionInfoForSectionID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v4;
    v12 = 1024;
    v13 = v7 != 0;
    _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got effective section info [ hasResult: %d ]", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

- (id)sectionInfoForSectionID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Getting sectionInfo for section identifier: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__UNSSettingsGateway_sectionInfoForSectionID___block_invoke;
  block[3] = &unk_24D63A2C0;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)effectiveSectionInfoForSectionID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Getting effectiveSectionInfo for section identifier: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__UNSSettingsGateway_effectiveSectionInfoForSectionID___block_invoke;
  block[3] = &unk_24D63A2C0;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __46__UNSSettingsGateway_sectionInfoForSectionID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_sectionInfoForSectionID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_sectionInfoForSectionID:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BDF89F8];
  v6 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_216DCB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting section info", (uint8_t *)&v10, 0xCu);
  }
  -[BBSettingsGateway sectionInfoForSectionID:](self->_settingsGateway, "sectionInfoForSectionID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v4;
    v12 = 1024;
    v13 = v7 != 0;
    _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got section info [ hasResult: %d ]", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

void __49__UNSSettingsGateway_observer_updateSectionInfo___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCF20]);
  objc_msgSend(*(id *)(a1 + 32), "sectionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithObjects:", v3, 0);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "settingsGateway:didUpdateSectionInfoForSectionIDs:", *(_QWORD *)(a1 + 40), v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  UNSSettingsGateway *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__UNSSettingsGateway_observer_updateSectionInfo___block_invoke;
  v8[3] = &unk_24D639C20;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __50__UNSSettingsGateway_setSectionInfo_forSectionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setSectionInfo:forSectionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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
  block[2] = __50__UNSSettingsGateway_setSectionInfo_forSectionID___block_invoke;
  block[3] = &unk_24D639EA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_queue_setSectionInfo:(id)a3 forSectionID:(id)a4
{
  -[BBSettingsGateway setSectionInfo:forSectionID:](self->_settingsGateway, "setSectionInfo:forSectionID:", a3, a4);
}

- (UNSSettingsGateway)init
{
  UNSSettingsGateway *v2;
  NSMutableArray *v3;
  NSMutableArray *observers;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  BBSettingsGateway *settingsGateway;
  uint64_t v10;
  BBObserver *settingsObserver;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UNSSettingsGateway;
  v2 = -[UNSSettingsGateway init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observers = v2->_observers;
    v2->_observers = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.usernotificationsserver.SettingsGateway", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE0FE98]), "initWithQueue:", v2->_queue);
    settingsGateway = v2->_settingsGateway;
    v2->_settingsGateway = (BBSettingsGateway *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE0FE68]), "initWithQueue:", v2->_queue);
    settingsObserver = v2->_settingsObserver;
    v2->_settingsObserver = (BBObserver *)v10;

    -[BBObserver setObserverFeed:](v2->_settingsObserver, "setObserverFeed:", 512);
    -[BBObserver setDelegate:](v2->_settingsObserver, "setDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BBSettingsGateway invalidate](self->_settingsGateway, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UNSSettingsGateway;
  -[UNSSettingsGateway dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
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
  block[2] = __34__UNSSettingsGateway_addObserver___block_invoke;
  block[3] = &unk_24D639C20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __34__UNSSettingsGateway_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
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
  block[2] = __37__UNSSettingsGateway_removeObserver___block_invoke;
  block[3] = &unk_24D639C20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __37__UNSSettingsGateway_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:", *(_QWORD *)(a1 + 40));
}

- (id)effectiveSectionInfoForSectionIDs:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Getting effectiveSectionInfos for section identifiers: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__UNSSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke;
  block[3] = &unk_24D63A2C0;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __56__UNSSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveSectionInfosForSectionIDs:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)sectionInfoForSectionIDs:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Getting sectionInfos for section identifiers: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__UNSSettingsGateway_sectionInfoForSectionIDs___block_invoke;
  block[3] = &unk_24D63A2C0;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __47__UNSSettingsGateway_sectionInfoForSectionIDs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_sectionInfosForSectionIDs:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "Getting sectionInfos for section identifiers: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__UNSSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke;
  block[3] = &unk_24D639998;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

uint64_t __65__UNSSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_getSectionInfoForSectionIDs:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)allEffectiveSectionInfo
{
  NSObject *v3;
  NSObject *queue;
  id v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  v14 = 0;
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting allEffectiveSectionInfos", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__UNSSettingsGateway_allEffectiveSectionInfo__block_invoke;
  v7[3] = &unk_24D63ABA8;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __45__UNSSettingsGateway_allEffectiveSectionInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_allEffectiveSectionInfos");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allSectionInfo
{
  NSObject *v3;
  NSObject *queue;
  id v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  v14 = 0;
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting allSectionInfos", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__UNSSettingsGateway_allSectionInfo__block_invoke;
  v7[3] = &unk_24D63ABA8;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __36__UNSSettingsGateway_allSectionInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_allSectionInfos");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)globalContentPreviewSetting
{
  NSObject *v3;
  NSObject *queue;
  int64_t v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalContentPreviewSetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__UNSSettingsGateway_globalContentPreviewSetting__block_invoke;
  v7[3] = &unk_24D63ABA8;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __49__UNSSettingsGateway_globalContentPreviewSetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalContentPreviewSetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalContentPreviewSetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__UNSSettingsGateway_setGlobalContentPreviewSetting___block_invoke;
  v4[3] = &unk_24D63ABD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __53__UNSSettingsGateway_setGlobalContentPreviewSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalContentPreviewSetting:", *(_QWORD *)(a1 + 40));
}

- (int64_t)globalAnnounceSetting
{
  NSObject *v3;
  NSObject *queue;
  int64_t v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalAnnounceSetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__UNSSettingsGateway_globalAnnounceSetting__block_invoke;
  v7[3] = &unk_24D63ABA8;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __43__UNSSettingsGateway_globalAnnounceSetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalAnnounceSetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceSetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__UNSSettingsGateway_setGlobalAnnounceSetting___block_invoke;
  v4[3] = &unk_24D63ABD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __47__UNSSettingsGateway_setGlobalAnnounceSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalAnnounceSetting:", *(_QWORD *)(a1 + 40));
}

- (int64_t)globalAnnounceHeadphonesSetting
{
  NSObject *v3;
  NSObject *queue;
  int64_t v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalAnnounceHeadphonesSetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__UNSSettingsGateway_globalAnnounceHeadphonesSetting__block_invoke;
  v7[3] = &unk_24D63ABA8;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __53__UNSSettingsGateway_globalAnnounceHeadphonesSetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalAnnounceHeadphonesSetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__UNSSettingsGateway_setGlobalAnnounceHeadphonesSetting___block_invoke;
  v4[3] = &unk_24D63ABD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __57__UNSSettingsGateway_setGlobalAnnounceHeadphonesSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalAnnounceHeadphonesSetting:", *(_QWORD *)(a1 + 40));
}

- (int64_t)globalAnnounceCarPlaySetting
{
  NSObject *v3;
  NSObject *queue;
  int64_t v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalAnnounceCarPlaySetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__UNSSettingsGateway_globalAnnounceCarPlaySetting__block_invoke;
  v7[3] = &unk_24D63ABA8;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __50__UNSSettingsGateway_globalAnnounceCarPlaySetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalAnnounceCarPlaySetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__UNSSettingsGateway_setGlobalAnnounceCarPlaySetting___block_invoke;
  v4[3] = &unk_24D63ABD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __54__UNSSettingsGateway_setGlobalAnnounceCarPlaySetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalAnnounceCarPlaySetting:", *(_QWORD *)(a1 + 40));
}

- (int64_t)globalScheduledDeliverySetting
{
  NSObject *v3;
  NSObject *queue;
  int64_t v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalScheduledDeliverySetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__UNSSettingsGateway_globalScheduledDeliverySetting__block_invoke;
  v7[3] = &unk_24D63ABA8;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __52__UNSSettingsGateway_globalScheduledDeliverySetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliverySetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalScheduledDeliverySetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__UNSSettingsGateway_setGlobalScheduledDeliverySetting___block_invoke;
  v4[3] = &unk_24D63ABD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __56__UNSSettingsGateway_setGlobalScheduledDeliverySetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalScheduledDeliverySetting:", *(_QWORD *)(a1 + 40));
}

- (id)globalScheduledDeliveryTimes
{
  NSObject *v3;
  NSObject *queue;
  id v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  v14 = 0;
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalScheduledDeliveryTimes", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__UNSSettingsGateway_globalScheduledDeliveryTimes__block_invoke;
  v7[3] = &unk_24D63ABA8;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __50__UNSSettingsGateway_globalScheduledDeliveryTimes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliveryTimes");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setGlobalScheduledDeliveryTimes:(id)a3
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
  block[2] = __54__UNSSettingsGateway_setGlobalScheduledDeliveryTimes___block_invoke;
  block[3] = &unk_24D639C20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __54__UNSSettingsGateway_setGlobalScheduledDeliveryTimes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalScheduledDeliveryTimes:", *(_QWORD *)(a1 + 40));
}

- (int64_t)globalScheduledDeliveryShowNextSummarySetting
{
  NSObject *v3;
  NSObject *queue;
  int64_t v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalScheduledDeliveryShowNextSummarySetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__UNSSettingsGateway_globalScheduledDeliveryShowNextSummarySetting__block_invoke;
  v7[3] = &unk_24D63ABA8;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __67__UNSSettingsGateway_globalScheduledDeliveryShowNextSummarySetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliveryShowNextSummarySetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__UNSSettingsGateway_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke;
  v4[3] = &unk_24D63ABD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __71__UNSSettingsGateway_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalScheduledDeliveryShowNextSummarySetting:", *(_QWORD *)(a1 + 40));
}

- (int64_t)globalNotificationListDisplayStyleSetting
{
  NSObject *v3;
  NSObject *queue;
  int64_t v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalNotificationListDisplayStyleSetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__UNSSettingsGateway_globalNotificationListDisplayStyleSetting__block_invoke;
  v7[3] = &unk_24D63ABA8;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __63__UNSSettingsGateway_globalNotificationListDisplayStyleSetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalNotificationListDisplayStyleSetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__UNSSettingsGateway_setGlobalNotificationListDisplayStyleSetting___block_invoke;
  v4[3] = &unk_24D63ABD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __67__UNSSettingsGateway_setGlobalNotificationListDisplayStyleSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalNotificationListDisplayStyleSetting:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_addObserver:(id)a3
{
  -[NSMutableArray addObject:](self->_observers, "addObject:", a3);
}

- (void)_queue_removeObserver:(id)a3
{
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", a3);
}

- (id)_queue_effectiveSectionInfosForSectionIDs:(id)a3
{
  id v4;
  NSObject *v5;
  BBSettingsGateway *settingsGateway;
  void *v7;
  int v9;
  BBSettingsGateway *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v9 = 138543362;
    v10 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Getting effective section infos from settingsGateway: [%{public}@]", (uint8_t *)&v9, 0xCu);
  }
  -[BBSettingsGateway effectiveSectionInfoForSectionIDs:](self->_settingsGateway, "effectiveSectionInfoForSectionIDs:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_queue_sectionInfosForSectionIDs:(id)a3
{
  id v4;
  NSObject *v5;
  BBSettingsGateway *settingsGateway;
  void *v7;
  int v9;
  BBSettingsGateway *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v9 = 138543362;
    v10 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Getting section infos from settingsGateway: [%{public}@]", (uint8_t *)&v9, 0xCu);
  }
  -[BBSettingsGateway sectionInfoForSectionIDs:](self->_settingsGateway, "sectionInfoForSectionIDs:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_queue_getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  BBSettingsGateway *settingsGateway;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  settingsGateway = self->_settingsGateway;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__UNSSettingsGateway__queue_getSectionInfoForSectionIDs_withCompletion___block_invoke;
  v11[3] = &unk_24D63ABF8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[BBSettingsGateway getSectionInfoForSectionIDs:withCompletion:](settingsGateway, "getSectionInfoForSectionIDs:withCompletion:", v10, v11);

}

void __72__UNSSettingsGateway__queue_getSectionInfoForSectionIDs_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 1024;
    v9 = v3 != 0;
    _os_log_impl(&dword_216DCB000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got section infos [ hasResult: %d ]", (uint8_t *)&v6, 0x12u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_queue_allEffectiveSectionInfos
{
  NSObject *v3;
  BBSettingsGateway *settingsGateway;
  int v6;
  BBSettingsGateway *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v6 = 138543362;
    v7 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting all effective section infos from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  -[BBSettingsGateway allEffectiveSectionInfo](self->_settingsGateway, "allEffectiveSectionInfo");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_queue_allSectionInfos
{
  NSObject *v3;
  BBSettingsGateway *settingsGateway;
  int v6;
  BBSettingsGateway *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v6 = 138543362;
    v7 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting all section infos from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  -[BBSettingsGateway allSectionInfo](self->_settingsGateway, "allSectionInfo");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_queue_globalContentPreviewSetting
{
  NSObject *v3;
  BBSettingsGateway *settingsGateway;
  int v6;
  BBSettingsGateway *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v6 = 138543362;
    v7 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalContentPreviewSetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return -[BBSettingsGateway effectiveGlobalContentPreviewsSetting](self->_settingsGateway, "effectiveGlobalContentPreviewsSetting");
}

- (void)_queue_setGlobalContentPreviewSetting:(int64_t)a3
{
  NSObject *v5;
  BBSettingsGateway *settingsGateway;
  int v7;
  BBSettingsGateway *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v7 = 138543362;
    v8 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalContentPreviewSetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  -[BBSettingsGateway setEffectiveGlobalContentPreviewsSetting:](self->_settingsGateway, "setEffectiveGlobalContentPreviewsSetting:", a3);
}

- (int64_t)_queue_globalAnnounceSetting
{
  NSObject *v3;
  BBSettingsGateway *settingsGateway;
  int v6;
  BBSettingsGateway *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v6 = 138543362;
    v7 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalAnnounceSetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return -[BBSettingsGateway effectiveGlobalAnnounceSetting](self->_settingsGateway, "effectiveGlobalAnnounceSetting");
}

- (void)_queue_setGlobalAnnounceSetting:(int64_t)a3
{
  NSObject *v5;
  BBSettingsGateway *settingsGateway;
  int v7;
  BBSettingsGateway *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v7 = 138543362;
    v8 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalAnnounceSetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  -[BBSettingsGateway setEffectiveGlobalAnnounceSetting:](self->_settingsGateway, "setEffectiveGlobalAnnounceSetting:", a3);
}

- (int64_t)_queue_globalAnnounceHeadphonesSetting
{
  NSObject *v3;
  BBSettingsGateway *settingsGateway;
  int v6;
  BBSettingsGateway *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v6 = 138543362;
    v7 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalAnnounceHeadphonesSetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return -[BBSettingsGateway effectiveGlobalAnnounceHeadphonesSetting](self->_settingsGateway, "effectiveGlobalAnnounceHeadphonesSetting");
}

- (void)_queue_setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  NSObject *v5;
  BBSettingsGateway *settingsGateway;
  int v7;
  BBSettingsGateway *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v7 = 138543362;
    v8 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalAnnounceHeadphonesSetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  -[BBSettingsGateway setEffectiveGlobalAnnounceHeadphonesSetting:](self->_settingsGateway, "setEffectiveGlobalAnnounceHeadphonesSetting:", a3);
}

- (int64_t)_queue_globalAnnounceCarPlaySetting
{
  NSObject *v3;
  BBSettingsGateway *settingsGateway;
  int v6;
  BBSettingsGateway *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v6 = 138543362;
    v7 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalAnnounceCarPlaySetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return -[BBSettingsGateway effectiveGlobalAnnounceCarPlaySetting](self->_settingsGateway, "effectiveGlobalAnnounceCarPlaySetting");
}

- (void)_queue_setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  NSObject *v5;
  BBSettingsGateway *settingsGateway;
  int v7;
  BBSettingsGateway *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v7 = 138543362;
    v8 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalAnnounceCarPlaySetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  -[BBSettingsGateway setEffectiveGlobalAnnounceCarPlaySetting:](self->_settingsGateway, "setEffectiveGlobalAnnounceCarPlaySetting:", a3);
}

- (int64_t)_queue_globalScheduledDeliverySetting
{
  NSObject *v3;
  BBSettingsGateway *settingsGateway;
  int v6;
  BBSettingsGateway *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v6 = 138543362;
    v7 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalScheduledDeliverySetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return -[BBSettingsGateway effectiveGlobalScheduledDeliverySetting](self->_settingsGateway, "effectiveGlobalScheduledDeliverySetting");
}

- (void)_queue_setGlobalScheduledDeliverySetting:(int64_t)a3
{
  NSObject *v5;
  BBSettingsGateway *settingsGateway;
  int v7;
  BBSettingsGateway *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v7 = 138543362;
    v8 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalScheduledDeliverySetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  -[BBSettingsGateway setEffectiveGlobalScheduledDeliverySetting:](self->_settingsGateway, "setEffectiveGlobalScheduledDeliverySetting:", a3);
}

- (id)_queue_globalScheduledDeliveryTimes
{
  NSObject *v3;
  BBSettingsGateway *settingsGateway;
  int v6;
  BBSettingsGateway *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v6 = 138543362;
    v7 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalScheduledDeliveryTimes from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  -[BBSettingsGateway effectiveGlobalScheduledDeliveryTimes](self->_settingsGateway, "effectiveGlobalScheduledDeliveryTimes");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_queue_setGlobalScheduledDeliveryTimes:(id)a3
{
  id v4;
  NSObject *v5;
  BBSettingsGateway *settingsGateway;
  int v7;
  BBSettingsGateway *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v7 = 138543362;
    v8 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalScheduledDeliveryTimes from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  -[BBSettingsGateway setEffectiveGlobalScheduledDeliveryTimes:](self->_settingsGateway, "setEffectiveGlobalScheduledDeliveryTimes:", v4);

}

- (int64_t)_queue_globalScheduledDeliveryShowNextSummarySetting
{
  NSObject *v3;
  BBSettingsGateway *settingsGateway;
  int v6;
  BBSettingsGateway *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v6 = 138543362;
    v7 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalScheduledDeliveryShowNextSummarySetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return -[BBSettingsGateway effectiveGlobalScheduledDeliveryShowNextSummarySetting](self->_settingsGateway, "effectiveGlobalScheduledDeliveryShowNextSummarySetting");
}

- (void)_queue_setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  NSObject *v5;
  BBSettingsGateway *settingsGateway;
  int v7;
  BBSettingsGateway *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v7 = 138543362;
    v8 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalScheduledDeliveryShowNextSummarySetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  -[BBSettingsGateway setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:](self->_settingsGateway, "setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:", a3);
}

- (int64_t)_queue_globalNotificationListDisplayStyleSetting
{
  NSObject *v3;
  BBSettingsGateway *settingsGateway;
  int v6;
  BBSettingsGateway *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v6 = 138543362;
    v7 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalNotificationListDisplayStyleSetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return -[BBSettingsGateway effectiveGlobalNotificationListDisplayStyleSetting](self->_settingsGateway, "effectiveGlobalNotificationListDisplayStyleSetting");
}

- (void)_queue_setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  NSObject *v5;
  BBSettingsGateway *settingsGateway;
  int v7;
  BBSettingsGateway *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    v7 = 138543362;
    v8 = settingsGateway;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalNotificationListDisplayStyleSetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  -[BBSettingsGateway setEffectiveGlobalNotificationListDisplayStyleSetting:](self->_settingsGateway, "setEffectiveGlobalNotificationListDisplayStyleSetting:", a3);
}

- (void)observer:(id)a3 updateGlobalSettings:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__UNSSettingsGateway_observer_updateGlobalSettings___block_invoke;
  v8[3] = &unk_24D639C20;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __52__UNSSettingsGateway_observer_updateGlobalSettings___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "settingsGateway:didUpdateGlobalSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsObserver, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
