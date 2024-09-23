@implementation PXCPLStatusController

- (PXCPLStatusController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatusController.m"), 31, CFSTR("%s is not available as initializer"), "-[PXCPLStatusController init]");

  abort();
}

- (PXCPLStatusController)initWithViewModel:(id)a3
{
  id v6;
  PXCPLStatusController *v7;
  PXCPLStatusController *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatusController.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXCPLStatusController;
  v7 = -[PXCPLStatusController init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewModel, a3);
    -[PXCPLStatusController _statusProviderDidChange](v8, "_statusProviderDidChange");
  }

  return v8;
}

- (void)setStatusProvider:(id)a3
{
  PXCPLUIStatusProvider *v5;
  PXCPLUIStatusProvider *statusProvider;
  PXCPLUIStatusProvider *v7;

  v5 = (PXCPLUIStatusProvider *)a3;
  statusProvider = self->_statusProvider;
  if (statusProvider != v5)
  {
    v7 = v5;
    -[PXCPLUIStatusProvider unregisterChangeObserver:context:](statusProvider, "unregisterChangeObserver:context:", self, PXCPLUIStatusProviderChangeObserverContext);
    objc_storeStrong((id *)&self->_statusProvider, a3);
    -[PXCPLUIStatusProvider registerChangeObserver:context:](self->_statusProvider, "registerChangeObserver:context:", self, PXCPLUIStatusProviderChangeObserverContext);
    -[PXCPLStatusController _statusProviderDidChange](self, "_statusProviderDidChange");
    v5 = v7;
  }

}

- (void)setFallbackTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *fallbackTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_fallbackTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      fallbackTitle = self->_fallbackTitle;
      self->_fallbackTitle = v6;

      -[PXCPLStatusController _statusProviderDidChange](self, "_statusProviderDidChange");
    }
  }

}

- (void)setFallbackMessage:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *fallbackMessage;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_fallbackMessage;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      fallbackMessage = self->_fallbackMessage;
      self->_fallbackMessage = v6;

      -[PXCPLStatusController _statusProviderDidChange](self, "_statusProviderDidChange");
    }
  }

}

- (void)setFallbackAttributedMessage:(id)a3
{
  NSAttributedString *v4;
  char v5;
  NSAttributedString *v6;
  NSAttributedString *fallbackAttributedMessage;
  NSAttributedString *v8;

  v8 = (NSAttributedString *)a3;
  v4 = self->_fallbackAttributedMessage;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSAttributedString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)-[NSAttributedString copy](v8, "copy");
      fallbackAttributedMessage = self->_fallbackAttributedMessage;
      self->_fallbackAttributedMessage = v6;

      -[PXCPLStatusController _statusProviderDidChange](self, "_statusProviderDidChange");
    }
  }

}

- (void)setFallbackActionTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *fallbackActionTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_fallbackActionTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      fallbackActionTitle = self->_fallbackActionTitle;
      self->_fallbackActionTitle = v6;

      -[PXCPLStatusController _statusProviderDidChange](self, "_statusProviderDidChange");
    }
  }

}

- (void)setFallbackAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id fallbackAction;
  id aBlock;

  aBlock = a3;
  v4 = _Block_copy(self->_fallbackAction);
  v5 = _Block_copy(aBlock);
  if (v4 == v5)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_msgSend(aBlock, "copy");
      fallbackAction = self->_fallbackAction;
      self->_fallbackAction = v8;

      -[PXCPLStatusController _statusProviderDidChange](self, "_statusProviderDidChange");
    }
  }

}

- (void)_statusProviderDidChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSAttributedString *v16;
  NSString *v17;
  NSObject *v18;
  PXStatusViewModel *viewModel;
  id v20;
  id v21;
  id v22;
  id v23;
  NSString *v24;
  NSAttributedString *v25;
  NSString *v26;
  NSString *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  NSString *v31;
  NSString *v32;
  NSAttributedString *v33;
  NSString *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[PXCPLUIStatusProvider status](self->_statusProvider, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v29 = v3;
  if (!v3)
  {
    objc_msgSend(0, "stateDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v17 = self->_fallbackTitle;
    v10 = self->_fallbackMessage;
    v16 = self->_fallbackAttributedMessage;
    v11 = self->_fallbackActionTitle;
    v15 = _Block_copy(self->_fallbackAction);
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_11;
  }
  v5 = v3;
  v6 = objc_msgSend(v3, "state");
  objc_msgSend(v5, "stateDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    v28 = v7;
    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "length"))
  {
    PLUserStatusGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v5;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "No or empty state description provided: %{public}@", buf, 0xCu);
    }
    v28 = v8;

    goto LABEL_10;
  }
  v9 = v8;
  objc_msgSend(v5, "failureDescription");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionTitle");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionConfirmationAlertTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionConfirmationAlertSubtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionConfirmationAlertButtonTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = v4;
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXCPLStatusController__statusProviderDidChange__block_invoke;
  aBlock[3] = &unk_1E5149198;
  v40 = v5;
  v15 = _Block_copy(aBlock);

  v16 = 0;
  v28 = v9;
  v17 = (NSString *)v9;
LABEL_11:
  viewModel = self->_viewModel;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __49__PXCPLStatusController__statusProviderDidChange__block_invoke_2;
  v30[3] = &unk_1E5131968;
  v31 = v17;
  v32 = v10;
  v33 = v16;
  v34 = v11;
  v35 = v12;
  v36 = v13;
  v37 = v14;
  v38 = v15;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  v24 = v11;
  v25 = v16;
  v26 = v10;
  v27 = v17;
  -[PXStatusViewModel performChanges:](viewModel, "performChanges:", v30);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  id v11;
  id v12;

  v6 = a4;
  v9 = a3;
  if ((void *)PXCPLUIStatusProviderChangeObserverContext != a5)
  {
    v12 = v9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatusController.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context == PXCPLUIStatusProviderChangeObserverContext"));

    v9 = v12;
  }
  if ((v6 & 0x25E3) != 0)
  {
    v11 = v9;
    -[PXCPLStatusController _statusProviderDidChange](self, "_statusProviderDidChange");
    v9 = v11;
  }

}

- (PXCPLUIStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (NSString)fallbackTitle
{
  return self->_fallbackTitle;
}

- (NSString)fallbackMessage
{
  return self->_fallbackMessage;
}

- (NSAttributedString)fallbackAttributedMessage
{
  return self->_fallbackAttributedMessage;
}

- (NSString)fallbackActionTitle
{
  return self->_fallbackActionTitle;
}

- (id)fallbackAction
{
  return self->_fallbackAction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fallbackAction, 0);
  objc_storeStrong((id *)&self->_fallbackActionTitle, 0);
  objc_storeStrong((id *)&self->_fallbackAttributedMessage, 0);
  objc_storeStrong((id *)&self->_fallbackMessage, 0);
  objc_storeStrong((id *)&self->_fallbackTitle, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
}

void __49__PXCPLStatusController__statusProviderDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(*(id *)(a1 + 32), "action");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 32));

    v2 = v4;
  }

}

void __49__PXCPLStatusController__statusProviderDidChange__block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setMessage:", a1[5]);
  objc_msgSend(v4, "setAttributedMessage:", a1[6]);
  objc_msgSend(v4, "setActionTitle:", a1[7]);
  objc_msgSend(v4, "setActionConfirmationAlertTitle:", a1[8]);
  objc_msgSend(v4, "setActionConfirmationAlertSubtitle:", a1[9]);
  objc_msgSend(v4, "setActionConfirmationAlertButtonTitle:", a1[10]);
  objc_msgSend(v4, "setAction:", a1[11]);

}

@end
