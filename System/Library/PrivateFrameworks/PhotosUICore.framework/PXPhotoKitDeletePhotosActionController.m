@implementation PXPhotoKitDeletePhotosActionController

- (PXPhotoKitDeletePhotosActionController)initWithAction:(int64_t)a3 assets:(id)a4 undoManager:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  PXPhotoKitDeletePhotosActionController *v14;
  PXPhotoKitDeletePhotosActionController *v15;
  uint64_t v16;
  NSArray *plAssets;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PXPhotoKitDeletePhotosActionController;
  v14 = -[PXPhotoKitDeletePhotosActionController init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_action = a3;
    objc_storeStrong((id *)&v14->_undoManager, a5);
    objc_storeWeak((id *)&v15->_delegate, v13);
    objc_storeStrong((id *)&v15->__assets, a4);
    objc_msgSend(MEMORY[0x1E0CD1390], "pl_managedAssetsForAssets:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
    plAssets = v15->__plAssets;
    v15->__plAssets = (NSArray *)v16;

  }
  return v15;
}

- (void)performWithWillDeleteHandler:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id willDeleteHandler;
  void *v13;
  id completionHandler;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD aBlock[5];
  id v20;

  v7 = a3;
  v8 = a4;
  if (self->_completionHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDeletePhotosActionController.m"), 68, CFSTR("Completion handler for %@ should be nil here"), self);

  }
  if (self->_willDeleteHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDeletePhotosActionController.m"), 69, CFSTR("Delete completion handler for %@ should be nil here"), self);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PXPhotoKitDeletePhotosActionController_performWithWillDeleteHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5140638;
  v9 = v8;
  aBlock[4] = self;
  v20 = v9;
  v10 = _Block_copy(aBlock);
  v11 = (void *)objc_msgSend(v7, "copy");
  willDeleteHandler = self->_willDeleteHandler;
  self->_willDeleteHandler = v11;

  v13 = (void *)objc_msgSend(v10, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v13;

  -[PXPhotoKitDeletePhotosActionController beginObservingAppBackgroundingEvents](self, "beginObservingAppBackgroundingEvents");
  if (-[PXPhotoKitDeletePhotosActionController shouldSkipDeleteConfirmation](self, "shouldSkipDeleteConfirmation"))
  {
    -[PXPhotoKitDeletePhotosActionController _handleMainAlertConfirmed:](self, "_handleMainAlertConfirmed:", 1);
  }
  else
  {
    -[PXPhotoKitDeletePhotosActionController _ensureMainAlertController](self, "_ensureMainAlertController");
    -[PXPhotoKitDeletePhotosActionController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitDeletePhotosActionController _mainAlertController](self, "_mainAlertController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deletePhotosActionController:presentConfirmationViewController:", self, v16);

  }
}

- (void)ppt_performDeleteWithoutUserConfirmationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = &__block_literal_global_123429;
  v6 = v5;
  -[PXPhotoKitDeletePhotosActionController _runDestructiveActionWithCompletion:](self, "_runDestructiveActionWithCompletion:");

}

- (void)_handleFinalUserDecisionShouldDelete:(BOOL)a3
{
  id v5;
  void *v6;
  void *v7;
  void (**willDeleteHandler)(void);
  _QWORD v9[5];
  id location;

  v5 = objc_initWeak(&location, self);
  -[PXPhotoKitDeletePhotosActionController stopObservingAppBackgroundEvents](self, "stopObservingAppBackgroundEvents");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__PXPhotoKitDeletePhotosActionController__handleFinalUserDecisionShouldDelete___block_invoke;
  v9[3] = &unk_1E5147360;
  v9[4] = self;
  v6 = _Block_copy(v9);
  v7 = v6;
  if (a3)
  {
    willDeleteHandler = (void (**)(void))self->_willDeleteHandler;
    if (willDeleteHandler)
      willDeleteHandler[2]();
    -[PXPhotoKitDeletePhotosActionController _runDestructiveActionWithCompletion:](self, "_runDestructiveActionWithCompletion:", v7);
  }
  else
  {
    (*((void (**)(void *, _QWORD))v6 + 2))(v6, 0);
  }

  objc_destroyWeak(&location);
}

