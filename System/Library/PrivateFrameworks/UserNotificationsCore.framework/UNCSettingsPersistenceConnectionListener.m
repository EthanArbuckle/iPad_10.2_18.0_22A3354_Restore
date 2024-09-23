@implementation UNCSettingsPersistenceConnectionListener

- (UNCSettingsPersistenceConnectionListener)init
{
  UNCNotificationSettingsPersistentStore *v3;
  UNCSettingsPersistenceConnectionListener *v4;

  v3 = objc_alloc_init(UNCNotificationSettingsPersistentStore);
  v4 = -[UNCSettingsPersistenceConnectionListener initWithPersistentStore:](self, "initWithPersistentStore:", v3);

  return v4;
}

- (UNCSettingsPersistenceConnectionListener)initWithPersistentStore:(id)a3
{
  id v5;
  UNCSettingsPersistenceConnectionListener *v6;
  UNCSettingsPersistenceConnectionListener *v7;
  uint64_t v8;
  UNCBulletinDefaults *bulletinDefaults;
  UNCEffectiveSettings *v10;
  UNCEffectiveSettings *effectiveSettingsProvider;
  UNCSectionInfoStore *v12;
  UNCSectionInfoStore *sectionInfoStore;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  UNCSettingsPersistenceConnectionListener *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UNCSettingsPersistenceConnectionListener;
  v6 = -[UNCSettingsPersistenceConnectionListener init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistentSettingsStore, a3);
    +[UNCBulletinDefaults standardDefaults](UNCBulletinDefaults, "standardDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    bulletinDefaults = v7->_bulletinDefaults;
    v7->_bulletinDefaults = (UNCBulletinDefaults *)v8;

    v10 = -[UNCEffectiveSettings initWithBulletinDefaults:]([UNCEffectiveSettings alloc], "initWithBulletinDefaults:", v7->_bulletinDefaults);
    effectiveSettingsProvider = v7->_effectiveSettingsProvider;
    v7->_effectiveSettingsProvider = v10;

    v12 = -[UNCSectionInfoStore initWithEffectiveSettings:persistence:]([UNCSectionInfoStore alloc], "initWithEffectiveSettings:persistence:", v7->_effectiveSettingsProvider, v7->_persistentSettingsStore);
    sectionInfoStore = v7->_sectionInfoStore;
    v7->_sectionInfoStore = v12;

    v14 = *MEMORY[0x24BDF89D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_2499A5000, v14, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener created %@", buf, 0xCu);
    }
  }

  return v7;
}

