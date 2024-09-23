@implementation PXCMMInvitationViewModelManager

- (PXCMMInvitationViewModelManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationViewModelManager.m"), 49, CFSTR("%s is not available as initializer"), "-[PXCMMInvitationViewModelManager init]");

  abort();
}

- (PXCMMInvitationViewModelManager)initWithInvitation:(id)a3 invitationSpec:(id)a4 bulletPrefix:(int64_t)a5
{
  id v10;
  id v11;
  void *v12;
  PXCMMInvitationViewModelManager *v13;
  PXCMMInvitationViewModelManager *v14;
  PXCMMInvitationViewModel *v15;
  PXCMMInvitationViewModel *viewModel;
  PXCMMInvitationViewModel *v17;
  uint64_t v18;
  PXCMMInvitationViewModelManager *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id location;
  _QWORD v27[4];
  id v28;
  PXCMMInvitationViewModelManager *v29;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationViewModelManager.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitation"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationViewModelManager.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitationSpec"));

LABEL_3:
  v30.receiver = self;
  v30.super_class = (Class)PXCMMInvitationViewModelManager;
  v13 = -[PXCMMInvitationViewModelManager init](&v30, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_invitation, a3);
    objc_storeStrong((id *)&v14->_spec, a4);
    v14->_bulletPrefix = a5;
    v15 = objc_alloc_init(PXCMMInvitationViewModel);
    viewModel = v14->_viewModel;
    v14->_viewModel = v15;

    v17 = v14->_viewModel;
    v18 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __82__PXCMMInvitationViewModelManager_initWithInvitation_invitationSpec_bulletPrefix___block_invoke;
    v27[3] = &unk_1E5118480;
    v28 = v10;
    v19 = v14;
    v29 = v19;
    -[PXCMMInvitationViewModel performChanges:](v17, "performChanges:", v27);
    objc_initWeak(&location, v19);
    objc_msgSend((id)objc_opt_class(), "_serialQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __82__PXCMMInvitationViewModelManager_initWithInvitation_invitationSpec_bulletPrefix___block_invoke_2;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v25, &location);
    dispatch_async(v20, block);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v14;
}

- (BOOL)_showIsNewStatusInAttributedTitle
{
  return self->_bulletPrefix != 0;
}

- (void)_registerMomentShareStatusPresentation
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  objc_msgSend((id)objc_opt_class(), "_serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PXCMMInvitation statusPresentation](self->_invitation, "statusPresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PXCMMInvitationViewModelManager__registerMomentShareStatusPresentation__block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateIsNew:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  +[PXCMMInvitationsIsNewMonitor sharedMonitor](PXCMMInvitationsIsNewMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "invitationIsNew:", self->_invitation);

  objc_msgSend(v6, "setIsNew:", v5);
}

