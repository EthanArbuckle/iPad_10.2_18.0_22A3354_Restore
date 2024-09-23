@implementation PXPeopleConfirmationViewController

- (PXPeopleConfirmationViewController)initWithPerson:(id)a3
{
  id v4;
  PXPeopleConfirmationViewController *v5;
  PXPeopleSuggestionManager *v6;
  PXPeopleSuggestionManager *suggestionManager;
  void *v8;
  PXPeopleSuggestionDataSource *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPeopleConfirmationViewController;
  v5 = -[PXPeopleConfirmationViewController init](&v13, sel_init);
  if (v5)
  {
    v6 = -[PXPeopleSuggestionManager initWithPerson:]([PXPeopleSuggestionManager alloc], "initWithPerson:", v4);
    suggestionManager = v5->_suggestionManager;
    v5->_suggestionManager = v6;

    -[PXPeopleSuggestionManager setDelegate:](v5->_suggestionManager, "setDelegate:", v5);
    PXLocalizedStringFromTable(CFSTR("PXPeopleConfirmScreenTitle"), CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXPeopleSuggestionDataSource initWithFlowType:]([PXPeopleSuggestionDataSource alloc], "initWithFlowType:", 0);
    -[PXPeopleSuggestionManager setDataSource:](v5->_suggestionManager, "setDataSource:", v9);
    -[PXPeopleConfirmationViewController navigationItem](v5, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v8);

    +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_showTypeDebugColor = objc_msgSend(v11, "displayReviewMorePhotosSuggestionType");

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PXPeopleSuggestionView *v5;
  PXPeopleSuggestionView *suggestionView;
  UILabel *v7;
  UILabel *descriptionLabel;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PXPeopleConfirmationLoadingView *v14;
  PXPeopleConfirmationLoadingView *v15;
  PXPeopleConfirmationLoadingView *loadingView;
  UILabel *v17;
  UILabel *interimLoadingLabel;
  void *v19;
  UIActivityIndicatorView *v20;
  UIActivityIndicatorView *interimLoadingIndicator;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;
  _QWORD v44[5];

  v44[4] = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)PXPeopleConfirmationViewController;
  -[PXPeopleConfirmationViewController viewDidLoad](&v43, sel_viewDidLoad);
  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preloadSounds");

  -[PXPeopleConfirmationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(PXPeopleSuggestionView);
  suggestionView = self->_suggestionView;
  self->_suggestionView = v5;

  -[PXPeopleSuggestionView setTranslatesAutoresizingMaskIntoConstraints:](self->_suggestionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", self->_suggestionView);
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v7;

  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "person");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "px_longStyleLocalizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v11;
  if (objc_msgSend(v11, "length"))
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, CFSTR("PXPeopleConfirmMessage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v11;
    PXStringWithValidatedFormat();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_descriptionLabel, "setText:", v13, v33);

  }
  else
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, CFSTR("PXPeopleConfirmUnnamedReplacementMessage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_descriptionLabel, "setText:", v12);
  }

  -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 1);
  v14 = [PXPeopleConfirmationLoadingView alloc];
  objc_msgSend(v4, "bounds");
  v41 = v10;
  v15 = -[PXPeopleConfirmationLoadingView initWithFrame:person:](v14, "initWithFrame:person:", v10);
  loadingView = self->_loadingView;
  self->_loadingView = v15;

  -[PXPeopleConfirmationLoadingView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXPeopleConfirmationLoadingView setAlpha:](self->_loadingView, "setAlpha:", 0.0);
  objc_msgSend(v4, "addSubview:", self->_loadingView);
  v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  interimLoadingLabel = self->_interimLoadingLabel;
  self->_interimLoadingLabel = v17;

  PXLocalizedStringFromTable(CFSTR("PXPeopleConfirmationLoadingMessageiOS"), CFSTR("PhotosUICore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_interimLoadingLabel, "setText:", v19);

  -[UILabel setTextAlignment:](self->_interimLoadingLabel, "setTextAlignment:", 1);
  -[UILabel setLineBreakMode:](self->_interimLoadingLabel, "setLineBreakMode:", 4);
  v20 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E0DC3438]);
  interimLoadingIndicator = self->_interimLoadingIndicator;
  self->_interimLoadingIndicator = v20;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v22 = objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_interimLoadingIndicator, "setActivityIndicatorViewStyle:", 100);
  v39 = (void *)v22;
  -[UILabel setTextColor:](self->_interimLoadingLabel, "setTextColor:", v22);
  v34 = (void *)MEMORY[0x1E0CB3718];
  -[PXPeopleConfirmationLoadingView leadingAnchor](self->_loadingView, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v36;
  -[PXPeopleConfirmationLoadingView trailingAnchor](self->_loadingView, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v24;
  -[PXPeopleConfirmationLoadingView topAnchor](self->_loadingView, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v27;
  -[PXPeopleConfirmationLoadingView bottomAnchor](self->_loadingView, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v4;
  objc_msgSend(v4, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v31);

  v32 = -[PXPeopleConfirmationViewController viewState](self, "viewState");
  if (v32)
    -[PXPeopleConfirmationViewController updateViewWithViewState:](self, "updateViewWithViewState:", v32);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleConfirmationViewController;
  -[PXPeopleConfirmationViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)presentSuggestion:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a4;
  v6 = a3;
  -[PXPeopleConfirmationViewController view](self, "view");

  v7 = v6;
  v8 = v7;
  if (v7)
    goto LABEL_3;
  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentSuggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_3:
    objc_initWeak(&location, self);
    -[PXPeopleConfirmationViewController suggestionView](self, "suggestionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__PXPeopleConfirmationViewController_presentSuggestion_animated___block_invoke;
    v14[3] = &unk_1E5147388;
    objc_copyWeak(&v16, &location);
    v12 = v8;
    v15 = v12;
    objc_msgSend(v11, "setSuggestion:animated:withCompletion:", v12, v4, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  else
  {
    -[PXPeopleConfirmationViewController displaySummary](self, "displaySummary");
    if (-[PXPeopleConfirmationViewController showTypeDebugColor](self, "showTypeDebugColor"))
    {
      -[PXPeopleConfirmationViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", 0);

    }
  }

}

- (void)displaySummary
{
  void *v3;
  PXPeopleConfirmationSummaryViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (-[PXPeopleConfirmationViewController suggestionsPresented](self, "suggestionsPresented"))
  {
    -[PXPeopleConfirmationViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleConfirmationViewController summaryViewController](self, "summaryViewController");
    v4 = (PXPeopleConfirmationSummaryViewController *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = -[PXPeopleConfirmationSummaryViewController initWithDelegate:]([PXPeopleConfirmationSummaryViewController alloc], "initWithDelegate:", self);
      -[PXPeopleConfirmationViewController setSummaryViewController:](self, "setSummaryViewController:", v4);
    }
    -[PXPeopleConfirmationSummaryViewController view](v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    objc_msgSend(v5, "setFrame:");
    objc_msgSend(v5, "setAlpha:", 0.0);
    -[PXPeopleConfirmationViewController addChildViewController:](self, "addChildViewController:", v4);
    objc_msgSend(v3, "addSubview:", v5);
    -[PXPeopleConfirmationSummaryViewController didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);
    -[PXPeopleConfirmationViewController countView](self, "countView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:withAnimationStyle:", CFSTR(" "), 1);

    v7 = (void *)MEMORY[0x1E0DC3F10];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__PXPeopleConfirmationViewController_displaySummary__block_invoke;
    v9[3] = &unk_1E5149198;
    v10 = v5;
    v8 = v5;
    objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0, v9, 0, 0.4, 0.0);

  }
  else
  {
    -[PXPeopleConfirmationViewController setViewState:](self, "setViewState:", 5);
  }
}

- (void)dismissSummary
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  -[PXPeopleConfirmationViewController summaryViewController](self, "summaryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PXPeopleConfirmationViewController_dismissSummary__block_invoke;
  v11[3] = &unk_1E5149198;
  v12 = v3;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __52__PXPeopleConfirmationViewController_dismissSummary__block_invoke_2;
  v8[3] = &unk_1E5144558;
  v9 = v2;
  v10 = v12;
  v6 = v12;
  v7 = v2;
  objc_msgSend(v4, "animateWithDuration:delay:options:animations:completion:", 0, v11, v8, 0.4, 0.0);

}

- (void)setViewState:(unint64_t)a3
{
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  int v7;
  dispatch_time_t v8;
  _QWORD block[4];
  void (**v10)(_QWORD);
  _QWORD aBlock[6];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXPeopleConfirmationViewController_setViewState___block_invoke;
  aBlock[3] = &unk_1E5144EB8;
  aBlock[4] = self;
  aBlock[5] = a3;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "forceReviewMorePhotosInterimLoading");

  if (v7)
  {
    self->_viewState = 3;
    -[PXPeopleConfirmationViewController updateViewWithViewState:](self, "updateViewWithViewState:", 3);
    v8 = dispatch_time(0, 2000000000);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __51__PXPeopleConfirmationViewController_setViewState___block_invoke_2;
    block[3] = &unk_1E5148A40;
    v10 = v5;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v5[2](v5);
  }

}

- (void)updateViewWithViewState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void (**v7)(void);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[4];
  id v14;

  -[PXPeopleConfirmationViewController loadingView](self, "loadingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke;
    aBlock[3] = &unk_1E5149198;
    v14 = v5;
    v7 = (void (**)(void))_Block_copy(aBlock);
    v7[2]();

    v8 = v14;
  }
  else
  {
    -[PXPeopleConfirmationViewController interimLoadingIndicator](self, "interimLoadingIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopAnimating");

    if (a3 != 5)
    {
      objc_msgSend(v6, "setAlpha:", 0.0);
      objc_msgSend(v6, "setLoadingState:", 0);
      goto LABEL_7;
    }
    objc_msgSend(v6, "setLoadingState:", 2);
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke_3;
    v11[3] = &unk_1E5149198;
    v12 = v6;
    objc_msgSend(v10, "animateWithDuration:animations:", v11, 0.33);
    v8 = v12;
  }

LABEL_7:
}

- (BOOL)isSummaryViewShowing
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PXPeopleConfirmationViewController summaryViewController](self, "summaryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)suggestionDidDisplay
{
  void *v3;

  -[PXPeopleConfirmationViewController setSuggestionsPresented:](self, "setSuggestionsPresented:", 1);
  -[PXPeopleConfirmationViewController loadingDelayTimer](self, "loadingDelayTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PXPeopleConfirmationViewController setLoadingDelayTimer:](self, "setLoadingDelayTimer:", 0);
  -[PXPeopleConfirmationViewController setViewState:](self, "setViewState:", 1);
}

- (void)_handleSuggestionCompletionWithSuggestion:(id)a3 success:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  PXPeopleConfirmationViewController *v11;
  _QWORD v12[2];

  v4 = a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v4)
  {
    -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markSuggestionsAsSkipped:", v8);

    objc_msgSend(v7, "requestNextSuggestion");
    goto LABEL_5;
  }
  -[PXPeopleConfirmationViewController suggestionDidDisplay](self, "suggestionDidDisplay");
  if (-[PXPeopleConfirmationViewController showTypeDebugColor](self, "showTypeDebugColor"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__PXPeopleConfirmationViewController__handleSuggestionCompletionWithSuggestion_success___block_invoke;
    v9[3] = &unk_1E5148D08;
    v10 = v6;
    v11 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v9);
    v7 = v10;
LABEL_5:

  }
}

- (void)confirmTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[PXPeopleConfirmationViewController confirmTapped:]";
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v12, 0xCu);
  }

  -[PXPeopleConfirmationViewController undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerUndoWithTarget:selector:object:", self, sel_undoConfirm_, v4);

  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, CFSTR("PXPeopleUndoRedoConfirmTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActionName:", v9);

  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentSuggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "markSuggestions:confirmed:wantsSound:", v11, 1, 1);

  objc_msgSend(v10, "requestNextSuggestion");
}

