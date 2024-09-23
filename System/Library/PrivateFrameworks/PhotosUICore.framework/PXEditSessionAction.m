@implementation PXEditSessionAction

- (PXEditSessionAction)initWithPresetManager:(id)a3 asset:(id)a4 sourcePreset:(id)a5 targetPreset:(id)a6 syncProgress:(id)a7 asyncLoadingStatusManager:(id)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  PXEditSessionAction *v21;
  id v23;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v23 = a5;
  v15 = a6;
  v25[0] = v14;
  v16 = (void *)MEMORY[0x1E0C99D20];
  v17 = a8;
  v18 = a7;
  v19 = a3;
  objc_msgSend(v16, "arrayWithObjects:count:", v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)PXEditSessionAction;
  v21 = -[PXEditBatchAction initWithPresetManager:syncProgress:asyncProgress:asyncLoadingStatusManager:forAssets:](&v24, sel_initWithPresetManager_syncProgress_asyncProgress_asyncLoadingStatusManager_forAssets_, v19, v18, 0, v17, v20);

  if (v21)
  {
    objc_storeStrong(&v21->_sourcePreset, a5);
    objc_storeStrong(&v21->_targetPreset, a6);
  }

  return v21;
}

- (void)performAction:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)registerWithUndoManager:(id)a3
{
  id v4;
  NSString *v5;
  NSString *undoMenuItemTitle;
  NSString *v7;
  NSString *redoMenuItemTitle;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXEditSessionAction;
  v4 = a3;
  -[PXAction registerWithUndoManager:](&v9, sel_registerWithUndoManager_, v4);
  objc_msgSend(v4, "undoMenuItemTitle", v9.receiver, v9.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  undoMenuItemTitle = self->_undoMenuItemTitle;
  self->_undoMenuItemTitle = v5;

  objc_msgSend(v4, "redoMenuItemTitle");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  redoMenuItemTitle = self->_redoMenuItemTitle;
  self->_redoMenuItemTitle = v7;

}

- (void)performUndo:(id)a3
{
  -[PXEditSessionAction _applyPreset:actionName:completionHandler:](self, "_applyPreset:actionName:completionHandler:", self->_sourcePreset, self->_undoMenuItemTitle, a3);
}

- (void)performRedo:(id)a3
{
  -[PXEditSessionAction _applyPreset:actionName:completionHandler:](self, "_applyPreset:actionName:completionHandler:", self->_targetPreset, self->_redoMenuItemTitle, a3);
}

- (void)_applyPreset:(id)a3 actionName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[16];
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXEditBatchAction assets](self, "assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    -[PXEditBatchAction assets](self, "assets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && v13)
    {
      v14 = -[PXEditBatchAction shouldRenderSynchronouslyForAsset:](self, "shouldRenderSynchronouslyForAsset:", v13) ^ 1;
      objc_msgSend(v13, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v15;
      v26[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXEditBatchAction willBeginActionWithLocalizedTitle:isAsync:itemCount:](self, "willBeginActionWithLocalizedTitle:isAsync:itemCount:", v9, v14, 1);
      if ((v14 & 1) != 0)
        -[PXEditBatchAction asyncProgress](self, "asyncProgress");
      else
        -[PXEditBatchAction syncProgress](self, "syncProgress");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXEditBatchAction manager](self, "manager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __65__PXEditSessionAction__applyPreset_actionName_completionHandler___block_invoke;
      v21[3] = &unk_1E513B020;
      v22 = v10;
      objc_msgSend(v19, "replacePresets:onAssets:async:progress:completion:", v16, v20, v14, v18, v21);

      goto LABEL_12;
    }
  }
  else
  {

    v13 = 0;
  }
  PLUIGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Could not complete PXEditSessionAction: No asset or preset found", buf, 2u);
  }

  (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
LABEL_12:

}

- (id)sourcePreset
{
  return self->_sourcePreset;
}

- (id)targetPreset
{
  return self->_targetPreset;
}

- (NSString)localizedActionName
{
  return self->_localizedActionName;
}

- (void)setLocalizedActionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong(&self->_targetPreset, 0);
  objc_storeStrong(&self->_sourcePreset, 0);
  objc_storeStrong((id *)&self->_redoMenuItemTitle, 0);
  objc_storeStrong((id *)&self->_undoMenuItemTitle, 0);
}

void __65__PXEditSessionAction__applyPreset_actionName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
