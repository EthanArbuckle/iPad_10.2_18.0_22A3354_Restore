@implementation PXSharedLibraryAssistantSummaryViewController

- (void)createPreviewAndCompleteAssistant
{
  uint64_t v4;
  void *v5;
  id v6;

  -[PXSharedLibraryAssistantSummaryViewController viewModel](self, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "mode");
  switch(v4)
  {
    case 1:
      -[PXSharedLibraryAssistantSummaryViewController _createPreviewAndCompleteAssistant](self, "_createPreviewAndCompleteAssistant");
      break;
    case 2:
      -[PXSharedLibraryAssistantSummaryViewController _previewInvitationAndCompleteAssistant](self, "_previewInvitationAndCompleteAssistant");
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantSummaryViewController+Internal.m"), 45, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }

}

- (void)skipAndContinue
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryAssistantSummaryViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mode");
  if ((unint64_t)(v5 - 1) >= 2)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantSummaryViewController+Internal.m"), 62, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  else
  {
    -[PXSharedLibraryAssistantSummaryViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      PXAssertGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315138;
        v11 = "-[PXSharedLibraryAssistantSummaryViewController(Internal) skipAndContinue]";
        _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v10, 0xCu);
      }

    }
    objc_msgSend(v6, "stepForwardInAssistantForAssistantViewController:", self);
    objc_msgSend(v4, "infosWithBothPeopleAndParticipants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibraryLinkContactsToPeopleForInfos(v8);

  }
}

- (void)cancelShareIfInProgress
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[16];

  -[PXSharedLibraryAssistantSummaryViewController viewModel](self, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isCancelingAssistant") & 1) != 0)
  {
    -[PXSharedLibraryAssistantSummaryViewController previewProgress](self, "previewProgress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      PLSharedLibraryGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Create Shared Library Preview", buf, 2u);
      }

      -[PXSharedLibraryAssistantSummaryViewController previewProgress](self, "previewProgress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cancel");

    }
  }
  else
  {

  }
}

- (id)_presentationEnvironment
{
  return +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", self);
}

- (void)_setIsProcessing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PXSharedLibraryAssistantSummaryViewController prepareUIForProcessing:](self, "prepareUIForProcessing:");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 1, PXProgressFractionCompletedObservationContext_141370);
    -[PXSharedLibraryAssistantSummaryViewController setPreviewProgress:](self, "setPreviewProgress:", v6);

  }
  else
  {
    -[PXSharedLibraryAssistantSummaryViewController previewProgress](self, "previewProgress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), PXProgressFractionCompletedObservationContext_141370);

    -[PXSharedLibraryAssistantSummaryViewController setPreviewProgress:](self, "setPreviewProgress:", 0);
  }
}

