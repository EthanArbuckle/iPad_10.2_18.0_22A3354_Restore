@implementation PXSharedLibraryAssistantReviewParticipantsViewController

- (PXSharedLibraryAssistantReviewParticipantsViewController)initWithViewModel:(id)a3 participantViewModel:(id)a4 sharedLibraryStatusProvider:(id)a5
{
  id v10;
  id v11;
  id v12;
  PXSharedLibraryAssistantReviewParticipantsViewController *v13;
  PXSharedLibraryAssistantReviewParticipantsViewController *v14;
  PXSharedLibraryParticipantTableViewController *v15;
  void *v16;
  uint64_t v17;
  PXSharedLibraryParticipantTableViewController *tableViewController;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantReviewParticipantsViewController+iOS.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participantViewModel"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantReviewParticipantsViewController+iOS.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantReviewParticipantsViewController+iOS.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedLibraryStatusProvider"));

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)PXSharedLibraryAssistantReviewParticipantsViewController;
  v13 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v23, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, &stru_1E5149688, 0, 0, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_statusProvider, a5);
    objc_storeStrong((id *)&v14->_viewModel, a3);
    -[PXSharedLibraryAssistantViewModel registerChangeObserver:context:](v14->_viewModel, "registerChangeObserver:context:", v14, PXSharedLibraryAssistantViewModelObservationContext_300298);
    objc_storeStrong((id *)&v14->_participantViewModel, a4);
    v15 = [PXSharedLibraryParticipantTableViewController alloc];
    -[PXSharedLibraryAssistantViewModel participantDataSourceManager](v14->_viewModel, "participantDataSourceManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PXSharedLibraryParticipantTableViewController initWithDataSourceManager:](v15, "initWithDataSourceManager:", v16);
    tableViewController = v14->_tableViewController;
    v14->_tableViewController = (PXSharedLibraryParticipantTableViewController *)v17;

  }
  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PXRoundProgressView *v5;
  PXRoundProgressView *v6;
  PXRoundProgressView *progressView;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIActivityIndicatorView *v18;
  UIActivityIndicatorView *spinnerView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  OBBoldTrayButton *shareInMessagesButton;
  id v25;
  void *v26;
  void *v27;
  OBLinkTrayButton *shareButton;
  void *v29;
  objc_super v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)PXSharedLibraryAssistantReviewParticipantsViewController;
  -[OBTableWelcomeController viewDidLoad](&v30, sel_viewDidLoad);
  -[PXSharedLibraryAssistantReviewParticipantsViewController _updateIcon](self, "_updateIcon");
  -[PXSharedLibraryAssistantReviewParticipantsViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantParticipantViewModel title](self->_participantViewModel, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[PXSharedLibraryAssistantReviewParticipantsViewController _updateHeaderDetailText](self, "_updateHeaderDetailText");
  v5 = [PXRoundProgressView alloc];
  v6 = -[PXRoundProgressView initWithFrame:style:](v5, "initWithFrame:style:", 4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  progressView = self->_progressView;
  self->_progressView = v6;

  -[PXRoundProgressView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[PXRoundProgressView sizeForSizeClass:](PXRoundProgressView, "sizeForSizeClass:", 2);
  v9 = v8;
  v11 = v10;
  v12 = (void *)MEMORY[0x1E0CB3718];
  -[PXRoundProgressView widthAnchor](self->_progressView, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v14;
  -[PXRoundProgressView heightAnchor](self->_progressView, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateConstraints:", v17);

  v18 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  spinnerView = self->_spinnerView;
  self->_spinnerView = v18;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinnerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ReviewRecipients_ButtonTitle_sendInMessages"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:forState:", v21, 0);

  objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel_inviteButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantReviewParticipantsViewController buttonTray](self, "buttonTray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addButton:", v20);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_inviteButtonTapped_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantReviewParticipantsViewController addKeyCommand:](self, "addKeyCommand:", v23);

  shareInMessagesButton = self->_shareInMessagesButton;
  self->_shareInMessagesButton = (OBBoldTrayButton *)v20;
  v25 = v20;

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel_shareButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantReviewParticipantsViewController buttonTray](self, "buttonTray");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addButton:", v26);

  shareButton = self->_shareButton;
  self->_shareButton = (OBLinkTrayButton *)v26;

  -[PXSharedLibraryAssistantReviewParticipantsViewController _updateActionButtons](self, "_updateActionButtons");
  -[PXSharedLibraryAssistantReviewParticipantsViewController _updateCaptionText](self, "_updateCaptionText");
  -[PXSharedLibraryAssistantReviewParticipantsViewController headerView](self, "headerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAllowFullWidthIcon:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  PXSharedLibraryParticipantTableViewController *tableViewController;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryAssistantReviewParticipantsViewController;
  -[OBTableWelcomeController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[PXSharedLibraryAssistantViewModel participantDataSource](self->_viewModel, "participantDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfParticipants");

  tableViewController = self->_tableViewController;
  if (v5)
  {
    -[PXSharedLibraryParticipantTableViewController setDelegate:](tableViewController, "setDelegate:", 0);
    v7 = objc_alloc(MEMORY[0x1E0DC3D48]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  else
  {
    -[PXSharedLibraryParticipantTableViewController setDelegate:](tableViewController, "setDelegate:", self);
    -[PXSharedLibraryParticipantTableViewController tableView](self->_tableViewController, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  -[OBTableWelcomeController setTableView:](self, "setTableView:", v9);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryAssistantReviewParticipantsViewController;
  v4 = a3;
  -[PXSharedLibraryAssistantReviewParticipantsViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryAssistantReviewParticipantsViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PXSharedLibraryAssistantReviewParticipantsViewController _updateIcon](self, "_updateIcon");

}

- (BOOL)shouldHideBackButton
{
  void *v3;
  char v4;

  if (self->_shareProgress)
    return 1;
  -[PXSharedLibraryAssistantViewModel sharedLibrary](self->_viewModel, "sharedLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPublished");

  return v4;
}

- (void)inviteButtonTapped:(id)a3
{
  -[PXSharedLibraryAssistantReviewParticipantsViewController _finishAssistantWithInvitationTransport:sourceItem:](self, "_finishAssistantWithInvitationTransport:sourceItem:", 3, a3);
}

- (void)shareButtonTapped:(id)a3
{
  -[PXSharedLibraryAssistantReviewParticipantsViewController _finishAssistantWithInvitationTransport:sourceItem:](self, "_finishAssistantWithInvitationTransport:sourceItem:", self->_shareButtonTransport, a3);
}

- (void)_finishAssistantWithInvitationTransport:(int64_t)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;
  PXSharedLibraryAssistantViewModel *viewModel;
  NSProgress *shareProgress;
  _QWORD v10[5];

  +[PXViewControllerPresenter popoverPresenterWithViewController:sourceItem:](PXViewControllerPresenter, "popoverPresenterWithViewController:sourceItem:", self, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantReviewParticipantsViewController _setIsProcessing:](self, "_setIsProcessing:", 1);
  -[PXSharedLibraryAssistantReviewParticipantsViewController statusProvider](self, "statusProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  viewModel = self->_viewModel;
  shareProgress = self->_shareProgress;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __111__PXSharedLibraryAssistantReviewParticipantsViewController__finishAssistantWithInvitationTransport_sourceItem___block_invoke;
  v10[3] = &unk_1E5148B78;
  v10[4] = self;
  PXSharedLibraryFinishReviewAssistant(v7, viewModel, a3, shareProgress, v6, v10);

}

- (void)_setIsProcessing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSProgress *v7;
  NSProgress *shareProgress;
  NSProgress *v9;
  id v10;

  v3 = a3;
  -[PXSharedLibraryAssistantReviewParticipantsViewController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXSharedLibraryAssistantReviewParticipantsViewController buttonTray](self, "buttonTray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stackView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v7 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    shareProgress = self->_shareProgress;
    self->_shareProgress = v7;

    -[NSProgress addObserver:forKeyPath:options:context:](self->_shareProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 1, PXProgressFractionCompletedObservationContext_300294);
    objc_msgSend(v10, "insertArrangedSubview:atIndex:", self->_progressView, 0);
    objc_msgSend(v10, "setCustomSpacing:afterView:", self->_progressView, 10.0);
    objc_msgSend(v10, "insertArrangedSubview:atIndex:", self->_spinnerView, 1);
    objc_msgSend(v10, "setCustomSpacing:afterView:", self->_spinnerView, 12.0);
    -[PXSharedLibraryAssistantReviewParticipantsViewController _updateProgress](self, "_updateProgress");
  }
  else
  {
    -[PXRoundProgressView removeFromSuperview](self->_progressView, "removeFromSuperview");
    -[UIActivityIndicatorView removeFromSuperview](self->_spinnerView, "removeFromSuperview");
    -[NSProgress removeObserver:forKeyPath:context:](self->_shareProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), PXProgressFractionCompletedObservationContext_300294);
    v9 = self->_shareProgress;
    self->_shareProgress = 0;

  }
  -[PXSharedLibraryAssistantReviewParticipantsViewController _updateNavigationItem](self, "_updateNavigationItem");
  -[PXSharedLibraryAssistantReviewParticipantsViewController _updateTableViewInteractability](self, "_updateTableViewInteractability");
  -[PXSharedLibraryAssistantReviewParticipantsViewController _updateCaptionText](self, "_updateCaptionText");
  -[PXSharedLibraryAssistantReviewParticipantsViewController _updateActionButtons](self, "_updateActionButtons");
  -[OBBoldTrayButton setEnabled:](self->_shareInMessagesButton, "setEnabled:", !v3);

}

- (void)_updateTableViewLayoutConstraints
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *tableViewLayoutConstraints;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_tableViewLayoutConstraints);
  -[PXSharedLibraryParticipantTableViewController tableViewHeight](self->_tableViewController, "tableViewHeight");
  v4 = v3;
  -[PXSharedLibraryParticipantTableViewController tableView](self->_tableViewController, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  tableViewLayoutConstraints = self->_tableViewLayoutConstraints;
  self->_tableViewLayoutConstraints = v8;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_tableViewLayoutConstraints);
}

- (void)_updateNavigationItem
{
  _BOOL8 v3;
  id v4;

  v3 = -[PXSharedLibraryAssistantReviewParticipantsViewController shouldHideBackButton](self, "shouldHideBackButton");
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", v3);

}

- (void)_updateActionButtons
{
  void *v3;
  NSProgress *shareProgress;
  void *v5;
  void *v6;
  OBLinkTrayButton *shareButton;
  __CFString *v8;
  void *v9;
  id v10;

  -[PXSharedLibraryAssistantViewModel participantDataSource](self->_viewModel, "participantDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  shareProgress = self->_shareProgress;
  v10 = v3;
  if (shareProgress)
  {
    -[OBBoldTrayButton setEnabled:](self->_shareInMessagesButton, "setEnabled:", 0);
  }
  else
  {
    objc_msgSend(v3, "emailAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[OBBoldTrayButton setEnabled:](self->_shareInMessagesButton, "setEnabled:", 1);
    }
    else
    {
      objc_msgSend(v10, "phoneNumbers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBoldTrayButton setEnabled:](self->_shareInMessagesButton, "setEnabled:", objc_msgSend(v6, "count") != 0);

    }
  }
  -[OBLinkTrayButton setEnabled:](self->_shareButton, "setEnabled:", shareProgress == 0);
  if (objc_msgSend(v10, "numberOfParticipants") < 1)
  {
    self->_shareButtonTransport = 0;
    shareButton = self->_shareButton;
    v8 = CFSTR("PXSharedLibraryAssistant_ReviewRecipients_ButtonTitle_inviteLater");
  }
  else
  {
    self->_shareButtonTransport = 2;
    shareButton = self->_shareButton;
    v8 = CFSTR("PXSharedLibraryAssistant_ReviewRecipients_ButtonTitle_shareLink");
  }
  PXLocalizedSharedLibraryString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton setTitle:forState:](shareButton, "setTitle:forState:", v9, 0);

}

- (void)_updateIcon
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[PXSharedLibraryAssistantReviewParticipantsViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantsImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    PXSharedLibraryCreatePlatterImage(CFSTR("person.2.fill"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  -[PXSharedLibraryAssistantReviewParticipantsViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIcon:accessibilityLabel:", v8, 0);

}

- (void)_updateHeaderDetailText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9[3];

  -[PXSharedLibraryAssistantReviewParticipantsViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantReviewParticipantsViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedParticipantList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfParticipants");
  if (v3)
    objc_msgSend(v3, "shareCounts");
  else
    memset(v9, 0, sizeof(v9));
  PXSharedLibraryAssistantReviewParticipantsSubtitle(v5, v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetailText:", v8);

}

- (void)_updateTableViewInteractability
{
  void *v3;
  char v4;
  _BOOL8 v5;

  -[PXSharedLibraryAssistantViewModel sharedLibrary](self->_viewModel, "sharedLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPublished");

  v5 = (v4 & 1) == 0 && self->_shareProgress == 0;
  -[PXSharedLibraryParticipantTableViewController setInteractionEnabled:](self->_tableViewController, "setInteractionEnabled:", v5);
}

- (void)_updateCaptionText
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int IsIPad;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;

  if (self->_shareProgress)
  {
    v3 = &stru_1E5149688;
  }
  else
  {
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupDataRetentionInfoOwner"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v3;
  v4 = -[__CFString length](v3, "length");
  -[PXSharedLibraryAssistantReviewParticipantsViewController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    IsIPad = PLPhysicalDeviceIsIPad();
    v9 = CFSTR("https://support.apple.com/ht213248?cid=mc-ols-icloudphotos-article_ht213248-ios_ui-05052022");
    if (IsIPad)
      v9 = CFSTR("https://support.apple.com/ht213248?cid=mc-ols-icloudphotos-article_ht213248-ipados_ui-05052022");
    v10 = v9;
    objc_msgSend(v7, "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCaptionText:learnMoreURL:", v12, v11);

  }
  else
  {
    objc_msgSend(v5, "setCaptionText:", v12);
  }

}

- (void)_updateProgress
{
  double v3;
  double v4;
  NSObject *v5;
  UIActivityIndicatorView *spinnerView;
  double v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NSProgress fractionCompleted](self->_shareProgress, "fractionCompleted");
  v4 = v3;
  PLSharedLibraryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Preview progress fraction completed UI update: %.3f", (uint8_t *)&v8, 0xCu);
  }

  spinnerView = self->_spinnerView;
  if (v4 <= 0.0)
  {
    -[UIActivityIndicatorView startAnimating](spinnerView, "startAnimating");
    -[PXRoundProgressView setHidden:](self->_progressView, "setHidden:", 1);
  }
  else
  {
    -[UIActivityIndicatorView stopAnimating](spinnerView, "stopAnimating");
    -[PXRoundProgressView setHidden:](self->_progressView, "setHidden:", 0);
    *(float *)&v7 = v4;
    -[PXRoundProgressView setProgress:](self->_progressView, "setProgress:", v7);
  }
}

- (void)_cancelShareIfInProgress
{
  NSProgress *shareProgress;
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  -[PXSharedLibraryAssistantReviewParticipantsViewController viewModel](self, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isCancelingAssistant"))
  {
    shareProgress = self->_shareProgress;

    if (shareProgress)
    {
      PLSharedLibraryGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Publish Shared Library", buf, 2u);
      }

      -[NSProgress cancel](self->_shareProgress, "cancel");
    }
  }
  else
  {

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  id v11;

  v9 = a3;
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_300298 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantReviewParticipantsViewController+iOS.m"), 289, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v11 = v9;
  if ((a4 & 0x10) != 0)
    -[PXSharedLibraryAssistantReviewParticipantsViewController _updateIcon](self, "_updateIcon");
  if ((a4 & 0x20) != 0)
    -[PXSharedLibraryAssistantReviewParticipantsViewController _updateActionButtons](self, "_updateActionButtons");
  if (((+[PXSharedLibraryAssistantViewModel shareCountChangeDescriptors](PXSharedLibraryAssistantViewModel, "shareCountChangeDescriptors") | 0x20) & a4) != 0)-[PXSharedLibraryAssistantReviewParticipantsViewController _updateHeaderDetailText](self, "_updateHeaderDetailText");
  if ((a4 & 0x1000) != 0)
    -[PXSharedLibraryAssistantReviewParticipantsViewController _cancelShareIfInProgress](self, "_cancelShareIfInProgress");

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 forSharedLibraryParticipantTableViewController:(id)a5
{
  -[PXSharedLibraryAssistantReviewParticipantsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, a4, 0);
}

- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 forSharedLibraryParticipantTableViewController:(id)a4
{
  -[PXSharedLibraryAssistantReviewParticipantsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *v7;
  uint64_t v8;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((void *)PXProgressFractionCompletedObservationContext_300294 == a6)
  {
    PLSharedLibraryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NSProgress fractionCompleted](self->_shareProgress, "fractionCompleted");
      *(_DWORD *)buf = 134217984;
      v11 = v8;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Preview progress fraction completed observation: %.3f", buf, 0xCu);
    }

    px_dispatch_on_main_queue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXSharedLibraryAssistantReviewParticipantsViewController;
    -[PXSharedLibraryAssistantReviewParticipantsViewController observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_shareProgress, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_shareInMessagesButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_tableViewLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_participantViewModel, 0);
}

uint64_t __107__PXSharedLibraryAssistantReviewParticipantsViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateProgress");
}

void __111__PXSharedLibraryAssistantReviewParticipantsViewController__finishAssistantWithInvitationTransport_sourceItem___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  id v11;

  v11 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_setIsProcessing:", 0);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "assistantViewControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stepForwardInAssistantForAssistantViewController:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "infosWithBothPeopleAndParticipants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibraryLinkContactsToPeopleForInfos(v7);

LABEL_6:
    v8 = v11;
    goto LABEL_7;
  }
  v8 = v11;
  if (v11)
  {
    v9 = v11;
    v10 = objc_msgSend(v9, "px_isDomain:code:", CFSTR("PXSharedLibraryErrorDomain"), -1001);

    v8 = v11;
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "_updateNavigationItem");
      objc_msgSend(*(id *)(a1 + 32), "_updateTableViewInteractability");
      goto LABEL_6;
    }
  }
LABEL_7:

}

@end
