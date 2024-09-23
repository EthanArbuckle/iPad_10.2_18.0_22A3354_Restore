@implementation SUSUIMockedSUManagerClient

- (SUSUIMockedSUManagerClient)initWithDelegate:(id)a3 queue:(id)a4 clientType:(int)a5
{
  SUSUIMockedSUManagerClient *v5;
  SUSUIMockedSUManagerClient *v7;
  id v8;
  SUSUIMockedSUManagerClient *v11;
  objc_super v12;
  int v13;
  id v14;
  id location[2];
  SUSUIMockedSUManagerClient *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = a5;
  v5 = v16;
  v16 = 0;
  v12.receiver = v5;
  v12.super_class = (Class)SUSUIMockedSUManagerClient;
  v11 = -[SUManagerClient initWithDelegate:queue:clientType:](&v12, sel_initWithDelegate_queue_clientType_, location[0], v14, a5);
  v16 = v11;
  objc_storeStrong((id *)&v16, v11);
  if (v11)
  {
    -[SUManagerClient invalidate](v16, "invalidate");
    if (location[0])
    {
      v8 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
      objc_msgSend(v8, "addResponderDelegate:forServiceType:", location[0], 0);

    }
  }
  v7 = v16;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v16, 0);
  return v7;
}

- (void)isScanning:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, char, id);
  void *v8;
  id v9;
  id location[2];
  SUSUIMockedSUManagerClient *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUIMockedSUManagerClient controllerStrategy](v11, "controllerStrategy");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __41__SUSUIMockedSUManagerClient_isScanning___block_invoke;
  v8 = &unk_24DFFC900;
  v9 = location[0];
  objc_msgSend(v3, "isScanning:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __41__SUSUIMockedSUManagerClient_isScanning___block_invoke(uint64_t a1, char a2, id obj)
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  id location;
  char v15;
  uint64_t v16;

  v16 = a1;
  v15 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v13 = a1;
  if (*(_QWORD *)(a1 + 32))
  {
    queue = MEMORY[0x24BDAC9B8];
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __41__SUSUIMockedSUManagerClient_isScanning___block_invoke_2;
    v9 = &unk_24DFF7D60;
    v11 = *(id *)(a1 + 32);
    v12 = v15 & 1;
    v10 = location;
    dispatch_async(queue, &v5);

    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __41__SUSUIMockedSUManagerClient_isScanning___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

- (void)scanForUpdates:(id)a3 withScanResults:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(id *, void *, void *);
  void *v11;
  id v12;
  id v13;
  id location[2];
  SUSUIMockedSUManagerClient *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v6 = -[SUSUIMockedSUManagerClient controllerStrategy](v15, "controllerStrategy");
  v5 = location[0];
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __61__SUSUIMockedSUManagerClient_scanForUpdates_withScanResults___block_invoke;
  v11 = &unk_24DFFCC30;
  v12 = v13;
  objc_msgSend(v6, "scanForUpdates:withScanResults:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __61__SUSUIMockedSUManagerClient_scanForUpdates_withScanResults___block_invoke(id *a1, void *a2, void *a3)
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

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  if (a1[4])
  {
    queue = MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __61__SUSUIMockedSUManagerClient_scanForUpdates_withScanResults___block_invoke_2;
    v10 = &unk_24DFF7E28;
    v13[0] = a1[4];
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

uint64_t __61__SUSUIMockedSUManagerClient_scanForUpdates_withScanResults___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)autoScanAndDownloadIfAvailable:(id)a3
{
  void (**v3)(id, _QWORD);
  id v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(id, _QWORD))location[0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAED98], 0, 0);
  v3[2](v3, 0);

  objc_storeStrong(location, 0);
}

- (void)isClearingSpaceForDownload:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, _QWORD, _QWORD))location[0] + 2))(location[0], 0, 0);
  objc_storeStrong(location, 0);
}

- (void)descriptors:(id)a3
{
  void (**v3)(id, _QWORD);
  id v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(id, _QWORD))location[0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAED98], 0, 0);
  v3[2](v3, 0);

  objc_storeStrong(location, 0);
}

- (id)getDocumentationDataForInstalledUpdateType:(int)a3 error:(id *)a4
{
  return 0;
}