- (void)_createPreviewAndCompleteAssistant
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];

  -[PXSharedLibraryAssistantSummaryViewController _presentationEnvironment](self, "_presentationEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryViewController _setIsProcessing:](self, "_setIsProcessing:", 1);
  -[PXSharedLibraryAssistantSummaryViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryViewController previewProgress](self, "previewProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__PXSharedLibraryAssistantSummaryViewController_Internal___createPreviewAndCompleteAssistant__block_invoke;
  v7[3] = &unk_1E5138B50;
  v7[4] = self;
  v7[5] = a2;
  PXSharedLibraryCreatePreview(v5, v6, v4, v7);

}

- (void)_previewInvitationAndCompleteAssistant
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;

  -[PXSharedLibraryAssistantSummaryViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedLibraryRule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "autoSharePolicy");
  -[PXSharedLibraryAssistantSummaryViewController _presentationEnvironment](self, "_presentationEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryViewController _setIsProcessing:](self, "_setIsProcessing:", 1);
  -[PXSharedLibraryAssistantSummaryViewController statusProvider](self, "statusProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "previewIsOutdated");
  -[PXSharedLibraryAssistantSummaryViewController previewProgress](self, "previewProgress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__PXSharedLibraryAssistantSummaryViewController_Internal___previewInvitationAndCompleteAssistant__block_invoke;
  v13[3] = &unk_1E51376D8;
  v14 = v4;
  v15 = a2;
  v13[4] = self;
  v12 = v4;
  PXSharedLibraryPreviewInvitation(v9, v5, v6, v7, v10, v11, v8, v13);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((void *)PXProgressFractionCompletedObservationContext_141370 == a6)
  {
    PLSharedLibraryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[PXSharedLibraryAssistantSummaryViewController previewProgress](self, "previewProgress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fractionCompleted");
      *(_DWORD *)buf = 134217984;
      v12 = v9;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Preview progress fraction completed observation: %.3f", buf, 0xCu);

    }
    px_dispatch_on_main_queue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXSharedLibraryAssistantSummaryViewController;
    -[PXSharedLibraryAssistantSummaryViewController observeValueForKeyPath:ofObject:change:context:](&v10, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __106__PXSharedLibraryAssistantSummaryViewController_Internal__observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateProgress");
}

void __97__PXSharedLibraryAssistantSummaryViewController_Internal___previewInvitationAndCompleteAssistant__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
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
        v8 = 136315138;
        v9 = "-[PXSharedLibraryAssistantSummaryViewController(Internal) _previewInvitationAndCompleteAssistant]_block_invoke";
        _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v8, 0xCu);
      }

    }
    objc_msgSend(v4, "completeAssistantForAssistantViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "libraryFilterState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibraryNavigateToLibraryViewInSharedLibraryViewMode(1, v6);

    objc_msgSend(*(id *)(a1 + 40), "infosWithBothPeopleAndParticipants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibraryLinkContactsToPeopleForInfos(v7);

  }
}

void __93__PXSharedLibraryAssistantSummaryViewController_Internal___createPreviewAndCompleteAssistant__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
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
        v9 = 136315138;
        v10 = "-[PXSharedLibraryAssistantSummaryViewController(Internal) _createPreviewAndCompleteAssistant]_block_invoke";
        _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v9, 0xCu);
      }

    }
    objc_msgSend(v4, "completeAssistantForAssistantViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "libraryFilterState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibraryNavigateToLibraryViewInSharedLibraryViewMode(1, v6);

    objc_msgSend(*(id *)(a1 + 32), "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "infosWithBothPeopleAndParticipants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibraryLinkContactsToPeopleForInfos(v8);

  }
}

- (PXSharedLibraryAssistantSummaryViewController)initWithViewModel:(id)a3 sharedLibraryStatusProvider:(id)a4 libraryFilterState:(id)a5
{
  id v10;
  id v11;
  id v12;
  PXSharedLibraryAssistantSummaryViewController *v13;
  PXSharedLibraryAssistantSummaryViewController *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantSummaryViewController+iOS.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedLibraryStatusProvider"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantSummaryViewController+iOS.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantSummaryViewController+iOS.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryFilterState"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)PXSharedLibraryAssistantSummaryViewController;
  v13 = -[PXSharedLibraryAssistantSummaryViewController initWithTitle:detailText:icon:contentLayout:](&v19, sel_initWithTitle_detailText_icon_contentLayout_, &stru_1E5149688, 0, 0, 4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_viewModel, a3);
    objc_storeStrong((id *)&v14->_statusProvider, a4);
    objc_storeStrong((id *)&v14->_libraryFilterState, a5);
    -[PXSharedLibraryAssistantViewModel registerChangeObserver:context:](v14->_viewModel, "registerChangeObserver:context:", v14, PXSharedLibraryAssistantViewModelObservationContext_239116);
  }

  return v14;
}

