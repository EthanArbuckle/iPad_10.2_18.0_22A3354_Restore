@implementation PXCMMFooterViewModel

- (PXCMMFooterViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMFooterViewModel.m"), 29, CFSTR("%s is not available as initializer"), "-[PXCMMFooterViewModel init]");

  abort();
}

- (PXCMMFooterViewModel)initWithMomentShareStatusPresentation:(id)a3 mode:(int64_t)a4
{
  id v8;
  PXCMMFooterViewModel *v9;
  PXCMMFooterViewModel *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMFooterViewModel.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShareStatusPresentation"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PXCMMFooterViewModel;
  v9 = -[PXFooterViewModel init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_momentShareStatusPresentation, a3);
    -[PXMomentShareStatusPresentation registerChangeObserver:context:](v10->_momentShareStatusPresentation, "registerChangeObserver:context:", v10, PXMomentShareStatusPresentationObservationContext_188131);
    v10->_mode = a4;
    -[PXCMMFooterViewModel _updateAllProperties](v10, "_updateAllProperties");
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[PXCMMFooterViewModel _updateAllProperties](self, "_updateAllProperties");
    v5 = obj;
  }

}

- (void)_updateAllProperties
{
  void *v3;
  void *v4;
  int64_t v5;
  id v6;
  id v7;
  int64_t mode;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  id v22;

  -[PXMomentShareStatusPresentation assetsTitle](self->_momentShareStatusPresentation, "assetsTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMomentShareStatusPresentation expirationTitle](self->_momentShareStatusPresentation, "expirationTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXMomentShareStatusPresentation type](self->_momentShareStatusPresentation, "type");
  if (v5 != 1)
  {
    if (!v5)
    {
      v6 = v4;
      v7 = 0;
      goto LABEL_15;
    }
LABEL_13:
    v7 = 0;
    v6 = 0;
    goto LABEL_15;
  }
  mode = self->_mode;
  if (mode == 1)
  {
    -[PXMomentShareStatusPresentation assetsSaveStatusTitle](self->_momentShareStatusPresentation, "assetsSaveStatusTitle");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    goto LABEL_15;
  }
  if (mode)
    goto LABEL_13;
  -[PXMomentShareStatusPresentation byline](self->_momentShareStatusPresentation, "byline");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v4;
  if (v9)
    v12 = v4;
  else
    v12 = 0;
  v6 = v11;
  v7 = v12;

LABEL_15:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__PXCMMFooterViewModel__updateAllProperties__block_invoke;
  v16[3] = &unk_1E5133948;
  v17 = v3;
  v18 = v6;
  v19 = v7;
  v20 = 0u;
  v21 = 0u;
  v22 = 0;
  v13 = v7;
  v14 = v6;
  v15 = v3;
  -[PXFooterViewModel performChanges:](self, "performChanges:", v16);

}

- (void)_invokeStopSharingActionForInvitation:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v9;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PXCMMFooterViewModel: Will delete owned moment share: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v7, "actionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionPerformerForActionType:", CFSTR("PXCMMActionTypeDelete"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCMMFooterViewModel delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[PXCMMFooterViewModel _invokeStopSharingActionForInvitation:session:]";
      _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Missing delegate: %s", buf, 0xCu);
    }

  }
  objc_msgSend(v12, "presentationEnvironmentForCMMFooterViewModel:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPresentationEnvironment:", v14);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__PXCMMFooterViewModel__invokeStopSharingActionForInvitation_session___block_invoke;
  v17[3] = &unk_1E5148B78;
  v18 = v6;
  v15 = v6;
  v16 = (id)objc_msgSend(v11, "performActionWithSession:completionHandler:", v7, v17);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXMomentShareStatusPresentationObservationContext_188131 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMFooterViewModel.m"), 198, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x886F) != 0)
  {
    v11 = v9;
    -[PXCMMFooterViewModel _updateAllProperties](self, "_updateAllProperties");
    v9 = v11;
  }

}

- (PXCMMFooterViewModelDelegate)delegate
{
  return (PXCMMFooterViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
}

void __70__PXCMMFooterViewModel__invokeStopSharingActionForInvitation_session___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      v9 = "PXCMMFooterViewModel: Did delete owned moment share: %{public}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    v9 = "PXCMMFooterViewModel: Failed to delete owned moment share: %{public}@, error: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

void __44__PXCMMFooterViewModel__updateAllProperties__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setSubtitle1:", a1[5]);
  objc_msgSend(v4, "setSubtitle2:", a1[6]);
  objc_msgSend(v4, "setActionTitle:", a1[7]);
  objc_msgSend(v4, "setActionConfirmationAlertTitle:", a1[8]);
  objc_msgSend(v4, "setActionConfirmationAlertSubtitle:", a1[9]);
  objc_msgSend(v4, "setActionConfirmationAlertButtonTitle:", a1[10]);
  objc_msgSend(v4, "setAction:", a1[11]);

}

@end
