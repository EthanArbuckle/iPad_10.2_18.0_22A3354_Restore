@implementation SUSUISoftwareUpdateClientManager

- (SUSUISoftwareUpdateClientManager)initWithDelegate:(id)a3 completionQueue:(id)a4
{
  SUSUISoftwareUpdateClientManager *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *completionQueue;
  id v9;
  uint64_t v10;
  SUManagerClient *suClient;
  SUSUISoftwareUpdateClientManager *v13;
  SUSUIServiceManager *v14;
  SUManagerClient *v15;
  SUManagerClient *v16;
  uint64_t v17;
  SUManagerClient *v18;
  SUSUISoftwareUpdateClientManager *v20;
  uint64_t v21;
  int v22;
  int v23;
  void (*v24)(NSObject *, void *, void *);
  void *v25;
  SUSUISoftwareUpdateClientManager *v26;
  uint64_t v27;
  int v28;
  int v29;
  void (*v30)(NSObject *, char, id, void *);
  void *v31;
  SUSUISoftwareUpdateClientManager *v32;
  uint64_t v33;
  int v34;
  int v35;
  void (*v36)(NSObject *, char, id);
  void *v37;
  SUSUISoftwareUpdateClientManager *v38;
  Class v39;
  objc_super v40;
  id v41;
  id location[2];
  SUSUISoftwareUpdateClientManager *v43;

  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = 0;
  objc_storeStrong(&v41, a4);
  v4 = v43;
  v43 = 0;
  v40.receiver = v4;
  v40.super_class = (Class)SUSUISoftwareUpdateClientManager;
  v20 = -[SUSUISoftwareUpdateClientManager init](&v40, sel_init);
  v43 = v20;
  objc_storeStrong((id *)&v43, v20);
  if (v20)
  {
    v5 = dispatch_queue_create("com.apple.SoftwareUpdateSettings.ClientManagerWorkQueue", 0);
    workQueue = v43->_workQueue;
    v43->_workQueue = (OS_dispatch_queue *)v5;

    objc_storeWeak((id *)&v43->_delegate, location[0]);
    objc_storeStrong((id *)&v43->_completionQueue, v41);
    if (!v43->_completionQueue)
    {
      v7 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      completionQueue = v43->_completionQueue;
      v43->_completionQueue = v7;

    }
    v14 = +[SUSUIServiceManager sharedInstance](SUSUIServiceManager, "sharedInstance");
    v39 = -[SUSUIServiceManager classForService:](v14, "classForService:", objc_opt_class());

    v9 = [v39 alloc];
    v10 = objc_msgSend(v9, "initWithDelegate:queue:clientType:", v43, v43->_completionQueue, 1);
    suClient = v43->_suClient;
    v43->_suClient = (SUManagerClient *)v10;

    v43->_autoUpdateScheduled = 0;
    v43->_rollingBack = 0;
    objc_storeStrong((id *)&v43->_rollbackDescriptor, 0);
    v15 = v43->_suClient;
    v17 = MEMORY[0x24BDAC760];
    v33 = MEMORY[0x24BDAC760];
    v34 = -1073741824;
    v35 = 0;
    v36 = __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke;
    v37 = &unk_24DFFC360;
    v38 = v43;
    -[SUManagerClient isAutoUpdateScheduled:](v15, "isAutoUpdateScheduled:", &v33);
    v16 = v43->_suClient;
    v27 = v17;
    v28 = -1073741824;
    v29 = 0;
    v30 = __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke_182;
    v31 = &unk_24DFFC388;
    v32 = v43;
    -[SUManagerClient isRollingBack:](v16, "isRollingBack:", &v27);
    v18 = v43->_suClient;
    v21 = v17;
    v22 = -1073741824;
    v23 = 0;
    v24 = __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke_184;
    v25 = &unk_24DFFC3B0;
    v26 = v43;
    -[SUManagerClient eligibleRollbackWithOptions:withResult:](v18, "eligibleRollbackWithOptions:withResult:", 0, &v21);
    objc_storeStrong((id *)&v26, 0);
    objc_storeStrong((id *)&v32, 0);
    objc_storeStrong((id *)&v38, 0);
  }
  v13 = v43;
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v43, 0);
  return v13;
}

void __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke(NSObject *a1, char a2, id obj)
{
  os_log_t oslog[2];
  id location;
  char v6;
  NSObject *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if (location)
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)location);
      _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "Error checking isAutoUpdateScheduled: %@", v8, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  -[objc_class setAutoUpdateScheduled:](a1[4].isa, "setAutoUpdateScheduled:", v6 & 1);
  objc_storeStrong(&location, 0);
}

void __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke_182(NSObject *a1, char a2, id obj, void *a4)
{
  os_log_t oslog[2];
  id v7;
  id location;
  char v9;
  NSObject *v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = a1;
  v9 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  oslog[1] = a1;
  if (v7)
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v11, (uint64_t)v7);
      _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "Error checking isRollingBack: %@", v11, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  -[objc_class setRollingBack:rollback:](a1[4].isa, "setRollingBack:rollback:", v9 & 1, location);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
}

void __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke_184(NSObject *a1, void *a2, void *a3)
{
  os_log_t oslog[2];
  id v6;
  id location[2];
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = 0;
  objc_storeStrong(&v6, a3);
  oslog[1] = a1;
  if (v6)
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)v6);
      _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "Error checking eligibleRollbackWithOptions: %@", v8, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  -[objc_class setEligibleRollback:](a1[4].isa, "setEligibleRollback:", location[0]);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  SUManagerClientDelegate *v2;
  BOOL v3;
  objc_super v4;
  SEL v5;
  SUSUISoftwareUpdateClientManager *v6;

  v6 = self;
  v5 = a2;
  v2 = -[SUManagerClient delegate](self->_suClient, "delegate");
  v3 = v2 != (SUManagerClientDelegate *)v6;

  if (!v3)
    -[SUManagerClient setDelegate:](v6->_suClient, "setDelegate:", 0);
  -[SUManagerClient invalidate](v6->_suClient, "invalidate");
  v4.receiver = v6;
  v4.super_class = (Class)SUSUISoftwareUpdateClientManager;
  -[SUSUISoftwareUpdateClientManager dealloc](&v4, sel_dealloc);
}

