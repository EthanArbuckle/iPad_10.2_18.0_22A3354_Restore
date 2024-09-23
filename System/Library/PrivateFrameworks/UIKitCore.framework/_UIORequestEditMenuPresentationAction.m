@implementation _UIORequestEditMenuPresentationAction

- (_UIORequestEditMenuPresentationAction)initWithConfiguration:(id)a3 view:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  _UIORequestEditMenuPresentationAction *v16;
  objc_super v18;

  v6 = (void *)MEMORY[0x1E0CB36F8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v10, "setObject:forSetting:", v9, 0);
  objc_msgSend(v8, "sourceRect");
  v12 = v11;
  v14 = v13;

  +[_UIOServerActionOriginContext originContextForView:referencePoint:](_UIOServerActionOriginContext, "originContextForView:referencePoint:", v7, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18.receiver = self;
  v18.super_class = (Class)_UIORequestEditMenuPresentationAction;
  v16 = -[_UIOServerAction initWithOriginContext:info:responder:](&v18, sel_initWithOriginContext_info_responder_, v15, v10, 0);

  return v16;
}

- (_UIOEditMenuPresentationConfiguration)configuration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3710];
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIORequestEditMenuPresentationAction info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIOEditMenuPresentationConfiguration *)v7;
}

- (BOOL)isPermitted
{
  return +[UIEditMenuInteraction _isOutOfProcessEditMenusEnabled](UIEditMenuInteraction, "_isOutOfProcessEditMenusEnabled");
}

- (void)performActionFromConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69___UIORequestEditMenuPresentationAction_performActionFromConnection___block_invoke;
  v7[3] = &unk_1E16E3A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "awaitDisplayDelegateForAction:sceneType:timeout:completion:", self, 1, v7, 1.0);

}

@end