- (void)_runDestructiveActionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PXDeleteAssetsAction *v6;
  void *v7;
  id *v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  void *v23;
  id v24;
  _QWORD v25[4];
  void *v26;
  id v27;

  v4 = a3;
  -[PXPhotoKitDeletePhotosActionController _assets](self, "_assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(self->_action)
  {
    case 0:
    case 1:
      v6 = -[PXAssetsAction initWithAssets:]([PXDeleteAssetsAction alloc], "initWithAssets:", v5);
      -[PXPhotoKitDeletePhotosActionController undoManager](self, "undoManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_2;
      v25[3] = &unk_1E512D8A0;
      v8 = &v26;
      v26 = &__block_literal_global_135_123422;
      v27 = v4;
      -[PXAction executeWithUndoManager:completionHandler:](v6, "executeWithUndoManager:completionHandler:", v7, v25);

      v9 = v27;
      goto LABEL_7;
    case 2:
      v6 = -[PXAssetsAction initWithAssets:]([PXRecoverAssetsAction alloc], "initWithAssets:", v5);
      -[PXPhotoKitDeletePhotosActionController undoManager](self, "undoManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_5;
      v15 = &unk_1E51417E8;
      v8 = &v16;
      v16 = v4;
      v10 = &v12;
      goto LABEL_6;
    case 3:
    case 4:
      v6 = -[PXAssetsAction initWithAssets:]([PXRestoreAssetsAction alloc], "initWithAssets:", v5);
      -[PXPhotoKitDeletePhotosActionController undoManager](self, "undoManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_4;
      v20 = &unk_1E51417E8;
      v8 = &v21;
      v21 = v4;
      v10 = &v17;
LABEL_6:
      -[PXAction executeWithUndoManager:completionHandler:](v6, "executeWithUndoManager:completionHandler:", v9, v10, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
      goto LABEL_7;
    case 5:
    case 6:
      v6 = -[PXAssetsAction initWithAssets:]([PXExpungeAssetsAction alloc], "initWithAssets:", v5);
      -[PXPhotoKitDeletePhotosActionController undoManager](self, "undoManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_3;
      v22[3] = &unk_1E512D8A0;
      v8 = &v23;
      v23 = &__block_literal_global_135_123422;
      v24 = v4;
      -[PXAction executeWithUndoManager:completionHandler:](v6, "executeWithUndoManager:completionHandler:", v11, v22);

      v9 = v24;
LABEL_7:

      break;
    default:
      break;
  }

}

- (void)_ensureMainAlertController
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  id v24;
  id v25;
  id v26;
  unsigned __int8 v27;

  -[PXPhotoKitDeletePhotosActionController _mainAlertController](self, "_mainAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v27 = 0;
    v25 = 0;
    v26 = 0;
    v24 = 0;
    -[PXPhotoKitDeletePhotosActionController getConfirmationMessage:destructiveButtonTitle:cancelButtonTitle:isDestructiveBehavior:](self, "getConfirmationMessage:destructiveButtonTitle:cancelButtonTitle:isDestructiveBehavior:", &v26, &v25, &v24, &v27);
    v4 = v26;
    v18 = v25;
    v5 = v24;
    objc_initWeak(&location, self);
    -[PXPhotoKitDeletePhotosActionController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0
      && (-[PXPhotoKitDeletePhotosActionController delegate](self, "delegate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "preferredAlertControllerStyleForDeletePhotosActionController:", self),
          v8,
          v9))
    {
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", &stru_1E5149688, v4, v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, 0, 0, v18);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;
    v12 = 2 * v27;
    v13 = (void *)MEMORY[0x1E0DC3448];
    v14 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__PXPhotoKitDeletePhotosActionController__ensureMainAlertController__block_invoke;
    v21[3] = &unk_1E5140760;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v13, "actionWithTitle:style:handler:", v18, v12, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v15);

    v16 = (void *)MEMORY[0x1E0DC3448];
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __68__PXPhotoKitDeletePhotosActionController__ensureMainAlertController__block_invoke_2;
    v19[3] = &unk_1E5140760;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v16, "actionWithTitle:style:handler:", v5, 1, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v17);

    -[PXPhotoKitDeletePhotosActionController _setMainAlertController:](self, "_setMainAlertController:", v11);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&location);
  }
}

- (void)_ensureOneTimeConfirmationAlertController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[PXPhotoKitDeletePhotosActionController _oneTimeConfirmationAlertController](self, "_oneTimeConfirmationAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    PLLocalizedFrameworkString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLLocalizedFrameworkString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPx_shouldForceAlertStyle:", 1);
    v7 = (void *)MEMORY[0x1E0DC3448];
    PLLocalizedFrameworkString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __83__PXPhotoKitDeletePhotosActionController__ensureOneTimeConfirmationAlertController__block_invoke;
    v13 = &unk_1E5140760;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, &v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v9, v10, v11, v12, v13);

    -[PXPhotoKitDeletePhotosActionController _setOneTimeConfirmationAlertController:](self, "_setOneTimeConfirmationAlertController:", v6);
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
}

- (void)_showOnetimeConfirmation
{
  void *v3;
  id v4;

  -[PXPhotoKitDeletePhotosActionController _ensureOneTimeConfirmationAlertController](self, "_ensureOneTimeConfirmationAlertController");
  -[PXPhotoKitDeletePhotosActionController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitDeletePhotosActionController _oneTimeConfirmationAlertController](self, "_oneTimeConfirmationAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deletePhotosActionController:presentConfirmationViewController:", self, v3);

}

- (void)_handleMainAlertConfirmed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  __CFString *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[PXPhotoKitDeletePhotosActionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PXPhotoKitDeletePhotosActionController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitDeletePhotosActionController _mainAlertController](self, "_mainAlertController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deletePhotosActionController:dismissConfirmationViewController:", self, v8);

  }
  -[PXPhotoKitDeletePhotosActionController _setMainAlertController:](self, "_setMainAlertController:", 0);
  if (v3
    && self->_action <= 1uLL
    && (-[PXPhotoKitDeletePhotosActionController _plAssets](self, "_plAssets"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_159_123403),
        v9,
        v10 != 0x7FFFFFFFFFFFFFFFLL)
    && PLCPLShouldNotifyDeleteBehaviorForCurrentAccount())
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "[PXPhotoKitDeletePhotosActionController] Will show Onetime Confirmation Sheet.", (uint8_t *)&v15, 2u);
    }

    -[PXPhotoKitDeletePhotosActionController _showOnetimeConfirmation](self, "_showOnetimeConfirmation");
  }
  else
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("NO");
      if (v3)
        v13 = CFSTR("YES");
      v14 = v13;
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "[PXPhotoKitDeletePhotosActionController] Handling Final User Decision Should Delete: %@.", (uint8_t *)&v15, 0xCu);

    }
    -[PXPhotoKitDeletePhotosActionController _handleFinalUserDecisionShouldDelete:](self, "_handleFinalUserDecisionShouldDelete:", v3);
  }
}

