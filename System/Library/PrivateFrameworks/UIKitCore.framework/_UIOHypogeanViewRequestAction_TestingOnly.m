@implementation _UIOHypogeanViewRequestAction_TestingOnly

+ (id)_overlay_viewRegistry
{
  if (_MergedGlobals_1173 != -1)
    dispatch_once(&_MergedGlobals_1173, &__block_literal_global_410);
  return (id)qword_1ECD7F558;
}

- (_UIOHypogeanViewRequestAction_TestingOnly)initWithConfiguration:(id)a3 responseHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _UIOHypogeanViewRequestAction_TestingOnly *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a4;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  v9 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v9, "setObject:forSetting:", v7, 0);
  v10 = (void *)MEMORY[0x1E0D016A0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83___UIOHypogeanViewRequestAction_TestingOnly_initWithConfiguration_responseHandler___block_invoke;
  v16[3] = &unk_1E16C6A58;
  v17 = v6;
  v11 = v6;
  objc_msgSend(v10, "responderWithHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)_UIOHypogeanViewRequestAction_TestingOnly;
  v13 = -[_UIOServerAction initWithOriginContext:info:responder:](&v15, sel_initWithOriginContext_info_responder_, 0, v9, v12);

  return v13;
}

- (BOOL)isPermitted
{
  return os_variant_has_internal_diagnostics();
}

- (_UIOHypogeanViewRequestConfiguration)configuration
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIOHypogeanViewRequestAction_TestingOnly info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIOHypogeanViewRequestConfiguration *)v4;
}

- (void)performActionFromConnection:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73___UIOHypogeanViewRequestAction_TestingOnly_performActionFromConnection___block_invoke;
  v5[3] = &unk_1E16DA818;
  v5[4] = self;
  objc_msgSend(v4, "awaitDisplayDelegateForAction:sceneType:timeout:completion:", self, 2, v5, 2.0);

}

- (void)_performActionWithDisplayDelegate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _UIOHypogeanViewHandle *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a3;
  v23 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIOHypogeanViewActions_TestingOnly.m"), 140, CFSTR("No display delegate."));

    v5 = 0;
  }
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIOHypogeanViewActions_TestingOnly.m"), 141, CFSTR("No display delegate window"));

  }
  objc_msgSend(v23, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIButtonConfiguration borderedTintedButtonConfiguration](UIButtonConfiguration, "borderedTintedButtonConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", CFSTR("Test Button"));
  +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &__block_literal_global_81_3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  objc_msgSend(v10, "sizeToFit");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_overlay_viewRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v10, v13);

  v15 = objc_alloc_init(_UIOHypogeanViewHandle);
  -[_UIOHypogeanViewHandle setUniqueIdentifier:](v15, "setUniqueIdentifier:", v13);
  objc_msgSend(v23, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOHypogeanViewHandle setContextId:](v15, "setContextId:", objc_msgSend(v16, "_contextId"));

  objc_msgSend(v10, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOHypogeanViewHandle setRenderId:](v15, "setRenderId:", CALayerGetRenderId());

  objc_msgSend(v10, "bounds");
  -[_UIOHypogeanViewHandle setBounds:](v15, "setBounds:");
  v18 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forSetting:", v19, 1);

  objc_msgSend(MEMORY[0x1E0D016A8], "responseWithInfo:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOHypogeanViewRequestAction_TestingOnly sendResponse:](self, "sendResponse:", v20);

}

@end
