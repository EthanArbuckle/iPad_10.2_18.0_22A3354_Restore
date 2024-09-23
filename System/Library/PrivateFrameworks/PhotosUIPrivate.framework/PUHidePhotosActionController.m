@implementation PUHidePhotosActionController

- (PUHidePhotosActionController)initWithAssets:(id)a3 undoManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PUHidePhotosActionController *v10;
  id *p_isa;
  PUHidePhotosActionController *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B4E8]), "initWithAssets:", v7);
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)PUHidePhotosActionController;
    v10 = -[PUHidePhotosActionController init](&v14, sel_init);
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_action, v9);
      objc_storeStrong(p_isa + 2, a3);
      objc_storeStrong(p_isa + 3, a4);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)alertControllerForTogglingAssetsVisibilityWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  if (-[PXHideAssetsAction isHidden](self->_action, "isHidden"))
  {
    -[PUHidePhotosActionController assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLSuffixForItems();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v5;
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(CFSTR("HIDE_CONFIRMATION_MESSAGE_"), "stringByAppendingString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(CFSTR("HIDE_BUTTON_TITLE_"), "stringByAppendingString:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HIDE_CONFIRMATION_MESSAGE_%@S"), v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HIDE_BUTTON_TITLE_%@S"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedStringWithValidatedFormat(v13, CFSTR("%lu"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    PULocalizedString(CFSTR("CANCEL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3448];
    v16 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __96__PUHidePhotosActionController_alertControllerForTogglingAssetsVisibilityWithCompletionHandler___block_invoke;
    v25[3] = &unk_1E58AB6C0;
    v17 = v4;
    v26 = v17;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v10, 2, v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v18);

    v19 = (void *)MEMORY[0x1E0DC3448];
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __96__PUHidePhotosActionController_alertControllerForTogglingAssetsVisibilityWithCompletionHandler___block_invoke_2;
    v23[3] = &unk_1E58AB6C0;
    v24 = v17;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v14, 1, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v20);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)performActionWithCompletionHandler:(id)a3
{
  id v4;
  PXHideAssetsAction *action;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  action = self->_action;
  -[PUHidePhotosActionController undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PUHidePhotosActionController_performActionWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E58AA6A8;
  v9 = v4;
  v7 = v4;
  -[PXHideAssetsAction executeWithUndoManager:completionHandler:](action, "executeWithUndoManager:completionHandler:", v6, v8);

}

- (NSArray)assets
{
  return self->_assets;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

uint64_t __67__PUHidePhotosActionController_performActionWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__PUHidePhotosActionController_alertControllerForTogglingAssetsVisibilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __96__PUHidePhotosActionController_alertControllerForTogglingAssetsVisibilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

@end