- (SUManagerClient)suManagerClient
{
  NSObject *queue;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[2];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17[3];

  v17[2] = self;
  v17[1] = (id)a2;
  v11 = 0;
  v12 = &v11;
  v13 = 838860800;
  v14 = 48;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17[0] = 0;
  queue = self->_workQueue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __51__SUSUISoftwareUpdateClientManager_suManagerClient__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  v4 = (id)v12[5];
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(v17, 0);
  return (SUManagerClient *)v4;
}

void __51__SUSUISoftwareUpdateClientManager_suManagerClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)scanforUpdatesWithOptions:(id)a3 completion:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *);
  void *v10;
  SUSUISoftwareUpdateClientManager *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSUISoftwareUpdateClientManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __73__SUSUISoftwareUpdateClientManager_scanforUpdatesWithOptions_completion___block_invoke;
  v10 = &unk_24DFFC400;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __73__SUSUISoftwareUpdateClientManager_scanforUpdatesWithOptions_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "scanForUpdates:withScanResults:", a1[5], a1[6], a1, a1);
}

- (void)isScanning:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateClientManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __47__SUSUISoftwareUpdateClientManager_isScanning___block_invoke;
  v8 = &unk_24DFFC428;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __47__SUSUISoftwareUpdateClientManager_isScanning___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isScanning:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)softwareUpdatePathRestriction:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateClientManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __66__SUSUISoftwareUpdateClientManager_softwareUpdatePathRestriction___block_invoke;
  v8 = &unk_24DFFC428;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __66__SUSUISoftwareUpdateClientManager_softwareUpdatePathRestriction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "softwareUpdatePathRestriction:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)isDelayingUpdates:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateClientManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __54__SUSUISoftwareUpdateClientManager_isDelayingUpdates___block_invoke;
  v8 = &unk_24DFFC428;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __54__SUSUISoftwareUpdateClientManager_isDelayingUpdates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isDelayingUpdates:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)download:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateClientManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __45__SUSUISoftwareUpdateClientManager_download___block_invoke;
  v8 = &unk_24DFFC428;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __45__SUSUISoftwareUpdateClientManager_download___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "download:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)updatesDownloadable:(id)a3 alternateUpdate:(id)a4 completion:(id)a5
{
  NSObject *queue;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  SUSUISoftwareUpdateClientManager *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  SUSUISoftwareUpdateClientManager *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  queue = v20->_workQueue;
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __83__SUSUISoftwareUpdateClientManager_updatesDownloadable_alternateUpdate_completion___block_invoke;
  v12 = &unk_24DFFC450;
  v13 = v20;
  v14 = location[0];
  v15 = v18;
  v16 = v17;
  dispatch_async(queue, &v8);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __83__SUSUISoftwareUpdateClientManager_updatesDownloadable_alternateUpdate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *queue;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a1;
  v23 = a1;
  v22 = 0;
  v21 = 0;
  v20 = 0;
  v19 = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v18 = 0;
  v17 = 0;
  objc_msgSend(v2, "areUpdatesDownloadableWithOptions:alternateUpdateOptions:preferredUpdateDownloadable:alternateUpdateDownloadable:preferredUpdateError:alternateUpdateError:", v3, v4, &v22, &v21, &v18, &v17);
  objc_storeStrong(&v20, v18);
  objc_storeStrong(&v19, v17);
  if (*(_QWORD *)(a1 + 56))
  {
    queue = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __83__SUSUISoftwareUpdateClientManager_updatesDownloadable_alternateUpdate_completion___block_invoke_2;
    v11 = &unk_24DFF7BF8;
    v14 = *(id *)(a1 + 56);
    v15 = v22 & 1;
    v16 = v21 & 1;
    v12 = v20;
    v13 = v19;
    dispatch_async(queue, &v7);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
}

uint64_t __83__SUSUISoftwareUpdateClientManager_updatesDownloadable_alternateUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56) & 1);
}

- (void)startDownloadWithOptions:(id)a3 completion:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *);
  void *v10;
  SUSUISoftwareUpdateClientManager *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSUISoftwareUpdateClientManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __72__SUSUISoftwareUpdateClientManager_startDownloadWithOptions_completion___block_invoke;
  v10 = &unk_24DFFC400;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __72__SUSUISoftwareUpdateClientManager_startDownloadWithOptions_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "startDownloadWithOptions:withResult:", a1[5], a1[6], a1, a1);
}

- (void)updateDownloadOptions:(id)a3 completion:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *);
  void *v10;
  SUSUISoftwareUpdateClientManager *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSUISoftwareUpdateClientManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __69__SUSUISoftwareUpdateClientManager_updateDownloadOptions_completion___block_invoke;
  v10 = &unk_24DFFC400;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __69__SUSUISoftwareUpdateClientManager_updateDownloadOptions_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "updateDownloadOptions:withResult:", a1[5], a1[6], a1, a1);
}