- (void)activate
{
  NSXPCListener *v3;
  NSXPCListener *listener;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.bulletinboard.settingspersistenceconnection"));
  listener = self->_listener;
  self->_listener = v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener activate](self->_listener, "activate");
  v5 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener activated for com.apple.bulletinboard.settingspersistenceconnection", v6, 2u);
  }
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener dealloc", buf, 2u);
  }
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)UNCSettingsPersistenceConnectionListener;
  -[UNCSettingsPersistenceConnectionListener dealloc](&v4, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSMutableArray *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[UNCSettingsRemotePersistenceService clientInterface](UNCSettingsRemotePersistenceService, "clientInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);

  +[UNCSettingsRemotePersistenceService serverInterface](UNCSettingsRemotePersistenceService, "serverInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v9);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x24BE0BDB8], "tokenFromNSXPCConnection:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "pid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v12;
    _os_log_impl(&dword_2499A5000, v14, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener accepting connection %@", buf, 0xCu);
  }
  v15 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __79__UNCSettingsPersistenceConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
  v25[3] = &unk_251AE02A0;
  v16 = v12;
  v26 = v16;
  objc_msgSend(v7, "setInterruptionHandler:", v25);
  v20 = v15;
  v21 = 3221225472;
  v22 = __79__UNCSettingsPersistenceConnectionListener_listener_shouldAcceptNewConnection___block_invoke_10;
  v23 = &unk_251AE02A0;
  v17 = v16;
  v24 = v17;
  objc_msgSend(v7, "setInvalidationHandler:", &v20);
  objc_msgSend(v7, "resume", v20, v21, v22, v23);
  v18 = self->_connections;
  objc_sync_enter(v18);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v7);
  objc_sync_exit(v18);

  return 1;
}

void __79__UNCSettingsPersistenceConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_2499A5000, v2, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener client connection interrupted: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __79__UNCSettingsPersistenceConnectionListener_listener_shouldAcceptNewConnection___block_invoke_10(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_2499A5000, v2, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener client connection invalidated: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4 withHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v10 = (void *)*MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = v10;
    objc_msgSend(v11, "numberWithBool:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_2499A5000, v12, OS_LOG_TYPE_DEFAULT, "Retrieving sectionInfo for %@ effective: %@", (uint8_t *)&v15, 0x16u);

  }
  -[UNCSectionInfoStore sectionInfoForSectionID:effective:](self->_sectionInfoStore, "sectionInfoForSectionID:effective:", v8, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v9[2](v9, v14, 0);

}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  os_log_t *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (os_log_t *)MEMORY[0x24BDF89D8];
  v12 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v9;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_2499A5000, v12, OS_LOG_TYPE_DEFAULT, "Setting sectionInfo for ID %@: %@", (uint8_t *)&v14, 0x16u);
  }
  if (v8)
  {
    -[UNCSectionInfoStore setSectionInfo:forSectionID:](self->_sectionInfoStore, "setSectionInfo:forSectionID:", v8, v9);
    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  v13 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
  {
    -[UNCSettingsPersistenceConnectionListener setSectionInfo:forSectionID:withHandler:].cold.1((uint64_t)v9, v13);
    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v10)
LABEL_8:
    v10[2](v10);
LABEL_9:

}

- (void)removeSectionWithID:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "Removing section with ID %@", (uint8_t *)&v9, 0xCu);
  }
  -[UNCSectionInfoStore removeSectionWithID:](self->_sectionInfoStore, "removeSectionWithID:", v6);
  if (v7)
    v7[2](v7);

}

- (void)allSectionIDsWithHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[UNCSectionInfoStore allUnsortedSectionInfoIDs](self->_sectionInfoStore, "allUnsortedSectionInfoIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "Reading allSectionIDs. Count: %lu", (uint8_t *)&v8, 0xCu);

  }
  if (v4)
    v4[2](v4, v5, 0);

}

- (void)allSectionInfosByIDWithHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[UNCSectionInfoStore sectionInfoByID](self->_sectionInfoStore, "sectionInfoByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "Reading allSectionInfosByID. Count %lu", (uint8_t *)&v8, 0xCu);

  }
  if (v4)
    v4[2](v4, v5, 0);

}

- (void)activeSectionIDsWithHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[UNCSectionInfoStore activeSectionIDs](self->_sectionInfoStore, "activeSectionIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "Reading activeSectionIDs. Count %lu", (uint8_t *)&v8, 0xCu);

  }
  if (v4)
    v4[2](v4, v5, 0);

}

- (void)addActiveSectionID:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "Adding activeSectionID %@", (uint8_t *)&v9, 0xCu);
  }
  -[UNCSectionInfoStore addActiveSectionID:](self->_sectionInfoStore, "addActiveSectionID:", v6);
  if (v7)
    v7[2](v7);

}

- (void)allSortedActiveSections:(BOOL)a3 withHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, _QWORD))a4;
  -[UNCSectionInfoStore allSortedActiveSections:](self->_sectionInfoStore, "allSortedActiveSections:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = 134217984;
    v11 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "Reading allSortedActiveSections. Count %lu", (uint8_t *)&v10, 0xCu);

  }
  if (v6)
    v6[2](v6, v7, 0);

}

- (void)allSortedSectionInfos:(BOOL)a3 withHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, _QWORD))a4;
  -[UNCSectionInfoStore allSortedSectionInfo:](self->_sectionInfoStore, "allSortedSectionInfo:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = 134217984;
    v11 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "Reading allSortedSectionInfos. Count %lu", (uint8_t *)&v10, 0xCu);

  }
  if (v6)
    v6[2](v6, v7, 0);

}

