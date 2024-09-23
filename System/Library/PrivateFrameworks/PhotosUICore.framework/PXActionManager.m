@implementation PXActionManager

- (BOOL)isActionTypeAllowed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PXActionManager allowedActionTypes](self, "allowedActionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXActionManager allowedActionTypes](self, "allowedActionTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)setAllowedActionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)allowedActionTypes
{
  return self->_allowedActionTypes;
}

- (PXActionPerformerDelegate)performerDelegate
{
  return (PXActionPerformerDelegate *)objc_loadWeakRetained((id *)&self->_performerDelegate);
}

- (void)setPerformerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_performerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedActionTypes, 0);
  objc_destroyWeak((id *)&self->_performerDelegate);
}

+ (void)setEnsureUnlockedDeviceHandlerWithActionType:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActionManager.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ensureUnlockedDeviceHandlerWithActionType != nil"), 0);

  }
  v5 = a1;
  objc_sync_enter(v5);
  v6 = objc_msgSend((id)_sharedUnlockDeviceHandlerWithActionType, "copy");
  v7 = (void *)_sharedUnlockDeviceHandlerWithActionType;
  _sharedUnlockDeviceHandlerWithActionType = v6;

  objc_sync_exit(v5);
}

+ (id)_unlockDeviceHandlerWithActionType
{
  id v2;
  void *v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = _Block_copy((const void *)_sharedUnlockDeviceHandlerWithActionType);
  objc_sync_exit(v2);

  v4 = _Block_copy(v3);
  return v4;
}

- (BOOL)canPerformActionType:(id)a3
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 84, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager canPerformActionType:]", v8);

  abort();
}

- (BOOL)supportsActionType:(id)a3
{
  return 0;
}

- (BOOL)isDestructiveActionType:(id)a3
{
  return 0;
}

- (id)actionTypeForGenericType:(id)a3
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 96, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager actionTypeForGenericType:]", v8);

  abort();
}

- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 100, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager actionPerformerForActionType:parameters:]", v11);

  abort();
}

- (id)actionPerformerForActionType:(id)a3
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 104, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager actionPerformerForActionType:]", v8);

  abort();
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 108, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager localizedTitleForActionType:useCase:]", v9);

  abort();
}

- (id)systemImageNameForActionType:(id)a3
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 112, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager systemImageNameForActionType:]", v8);

  abort();
}

- (id)actionItemForActionType:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PXActionItem *v10;

  v6 = a3;
  v7 = a4;
  if (-[PXActionManager canPerformActionType:](self, "canPerformActionType:", v6))
  {
    -[PXActionManager localizedTitleForActionType:useCase:](self, "localizedTitleForActionType:useCase:", v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PXActionManager systemImageNameForActionType:](self, "systemImageNameForActionType:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PXActionItem initWithTitle:systemImageName:role:handler:]([PXActionItem alloc], "initWithTitle:systemImageName:role:handler:", v8, v9, -[PXActionManager isDestructiveActionType:](self, "isDestructiveActionType:", v6), v7);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionItemsForActionTypes:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v19[0] = v12;
        v19[1] = 3221225472;
        v19[2] = __53__PXActionManager_actionItemsForActionTypes_handler___block_invoke;
        v19[3] = &unk_1E5148CE0;
        v15 = v7;
        v19[4] = v14;
        v20 = v15;
        -[PXActionManager actionItemForActionType:handler:](self, "actionItemForActionType:handler:", v14, v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v18, "addObject:", v16);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v18;
}

- (id)contextMenuElementsWithHandler:(id)a3
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 142, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager contextMenuElementsWithHandler:]", v8);

  abort();
}

uint64_t __53__PXActionManager_actionItemsForActionTypes_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)barButtonItemForActionType:(id)a3
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 614, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager(UIKit) barButtonItemForActionType:]", v8);

  abort();
}

- (id)previewActionForActionType:(id)a3 image:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 618, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager(UIKit) previewActionForActionType:image:]", v11);

  abort();
}

- (id)menuElementForActionType:(id)a3 image:(id)a4 willStartActionHandler:(id)a5 didEndActionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  objc_class *v16;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 622, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager(UIKit) menuElementForActionType:image:willStartActionHandler:didEndActionHandler:]", v17);

  abort();
}

- (id)standardActionForActionType:(id)a3
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 626, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager(UIKit) standardActionForActionType:]", v8);

  abort();
}

- (id)activityForActionType:(id)a3
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionManager.m"), 630, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionManager(UIKit) activityForActionType:]", v8);

  abort();
}

- (id)contextMenu
{
  return 0;
}

- (BOOL)supportsContextMenu
{
  return 0;
}

- (id)menuElementsForActionType:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)actionKeyCommands
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

@end