- (void)isClearingSpaceForDownload:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateClientManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __63__SUSUISoftwareUpdateClientManager_isClearingSpaceForDownload___block_invoke;
  v8 = &unk_24DFFC428;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __63__SUSUISoftwareUpdateClientManager_isClearingSpaceForDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isClearingSpaceForDownload:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (BOOL)isAutoDownloadEnabled
{
  NSObject *workQueue;
  char v4;
  uint64_t block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSUISoftwareUpdateClientManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  workQueue = self->_workQueue;
  block = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __57__SUSUISoftwareUpdateClientManager_isAutoDownloadEnabled__block_invoke;
  v9 = &unk_24DFF80D0;
  v10 = &v11;
  dispatch_sync(workQueue, &block);
  v4 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __57__SUSUISoftwareUpdateClientManager_isAutoDownloadEnabled__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "isAutomaticDownloadEnabled") & 1;

}

- (void)enableAutoDownload:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSUISoftwareUpdateClientManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __55__SUSUISoftwareUpdateClientManager_enableAutoDownload___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = self;
  v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __55__SUSUISoftwareUpdateClientManager_enableAutoDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setAutoDownloadEnabled:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_setAutoDownloadEnabled:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  objc_msgSend(v3, "enableAutomaticDownload:", v4);

}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 completion:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *);
  void *v10;
  SUSUISoftwareUpdateClientManager *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSUISoftwareUpdateClientManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __87__SUSUISoftwareUpdateClientManager_isUpdateReadyForInstallationWithOptions_completion___block_invoke;
  v10 = &unk_24DFFC400;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __87__SUSUISoftwareUpdateClientManager_isUpdateReadyForInstallationWithOptions_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "isUpdateReadyForInstallationWithOptions:withResult:", a1[5], a1[6], a1, a1);
}

- (void)installUpdateWithOptions:(id)a3 completion:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *);
  void *v10;
  SUSUISoftwareUpdateClientManager *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSUISoftwareUpdateClientManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __72__SUSUISoftwareUpdateClientManager_installUpdateWithOptions_completion___block_invoke;
  v10 = &unk_24DFFC400;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __72__SUSUISoftwareUpdateClientManager_installUpdateWithOptions_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "installUpdateWithInstallOptions:withResult:", a1[5], a1[6], a1, a1);
}

- (void)currentAutoInstallOperation:(BOOL)a3 completion:(id)a4
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  SUSUISoftwareUpdateClientManager *v10;
  id v11;
  BOOL v12;
  id location;
  BOOL v14;
  SEL v15;
  SUSUISoftwareUpdateClientManager *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  queue = v16->_workQueue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke;
  v9 = &unk_24DFFC4C8;
  v10 = v16;
  v12 = v14;
  v11 = location;
  dispatch_async(queue, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

void __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;
  id v5[3];

  v5[2] = (id)a1;
  v5[1] = (id)a1;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v2 = *(_BYTE *)(a1 + 48);
  v5[0] = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v3, "currentAutoInstallOperation:withResult:", v2 & 1);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);
}

void __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v3;
  void *v4;
  NSObject *queue;
  id WeakRetained;
  char v7;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, char, id);
  void *v14;
  id v15;
  id v16;
  id v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24[2];
  id v25;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v25 = 0;
  objc_storeStrong(&v25, a3);
  v24[1] = a1;
  if (location[0] && !v25)
  {
    v4 = (void *)*((_QWORD *)a1[4] + 3);
    v3 = location[0];
    v10 = MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_4;
    v14 = &unk_24DFFC478;
    v15 = a1[4];
    v16 = location[0];
    v17 = a1[5];
    objc_msgSend(v4, "_consentAutoInstallOperation:withResult:", v3, &v10);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    v18 = 0;
  }
  else
  {
    if (a1[5])
      (*((void (**)(void))a1[5] + 2))();
    WeakRetained = objc_loadWeakRetained((id *)a1[4] + 7);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      queue = *((_QWORD *)a1[4] + 2);
      v19 = MEMORY[0x24BDAC760];
      v20 = -1073741824;
      v21 = 0;
      v22 = __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_3;
      v23 = &unk_24DFF7B58;
      v24[0] = a1[4];
      dispatch_async(queue, &v19);
      objc_storeStrong(v24, 0);
    }
    v18 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

void __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 32);
  v4 = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(WeakRetained, "manager:autoUpdateScheduleStateChanged:autoInstallOperation:", v2, v3 & 1);

}

void __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_4(uint64_t a1, char a2, id obj)
{
  uint64_t v3;
  NSObject *queue;
  id v5;
  char v6;
  id WeakRetained;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14[2];
  id location;
  char v16;
  uint64_t v17;

  v17 = a1;
  v16 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v14[1] = (id)a1;
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(a1 + 40) != 0;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "setDelegate:", *(_QWORD *)(a1 + 32));

  if (*(_QWORD *)(a1 + 40))
  {
    if ((v16 & 1) != 0)
      v3 = 1;
    else
      v3 = 2;
    objc_msgSend(*(id *)(a1 + 40), "setAgreementStatus:", v3);
  }
  if (*(_QWORD *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    queue = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v9 = MEMORY[0x24BDAC760];
    v10 = -1073741824;
    v11 = 0;
    v12 = __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_5;
    v13 = &unk_24DFF7B58;
    v14[0] = *(id *)(a1 + 32);
    dispatch_async(queue, &v9);
    objc_storeStrong(v14, 0);
  }
  objc_storeStrong(&location, 0);
}

void __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 32);
  v4 = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(WeakRetained, "manager:autoUpdateScheduleStateChanged:autoInstallOperation:", v2, v3 & 1);

}

- (BOOL)isAutoInstallEnabled
{
  NSObject *workQueue;
  char v4;
  uint64_t block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSUISoftwareUpdateClientManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  workQueue = self->_workQueue;
  block = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __56__SUSUISoftwareUpdateClientManager_isAutoInstallEnabled__block_invoke;
  v9 = &unk_24DFF80D0;
  v10 = &v11;
  dispatch_sync(workQueue, &block);
  v4 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __56__SUSUISoftwareUpdateClientManager_isAutoInstallEnabled__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "isAutomaticUpdateV2Enabled") & 1;

}

