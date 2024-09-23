@implementation TTRUndoManager

- (TTRUndoManager)initWithDebugIdentifier:(id)a3
{
  id v4;
  TTRUndoManager *v5;
  uint64_t v6;
  NSString *debugIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTRUndoManager;
  v5 = -[TTRUndoManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    debugIdentifier = v5->_debugIdentifier;
    v5->_debugIdentifier = (NSString *)v6;

  }
  return v5;
}

+ (void)withActionName:(id)a3 block:(id)a4
{
  void (**v5)(_QWORD);
  id *v6;
  id v7;
  TTRUndoManagerActionContext *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = (void (**)(_QWORD))a4;
  v6 = (id *)perThreadActionContext();
  v7 = *v6;
  v8 = objc_alloc_init(TTRUndoManagerActionContext);
  *v6 = v8;
  if (v5)
    v5[2](v5);
  *v6 = v7;
  -[TTRUndoManagerActionContext undoManagerOfLastRegisteredUndo](v8, "undoManagerOfLastRegisteredUndo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_registerLogUserAction:", v11);
    objc_msgSend(v10, "setActionName:", v11);
  }

}

- (void)registerUndoWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v8 = a3;
  v9 = a5;
  if (-[TTRUndoManager isUndoRegistrationEnabled](self, "isUndoRegistrationEnabled"))
  {
    -[TTRUndoManager _prepareToRegisterUndo](self, "_prepareToRegisterUndo");
    v10.receiver = self;
    v10.super_class = (Class)TTRUndoManager;
    -[TTRUndoManager registerUndoWithTarget:selector:object:](&v10, sel_registerUndoWithTarget_selector_object_, v8, a4, v9);
  }

}

- (void)registerUndoWithTarget:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[TTRUndoManager isUndoRegistrationEnabled](self, "isUndoRegistrationEnabled"))
  {
    -[TTRUndoManager _prepareToRegisterUndo](self, "_prepareToRegisterUndo");
    v8.receiver = self;
    v8.super_class = (Class)TTRUndoManager;
    -[TTRUndoManager registerUndoWithTarget:handler:](&v8, sel_registerUndoWithTarget_handler_, v6, v7);
  }

}

- (void)removeAllActions
{
  void *v3;
  objc_super v4;

  if (!-[TTRUndoManager disableRemoveAllActions](self, "disableRemoveAllActions"))
  {
    v4.receiver = self;
    v4.super_class = (Class)TTRUndoManager;
    -[TTRUndoManager removeAllActions](&v4, sel_removeAllActions);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("TTRUndoManagerDidRemoveAllActionsNotification"), self);

  }
}

- (void)_prepareToRegisterUndo
{
  void *v3;
  id v4;

  v4 = *(id *)perThreadActionContext();
  if (v4)
    objc_msgSend(v4, "setUndoManagerOfLastRegisteredUndo:", self);
  if (!-[TTRUndoManager shouldSuppressWillRegisterUndoNotifications](self, "shouldSuppressWillRegisterUndoNotifications"))
  {
    -[TTRUndoManager setShouldSuppressWillRegisterUndoNotifications:](self, "setShouldSuppressWillRegisterUndoNotifications:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("TTRUndoManagerWillRegisterUndoNotification"), self);

    -[TTRUndoManager setShouldSuppressWillRegisterUndoNotifications:](self, "setShouldSuppressWillRegisterUndoNotifications:", 0);
  }

}

- (void)_registerLogUserAction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (_registerLogUserAction__onceToken[0] != -1)
    dispatch_once(_registerLogUserAction__onceToken, &__block_literal_global_1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__TTRUndoManager__registerLogUserAction___block_invoke_2;
  v6[3] = &unk_1E6783DC0;
  v7 = v4;
  v5 = v4;
  -[TTRUndoManager registerUndoWithTarget:handler:](self, "registerUndoWithTarget:handler:", self, v6);

}

void __41__TTRUndoManager__registerLogUserAction___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "userAction");
  v1 = (void *)_registerLogUserAction__logObject;
  _registerLogUserAction__logObject = (uint64_t)v0;

}

void __41__TTRUndoManager__registerLogUserAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isUndoing"))
  {
    v4 = _registerLogUserAction__logObject;
    if (os_log_type_enabled((os_log_t)_registerLogUserAction__logObject, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v8 = 138412290;
      *(_QWORD *)&v8[4] = v5;
      v6 = "Undo %@";
LABEL_7:
      _os_log_impl(&dword_1B41C2000, v4, OS_LOG_TYPE_INFO, v6, v8, 0xCu);
    }
  }
  else if (objc_msgSend(v3, "isRedoing"))
  {
    v4 = _registerLogUserAction__logObject;
    if (os_log_type_enabled((os_log_t)_registerLogUserAction__logObject, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v8 = 138412290;
      *(_QWORD *)&v8[4] = v7;
      v6 = "Redo %@";
      goto LABEL_7;
    }
  }
  objc_msgSend(v3, "_registerLogUserAction:", *(_QWORD *)(a1 + 32), *(_OWORD *)v8);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TTRUndoManager debugIdentifier](self, "debugIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: debugIdentifier=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)debug_undoStackDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[TTRUndoManager valueForKey:](self, "valueForKey:", CFSTR("_undoStack"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_msgSend(v2, "count");
  objc_msgSend(v2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%lu entries) %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debug_redoStackDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[TTRUndoManager valueForKey:](self, "valueForKey:", CFSTR("_redoStack"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_msgSend(v2, "count");
  objc_msgSend(v2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%lu entries) %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)disableRemoveAllActions
{
  return self->_disableRemoveAllActions;
}

- (void)setDisableRemoveAllActions:(BOOL)a3
{
  self->_disableRemoveAllActions = a3;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)shouldSuppressWillRegisterUndoNotifications
{
  return self->_shouldSuppressWillRegisterUndoNotifications;
}

- (void)setShouldSuppressWillRegisterUndoNotifications:(BOOL)a3
{
  self->_shouldSuppressWillRegisterUndoNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
}

@end