- (void)denyTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[PXPeopleConfirmationViewController denyTapped:]";
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v12, 0xCu);
  }

  -[PXPeopleConfirmationViewController undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerUndoWithTarget:selector:object:", self, sel_undoDeny_, v4);

  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, CFSTR("PXPeopleUndoRedoDenyTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActionName:", v9);

  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentSuggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "markSuggestions:confirmed:wantsSound:", v11, 0, 1);

  objc_msgSend(v10, "requestNextSuggestion");
}

- (void)undoConfirm:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "-[PXPeopleConfirmationViewController undoConfirm:]";
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v10, 0xCu);
  }

  -[PXPeopleConfirmationViewController undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerUndoWithTarget:selector:object:", self, sel_confirmTapped_, v4);
  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, CFSTR("PXPeopleUndoRedoConfirmTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActionName:", v9);

  -[PXPeopleConfirmationViewController performUndo:](self, "performUndo:", v4);
}

- (void)undoDeny:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "-[PXPeopleConfirmationViewController undoDeny:]";
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v10, 0xCu);
  }

  -[PXPeopleConfirmationViewController undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerUndoWithTarget:selector:object:", self, sel_denyTapped_, v4);
  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, CFSTR("PXPeopleUndoRedoDenyTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActionName:", v9);

  -[PXPeopleConfirmationViewController performUndo:](self, "performUndo:", v4);
}

