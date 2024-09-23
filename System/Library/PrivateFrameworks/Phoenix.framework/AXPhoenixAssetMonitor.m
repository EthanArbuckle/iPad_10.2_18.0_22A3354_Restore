@implementation AXPhoenixAssetMonitor

- (AXPhoenixAssetMonitor)initWithDelegate:(id)a3
{
  AXPhoenixAssetMonitor *v3;
  AXAssetController *v4;
  AXAssetController *assetController;
  AXPhoenixAssetMonitor *v7;
  id v8;
  void *v9;
  AXPhoenixAssetPolicy *v10;
  id v11;
  objc_super v12;
  id location[2];
  AXPhoenixAssetMonitor *v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)AXPhoenixAssetMonitor;
  v14 = -[AXPhoenixAssetMonitor init](&v12, sel_init);
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    -[AXPhoenixAssetMonitor setDelegate:](v14, "setDelegate:", location[0]);
    v8 = +[AXAssetPolicy policy](AXPhoenixAssetPolicy, "policy");
    -[AXPhoenixAssetMonitor setAssetPolicy:](v14, "setAssetPolicy:");

    v9 = (void *)MEMORY[0x24BDFDD30];
    v10 = -[AXPhoenixAssetMonitor assetPolicy](v14, "assetPolicy");
    v4 = (AXAssetController *)(id)objc_msgSend(v9, "assetControllerWithPolicy:qosClass:");
    assetController = v14->_assetController;
    v14->_assetController = v4;

    -[AXAssetController setUserInitiated:](v14->_assetController, "setUserInitiated:", 1);
    -[AXAssetController addObserver:](v14->_assetController, "addObserver:", v14);
    v11 = (id)AXLogBackTap();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v15, (uint64_t)"-[AXPhoenixAssetMonitor initWithDelegate:]", (uint64_t)v14);
      _os_log_impl(&dword_228CDB000, (os_log_t)v11, OS_LOG_TYPE_INFO, "[PHOENIX] %s [%@]: Model loading: Initiating download", v15, 0x16u);
    }
    objc_storeStrong(&v11, 0);
    -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](v14->_assetController, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", 0, 0, 0);
  }
  v7 = v14;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v7;
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v6;
  os_log_t oslog;
  id v11;
  BOOL v12;
  id v13;
  id location[2];
  AXPhoenixAssetMonitor *v15;
  uint8_t v16[40];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = a5;
  v11 = 0;
  objc_storeStrong(&v11, a6);
  oslog = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v16, (uint64_t)"-[AXPhoenixAssetMonitor assetController:didFinishRefreshingAssets:wasSuccessful:error:]", (uint64_t)v15, (uint64_t)v13);
    _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_INFO, "[PHOENIX] %s [%@]: Model loading: Refreshed Assets:\n%@", v16, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = (id)objc_msgSend(v13, "lastObject");
  -[AXPhoenixAssetMonitor setLatestAsset:](v15, "setLatestAsset:");

  -[AXPhoenixAssetMonitor assetDidUpdate](v15, "assetDidUpdate");
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  os_log_t oslog;
  BOOL v12;
  id v13;
  BOOL v14;
  id v15;
  id location[2];
  AXPhoenixAssetMonitor *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = a5;
  v13 = 0;
  objc_storeStrong(&v13, a6);
  v12 = a7;
  if (v14)
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v18, (uint64_t)"-[AXPhoenixAssetMonitor assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]", (uint64_t)v17, (uint64_t)v15);
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_INFO, "[PHOENIX] %s [%@]: Model loading: Downloaded Asset:\n%@", v18, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[AXPhoenixAssetMonitor setLatestAsset:](v17, "setLatestAsset:", v15);
    -[AXPhoenixAssetMonitor assetDidUpdate](v17, "assetDidUpdate");
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)assetDidUpdate
{
  AXAsset *v2;
  id v3;
  AXAsset *v4;
  AXPhoenixAssetMonitorDelegate *v5;
  AXAsset *v6;
  id location[2];
  AXPhoenixAssetMonitor *v8;
  uint8_t v9[40];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = self;
  location[1] = (id)a2;
  location[0] = (id)AXLogBackTap();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    v6 = -[AXPhoenixAssetMonitor latestAsset](v8, "latestAsset");
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v9, (uint64_t)"-[AXPhoenixAssetMonitor assetDidUpdate]", (uint64_t)v8, (uint64_t)v6);
    _os_log_impl(&dword_228CDB000, (os_log_t)location[0], OS_LOG_TYPE_INFO, "[PHOENIX] %s [%@]: Model loading: Got assets:\n%@", v9, 0x20u);

  }
  objc_storeStrong(location, 0);
  v5 = -[AXPhoenixAssetMonitor delegate](v8, "delegate");
  v4 = -[AXPhoenixAssetMonitor latestAsset](v8, "latestAsset");
  v3 = (id)-[AXAsset localURL](v4, "localURL");
  v2 = -[AXPhoenixAssetMonitor latestAsset](v8, "latestAsset");
  -[AXPhoenixAssetMonitorDelegate modelDidUpdate:assetVersion:](v5, "modelDidUpdate:assetVersion:", v3, -[AXAsset contentVersion](v2, "contentVersion"));

}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_assetController, a3);
}

- (AXPhoenixAssetPolicy)assetPolicy
{
  return self->_assetPolicy;
}

- (void)setAssetPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_assetPolicy, a3);
}

- (AXAsset)latestAsset
{
  return self->_latestAsset;
}

- (void)setLatestAsset:(id)a3
{
  objc_storeStrong((id *)&self->_latestAsset, a3);
}

- (AXPhoenixAssetMonitorDelegate)delegate
{
  return (AXPhoenixAssetMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestAsset, 0);
  objc_storeStrong((id *)&self->_assetPolicy, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
}

@end
