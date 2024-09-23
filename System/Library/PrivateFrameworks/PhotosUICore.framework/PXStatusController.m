@implementation PXStatusController

- (PXStatusController)init
{
  PXStatusController *v2;
  PXStatusViewModel *v3;
  PXStatusViewModel *viewModel;
  PXStatusViewModel *v5;
  uint64_t v6;
  UIContentUnavailableConfiguration *configuration;
  _QWORD v9[4];
  __CFString *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXStatusController;
  v2 = -[PXStatusController init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXStatusViewModel);
    viewModel = v2->_viewModel;
    v2->_viewModel = v3;

    v5 = v2->_viewModel;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __26__PXStatusController_init__block_invoke;
    v9[3] = &unk_1E5118FD0;
    v10 = &stru_1E5149688;
    -[PXStatusViewModel performChanges:](v5, "performChanges:", v9);
    -[PXStatusViewModel registerChangeObserver:context:](v2->_viewModel, "registerChangeObserver:context:", v2, PXStatusViewModelObservationContext);
    objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v2->_configuration;
    v2->_configuration = (UIContentUnavailableConfiguration *)v6;

  }
  return v2;
}

- (void)setViewModel:(id)a3
{
  PXStatusViewModel *v6;
  PXStatusViewModel *v7;
  char v8;
  void *v9;
  PXStatusViewModel *v10;

  v10 = (PXStatusViewModel *)a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStatusController.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  v6 = self->_viewModel;
  if (v6 == v10)
  {

  }
  else
  {
    v7 = v10;
    v8 = -[PXStatusViewModel isEqual:](v7, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      -[PXStatusViewModel unregisterChangeObserver:context:](self->_viewModel, "unregisterChangeObserver:context:", self, PXStatusViewModelObservationContext);
      objc_storeStrong((id *)&self->_viewModel, a3);
      -[PXStatusViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, PXStatusViewModelObservationContext);
      -[PXStatusController _updateTitle](self, "_updateTitle");
      -[PXStatusController _updateMessage](self, "_updateMessage");
      -[PXStatusController _updateButtonTitle](self, "_updateButtonTitle");
    }
  }

}

- (void)_updateTitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXStatusViewModel title](self->_viewModel, "title");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    v3 = v7;
  else
    v3 = 0;
  -[PXStatusController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[PXStatusController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStatusController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusController:configurationDidChange:", self, v6);

}

- (void)_updateMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXStatusViewModel message](self->_viewModel, "message");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStatusController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXStatusViewModel attributedMessage](self->_viewModel, "attributedMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStatusController configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSecondaryAttributedText:", v5);

  }
  else
  {
    -[PXStatusController configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSecondaryText:", v9);
  }

  -[PXStatusController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStatusController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statusController:configurationDidChange:", self, v8);

}

- (void)_updateButtonTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id location;

  -[PXStatusViewModel actionTitle](self->_viewModel, "actionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  -[PXStatusController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "setTitle:", v3);

    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0DC3428];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __40__PXStatusController__updateButtonTitle__block_invoke;
    v20 = &unk_1E5147F40;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v9, "actionWithHandler:", &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStatusController configuration](self, "configuration", v17, v18, v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "buttonProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPrimaryAction:", v10);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v7, "setTitle:", 0);

    -[PXStatusController configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "buttonProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPrimaryAction:", 0);

  }
  -[PXStatusController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStatusController configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "statusController:configurationDidChange:", self, v16);

}

