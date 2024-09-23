@implementation WFCloudKitWebServiceAssetDownloadOperation

- (WFCloudKitWebServiceAssetDownloadOperation)initWithAssetURL:(id)a3 item:(id)a4 key:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFCloudKitWebServiceAssetDownloadOperation *v12;
  WFCloudKitWebServiceAssetDownloadOperation *v13;
  WFCloudKitWebServiceAssetDownloadOperation *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WFCloudKitWebServiceAssetDownloadOperation;
  v12 = -[WFCloudKitWebServiceAssetDownloadOperation init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetURL, a3);
    objc_storeWeak((id *)&v13->_item, v10);
    objc_storeStrong((id *)&v13->_key, a5);
    v14 = v13;
  }

  return v13;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)WFCloudKitWebServiceAssetDownloadOperation;
  -[WFCloudKitAsyncOperation start](&v10, sel_start);
  getWFCloudKitWSLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[WFCloudKitWebServiceAssetDownloadOperation item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCloudKitWebServiceAssetDownloadOperation key](self, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v12 = "-[WFCloudKitWebServiceAssetDownloadOperation start]";
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_INFO, "%s Asset fetch operation starting: %@ %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB39F0], "wf_sharedSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitWebServiceAssetDownloadOperation assetURL](self, "assetURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__WFCloudKitWebServiceAssetDownloadOperation_start__block_invoke;
  v9[3] = &unk_1E7AF3D28;
  v9[4] = self;
  objc_msgSend(v6, "downloadTaskWithURL:completionHandler:", v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_assetURL, a3);
}

- (WFCloudKitItem)item
{
  return (WFCloudKitItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_assetURL, 0);
}

void __51__WFCloudKitWebServiceAssetDownloadOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v7, "statusCode") == 200)
  {
    objc_msgSend(MEMORY[0x1E0D13F78], "fileWithURL:options:", v11, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "willChangeValueForKey:", v10);
    objc_msgSend(v9, "setValue:forKey:", v8, v10);
    objc_msgSend(v9, "didChangeValueForKey:", v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishExecuting");

}

@end