- (void)enableAutoInstall:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSUISoftwareUpdateClientManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __54__SUSUISoftwareUpdateClientManager_enableAutoInstall___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = self;
  v10 = v11;
  dispatch_sync(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __54__SUSUISoftwareUpdateClientManager_enableAutoInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setAutoInstallEnabled:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_setAutoInstallEnabled:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  objc_msgSend(v3, "enableAutomaticUpdateV2:", v4);

}

- (BOOL)isAutoInstallPreviousUserSettingsEnabled
{
  NSObject *workQueue;
  char v4;
  uint64_t block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSUISoftwareUpdateClientManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  workQueue = self->_workQueue;
  block = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __76__SUSUISoftwareUpdateClientManager_isAutoInstallPreviousUserSettingsEnabled__block_invoke;
  v9 = &unk_24DFF80D0;
  v10 = &v11;
  dispatch_sync(workQueue, &block);
  v4 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __76__SUSUISoftwareUpdateClientManager_isAutoInstallPreviousUserSettingsEnabled__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "previousUserSpecifiedAutomaticUpdateV2Enabled") & 1;

}

- (void)enableAutoInstallPreviousUserSettings:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSUISoftwareUpdateClientManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __74__SUSUISoftwareUpdateClientManager_enableAutoInstallPreviousUserSettings___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = self;
  v10 = v11;
  dispatch_sync(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __74__SUSUISoftwareUpdateClientManager_enableAutoInstallPreviousUserSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutoInstallPreviousUserSettings:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutoInstallPreviousUserSettings:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  objc_msgSend(v3, "enablePreviousUserSpecifiedAutomaticUpdateV2:", v4);

}

- (BOOL)isSecurityResponseEnabled
{
  NSObject *workQueue;
  char v4;
  uint64_t block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSUISoftwareUpdateClientManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  workQueue = self->_workQueue;
  block = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __61__SUSUISoftwareUpdateClientManager_isSecurityResponseEnabled__block_invoke;
  v9 = &unk_24DFF80D0;
  v10 = &v11;
  dispatch_sync(workQueue, &block);
  v4 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __61__SUSUISoftwareUpdateClientManager_isSecurityResponseEnabled__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "autoInstallSecurityResponse") & 1;

}

- (void)setSecurityResponseEnabled:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSUISoftwareUpdateClientManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __63__SUSUISoftwareUpdateClientManager_setSecurityResponseEnabled___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = self;
  v10 = v11;
  dispatch_sync(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __63__SUSUISoftwareUpdateClientManager_setSecurityResponseEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setSecurityResponseEnabled:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_setSecurityResponseEnabled:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  objc_msgSend(v3, "enableAutoInstallSecurityResponse:", v4);

}

- (BOOL)previousUserSpecifiedSecurityResponseEnabled
{
  NSObject *workQueue;
  char v4;
  uint64_t block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSUISoftwareUpdateClientManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  workQueue = self->_workQueue;
  block = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __80__SUSUISoftwareUpdateClientManager_previousUserSpecifiedSecurityResponseEnabled__block_invoke;
  v9 = &unk_24DFF80D0;
  v10 = &v11;
  dispatch_sync(workQueue, &block);
  v4 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __80__SUSUISoftwareUpdateClientManager_previousUserSpecifiedSecurityResponseEnabled__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "previousUserSpecifiedAutoInstallSecurityResponse") & 1;

}

- (void)setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSUISoftwareUpdateClientManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __83__SUSUISoftwareUpdateClientManager_setPreviousUserSpecifiedSecurityResponseStatus___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = self;
  v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __83__SUSUISoftwareUpdateClientManager_setPreviousUserSpecifiedSecurityResponseStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setPreviousUserSpecifiedSecurityResponseStatus:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  objc_msgSend(v3, "enablePreviousUserSpecifiedAutoInstallSecurityResponse:", v4);

}

- (BOOL)isAutomaticInstallSystemDataFilesEnabled
{
  NSObject *workQueue;
  char v4;
  uint64_t block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSUISoftwareUpdateClientManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  workQueue = self->_workQueue;
  block = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __76__SUSUISoftwareUpdateClientManager_isAutomaticInstallSystemDataFilesEnabled__block_invoke;
  v9 = &unk_24DFF80D0;
  v10 = &v11;
  dispatch_sync(workQueue, &block);
  v4 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __76__SUSUISoftwareUpdateClientManager_isAutomaticInstallSystemDataFilesEnabled__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "autoInstallSystemAndDataFiles") & 1;

}

- (void)enableAutomaticInstallSystemDataFiles:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSUISoftwareUpdateClientManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __74__SUSUISoftwareUpdateClientManager_enableAutomaticInstallSystemDataFiles___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = self;
  v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __74__SUSUISoftwareUpdateClientManager_enableAutomaticInstallSystemDataFiles___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutomaticInstallSystemDataFiles:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutomaticInstallSystemDataFiles:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  objc_msgSend(v3, "enableAutoInstallSystemAndDataFiles:", v4);

}

