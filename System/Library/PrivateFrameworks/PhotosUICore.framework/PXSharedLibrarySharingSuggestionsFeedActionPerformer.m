@implementation PXSharedLibrarySharingSuggestionsFeedActionPerformer

- (BOOL)handlePrimaryActionOnItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 fromViewController:(id)a5
{
  id v9;
  __int128 v10;
  void *v11;
  BOOL v12;
  void *v14;
  _OWORD v15[2];

  v9 = a5;
  v10 = *(_OWORD *)&a3->item;
  v15[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v15[1] = v10;
  objc_msgSend(a4, "objectReferenceAtIndexPath:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsFeedActionPerformer.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectReference != nil"));

  }
  v12 = -[PXSharedLibrarySharingSuggestionsFeedActionPerformer navigateToObjectReference:originalSource:fromViewController:animated:willPresentHandler:completionHandler:](self, "navigateToObjectReference:originalSource:fromViewController:animated:willPresentHandler:completionHandler:", v11, 0, v9, 1, 0, 0);

  return v12;
}

- (BOOL)navigateToObjectReference:(id)a3 originalSource:(id)a4 fromViewController:(id)a5 animated:(BOOL)a6 willPresentHandler:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  id v14;
  void (**v15)(id, PXPhotosUIViewController *);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  PXPhotosUIViewController *v26;
  BOOL v27;
  void *v28;
  void *v30;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  id v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  void (**v38)(id, PXPhotosUIViewController *);
  _QWORD block[4];
  PXPhotosUIViewController *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v10 = a6;
  v44 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = (void (**)(id, PXPhotosUIViewController *))a7;
  v16 = a8;
  objc_msgSend(a3, "itemObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v38 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_descriptionForAssertionMessage");
    v34 = v16;
    v35 = v10;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsFeedActionPerformer.m"), 81, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference.itemObject"), v32, v36);

    v10 = v35;
    v16 = v34;
  }
  else
  {
    v38 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsFeedActionPerformer.m"), 81, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference.itemObject"), v32);
  }

  v15 = v38;
LABEL_3:
  objc_msgSend(v17, "fetchAssetCollections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v17, "containerCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _PhotosViewConfigurationWithSuggestions(v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v37 = v16;
      v22 = v10;
      objc_msgSend(v14, "navigationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "topViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        PLSharedLibraryGetLog();
        v26 = (PXPhotosUIViewController *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v26->super.super.super, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, &v26->super.super.super, OS_LOG_TYPE_DEFAULT, "Already pushed a details view controller, ignoring navigation", buf, 2u);
        }
        v27 = 0;
        v16 = v37;
      }
      else
      {
        v26 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v20);
        if (v15)
          v15[2](v15, v26);
        objc_msgSend(v14, "navigationController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "pushViewController:animated:", v26, v22);

        v16 = v37;
        if (v37)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __162__PXSharedLibrarySharingSuggestionsFeedActionPerformer_navigateToObjectReference_originalSource_fromViewController_animated_willPresentHandler_completionHandler___block_invoke;
          block[3] = &unk_1E5148CE0;
          v41 = v37;
          v26 = v26;
          v40 = v26;
          dispatch_async(MEMORY[0x1E0C80D38], block);

        }
        v27 = 1;
      }
    }
    else
    {
      PXAssertGetLog();
      v26 = (PXPhotosUIViewController *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v26->super.super.super, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1A6789000, &v26->super.super.super, OS_LOG_TYPE_FAULT, "Requires a navigationController", buf, 2u);
      }
      v27 = 0;
    }

  }
  else
  {
    PLSharedLibraryGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v17;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Unable to navigate to empty sharingSuggestion:%@", buf, 0xCu);
    }
    v27 = 0;
  }

  return v27;
}

- (id)createSeeAllViewControllerForPhotoLibrary:(id)a3
{
  void *v3;
  PXPhotosUIViewController *v4;

  PXSharedLibrarySharingSuggestionsSeeAllPhotosViewConfiguration(a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v3);

  return v4;
}

- (id)contextMenuForObjectReference:(id)a3 inDataSource:(id)a4 suggestedActions:(id)a5 fromViewController:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  PXPhotoKitAssetCollectionActionManager *v12;
  PXPhotoKitAssetCollectionActionManager *assetCollectionActionManager;
  PXPhotoKitAssetCollectionActionManager *v14;
  void *v15;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;

  v9 = a6;
  objc_msgSend(a3, "itemObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsFeedActionPerformer.m"), 127, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference.itemObject"), v19);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsFeedActionPerformer.m"), 127, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference.itemObject"), v19, v21);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v10, "containerCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", v11, 0);
  -[PXActionManager setPerformerDelegate:](v12, "setPerformerDelegate:", v9);

  assetCollectionActionManager = self->_assetCollectionActionManager;
  self->_assetCollectionActionManager = v12;
  v14 = v12;

  +[PXAlbumActionMenuBuilder contextMenuWithActionManager:overrideActions:](PXAlbumActionMenuBuilder, "contextMenuWithActionManager:overrideActions:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
}

uint64_t __162__PXSharedLibrarySharingSuggestionsFeedActionPerformer_navigateToObjectReference_originalSource_fromViewController_animated_willPresentHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
