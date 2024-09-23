@implementation PUAssetSharingHelper

- (void)_presentViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUAssetSharingHelper delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetsSharingHelper:presentViewController:", self, v4);

}

- (void)copyAssets:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PUAssetSharingHelper_copyAssets___block_invoke;
  v3[3] = &unk_1E58AB060;
  v3[4] = self;
  +[PUAssetSharingHelper copyAssets:completionHandler:](PUAssetSharingHelper, "copyAssets:completionHandler:", a3, v3);
}

- (void)ensureLocalAssetsForCloudPhotoSharing:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PUAssetSharingHelper *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D7BC88];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PUAssetSharingHelper_ensureLocalAssetsForCloudPhotoSharing_completion___block_invoke;
  v11[3] = &unk_1E58A8738;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  +[PUAssetSharingHelper prepareAssets:forActivityType:completion:](PUAssetSharingHelper, "prepareAssets:forActivityType:completion:", v10, v8, v11);

}

- (void)ensureLocalAssetsForSyndicationSave:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PUAssetSharingHelper *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D7BE60];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PUAssetSharingHelper_ensureLocalAssetsForSyndicationSave_completion___block_invoke;
  v11[3] = &unk_1E58A8760;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  +[PUAssetSharingHelper prepareAssets:forActivityType:completion:](PUAssetSharingHelper, "prepareAssets:forActivityType:completion:", v10, v8, v11);

}

- (void)ensureLocalAssetsForRendering:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PUAssetSharingHelper *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[PUAssetSharingHelper delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PUAssetSharingHelper delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowForProgressPresentationInAssetsSharingHelper:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = *MEMORY[0x1E0D7BDD0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__PUAssetSharingHelper_ensureLocalAssetsForRendering_completion___block_invoke;
  v15[3] = &unk_1E58A8738;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v13 = v7;
  v14 = v6;
  +[PUAssetSharingHelper _prepareAssets:forActivityType:window:completion:](PUAssetSharingHelper, "_prepareAssets:forActivityType:window:completion:", v14, v12, v11, v15);

}

- (void)ensureRenderingForAssetsWithDeferredProcessingInCollection:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v6 = (void (**)(id, uint64_t))a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("deferredProcessingNeeded != 0"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInternalPredicate:", v9);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "fetchedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetSharingHelper ensureLocalAssetsForRendering:completion:](self, "ensureLocalAssetsForRendering:completion:", v11, v6);

  }
  else
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "PUAssetSharingHelper: No assets to render", v13, 2u);
    }

    if (v6)
      v6[2](v6, 1);
  }

}

- (PXAssetsSharingHelperDelegate)delegate
{
  return (PXAssetsSharingHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __65__PUAssetSharingHelper_ensureLocalAssetsForRendering_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  PUSharingErrorPresentationController *v9;
  void *v10;
  PUSharingErrorPresentationController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Render: Will show \"Unable to render\" dialogue. Reported error: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rendering %ld assets:\n\n"), objc_msgSend(*(id *)(a1 + 32), "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [PUSharingErrorPresentationController alloc];
    v15 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PUSharingErrorPresentationController initWithErrors:forAssets:fromSource:preparationType:](v9, "initWithErrors:forAssets:fromSource:preparationType:", v10, *(_QWORD *)(a1 + 32), 5, 0);

    -[PUErrorPresentationController setRadarDescription:](v11, "setRadarDescription:", v8);
    -[PUErrorPresentationController setRadarComponentID:name:version:](v11, "setRadarComponentID:name:version:", CFSTR("428725"), CFSTR("Photos Backend Storage"), CFSTR("iOS"));
    -[PUErrorPresentationController alertControllerWithCompletion:](v11, "alertControllerWithCompletion:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetsSharingHelper:presentViewController:", *(_QWORD *)(a1 + 40), v12);

  }
  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
    (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, v5 != 0);

}

void __71__PUAssetSharingHelper_ensureLocalAssetsForSyndicationSave_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  PUSharingErrorPresentationController *v9;
  void *v10;
  PUSharingErrorPresentationController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v6;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Syndication Save: Will show \"Unable to share\" dialogue. Reported error: %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Saving %ld syndicated assets:\n\n"), objc_msgSend(*(id *)(a1 + 32), "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [PUSharingErrorPresentationController alloc];
    v15 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PUSharingErrorPresentationController initWithErrors:forAssets:fromSource:preparationType:](v9, "initWithErrors:forAssets:fromSource:preparationType:", v10, *(_QWORD *)(a1 + 32), 4, 0);

    -[PUErrorPresentationController setRadarDescription:](v11, "setRadarDescription:", v8);
    -[PUErrorPresentationController setRadarComponentID:name:version:](v11, "setRadarComponentID:name:version:", CFSTR("512768"), CFSTR("Photos Backend (New Bugs)"), CFSTR("all"));
    -[PUErrorPresentationController alertControllerWithCompletion:](v11, "alertControllerWithCompletion:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetsSharingHelper:presentViewController:", *(_QWORD *)(a1 + 40), v12);

  }
  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
    (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, v5 != 0);

}