- (void)isDownloading:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)startDownload:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, char, id);
  void *v11;
  id v12;
  id v13;
  id location[2];
  SUSUIMockedSUManagerClient *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v6 = -[SUSUIMockedSUManagerClient controllerStrategy](v15, "controllerStrategy");
  v5 = location[0];
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __66__SUSUIMockedSUManagerClient_startDownloadWithOptions_withResult___block_invoke;
  v11 = &unk_24DFFC900;
  v12 = v13;
  objc_msgSend(v6, "startDownloadWithOptions:withResult:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __66__SUSUIMockedSUManagerClient_startDownloadWithOptions_withResult___block_invoke(uint64_t a1, char a2, id obj)
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  id location;
  char v15;
  uint64_t v16;

  v16 = a1;
  v15 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v13 = a1;
  if (*(_QWORD *)(a1 + 32))
  {
    queue = MEMORY[0x24BDAC9B8];
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __66__SUSUIMockedSUManagerClient_startDownloadWithOptions_withResult___block_invoke_2;
    v9 = &unk_24DFF7D60;
    v11 = *(id *)(a1 + 32);
    v12 = v15 & 1;
    v10 = location;
    dispatch_async(queue, &v5);

    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __66__SUSUIMockedSUManagerClient_startDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

- (void)pauseDownload:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)resumeDownload:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)updateDownloadOptions:(id)a3 withResult:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __63__SUSUIMockedSUManagerClient_updateDownloadOptions_withResult___block_invoke;
  v10 = &unk_24DFF7BA8;
  v11 = v12;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

uint64_t __63__SUSUIMockedSUManagerClient_updateDownloadOptions_withResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
}

- (void)download:(id)a3
{
  SUSUIMockedSUManagerClient *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *, void *, void *, void *);
  void *v8;
  id v9;
  id location[2];
  SUSUIMockedSUManagerClient *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __39__SUSUIMockedSUManagerClient_download___block_invoke;
  v8 = &unk_24DFFE468;
  v9 = location[0];
  -[SUSUIMockedSUManagerClient downloadAndInstallState:](v3, "downloadAndInstallState:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __39__SUSUIMockedSUManagerClient_download___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11 = 0;
  objc_storeStrong(&v11, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = 0;
  objc_storeStrong(&v9, a5);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)downloadAndInstallState:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *, void *, void *, void *, void *);
  void *v8;
  id v9;
  id location[2];
  SUSUIMockedSUManagerClient *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUIMockedSUManagerClient controllerStrategy](v11, "controllerStrategy");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __54__SUSUIMockedSUManagerClient_downloadAndInstallState___block_invoke;
  v8 = &unk_24DFFE468;
  v9 = location[0];
  objc_msgSend(v3, "downloadAndInstallState:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __54__SUSUIMockedSUManagerClient_downloadAndInstallState___block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  NSObject *queue;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19[2];
  id v20;
  id v21;
  id v22;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v22 = 0;
  objc_storeStrong(&v22, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = 0;
  objc_storeStrong(&v20, a5);
  v19[1] = a1;
  if (a1[4])
  {
    queue = MEMORY[0x24BDAC9B8];
    v10 = MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __54__SUSUIMockedSUManagerClient_downloadAndInstallState___block_invoke_2;
    v14 = &unk_24DFFE490;
    v19[0] = a1[4];
    v15 = location[0];
    v16 = v22;
    v17 = v21;
    v18 = v20;
    dispatch_async(queue, &v10);

    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(v19, 0);
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

uint64_t __54__SUSUIMockedSUManagerClient_downloadAndInstallState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
}

- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, char, char, id, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  SUSUIMockedSUManagerClient *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v9 = -[SUSUIMockedSUManagerClient controllerStrategy](v19, "controllerStrategy");
  v7 = location[0];
  v8 = v17;
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __99__SUSUIMockedSUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke;
  v14 = &unk_24DFFE4B8;
  v15 = v16;
  objc_msgSend(v9, "updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:", v7, v8);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __99__SUSUIMockedSUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke(uint64_t a1, char a2, char a3, id obj, void *a5)
{
  id v7;
  id location;
  char v9;
  char v10;
  uint64_t v11;

  v11 = a1;
  v10 = a2 & 1;
  v9 = a3 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v7 = 0;
  objc_storeStrong(&v7, a5);
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
}

- (void)deviceHasSufficientSpaceForDownloads:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)extraSpaceNeededForDownloadWithoutAppPurging:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4
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

- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4
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

- (void)eligibleRollbackWithOptions:(id)a3 withResult:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __69__SUSUIMockedSUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke;
  v10 = &unk_24DFF7BA8;
  v11 = v12;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

uint64_t __69__SUSUIMockedSUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
}

- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4
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

- (void)previousRollbackWithOptions:(id)a3 withResult:(id)a4
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

- (void)isRollingBack:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __44__SUSUIMockedSUManagerClient_isRollingBack___block_invoke;
  v8 = &unk_24DFF7BA8;
  v9 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __44__SUSUIMockedSUManagerClient_isRollingBack___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
}

- (void)scheduleRollbackRebootForLater:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)isSplatOnlyUpdateInstalled
{
  return 1;
}

- (BOOL)isSplatOnlyUpdateRollbackAllowed:(id *)a3
{
  return 1;
}

