@implementation SUSettingsSUPreferencesManager

- (BOOL)isAutomaticDownloadEnabled
{
  OS_dispatch_queue *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[4];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSettingsSUPreferencesManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __60__SUSettingsSUPreferencesManager_isAutomaticDownloadEnabled__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __60__SUSettingsSUPreferencesManager_isAutomaticDownloadEnabled__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "preferences");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isAutomaticDownloadEnabled") & 1;

}

- (void)enableAutomaticDownload:(BOOL)a3
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSettingsSUPreferencesManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSettingsSUPreferencesManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __58__SUSettingsSUPreferencesManager_enableAutomaticDownload___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = v13;
  v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __58__SUSettingsSUPreferencesManager_enableAutomaticDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutomaticDownload:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutomaticDownload:(BOOL)a3
{
  OS_dispatch_queue *v3;
  SUPreferences *v4;
  BOOL v5;

  v5 = a3;
  v3 = -[SUSettingsSUPreferencesManager queue](self, "queue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = -[SUSettingsSUPreferencesManager preferences](self, "preferences");
  -[SUPreferences enableAutomaticDownload:](v4, "enableAutomaticDownload:", v5);

}

- (BOOL)isAutomaticUpdateV2Enabled
{
  OS_dispatch_queue *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[4];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSettingsSUPreferencesManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __60__SUSettingsSUPreferencesManager_isAutomaticUpdateV2Enabled__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __60__SUSettingsSUPreferencesManager_isAutomaticUpdateV2Enabled__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "preferences");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isAutomaticUpdateV2Enabled") & 1;

}

- (void)enableAutomaticUpdateV2:(BOOL)a3
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSettingsSUPreferencesManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSettingsSUPreferencesManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __58__SUSettingsSUPreferencesManager_enableAutomaticUpdateV2___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = v13;
  v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __58__SUSettingsSUPreferencesManager_enableAutomaticUpdateV2___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutomaticUpdateV2:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutomaticUpdateV2:(BOOL)a3
{
  OS_dispatch_queue *v3;
  SUPreferences *v4;
  BOOL v5;

  v5 = a3;
  v3 = -[SUSettingsSUPreferencesManager queue](self, "queue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = -[SUSettingsSUPreferencesManager preferences](self, "preferences");
  -[SUPreferences enableAutomaticUpdateV2:](v4, "enableAutomaticUpdateV2:", v5);

}

- (BOOL)previousUserSpecifiedAutomaticUpdateV2Enabled
{
  OS_dispatch_queue *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[4];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSettingsSUPreferencesManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __79__SUSettingsSUPreferencesManager_previousUserSpecifiedAutomaticUpdateV2Enabled__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __79__SUSettingsSUPreferencesManager_previousUserSpecifiedAutomaticUpdateV2Enabled__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "preferences");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "previousUserSpecifiedAutomaticUpdateV2Enabled") & 1;

}

- (void)enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSettingsSUPreferencesManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSettingsSUPreferencesManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __79__SUSettingsSUPreferencesManager_enablePreviousUserSpecifiedAutomaticUpdateV2___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = v13;
  v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __79__SUSettingsSUPreferencesManager_enablePreviousUserSpecifiedAutomaticUpdateV2___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enablePreviousUserSpecifiedAutomaticUpdateV2:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3
{
  OS_dispatch_queue *v3;
  SUPreferences *v4;
  BOOL v5;

  v5 = a3;
  v3 = -[SUSettingsSUPreferencesManager queue](self, "queue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = -[SUSettingsSUPreferencesManager preferences](self, "preferences");
  -[SUPreferences enablePreviousUserSpecifiedAutomaticUpdateV2:](v4, "enablePreviousUserSpecifiedAutomaticUpdateV2:", v5);

}

- (BOOL)autoInstallSecurityResponse
{
  OS_dispatch_queue *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[4];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSettingsSUPreferencesManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __61__SUSettingsSUPreferencesManager_autoInstallSecurityResponse__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __61__SUSettingsSUPreferencesManager_autoInstallSecurityResponse__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "preferences");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "autoInstallSecurityResponse") & 1;

}

- (void)enableAutoInstallSecurityResponse:(BOOL)a3
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSettingsSUPreferencesManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSettingsSUPreferencesManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __68__SUSettingsSUPreferencesManager_enableAutoInstallSecurityResponse___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = v13;
  v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __68__SUSettingsSUPreferencesManager_enableAutoInstallSecurityResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutoInstallSecurityResponse:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutoInstallSecurityResponse:(BOOL)a3
{
  OS_dispatch_queue *v3;
  SUPreferences *v4;
  BOOL v5;

  v5 = a3;
  v3 = -[SUSettingsSUPreferencesManager queue](self, "queue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = -[SUSettingsSUPreferencesManager preferences](self, "preferences");
  -[SUPreferences enableAutoInstallSecurityResponse:](v4, "enableAutoInstallSecurityResponse:", v5);

}

- (BOOL)autoInstallSecurityResponseForceOn
{
  OS_dispatch_queue *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[4];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSettingsSUPreferencesManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __68__SUSettingsSUPreferencesManager_autoInstallSecurityResponseForceOn__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __68__SUSettingsSUPreferencesManager_autoInstallSecurityResponseForceOn__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "preferences");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "autoInstallSecurityResponseForceOn") & 1;

}

