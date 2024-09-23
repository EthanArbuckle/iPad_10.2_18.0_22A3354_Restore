@implementation SBNetworkReselectionController

uint64_t __81__SBNetworkReselectionController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNetworkReselectionNeeded:forSlot:", objc_msgSend(*(id *)(a1 + 40), "isNetworkReselectionNeeded"), *(_QWORD *)(a1 + 48));
}

- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  objc_msgSend(a3, "subscriptionInfoForSlot:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SBNetworkReselectionController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E8EA0AF0;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_handleNetworkReselectionNeeded:(BOOL)a3 forSlot:(int64_t)a4
{
  _BOOL4 v5;
  void *v6;
  __int128 v7;
  SBNetworkReselectionAlertItem *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v5 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0uLL;
  if (v5)
  {
    v24 = 0uLL;
    v25 = 0uLL;
    v22 = 0uLL;
    v23 = 0uLL;
    objc_msgSend(v6, "alertItemsOfClass:", objc_opt_class());
    v8 = (SBNetworkReselectionAlertItem *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBNetworkReselectionAlertItem countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "slot") == a4)
          break;
        if (v10 == ++v12)
        {
          v10 = -[SBNetworkReselectionAlertItem countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v8 = -[SBNetworkReselectionAlertItem initWithSlot:]([SBNetworkReselectionAlertItem alloc], "initWithSlot:", a4);
      objc_msgSend(v6, "activateAlertItem:", v8);
    }
  }
  else
  {
    v20 = 0uLL;
    v21 = 0uLL;
    *((_QWORD *)&v18 + 1) = 0;
    v19 = 0uLL;
    objc_msgSend(v6, "alertItemsOfClass:", objc_opt_class(), (_QWORD)v7);
    v8 = (SBNetworkReselectionAlertItem *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBNetworkReselectionAlertItem countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v8);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v17, "slot") == a4)
            objc_msgSend(v6, "deactivateAlertItem:", v17);
        }
        v14 = -[SBNetworkReselectionAlertItem countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }
  }

}

+ (SBNetworkReselectionController)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SBNetworkReselectionController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_sOnceToken != -1)
    dispatch_once(&sharedController_sOnceToken, block);
  return (SBNetworkReselectionController *)(id)sharedController_sSharedController;
}

void __50__SBNetworkReselectionController_sharedController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_sSharedController;
  sharedController_sSharedController = (uint64_t)v1;

}

- (SBNetworkReselectionController)init
{
  SBNetworkReselectionController *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBNetworkReselectionController;
  v2 = -[SBNetworkReselectionController init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend((id)SBApp, "telephonyStateProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", v2);
    objc_msgSend(v3, "subscriptionInfoForSlot:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isNetworkReselectionNeeded");

    if (v5)
      -[SBNetworkReselectionController _handleNetworkReselectionNeeded:forSlot:](v2, "_handleNetworkReselectionNeeded:forSlot:", 1, 1);
    objc_msgSend(v3, "subscriptionInfoForSlot:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isNetworkReselectionNeeded");

    if (v7)
      -[SBNetworkReselectionController _handleNetworkReselectionNeeded:forSlot:](v2, "_handleNetworkReselectionNeeded:forSlot:", 1, 2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend((id)SBApp, "telephonyStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBNetworkReselectionController;
  -[SBNetworkReselectionController dealloc](&v4, sel_dealloc);
}

- (void)_test
{
  -[SBNetworkReselectionController _handleNetworkReselectionNeeded:forSlot:](self, "_handleNetworkReselectionNeeded:forSlot:", 1, 0);
}

@end
