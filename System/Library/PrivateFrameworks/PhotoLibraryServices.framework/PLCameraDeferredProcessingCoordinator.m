@implementation PLCameraDeferredProcessingCoordinator

- (PLCameraDeferredProcessingCoordinator)init
{
  void *v3;
  PLCameraDeferredProcessingCoordinator *v4;

  objc_msgSend(MEMORY[0x1E0D73168], "sharedSystemLibraryAssetsdClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLCameraDeferredProcessingCoordinator initWithAssetdClient:](self, "initWithAssetdClient:", v3);

  return v4;
}

- (PLCameraDeferredProcessingCoordinator)initWithAssetdClient:(id)a3
{
  id v5;
  PLCameraDeferredProcessingCoordinator *v6;
  PLCameraDeferredProcessingCoordinator *v7;
  PLCameraDeferredProcessingCoordinator *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLCameraDeferredProcessingCoordinator;
  v6 = -[PLCameraDeferredProcessingCoordinator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetsdClient, a3);
    v8 = v7;
  }

  return v7;
}

- (void)prewarmWithPhotoSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  +[PLCapturePhotoSettings photoSettingsWithPhotoSettings:](PLCapturePhotoSettings, "photoSettingsWithPhotoSettings:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCameraDeferredProcessingCoordinator resourceInternalClient](self, "resourceInternalClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PLCameraDeferredProcessingCoordinator_prewarmWithPhotoSettings_completionHandler___block_invoke;
  v10[3] = &unk_1E36768D0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "prewarmWithCapturePhotoSettings:completionHandler:", v7, v10);

}

- (PLAssetsdResourceInternalClient)resourceInternalClient
{
  return (PLAssetsdResourceInternalClient *)-[PLAssetsdClient resourceInternalClient](self->_assetsdClient, "resourceInternalClient");
}

- (BOOL)prewarmWithPhotoSettings:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  +[PLCapturePhotoSettings photoSettingsWithPhotoSettings:](PLCapturePhotoSettings, "photoSettingsWithPhotoSettings:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCameraDeferredProcessingCoordinator resourceInternalClient](self, "resourceInternalClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "prewarmWithCapturePhotoSettings:error:", v6, a4);

  return (char)a4;
}

- (BOOL)cancelAllPrewarming:(id *)a3
{
  void *v4;

  -[PLCameraDeferredProcessingCoordinator resourceInternalClient](self, "resourceInternalClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "cancelAllPrewarming:", a3);

  return (char)a3;
}

- (void)cancelAllPrewarmingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PLCameraDeferredProcessingCoordinator resourceInternalClient](self, "resourceInternalClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__PLCameraDeferredProcessingCoordinator_cancelAllPrewarmingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E36768D0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "cancelAllPrewarmingWithCompletionHandler:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsdClient, 0);
}

uint64_t __82__PLCameraDeferredProcessingCoordinator_cancelAllPrewarmingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __84__PLCameraDeferredProcessingCoordinator_prewarmWithPhotoSettings_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