- (void)clearedInfoForSectionID:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "Reading clearedInfo for sectionID %@", (uint8_t *)&v10, 0xCu);
  }
  -[UNCSectionInfoStore clearedInfoForSectionID:](self->_sectionInfoStore, "clearedInfoForSectionID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, v9, 0);

}

- (void)clearedSectionsByIDWithHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[UNCSectionInfoStore clearedSectionsByID](self->_sectionInfoStore, "clearedSectionsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "Reading clearedSectionsByID. Count %lu", (uint8_t *)&v8, 0xCu);

  }
  if (v4)
    v4[2](v4, v5, 0);

}

- (void)sectionInfosForSectionIDs:(id)a3 effective:(BOOL)a4 withHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *, _QWORD);
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v6 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v10 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_2499A5000, v10, OS_LOG_TYPE_DEFAULT, "Reading sectionInfosForSectionIDs %@", (uint8_t *)&v12, 0xCu);
  }
  -[UNCSectionInfoStore sortedSectionInfoForSectionIDs:effective:](self->_sectionInfoStore, "sortedSectionInfoForSectionIDs:effective:", v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v9[2](v9, v11, 0);

}

- (void)setClearedInfo:(id)a3 forSectionID:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_2499A5000, v11, OS_LOG_TYPE_DEFAULT, "Setting clearedInfo for sectionID %@", (uint8_t *)&v12, 0xCu);
  }
  -[UNCSectionInfoStore setClearedInfo:forSectionID:](self->_sectionInfoStore, "setClearedInfo:forSectionID:", v8, v9);
  if (v10)
    v10[2](v10);

}

- (void)sortedSectionIDsWithHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[UNCSectionInfoStore sortedSectionIDs](self->_sectionInfoStore, "sortedSectionIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "Reading sortedSectionIDs. Count %lu", (uint8_t *)&v8, 0xCu);

  }
  if (v4)
    v4[2](v4, v5, 0);

}

- (void)readSavedClearedSectionsWithHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[UNCNotificationSettingsPersistentStore readClearedSections](self->_persistentSettingsStore, "readClearedSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (os_log_t *)MEMORY[0x24BDF89D8];
  v7 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener readSavedCleared: %@", (uint8_t *)&v9, 0xCu);
  }
  if (v4)
  {
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener readSavedCleared invoking handler", (uint8_t *)&v9, 2u);
    }
    v4[2](v4, v5, 0);
  }

}

- (void)readSectionInfoWithHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[UNCNotificationSettingsPersistentStore readSectionInfo](self->_persistentSettingsStore, "readSectionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (os_log_t *)MEMORY[0x24BDF89D8];
  v7 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener readSectionInfo %@", (uint8_t *)&v9, 0xCu);
  }
  if (v4)
  {
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener readSectionInfo invoking handler", (uint8_t *)&v9, 2u);
    }
    v4[2](v4, v5, 0);
  }

}

- (void)readSectionOrderWithHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[UNCNotificationSettingsPersistentStore readSectionOrder](self->_persistentSettingsStore, "readSectionOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener readSectionOrder %@", (uint8_t *)&v7, 0xCu);
  }
  if (v4)
    v4[2](v4, v5, 0);

}

- (void)writeClearedSections:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener writeClearedSections %@", (uint8_t *)&v6, 0xCu);
  }
  -[UNCNotificationSettingsPersistentStore writeClearedSections:](self->_persistentSettingsStore, "writeClearedSections:", v4);

}

- (void)writeSectionInfo:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener writeSectionInfo %@", (uint8_t *)&v6, 0xCu);
  }
  -[UNCNotificationSettingsPersistentStore writeSectionInfo:](self->_persistentSettingsStore, "writeSectionInfo:", v4);

}

- (void)writeSectionOrder:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener writeSectionOrder %@", (uint8_t *)&v6, 0xCu);
  }
  -[UNCNotificationSettingsPersistentStore writeSectionOrder:](self->_persistentSettingsStore, "writeSectionOrder:", v4);

}

