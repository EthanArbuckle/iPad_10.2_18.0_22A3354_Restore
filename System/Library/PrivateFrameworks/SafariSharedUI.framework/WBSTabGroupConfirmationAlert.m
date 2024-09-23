@implementation WBSTabGroupConfirmationAlert

+ (id)deleteConfirmationAlertWithTabGroup:(id)a3 manager:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11[168];
  v11[168] = v8;
  v13 = v8;

  v14 = (void *)v11[169];
  v11[169] = v9;

  objc_msgSend(v11, "setRole:", 4);
  objc_msgSend(v11, "setDelegate:", v10);

  objc_msgSend(v11, "_initializeStringsForDeleteConfirmation");
  objc_msgSend(v11, "_configureAlert");
  return v11;
}

- (id)_representativeHost
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[WBSTabGroupConfirmationAlert delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "representativeURLForTabGroupConfirmationAlert:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v5, "length"))
  {
    -[WBTabGroup representativeURL](self->_tabGroup, "representativeURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_userVisibleHostWithoutWWWSubdomain");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (void)_initializeStringsForDeleteConfirmation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  NSString *title;
  NSString *v25;
  NSString *message;
  NSString *v27;
  uint64_t v28;
  void *v29;
  NSString *v30;
  NSString *v31;
  NSString *confirmButtonTitle;
  id v33;

  -[WBSTabGroupConfirmationAlert _representativeHost](self, "_representativeHost");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "length"))
  {
    -[WBTabGroup tabs](self->_tabGroup, "tabs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    -[WBTabGroupManager shareRecordForTabGroup:](self->_tabGroupManager, "shareRecordForTabGroup:", self->_tabGroup);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentUserParticipant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "owner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    v9 = (void *)MEMORY[0x1E0CB3940];
    if (v5)
    {
      if (!v8)
      {
        _WBSLocalizedString();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabGroup title](self->_tabGroup, "title");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", v21, v22);
        v23 = (NSString *)objc_claimAutoreleasedReturnValue();
        title = self->_title;
        self->_title = v23;

        _WBSLocalizedString();
        v25 = (NSString *)objc_claimAutoreleasedReturnValue();
        message = self->_message;
        self->_message = v25;

LABEL_15:
        _WBSLocalizedString();
        v31 = (NSString *)objc_claimAutoreleasedReturnValue();
        confirmButtonTitle = self->_confirmButtonTitle;
        self->_confirmButtonTitle = v31;

        goto LABEL_16;
      }
      _WBSLocalizedString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTabGroup title](self->_tabGroup, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v11);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      v13 = self->_title;
      self->_title = v12;

      _WBSLocalizedString();
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = self->_message;
      self->_message = v14;
LABEL_14:

      goto LABEL_15;
    }
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroup title](self->_tabGroup, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v16, v17);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = self->_title;
    self->_title = v18;

    if (v4 == 2)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
    }
    else
    {
      if (v4 != 1)
      {
        v28 = v4 - 1;
        v29 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringWithFormat:", v15, v33, v28);
        v27 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      v20 = (void *)MEMORY[0x1E0CB3940];
    }
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v15, v33);
    v27 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v30 = self->_message;
    self->_message = v27;

    goto LABEL_14;
  }
  self->_automaticallyConfirm = 1;
LABEL_16:

}

- (void)_handleResult:(BOOL)a3
{
  id resultHandler;
  _BOOL8 v5;
  id v6;
  void (**v7)(id, _BOOL8);

  resultHandler = self->_resultHandler;
  if (resultHandler)
  {
    v5 = a3;
    v7 = (void (**)(id, _BOOL8))MEMORY[0x1A85D45E4](resultHandler, a2);
    v6 = self->_resultHandler;
    self->_resultHandler = 0;

    v7[2](v7, v5);
  }
}

- (void)_configureAlert
{
  const __CFString *title;
  const __CFString *message;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *confirmButtonTitle;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  if (!self->_automaticallyConfirm)
  {
    if (self->_title)
      title = (const __CFString *)self->_title;
    else
      title = &stru_1E5449658;
    -[WBSTabGroupConfirmationAlert setTitle:](self, "setTitle:", title);
    if (self->_message)
      message = (const __CFString *)self->_message;
    else
      message = &stru_1E5449658;
    -[WBSTabGroupConfirmationAlert setMessage:](self, "setMessage:", message);
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0CEA2E0];
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__WBSTabGroupConfirmationAlert__configureAlert__block_invoke;
    v14[3] = &unk_1E5446A98;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 1, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTabGroupConfirmationAlert addAction:](self, "addAction:", v8);

    v9 = (void *)MEMORY[0x1E0CEA2E0];
    confirmButtonTitle = self->_confirmButtonTitle;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __47__WBSTabGroupConfirmationAlert__configureAlert__block_invoke_2;
    v12[3] = &unk_1E5446A98;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v9, "actionWithTitle:style:handler:", confirmButtonTitle, 2, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTabGroupConfirmationAlert addAction:](self, "addAction:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __47__WBSTabGroupConfirmationAlert__configureAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleResult:", 0);

}

void __47__WBSTabGroupConfirmationAlert__configureAlert__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleResult:", 1);

}

- (void)presentFromViewController:(id)a3 withResultHandler:(id)a4
{
  id v6;
  void *v7;
  id resultHandler;
  void *v9;
  _QWORD v10[4];
  id v11;
  WBSTabGroupConfirmationAlert *v12;

  v6 = a3;
  if (self->_automaticallyConfirm)
  {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
  else
  {
    v7 = (void *)MEMORY[0x1A85D45E4](a4);
    resultHandler = self->_resultHandler;
    self->_resultHandler = v7;

    objc_msgSend(v6, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "role") == self->_role)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __76__WBSTabGroupConfirmationAlert_presentFromViewController_withResultHandler___block_invoke;
      v10[3] = &unk_1E5441848;
      v11 = v6;
      v12 = self;
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v10);

    }
    else
    {
      objc_msgSend(v6, "presentViewController:animated:completion:", self, 1, 0);
    }

  }
}

uint64_t __76__WBSTabGroupConfirmationAlert_presentFromViewController_withResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSTabGroupConfirmationAlert;
  -[WBSTabGroupConfirmationAlert dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, a3, a4);
  -[WBSTabGroupConfirmationAlert delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "tabGroupConfirmationAlertDidBeginDismissal:", self);

}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (WBSTabGroupConfirmationAlertDelegate)delegate
{
  return (WBSTabGroupConfirmationAlertDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_confirmButtonTitle, 0);
}

@end