- (BOOL)setLastRollbackDescriptor:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)securityResponseRollbackSuggested:(id)a3 error:(id *)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)currentAutoInstallOperation:(BOOL)a3 withResult:(id)a4
{
  id location;
  BOOL v5;
  SEL v6;
  SUSUIMockedSUManagerClient *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  objc_storeStrong(&location, 0);
}

- (void)currentPasscodePolicy:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)isAutoUpdateEnabled:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)isAutoUpdateScheduled:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __52__SUSUIMockedSUManagerClient_isAutoUpdateScheduled___block_invoke;
  v8 = &unk_24DFF7BA8;
  v9 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __52__SUSUIMockedSUManagerClient_isAutoUpdateScheduled___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
}

- (void)presentAutoUpdateBanner:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)isUpdateReadyForInstallation:(id)a3
{
  id location[2];
  SUSUIMockedSUManagerClient *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, uint64_t, _QWORD))location[0] + 2))(location[0], 1, 0);
  -[SUSUIMockedSUManagerClient isUpdateReadyForInstallationWithOptions:withResult:](v4, "isUpdateReadyForInstallationWithOptions:withResult:", 0, location[0]);
  objc_storeStrong(location, 0);
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, char, id);
  void *v11;
  id v12;
  id v13;
  id location[2];
  SUSUIMockedSUManagerClient *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v6 = -[SUSUIMockedSUManagerClient controllerStrategy](v15, "controllerStrategy");
  v5 = location[0];
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __81__SUSUIMockedSUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke;
  v11 = &unk_24DFFC900;
  v12 = v13;
  objc_msgSend(v6, "isUpdateReadyForInstallationWithOptions:withResult:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __81__SUSUIMockedSUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke(uint64_t a1, char a2, id obj)
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  id location;
  char v15;
  uint64_t v16;

  v16 = a1;
  v15 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v13 = a1;
  if (*(_QWORD *)(a1 + 32))
  {
    queue = MEMORY[0x24BDAC9B8];
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __81__SUSUIMockedSUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2;
    v9 = &unk_24DFF7D60;
    v11 = *(id *)(a1 + 32);
    v12 = v15 & 1;
    v10 = location;
    dispatch_async(queue, &v5);

    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __81__SUSUIMockedSUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

- (void)installUpdate:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, uint64_t, _QWORD))location[0] + 2))(location[0], 1, 0);
  objc_storeStrong(location, 0);
}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, char, id);
  void *v11;
  id v12;
  id v13;
  id location[2];
  SUSUIMockedSUManagerClient *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v6 = -[SUSUIMockedSUManagerClient controllerStrategy](v15, "controllerStrategy");
  v5 = location[0];
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __73__SUSUIMockedSUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke;
  v11 = &unk_24DFFC900;
  v12 = v13;
  objc_msgSend(v6, "installUpdateWithInstallOptions:withResult:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __73__SUSUIMockedSUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke(uint64_t a1, char a2, id obj)
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  id location;
  char v15;
  uint64_t v16;

  v16 = a1;
  v15 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v13 = a1;
  if (*(_QWORD *)(a1 + 32))
  {
    queue = MEMORY[0x24BDAC9B8];
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __73__SUSUIMockedSUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke_2;
    v9 = &unk_24DFF7D60;
    v11 = *(id *)(a1 + 32);
    v12 = v15 & 1;
    v10 = location;
    dispatch_async(queue, &v5);

    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __73__SUSUIMockedSUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

- (BOOL)isInstallationKeybagRequired
{
  id v3;
  char v4;

  v3 = -[SUSUIMockedSUManagerClient controllerStrategy](self, "controllerStrategy");
  v4 = objc_msgSend(v3, "isInstallationKeybagRequiredForDescriptor:", 0);

  return v4 & 1;
}

- (BOOL)isInstallationKeybagRequiredForDescriptor:(id)a3
{
  id v4;
  char v5;
  id location[2];
  SUSUIMockedSUManagerClient *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[SUSUIMockedSUManagerClient controllerStrategy](v7, "controllerStrategy");
  v5 = objc_msgSend(v4, "isInstallationKeybagRequiredForDescriptor:", location[0]);

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)createInstallationKeybagWithOptions:(id)a3
{
  id v4;
  char v5;
  id location[2];
  SUSUIMockedSUManagerClient *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[SUSUIMockedSUManagerClient controllerStrategy](v7, "controllerStrategy");
  v5 = objc_msgSend(v4, "createInstallationKeybagWithOptions:", location[0]);

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)destroyInstallationKeybag
{
  id v2;

  v2 = -[SUSUIMockedSUManagerClient controllerStrategy](self, "controllerStrategy");
  objc_msgSend(v2, "destroyInstallationKeybag");

}

- (void)slaVersion:(id)a3
{
  objc_super v3;
  id location[2];
  SUSUIMockedSUManagerClient *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)SUSUIMockedSUManagerClient;
  -[SUManagerClient slaVersion:](&v3, sel_slaVersion_, location[0]);
  objc_storeStrong(location, 0);
}

- (void)softwareUpdatePathRestriction:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, _QWORD, _QWORD))location[0] + 2))(location[0], 0, 0);
  objc_storeStrong(location, 0);
}

