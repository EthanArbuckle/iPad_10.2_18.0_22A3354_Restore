@implementation PXSAInboxDetailViewControllerProvider

- (int64_t)presentationTypeForInboxModel:(id)a3
{
  id v5;
  unint64_t v6;
  int64_t v7;
  void *v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "inboxModelType");
  v7 = 0;
  if (v6 <= 0xA)
  {
    if (((1 << v6) & 0x18E) != 0)
    {
      v7 = 2;
    }
    else if (((1 << v6) & 0x641) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSAInboxDetailViewControllerProvider.m"), 51, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }

  return v7;
}

- (id)viewControllerForInboxModel:(id)a3 fromViewController:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSAInboxDetailViewControllerProvider.m"), 59, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("model"), v16, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSAInboxDetailViewControllerProvider.m"), 59, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("model"), v16);
  }

LABEL_3:
  v10 = v9;
  v11 = objc_msgSend(v10, "inboxModelType");
  if (v11 - 4 >= 2)
  {
    v12 = 0;
    if (v11 <= 0xA && ((1 << v11) & 0x7CF) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSAInboxDetailViewControllerProvider.m"), 77, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  else
  {
    -[PXSAInboxDetailViewControllerProvider _sharedAlbumViewControllerForSectionInfo:fromViewController:](self, "_sharedAlbumViewControllerForSectionInfo:fromViewController:", v10, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)navigateToInboxModel:(id)a3 inSharedAlbumActivityFeedViewController:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  PXSAInboxDetailViewControllerProvider *v20;
  SEL v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "inboxModelType");
  if (v9 <= 0xA)
  {
    if (((1 << v9) & 0x671) != 0)
    {
      PXAssertGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        v11 = "navigation to shared album activity feed is not supported for %@";
LABEL_12:
        _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0
           && (objc_msgSend(v7, "keyCommentGUID"), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
      objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __102__PXSAInboxDetailViewControllerProvider_navigateToInboxModel_inSharedAlbumActivityFeedViewController___block_invoke;
      v16[3] = &unk_1E5141C90;
      v17 = v13;
      v18 = v14;
      v20 = self;
      v21 = a2;
      v19 = v8;
      v15 = v14;
      v10 = v13;
      objc_msgSend(v15, "performBlockAndWait:", v16);

    }
    else
    {
      PXAssertGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        v11 = "no keyCommentGUID for %@";
        goto LABEL_12;
      }
    }

  }
}

- (id)_sharedAlbumViewControllerForSectionInfo:(id)a3 fromViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a3;
  v6 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7836;
  v26 = __Block_byref_object_dispose__7837;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7836;
  v20 = __Block_byref_object_dispose__7837;
  v21 = 0;
  objc_msgSend(v5, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__PXSAInboxDetailViewControllerProvider__sharedAlbumViewControllerForSectionInfo_fromViewController___block_invoke;
  v12[3] = &unk_1E51401A8;
  v8 = v5;
  v13 = v8;
  v14 = &v22;
  v15 = &v16;
  objc_msgSend(v7, "performBlockAndWait:", v12);

  objc_msgSend(v6, "px_gridPresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createPhotosAlbumViewControllerForAlbum:withFetchResult:", v23[5], v17[5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __101__PXSAInboxDetailViewControllerProvider__sharedAlbumViewControllerForSectionInfo_fromViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "sharedAlbum");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_standardLibrarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "pl_PHAssetCollectionForAssetContainer:photoLibrary:", v10, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __102__PXSAInboxDetailViewControllerProvider_navigateToInboxModel_inSharedAlbumActivityFeedViewController___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D71638], "cloudSharedCommentWithGUID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && objc_msgSend(*(id *)(a1 + 48), "cloudFeedCommentIsAvailableForNavigation:", v2))
  {
    objc_msgSend(*(id *)(a1 + 48), "navigateToRevealCloudFeedComment:completion:", v2, 0);
  }
  else
  {
    PXAssertGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "couldn't scroll feed to comment %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

@end