- (void)_handleButtonAction:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  NSObject *v6;
  NSObject *v7;
  PXStatusViewModel *viewModel;
  uint64_t v9;
  void *v10;
  BOOL v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  PXStatusViewModel *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  PXStatusViewModel *v20;
  PXStatusViewModel *v21;
  PXStatusViewModel *v22;
  NSObject *v23;
  PXStatusViewModel *v24;
  _QWORD v25[4];
  NSObject *v26;
  PXStatusController *v27;
  id v28;
  id v29;
  void (**v30)(_QWORD);
  id v31;
  id v32;
  id from;
  id location;
  uint8_t buf[4];
  PXStatusViewModel *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStatusViewModel action](self->_viewModel, "action");
  v5 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  PLUserStatusUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      viewModel = self->_viewModel;
      *(_DWORD *)buf = 138543362;
      v36 = viewModel;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Status View: User invoked un-pause action (%{public}@)", buf, 0xCu);
    }

    -[PXStatusViewModel actionConfirmationAlertTitle](self->_viewModel, "actionConfirmationAlertTitle");
    v7 = objc_claimAutoreleasedReturnValue();
    -[PXStatusViewModel actionConfirmationAlertButtonTitle](self->_viewModel, "actionConfirmationAlertButtonTitle");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
      v11 = v9 == 0;
    else
      v11 = 1;
    v12 = !v11;
    PLUserStatusUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        v15 = self->_viewModel;
        *(_DWORD *)buf = 138543362;
        v36 = v15;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Status View: Will present confirmation alert (%{public}@)", buf, 0xCu);
      }

      objc_initWeak(&location, self);
      objc_initWeak(&from, self->_viewModel);
      -[PXStatusController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentationEnvironmentForStatusController:", self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __42__PXStatusController__handleButtonAction___block_invoke;
      v25[3] = &unk_1E5119020;
      v26 = v7;
      v27 = self;
      v28 = v4;
      v29 = v10;
      objc_copyWeak(&v31, &from);
      objc_copyWeak(&v32, &location);
      v30 = v5;
      objc_msgSend(v17, "presentAlertWithConfigurationHandler:", v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        PLSharingGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = self->_viewModel;
          *(_DWORD *)buf = 138543362;
          v36 = v20;
          _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "Status View: Did present confirmation alert (%{public}@)", buf, 0xCu);
        }

        -[PXStatusController setConfirmationAlertToken:](self, "setConfirmationAlertToken:", v18);
      }
      else
      {
        PLSharingGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = self->_viewModel;
          *(_DWORD *)buf = 138543362;
          v36 = v24;
          _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "Status View: Failed to present confirmation alert (%{public}@)", buf, 0xCu);
        }

      }
      objc_destroyWeak(&v32);
      objc_destroyWeak(&v31);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      if (v14)
      {
        v22 = self->_viewModel;
        *(_DWORD *)buf = 138543362;
        v36 = v22;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Status View: Invoking action without confirmation (%{public}@)", buf, 0xCu);
      }

      v5[2](v5);
    }

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v21 = self->_viewModel;
    *(_DWORD *)buf = 138543362;
    v36 = v21;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Status View: No action for button (%{public}@)", buf, 0xCu);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  NSObject *v11;
  PXStatusViewModel *viewModel;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  PXStatusViewModel *v17;
  uint64_t v18;

  v6 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((void *)PXStatusViewModelObservationContext == a5)
  {
    if ((v6 & 2) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStatusController.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context == PXStatusViewModelObservationContext"));

  if ((v6 & 2) != 0)
LABEL_3:
    -[PXStatusController _updateTitle](self, "_updateTitle");
LABEL_4:
  if ((v6 & 0xC) != 0)
    -[PXStatusController _updateMessage](self, "_updateMessage");
  if ((v6 & 0x10) != 0
    && (-[PXStatusController confirmationAlertToken](self, "confirmationAlertToken"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PXStatusController _updateButtonTitle](self, "_updateButtonTitle"),
        v10)
    || (v6 & 0xE0) != 0
    && (-[PXStatusController confirmationAlertToken](self, "confirmationAlertToken"),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[PXStatusController setConfirmationAlertToken:](self, "setConfirmationAlertToken:", 0);
    PLUserStatusUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      viewModel = self->_viewModel;
      *(_DWORD *)buf = 138543362;
      v17 = viewModel;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Status View: Auto-dismiss alert for replaced action (%{public}@)", buf, 0xCu);
    }

    -[PXStatusController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentationEnvironmentForStatusController:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "dismissAlertWithToken:completionHandler:", v10, 0);
  }

}

- (PXStatusViewModel)viewModel
{
  return self->_viewModel;
}

- (PXStatusControllerDelegate)delegate
{
  return (PXStatusControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIContentUnavailableConfiguration)configuration
{
  return self->_configuration;
}

- (NSObject)confirmationAlertToken
{
  return self->_confirmationAlertToken;
}

- (void)setConfirmationAlertToken:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationAlertToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationAlertToken, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __42__PXStatusController__handleButtonAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(v3, "setTitle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "actionConfirmationAlertSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessage:", v4);

  objc_msgSend(v3, "setStyle:", 0);
  v5 = *(id *)(a1 + 48);
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v3, "setSourceItem:", v6);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__PXStatusController__handleButtonAction___block_invoke_2;
  v13[3] = &unk_1E5118FF8;
  objc_copyWeak(&v15, (id *)(a1 + 72));
  objc_copyWeak(&v16, (id *)(a1 + 80));
  v14 = *(id *)(a1 + 64);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v7, 0, v13);
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __42__PXStatusController__handleButtonAction___block_invoke_144;
  v10[3] = &unk_1E5144DF8;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  objc_copyWeak(&v12, (id *)(a1 + 80));
  objc_msgSend(v3, "addActionWithTitle:style:action:", v9, 1, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);

}

uint64_t __42__PXStatusController__handleButtonAction___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLUserStatusUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = 138543362;
    v7 = WeakRetained;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Status View: User confirmed action (%{public}@)", (uint8_t *)&v6, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v4, "setConfirmationAlertToken:", 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__PXStatusController__handleButtonAction___block_invoke_144(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLUserStatusUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138543362;
    v6 = WeakRetained;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Status View: User cancelled action (%{public}@)", (uint8_t *)&v5, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "setConfirmationAlertToken:", 0);

}

void __40__PXStatusController__updateButtonTitle__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_handleButtonAction:", v4);
}

uint64_t __26__PXStatusController_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTitle:", *(_QWORD *)(a1 + 32));
}

@end
