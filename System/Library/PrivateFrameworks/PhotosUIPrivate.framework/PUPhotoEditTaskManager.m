@implementation PUPhotoEditTaskManager

- (PUPhotoEditTaskManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditTaskManager;
  return -[PUPhotoEditTaskManager init](&v3, sel_init);
}

- (void)createEditableCopyForReadOnlyPhoto:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditTaskManager.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(v7, "pl_managedAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainFileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__61745;
  v24[4] = __Block_byref_object_dispose__61746;
  v25 = 0;
  objc_msgSend(v7, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke;
  v21[3] = &unk_1E58AAE48;
  v13 = v10;
  v22 = v13;
  v23 = v24;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke_2;
  v17[3] = &unk_1E58A4408;
  v20 = v24;
  v14 = v11;
  v18 = v14;
  v15 = v8;
  v19 = v15;
  objc_msgSend(v14, "performChanges:completionHandler:", v21, v17);

  _Block_object_dispose(v24, 8);
}

void __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD13B0], "creationRequestForAssetFromImageAtFileURL:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeholderForCreatedAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CD1390];
    v18[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAssetsWithLocalIdentifiers:options:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke_3;
  block[3] = &unk_1E58ABAF0;
  v11 = *(id *)(a1 + 40);
  v16 = v5;
  v17 = v11;
  v15 = v10;
  v12 = v5;
  v13 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_61758);
  return (id)sharedManager__sharedInstance;
}

void __39__PUPhotoEditTaskManager_sharedManager__block_invoke()
{
  PUPhotoEditTaskManager *v0;
  void *v1;

  v0 = objc_alloc_init(PUPhotoEditTaskManager);
  v1 = (void *)sharedManager__sharedInstance;
  sharedManager__sharedInstance = (uint64_t)v0;

}

@end
