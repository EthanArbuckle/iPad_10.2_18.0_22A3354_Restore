@implementation PXActionPerformer

- (BOOL)presentsMenu
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXActionPerformer)initWithActionType:(id)a3
{
  id v5;
  PXActionPerformer *v6;
  uint64_t v7;
  NSString *actionType;
  void *v10;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != actionType"));

  }
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[actionType length] > 0"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PXActionPerformer;
  v6 = -[PXActionPerformer init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    actionType = v6->_actionType;
    v6->_actionType = (NSString *)v7;

    v6->_state = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_presentationEnvironment, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_sender);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (PXActionPerformer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 160, CFSTR("Use the designated initializer: \"-initWithActionType:\"."));

  abort();
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return 0;
}

- (id)localizedSubtitleForUseCase:(unint64_t)a3
{
  return 0;
}

- (BOOL)shouldPreventTargetedDismissalAnimation
{
  return 0;
}

- (void)performActionWithCompletionHandler:(id)a3
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PXActionPerformer_performActionWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5148348;
  v10[4] = self;
  v11 = v5;
  v6 = v5;
  v7 = (void *)objc_msgSend(v10, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v7;

  -[PXActionPerformer _handleStepFinished:withSuccess:error:](self, "_handleStepFinished:withSuccess:error:", 0, 1, 0);
}

- (void)cancelActionWithCompletionHandler:(id)a3
{
  id v5;
  PXAnonymousViewController *presentedViewController;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

  }
  if (!-[PXActionPerformer isCancellable](self, "isCancellable"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self isCancellable]"));

  }
  presentedViewController = self->_presentedViewController;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__PXActionPerformer_cancelActionWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5148CE0;
  v10[4] = self;
  v11 = v5;
  v7 = v5;
  -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", presentedViewController, v10);

}

- (BOOL)performerResetsAfterCompletion
{
  return 0;
}

- (NSString)description
{
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = -[PXActionPerformer state](self, "state");
  v4 = CFSTR("userInteractive");
  v5 = CFSTR("backgroundTask");
  v6 = CFSTR("finished");
  if (v3 != 30)
    v6 = 0;
  if (v3 != 20)
    v5 = v6;
  if (v3 != 10)
    v4 = v5;
  v7 = CFSTR("ready");
  v8 = CFSTR("unlockIfNeeded");
  if (v3 != 5)
    v8 = 0;
  if (v3)
    v7 = v8;
  if (v3 <= 9)
    v9 = v7;
  else
    v9 = v4;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_opt_class();
  -[PXActionPerformer actionType](self, "actionType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p; type = %@, state = %@>"), v11, self, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)requiresUnlockedDevice
{
  return 0;
}

- (void)_performUnlockIfNeeded
{
  void (**v3)(void *, uint64_t);
  uint64_t v4;
  void *v5;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PXActionPerformer__performUnlockIfNeeded__block_invoke;
  aBlock[3] = &unk_1E5147360;
  aBlock[4] = self;
  v3 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (-[PXActionPerformer requiresUnlockedDevice](self, "requiresUnlockedDevice")
    && (+[PXActionManager _unlockDeviceHandlerWithActionType](PXActionManager, "_unlockDeviceHandlerWithActionType"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    (*(void (**)(uint64_t, void (**)(void *, uint64_t), _QWORD))(v4 + 16))(v4, v3, 0);

  }
  else
  {
    v3[2](v3, 1);
  }

}

- (void)_completeUnlockTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  -[PXActionPerformer _handleStepFinished:withSuccess:error:](self, "_handleStepFinished:withSuccess:error:", 5, a3, a4);
}

- (void)performUserInteractionTask
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "methodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "methodForSelector:", a2))
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (BOOL)presentViewController:(id)a3
{
  return -[PXActionPerformer presentViewController:completionHandler:](self, "presentViewController:completionHandler:", a3, 0);
}

- (BOOL)presentViewController:(id)a3 completionHandler:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v17;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

  }
  if (-[PXActionPerformer state](self, "state") != 10
    && (-[PXActionPerformer state](self, "state") != 20
     || !-[PXActionPerformer canPresentAlertInBackgroudState](self, "canPresentAlertInBackgroudState")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self state] == PXActionPerformerStateUserInteractive || ([self state] == PXActionPerformerStateBackgroundTask && self.canPresentAlertInBackgroudState)"));

  }
  -[PXActionPerformer delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_msgSend(v11, "actionPerformer:transitionToViewController:transitionType:", self, v8, 2) & 1) == 0)
      goto LABEL_16;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (!objc_msgSend(v11, "actionPerformer:presentViewController:", self, v8))
      goto LABEL_16;
  }
  else
  {
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
LABEL_16:
      v15 = 0;
      goto LABEL_17;
    }
    v13 = v8;
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentViewController:animated:completionHandler:", v13, 1, v9);

  }
  objc_storeStrong((id *)&self->_presentedViewController, a3);
  v15 = 1;