void __73__PUAssetSharingHelper_ensureLocalAssetsForCloudPhotoSharing_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PUSharingErrorPresentationController *v11;
  void *v12;
  PUSharingErrorPresentationController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Shared Albums: Will show \"Unable to share\" dialogue. Reported error: %{public}@", buf, 0xCu);
    }

    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Sharing %ld assets to activity type %@ from within shared album:\n\n"), v9, *MEMORY[0x1E0D7BC88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [PUSharingErrorPresentationController alloc];
    v17 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PUSharingErrorPresentationController initWithErrors:forAssets:fromSource:preparationType:](v11, "initWithErrors:forAssets:fromSource:preparationType:", v12, *(_QWORD *)(a1 + 32), 1, 0);

    -[PUErrorPresentationController setRadarDescription:](v13, "setRadarDescription:", v10);
    -[PUErrorPresentationController setRadarComponentID:name:version:](v13, "setRadarComponentID:name:version:", CFSTR("512768"), CFSTR("Photos Backend (New Bugs)"), CFSTR("all"));
    -[PUErrorPresentationController alertControllerWithCompletion:](v13, "alertControllerWithCompletion:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetsSharingHelper:presentViewController:", *(_QWORD *)(a1 + 40), v14);

  }
  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
    (*(void (**)(uint64_t, BOOL))(v16 + 16))(v16, v5 != 0);

}

void __35__PUAssetSharingHelper_copyAssets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    PULocalizedString(CFSTR("COPY_TO_PASTEBOARD_PREPARATION_ERROR_TITLE"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("COPY_TO_PASTEBOARD_PREPARATION_ERROR_MESSAGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("OK"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, &__block_literal_global_91462);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8);

    objc_msgSend(*(id *)(a1 + 32), "_presentViewController:", v5);
  }
}

+ (void)copyAssets:(id)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = *MEMORY[0x1E0D96DA0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PUAssetSharingHelper_copyAssets_completionHandler___block_invoke;
  v8[3] = &unk_1E58A8710;
  v9 = v5;
  v7 = v5;
  +[PUAssetSharingHelper prepareAssets:forActivityType:completion:](PUAssetSharingHelper, "prepareAssets:forActivityType:completion:", a3, v6, v8);

}

+ (void)prepareAssets:(id)a3 forActivityType:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "_prepareAssets:forActivityType:window:completion:", v9, v8, 0, v7);

}

+ (void)_prepareAssets:(id)a3 forActivityType:(id)a4 window:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PUActivityItemSourceController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  id v29;
  PUActivityItemSourceController *v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  PUActivityItemSourceController *v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[16];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "count"))
  {
    v13 = objc_alloc_init(PUActivityItemSourceController);
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUActivityAssetItem itemsForAssets:](PUActivityAssetItem, "itemsForAssets:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *MEMORY[0x1E0D96DA0];
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D96DA0])
      && _os_feature_enabled_impl()
      && PLIsLockdownMode())
    {
      v33 = v11;
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "Lockdown mode is enabled, excluding location and caption metadata by default.", buf, 2u);
      }

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v32 = v15;
      v18 = v15;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v42 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v23, "setExcludeLocation:", 1, v32);
            objc_msgSend(v23, "setExcludeCaption:", 1);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v20);
      }

      v15 = v32;
      v11 = v33;
    }
    -[PUActivityItemSourceController setAssetItems:](v13, "setAssetItems:", v15, v32);
    v24 = objc_alloc_init(MEMORY[0x1E0D7B158]);
    v25 = v24;
    if (v11)
      objc_msgSend(v24, "setWindow:", v11);
    if ((objc_msgSend(v10, "isEqualToString:", v16) & 1) != 0)
    {
      v26 = CFSTR("COPY_TO_PASTEBOARD_PREPARATION_TITLE");
    }
    else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D7BC88]) & 1) != 0)
    {
      v26 = CFSTR("POST_TO_SHARED_ALBUM_PREPARATION_TITLE");
    }
    else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D7BE60]) & 1) != 0)
    {
      v26 = CFSTR("SYNDICATION_SAVE_PREPARATION_TITLE");
    }
    else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D7BDD0]))
    {
      v26 = CFSTR("RENDER_PREPARATION_TITLE");
    }
    else
    {
      v26 = CFSTR("SHARING_PREPARATION_TITLE");
    }
    PULocalizedString(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitle:", v27);
    v28 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke;
    v39[3] = &unk_1E58AA448;
    v29 = v25;
    v40 = v29;
    -[PUActivityItemSourceController setProgressHandler:](v13, "setProgressHandler:", v39);
    v37[0] = v28;
    v37[1] = 3221225472;
    v37[2] = __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_3;
    v37[3] = &unk_1E58ABD10;
    v38 = v13;
    v30 = v13;
    objc_msgSend(v29, "setCancellationHandler:", v37);
    objc_msgSend(v29, "showAnimated:allowDelay:", 1, 1);
    v34[0] = v28;
    v34[1] = 3221225472;
    v34[2] = __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_4;
    v34[3] = &unk_1E58A87B0;
    v35 = v29;
    v36 = v12;
    v31 = v29;
    -[PUActivityItemSourceController runExplicitly:withActivityType:completionHandler:](v30, "runExplicitly:withActivityType:completionHandler:", 1, v10, v34);

  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  }

}

void __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke(uint64_t a1, double a2)
{
  _QWORD v3[4];
  id v4;
  double v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_2;
  v3[3] = &unk_1E58AACF0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_4(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a2;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_5;
  block[3] = &unk_1E58A8788;
  v13 = v8;
  v17 = a3;
  v14 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v15 = v7;
  v16 = v9;
  v10 = v7;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_5(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    v2 = 0;
  else
    v2 = *(_BYTE *)(a1 + 64) == 0;
  objc_msgSend(*(id *)(a1 + 40), "hideAnimated:allowDelay:", 1, v2);
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v2)
      v4 = *(_QWORD *)(a1 + 48);
    else
      v4 = 0;
    v5 = (id)v3;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v4);

  }
}

uint64_t __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFractionCompleted:", *(double *)(a1 + 40));
}

void __53__PUAssetSharingHelper_copyAssets_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setItemProviders:", v8);

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, BOOL, id))(v7 + 16))(v7, v8 != 0, v5);

}

@end
