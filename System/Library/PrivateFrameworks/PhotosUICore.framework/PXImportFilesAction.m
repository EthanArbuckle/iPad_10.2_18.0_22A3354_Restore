@implementation PXImportFilesAction

- (PXImportFilesAction)initWithPhotoLibrary:(id)a3 fileURLs:(id)a4 assetCollection:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXImportFilesAction *v12;
  uint64_t v13;
  NSArray *fileURLs;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportFilesAction.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportFilesAction.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURLs.count"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PXImportFilesAction;
  v12 = -[PXPhotosAction initWithPhotoLibrary:](&v18, sel_initWithPhotoLibrary_, v9);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    fileURLs = v12->_fileURLs;
    v12->_fileURLs = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_assetCollection, a5);
  }

  return v12;
}

- (id)actionIdentifier
{
  return CFSTR("ImportFiles");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXImportFilesActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  NSArray *fileURLs;
  void *v6;
  PHAssetCollection *assetCollection;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  fileURLs = self->_fileURLs;
  -[PXPhotosAction photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  assetCollection = self->_assetCollection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__PXImportFilesAction_performAction___block_invoke;
  v10[3] = &unk_1E5125018;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  v9 = +[PXImportController importFilesAtURLs:photoLibrary:collection:checkDuplicates:referenced:delegate:completionHandler:](PXImportController, "importFilesAtURLs:photoLibrary:collection:checkDuplicates:referenced:delegate:completionHandler:", fileURLs, v6, assetCollection, 1, 0, self, v10);

}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSArray *importedAssetsIdentifiers;
  PHFetchResult *importedAssets;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PXImportFilesAction importedAssets](self, "importedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__PXImportFilesAction_performUndo___block_invoke;
  v9[3] = &unk_1E5149198;
  v10 = v5;
  v6 = v5;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v9, v4);

  importedAssetsIdentifiers = self->_importedAssetsIdentifiers;
  self->_importedAssetsIdentifiers = 0;

  importedAssets = self->_importedAssets;
  self->_importedAssets = 0;

}

- (PHFetchResult)importedAssets
{
  void *v3;
  NSArray *importedAssetsIdentifiers;
  void *v5;
  PHFetchResult *v6;
  PHFetchResult *importedAssets;

  if (!self->_importedAssets && -[NSArray count](self->_importedAssetsIdentifiers, "count"))
  {
    v3 = (void *)MEMORY[0x1E0CD1390];
    importedAssetsIdentifiers = self->_importedAssetsIdentifiers;
    -[PXPhotosAction standardFetchOptions](self, "standardFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchAssetsWithLocalIdentifiers:options:", importedAssetsIdentifiers, v5);
    v6 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    importedAssets = self->_importedAssets;
    self->_importedAssets = v6;

  }
  return self->_importedAssets;
}

- (int64_t)importAsset:(id)a3 asDuplicateOfLibraryAsset:(id)a4 applyToAll:(BOOL *)a5
{
  *a5 = 1;
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importedAssets, 0);
  objc_storeStrong((id *)&self->_importedAssetsIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);
}

uint64_t __35__PXImportFilesAction_performUndo___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD13B0], "deleteAssets:", *(_QWORD *)(a1 + 32));
}

void __37__PXImportFilesAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "result") == 1)
  {
    objc_msgSend(v10, "exceptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "underlyingError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithUnderlyingError:debugDescription:", v5, CFSTR("Import failed"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "importRecords");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "valueForKey:", CFSTR("assetIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 96);
      *(_QWORD *)(v8 + 96) = v7;

      v6 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Import did not complete"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