LABEL_17:

  return v15;
}

- (PXAnonymousViewController)hostViewController
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

  }
  if (-[PXActionPerformer state](self, "state") != 10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self state] == PXActionPerformerStateUserInteractive"));

  }
  -[PXActionPerformer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PXActionPerformer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostViewControllerForActionPerformer:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (PXAnonymousViewController *)v7;
}

- (NSUndoManager)undoManager
{
  NSUndoManager *v3;
  void *v4;
  char v5;
  void *v6;

  v3 = self->_undoManager;
  if (!v3)
  {
    -[PXActionPerformer delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[PXActionPerformer delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "undoManagerForActionPerformer:", self);
      v3 = (NSUndoManager *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (BOOL)prefersAssetInclusionAfterRemoval
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[PXActionPerformer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[PXActionPerformer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prefersAssetInclusionAfterRemovalForActionPerformer:", self);

  return v6;
}

- (PXPresentationEnvironment)presentationEnvironment
{
  PXPresentationEnvironment *v3;
  void *v4;
  char v5;
  void *v6;

  v3 = self->_presentationEnvironment;
  if (!v3)
  {
    -[PXActionPerformer delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[PXActionPerformer delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentationEnvironmentForActionPerformer:", self);
      v3 = (PXPresentationEnvironment *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (BOOL)pushViewController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v12;
  void *v13;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

  }
  if (-[PXActionPerformer state](self, "state") != 10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self state] == PXActionPerformerStateUserInteractive"));

  }
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PXActionPerformer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "actionPerformer:transitionToViewController:transitionType:", self, v5, 1);

  }
  else if (v6)
  {
    v10 = objc_msgSend(v6, "pushViewController:animated:", v5, 1);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)dismissViewController:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

  }
  if (-[PXActionPerformer state](self, "state") != 10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self state] == PXActionPerformerStateUserInteractive"));

  }
  if (!v8)
    v8 = (void (**)(_QWORD))&__block_literal_global_90260;
  -[PXActionPerformer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[PXActionPerformer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "actionPerformer:dismissViewController:completionHandler:", self, v7, v8);
  }
  else
  {
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v8[2](v8);
      v12 = 0;
      goto LABEL_12;
    }
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
    objc_msgSend(v11, "dismissViewController:animated:completionHandler:", v7, 1, v8);
  }

LABEL_12:
  return v12;
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  -[PXActionPerformer _handleStepFinished:withSuccess:error:](self, "_handleStepFinished:withSuccess:error:", 10, a3, a4);
}

- (void)performBackgroundTask
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "methodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "methodForSelector:", a2))
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
}

- (void)completeBackgroundTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  -[PXActionPerformer _handleStepFinished:withSuccess:error:](self, "_handleStepFinished:withSuccess:error:", 20, a3, a4);
}