- (void)_handleOneTimeAlertConfirmed
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[PXPhotoKitDeletePhotosActionController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PXPhotoKitDeletePhotosActionController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitDeletePhotosActionController _oneTimeConfirmationAlertController](self, "_oneTimeConfirmationAlertController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deletePhotosActionController:dismissConfirmationViewController:", self, v6);

  }
  -[PXPhotoKitDeletePhotosActionController _setOneTimeConfirmationAlertController:](self, "_setOneTimeConfirmationAlertController:", 0);
  PLCPLRecordDidNotifyDeleteBehaviorForCurrentAccount();
  -[PXPhotoKitDeletePhotosActionController _handleFinalUserDecisionShouldDelete:](self, "_handleFinalUserDecisionShouldDelete:", 1);
}

- (void)getConfirmationMessage:(id *)a3 destructiveButtonTitle:(id *)a4 cancelButtonTitle:(id *)a5 isDestructiveBehavior:(BOOL *)a6
{
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  id v19;
  BOOL v20;
  int v21;
  const __CFString *v22;
  id v23;
  id v24;
  id *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  BOOL v56;
  void *v57;
  id *v58;
  BOOL *v59;
  id *v60;
  id *v61;
  id v62;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  -[PXPhotoKitDeletePhotosActionController _plAssets](self, "_plAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v72 = v11;
  PLSuffixForItems();
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0D71BE0]);
  objc_msgSend(v12, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v13, "initWithPhotoLibrary:", v14);

  switch(self->_action)
  {
    case 0:
    case 1:
      v60 = a4;
      -[PXPhotoKitDeletePhotosActionController _assets](self, "_assets");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = PXContentSyndicationAssetCount(v15);
      if (v16 == objc_msgSend(v15, "count"))
      {
        v70 = 0;
        v71 = 0;
        v17 = PXContentSyndicationRemoveConfirmationTitleAndMessageLocalizedStrings(v15, &v71, &v70);
        v18 = v71;
        v19 = v70;
        if (v17)
        {
LABEL_9:
          v62 = v19;

          a4 = v60;
          if (!v18)
            goto LABEL_18;
          goto LABEL_10;
        }
      }
      else
      {
        v19 = 0;
        v18 = 0;
      }
      v68 = v18;
      v69 = v19;
      objc_msgSend(v65, "getDeletionWarningTitle:message:buttonTitle:forAssets:syndicationAssetCount:clientName:style:", 0, &v69, &v68, v10, v16, 0, 0);
      v23 = v69;

      v24 = v68;
      v18 = v24;
      v19 = v23;
      goto LABEL_9;
    case 2:
      v62 = 0;
      v20 = 0;
      v21 = 0;
      v22 = CFSTR("RECOVER_BUTTON_TITLE_");
      goto LABEL_19;
    case 3:
    case 4:
      v62 = 0;
      v20 = 0;
      v21 = 1;
      v22 = CFSTR("UNDELETE_BUTTON_TITLE_");
      goto LABEL_19;
    case 5:
      if (v11 == 1)
        v27 = &stru_1E5149688;
      else
        v27 = CFSTR("S");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EXPUNGE_%@%@_WARNING"), v64, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      PLLocalizedFrameworkString();
      v62 = (id)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v20 = 1;
      v22 = CFSTR("EXPUNGE_BUTTON_TITLE_");
      goto LABEL_19;
    case 6:
      v66 = 0;
      v67 = 0;
      objc_msgSend(v65, "getExpungeWarningMessage:buttonTitle:forAssets:", &v67, &v66, v10);
      v62 = v67;
      v18 = v66;
      if (v18)
      {
LABEL_10:
        v20 = 1;
        v26 = v62;
        v25 = a3;
        if (!a3)
          goto LABEL_48;
        goto LABEL_47;
      }
LABEL_18:
      v22 = 0;
      v21 = 0;
      v20 = 1;
      v11 = v72;
LABEL_19:
      objc_msgSend(v65, "getAvalancheDeleteWarning:actualDeletionCount:forAssets:", 0, &v72, v10);
      v29 = v72;
      if (v21 && !v72)
      {
        v55 = v22;
        v56 = v20;
        v59 = a6;
        v61 = a4;
        v57 = v12;
        v58 = a5;
        -[PXPhotoKitDeletePhotosActionController _assets](self, "_assets");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotoKitDeletePhotosActionController _plAssets](self, "_plAssets");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v30;
        v33 = v31;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v35 = v32;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, buf, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v78;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v78 != v38)
                objc_enumerationMutation(v35);
              objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "uuid");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (v40)
                objc_msgSend(v34, "addObject:", v40);

            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, buf, 16);
          }
          while (v37);
        }

        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v41 = v33;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v74;
          do
          {
            for (j = 0; j != v43; ++j)
            {
              if (*(_QWORD *)v74 != v44)
                objc_enumerationMutation(v41);
              objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * j), "pl_uuid");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (v46 && objc_msgSend(v34, "containsObject:", v46))
                objc_msgSend(v34, "removeObject:", v46);

            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
          }
          while (v43);
        }

        objc_msgSend(v34, "allObjects");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        PLUIGetLog();
        v48 = objc_claimAutoreleasedReturnValue();
        v12 = v57;
        v20 = v56;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          -[PXPhotoKitDeletePhotosActionController _assets](self, "_assets");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "count");
          -[PXPhotoKitDeletePhotosActionController _plAssets](self, "_plAssets");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "count");
          *(_DWORD *)buf = 134218754;
          v83 = v11;
          v84 = 2048;
          v85 = v50;
          v86 = 2048;
          v87 = v52;
          v88 = 2112;
          v89 = v47;
          _os_log_impl(&dword_1A6789000, v48, OS_LOG_TYPE_ERROR, "Invalid recover assets state. previousDeletionCount: %ld, assetsCount: %lu, plAssetsCount: %lu, missingUUIDs: %@", buf, 0x2Au);

        }
        v29 = v72;
        a5 = v58;
        a6 = v59;
        a4 = v61;
        v22 = v55;
      }
      if (v29 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v22, v64);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        PLLocalizedFrameworkString();
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@S"), v22, v64);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        PLLocalizedFrameworkString();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringWithValidatedFormat(v54, CFSTR("%lu"));
        v18 = (id)objc_claimAutoreleasedReturnValue();

      }
      v26 = v62;
      v25 = a3;

      if (a3)