- (BOOL)isAutoUpdateArmedAndReady
{
  NSObject *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[2];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSUISoftwareUpdateClientManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = self->_workQueue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __61__SUSUISoftwareUpdateClientManager_isAutoUpdateArmedAndReady__block_invoke;
  v9 = &unk_24DFFC4F0;
  v10[0] = self;
  v10[1] = &v11;
  dispatch_sync(queue, &v5);
  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __61__SUSUISoftwareUpdateClientManager_isAutoUpdateArmedAndReady__block_invoke(uint64_t a1)
{
  int v2;
  char v3;
  id v4;
  char v5;
  id WeakRetained;

  v5 = 0;
  v3 = 0;
  LOBYTE(v2) = 0;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
    v5 = 1;
    LOBYTE(v2) = 0;
    if ((objc_msgSend(WeakRetained, "isCanceled") & 1) == 0)
    {
      v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
      v3 = 1;
      v2 = objc_msgSend(v4, "isExpired") ^ 1;
    }
  }
  if ((v3 & 1) != 0)

  if ((v5 & 1) != 0)
  if ((v2 & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (BOOL)isAutoUpdateScheduled
{
  NSObject *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10[2];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSUISoftwareUpdateClientManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = self->_workQueue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __57__SUSUISoftwareUpdateClientManager_isAutoUpdateScheduled__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

uint64_t __57__SUSUISoftwareUpdateClientManager_isAutoUpdateScheduled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32) & 1;
  return result;
}

- (void)setAutoUpdateScheduled:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSUISoftwareUpdateClientManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __59__SUSUISoftwareUpdateClientManager_setAutoUpdateScheduled___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = self;
  v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __59__SUSUISoftwareUpdateClientManager_setAutoUpdateScheduled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAutoUpdateScheduled:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)_queue_setAutoUpdateScheduled:(BOOL)a3
{
  NSObject *queue;
  id WeakRetained;
  char v5;
  SUManagerClient *suClient;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  SUSUISoftwareUpdateClientManager *v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(id *, void *, void *);
  void *v17;
  SUSUISoftwareUpdateClientManager *v18;
  BOOL v19;
  SEL v20;
  SUSUISoftwareUpdateClientManager *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v21->_autoUpdateScheduled != v19)
  {
    v21->_autoUpdateScheduled = v19;
    if (v21->_autoUpdateScheduled)
    {
      suClient = v21->_suClient;
      v13 = MEMORY[0x24BDAC760];
      v14 = -1073741824;
      v15 = 0;
      v16 = __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke;
      v17 = &unk_24DFFC518;
      v18 = v21;
      -[SUManagerClient currentAutoInstallOperation:withResult:](suClient, "currentAutoInstallOperation:withResult:", 0, &v13);
      objc_storeStrong((id *)&v18, 0);
    }
    else
    {
      objc_storeWeak((id *)&v21->_autoInstallOperation, 0);
      WeakRetained = objc_loadWeakRetained((id *)&v21->_delegate);
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        queue = v21->_completionQueue;
        v7 = MEMORY[0x24BDAC760];
        v8 = -1073741824;
        v9 = 0;
        v10 = __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_4;
        v11 = &unk_24DFF7B58;
        v12 = v21;
        dispatch_async(queue, &v7);
        objc_storeStrong((id *)&v12, 0);
      }
    }
  }
}

void __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke(id *a1, void *a2, void *a3)
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *);
  void *v10;
  id v11;
  id v12[2];
  id v13;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13 = 0;
  objc_storeStrong(&v13, a3);
  v12[1] = a1;
  queue = *((_QWORD *)a1[4] + 1);
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_2;
  v10 = &unk_24DFF7B80;
  v11 = a1[4];
  v12[0] = location[0];
  dispatch_async(queue, &v6);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_2(id *a1)
{
  NSObject *queue;
  id WeakRetained;
  id v4;
  char v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11[3];

  v11[2] = a1;
  v11[1] = a1;
  objc_storeWeak((id *)a1[4] + 6, a1[5]);
  WeakRetained = objc_loadWeakRetained((id *)a1[4] + 6);
  objc_msgSend(WeakRetained, "setDelegate:", a1[4]);

  v4 = objc_loadWeakRetained((id *)a1[4] + 7);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    queue = *((_QWORD *)a1[4] + 2);
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_3;
    v10 = &unk_24DFF7B58;
    v11[0] = a1[4];
    dispatch_async(queue, &v6);
    objc_storeStrong(v11, 0);
  }
}

void __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 32);
  v4 = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(WeakRetained, "manager:autoUpdateScheduleStateChanged:autoInstallOperation:", v2, v3 & 1);

}

void __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 32);
  v4 = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(WeakRetained, "manager:autoUpdateScheduleStateChanged:autoInstallOperation:", v2, v3 & 1);

}

- (void)cancelAutoInstall
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  queue = self->_workQueue;
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __53__SUSUISoftwareUpdateClientManager_cancelAutoInstall__block_invoke;
  v7 = &unk_24DFF7B58;
  v8[0] = self;
  dispatch_async(queue, &v3);
  objc_storeStrong(v8, 0);
}

uint64_t __53__SUSUISoftwareUpdateClientManager_cancelAutoInstall__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_cancelAutoInstall", a1, a1);
}

- (void)_queue_cancelAutoInstall
{
  id WeakRetained;
  NSObject *log;
  os_log_type_t type;
  uint8_t v5[7];
  os_log_type_t v6;
  id location[2];
  SUSUISoftwareUpdateClientManager *v8;

  v8 = self;
  location[1] = (id)a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  location[0] = _SUSUILoggingFacility();
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_impl(&dword_21BF33000, log, type, "Canceling auto install", v5, 2u);
  }
  objc_storeStrong(location, 0);
  WeakRetained = objc_loadWeakRetained((id *)&v8->_autoInstallOperation);
  objc_msgSend(WeakRetained, "cancel");

  -[SUSUISoftwareUpdateClientManager _queue_setAutoUpdateScheduled:](v8, "_queue_setAutoUpdateScheduled:", 0);
}

