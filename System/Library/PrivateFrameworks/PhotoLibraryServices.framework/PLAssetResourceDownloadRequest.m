@implementation PLAssetResourceDownloadRequest

- (void)_onQueueAsync:(id)a3
{
  pl_dispatch_async();
}

- (PLAssetResourceDownloadRequest)initWithRequestID:(int)a3 library:(id)a4 queue:(id)a5 cloudResourceType:(unint64_t)a6 managedObjectID:(id)a7 progressHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PLAssetResourceDownloadRequest *v19;
  PLAssetResourceDownloadRequest *v20;
  uint64_t v21;
  id progressHandler;
  void *v23;
  uint64_t v24;
  NSString *cplTaskIdentifier;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (v17)
  {
    if (v16)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetResourceDownloadRequest.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v15)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetResourceDownloadRequest.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectID"));

  if (!v16)
    goto LABEL_8;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetResourceDownloadRequest.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

LABEL_4:
  v31.receiver = self;
  v31.super_class = (Class)PLAssetResourceDownloadRequest;
  v19 = -[PLAssetResourceDownloadRequest init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_requestID = a3;
    objc_storeStrong((id *)&v19->_queue, a5);
    objc_storeStrong((id *)&v20->_objectID, a7);
    v20->_cloudResourceType = a6;
    v21 = MEMORY[0x19AEC174C](v18);
    progressHandler = v20->_progressHandler;
    v20->_progressHandler = (id)v21;

    objc_storeStrong((id *)&v20->_library, a4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = objc_claimAutoreleasedReturnValue();
    cplTaskIdentifier = v20->_cplTaskIdentifier;
    v20->_cplTaskIdentifier = (NSString *)v24;

  }
  return v20;
}

- (void)main
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  PLPhotoLibrary *library;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  NSObject *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  NSObject *v22;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke;
  v21[3] = &unk_1E36601D0;
  v21[4] = self;
  v5 = v3;
  v22 = v5;
  v6 = (void *)MEMORY[0x19AEC174C](v21);
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_3;
  v20[3] = &unk_1E3660338;
  v20[4] = self;
  v7 = (void *)MEMORY[0x19AEC174C](v20);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_5;
  v18[3] = &unk_1E36601F8;
  v18[4] = self;
  v19 = v5;
  v8 = v5;
  v9 = (void *)MEMORY[0x19AEC174C](v18);
  library = self->_library;
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_7;
  v14[3] = &unk_1E3660220;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v17 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v6;
  -[PLPhotoLibrary performBlock:](library, "performBlock:", v14);
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)cancel
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  NSObject *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLAssetResourceDownloadRequest;
  -[PLAssetResourceDownloadRequest cancel](&v7, sel_cancel);
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PLAssetResourceDownloadRequest_cancel__block_invoke;
  v5[3] = &unk_1E3677C18;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[PLAssetResourceDownloadRequest _onQueueAsync:](self, "_onQueueAsync:", v5);
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

- (int)requestID
{
  return self->_requestID;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (unint64_t)cloudResourceType
{
  return self->_cloudResourceType;
}

- (NSString)cplTaskIdentifier
{
  return self->_cplTaskIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cplTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __40__PLAssetResourceDownloadRequest_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudPhotoLibraryManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 272);
      objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", *(_QWORD *)(v5 + 296));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling download for asset uuid: %@ cloudResourceType: %@", buf, 0x16u);

    }
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__PLAssetResourceDownloadRequest_cancel__block_invoke_36;
    v10[3] = &unk_1E3660360;
    v11 = v8;
    objc_msgSend(v3, "cancelResourceTransferTaskWithIdentifier:completion:", v9, v10);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __40__PLAssetResourceDownloadRequest_cancel__block_invoke_36(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __38__PLAssetResourceDownloadRequest_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_2;
  v8[3] = &unk_1E3677530;
  v6 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v5;
  objc_msgSend(v9, "_onQueueAsync:", v8);

}

uint64_t __38__PLAssetResourceDownloadRequest_main__block_invoke_3(uint64_t a1, float a2)
{
  void *v2;
  _QWORD v4[5];
  float v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_4;
  v4[3] = &unk_1E3660E70;
  v4[4] = v2;
  v5 = a2;
  return objc_msgSend(v2, "_onQueueAsync:", v4);
}

void __38__PLAssetResourceDownloadRequest_main__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_6;
  v9[3] = &unk_1E3677530;
  v7 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v6;
  objc_msgSend(v10, "_onQueueAsync:", v9);

}

void __38__PLAssetResourceDownloadRequest_main__block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1[4] + 288), *(_QWORD *)(a1[4] + 256));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v5 = *(void **)(v4 + 272);
  *(_QWORD *)(v4 + 272) = v3;

  PLBackendGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    v8 = *(_QWORD *)(v7 + 272);
    objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", *(_QWORD *)(v7 + 296));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Initiating download for asset uuid: %@ cloudResourceType: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1[4] + 256), "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cloudPhotoLibraryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "downloadAsset:resourceType:masterResourceOnly:highPriority:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:", v2, *(_QWORD *)(a1[4] + 296), 0, 0, 0, *(_QWORD *)(a1[4] + 304), a1[5], a1[6], a1[7]);
}

void __38__PLAssetResourceDownloadRequest_main__block_invoke_6(uint64_t a1)
{
  void *v2;

  (*(void (**)(double))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) + 16))(1.0);
  v2 = *(void **)(a1 + 40);
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 312), v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __38__PLAssetResourceDownloadRequest_main__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 280), *(float *)(a1 + 40));
}

void __38__PLAssetResourceDownloadRequest_main__block_invoke_2(uint64_t a1)
{
  void *v2;

  (*(void (**)(double))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) + 16))(0.0);
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 312), v2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

@end