LABEL_47:
        *v25 = objc_retainAutorelease(v26);
LABEL_48:
      if (a4)
        *a4 = objc_retainAutorelease(v18);
      if (a5)
      {
        PLLocalizedFrameworkString();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a6)
        *a6 = v20;

      return;
    default:
      v62 = 0;
      v22 = 0;
      v21 = 0;
      v20 = 1;
      goto LABEL_19;
  }
}

- (void)beginObservingAppBackgroundingEvents
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_appWasBackgrounded_, *MEMORY[0x1E0DC4768], 0);

}

- (void)stopObservingAppBackgroundEvents
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);

}

- (void)appWasBackgrounded:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;

  -[PXPhotoKitDeletePhotosActionController _oneTimeConfirmationAlertController](self, "_oneTimeConfirmationAlertController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXPhotoKitDeletePhotosActionController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[PXPhotoKitDeletePhotosActionController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitDeletePhotosActionController _oneTimeConfirmationAlertController](self, "_oneTimeConfirmationAlertController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deletePhotosActionController:dismissConfirmationViewController:", self, v8);

    }
    -[PXPhotoKitDeletePhotosActionController _setOneTimeConfirmationAlertController:](self, "_setOneTimeConfirmationAlertController:", 0);
  }
  -[PXPhotoKitDeletePhotosActionController _mainAlertController](self, "_mainAlertController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PXPhotoKitDeletePhotosActionController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[PXPhotoKitDeletePhotosActionController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitDeletePhotosActionController _mainAlertController](self, "_mainAlertController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deletePhotosActionController:dismissConfirmationViewController:", self, v13);

    }
    -[PXPhotoKitDeletePhotosActionController _setMainAlertController:](self, "_setMainAlertController:", 0);
    -[PXPhotoKitDeletePhotosActionController _setMainAlertController:](self, "_setMainAlertController:", 0);
  }
  -[PXPhotoKitDeletePhotosActionController _handleFinalUserDecisionShouldDelete:](self, "_handleFinalUserDecisionShouldDelete:", 0);
}

