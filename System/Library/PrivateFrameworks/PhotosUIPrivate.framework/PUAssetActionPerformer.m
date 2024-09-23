@implementation PUAssetActionPerformer

- (PUAssetActionPerformer)init
{
  return -[PUAssetActionPerformer initWithActionType:assets:orAssetsByAssetCollection:](self, "initWithActionType:assets:orAssetsByAssetCollection:", 0, 0, 0);
}

- (PUAssetActionPerformer)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5
{
  id v8;
  id v9;
  PUAssetActionPerformer *v10;
  PUAssetActionPerformer *v11;
  uint64_t v12;
  NSArray *assets;
  uint64_t v14;
  NSDictionary *assetsByAssetCollection;
  void *v16;
  NSDictionary *v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  _QWORD v22[4];
  NSArray *v23;
  objc_super v24;

  v8 = a4;
  v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PUAssetActionPerformer;
  v10 = -[PUAssetActionPerformer init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_actionType = a3;
    v10->_state = 0;
    v12 = objc_msgSend(v8, "copy");
    assets = v11->_assets;
    v11->_assets = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    assetsByAssetCollection = v11->_assetsByAssetCollection;
    v11->_assetsByAssetCollection = (NSDictionary *)v14;

    if (!v11->_assets)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11->_assetsByAssetCollection;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __78__PUAssetActionPerformer_initWithActionType_assets_orAssetsByAssetCollection___block_invoke;
      v22[3] = &unk_1E589CA20;
      v18 = v16;
      v23 = v18;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v19 = v11->_assets;
      v11->_assets = v18;
      v20 = v18;

    }
  }

  return v11;
}

- (NSUndoManager)undoManager
{
  void *v3;
  void *v4;

  -[PUAssetActionPerformer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManagerForAssetActionPerformer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUndoManager *)v4;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id completionHandler;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetActionManager.m"), 436, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__PUAssetActionPerformer_performWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E58AA3D0;
  v10[4] = self;
  v11 = v5;
  v6 = v5;
  v7 = (void *)objc_msgSend(v10, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v7;

  -[PUAssetActionPerformer _handleStepFinished:withSuccess:error:](self, "_handleStepFinished:withSuccess:error:", 0, 1, 0);
}

- (BOOL)_requiresUnlockedDevice
{
  unint64_t v2;

  v2 = -[PUAssetActionPerformer actionType](self, "actionType");
  return (v2 > 0x3B) | (0x1E20079FFFF8000uLL >> v2) & 1;
}

- (void)_performUnlockIfNeeded
{
  void (**v3)(void *, uint64_t);
  void (**v4)(_QWORD, _QWORD, _QWORD);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PUAssetActionPerformer__performUnlockIfNeeded__block_invoke;
  aBlock[3] = &unk_1E58A9910;
  aBlock[4] = self;
  v3 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (-[PUAssetActionPerformer _requiresUnlockedDevice](self, "_requiresUnlockedDevice"))
  {
    +[PUAssetActionManager _unlockDeviceHandlerWithActionType](PUAssetActionManager, "_unlockDeviceHandlerWithActionType");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v4)
      ((void (**)(_QWORD, void (**)(void *, uint64_t), unint64_t))v4)[2](v4, v3, -[PUAssetActionPerformer _unlockActionTypeForAssetActionType:](self, "_unlockActionTypeForAssetActionType:", -[PUAssetActionPerformer actionType](self, "actionType")));
    else
      v3[2](v3, 1);

  }
  else
  {
    v3[2](v3, 1);
  }

}

- (void)_completeUnlockTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  -[PUAssetActionPerformer _handleStepFinished:withSuccess:error:](self, "_handleStepFinished:withSuccess:error:", 5, a3, a4);
}

- (unint64_t)_unlockActionTypeForAssetActionType:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = 2;
  v4 = 3;
  if (a3 != 31)
    v4 = 0;
  if (a3 != 62)
    v3 = v4;
  if (a3 == 15)
    return 1;
  else
    return v3;
}