- (void)_handleStepFinished:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  PXActionPerformer *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v5 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (v9)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 0;
      v12 = CFSTR("NO");
      if (v5)
        v12 = CFSTR("YES");
      if ((uint64_t)a3 <= 9)
      {
        if (a3)
        {
          if (a3 == 5)
            v11 = CFSTR("unlockIfNeeded");
        }
        else
        {
          v11 = CFSTR("ready");
        }
      }
      else
      {
        switch(a3)
        {
          case 0xAuLL:
            v11 = CFSTR("userInteractive");
            break;
          case 0x14uLL:
            v11 = CFSTR("backgroundTask");
            break;
          case 0x1EuLL:
            v11 = CFSTR("finished");
            break;
        }
      }
      *(_DWORD *)buf = 138413058;
      v21 = self;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v11;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "%@ success:%@ step:%@ encountered error:%@", buf, 0x2Au);
    }

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 389, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

  }
  if (-[PXActionPerformer state](self, "state") == a3)
  {
    if (!v5)
      goto LABEL_28;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 0;
    if ((uint64_t)a3 <= 9)
    {
      if (a3)
      {
        if (a3 == 5)
          v17 = CFSTR("unlockIfNeeded");
      }
      else
      {
        v17 = CFSTR("ready");
      }
    }
    else
    {
      switch(a3)
      {
        case 0xAuLL:
          v17 = CFSTR("userInteractive");
          break;
        case 0x14uLL:
          v17 = CFSTR("backgroundTask");
          break;
        case 0x1EuLL:
          v17 = CFSTR("finished");
          break;
      }
    }
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 390, CFSTR("%@: Invalid transition fromState: %@"), self, v17);

    if (!v5)
      goto LABEL_28;
  }
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 10)
    {
      v13 = 20;
      goto LABEL_29;
    }
    if (a3 != 20)
      goto LABEL_45;
LABEL_28:
    v13 = 30;
    goto LABEL_29;
  }
  if (!a3)
  {
    v13 = 5;
    goto LABEL_29;
  }
  if (a3 != 5)
  {
LABEL_45:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PXActionPerformerStateDescription(a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 413, CFSTR("Not allowed to transition from state:%@"), v19);

    abort();
  }
  v13 = 10;
LABEL_29:
  -[PXActionPerformer _transitionToState:withSuccess:error:](self, "_transitionToState:withSuccess:error:", v13, v5, v9);

}

- (void)_transitionToState:(unint64_t)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  int64_t state;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v5 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (self->_state >= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 0;
    state = self->_state;
    if (state <= 9)
    {
      if (state)
      {
        if (state == 5)
          v17 = CFSTR("unlockIfNeeded");
      }
      else
      {
        v17 = CFSTR("ready");
      }
    }
    else
    {
      switch(state)
      {
        case 10:
          v17 = CFSTR("userInteractive");
          break;
        case 20:
          v17 = CFSTR("backgroundTask");
          break;
        case 30:
          v17 = CFSTR("finished");
          break;
      }
    }
    v19 = 0;
    if ((uint64_t)a3 <= 9)
    {
      if (a3)
      {
        if (a3 == 5)
          v19 = CFSTR("unlockIfNeeded");
      }
      else
      {
        v19 = CFSTR("ready");
      }
    }
    else
    {
      switch(a3)
      {
        case 0xAuLL:
          v19 = CFSTR("userInteractive");
          break;
        case 0x14uLL:
          v19 = CFSTR("backgroundTask");
          break;
        case 0x1EuLL:
          v19 = CFSTR("finished");
          break;
      }
    }
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 422, CFSTR("Tried transitioning from %@ to the same or earlier step %@"), v17, v19);

  }
  self->_state = a3;
  if (a3 == 30)
    self->_success = v5;
  PLUIGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 0;
    if ((uint64_t)a3 <= 9)
    {
      if (a3)
      {
        if (a3 == 5)
          v11 = CFSTR("unlockIfNeeded");
      }
      else
      {
        v11 = CFSTR("ready");
      }
    }
    else
    {
      switch(a3)
      {
        case 0xAuLL:
          v11 = CFSTR("userInteractive");
          break;
        case 0x14uLL:
          v11 = CFSTR("backgroundTask");
          break;
        case 0x1EuLL:
          v11 = CFSTR("finished");
          break;
      }
    }
    *(_DWORD *)buf = 138412802;
    v23 = v11;
    v24 = 1024;
    v25 = v5;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "Transition to state: %@, success: %d, error: %@", buf, 0x1Cu);
  }

  -[PXActionPerformer delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[PXActionPerformer delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionPerformer:didChangeState:", self, a3);

  }
  if ((uint64_t)a3 > 19)
  {
    if (a3 == 20)
    {
      -[PXActionPerformer performBackgroundTask](self, "performBackgroundTask");
      goto LABEL_28;
    }
    if (a3 == 30)
    {
      -[PXActionPerformer _completeStateWithSuccess:error:](self, "_completeStateWithSuccess:error:", v5, v9);
      goto LABEL_28;
    }
LABEL_52:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PXActionPerformerStateDescription(a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 454, CFSTR("Not allowed to transition to state:%@"), v21);

    abort();
  }
  if (a3 == 5)
  {
    -[PXActionPerformer _performUnlockIfNeeded](self, "_performUnlockIfNeeded");
    goto LABEL_28;
  }
  if (a3 != 10)
    goto LABEL_52;
  -[PXActionPerformer performUserInteractionTask](self, "performUserInteractionTask");
LABEL_28:

}

