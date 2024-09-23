@implementation PXSharedLibraryReplyAssistantReviewViewController

- (PXSharedLibraryReplyAssistantReviewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryReplyAssistantReviewViewController+iOS.m"), 32, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryReplyAssistantReviewViewController initWithTitle:detailText:icon:contentLayout:]");

  abort();
}

- (PXSharedLibraryReplyAssistantReviewViewController)initWithViewModel:(id)a3 sharedLibraryStatusProvider:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXSharedLibraryReplyAssistantReviewViewController *v11;
  PXSharedLibraryReplyAssistantReviewViewController *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryReplyAssistantReviewViewController+iOS.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryReplyAssistantReviewViewController+iOS.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedLibraryStatusProvider"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryReplyAssistantReviewViewController;
  v11 = -[PXSharedLibraryReplyAssistantReviewViewController initWithTitle:detailText:icon:contentLayout:](&v16, sel_initWithTitle_detailText_icon_contentLayout_, &stru_1E5149688, 0, 0, 2);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_statusProvider, a4);
    objc_storeStrong((id *)&v12->_viewModel, a3);
    -[PXSharedLibraryAssistantViewModel registerChangeObserver:context:](v12->_viewModel, "registerChangeObserver:context:", v12, PXSharedLibraryAssistantViewModelObservationContext_159588);
  }

  return v12;
}

- (void)_updateIcon
{
  void *v3;
  id v4;

  PXSharedLibraryCreatePlatterImage(CFSTR("photo.on.rectangle.angled"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryReplyAssistantReviewViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIcon:accessibilityLabel:", v4, 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  int IsIPad;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  OBBoldTrayButton *v10;
  OBBoldTrayButton *movePhotosButton;
  OBBoldTrayButton *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXSharedLibraryReplyAssistantReviewViewController;
  -[OBBaseWelcomeController viewDidLoad](&v15, sel_viewDidLoad);
  -[PXSharedLibraryReplyAssistantReviewViewController _updateIcon](self, "_updateIcon");
  -[PXSharedLibraryReplyAssistantReviewViewController _updateHeaderText](self, "_updateHeaderText");
  -[PXSharedLibraryReplyAssistantReviewViewController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupDataRetentionInfoParticipant"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  IsIPad = PLPhysicalDeviceIsIPad();
  v7 = CFSTR("https://support.apple.com/ht213248?cid=mc-ols-icloudphotos-article_ht213248-ios_ui-05052022");
  if (IsIPad)
    v7 = CFSTR("https://support.apple.com/ht213248?cid=mc-ols-icloudphotos-article_ht213248-ipados_ui-05052022");
  v8 = v7;
  objc_msgSend(v5, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCaptionText:learnMoreURL:", v4, v9);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v10 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  movePhotosButton = self->_movePhotosButton;
  self->_movePhotosButton = v10;

  v12 = self->_movePhotosButton;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryReplyAssistant_Intro_ReviewButtonTitle_Join"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v12, "setTitle:forState:", v13, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_movePhotosButton, "addTarget:action:forControlEvents:", self, sel_moveButtonTapped_, 0x2000);
  -[PXSharedLibraryReplyAssistantReviewViewController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", self->_movePhotosButton);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryReplyAssistantReviewViewController;
  v4 = a3;
  -[PXSharedLibraryReplyAssistantReviewViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryReplyAssistantReviewViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PXSharedLibraryReplyAssistantReviewViewController _updateIcon](self, "_updateIcon");

}

- (void)_updateHeaderText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  -[PXSharedLibraryReplyAssistantReviewViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0uLL;
  v14 = 0;
  -[PXSharedLibraryReplyAssistantReviewViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "shareCounts");
  }
  else
  {
    v13 = 0uLL;
    v14 = 0;
  }

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryReplyAssistant_Intro_ReviewTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v6);

  -[PXSharedLibraryReplyAssistantReviewViewController viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharedLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryGetCurrentUserParticipant(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = v13;
    v12 = v14;
    PXSharedLibraryReplyAssistantReviewSubtitle((char **)&v11, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDetailText:", v10);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  id v10;

  v10 = a3;
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_159588 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryReplyAssistantReviewViewController+iOS.m"), 112, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((+[PXSharedLibraryAssistantViewModel shareCountChangeDescriptors](PXSharedLibraryAssistantViewModel, "shareCountChangeDescriptors") & a4) != 0)-[PXSharedLibraryReplyAssistantReviewViewController _updateHeaderText](self, "_updateHeaderText");

}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  return (PXAssistantViewControllerDelegate *)objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->assistantViewControllerDelegate, a3);
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (OBBoldTrayButton)movePhotosButton
{
  return self->_movePhotosButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movePhotosButton, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
}

- (void)_setIsProcessing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  -[PXSharedLibraryReplyAssistantReviewViewController movePhotosButton](self, "movePhotosButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v8, "setEnabled:", 0);
    objc_msgSend(v8, "showsBusyIndicator");
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1;
  }
  else
  {
    objc_msgSend(v8, "setEnabled:", 1);
    objc_msgSend(v8, "hidesBusyIndicator");
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
  }
  objc_msgSend(v5, "setHidesBackButton:", v7);

}

- (void)acceptInvitation
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v11[6];

  -[PXSharedLibraryReplyAssistantReviewViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedLibraryRule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "autoSharePolicy");
  +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryReplyAssistantReviewViewController _setIsProcessing:](self, "_setIsProcessing:", 1);
  -[PXSharedLibraryReplyAssistantReviewViewController statusProvider](self, "statusProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "previewIsOutdated");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__PXSharedLibraryReplyAssistantReviewViewController_Internal__acceptInvitation__block_invoke;
  v11[3] = &unk_1E5138B50;
  v11[4] = self;
  v11[5] = a2;
  PXSharedLibraryAcceptInvitation(v9, v5, v6, v7, v10, 0, v8, v11);

}

void __79__PXSharedLibraryReplyAssistantReviewViewController_Internal__acceptInvitation__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_setIsProcessing:", 0);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "assistantViewControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      PXAssertGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 136315138;
        v7 = "-[PXSharedLibraryReplyAssistantReviewViewController(Internal) acceptInvitation]_block_invoke";
        _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v6, 0xCu);
      }

    }
    objc_msgSend(v4, "stepForwardInAssistantForAssistantViewController:", *(_QWORD *)(a1 + 32));

  }
}

@end