- (BOOL)previousUserSpecifiedAutoInstallSecurityResponse
{
  OS_dispatch_queue *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[4];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSettingsSUPreferencesManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __82__SUSettingsSUPreferencesManager_previousUserSpecifiedAutoInstallSecurityResponse__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __82__SUSettingsSUPreferencesManager_previousUserSpecifiedAutoInstallSecurityResponse__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "preferences");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "previousUserSpecifiedAutoInstallSecurityResponse") & 1;

}

- (void)enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSettingsSUPreferencesManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSettingsSUPreferencesManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __89__SUSettingsSUPreferencesManager_enablePreviousUserSpecifiedAutoInstallSecurityResponse___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = v13;
  v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __89__SUSettingsSUPreferencesManager_enablePreviousUserSpecifiedAutoInstallSecurityResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enablePreviousUserSpecifiedAutoInstallSecurityResponse:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3
{
  OS_dispatch_queue *v3;
  SUPreferences *v4;
  BOOL v5;

  v5 = a3;
  v3 = -[SUSettingsSUPreferencesManager queue](self, "queue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = -[SUSettingsSUPreferencesManager preferences](self, "preferences");
  -[SUPreferences enablePreviousUserSpecifiedAutoInstallSecurityResponse:](v4, "enablePreviousUserSpecifiedAutoInstallSecurityResponse:", v5);

}

- (BOOL)autoInstallSystemAndDataFiles
{
  OS_dispatch_queue *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[4];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSettingsSUPreferencesManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __63__SUSettingsSUPreferencesManager_autoInstallSystemAndDataFiles__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __63__SUSettingsSUPreferencesManager_autoInstallSystemAndDataFiles__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "preferences");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "autoInstallSystemAndDataFiles") & 1;

}

- (void)enableAutoInstallSystemAndDataFiles:(BOOL)a3
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSettingsSUPreferencesManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSettingsSUPreferencesManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = -[SUSettingsSUPreferencesManager queue](self, "queue");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __70__SUSettingsSUPreferencesManager_enableAutoInstallSystemAndDataFiles___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = v13;
  v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __70__SUSettingsSUPreferencesManager_enableAutoInstallSystemAndDataFiles___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutoInstallSystemAndDataFiles:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutoInstallSystemAndDataFiles:(BOOL)a3
{
  OS_dispatch_queue *v3;
  SUPreferences *v4;
  BOOL v5;

  v5 = a3;
  v3 = -[SUSettingsSUPreferencesManager queue](self, "queue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = -[SUSettingsSUPreferencesManager preferences](self, "preferences");
  -[SUPreferences enableAutoInstallSystemAndDataFiles:](v4, "enableAutoInstallSystemAndDataFiles:", v5);

}

- (SUSettingsSUPreferencesManager)initWithDispatchQueue:(id)a3
{
  id v4;
  SUSettingsSUPreferencesManager *v5;
  id v6;
  SUSettingsSUPreferencesManager *v7;
  id location[2];
  SUSettingsSUPreferencesManager *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v9;
  v4 = location[0];
  v6 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  v9 = 0;
  v9 = -[SUSettingsSUPreferencesManager initWithDispatchQueue:forSUPreferencesInstance:](v5, "initWithDispatchQueue:forSUPreferencesInstance:", v4);
  v7 = v9;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (SUSettingsSUPreferencesManager)initWithDispatchQueue:(id)a3 forSUPreferencesInstance:(id)a4
{
  SUSettingsSUPreferencesManager *v4;
  SUSettingsSUPreferencesManager *v6;
  SUSettingsSUPreferencesManager *v8;
  objc_super v9;
  id v10;
  id location[2];
  SUSettingsSUPreferencesManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)SUSettingsSUPreferencesManager;
  v8 = -[SUSettingsSUPreferencesManager init](&v9, sel_init);
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    -[SUSettingsSUPreferencesManager setPreferences:](v12, "setPreferences:", v10);
    -[SUSettingsSUPreferencesManager setQueue:](v12, "setQueue:", location[0]);
    -[SUSettingsSUPreferencesManager addObserver:](v12, "addObserver:", v12);
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)dealloc
{
  SUPreferences *v2;
  objc_super v3;
  SEL v4;
  SUSettingsSUPreferencesManager *v5;

  v5 = self;
  v4 = a2;
  v2 = -[SUSettingsSUPreferencesManager preferences](self, "preferences");
  -[SUPreferences removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)SUSettingsSUPreferencesManager;
  -[SUSettingsSUPreferencesManager dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  SUPreferences *v3;
  id location[2];
  SUSettingsSUPreferencesManager *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSettingsSUPreferencesManager preferences](v5, "preferences");
  -[SUPreferences addObserver:](v3, "addObserver:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)removeObserver:(id)a3
{
  SUPreferences *v3;
  id location[2];
  SUSettingsSUPreferencesManager *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSettingsSUPreferencesManager preferences](v5, "preferences");
  -[SUPreferences removeObserver:](v3, "removeObserver:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5
{
  os_log_t oslog;
  id v8;
  id v9;
  id location[3];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  oslog = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v11, (uint64_t)"-[SUSettingsSUPreferencesManager preferences:didChangePreference:toValue:]", (uint64_t)v9);
    _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%s: The preferences key '%{public}@' have been changed.", v11, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SUPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