- (void)deleteSectionInfoFile
{
  -[UNCNotificationSettingsPersistentStore deleteSectionInfoFile](self->_persistentSettingsStore, "deleteSectionInfoFile");
}

- (void)deleteSectionInfoLegacyFile
{
  -[UNCNotificationSettingsPersistentStore deleteSectionInfoLegacyFile](self->_persistentSettingsStore, "deleteSectionInfoLegacyFile");
}

- (void)hasSectionInfoLegacyFileWithHandler:(id)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[UNCNotificationSettingsPersistentStore hasSectionInfoLegacyFile](self->_persistentSettingsStore, "hasSectionInfoLegacyFile");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _BOOL8, _QWORD))v6 + 2))(v6, v4, 0);
    v5 = v6;
  }

}

- (void)readSectionInfoLegacyFileWithHandler:(id)a3
{
  void *v4;
  void (**v5)(id, void *, _QWORD);

  v5 = (void (**)(id, void *, _QWORD))a3;
  -[UNCNotificationSettingsPersistentStore readSectionInfoLegacy](self->_persistentSettingsStore, "readSectionInfoLegacy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v5[2](v5, v4, 0);

}

- (void)readSectionInfoWithVersionNumberForMigrationWithHandler:(id)a3
{
  UNCNotificationSettingsPersistentStore *persistentSettingsStore;
  void (**v4)(id, id, _QWORD);
  id v5;

  if (a3)
  {
    persistentSettingsStore = self->_persistentSettingsStore;
    v4 = (void (**)(id, id, _QWORD))a3;
    -[UNCNotificationSettingsPersistentStore readSectionInfoWithVersionNumberForMigration](persistentSettingsStore, "readSectionInfoWithVersionNumberForMigration");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5, 0);

  }
}

- (void)getEffectiveGlobalAnnounceCarPlaySettingWithHandler:(id)a3
{
  UNCEffectiveSettings *effectiveSettingsProvider;
  id v5;

  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    v5 = a3;
    (*((void (**)(id, int64_t, _QWORD))a3 + 2))(v5, -[UNCEffectiveSettings effectiveGlobalAnnounceCarPlaySetting](effectiveSettingsProvider, "effectiveGlobalAnnounceCarPlaySetting"), 0);

  }
}

- (void)getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:(id)a3
{
  UNCEffectiveSettings *effectiveSettingsProvider;
  id v5;

  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    v5 = a3;
    (*((void (**)(id, int64_t, _QWORD))a3 + 2))(v5, -[UNCEffectiveSettings effectiveGlobalAnnounceHeadphoneSetting](effectiveSettingsProvider, "effectiveGlobalAnnounceHeadphoneSetting"), 0);

  }
}

- (void)getEffectiveGlobalAnnounceSettingWithHandler:(id)a3
{
  UNCEffectiveSettings *effectiveSettingsProvider;
  id v5;

  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    v5 = a3;
    (*((void (**)(id, int64_t, _QWORD))a3 + 2))(v5, -[UNCEffectiveSettings effectiveGlobalAnnounceSetting](effectiveSettingsProvider, "effectiveGlobalAnnounceSetting"), 0);

  }
}

- (void)getEffectiveGlobalContentPreviewsSettingWithHandler:(id)a3
{
  UNCEffectiveSettings *effectiveSettingsProvider;
  id v5;

  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    v5 = a3;
    (*((void (**)(id, int64_t, _QWORD))a3 + 2))(v5, -[UNCEffectiveSettings effectiveGlobalContentPreviewSetting](effectiveSettingsProvider, "effectiveGlobalContentPreviewSetting"), 0);

  }
}

- (void)getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:(id)a3
{
  UNCEffectiveSettings *effectiveSettingsProvider;
  id v5;

  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    v5 = a3;
    (*((void (**)(id, int64_t, _QWORD))a3 + 2))(v5, -[UNCEffectiveSettings effectiveGlobalNotificationListDisplayStyleSetting](effectiveSettingsProvider, "effectiveGlobalNotificationListDisplayStyleSetting"), 0);

  }
}

