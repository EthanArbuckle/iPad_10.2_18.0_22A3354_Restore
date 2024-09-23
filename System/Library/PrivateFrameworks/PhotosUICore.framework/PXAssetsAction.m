@implementation PXAssetsAction

- (PXAssetsAction)initWithAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXAssetsAction *v8;
  uint64_t v9;
  PXFastEnumeration *assets;
  PXAssetsAction *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PXAssetsAction;
    v8 = -[PXPhotosAction initWithPhotoLibrary:](&v13, sel_initWithPhotoLibrary_, v7);

    if (v8)
    {
      v9 = objc_msgSend(v4, "copy");
      assets = v8->_assets;
      v8->_assets = (PXFastEnumeration *)v9;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PXAssetsAction)initWithAsset:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PXAssetsAction *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXAssetsAction initWithAssets:](self, "initWithAssets:", v6, v9, v10);
  return v7;
}

- (PXAssetsAction)initWithPhotoLibrary:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsAction.m"), 51, CFSTR("%s is not available as initializer"), "-[PXAssetsAction initWithPhotoLibrary:]");

  abort();
}

- (void)performAssetChanges:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PXAssetsAction_performAssetChanges_completionHandler___block_invoke;
  v8[3] = &unk_1E5148CE0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v8, a4);

}

- (id)assets
{
  return self->_assets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
}

void __56__PXAssetsAction_performAssetChanges_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "assets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetsAction.m"), 23, CFSTR("Method %s is a responsibility of subclass %@"), "+[PXAssetsAction canPerformOnAsset:inAssetCollection:]", v11);

  abort();
}

+ (BOOL)canPerformOnAllAssets:(id)a3
{
  return PXExists() ^ 1;
}

uint64_t __40__PXAssetsAction_canPerformOnAllAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "canPerformOnAsset:inAssetCollection:", a2, 0) ^ 1;
}

@end
