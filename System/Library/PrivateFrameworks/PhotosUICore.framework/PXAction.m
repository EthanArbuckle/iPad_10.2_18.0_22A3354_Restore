@implementation PXAction

- (NSString)actionIdentifier
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAction.m"), 21, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAction actionIdentifier]", v6);

  abort();
}

- (void)_updateNameWithUndoManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  id v9;

  v4 = a3;
  -[PXAction actionNameLocalizationKey](self, "actionNameLocalizationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
  else
    -[PXAction localizedActionName](self, "localizedActionName");
  v7 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v7;
  if (v7)
    v8 = (const __CFString *)v7;
  else
    v8 = &stru_1E5149688;
  objc_msgSend(v4, "setActionName:", v8);

}

- (void)_registerUndoWithUndoManager:(id)a3
{
  id v5;
  NSString *v6;
  NSString *undoMenuItemTitle;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAction.m"), 38, CFSTR("%s must be called on the main thread"), "-[PXAction _registerUndoWithUndoManager:]");

  }
  objc_initWeak(&location, v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__PXAction__registerUndoWithUndoManager___block_invoke;
  v9[3] = &unk_1E512EF50;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v5, "registerUndoWithTarget:handler:", self, v9);
  -[PXAction _updateNameWithUndoManager:](self, "_updateNameWithUndoManager:", v5);
  objc_msgSend(v5, "undoMenuItemTitle");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  undoMenuItemTitle = self->_undoMenuItemTitle;
  self->_undoMenuItemTitle = v6;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_registerRedoWithUndoManager:(id)a3
{
  id v5;
  NSString *v6;
  NSString *redoMenuItemTitle;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAction.m"), 52, CFSTR("%s must be called on the main thread"), "-[PXAction _registerRedoWithUndoManager:]");

  }
  objc_initWeak(&location, v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__PXAction__registerRedoWithUndoManager___block_invoke;
  v9[3] = &unk_1E512EF50;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v5, "registerUndoWithTarget:handler:", self, v9);
  -[PXAction _updateNameWithUndoManager:](self, "_updateNameWithUndoManager:", v5);
  objc_msgSend(v5, "redoMenuItemTitle");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  redoMenuItemTitle = self->_redoMenuItemTitle;
  self->_redoMenuItemTitle = v6;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_unregisterFromUndoManager:(id)a3
{
  objc_msgSend(a3, "removeAllActionsWithTarget:", self);
}

- (void)_performRedoWithUndoManager:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, void *);
  void *v9;
  PXAction *v10;
  id v11;

  v4 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __40__PXAction__performRedoWithUndoManager___block_invoke;
  v9 = &unk_1E5147B40;
  v10 = self;
  v11 = v4;
  v5 = v4;
  -[PXAction performRedo:](self, "performRedo:", &v6);
  -[PXAction _registerUndoWithUndoManager:](self, "_registerUndoWithUndoManager:", v5, v6, v7, v8, v9, v10);

}

- (void)_performUndoWithUndoManager:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[PXAction _registerRedoWithUndoManager:](self, "_registerRedoWithUndoManager:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PXAction__performUndoWithUndoManager___block_invoke;
  v6[3] = &unk_1E5147B40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXAction performUndo:](self, "performUndo:", v6);

}

- (void)performAction:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAction.m"), 100, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAction performAction:]", v8);

  abort();
}

- (void)performUndo:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAction.m"), 104, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAction performUndo:]", v8);

  abort();
}

- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[PXAction _registerUndoWithUndoManager:](self, "_registerUndoWithUndoManager:", v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__PXAction_executeWithUndoManager_completionHandler___block_invoke;
  v10[3] = &unk_1E5146918;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PXAction performAction:](self, "performAction:", v10);
  self->_executionStarted = 1;

}

- (void)registerWithUndoManager:(id)a3
{
  -[PXAction _registerUndoWithUndoManager:](self, "_registerUndoWithUndoManager:", a3);
  self->_executionStarted = 1;
}

- (void)removeAllActionsFromUndoManager:(id)a3
{
  objc_msgSend(a3, "removeAllActions");
}

- (NSString)actionSystemImageName
{
  return self->_actionSystemImageName;
}

- (BOOL)executionStarted
{
  return self->_executionStarted;
}

- (NSString)actionNameLocalizationKey
{
  return self->_actionNameLocalizationKey;
}

- (NSString)undoMenuItemTitle
{
  return self->_undoMenuItemTitle;
}

- (NSString)redoMenuItemTitle
{
  return self->_redoMenuItemTitle;
}

- (NSString)localizedActionName
{
  return self->_localizedActionName;
}

- (NSString)analyticsEventName
{
  return self->_analyticsEventName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventName, 0);
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong((id *)&self->_redoMenuItemTitle, 0);
  objc_storeStrong((id *)&self->_undoMenuItemTitle, 0);
  objc_storeStrong((id *)&self->_actionNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_actionSystemImageName, 0);
}

void __53__PXAction_executeWithUndoManager_completionHandler___block_invoke(id *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a1[4], "analyticsEventName");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v6, MEMORY[0x1E0C9AA70]);
  }
  else
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      *(_DWORD *)buf = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Unable perform action:%@ error:%@", buf, 0x16u);
    }
  }

  v9 = a1[5];
  v10 = v5;
  v11 = a1[6];
  v8 = v5;
  px_dispatch_on_main_queue();

}

uint64_t __53__PXAction_executeWithUndoManager_completionHandler___block_invoke_142(uint64_t a1)
{
  uint64_t result;

  if (!*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "_unregisterFromUndoManager:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
  return result;
}

void __40__PXAction__performUndoWithUndoManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unable perform undo:%@ error:%@", buf, 0x16u);
    }

  }
  v7 = *(id *)(a1 + 40);
  px_dispatch_on_main_queue();

}

uint64_t __40__PXAction__performUndoWithUndoManager___block_invoke_140(uint64_t result)
{
  if (!*(_BYTE *)(result + 48))
    return objc_msgSend(*(id *)(result + 32), "_unregisterFromUndoManager:", *(_QWORD *)(result + 40));
  return result;
}

void __40__PXAction__performRedoWithUndoManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unable perform redo:%@ error:%@", buf, 0x16u);
    }

  }
  v7 = *(id *)(a1 + 40);
  px_dispatch_on_main_queue();

}

uint64_t __40__PXAction__performRedoWithUndoManager___block_invoke_137(uint64_t result)
{
  if (!*(_BYTE *)(result + 48))
    return objc_msgSend(*(id *)(result + 32), "_unregisterFromUndoManager:", *(_QWORD *)(result + 40));
  return result;
}

void __41__PXAction__registerRedoWithUndoManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "_performRedoWithUndoManager:", WeakRetained);
    WeakRetained = v3;
  }

}

void __41__PXAction__registerUndoWithUndoManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "_performUndoWithUndoManager:", WeakRetained);
    WeakRetained = v3;
  }

}

@end
