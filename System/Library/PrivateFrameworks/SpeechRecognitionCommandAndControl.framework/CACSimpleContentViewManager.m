@implementation CACSimpleContentViewManager

- (void)showViewControllerWithCreationHandler:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__CACSimpleContentViewManager_showViewControllerWithCreationHandler_updateHandler___block_invoke;
  block[3] = &unk_24F2AB420;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __83__CACSimpleContentViewManager_showViewControllerWithCreationHandler_updateHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setViewController:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_sync_exit(v2);

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentViewManagerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentViewManager:presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), v6, 1, 0);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isOverlay"))
    objc_msgSend(*(id *)(a1 + 32), "startDelayedDimmingOfNumbers");

}

- (void)_hideAnimated:(BOOL)a3
{
  -[CACSimpleContentViewManager hideAnimated:completion:](self, "hideAnimated:completion:", a3, 0);
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  _BOOL4 v7;
  uint64_t v8;
  CACSimpleContentViewManager *v9;
  CACViewController *viewController;
  CACViewController *v11;
  CACViewController *v12;
  _QWORD v13[5];
  CACViewController *v14;
  void (**v15)(_QWORD);
  BOOL v16;
  _QWORD block[5];

  v6 = (void (**)(_QWORD))a4;
  v7 = -[CACSimpleContentViewManager isOverlay](self, "isOverlay");
  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__CACSimpleContentViewManager_hideAnimated_completion___block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  v9 = self;
  objc_sync_enter(v9);
  viewController = v9->_viewController;
  if (viewController)
  {
    v11 = viewController;
    v12 = v9->_viewController;
    v9->_viewController = 0;

    objc_sync_exit(v9);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __55__CACSimpleContentViewManager_hideAnimated_completion___block_invoke_2;
    v13[3] = &unk_24F2AB448;
    v13[4] = v9;
    v14 = v11;
    v16 = a3;
    v15 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v13);

  }
  else
  {
    objc_sync_exit(v9);

    if (v6)
      v6[2](v6);
  }

}

uint64_t __55__CACSimpleContentViewManager_hideAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopDelayedDimmingOfNumbers");
}

void __55__CACSimpleContentViewManager_hideAnimated_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contentViewManagerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentViewManager:dismissViewController:animated:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (BOOL)isShowing
{
  CACSimpleContentViewManager *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_viewController != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)hide
{
  -[CACSimpleContentViewManager _hideAnimated:](self, "_hideAnimated:", 1);
}

- (void)hideWithoutAnimation
{
  -[CACSimpleContentViewManager _hideAnimated:](self, "_hideAnimated:", 0);
}

- (BOOL)isOutOfProcess
{
  return 0;
}

- (BOOL)isPhysiciallyInteractiveOverlay
{
  return 0;
}

- (CACSimpleContentViewManagerDelegate)contentViewManagerDelegate
{
  return (CACSimpleContentViewManagerDelegate *)objc_loadWeakRetained((id *)&self->_contentViewManagerDelegate);
}

- (void)setContentViewManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contentViewManagerDelegate, a3);
}

- (CACViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (int64_t)pendingDimmingTransactionID
{
  return self->_pendingDimmingTransactionID;
}

- (void)setPendingDimmingTransactionID:(int64_t)a3
{
  self->_pendingDimmingTransactionID = a3;
}

- (int64_t)activeDimmingTransactionID
{
  return self->_activeDimmingTransactionID;
}

- (void)setActiveDimmingTransactionID:(int64_t)a3
{
  self->_activeDimmingTransactionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_contentViewManagerDelegate);
}

- (BOOL)isOverlay
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
