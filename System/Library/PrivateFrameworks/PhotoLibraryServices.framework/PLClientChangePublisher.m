@implementation PLClientChangePublisher

- (PLClientChangePublisher)initWithAssetsdClient:(id)a3
{
  id v5;
  PLClientChangePublisher *v6;
  PLClientChangePublisher *v7;
  PLClientChangePublisher *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLClientChangePublisher;
  v6 = -[PLClientChangePublisher init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetsdClient, a3);
    v8 = v7;
  }

  return v7;
}

- (id)publishChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  PLAssetsdClient *assetsdClient;
  id v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  PLAssetsdClient *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0D73320];
  v11 = a3;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithXPCObject:", v11);

  -[PLAssetsdClient libraryClient](self->_assetsdClient, "libraryClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      assetsdClient = self->_assetsdClient;
      *(_DWORD *)buf = 138412290;
      v21 = assetsdClient;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Assetsd client %@ has nil library client, unable to publish remote change event", buf, 0xCu);
    }

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__PLClientChangePublisher_publishChangeEvent_delayedSaveActionsDetail_transaction___block_invoke;
  v18[3] = &unk_1E3674D50;
  v16 = v9;
  v19 = v16;
  objc_msgSend(v13, "publishRemoteChangeEvent:delayedSaveActionsDetail:completionHandler:", v12, v8, v18);

  return v16;
}

- (void)pauseLaunchEventNotifications
{
  NSObject *v2;
  uint8_t v3[16];

  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_FAULT, "Trying to pause launch event notifications from the client", v3, 2u);
  }

}

- (void)unpauseLaunchEventNotifications
{
  NSObject *v2;
  uint8_t v3[16];

  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_FAULT, "Trying to unpause launch event notifications from the client", v3, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsdClient, 0);
}

void __83__PLClientChangePublisher_publishChangeEvent_delayedSaveActionsDetail_transaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Unable to publish remote change event: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "completeTransaction");

}

@end
