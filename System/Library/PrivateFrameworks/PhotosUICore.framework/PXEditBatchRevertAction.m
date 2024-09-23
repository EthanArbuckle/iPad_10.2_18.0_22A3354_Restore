@implementation PXEditBatchRevertAction

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
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
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchRevertAction: Edit manager is busy.", (uint8_t *)buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
    else
    {
      -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 1, objc_msgSend(v5, "count"));
      objc_initWeak(buf, self);
      -[PXEditBatchAction asyncProgress](self, "asyncProgress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __41__PXEditBatchRevertAction_performAction___block_invoke;
      v10[3] = &unk_1E513A660;
      objc_copyWeak(&v12, buf);
      v11 = v4;
      objc_msgSend(v6, "revertAdjustmentsOnAssets:async:progress:completion:", v5, 1, v9, v10);

      objc_destroyWeak(&v12);
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
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchRevertAction: No assets found", (uint8_t *)buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(CFSTR("PXRevertEditAction"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastOngoingTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXRevertEditActionProgressToastOngoingTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastSuccessTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXRevertEditActionProgressToastSuccessTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastUndoTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXRevertEditActionProgressToastUndoTitle"), CFSTR("PhotosUICore"));
}

- (id)localizedProgressToastRedoTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXRevertEditActionProgressToastRedoTitle"), CFSTR("PhotosUICore"));
}

void __41__PXEditBatchRevertAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "saveResults:completion:", v4, *(_QWORD *)(a1 + 32));

}

@end
