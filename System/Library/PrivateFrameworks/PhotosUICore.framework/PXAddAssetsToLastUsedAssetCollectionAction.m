@implementation PXAddAssetsToLastUsedAssetCollectionAction

- (PXAddAssetsToLastUsedAssetCollectionAction)initWithAssets:(id)a3
{
  return -[PXAddAssetsToLastUsedAssetCollectionAction initWithAssets:error:](self, "initWithAssets:error:", a3, 0);
}

- (PXAddAssetsToLastUsedAssetCollectionAction)initWithAssets:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  PXAddAssetsToLastUsedAssetCollectionAction *v12;
  PXAddAssetsToAssetCollectionAction *v13;
  PXAddAssetsToAssetCollectionAction *underlyingAction;
  PXAddAssetsToLastUsedAssetCollectionAction *v15;
  objc_super v17;

  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetAssetCollectionInPhotoLibrary:error:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)PXAddAssetsToLastUsedAssetCollectionAction;
    v12 = -[PXAssetsAction initWithAssets:](&v17, sel_initWithAssets_, v6);
    if (v12)
    {
      v13 = -[PXAddAssetsToAssetCollectionAction initWithAssets:assetCollection:]([PXAddAssetsToAssetCollectionAction alloc], "initWithAssets:assetCollection:", v6, v11);
      underlyingAction = v12->_underlyingAction;
      v12->_underlyingAction = v13;

    }
    self = v12;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)localizedActionName
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[PXPhotosAction photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandTitleWithPhotoLibrary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)performAction:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXAddAssetsToLastUsedAssetCollectionAction underlyingAction](self, "underlyingAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "performAction:", v4);
  else
    v4[2](v4, 1, 0);

}

- (void)performUndo:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXAddAssetsToLastUsedAssetCollectionAction underlyingAction](self, "underlyingAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "performUndo:", v4);
  else
    v4[2](v4, 1, 0);

}

- (void)performRedo:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXAddAssetsToLastUsedAssetCollectionAction underlyingAction](self, "underlyingAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "performRedo:", v4);
  else
    v4[2](v4, 1, 0);

}

- (PXAddAssetsToAssetCollectionAction)underlyingAction
{
  return self->_underlyingAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAction, 0);
}

+ (void)userDidAddAssetsToAssetCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setString:forKey:", v6, CFSTR("LastAddToDestination"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDate:forKey:", v7, CFSTR("LastAddToDestinationDate"));

  px_dispatch_on_main_queue();
}

+ (id)targetAssetCollectionInPhotoLibrary:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAddAssetsToLastUsedAssetCollectionAction.m"), 60, CFSTR("%s must be called on the main thread"), "+[PXAddAssetsToLastUsedAssetCollectionAction targetAssetCollectionInPhotoLibrary:error:]");

  }
  if (targetAssetCollectionInPhotoLibrary_error__targetAssetCollection)
  {
    objc_msgSend((id)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      v10 = (id)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection;
      goto LABEL_24;
    }
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("target asset collection for 'add to last used asset collection' couldn't be determined because the photo library is missing"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_21;
    goto LABEL_20;
  }
  objc_msgSend(v7, "px_localDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateForKey:", CFSTR("LastAddToDestinationDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12
    || (objc_msgSend(MEMORY[0x1E0C99D68], "now"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "px_isWithinTimeInterval:sinceDate:", v12, 2592000.0),
        v13,
        !v14))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("target asset collection for 'add to last used asset collection' couldn't be determined because the date is too old or missing"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_msgSend(v11, "stringForKey:", CFSTR("LastAddToDestination"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v15)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = CFSTR("target asset collection for 'add to last used asset collection' couldn't be determined because its local identifier is missing");
LABEL_17:
    objc_msgSend(v24, "px_genericErrorWithDebugDescription:", v25, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v17 = (void *)MEMORY[0x1E0CD13B8];
  v31[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fetchAssetCollectionsWithLocalIdentifiers:options:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection;
  targetAssetCollectionInPhotoLibrary_error__targetAssetCollection = v21;

  if (!targetAssetCollectionInPhotoLibrary_error__targetAssetCollection)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v30 = v16;
    v25 = CFSTR("target asset collection for 'add to last used asset collection' couldn't be found with local identifier %@");
    goto LABEL_17;
  }
  v23 = 0;
LABEL_18:

LABEL_19:
  if (a4)
LABEL_20:
    *a4 = objc_retainAutorelease(v23);
LABEL_21:
  v26 = (void *)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection;
  if (targetAssetCollectionInPhotoLibrary_error__targetAssetCollection)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "performBlock:", &__block_literal_global_64120);

    v26 = (void *)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection;
  }
  v10 = v26;

LABEL_24:
  return v10;
}

+ (id)commandTitleWithPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(a1, "targetAssetCollectionInPhotoLibrary:error:", a3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v4)
  {
    PXLocalizedStringFromTable(CFSTR("ADD_TO_LAST_ALBUM_COMMAND_TITLE_FORMAT"), CFSTR("PhotosUICore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "command title for 'add to last used asset collection' couldn't be determined because destination is missing: %@", buf, 0xCu);
    }

    objc_msgSend(a1, "placeholderCommandTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (NSString)placeholderCommandTitle
{
  return (NSString *)PXLocalizedStringFromTable(CFSTR("ADD_TO_LAST_ALBUM_COMMAND_TITLE_PLACEHOLDER"), CFSTR("PhotosUICore"));
}

+ (void)configureToast:(id)a3 withAlbumName:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v9 = a3;
  PXLocalizedStringFromTable(CFSTR("ADDED_TO_LAST_ALBUM_%@_TOAST_MESSAGE_FORMAT"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setMessage:", v8);
  objc_msgSend(v9, "setIconSystemImageName:", CFSTR("rectangle.stack"));
  objc_msgSend(v9, "setAutoDismissalDelay:", 1.0);

}

void __88__PXAddAssetsToLastUsedAssetCollectionAction_targetAssetCollectionInPhotoLibrary_error___block_invoke()
{
  void *v0;

  v0 = (void *)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection;
  targetAssetCollectionInPhotoLibrary_error__targetAssetCollection = 0;

}

id __80__PXAddAssetsToLastUsedAssetCollectionAction_userDidAddAssetsToAssetCollection___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "targetAssetCollectionInPhotoLibrary:error:", 0, 0);
}

@end