- (void)performUndo:(id)a3
{
  id v4;

  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canUndo"))
  {
    if (-[PXPeopleConfirmationViewController isSummaryViewShowing](self, "isSummaryViewShowing"))
    {
      -[PXPeopleConfirmationViewController dismissSummary](self, "dismissSummary");
      -[PXPeopleConfirmationViewController setViewState:](self, "setViewState:", 1);
    }
    objc_msgSend(v4, "undo");
  }

}

- (void)doneTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = "-[PXPeopleConfirmationViewController doneTapped:]";
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v7, 0xCu);
  }

  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitUserResponses");

  -[PXPeopleConfirmationViewController undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllActionsWithTarget:", self);

  -[PXPeopleConfirmationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)cancelOperation:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[PXPeopleConfirmationViewController undoManager](self, "undoManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllActionsWithTarget:", self);

  -[PXPeopleConfirmationViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

}

- (void)confirmationCountUpdatedForSuggestionManager:(id)a3 undoing:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v4 = a4;
  v16 = a3;
  v6 = objc_msgSend(v16, "autoConfirmationsCount");
  v7 = objc_msgSend(v16, "userConfirmationsCount") + v6;
  -[PXPeopleConfirmationViewController countView](self, "countView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (v9 = CFSTR(" "), objc_msgSend(v16, "canUndo")) && v7)
  {
    PXLocalizedStringFromTable(CFSTR("PXPeopleConfirmAdditionalCountToBeAdded"), CFSTR("PhotosUICore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    PXStringWithValidatedFormat();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (v4)
    v11 = 2;
  else
    v11 = 1;
  objc_msgSend(v8, "text", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[__CFString isEqualToString:](v9, "isEqualToString:", v12);

  if (v13)
    v14 = 0;
  else
    v14 = v11;
  objc_msgSend(v8, "setText:withAnimationStyle:", v9, v14);

}

- (void)suggestionManager:(id)a3 hasNewSuggestionsAvailable:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PXPeopleConfirmationViewController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PXPeopleConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke;
  v7[3] = &unk_1E5148D08;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)noMoreSuggestionsAvailableForSuggestionManager:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PXPeopleConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)willLoadMoreSuggestionsForSuggestionManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleConfirmationViewController loadingDelayTimer](self, "loadingDelayTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "invalidate");
  objc_initWeak(&location, self);
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[PXPeopleConfirmationViewController willLoadMoreSuggestionsForSuggestionManager:]";
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", buf, 0xCu);
  }

  v8 = (void *)MEMORY[0x1E0C99E88];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __82__PXPeopleConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke;
  v13 = &unk_1E5141230;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v10, 0.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleConfirmationViewController setLoadingDelayTimer:](self, "setLoadingDelayTimer:", v9, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (id)personForSummaryViewController:(id)a3
{
  void *v3;
  void *v4;

  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)userConfirmedCountForSummaryViewController:(id)a3
{
  void *v3;
  unint64_t v4;

  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userConfirmationsCount");

  return v4;
}

- (unint64_t)autoConfirmedCountForSummaryViewController:(id)a3
{
  void *v3;
  unint64_t v4;

  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autoConfirmationsCount");

  return v4;
}

- (PXPeopleSuggestionManager)suggestionManager
{
  return (PXPeopleSuggestionManager *)objc_getProperty(self, a2, 976, 1);
}

- (PXPeopleSuggestionView)suggestionView
{
  return self->_suggestionView;
}

- (void)setSuggestionView:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionView, a3);
}

