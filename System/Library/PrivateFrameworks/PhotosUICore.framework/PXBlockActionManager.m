@implementation PXBlockActionManager

- (PXBlockActionManager)init
{
  PXBlockActionManager *v2;
  uint64_t v3;
  NSMutableDictionary *registeredActions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXBlockActionManager;
  v2 = -[PXBlockActionManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    registeredActions = v2->_registeredActions;
    v2->_registeredActions = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)registerActionWithConfiguration:(id)a3 forType:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_msgSend(a3, "copy");
  -[PXBlockActionManager registeredActions](self, "registeredActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

}

- (void)registerActionForType:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PXBlockActionConfiguration *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[PXBlockActionConfiguration initWithBlock:]([PXBlockActionConfiguration alloc], "initWithBlock:", v6);

  -[PXBlockActionManager registeredActions](self, "registeredActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

}

- (void)registerActionForType:(id)a3 title:(id)a4 image:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PXBlockActionConfiguration *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v15 = -[PXBlockActionConfiguration initWithBlock:]([PXBlockActionConfiguration alloc], "initWithBlock:", v10);

  -[PXBlockActionConfiguration setActionName:](v15, "setActionName:", v12);
  -[PXBlockActionConfiguration setImage:](v15, "setImage:", v11);

  -[PXBlockActionManager registeredActions](self, "registeredActions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v13);

}

- (void)_executeActionType:(id)a3 action:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PXBlockActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSender:", v6);

  objc_msgSend(v7, "performActionWithCompletionHandler:", 0);
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = a3;
  if (-[PXActionManager isActionTypeAllowed:](self, "isActionTypeAllowed:", v4))
  {
    -[PXBlockActionManager registeredActions](self, "registeredActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "canPerformBlock");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = (*(uint64_t (**)(uint64_t, PXBlockActionManager *))(v7 + 16))(v7, self);
      else
        v9 = 1;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)supportsActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXBlockActionManager registeredActions](self, "registeredActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PXBlockActionPerformer *v7;

  v4 = a3;
  if (-[PXBlockActionManager canPerformActionType:](self, "canPerformActionType:", v4))
  {
    -[PXBlockActionManager registeredActions](self, "registeredActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[PXBlockActionPerformer initWithActionType:configuration:]([PXBlockActionPerformer alloc], "initWithActionType:configuration:", v4, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)standardActionForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  if (-[PXBlockActionManager canPerformActionType:](self, "canPerformActionType:", v4))
  {
    -[PXBlockActionManager registeredActions](self, "registeredActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__PXBlockActionManager_standardActionForActionType___block_invoke;
    aBlock[3] = &unk_1E5139028;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    v7 = _Block_copy(aBlock);
    objc_msgSend(v6, "menuElementConstructor");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
    else
      -[PXBlockActionManager _defaultStandardActionForConfiguration:handler:](self, "_defaultStandardActionForConfiguration:handler:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_defaultStandardActionForConfiguration:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0DC3428];
  v7 = a4;
  objc_msgSend(v5, "actionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, v9, 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isDestructive"))
    objc_msgSend(v10, "setAttributes:", objc_msgSend(v10, "attributes") | 2);
  if (objc_msgSend(v5, "isSelected"))
    objc_msgSend(v10, "setState:", 1);

  return v10;
}

- (NSMutableDictionary)registeredActions
{
  return self->_registeredActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredActions, 0);
}

void __52__PXBlockActionManager_standardActionForActionType___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_executeActionType:action:", *(_QWORD *)(a1 + 32), v4);

}

@end