- (void)performUserInteractionTask
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "methodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "methodForSelector:", a2))
    -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (BOOL)presentViewController:(id)a3
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v13;

  v6 = a3;
  if (-[PUAssetActionPerformer state](self, "state") != 10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetActionManager.m"), 662, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self state] == PUAssetActionPerformerStateUserInteraction"));

  }
  -[PUAssetActionPerformer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0
    && (-[PUAssetActionPerformer delegate](self, "delegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "assetActionPerformer:presentViewController:", self, v6),
        v9,
        v10))
  {
    objc_storeStrong((id *)&self->_presentedViewController, a3);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)dismissViewController:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (-[PUAssetActionPerformer state](self, "state") != 10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetActionManager.m"), 675, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self state] == PUAssetActionPerformerStateUserInteraction"));

  }
  -[PUAssetActionPerformer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[PUAssetActionPerformer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "assetActionPerformer:dismissViewController:completionHandler:", self, v7, v8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  -[PUAssetActionPerformer _handleStepFinished:withSuccess:error:](self, "_handleStepFinished:withSuccess:error:", 10, a3, a4);
}

- (void)performBackgroundTask
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "methodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "methodForSelector:", a2))
    -[PUAssetActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
}

- (void)completeBackgroundTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  -[PUAssetActionPerformer _handleStepFinished:withSuccess:error:](self, "_handleStepFinished:withSuccess:error:", 20, a3, a4);
}

- (void)_handleStepFinished:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v13 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetActionManager.m"), 705, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

  }
  if (-[PUAssetActionPerformer state](self, "state") == a3)
  {
    if (!v5)
    {
LABEL_12:
      v9 = 30;
      goto LABEL_13;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetActionManager.m"), 706, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromState == [self state]"));

    if (!v5)
      goto LABEL_12;
  }
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 10)
    {
      v9 = 20;
      goto LABEL_13;
    }
    if (a3 == 20)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (!a3)
  {
    v9 = 5;
    goto LABEL_13;
  }
  if (a3 != 5)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetActionManager.m"), 729, CFSTR("Not allowed to transition from state:%ld"), a3);

    goto LABEL_12;
  }
  v9 = 10;
LABEL_13:
  -[PUAssetActionPerformer _transitionToState:withSuccess:error:](self, "_transitionToState:withSuccess:error:", v9, v5, v13);

}

- (void)_transitionToState:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  v14 = a5;
  if (self->_state >= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetActionManager.m"), 738, CFSTR("Tried transitioning from %lu to the same or earlier step %lu"), self->_state, a3);

  }
  self->_state = a3;
  -[PUAssetActionPerformer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[PUAssetActionPerformer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetActionPerformer:didChangeState:", self, a3);

  }
  if ((uint64_t)a3 > 19)
  {
    if (a3 == 20)
    {
      -[PUAssetActionPerformer performBackgroundTask](self, "performBackgroundTask");
      goto LABEL_15;
    }
    if (a3 == 30)
    {
      -[PUAssetActionPerformer _completeStateWithSuccess:error:](self, "_completeStateWithSuccess:error:", v5, v14);
      goto LABEL_15;
    }
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetActionManager.m"), 765, CFSTR("Not allowed to transition to state:%ld"), a3);

    goto LABEL_15;
  }
  if (a3 == 5)
  {
    -[PUAssetActionPerformer _performUnlockIfNeeded](self, "_performUnlockIfNeeded");
    goto LABEL_15;
  }
  if (a3 != 10)
    goto LABEL_14;
  -[PUAssetActionPerformer performUserInteractionTask](self, "performUserInteractionTask");
LABEL_15:

}

- (void)_completeStateWithSuccess:(BOOL)a3 error:(id)a4
{
  id completionHandler;
  UIViewController *presentedViewController;

  (*((void (**)(void))self->_completionHandler + 2))();
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  presentedViewController = self->_presentedViewController;
  self->_presentedViewController = 0;

}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (unint64_t)state
{
  return self->_state;
}

- (PUAssetActionPerformerDelegate)delegate
{
  return (PUAssetActionPerformerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (OS_os_log)actionPerformerLog
{
  return (OS_os_log *)objc_loadWeakRetained((id *)&self->_actionPerformerLog);
}

- (void)setActionPerformerLog:(id)a3
{
  objc_storeWeak((id *)&self->_actionPerformerLog, a3);
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSDictionary)assetsByAssetCollection
{
  return self->_assetsByAssetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_destroyWeak((id *)&self->_actionPerformerLog);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __48__PUAssetActionPerformer__performUnlockIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeUnlockTaskWithSuccess:error:", a2, 0);
}

void __55__PUAssetActionPerformer_performWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      v7 = v5;
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
      v5 = v7;
    }
  }

}

uint64_t __78__PUAssetActionPerformer_initWithActionType_assets_orAssetsByAssetCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

@end