- (void)_updatePosterTitle:(id)a3
{
  PXCMMInvitationViewModel *viewModel;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  viewModel = self->_viewModel;
  v5 = a3;
  -[PXCMMInvitationViewModel posterTitle](viewModel, "posterTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *MEMORY[0x1E0DC1138];
  -[PXCMMInvitationSpec posterTitleFont](self->_spec, "posterTitleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E0DC1140];
  -[PXCMMInvitationSpec posterTitleColor](self->_spec, "posterTitleColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v6, v9);
  objc_msgSend(v5, "setAttributedPosterTitle:", v10);

}

- (void)_updateTitle:(id)a3
{
  PXCMMInvitationSpec *spec;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  PXCMMInvitationSpec *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  PXCMMInvitation *invitation;
  _BOOL4 v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  PXCMMInvitation *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  spec = self->_spec;
  v5 = a3;
  -[PXCMMInvitationSpec titleColor](spec, "titleColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1138];
  v33[0] = *MEMORY[0x1E0DC1138];
  -[PXCMMInvitationSpec titleEmphasizedFont](self->_spec, "titleEmphasizedFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC1140];
  v33[1] = *MEMORY[0x1E0DC1140];
  v34[0] = v8;
  v34[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PXCMMInvitation shareType](self->_invitation, "shareType") == 1)
  {
    -[PXCMMInvitation owner](self->_invitation, "owner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      PLSharingGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        invitation = self->_invitation;
        *(_DWORD *)buf = 138412546;
        v28 = invitation;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Received CMM share: %@ has no sender display name: %@", buf, 0x16u);
      }
      v13 = 0;
LABEL_10:

      goto LABEL_12;
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v12, v10);
    if (-[PXCMMInvitationViewModelManager _showIsNewStatusInAttributedTitle](self, "_showIsNewStatusInAttributedTitle"))
    {
      v24 = v5;
      +[PXCMMInvitationsIsNewMonitor sharedMonitor](PXCMMInvitationsIsNewMonitor, "sharedMonitor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "invitationIsNew:", self->_invitation);

      if (!v15)
      {
        v5 = v24;
        goto LABEL_12;
      }
      v16 = self->_spec;
      v23 = self->_bulletPrefix == 1;
      v31[0] = v7;
      -[PXCMMInvitationSpec titleFont](v16, "titleFont");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v9;
      v32[0] = v17;
      -[PXCMMInvitationSpec titleBulletColor](self->_spec, "titleBulletColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "px_bulletPrefixAttributedStringWithBulletAttributes:isLeftToRight:", v19, v23);
      v20 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v20;
      v5 = v24;
      goto LABEL_10;
    }
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXCMMSharedByYou"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v7;
    -[PXCMMInvitationSpec titleFont](self->_spec, "titleFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v9;
    v26[0] = v21;
    v26[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3498], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:", v11, v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  objc_msgSend(v5, "setAttributedTitle:", v13);
}

- (void)_updateStatusString:(id)a3
{
  PXMomentShareStatusPresentation *momentShareStatusPresentation;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PXCMMInvitation *invitation;
  PXMomentShareStatusPresentation *v12;
  int v13;
  PXCMMInvitation *v14;
  __int16 v15;
  PXMomentShareStatusPresentation *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  momentShareStatusPresentation = self->_momentShareStatusPresentation;
  if (momentShareStatusPresentation)
  {
    v5 = a3;
    -[PXMomentShareStatusPresentation activityTitle](momentShareStatusPresentation, "activityTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (-[PXMomentShareStatusPresentation idleTitle](self->_momentShareStatusPresentation, "idleTitle"),
          (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17[0] = *MEMORY[0x1E0DC1138];
      -[PXCMMInvitationSpec subtitle1Font](self->_spec, "subtitle1Font");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v7;
      v17[1] = *MEMORY[0x1E0DC1140];
      -[PXCMMInvitationSpec subtitle1Color](self->_spec, "subtitle1Color");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v6, v9);
    }
    else
    {
      PLSharingGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        invitation = self->_invitation;
        v12 = self->_momentShareStatusPresentation;
        v13 = 138412546;
        v14 = invitation;
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Received CMM share: %@ has no status: %@", (uint8_t *)&v13, 0x16u);
      }
      v6 = 0;
      v10 = 0;
    }

    objc_msgSend(v5, "setAttributedSubtitle1:", v10);
  }
}

- (void)_updateExpirationTitle:(id)a3
{
  PXMomentShareStatusPresentation *momentShareStatusPresentation;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PXCMMInvitation *invitation;
  void *v12;
  int v13;
  PXCMMInvitation *v14;
  __int16 v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  momentShareStatusPresentation = self->_momentShareStatusPresentation;
  if (momentShareStatusPresentation)
  {
    v5 = a3;
    -[PXMomentShareStatusPresentation expirationTitle](momentShareStatusPresentation, "expirationTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v17[0] = *MEMORY[0x1E0DC1138];
      -[PXCMMInvitationSpec subtitle2Font](self->_spec, "subtitle2Font");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v7;
      v17[1] = *MEMORY[0x1E0DC1140];
      -[PXCMMInvitationSpec subtitle2Color](self->_spec, "subtitle2Color");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v6, v9);
    }
    else
    {
      PLSharingGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        invitation = self->_invitation;
        -[PXCMMInvitation expiryDate](invitation, "expiryDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = invitation;
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Received CMM share: %@ has no expiration date: %@", (uint8_t *)&v13, 0x16u);

      }
      v10 = 0;
    }

    objc_msgSend(v5, "setAttributedSubtitle2:", v10);
  }
}

- (void)setMomentShareStatusPresentation:(id)a3
{
  PXMomentShareStatusPresentation *v5;
  PXMomentShareStatusPresentation *momentShareStatusPresentation;
  PXCMMInvitationViewModel *viewModel;
  _QWORD v8[5];

  v5 = (PXMomentShareStatusPresentation *)a3;
  momentShareStatusPresentation = self->_momentShareStatusPresentation;
  if (momentShareStatusPresentation != v5)
  {
    -[PXMomentShareStatusPresentation unregisterChangeObserver:context:](momentShareStatusPresentation, "unregisterChangeObserver:context:", self, PXMomentShareStatusPresentationObservationContext_13857);
    objc_storeStrong((id *)&self->_momentShareStatusPresentation, a3);
    -[PXMomentShareStatusPresentation registerChangeObserver:context:](self->_momentShareStatusPresentation, "registerChangeObserver:context:", self, PXMomentShareStatusPresentationObservationContext_13857);
    viewModel = self->_viewModel;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__PXCMMInvitationViewModelManager_setMomentShareStatusPresentation___block_invoke;
    v8[3] = &unk_1E51274B8;
    v8[4] = self;
    -[PXCMMInvitationViewModel performChanges:](viewModel, "performChanges:", v8);
  }

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  PXCMMInvitationViewModel *viewModel;
  _QWORD v4[5];

  viewModel = self->_viewModel;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__PXCMMInvitationViewModelManager__contentSizeCategoryDidChange___block_invoke;
  v4[3] = &unk_1E51274B8;
  v4[4] = self;
  -[PXCMMInvitationViewModel performChanges:](viewModel, "performChanges:", v4);
}

- (void)_invitationsIsNewMonitorDidChange:(id)a3
{
  PXCMMInvitationViewModel *viewModel;
  _QWORD v4[5];

  viewModel = self->_viewModel;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__PXCMMInvitationViewModelManager__invitationsIsNewMonitorDidChange___block_invoke;
  v4[3] = &unk_1E51274B8;
  v4[4] = self;
  -[PXCMMInvitationViewModel performChanges:](viewModel, "performChanges:", v4);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  PXCMMInvitationViewModel *viewModel;
  void *v12;
  _QWORD v13[5];
  BOOL v14;
  BOOL v15;

  v6 = a4;
  v9 = a3;
  if ((void *)PXMomentShareStatusPresentationObservationContext_13857 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationViewModelManager.m"), 256, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 0x1C) != 0)
  {
    viewModel = self->_viewModel;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__PXCMMInvitationViewModelManager_observable_didChange_context___block_invoke;
    v13[3] = &unk_1E51184A8;
    v14 = (v6 & 0x18) != 0;
    v13[4] = self;
    v15 = (v6 & 4) != 0;
    -[PXCMMInvitationViewModel performChanges:](viewModel, "performChanges:", v13);
  }

}

- (PXCMMInvitationViewModel)viewModel
{
  return self->_viewModel;
}

- (PXMomentShareStatusPresentation)momentShareStatusPresentation
{
  return self->_momentShareStatusPresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

void __64__PXCMMInvitationViewModelManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateStatusString:", v3);
    v3 = v4;
  }
  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateExpirationTitle:", v4);
    v3 = v4;
  }

}

void __69__PXCMMInvitationViewModelManager__invitationsIsNewMonitorDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updateIsNew:");
  if (objc_msgSend(*(id *)(a1 + 32), "_showIsNewStatusInAttributedTitle"))
    objc_msgSend(*(id *)(a1 + 32), "_updateTitle:", v3);

}

void __65__PXCMMInvitationViewModelManager__contentSizeCategoryDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_updatePosterTitle:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_updateTitle:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_updateStatusString:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_updateExpirationTitle:", v4);

}

void __68__PXCMMInvitationViewModelManager_setMomentShareStatusPresentation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_updateStatusString:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_updateExpirationTitle:", v4);

}

void __73__PXCMMInvitationViewModelManager__registerMomentShareStatusPresentation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setMomentShareStatusPresentation:", v1);

}

