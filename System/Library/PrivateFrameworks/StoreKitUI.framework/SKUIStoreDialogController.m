@implementation SKUIStoreDialogController

- (SKUIStoreDialogController)init
{
  SKUIStoreDialogController *v3;
  NSMutableArray *v4;
  NSMutableArray *alerts;
  NSMutableArray *v6;
  NSMutableArray *dialogs;
  objc_super v9;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStoreDialogController init].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIStoreDialogController;
  v3 = -[SKUIStoreDialogController init](&v9, sel_init);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    alerts = v3->_alerts;
    v3->_alerts = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dialogs = v3->_dialogs;
    v3->_dialogs = v6;

  }
  return v3;
}

- (void)presentDialog:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3458]);
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v4, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMessage:", v7);

    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v8);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "title", (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addButtonWithTitle:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    -[NSMutableArray addObject:](self->_alerts, "addObject:", v6);
    -[NSMutableArray addObject:](self->_dialogs, "addObject:", v4);
    objc_msgSend(v6, "show");

  }
}

- (void)presentDialog:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  SKUIStoreDialogController *v17;
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "buttons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(v6, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__SKUIStoreDialogController_presentDialog_fromViewController___block_invoke;
    v15[3] = &unk_1E739FFF0;
    v13 = v12;
    v16 = v13;
    objc_copyWeak(&v19, &location);
    v17 = self;
    v14 = v6;
    v18 = v14;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v15);
    -[NSMutableArray addObject:](self->_alerts, "addObject:", v13);
    -[NSMutableArray addObject:](self->_dialogs, "addObject:", v14);
    objc_msgSend(v7, "presentViewController:animated:completion:", v13, 1, 0);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

void __62__SKUIStoreDialogController_presentDialog_fromViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  id v14;
  id v15[2];

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__SKUIStoreDialogController_presentDialog_fromViewController___block_invoke_2;
  v12[3] = &unk_1E739FFC8;
  objc_copyWeak(v15, (id *)(a1 + 56));
  v11 = *(int8x16_t *)(a1 + 32);
  v9 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  v14 = *(id *)(a1 + 48);
  v15[1] = a3;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10);

  objc_destroyWeak(v15);
}

void __62__SKUIStoreDialogController_presentDialog_fromViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(WeakRetained, "_performActionForDialog:buttonIndex:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  v6 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_alerts, "indexOfObjectIdenticalTo:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    -[NSMutableArray objectAtIndex:](self->_dialogs, "objectAtIndex:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_alerts, "removeObjectAtIndex:", v7);
    -[NSMutableArray removeObjectAtIndex:](self->_dialogs, "removeObjectAtIndex:", v7);
    -[SKUIStoreDialogController _performActionForDialog:buttonIndex:](self, "_performActionForDialog:buttonIndex:", v8, a4);

  }
}

- (void)alertViewCancel:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "cancelButtonIndex");
  objc_msgSend(v5, "dismissWithClickedButtonIndex:animated:", v4, 0);
  -[SKUIStoreDialogController alertView:didDismissWithButtonIndex:](self, "alertView:didDismissWithButtonIndex:", v5, v4);

}

- (void)_performActionForDialog:(id)a3 buttonIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") > (unint64_t)a4)
  {
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "actionType");
    if (v8 == 9)
    {
      objc_msgSend(MEMORY[0x1E0DAF4C8], "retryAllRestoreDownloads");
    }
    else if (v8 == 3)
    {
      objc_msgSend(v7, "parameter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(MEMORY[0x1E0DAF5D0]);
      objc_msgSend(v10, "setBuyParameters:", v9);
      v11 = objc_alloc(MEMORY[0x1E0DAF5D8]);
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithPurchases:", v12);

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__SKUIStoreDialogController__performActionForDialog_buttonIndex___block_invoke;
      v14[3] = &unk_1E73A0018;
      v14[4] = self;
      objc_msgSend(v13, "startWithPurchaseResponseBlock:completionBlock:", v14, &__block_literal_global);

    }
  }

}

void __65__SKUIStoreDialogController__performActionForDialog_buttonIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evaluatePurchaseResponseForRentals:", v3);

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v3, CFSTR("SKUIStoreDialogControllerPurchaseNotificationKeyPurchaseResponse"), 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SKUIStoreDialogControllerPurchaseRequestDidSucceedNotification"), *(_QWORD *)(a1 + 32), v9);

  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  v7 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v3, *MEMORY[0x1E0DDC2C0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DDC2C8], *(_QWORD *)(a1 + 32), v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogs, 0);
  objc_storeStrong((id *)&self->_alerts, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStoreDialogController init]";
}

@end
