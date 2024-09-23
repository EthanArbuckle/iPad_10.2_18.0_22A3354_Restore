@implementation NCNotificationRequestInlineActionsProvider

- (NCNotificationRequestInlineActionsProvider)initWithNotificationRequest:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  NCNotificationRequestInlineActionsProvider *v9;
  NCNotificationRequestInlineActionsProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationRequestInlineActionsProvider;
  v9 = -[NCNotificationRequestInlineActionsProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationRequest, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (NSArray)auxiliaryOptionActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  -[NCNotificationRequestInlineActionsProvider _primaryAction](self, "_primaryAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(v5, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __68__NCNotificationRequestInlineActionsProvider_auxiliaryOptionActions__block_invoke;
      v21[3] = &unk_1E8D1B1C8;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, 0, CFSTR("notification-request-inline-action-provider-primary-action"), v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v10);
      objc_destroyWeak(&v22);
    }
  }
  -[NCNotificationRequestInlineActionsProvider _secondaryAction](self, "_secondaryAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(v12, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __68__NCNotificationRequestInlineActionsProvider_auxiliaryOptionActions__block_invoke_2;
      v19[3] = &unk_1E8D1B1C8;
      objc_copyWeak(&v20, &location);
      objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v16, 0, CFSTR("notification-request-inline-action-provider-secondary-action"), v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v17);
      objc_destroyWeak(&v20);
    }
  }

  objc_destroyWeak(&location);
  return (NSArray *)v3;
}

void __68__NCNotificationRequestInlineActionsProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(WeakRetained, "handlePrimaryAction:", v4);
}

void __68__NCNotificationRequestInlineActionsProvider_auxiliaryOptionActions__block_invoke_2(uint64_t a1, void *a2)
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

  objc_msgSend(WeakRetained, "handleSecondaryAction:", v4);
}

- (id)_primaryAction
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[NCNotificationRequestInlineActionsProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultEnvironmentActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[NCNotificationRequestInlineActionsProvider notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultEnvironmentActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_secondaryAction
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[NCNotificationRequestInlineActionsProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultEnvironmentActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
  {
    v8 = 0;
  }
  else
  {
    -[NCNotificationRequestInlineActionsProvider notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultEnvironmentActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)handlePrimaryAction:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[NCNotificationRequestInlineActionsProvider _primaryAction](self, "_primaryAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contentProvider:performAction:animated:", self, v4, 1);

}

- (void)handleSecondaryAction:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[NCNotificationRequestInlineActionsProvider _secondaryAction](self, "_secondaryAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contentProvider:performAction:animated:", self, v4, 1);

}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (void)setNotificationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_notificationRequest, a3);
}

- (NCNotificationRequestInlineActionsProviderDelegate)delegate
{
  return (NCNotificationRequestInlineActionsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)auxiliaryOptionsVisible
{
  return self->_auxiliaryOptionsVisible;
}

- (void)setAuxiliaryOptionsVisible:(BOOL)a3
{
  self->_auxiliaryOptionsVisible = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
}

@end