- (int64_t)action
{
  return self->_action;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (PXPhotoKitDeletePhotosActionControllerDelegate)delegate
{
  return (PXPhotoKitDeletePhotosActionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)shouldSkipDeleteConfirmation
{
  return self->_shouldSkipDeleteConfirmation;
}

- (void)setShouldSkipDeleteConfirmation:(BOOL)a3
{
  self->_shouldSkipDeleteConfirmation = a3;
}

- (NSArray)_assets
{
  return self->__assets;
}

- (NSArray)_plAssets
{
  return self->__plAssets;
}

- (UIAlertController)_mainAlertController
{
  return self->__mainAlertController;
}

- (void)_setMainAlertController:(id)a3
{
  objc_storeStrong((id *)&self->__mainAlertController, a3);
}

- (UIAlertController)_oneTimeConfirmationAlertController
{
  return self->__oneTimeConfirmationAlertController;
}

- (void)_setOneTimeConfirmationAlertController:(id)a3
{
  objc_storeStrong((id *)&self->__oneTimeConfirmationAlertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__oneTimeConfirmationAlertController, 0);
  objc_storeStrong((id *)&self->__mainAlertController, 0);
  objc_storeStrong((id *)&self->__plAssets, 0);
  objc_storeStrong((id *)&self->__assets, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong(&self->_willDeleteHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __68__PXPhotoKitDeletePhotosActionController__handleMainAlertConfirmed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canMoveToTrash");
}

void __83__PXPhotoKitDeletePhotosActionController__ensureOneTimeConfirmationAlertController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleOneTimeAlertConfirmed");

}

void __68__PXPhotoKitDeletePhotosActionController__ensureMainAlertController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleMainAlertConfirmed:", 1);

}

void __68__PXPhotoKitDeletePhotosActionController__ensureMainAlertController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleMainAlertConfirmed:", 0);

}

uint64_t __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v2 = *MEMORY[0x1E0DC4738];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeDefaultImage:forScreen:", v2, v3);

  }
}