- (id)eligibleRollback
{
  NSObject *queue;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[2];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17[3];

  v17[2] = self;
  v17[1] = (id)a2;
  v11 = 0;
  v12 = &v11;
  v13 = 838860800;
  v14 = 48;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17[0] = 0;
  queue = self->_workQueue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __52__SUSUISoftwareUpdateClientManager_eligibleRollback__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  v4 = (id)v12[5];
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(v17, 0);
  return v4;
}

void __52__SUSUISoftwareUpdateClientManager_eligibleRollback__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)setEligibleRollback:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateClientManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __56__SUSUISoftwareUpdateClientManager_setEligibleRollback___block_invoke;
  v8 = &unk_24DFF7B80;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __56__SUSUISoftwareUpdateClientManager_setEligibleRollback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEligibleRollback:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)_queue_setEligibleRollback:(id)a3
{
  os_log_t oslog;
  id location[2];
  SUSUISoftwareUpdateClientManager *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v5->_workQueue);
  if ((-[SURollbackDescriptor isEqual:](v5->_rollbackDescriptor, "isEqual:", location[0]) & 1) == 0)
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v6, (uint64_t)location[0]);
      _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "Settings eligibleRollback to: %@", v6, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_storeStrong((id *)&v5->_rollbackDescriptor, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)rollbackUpdateWithOptions:(id)a3 completion:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *);
  void *v10;
  SUSUISoftwareUpdateClientManager *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSUISoftwareUpdateClientManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __73__SUSUISoftwareUpdateClientManager_rollbackUpdateWithOptions_completion___block_invoke;
  v10 = &unk_24DFFC400;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __73__SUSUISoftwareUpdateClientManager_rollbackUpdateWithOptions_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "rollbackUpdateWithOptions:withResult:", a1[5], a1[6], a1, a1);
}

- (BOOL)isRollingBack
{
  NSObject *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10[2];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSUISoftwareUpdateClientManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = self->_workQueue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __49__SUSUISoftwareUpdateClientManager_isRollingBack__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

uint64_t __49__SUSUISoftwareUpdateClientManager_isRollingBack__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 33) & 1;
  return result;
}

- (void)setRollingBack:(BOOL)a3 rollback:(id)a4
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  SUSUISoftwareUpdateClientManager *v10;
  id v11;
  BOOL v12;
  id location;
  BOOL v14;
  SEL v15;
  SUSUISoftwareUpdateClientManager *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  queue = v16->_workQueue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __60__SUSUISoftwareUpdateClientManager_setRollingBack_rollback___block_invoke;
  v9 = &unk_24DFFAAE0;
  v10 = v16;
  v12 = v14;
  v11 = location;
  dispatch_async(queue, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

void __60__SUSUISoftwareUpdateClientManager_setRollingBack_rollback___block_invoke(uint64_t a1)
{
  NSObject *queue;
  id WeakRetained;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v14 = a1;
  v13 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_queue_setRollingBack:", *(_BYTE *)(a1 + 48) & 1);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    queue = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __60__SUSUISoftwareUpdateClientManager_setRollingBack_rollback___block_invoke_2;
    v9 = &unk_24DFFAAE0;
    v10 = *(id *)(a1 + 32);
    v12 = *(_BYTE *)(a1 + 48) & 1;
    v11 = *(id *)(a1 + 40);
    dispatch_async(queue, &v5);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v10, 0);
  }
}

void __60__SUSUISoftwareUpdateClientManager_setRollingBack_rollback___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "manager:rollingBackStateChanged:rollback:", *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 48) & 1, *(_QWORD *)(a1 + 40));

}

- (void)_queue_setRollingBack:(BOOL)a3
{
  const __CFString *v3;
  os_log_t oslog;
  BOOL v5;
  SEL v6;
  SUSUISoftwareUpdateClientManager *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = self;
  v6 = a2;
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v7->_rollingBack != v5)
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
        v3 = CFSTR("YES");
      else
        v3 = CFSTR("NO");
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "Setting rollingBack: %@", v8, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v7->_rollingBack = v5;
  }
}

- (void)purgeDownload:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateClientManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __50__SUSUISoftwareUpdateClientManager_purgeDownload___block_invoke;
  v8 = &unk_24DFFC428;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __50__SUSUISoftwareUpdateClientManager_purgeDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "purgeDownload:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)isInstallationKeybagRequired:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateClientManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __65__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequired___block_invoke;
  v8 = &unk_24DFFC428;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __65__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequired___block_invoke(uint64_t a1)
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v12 = a1;
  v11 = a1;
  v10 = 0;
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isInstallationKeybagRequired") & 1;
  if (*(_QWORD *)(a1 + 40))
  {
    queue = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __65__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequired___block_invoke_2;
    v7 = &unk_24DFF7E78;
    v8 = *(id *)(a1 + 40);
    v9 = v10 & 1;
    dispatch_async(queue, &v3);
    objc_storeStrong(&v8, 0);
  }
}

uint64_t __65__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequired___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) & 1);
}

- (void)isInstallationKeybagRequiredForDescriptor:(id)a3 result:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  SUSUISoftwareUpdateClientManager *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSUISoftwareUpdateClientManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __85__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequiredForDescriptor_result___block_invoke;
  v10 = &unk_24DFFC400;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __85__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequiredForDescriptor_result___block_invoke(uint64_t a1)
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v12 = a1;
  v11 = a1;
  v10 = 0;
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isInstallationKeybagRequiredForDescriptor:", *(_QWORD *)(a1 + 40)) & 1;
  if (*(_QWORD *)(a1 + 48))
  {
    queue = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __85__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequiredForDescriptor_result___block_invoke_2;
    v7 = &unk_24DFF7E78;
    v8 = *(id *)(a1 + 48);
    v9 = v10 & 1;
    dispatch_async(queue, &v3);
    objc_storeStrong(&v8, 0);
  }
}

