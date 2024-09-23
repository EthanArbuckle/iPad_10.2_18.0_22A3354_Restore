@implementation PXEditBatchEnhanceAction

- (PXEditBatchEnhanceAction)initWithPresetManager:(id)a3 syncProgress:(id)a4 asyncProgress:(id)a5 asyncLoadingStatusManager:(id)a6 forAssets:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXEditBatchEnhanceAction;
  return -[PXEditBatchAction initWithPresetManager:syncProgress:asyncProgress:asyncLoadingStatusManager:forAssets:](&v8, sel_initWithPresetManager_syncProgress_asyncProgress_asyncLoadingStatusManager_forAssets_, a3, a4, a5, a6, a7);
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id buf[2];

  v4 = a3;
  -[PXEditBatchAction assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[PXEditBatchAction manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isBusyWithBatchAction"))
    {
      PLUIGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchEnhanceAction: Edit manager is busy.", (uint8_t *)buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
    else
    {
      -[PXEditBatchAction syncAssets](self, "syncAssets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 0, objc_msgSend(v9, "count"));
      objc_initWeak(buf, self);
      -[PXEditBatchAction syncProgress](self, "syncProgress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __42__PXEditBatchEnhanceAction_performAction___block_invoke;
      v11[3] = &unk_1E513A660;
      objc_copyWeak(&v13, buf);
      v12 = v4;
      objc_msgSend(v6, "autoEnhanceAssets:async:progress:completion:", v9, 0, v10, v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);

    }
  }
  else
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchEnhanceAction: No asset found", (uint8_t *)buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)_syncEnhanceDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a5;
  -[PXEditBatchAction asyncAssets](self, "asyncAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4 || !objc_msgSend(v10, "count"))
  {
    -[PXEditBatchAction saveResults:completion:](self, "saveResults:completion:", v8, v9);
  }
  else
  {
    objc_initWeak(&location, self);
    -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 1, objc_msgSend(v11, "count"));
    -[PXEditBatchAction manager](self, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXEditBatchAction asyncProgress](self, "asyncProgress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __89__PXEditBatchEnhanceAction__syncEnhanceDidFinishWithResults_didCancel_completionHandler___block_invoke;
    v14[3] = &unk_1E513A688;
    v15 = v8;
    objc_copyWeak(&v17, &location);
    v16 = v9;
    objc_msgSend(v12, "autoEnhanceAssets:async:progress:completion:", v11, 1, v13, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(CFSTR("PXAutoEnhanceEditAction"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastOngoingTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXAutoEnhanceEditActionProgressToastOngoingTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastSuccessTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXAutoEnhanceEditActionProgressToastSuccessTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastUndoTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXAutoEnhanceEditActionProgressToastUndoTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastRedoTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXAutoEnhanceEditActionProgressToastRedoTitle"), CFSTR("PhotosUICore"));
}

void __89__PXEditBatchEnhanceAction__syncEnhanceDidFinishWithResults_didCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id WeakRetained;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v6 = (id)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v6, "addObjectsFromArray:", v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "saveResults:completion:", v6, *(_QWORD *)(a1 + 40));

}

void __42__PXEditBatchEnhanceAction_performAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_syncEnhanceDidFinishWithResults:didCancel:completionHandler:", v6, a3, *(_QWORD *)(a1 + 32));

}

@end
