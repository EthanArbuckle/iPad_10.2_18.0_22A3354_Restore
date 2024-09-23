@implementation PXEditBatchPasteAction

- (PXEditBatchPasteAction)initWithPresetManager:(id)a3 syncProgress:(id)a4 asyncProgress:(id)a5 asyncLoadingStatusManager:(id)a6 forAssets:(id)a7
{
  id v12;
  PXEditBatchPasteAction *v13;
  uint64_t v14;
  id target;
  objc_super v17;

  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXEditBatchPasteAction;
  v13 = -[PXEditBatchAction initWithPresetManager:syncProgress:asyncProgress:asyncLoadingStatusManager:forAssets:](&v17, sel_initWithPresetManager_syncProgress_asyncProgress_asyncLoadingStatusManager_forAssets_, v12, a4, a5, a6, a7);
  if (v13)
  {
    objc_msgSend(v12, "presetFromPasteboard");
    v14 = objc_claimAutoreleasedReturnValue();
    target = v13->_target;
    v13->_target = (id)v14;

  }
  return v13;
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id target;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id buf[2];

  v4 = a3;
  -[PXEditBatchAction assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_target && objc_msgSend(v5, "count"))
  {
    -[PXEditBatchAction manager](self, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isBusyWithBatchAction"))
    {
      PLUIGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Could not complete PXEditPasteAction: Edit manager is busy.", (uint8_t *)buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
    else
    {
      -[PXEditBatchAction syncAssets](self, "syncAssets");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 0, objc_msgSend(v10, "count"));
      objc_initWeak(buf, self);
      target = self->_target;
      -[PXEditBatchAction syncProgress](self, "syncProgress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __40__PXEditBatchPasteAction_performAction___block_invoke;
      v13[3] = &unk_1E513A660;
      objc_copyWeak(&v15, buf);
      v14 = v4;
      objc_msgSend(v7, "pastePreset:onAssets:async:progress:completion:", target, v10, 0, v12, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(buf);

    }
  }
  else
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Could not complete PXEditPasteAction: No asset or target found", (uint8_t *)buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)_syncPasteDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id target;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
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
    target = self->_target;
    -[PXEditBatchAction asyncProgress](self, "asyncProgress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__PXEditBatchPasteAction__syncPasteDidFinishWithResults_didCancel_completionHandler___block_invoke;
    v15[3] = &unk_1E513A688;
    v16 = v8;
    objc_copyWeak(&v18, &location);
    v17 = v9;
    objc_msgSend(v12, "pastePreset:onAssets:async:progress:completion:", target, v11, 1, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

- (BOOL)isEligibleForAsyncProcessingOnAsset:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (self->_target && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(self->_target, "isEligibleForAsyncProcessingOnAsset:", v4);
  else
    v5 = 1;

  return v5;
}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(CFSTR("PXPasteEditAction"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastOngoingTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXPasteEditActionProgressToastOngoingTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastSuccessTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXPasteEditActionProgressToastSuccessTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastUndoTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXPasteEditActionProgressToastUndoTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastRedoTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXPasteEditActionProgressToastRedoTitle"), CFSTR("PhotosUICore"));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
}

void __85__PXEditBatchPasteAction__syncPasteDidFinishWithResults_didCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
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

void __40__PXEditBatchPasteAction_performAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_syncPasteDidFinishWithResults:didCancel:completionHandler:", v6, a3, *(_QWORD *)(a1 + 32));

}

@end