- (void)_completeStateWithSuccess:(BOOL)a3 error:(id)a4
{
  id completionHandler;
  PXAnonymousViewController *presentedViewController;

  (*((void (**)(void))self->_completionHandler + 2))();
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  presentedViewController = self->_presentedViewController;
  self->_presentedViewController = 0;

  if (-[PXActionPerformer performerResetsAfterCompletion](self, "performerResetsAfterCompletion"))
    self->_state = 0;
}

- (id)presentAlertWithConfigurationHandler:(id)a3
{
  void (**v4)(id, PXAlertConfiguration *);
  void *v5;
  void *v6;
  PXAlert *v7;
  PXAlertConfiguration *v8;
  PXAlert *v9;
  void *v10;
  _BOOL4 v11;
  PXAlert *v12;

  v4 = (void (**)(id, PXAlertConfiguration *))a3;
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "presentAlertWithConfigurationHandler:", v4);
    v7 = (PXAlert *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc_init(PXAlertConfiguration);
    v4[2](v4, v8);
    v9 = -[PXAlert initWithConfiguration:]([PXAlert alloc], "initWithConfiguration:", v8);
    -[PXAlert alertController](v9, "alertController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXActionPerformer presentViewController:](self, "presentViewController:", v10);

    if (v11)
      v12 = v9;
    else
      v12 = 0;
    v7 = v12;

  }
  return v7;
}

- (BOOL)dismissAlertWithToken:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v11 = v7;
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_5:
        objc_msgSend(v11, "dismissWithCompletionHandler:", v8);

        goto LABEL_6;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_descriptionForAssertionMessage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 496, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("token"), v15, v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 496, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("token"), v15);
    }

    goto LABEL_5;
  }
  objc_msgSend(v9, "dismissAlertWithToken:completionHandler:", v7, v8);
LABEL_6:

  return 1;
}

- (BOOL)presentAlertWithTitle:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  return -[PXActionPerformer presentAlertWithTitle:message:radarConfiguration:completionHandler:](self, "presentAlertWithTitle:message:radarConfiguration:completionHandler:", a3, a4, 0, a5);
}

- (BOOL)presentAlertWithTitle:(id)a3 message:(id)a4 radarConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v14 = (void *)MEMORY[0x1E0DC3448];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke;
    v24[3] = &unk_1E5138AE0;
    v25 = v10;
    v26 = v11;
    objc_msgSend(v14, "actionWithTitle:style:handler:", CFSTR("File Radar"), 0, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v15);

  }
  v16 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke_3;
  v22[3] = &unk_1E5142658;
  v23 = v11;
  v18 = v11;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v19);

  v20 = -[PXActionPerformer presentViewController:](self, "presentViewController:", v12);
  return v20;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (BOOL)success
{
  return self->_success;
}

- (id)sender
{
  return objc_loadWeakRetained(&self->_sender);
}

- (void)setSender:(id)a3
{
  objc_storeWeak(&self->_sender, a3);
}

- (BOOL)isCancellable
{
  return self->_cancellable;
}

- (unint64_t)state
{
  return self->_state;
}

- (PXActionPerformerDelegate)delegate
{
  return (PXActionPerformerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXAnonymousViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentationEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_presentationEnvironment, a3);
}

