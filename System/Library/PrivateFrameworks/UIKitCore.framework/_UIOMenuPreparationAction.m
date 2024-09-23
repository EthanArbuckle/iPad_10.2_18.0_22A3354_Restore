@implementation _UIOMenuPreparationAction

- (_UIOMenuPreparationAction)initWithMenu:(id)a3 responseHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UIOMenuPreparationAction *v13;
  id v14;
  void *v15;
  _UIOMenuPreparationAction *v16;
  void *v18;
  objc_super v19;
  _QWORD v20[4];
  _UIOMenuPreparationAction *v21;
  id v22;
  SEL v23;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "_internalIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIOMenuPreparationAction.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("menu._internalIdentifier"));

  }
  objc_msgSend(v7, "_internalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setObject:forSetting:", v10, 1);
  v12 = (void *)MEMORY[0x1E0D016A0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58___UIOMenuPreparationAction_initWithMenu_responseHandler___block_invoke;
  v20[3] = &unk_1E16B9250;
  v22 = v8;
  v23 = a2;
  v13 = self;
  v21 = v13;
  v14 = v8;
  objc_msgSend(v12, "responderWithHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = v13;
  v19.super_class = (Class)_UIOMenuPreparationAction;
  v16 = -[_UIOMenuPreparationAction initWithInfo:responder:](&v19, sel_initWithInfo_responder_, v11, v15);

  return v16;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[_UIOMenuPreparationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)handleClientActionToOverlayService:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOMenuPreparationAction identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64___UIOMenuPreparationAction_handleClientActionToOverlayService___block_invoke;
  v9[3] = &unk_1E16B9278;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v8 = v5;
  objc_msgSend(v6, "preparedMenuWithIdentifier:completionHandler:", v7, v9);

}

@end
