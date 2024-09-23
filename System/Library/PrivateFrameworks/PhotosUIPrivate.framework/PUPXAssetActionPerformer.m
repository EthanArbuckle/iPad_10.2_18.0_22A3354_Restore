@implementation PUPXAssetActionPerformer

- (PUPXAssetActionPerformer)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXAssetActionManager.m"), 335, CFSTR("%s is not available as initializer"), "-[PUPXAssetActionPerformer initWithActionType:assets:orAssetsByAssetCollection:]");

  abort();
}

- (PUPXAssetActionPerformer)initWithUnderlyingActionPerformer:(id)a3
{
  id v6;
  void *v7;
  uint64_t v8;
  PUPXAssetActionPerformer *v9;
  id *p_isa;
  void *v11;
  PUPXAssetActionPerformer *v12;
  NSObject *v13;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXAssetActionManager.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionPerformer"));

  }
  objc_msgSend(v6, "actionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PUAssetActionTypeForPXAssetActionType(v7);

  if (v8)
  {
    v17.receiver = self;
    v17.super_class = (Class)PUPXAssetActionPerformer;
    v9 = -[PUAssetActionPerformer initWithActionType:assets:orAssetsByAssetCollection:](&v17, sel_initWithActionType_assets_orAssetsByAssetCollection_, v8, 0, 0);
    p_isa = (id *)&v9->super.super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_underlyingActionPerformer, a3);
      objc_msgSend(v6, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak(p_isa + 11, v11);

      objc_msgSend(v6, "setDelegate:", p_isa);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "actionType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_error_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "There is no equivalent PUAssetActionType given for %@", buf, 0xCu);

    }
    v12 = 0;
  }

  return v12;
}

- (unint64_t)state
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = -[PXAssetActionPerformer state](self->_underlyingActionPerformer, "state");
  if (v2 == 30)
    v3 = 30;
  else
    v3 = 0;
  if (v2 == 20)
    v3 = 20;
  if (v2 == 10)
    v4 = 10;
  else
    v4 = 0;
  if (v2 == 5)
    v4 = 5;
  if (v2 <= 19)
    return v4;
  else
    return v3;
}

- (void)performWithCompletionHandler:(id)a3
{
  -[PXAssetActionPerformer performActionWithCompletionHandler:](self->_underlyingActionPerformer, "performActionWithCompletionHandler:", a3);
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  void *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  -[PUAssetActionPerformer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if ((uint64_t)a4 > 19)
    {
      v9 = a4;
      if (a4 != 20)
      {
        if (a4 == 30)
          v9 = 30;
        else
          v9 = 0;
      }
    }
    else
    {
      if (a4 == 10)
        v8 = 10;
      else
        v8 = 0;
      if (a4 == 5)
        v9 = 5;
      else
        v9 = v8;
    }
    -[PUAssetActionPerformer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetActionPerformer:didChangeState:", self, v9);

  }
  -[PUPXAssetActionPerformer forwardingDelegate](self, "forwardingDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[PUPXAssetActionPerformer forwardingDelegate](self, "forwardingDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionPerformer:didChangeState:", v14, a4);

  }
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  int v10;

  v5 = a4;
  -[PUAssetActionPerformer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = v5;
    -[PUAssetActionPerformer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "assetActionPerformer:presentViewController:", self, v8);

    if (v10)
      -[PUPXAssetActionPerformer setPresentedViewController:](self, "setPresentedViewController:", v8);

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  _QWORD v16[4];
  id v17;
  PUPXAssetActionPerformer *v18;
  id v19;

  v7 = a4;
  v8 = a5;
  -[PUAssetActionPerformer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = v7;
    -[PUAssetActionPerformer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __84__PUPXAssetActionPerformer_actionPerformer_dismissViewController_completionHandler___block_invoke;
    v16[3] = &unk_1E58ABAF0;
    v17 = v11;
    v18 = self;
    v19 = v8;
    v13 = v11;
    v14 = objc_msgSend(v12, "assetActionPerformer:dismissViewController:completionHandler:", self, v13, v16);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v4;
  void *v5;

  -[PUAssetActionPerformer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManagerForAssetActionPerformer:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)prefersAssetInclusionAfterRemovalForActionPerformer:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[PUAssetActionPerformer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[PUAssetActionPerformer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "prefersAssetInclusionAfterRemovalForActionPerformer:", self);

  return v7;
}

- (UIViewController)presentedViewController
{
  return self->presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->presentedViewController, a3);
}

- (PXActionPerformerDelegate)forwardingDelegate
{
  return (PXActionPerformerDelegate *)objc_loadWeakRetained((id *)&self->_forwardingDelegate);
}

- (PXAssetActionManager)underlyingActionManager
{
  return self->_underlyingActionManager;
}

- (void)setUnderlyingActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingActionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingActionManager, 0);
  objc_destroyWeak((id *)&self->_forwardingDelegate);
  objc_storeStrong((id *)&self->presentedViewController, 0);
  objc_storeStrong((id *)&self->_underlyingActionPerformer, 0);
}

uint64_t __84__PUPXAssetActionPerformer_actionPerformer_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "setPresentedViewController:", 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