- (void)isDelayingUpdates:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, _QWORD, _QWORD))location[0] + 2))(location[0], 0, 0);
  objc_storeStrong(location, 0);
}

- (void)delayEndDate:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)setMandatorySoftwareUpdateDictionary:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)getMandatorySoftwareUpdateDictionary:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isAutomaticUpdateV2Enabled
{
  return 1;
}

- (BOOL)isAutoUpdateScheduled
{
  return 0;
}

- (BOOL)isAutomaticDownloadEnabled
{
  return 1;
}

- (void)areUpdatesDownloadableWithOptions:(id)a3 alternateUpdateOptions:(id)a4 preferredUpdateDownloadable:(BOOL *)a5 alternateUpdateDownloadable:(BOOL *)a6 preferredUpdateError:(id *)a7 alternateUpdateError:(id *)a8
{
  id v8;
  id v9;
  id v10;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(_QWORD *, char, char, id, void *);
  void *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  int v27;
  int v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  int v34;
  int v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  int v41;
  int v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  int v46;
  int v47;
  char v48;
  id *v49;
  id *v50;
  BOOL *v51;
  BOOL *v52;
  id v53;
  id location[2];
  SUSUIMockedSUManagerClient *v55;

  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v53 = 0;
  objc_storeStrong(&v53, a4);
  v52 = a5;
  v51 = a6;
  v50 = a7;
  v49 = a8;
  v44 = 0;
  v45 = &v44;
  v46 = 0x20000000;
  v47 = 32;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x20000000;
  v42 = 32;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 838860800;
  v35 = 48;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  v38 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 838860800;
  v28 = 48;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  v10 = -[SUSUIMockedSUManagerClient controllerStrategy](v55, "controllerStrategy");
  v16 = MEMORY[0x24BDAC760];
  v17 = -1073741824;
  v18 = 0;
  v19 = __185__SUSUIMockedSUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke;
  v20 = &unk_24DFFE4E0;
  v21 = &v44;
  v22 = &v39;
  v23 = &v32;
  v24 = &v25;
  objc_msgSend(v10, "updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:", location[0], v53, &v16);

  if (v52)
    *v52 = v45[3] & 1;
  if (v51)
    *v51 = v40[3] & 1;
  if (v50)
  {
    v8 = objc_retainAutorelease((id)v33[5]);
    *v50 = v8;
  }
  if (v49)
  {
    v9 = objc_retainAutorelease((id)v26[5]);
    *v49 = v9;
  }
  _Block_object_dispose(&v25, 8);
  objc_storeStrong(&v31, 0);
  _Block_object_dispose(&v32, 8);
  objc_storeStrong(&v38, 0);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v44, 8);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
}

void __185__SUSUIMockedSUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke(_QWORD *a1, char a2, char a3, id obj, void *a5)
{
  id v7;
  id location;
  char v9;
  char v10;
  _QWORD *v11;

  v11 = a1;
  v10 = a2 & 1;
  v9 = a3 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v7 = 0;
  objc_storeStrong(&v7, a5);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v10 & 1;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v9 & 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), location);
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
}

- (BOOL)writeKeepAliveFile
{
  return 0;
}

- (void)recordSUAnalyticsEvent:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)submitSUAnalyticsEvent:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)submitSUAnalyticsEventsWithName:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)controllerStrategy
{
  id v3;
  NSObject *log;
  os_log_type_t type;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15[3];
  id v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15[2] = self;
  v15[1] = (id)a2;
  v10 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
  v9 = (id)objc_msgSend(v10, "currentSession");
  v15[0] = (id)objc_msgSend(v9, "strategyForServiceType:", 0);

  getSUSMKSoftwareUpdateServicesStrategyBaseClass_1();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15[0];
  }
  else
  {
    v14 = _SUSUIInternalLoggingFacility();
    v13 = 16;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      log = v14;
      type = v13;
      v8 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
      v7 = (id)objc_msgSend(v8, "currentSession");
      v6 = (id)objc_msgSend(v7, "correlationId");
      v3 = v6;
      v12 = v3;
      v11 = (id)objc_opt_class();
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)v11);
      _os_log_error_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] The strategy class %@ doesn't inherit SUSMKSoftwareUpdateServicesStrategyBase.", v17, 0x16u);

      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v12, 0);
    }
    objc_storeStrong(&v14, 0);
    v16 = 0;
  }
  objc_storeStrong(v15, 0);
  return v16;
}

@end