- (void)prepareUIForProcessing:(BOOL)a3
{
  PXRoundProgressView *progressView;
  void *v5;
  void *v6;
  id v7;

  progressView = self->_progressView;
  if (a3)
  {
    -[PXRoundProgressView setHidden:](progressView, "setHidden:", 0);
    -[NSLayoutConstraint setConstant:](self->_progressHeightConstraint, "setConstant:", 25.0);
    -[UILabel setHidden:](self->_progressLabel, "setHidden:", 0);
    -[OBBoldTrayButton setEnabled:](self->_previewButton, "setEnabled:", 0);
    -[OBTrayButton setEnabled:](self->_skipPreviewButton, "setEnabled:", 0);
    -[OBBoldTrayButton setHidden:](self->_previewButton, "setHidden:", 1);
    -[OBTrayButton setHidden:](self->_skipPreviewButton, "setHidden:", 1);
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidesBackButton:", 1);

    -[PXSharedLibraryAssistantSummaryViewController scrollView](self, "scrollView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryAssistantSummaryViewController secondaryContentView](self, "secondaryContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    objc_msgSend(v7, "scrollRectToVisible:animated:", 1);

  }
  else
  {
    -[PXRoundProgressView setHidden:](progressView, "setHidden:", 1);
    -[NSLayoutConstraint setConstant:](self->_progressHeightConstraint, "setConstant:", 0.0);
    -[UILabel setHidden:](self->_progressLabel, "setHidden:", 1);
    -[UILabel setText:](self->_progressLabel, "setText:", 0);
    -[OBBoldTrayButton setEnabled:](self->_previewButton, "setEnabled:", 1);
    -[OBTrayButton setEnabled:](self->_skipPreviewButton, "setEnabled:", 1);
    -[OBBoldTrayButton setHidden:](self->_previewButton, "setHidden:", 0);
    -[OBTrayButton setHidden:](self->_skipPreviewButton, "setHidden:", 0);
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidesBackButton:", 0);
  }

}

- (void)updateProgress
{
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  double v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryAssistantSummaryViewController previewProgress](self, "previewProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fractionCompleted");
  v5 = v4;

  PLSharedLibraryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Preview progress fraction completed UI update: %.3f", (uint8_t *)&v8, 0xCu);
  }

  *(float *)&v7 = v5;
  -[PXRoundProgressView setProgress:](self->_progressView, "setProgress:", v7);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  PXSharedLibraryAssistantSummaryContentView *v10;
  void *v11;
  PXSharedLibraryAssistantSummaryContentView *v12;
  PXRoundProgressView *v13;
  PXRoundProgressView *v14;
  PXRoundProgressView *progressView;
  UILabel *v16;
  UILabel *progressLabel;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *progressHeightConstraint;
  NSLayoutConstraint *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  OBBoldTrayButton *v38;
  OBBoldTrayButton *previewButton;
  OBBoldTrayButton *v40;
  void *v41;
  void *v42;
  void *v43;
  OBTrayButton *v44;
  OBTrayButton *skipPreviewButton;
  OBTrayButton *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  PXSharedLibraryAssistantSummaryContentView *v76;
  objc_super v77;
  _QWORD v78[14];

  v78[12] = *MEMORY[0x1E0C80C00];
  v77.receiver = self;
  v77.super_class = (Class)PXSharedLibraryAssistantSummaryViewController;
  -[OBBaseWelcomeController viewDidLoad](&v77, sel_viewDidLoad);
  -[PXSharedLibraryAssistantSummaryViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_Summary_Title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[PXSharedLibraryAssistantSummaryViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryViewController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mode");
  PXSharedLibraryAssistantSummaryDetail(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v9);

  v10 = [PXSharedLibraryAssistantSummaryContentView alloc];
  -[PXSharedLibraryAssistantSummaryViewController viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXSharedLibraryAssistantSummaryContentView initWithViewModel:](v10, "initWithViewModel:", v11);

  -[PXSharedLibraryAssistantSummaryContentView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = [PXRoundProgressView alloc];
  v14 = -[PXRoundProgressView initWithFrame:style:](v13, "initWithFrame:style:", 4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  progressView = self->_progressView;
  self->_progressView = v14;

  -[PXRoundProgressView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXRoundProgressView setHidden:](self->_progressView, "setHidden:", 1);
  v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  progressLabel = self->_progressLabel;
  self->_progressLabel = v16;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_progressLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setHidden:](self->_progressLabel, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_progressLabel, "setFont:", v18);

  -[UILabel setNumberOfLines:](self->_progressLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_progressLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_progressLabel, "setTextColor:", v19);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_progressLabel, "setAdjustsFontForContentSizeCategory:", 1);
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryCreatingPreviewProgressTitle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_progressLabel, "setText:", v20);

  -[PXSharedLibraryAssistantSummaryViewController secondaryContentView](self, "secondaryContentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_progressView);
  v22 = v21;
  objc_msgSend(v21, "addSubview:", self->_progressLabel);
  -[PXSharedLibraryAssistantSummaryViewController contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v12);
  -[PXRoundProgressView heightAnchor](self->_progressView, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 0.0);
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  progressHeightConstraint = self->_progressHeightConstraint;
  self->_progressHeightConstraint = v25;

  v61 = (void *)MEMORY[0x1E0CB3718];
  -[PXSharedLibraryAssistantSummaryContentView centerYAnchor](v12, "centerYAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v74);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v72;
  v76 = v12;
  -[PXSharedLibraryAssistantSummaryContentView leadingAnchor](v12, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v23;
  objc_msgSend(v23, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v69, 2.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v68;
  objc_msgSend(v23, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView trailingAnchor](v12, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v66, 2.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v65;
  -[PXRoundProgressView topAnchor](self->_progressView, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 40.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v62;
  -[PXRoundProgressView leadingAnchor](self->_progressView, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v78[4] = v58;
  -[PXRoundProgressView trailingAnchor](self->_progressView, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v78[5] = v55;
  -[PXRoundProgressView widthAnchor](self->_progressView, "widthAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToConstant:", 30.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self->_progressHeightConstraint;
  v78[6] = v53;
  v78[7] = v27;
  -[PXRoundProgressView bottomAnchor](self->_progressView, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel topAnchor](self->_progressLabel, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -10.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v78[8] = v50;
  -[UILabel leadingAnchor](self->_progressLabel, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v78[9] = v29;
  -[UILabel trailingAnchor](self->_progressLabel, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v22;
  objc_msgSend(v22, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v78[10] = v32;
  -[UILabel bottomAnchor](self->_progressLabel, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v78[11] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 12);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "activateConstraints:", v36);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setBackgroundColor:", v37);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v38 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  previewButton = self->_previewButton;
  self->_previewButton = v38;

  v40 = self->_previewButton;
  PXSharedLibraryAssistantSummaryStartButtonTitleForMode(-[PXSharedLibraryAssistantViewModel mode](self->_viewModel, "mode"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v40, "setTitle:forState:", v41, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_previewButton, "addTarget:action:forControlEvents:", self, sel_primaryButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantSummaryViewController buttonTray](self, "buttonTray");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addButton:", self->_previewButton);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_primaryButtonTapped_);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryViewController addKeyCommand:](self, "addKeyCommand:", v43);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v44 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
  skipPreviewButton = self->_skipPreviewButton;
  self->_skipPreviewButton = v44;

  v46 = self->_skipPreviewButton;
  PXSharedLibraryAssistantSummaryDeclineButtonTitleForMode(-[PXSharedLibraryAssistantViewModel mode](self->_viewModel, "mode"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setTitle:forState:](v46, "setTitle:forState:", v47, 0);

  -[OBTrayButton addTarget:action:forControlEvents:](self->_skipPreviewButton, "addTarget:action:forControlEvents:", self, sel_secondaryButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantSummaryViewController buttonTray](self, "buttonTray");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addButton:", self->_skipPreviewButton);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_239116 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantSummaryViewController+iOS.m"), 186, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x1000) != 0)
  {
    v11 = v9;
    -[PXSharedLibraryAssistantSummaryViewController cancelShareIfInProgress](self, "cancelShareIfInProgress");
    v9 = v11;
  }

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

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (NSProgress)previewProgress
{
  return self->_previewProgress;
}

- (void)setPreviewProgress:(id)a3
{
  objc_storeStrong((id *)&self->_previewProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewProgress, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_progressHeightConstraint, 0);
  objc_storeStrong((id *)&self->_skipPreviewButton, 0);
  objc_storeStrong((id *)&self->_previewButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
}

@end
