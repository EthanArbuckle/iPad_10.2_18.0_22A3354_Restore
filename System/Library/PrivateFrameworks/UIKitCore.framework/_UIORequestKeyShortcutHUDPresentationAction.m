@implementation _UIORequestKeyShortcutHUDPresentationAction

- (_UIORequestKeyShortcutHUDPresentationAction)initWithConfiguration:(id)a3 responseHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _UIORequestKeyShortcutHUDPresentationAction *v14;
  objc_super v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D017D0];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forSetting:", v10, 0);
  v11 = (void *)MEMORY[0x1E0D016A0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85___UIORequestKeyShortcutHUDPresentationAction_initWithConfiguration_responseHandler___block_invoke;
  v17[3] = &unk_1E16C6A58;
  v18 = v6;
  v12 = v6;
  objc_msgSend(v11, "responderWithHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeout:", dispatch_time(0, 2000000000));
  objc_msgSend(v13, "setQueue:", MEMORY[0x1E0C80D38]);
  v16.receiver = self;
  v16.super_class = (Class)_UIORequestKeyShortcutHUDPresentationAction;
  v14 = -[_UIOServerAction initWithOriginContext:info:responder:](&v16, sel_initWithOriginContext_info_responder_, 0, v9, v13);

  return v14;
}

- (_UIKeyShortcutHUDConfiguration)configuration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3710];
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIORequestKeyShortcutHUDPresentationAction info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIKeyShortcutHUDConfiguration *)v7;
}

- (BOOL)isPermitted
{
  return +[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled");
}

- (void)performActionFromConnection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD aBlock[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke;
  aBlock[3] = &unk_1E16E46D8;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  objc_msgSend(v4, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke_2;
  v10[3] = &unk_1E16E4728;
  v11 = v4;
  v12 = v6;
  v10[4] = self;
  v8 = v4;
  v9 = v6;
  objc_msgSend(v7, "awaitDisplayDelegateForAction:sceneType:timeout:completion:", self, 1, v10, 1.0);

}

@end