- (PXAnimatedCountView)countView
{
  return self->_countView;
}

- (void)setCountView:(id)a3
{
  objc_storeStrong((id *)&self->_countView, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UILabel)interimLoadingLabel
{
  return self->_interimLoadingLabel;
}

- (void)setInterimLoadingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_interimLoadingLabel, a3);
}

- (UIActivityIndicatorView)interimLoadingIndicator
{
  return self->_interimLoadingIndicator;
}

- (void)setInterimLoadingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_interimLoadingIndicator, a3);
}

- (unint64_t)viewState
{
  return self->_viewState;
}

- (PXPeopleConfirmationLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (PXPeopleConfirmationSummaryViewController)summaryViewController
{
  return self->_summaryViewController;
}

- (void)setSummaryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_summaryViewController, a3);
}

- (NSTimer)loadingDelayTimer
{
  return self->_loadingDelayTimer;
}

- (void)setLoadingDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_loadingDelayTimer, a3);
}

- (BOOL)suggestionsPresented
{
  return self->_suggestionsPresented;
}

- (void)setSuggestionsPresented:(BOOL)a3
{
  self->_suggestionsPresented = a3;
}

- (BOOL)showTypeDebugColor
{
  return self->_showTypeDebugColor;
}

- (void)setShowTypeDebugColor:(BOOL)a3
{
  self->_showTypeDebugColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingDelayTimer, 0);
  objc_storeStrong((id *)&self->_summaryViewController, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_interimLoadingIndicator, 0);
  objc_storeStrong((id *)&self->_interimLoadingLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_countView, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_suggestionManager, 0);
}