- (BOOL)canPresentAlertInBackgroudState
{
  return self->_canPresentAlertInBackgroudState;
}

- (void)setUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_undoManager, a3);
}

void __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke_2;
  v2[3] = &unk_1E51417E8;
  v3 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", v2);
  PXFileRadarWithConfiguration(*(void **)(a1 + 32));

}

uint64_t __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __88__PXActionPerformer_presentAlertWithTitle_message_radarConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __43__PXActionPerformer__performUnlockIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeUnlockTaskWithSuccess:error:", a2, 0);
}

uint64_t __55__PXActionPerformer_cancelActionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 10)
    objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __56__PXActionPerformer_performActionWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

+ (BOOL)isActionDestructive
{
  return 0;
}

- (id)menuElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  -[PXActionPerformer localizedTitleForUseCase:](self, "localizedTitleForUseCase:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    -[PXActionPerformer activitySystemImageName](self, "activitySystemImageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemImageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0DC3428];
    -[PXActionPerformer actionType](self, "actionType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__PXActionPerformer_UIKit__menuElement__block_invoke;
    v12[3] = &unk_1E513C038;
    v12[4] = self;
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v3, v6, v8, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXActionPerformer localizedSubtitleForUseCase:](self, "localizedSubtitleForUseCase:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSubtitle:", v10);

    objc_msgSend(v9, "setState:", -[PXActionPerformer menuElementState](self, "menuElementState"));
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled")
      && -[PXActionPerformer keepMenuPresented](self, "keepMenuPresented"))
    {
      objc_msgSend(v9, "setAttributes:", objc_msgSend(v9, "attributes") | 8);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)menuElementState
{
  return 0;
}

- (BOOL)keepMenuPresented
{
  return 0;
}

- (id)activity
{
  PXActionPerformer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  PXActionPerformer *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PXActionPerformer localizedTitleForUseCase:](self, "localizedTitleForUseCase:", 2);
  v3 = (PXActionPerformer *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer actionType](self, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer activitySystemImageName](self, "activitySystemImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && v4 && v5)
  {
    +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", v3, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v15 = v3;
        v16 = 2112;
        v17 = v4;
        v18 = 2112;
        v19 = v5;
        v20 = 2112;
        v21 = v6;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Failed to create activity for title=%@, actionType=%@, activityType=%@, imageName=%@", buf, 0x2Au);
      }

    }
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __36__PXActionPerformer_UIKit__activity__block_invoke;
    v13[3] = &unk_1E51248D0;
    v13[4] = self;
    objc_msgSend(v7, "setPerformActivityActionHandler:", v13);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __36__PXActionPerformer_UIKit__activity__block_invoke_2;
    v12[3] = &unk_1E51248F8;
    v12[4] = self;
    objc_msgSend(v7, "setCanPerformActivityActionHandler:", v12);
  }
  else
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_fault_impl(&dword_1A6789000, v10, OS_LOG_TYPE_FAULT, "Attempting to construct an activity from action performer %@ but it doesn't provide all info", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)barButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  PXActionPerformer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PXActionPerformer activitySystemImageName](self, "activitySystemImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer localizedTitleForUseCase:](self, "localizedTitleForUseCase:", 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v10, 0, v6, a4);

  }
  else if (v8)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v8, 0, v6, a4);
  }
  else
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = self;
      _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Tried to create a bar button item from %@, but it has no system image or title", (uint8_t *)&v14, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (NSString)activityType
{
  return 0;
}

- (NSString)activitySystemImageName
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  return 0;
}

- (void)performActivity:(id)a3
{
  -[PXActionPerformer performActionWithCompletionHandler:](self, "performActionWithCompletionHandler:", 0);
}

uint64_t __36__PXActionPerformer_UIKit__activity__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performActivity:", a2);
}

uint64_t __36__PXActionPerformer_UIKit__activity__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "canPerformWithActivityItems:forActivity:", a2, a3);
}

uint64_t __39__PXActionPerformer_UIKit__menuElement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performActionWithCompletionHandler:", 0);
}

@end