void __82__PXCMMInvitationViewModelManager_initWithInvitation_invitationSpec_bulletPrefix___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOwner:", v3);

  objc_msgSend(*(id *)(a1 + 32), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPosterTitle:", v4);

  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPosterSubtitle:", v5);

  objc_msgSend(*(id *)(a1 + 32), "posterAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "posterMediaProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v10, "setPosterAsset:", v6);
  objc_msgSend(v10, "setPosterMediaProvider:", v7);
  objc_msgSend(*(id *)(a1 + 40), "_updatePosterTitle:", v10);
  objc_msgSend(*(id *)(a1 + 40), "_updateIsNew:", v10);
  objc_msgSend(*(id *)(a1 + 40), "_updateTitle:", v10);
  objc_msgSend(*(id *)(a1 + 40), "_updateStatusString:", v10);
  objc_msgSend(*(id *)(a1 + 40), "_updateExpirationTitle:", v10);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 40), sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 40), sel__invitationsIsNewMonitorDidChange_, CFSTR("PXCMMInvitationsIsNewMonitorDidChangeNotification"), 0);

}

void __82__PXCMMInvitationViewModelManager_initWithInvitation_invitationSpec_bulletPrefix___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_registerMomentShareStatusPresentation");

}

+ (id)_serialQueue
{
  if (_serialQueue_predicate != -1)
    dispatch_once(&_serialQueue_predicate, &__block_literal_global_13888);
  return (id)_serialQueue_serialQueue;
}

void __47__PXCMMInvitationViewModelManager__serialQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.PXCMMInvitationViewModelManager", attr);
  v2 = (void *)_serialQueue_serialQueue;
  _serialQueue_serialQueue = (uint64_t)v1;

}

@end