void __82__PXPeopleConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__PXPeopleConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke_2;
  v5[3] = &unk_1E5147280;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __82__PXPeopleConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "loadingDelayTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4 == v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "Suggestions UI: Display loading UI (Timer Valid)", buf, 2u);
    }

    v8 = objc_loadWeakRetained(v2);
    if (objc_msgSend(v8, "suggestionsPresented"))
      v9 = 3;
    else
      v9 = 2;

    v6 = objc_loadWeakRetained(v2);
    -[NSObject setViewState:](v6, "setViewState:", v9);
  }
  else if (v7)
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "Suggestions UI: Do not display loading UI (Timer Invalid)", v10, 2u);
  }

}

uint64_t __85__PXPeopleConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[PXPeopleConfirmationViewController noMoreSuggestionsAvailableForSuggestionManager:]_block_invoke";
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "loadingDelayTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setLoadingDelayTimer:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "displaySummary");
}

void __83__PXPeopleConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "Suggestions UI: Present Suggestion: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "presentSuggestion:animated:", v2, 1);
}

void __88__PXPeopleConfirmationViewController__handleSuggestionCompletionWithSuggestion_success___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isPersonModel") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

void __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setLoadingState:", 1);
  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke_2;
  v3[3] = &unk_1E5149198;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "animateWithDuration:animations:", v3, 0.33);

}

uint64_t __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __51__PXPeopleConfirmationViewController_setViewState___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "viewState");
  v3 = *(_QWORD *)(a1 + 40);
  if (result != v3)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024) = v3;
    return objc_msgSend(*(id *)(a1 + 32), "updateViewWithViewState:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

uint64_t __51__PXPeopleConfirmationViewController_setViewState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__PXPeopleConfirmationViewController_dismissSummary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __52__PXPeopleConfirmationViewController_dismissSummary__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  return objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", 0);
}

uint64_t __52__PXPeopleConfirmationViewController_displaySummary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __65__PXPeopleConfirmationViewController_presentSuggestion_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleSuggestionCompletionWithSuggestion:success:", *(_QWORD *)(a1 + 32), a2);

}

@end