- (void)getEffectiveGlobalScheduledDeliverySettingWithHandler:(id)a3
{
  UNCEffectiveSettings *effectiveSettingsProvider;
  id v5;

  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    v5 = a3;
    (*((void (**)(id, int64_t, _QWORD))a3 + 2))(v5, -[UNCEffectiveSettings effectiveGlobalScheduledDeliverySetting](effectiveSettingsProvider, "effectiveGlobalScheduledDeliverySetting"), 0);

  }
}

- (void)getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:(id)a3
{
  UNCEffectiveSettings *effectiveSettingsProvider;
  id v5;

  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    v5 = a3;
    (*((void (**)(id, int64_t, _QWORD))a3 + 2))(v5, -[UNCEffectiveSettings effectiveGlobalScheduledDeliveryShowNextSummarySetting](effectiveSettingsProvider, "effectiveGlobalScheduledDeliveryShowNextSummarySetting"), 0);

  }
}

- (void)getEffectiveGlobalScheduledDeliveryTimesWithHandler:(id)a3
{
  UNCEffectiveSettings *effectiveSettingsProvider;
  id v5;
  id v6;

  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    v5 = a3;
    -[UNCEffectiveSettings effectiveGlobalScheduledDeliveryTimes](effectiveSettingsProvider, "effectiveGlobalScheduledDeliveryTimes");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

  }
}

- (void)setEffectiveGlobalAnnounceCarPlaySetting:(int64_t)a3 withHandler:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[UNCEffectiveSettings setGlobalAnnounceCarPlaySetting:](self->_effectiveSettingsProvider, "setGlobalAnnounceCarPlaySetting:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)setEffectiveGlobalAnnounceHeadphonesSetting:(int64_t)a3 withHandler:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[UNCEffectiveSettings setGlobalAnnounceHeadphoneSetting:](self->_effectiveSettingsProvider, "setGlobalAnnounceHeadphoneSetting:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)setEffectiveGlobalAnnounceSetting:(int64_t)a3 withHandler:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[UNCEffectiveSettings setGlobalAnnounceSetting:](self->_effectiveSettingsProvider, "setGlobalAnnounceSetting:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)setEffectiveGlobalContentPreviewsSetting:(int64_t)a3 withHandler:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[UNCEffectiveSettings setGlobalContentPreviewSetting:](self->_effectiveSettingsProvider, "setGlobalContentPreviewSetting:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)setEffectiveGlobalNotificationListDisplayStyleSetting:(int64_t)a3 withHandler:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[UNCEffectiveSettings setGlobalNotificationListDisplayStyleSetting:](self->_effectiveSettingsProvider, "setGlobalNotificationListDisplayStyleSetting:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3 withHandler:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[UNCEffectiveSettings setGlobalScheduledDeliverySetting:](self->_effectiveSettingsProvider, "setGlobalScheduledDeliverySetting:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3 withHandler:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[UNCEffectiveSettings setGlobalScheduledDeliveryShowNextSummarySetting:](self->_effectiveSettingsProvider, "setGlobalScheduledDeliveryShowNextSummarySetting:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)setEffectiveGlobalScheduledDeliveryTimes:(id)a3 withHandler:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[UNCEffectiveSettings setGlobalScheduledDeliveryTimes:](self->_effectiveSettingsProvider, "setGlobalScheduledDeliveryTimes:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)pairedSyncDeviceCountWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfoStore, 0);
  objc_storeStrong((id *)&self->_effectiveSettingsProvider, 0);
  objc_storeStrong((id *)&self->_bulletinDefaults, 0);
  objc_storeStrong((id *)&self->_persistentSettingsStore, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

- (void)setSectionInfo:(uint64_t)a1 forSectionID:(NSObject *)a2 withHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2499A5000, a2, OS_LOG_TYPE_ERROR, "-setSectionInfo:forSectionID: called with nil section info for ID %@. Use -removeSectionWithID instead", (uint8_t *)&v2, 0xCu);
}

@end