uint64_t __85__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequiredForDescriptor_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) & 1);
}

- (void)createInstallationKeybagWithOptions:(id)a3 completion:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  SUSUISoftwareUpdateClientManager *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSUISoftwareUpdateClientManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __83__SUSUISoftwareUpdateClientManager_createInstallationKeybagWithOptions_completion___block_invoke;
  v10 = &unk_24DFFC400;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __83__SUSUISoftwareUpdateClientManager_createInstallationKeybagWithOptions_completion___block_invoke(uint64_t a1)
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v12 = a1;
  v11 = a1;
  v10 = 0;
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "createInstallationKeybagWithOptions:", *(_QWORD *)(a1 + 40)) & 1;
  if (*(_QWORD *)(a1 + 48))
  {
    queue = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __83__SUSUISoftwareUpdateClientManager_createInstallationKeybagWithOptions_completion___block_invoke_2;
    v7 = &unk_24DFF7E78;
    v8 = *(id *)(a1 + 48);
    v9 = v10 & 1;
    dispatch_async(queue, &v3);
    objc_storeStrong(&v8, 0);
  }
}

void __83__SUSUISoftwareUpdateClientManager_createInstallationKeybagWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  char v2;
  char v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_BYTE *)(a1 + 40);
  v3 = 0;
  if ((v2 & 1) != 0)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, *(_BYTE *)(a1 + 40) & 1, 0);
  }
  else
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BEAEC88], "errorWithCode:", 82);
    v3 = 1;
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, v2 & 1, v4);
  }
  if ((v3 & 1) != 0)

}

- (void)destroyInstallationKeybag:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateClientManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __62__SUSUISoftwareUpdateClientManager_destroyInstallationKeybag___block_invoke;
  v8 = &unk_24DFFC428;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __62__SUSUISoftwareUpdateClientManager_destroyInstallationKeybag___block_invoke(uint64_t a1)
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8[3];

  v8[2] = (id)a1;
  v8[1] = (id)a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "destroyInstallationKeybag");
  if (*(_QWORD *)(a1 + 40))
  {
    queue = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __62__SUSUISoftwareUpdateClientManager_destroyInstallationKeybag___block_invoke_2;
    v7 = &unk_24DFF7BA8;
    v8[0] = *(id *)(a1 + 40);
    dispatch_async(queue, &v3);
    objc_storeStrong(v8, 0);
  }
}

uint64_t __62__SUSUISoftwareUpdateClientManager_destroyInstallationKeybag___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1);
}

- (void)getDDMDeclaration:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateClientManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke;
  v8 = &unk_24DFFC428;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id v9[3];

  v9[2] = a1;
  v9[1] = a1;
  v2 = (void *)*((_QWORD *)a1[4] + 3);
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke_2;
  v7 = &unk_24DFFC540;
  v9[0] = a1[5];
  v8 = a1[4];
  objc_msgSend(v2, "getDDMDeclarationWithHandler:");
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
}