void __79__PXPhotoKitDeletePhotosActionController__handleFinalUserDecisionShouldDelete___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void (***)(_QWORD, _QWORD))(v6 + 8);
  if (v7)
  {
    v7[2](v7, a2);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void (***)(_QWORD, _QWORD))(v6 + 8);
  }
  *(_QWORD *)(v6 + 8) = 0;

}

id __89__PXPhotoKitDeletePhotosActionController_performWithWillDeleteHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (id)objc_msgSend(*(id *)(a1 + 32), "description");
}

+ (void)assetTypeCountsForAssets:(id)a3 photosCount:(int64_t *)a4 videosCount:(int64_t *)a5 othersCount:(int64_t *)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v16, "isPhoto"))
        {
          ++v13;
        }
        else if (objc_msgSend(v16, "isVideo"))
        {
          ++v11;
        }
        else
        {
          ++v12;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
    if (a4)
      goto LABEL_14;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    if (a4)
LABEL_14:
      *a4 = v13;
  }
  if (a5)
    *a5 = v11;
  if (a6)
    *a6 = v12;

}

+ (id)warningStringForAssets:(id)a3 isDeleting:(BOOL)a4
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  if (a4)
  {
    v4 = (void *)MEMORY[0x1E0CB37A0];
    v5 = a3;
    objc_msgSend(v4, "stringWithString:", CFSTR("PXPhotoKitUnifiedDestructiveActionPerformer"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[PXPhotoKitDeletePhotosActionController _suffix:](PXPhotoKitDeletePhotosActionController, "_suffix:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v7);
    PXLocalizedStringFromTable(v6, CFSTR("PhotosUICore"));
  }
  else
  {
    v6 = a3;
    PLLocalizedStringForAction();
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_suffix:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  const __CFString *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v9 = 0;
  v10 = 0;
  v8 = 0;
  +[PXPhotoKitDeletePhotosActionController assetTypeCountsForAssets:photosCount:videosCount:othersCount:](PXPhotoKitDeletePhotosActionController, "assetTypeCountsForAssets:photosCount:videosCount:othersCount:", v3, &v10, &v9, &v8);

  if (v10 == v4)
  {
    v5 = CFSTR("_ONE_PHOTO");
    if (v4 > 1)
      v5 = CFSTR("_N_PHOTOS");
  }
  else
  {
    v5 = CFSTR("_ONE_ITEM");
    if (v4 > 1)
      v5 = CFSTR("_N_ITEMS");
    v6 = CFSTR("_N_VIDEOS");
    if (v4 <= 1)
      v6 = CFSTR("_ONE_VIDEO");
    if (v9 == v4)
      v5 = (__CFString *)v6;
  }
  return v5;
}

@end
