@implementation PXEditBatchRotateAction

- (PXEditBatchRotateAction)initWithPresetManager:(id)a3 syncProgress:(id)a4 asyncProgress:(id)a5 asyncLoadingStatusManager:(id)a6 forAssets:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXEditBatchRotateAction;
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
  int64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
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
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchRotateAction: Edit manager is busy.", (uint8_t *)buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
    else
    {
      -[PXEditBatchAction syncAssets](self, "syncAssets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 0, objc_msgSend(v9, "count"));
      objc_initWeak(buf, self);
      v10 = -[PXEditBatchRotateAction direction](self, "direction");
      -[PXEditBatchAction syncProgress](self, "syncProgress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __41__PXEditBatchRotateAction_performAction___block_invoke;
      v12[3] = &unk_1E513A660;
      objc_copyWeak(&v14, buf);
      v13 = v4;
      objc_msgSend(v6, "rotateAssets:direction:async:progress:completion:", v9, v10, 0, v11, v12);

      objc_destroyWeak(&v14);
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
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchRotateAction: No asset found", (uint8_t *)buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)_syncRotateDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
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
    v13 = -[PXEditBatchRotateAction direction](self, "direction");
    -[PXEditBatchAction asyncProgress](self, "asyncProgress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__PXEditBatchRotateAction__syncRotateDidFinishWithResults_didCancel_completionHandler___block_invoke;
    v15[3] = &unk_1E513A688;
    v16 = v8;
    objc_copyWeak(&v18, &location);
    v17 = v9;
    objc_msgSend(v12, "rotateAssets:direction:async:progress:completion:", v11, v13, 1, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(CFSTR("PXRotateEditAction"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastOngoingTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXRotateEditActionProgressToastOngoingTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastSuccessTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXRotateEditActionProgressToastSuccessTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastUndoTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXRotateEditActionProgressToastUndoTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastRedoTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXRotateEditActionProgressToastRedoTitle"), CFSTR("PhotosUICore"));
}

- (int64_t)direction
{
  return 0;
}

void __87__PXEditBatchRotateAction__syncRotateDidFinishWithResults_didCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
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

void __41__PXEditBatchRotateAction_performAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_syncRotateDidFinishWithResults:didCancel:completionHandler:", v6, a3, *(_QWORD *)(a1 + 32));

}

@end