void __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13[2];
  id v14;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = (id)a1;
  if (*(_QWORD *)(a1 + 40))
  {
    queue = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke_3;
    v10 = &unk_24DFF7E28;
    v13[0] = *(id *)(a1 + 40);
    v11 = location[0];
    v12 = v14;
    dispatch_async(queue, &v6);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(v13, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)client:(id)a3 scanRequestDidStartForOptions:(id)a4
{
  id v4;
  id WeakRetained;
  char v7;
  id v8;
  id location[2];
  SUSUISoftwareUpdateClientManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    objc_msgSend(v4, "manager:scanRequestDidStartForOptions:", v10, v8);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 scanRequestDidFinishForOptions:(id)a4 results:(id)a5 error:(id)a6
{
  id v6;
  id WeakRetained;
  char v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSUISoftwareUpdateClientManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v12 = 0;
  objc_storeStrong(&v12, a6);
  dispatch_assert_queue_V2((dispatch_queue_t)v16->_completionQueue);
  WeakRetained = objc_loadWeakRetained((id *)&v16->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&v16->_delegate);
    objc_msgSend(v6, "manager:scanRequestDidFinishForOptions:results:error:", v16, v14, v13, v12);

  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadDidStart:(id)a4
{
  id v4;
  id WeakRetained;
  char v7;
  id v8;
  id location[2];
  SUSUISoftwareUpdateClientManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    objc_msgSend(v4, "manager:downloadDidStart:", v10, v8);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadProgressDidChange:(id)a4
{
  id v4;
  id WeakRetained;
  char v7;
  id v8;
  id location[2];
  SUSUISoftwareUpdateClientManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    objc_msgSend(v4, "manager:downloadProgressDidChange:", v10, v8);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadWasInvalidatedForNewUpdatesAvailable:(id)a4
{
  id v4;
  id WeakRetained;
  char v7;
  id v8;
  id location[2];
  SUSUISoftwareUpdateClientManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  -[SUSUISoftwareUpdateClientManager setAutoUpdateScheduled:](v10, "setAutoUpdateScheduled:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    objc_msgSend(v4, "manager:downloadWasInvalidatedForNewUpdatesAvailable:", v10, v8);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadDidFinish:(id)a4 withInstallPolicy:(id)a5
{
  id v5;
  id WeakRetained;
  char v9;
  id v10;
  id v11;
  id location[2];
  SUSUISoftwareUpdateClientManager *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v13->_completionQueue);
  WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&v13->_delegate);
    objc_msgSend(v5, "manager:downloadDidFinish:withInstallPolicy:", v13, v11, v10);

  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
  id v5;
  id WeakRetained;
  char v9;
  id v10;
  id v11;
  id location[2];
  SUSUISoftwareUpdateClientManager *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v13->_completionQueue);
  WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&v13->_delegate);
    objc_msgSend(v5, "manager:downloadDidFail:withError:", v13, v11, v10);

  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installDidStart:(id)a4
{
  id v4;
  id WeakRetained;
  char v7;
  id v8;
  id location[2];
  SUSUISoftwareUpdateClientManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    objc_msgSend(v4, "manager:installDidStart:", v10, v8);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  id v5;
  id WeakRetained;
  char v9;
  id v10;
  id v11;
  id location[2];
  SUSUISoftwareUpdateClientManager *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v13->_completionQueue);
  WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&v13->_delegate);
    objc_msgSend(v5, "manager:installDidFail:withError:", v13, v11, v10);

  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installDidFinish:(id)a4
{
  id v4;
  id WeakRetained;
  char v7;
  id v8;
  id location[2];
  SUSUISoftwareUpdateClientManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    objc_msgSend(v4, "manager:installDidFinish:", v10, v8);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installTonightScheduled:(BOOL)a4 operationID:(id)a5
{
  id v7;
  BOOL v8;
  id location[2];
  dispatch_queue_t *v10;

  v10 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = a4;
  v7 = 0;
  objc_storeStrong(&v7, a5);
  dispatch_assert_queue_V2(v10[2]);
  -[dispatch_queue_t setAutoUpdateScheduled:](v10, "setAutoUpdateScheduled:", v8);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 rollbackDidStart:(id)a4
{
  os_log_t oslog;
  id v6;
  id location[2];
  dispatch_queue_t *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  dispatch_assert_queue_V2(v8[2]);
  oslog = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_34_8_66((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:rollbackDidStart:]", (uint64_t)v6);
    _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[dispatch_queue_t setRollingBack:rollback:](v8, "setRollingBack:rollback:", 1, v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 rollbackDidFinish:(id)a4
{
  os_log_t oslog;
  id v6;
  id location[2];
  dispatch_queue_t *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  dispatch_assert_queue_V2(v8[2]);
  oslog = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_34_8_66((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:rollbackDidFinish:]", (uint64_t)v6);
    _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[dispatch_queue_t setRollingBack:rollback:](v8, "setRollingBack:rollback:", 0, v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 rollbackDidFail:(id)a4 withError:(id)a5
{
  os_log_t oslog;
  id v8;
  id v9;
  id location[2];
  dispatch_queue_t *v11;
  uint8_t v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  dispatch_assert_queue_V2(v11[2]);
  oslog = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_34_8_66_8_64((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:rollbackDidFail:withError:]", (uint64_t)v9, (uint64_t)v8);
    _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@\n Error: %@", v12, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[dispatch_queue_t setRollingBack:rollback:](v11, "setRollingBack:rollback:", 0, v9);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 inUserInteraction:(id)a4
{
  id v4;
  id WeakRetained;
  char v6;
  id v8;
  id v9;
  id location[2];
  SUSUISoftwareUpdateClientManager *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v11->_completionQueue);
  v8 = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_34((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:inUserInteraction:]");
    _os_log_impl(&dword_21BF33000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%{public}s", v12, 0xCu);
  }
  objc_storeStrong(&v8, 0);
  WeakRetained = objc_loadWeakRetained((id *)&v11->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)&v11->_delegate);
    objc_msgSend(v4, "manager:inUserInteraction:", v11, v9);

  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 handleUIForDDMDeclaration:(id)a4
{
  id v4;
  id WeakRetained;
  char v6;
  id v8;
  id v9;
  id location[2];
  SUSUISoftwareUpdateClientManager *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v11->_completionQueue);
  v8 = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_34_8_66((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:handleUIForDDMDeclaration:]", (uint64_t)v9);
    _os_log_impl(&dword_21BF33000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", v12, 0x16u);
  }
  objc_storeStrong(&v8, 0);
  WeakRetained = objc_loadWeakRetained((id *)&v11->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)&v11->_delegate);
    objc_msgSend(v4, "manager:handleDDMDeclaration:", v11, v9);

  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 clearingSpaceForDownload:(id)a4 clearingSpace:(BOOL)a5
{
  id v5;
  id WeakRetained;
  char v7;
  id v10;
  BOOL v11;
  id v12;
  id location[2];
  SUSUISoftwareUpdateClientManager *v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)v14->_completionQueue);
  v10 = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_34_4_0((uint64_t)v15, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:clearingSpaceForDownload:clearingSpace:]", v11);
    _os_log_impl(&dword_21BF33000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "%{public}s, clearing = %d", v15, 0x12u);
  }
  objc_storeStrong(&v10, 0);
  WeakRetained = objc_loadWeakRetained((id *)&v14->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&v14->_delegate);
    objc_msgSend(v5, "manager:clearingSpaceForDownload:clearingSpace:", v14, v12, v11);

  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationWasCancelled:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateClientManager *v9;
  id location[2];
  SUSUISoftwareUpdateClientManager *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v11->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __69__SUSUISoftwareUpdateClientManager_autoInstallOperationWasCancelled___block_invoke;
  v8 = &unk_24DFF7B58;
  v9 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __69__SUSUISoftwareUpdateClientManager_autoInstallOperationWasCancelled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAutoUpdateScheduled:", 0, a1, a1);
}

- (void)autoInstallOperationDidConsent:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationIsReadyToInstall:(id)a3 withResponse:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationPasscodePolicyDidChange:(id)a3 passcodePolicyType:(unint64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (SUSUISoftwareUpdateClientManagerDelegate)delegate
{
  return (SUSUISoftwareUpdateClientManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_autoInstallOperation);
  objc_storeStrong((id *)&self->_rollbackDescriptor, 0);
  objc_storeStrong((id *)&self->_suClient, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
