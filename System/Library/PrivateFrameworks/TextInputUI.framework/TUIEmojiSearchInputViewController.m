@implementation TUIEmojiSearchInputViewController

- (TUIEmojiSearchInputViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TUIEmojiSearchInputViewController *v4;
  TUIEmojiSearchView *v5;
  uint64_t v6;
  TUIEmojiSearchView *emojiSearchView;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  STKStickerRemoteSearchViewController *v12;
  _QWORD *p_remoteSearchViewController;
  STKStickerRemoteSearchViewController *remoteSearchViewController;
  uint64_t v15;
  TUIEmojiSearchResultsCollectionViewController *v16;
  TUIEmojiSearchResultsCollectionViewController *resultsViewController;
  void *v18;
  void *v19;
  uint64_t v20;
  _UIKBFeedbackGenerating *feedbackGenerator;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)TUIEmojiSearchInputViewController;
  v4 = -[UIInputViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = [TUIEmojiSearchView alloc];
    v6 = -[TUIEmojiSearchView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    emojiSearchView = v4->_emojiSearchView;
    v4->_emojiSearchView = (TUIEmojiSearchView *)v6;

    -[TUIEmojiSearchView setTranslatesAutoresizingMaskIntoConstraints:](v4->_emojiSearchView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TUIEmojiSearchView searchTextField](v4->_emojiSearchView, "searchTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSearchDelegate:", v4);

    if (TUIRemoteEmojiSearchViewControllerEnabled())
    {
      objc_initWeak(&location, v4);
      v9 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke;
      v29[3] = &unk_1E24FBCA0;
      objc_copyWeak(&v30, &location);
      -[TUIEmojiSearchView setLayoutInvalidationCallback:](v4->_emojiSearchView, "setLayoutInvalidationCallback:", v29);
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_2;
      v27[3] = &unk_1E24FBCA0;
      objc_copyWeak(&v28, &location);
      -[TUIEmojiSearchView setCreateButtonCallback:](v4->_emojiSearchView, "setCreateButtonCallback:", v27);
      v25[0] = v9;
      v25[1] = 3221225472;
      v25[2] = __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_3;
      v25[3] = &unk_1E24FBCA0;
      objc_copyWeak(&v26, &location);
      -[TUIEmojiSearchView setCreateStickerFromPhotosButtonCallback:](v4->_emojiSearchView, "setCreateStickerFromPhotosButtonCallback:", v25);
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_4;
      v23[3] = &unk_1E24FBCA0;
      objc_copyWeak(&v24, &location);
      -[TUIEmojiSearchView setPresentAvatarEditorButtonCallback:](v4->_emojiSearchView, "setPresentAvatarEditorButtonCallback:", v23);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    -[TUIEmojiSearchView searchTextField](v4->_emojiSearchView, "searchTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAutocorrectionType:", 1);

    -[TUIEmojiSearchView searchTextField](v4->_emojiSearchView, "searchTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutocapitalizationType:", 0);

    if (TUIRemoteEmojiSearchViewControllerEnabled() && getSTKStickerRemoteSearchViewControllerClass())
    {
      v12 = (STKStickerRemoteSearchViewController *)objc_alloc_init((Class)getSTKStickerRemoteSearchViewControllerClass());
      p_remoteSearchViewController = &v4->_remoteSearchViewController;
      remoteSearchViewController = v4->_remoteSearchViewController;
      v4->_remoteSearchViewController = v12;

      -[STKStickerRemoteSearchViewController setDelegate:](v4->_remoteSearchViewController, "setDelegate:", v4);
      -[STKStickerRemoteSearchViewController view](v4->_remoteSearchViewController, "view");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = objc_alloc_init(TUIEmojiSearchResultsCollectionViewController);
      p_remoteSearchViewController = &v4->_resultsViewController;
      resultsViewController = v4->_resultsViewController;
      v4->_resultsViewController = v16;

      -[TUIEmojiSearchResultsCollectionViewController setDelegate:](v4->_resultsViewController, "setDelegate:", v4);
      -[TUIEmojiSearchResultsCollectionViewController collectionView](v4->_resultsViewController, "collectionView");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v15;
    -[TUIEmojiSearchView setResultsCollectionView:](v4->_emojiSearchView, "setResultsCollectionView:", v15);

    -[TUIEmojiSearchInputViewController addChildViewController:](v4, "addChildViewController:", *p_remoteSearchViewController);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v4, sel__keyboardInputModeDidChange_, *MEMORY[0x1E0DC5528], 0);

    -[TUIEmojiSearchInputViewController _keyboardInputModeDidChange:](v4, "_keyboardInputModeDidChange:", 0);
    objc_msgSend(MEMORY[0x1E0DC4248], "feedbackGeneratorWithView:", v4->_emojiSearchView);
    v20 = objc_claimAutoreleasedReturnValue();
    feedbackGenerator = v4->_feedbackGenerator;
    v4->_feedbackGenerator = (_UIKBFeedbackGenerating *)v20;

  }
  return v4;
}

- (void)loadView
{
  TUIEmojiSearchInputView *v3;
  TUIEmojiSearchInputView *v4;

  v3 = [TUIEmojiSearchInputView alloc];
  v4 = -[UIInputView initWithFrame:inputViewStyle:](v3, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIInputViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *leadingConstraint;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *trailingConstraint;
  void *v14;
  NSLayoutConstraint *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)TUIEmojiSearchInputViewController;
  -[UIInputViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[TUIEmojiSearchInputViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_emojiSearchView);

  -[TUIEmojiSearchView leadingAnchor](self->_emojiSearchView, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchInputViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingConstraint = self->_leadingConstraint;
  self->_leadingConstraint = v7;

  -[TUIEmojiSearchView trailingAnchor](self->_emojiSearchView, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchInputViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  trailingConstraint = self->_trailingConstraint;
  self->_trailingConstraint = v12;

  v14 = (void *)MEMORY[0x1E0CB3718];
  v15 = self->_trailingConstraint;
  v26[0] = self->_leadingConstraint;
  v26[1] = v15;
  -[TUIEmojiSearchView topAnchor](self->_emojiSearchView, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchInputViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v19;
  -[TUIEmojiSearchView bottomAnchor](self->_emojiSearchView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchInputViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v24);

}

- (void)viewWillDisappear:(BOOL)a3
{
  NSTimer *resultsUpdateRateLimitTimer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIEmojiSearchInputViewController;
  -[TUIEmojiSearchInputViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[NSTimer invalidate](self->_resultsUpdateRateLimitTimer, "invalidate");
  resultsUpdateRateLimitTimer = self->_resultsUpdateRateLimitTimer;
  self->_resultsUpdateRateLimitTimer = 0;

  if (-[_UIKBFeedbackGenerating isActive](self->_feedbackGenerator, "isActive"))
    -[_UIKBFeedbackGenerating deactivate](self->_feedbackGenerator, "deactivate");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIEdgeInsets)_keyboardInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[TUIEmojiSearchInputViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") == 1
    || -[TUIEmojiSearchInputViewController usesFloatingStyle](self, "usesFloatingStyle"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "interfaceOrientation") - 3;

    if (v14 <= 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3938], "keyplanePadding");
      v3 = v15;
      v4 = v16;
      v5 = v17;
      v6 = v18;
    }
  }
  v8 = -[TUIEmojiSearchInputViewController usesFloatingStyle](self, "usesFloatingStyle");
  if (v8)
    v9 = -6.0;
  else
    v9 = v6;
  if (v8)
    v10 = -6.0;
  else
    v10 = v4;
  v11 = v3;
  v12 = v5;
  result.right = v9;
  result.bottom = v12;
  result.left = v10;
  result.top = v11;
  return result;
}

- (void)_keyboardInputModeDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  TUIEmojiSearchSource *v8;
  TUIEmojiSearchSource *emojiSearchSource;
  void *v10;
  uint64_t v11;
  void *v12;
  TUIEmojiSearchAnalyticsSession *v13;
  TUIEmojiSearchAnalyticsSession *analyticsSession;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "primaryLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "dictationLanguage");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TUIEmojiSearchSource initWithLocale:]([TUIEmojiSearchSource alloc], "initWithLocale:", v7);
  emojiSearchSource = self->_emojiSearchSource;
  self->_emojiSearchSource = v8;

  -[TUIEmojiSearchSource setDelegate:](self->_emojiSearchSource, "setDelegate:", self);
  objc_msgSend(v19, "multilingualLanguages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v19, "multilingualLanguages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchSource setMultilingualSearchLocales:](self->_emojiSearchSource, "setMultilingualSearchLocales:", v12);

  }
  v13 = -[TUIEmojiSearchAnalyticsSession initWithLocale:]([TUIEmojiSearchAnalyticsSession alloc], "initWithLocale:", v7);
  analyticsSession = self->_analyticsSession;
  self->_analyticsSession = v13;

  -[TUIEmojiSearchInputViewController emojiSearchView](self, "emojiSearchView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchTextField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isActive");

  if (v17)
    -[TUIEmojiSearchAnalyticsSession beginSessionWithInitialSearchQuery:](self->_analyticsSession, "beginSessionWithInitialSearchQuery:", self->_exactSearchQuery);
  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_canAutocorrectWithCurrentInputMode = objc_msgSend(v18, "usesCandidateSelection") ^ 1;

}

- (void)viewWillAppear:(BOOL)a3
{
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDate *lastActivationDate;
  double v11;
  void *v12;
  _QWORD block[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUIEmojiSearchInputViewController;
  -[TUIEmojiSearchInputViewController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  if (TUIRemoteEmojiSearchViewControllerEnabled())
  {
    v4 = dispatch_time(0, 150000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__TUIEmojiSearchInputViewController_viewWillAppear___block_invoke;
    block[3] = &unk_1E24FC068;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[TUIEmojiSearchView searchTextField](self->_emojiSearchView, "searchTextField");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_5;
    v6 = (void *)v5;
    -[TUIEmojiSearchView searchTextField](self->_emojiSearchView, "searchTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (!v9)
LABEL_5:
      -[TUIEmojiSearchInputViewController _displayResults:forExactQuery:autocorrectedQuery:](self, "_displayResults:forExactQuery:autocorrectedQuery:", MEMORY[0x1E0C9AA60], &stru_1E24FC6C0, &stru_1E24FC6C0);
  }
  if ((-[_UIKBFeedbackGenerating isActive](self->_feedbackGenerator, "isActive") & 1) == 0)
    -[_UIKBFeedbackGenerating activateWithCompletionBlock:](self->_feedbackGenerator, "activateWithCompletionBlock:", 0);
  lastActivationDate = self->_lastActivationDate;
  if (lastActivationDate)
  {
    -[NSDate timeIntervalSinceNow](lastActivationDate, "timeIntervalSinceNow");
    if (v11 < -480.0)
    {
      -[TUIEmojiSearchView searchTextField](self->_emojiSearchView, "searchTextField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", &stru_1E24FC6C0);

    }
  }
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  TUIEmojiSearchView *emojiSearchView;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIEmojiSearchInputViewController;
  -[TUIEmojiSearchInputViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  -[TUIEmojiSearchInputViewController _keyboardInsets](self, "_keyboardInsets");
  v4 = v3;
  -[NSLayoutConstraint setConstant:](self->_leadingConstraint, "setConstant:", v3);
  -[NSLayoutConstraint setConstant:](self->_trailingConstraint, "setConstant:", -v4);
  emojiSearchView = self->_emojiSearchView;
  -[TUIEmojiSearchInputViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchView transitionToCompactLayout:](emojiSearchView, "transitionToCompactLayout:", objc_msgSend(v6, "horizontalSizeClass") == 1);

}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  TUIEmojiSearchView *emojiSearchView;
  id v10;

  v4 = objc_msgSend(a3, "horizontalSizeClass");
  -[TUIEmojiSearchInputViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  if (v4 != v6)
  {
    -[TUIEmojiSearchInputViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "userInterfaceIdiom") == 1)
    {
      -[TUIEmojiSearchInputViewController traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIEmojiSearchInputViewController setUsesFloatingStyle:](self, "setUsesFloatingStyle:", objc_msgSend(v8, "horizontalSizeClass") == 1);

    }
    else
    {
      -[TUIEmojiSearchInputViewController setUsesFloatingStyle:](self, "setUsesFloatingStyle:", 0);
    }

    emojiSearchView = self->_emojiSearchView;
    -[TUIEmojiSearchInputViewController traitCollection](self, "traitCollection");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchView transitionToCompactLayout:](emojiSearchView, "transitionToCompactLayout:", objc_msgSend(v10, "horizontalSizeClass") == 1);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)TUIEmojiSearchInputViewController;
  v7 = a4;
  -[TUIEmojiSearchInputViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__TUIEmojiSearchInputViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E24FBCC8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)setChildPredictionViewController:(id)a3
{
  UIPredictiveViewController *v4;
  void *v5;
  UIPredictiveViewController *childPredictionViewController;
  void *v7;
  UIPredictiveViewController *v8;

  v4 = (UIPredictiveViewController *)a3;
  -[UIPredictiveViewController removeFromParentViewController](self->_childPredictionViewController, "removeFromParentViewController");
  -[UIPredictiveViewController view](self->_childPredictionViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  childPredictionViewController = self->_childPredictionViewController;
  self->_childPredictionViewController = v4;
  v8 = v4;

  -[UIPredictiveViewController view](v8, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchView setPredictionView:](self->_emojiSearchView, "setPredictionView:", v7);

  -[TUIEmojiSearchInputViewController addChildViewController:](self, "addChildViewController:", v8);
}

- (void)_displayResults:(id)a3 forExactQuery:(id)a4 autocorrectedQuery:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  v8 = a5;
  v9 = objc_msgSend(a4, "length");
  v10 = objc_msgSend(v8, "length");

  if (!(v9 + v10))
  {
    -[TUIEmojiSearchSource suggestedEmojis](self->_emojiSearchSource, "suggestedEmojis");
    v11 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v11;
  }
  -[TUIEmojiSearchResultsCollectionViewController displayedEmojis](self->_resultsViewController, "displayedEmojis");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v14, "isEqualToArray:", v12);

  if ((v13 & 1) == 0)
    -[TUIEmojiSearchResultsCollectionViewController resetScrollPositionAnimated:](self->_resultsViewController, "resetScrollPositionAnimated:", 0);
  -[TUIEmojiSearchResultsCollectionViewController setDisplayedEmojis:verbatimSkinTones:animated:](self->_resultsViewController, "setDisplayedEmojis:verbatimSkinTones:animated:", v14, -[TUIEmojiSearchSource shouldSupplyVerbatimResultsFor:](self->_emojiSearchSource, "shouldSupplyVerbatimResultsFor:", v14), 1);

}

- (void)autocorrectionListDidBecomeAvailable:(id)a3
{
  void *v4;
  NSString *exactSearchQuery;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *autocorrectedSearchQuery;
  NSString *v10;
  id v11;

  objc_msgSend(a3, "autocorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    exactSearchQuery = self->_exactSearchQuery;
    v11 = v4;
    objc_msgSend(v4, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](exactSearchQuery, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, v7, 12, 0, -[NSString length](self->_exactSearchQuery, "length"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();

    autocorrectedSearchQuery = self->_autocorrectedSearchQuery;
    self->_autocorrectedSearchQuery = v8;
    v10 = v8;

    -[TUIEmojiSearchInputViewController beginSearchForExactQuery:autocorrectedQuery:](self, "beginSearchForExactQuery:autocorrectedQuery:", self->_exactSearchQuery, v10);
    v4 = v11;
  }

}

- (void)updateConfigurationForRemoteSearchController
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v3 = (void *)getSTKStickerSearchConfigurationClass_softClass;
  v14 = getSTKStickerSearchConfigurationClass_softClass;
  if (!getSTKStickerSearchConfigurationClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getSTKStickerSearchConfigurationClass_block_invoke;
    v10[3] = &unk_1E24FBD38;
    v10[4] = &v11;
    __getSTKStickerSearchConfigurationClass_block_invoke((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v11, 8);
  v5 = objc_alloc_init(v4);
  +[TUIEmojiSearchResultsCollectionViewController emojiFontSize](TUIEmojiSearchResultsCollectionViewController, "emojiFontSize");
  objc_msgSend(v5, "setFontSize:");
  -[STKStickerRemoteSearchViewController view](self->_remoteSearchViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutMargins");
  objc_msgSend(v5, "setMargin:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v8, "minimumLineSpacing");
  objc_msgSend(v5, "setSpacing:");

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STKStickerRemoteSearchViewController view](self->_remoteSearchViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVisible:", objc_msgSend(v9, "isHiddenOrHasHiddenAncestor") ^ 1);

  }
  -[STKStickerRemoteSearchViewController configureWithConfiguration:](self->_remoteSearchViewController, "configureWithConfiguration:", v5);

}

- (NSArray)displayedCandidates
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)hidesExpandableButton
{
  return 1;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return 1;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  long double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = a3;
  +[TUIEmojiSearchTextField preferredHeight](TUIEmojiSearchTextField, "preferredHeight");
  v6 = v5;
  v7 = objc_msgSend(v4, "userInterfaceIdiom");
  v8 = objc_msgSend(v4, "horizontalSizeClass");
  -[TUIEmojiSearchInputViewController emojiSearchView](self, "emojiSearchView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCollapsed");

  if (v7 == 1 && v8 != 1)
  {
    if (v10)
    {
      if (!TUIRemoteEmojiSearchViewControllerEnabled())
        v6 = 0.0;
      goto LABEL_17;
    }
    v18 = 6.0;
LABEL_16:
    v6 = v6 + v18;
    goto LABEL_17;
  }
  if ((v10 & 1) != 0)
    goto LABEL_17;
  if (!self->_childPredictionViewController)
  {
    +[TUIEmojiSearchTextField preferredHeight](TUIEmojiSearchTextField, "preferredHeight");
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nativeBounds");
  v13 = v12;

  -[UIPredictiveViewController preferredHeightForTraitCollection:](self->_childPredictionViewController, "preferredHeightForTraitCollection:", v4);
  v15 = v14;
  if (v8 == 1 || (v16 = fmod(v13, 2.0), v17 = fmod(v15, 2.0), v16 != 0.0) && v17 != 0.0)
    v15 = v15 + -1.0;
  v6 = v6 + v15;
LABEL_17:

  return v6;
}

- (void)beginSearchForExactQuery:(id)a3 autocorrectedQuery:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  if (TUIRemoteEmojiSearchViewControllerEnabled())
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v8 = (void *)getSTKStickerSearchQueryClass_softClass;
    v23 = getSTKStickerSearchQueryClass_softClass;
    if (!getSTKStickerSearchQueryClass_softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getSTKStickerSearchQueryClass_block_invoke;
      v19[3] = &unk_1E24FBD38;
      v19[4] = &v20;
      __getSTKStickerSearchQueryClass_block_invoke((uint64_t)v19);
      v8 = (void *)v21[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v20, 8);
    v10 = objc_alloc_init(v9);
    objc_msgSend(v10, "setExactQuery:", v6);
    objc_msgSend(v10, "setAutocorrectedQuery:", v7);
    -[TUIEmojiSearchSource locale](self->_emojiSearchSource, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocale:", v12);

    -[TUIEmojiSearchSource multilingualSearchLocales](self->_emojiSearchSource, "multilingualSearchLocales");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMultilingualSearchLocales:", v13);

    objc_msgSend(v10, "setSupportsImages:", +[TUIEmojiSearchView shouldShowImages](TUIEmojiSearchView, "shouldShowImages"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setSupportsGenmoji:", +[TUIEmojiSearchView shouldShowGenmoji](TUIEmojiSearchView, "shouldShowGenmoji"));
    -[TUIEmojiSearchInputViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0
      || (-[TUIEmojiSearchInputViewController delegate](self, "delegate"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          -[TUIEmojiSearchView searchTextField](self->_emojiSearchView, "searchTextField"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v16, "emojiSearchTextField:shouldSendQuery:", v17, v10),
          v17,
          v16,
          v18))
    {
      -[STKStickerRemoteSearchViewController searchWithQuery:](self->_remoteSearchViewController, "searchWithQuery:", v10);
    }

  }
  else
  {
    -[TUIEmojiSearchSource beginSearchForExactQuery:autocorrectedQuery:](self->_emojiSearchSource, "beginSearchForExactQuery:autocorrectedQuery:", v6, v7);
  }

}

- (void)emojiSearchTextField:(id)a3 didChangeSearchString:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSString *autocorrectedSearchQuery;
  NSString *v12;
  NSString *exactSearchQuery;
  NSTimer *v14;
  NSTimer *waitForAutocorrectionDelayTimer;
  void *v16;
  char v17;
  void *v18;
  _QWORD v19[5];
  __int16 v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v20 = -4;
  v8 = a4;
  objc_msgSend(v7, "stringWithCharacters:length:", &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_1E24FC6C0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  autocorrectedSearchQuery = self->_autocorrectedSearchQuery;
  self->_autocorrectedSearchQuery = 0;

  v12 = (NSString *)objc_msgSend(v10, "copy");
  exactSearchQuery = self->_exactSearchQuery;
  self->_exactSearchQuery = v12;

  if ((unint64_t)objc_msgSend(v10, "length") >= 2 && self->_canAutocorrectWithCurrentInputMode)
  {
    -[NSTimer invalidate](self->_waitForAutocorrectionDelayTimer, "invalidate");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__TUIEmojiSearchInputViewController_emojiSearchTextField_didChangeSearchString___block_invoke;
    v19[3] = &unk_1E24FBCF0;
    v19[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v19, 0.15);
    v14 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    waitForAutocorrectionDelayTimer = self->_waitForAutocorrectionDelayTimer;
    self->_waitForAutocorrectionDelayTimer = v14;

  }
  else
  {
    -[TUIEmojiSearchInputViewController beginSearchForExactQuery:autocorrectedQuery:](self, "beginSearchForExactQuery:autocorrectedQuery:", v10, &stru_1E24FC6C0);
  }
  if (!objc_msgSend(v10, "length"))
  {
    -[TUIEmojiSearchInputViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[TUIEmojiSearchInputViewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "emojiSearchTextFieldDidReset:", v6);

    }
  }
  -[TUIEmojiSearchAnalyticsSession searchQueryWasChangedTo:](self->_analyticsSession, "searchQueryWasChangedTo:", v10);

}

- (void)emojiSearchTextFieldWillClear:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TUIEmojiSearchAnalyticsSession clearButtonPressed](self->_analyticsSession, "clearButtonPressed");
  -[TUIEmojiSearchInputViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TUIEmojiSearchInputViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emojiSearchTextFieldDidReset:", v7);

  }
}

- (void)emojiSearchSource:(id)a3 didProduceResults:(id)a4 forExactQuery:(id)a5 autocorrectedQuery:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSString *v14;
  void *rateLimitedSearchQuery;
  void *v16;
  char v17;
  NSTimer *v18;
  NSTimer *resultsUpdateRateLimitTimer;
  _QWORD aBlock[5];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__TUIEmojiSearchInputViewController_emojiSearchSource_didProduceResults_forExactQuery_autocorrectedQuery___block_invoke;
  aBlock[3] = &unk_1E24FBCF0;
  aBlock[4] = self;
  v13 = _Block_copy(aBlock);
  if (self->_resultsUpdateRateLimitTimer)
  {
    objc_storeStrong((id *)&self->_rateLimitedResults, a4);
    v14 = (NSString *)v11;
    rateLimitedSearchQuery = self->_rateLimitedSearchQuery;
    self->_rateLimitedSearchQuery = v14;
LABEL_5:

    goto LABEL_6;
  }
  -[TUIEmojiSearchInputViewController _displayResults:forExactQuery:autocorrectedQuery:](self, "_displayResults:forExactQuery:autocorrectedQuery:", v10, v11, v12);
  -[TUIEmojiSearchInputViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[TUIEmojiSearchInputViewController delegate](self, "delegate");
    rateLimitedSearchQuery = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(rateLimitedSearchQuery, "emojiSearchDidReceiveResults:forExactQuery:autocorrectedQuery:", v10, v11, v12);
    goto LABEL_5;
  }
LABEL_6:
  -[NSTimer invalidate](self->_resultsUpdateRateLimitTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, 0.15);
  v18 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  resultsUpdateRateLimitTimer = self->_resultsUpdateRateLimitTimer;
  self->_resultsUpdateRateLimitTimer = v18;

}

- (void)_selectedEmojiString:(id)a3 query:(id)a4 indexPath:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastUsedInputModeForCurrentContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "primaryLanguage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v16 = objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = (__CFString *)v16;
  else
    v17 = CFSTR("en_US");
  v18 = objc_msgSend(MEMORY[0x1E0DC3948], "hasVariantsForEmoji:", v29);
  objc_msgSend(MEMORY[0x1E0DC3940], "emojiWithString:withVariantMask:", v29, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3950], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "item"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = &unk_1E25173B0;
    }
    objc_msgSend(MEMORY[0x1E0DC3950], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "emojiUsedFromEmojiKeyboardSearch:inputModeIdentifier:resultIndex:query:completionHandler:", v19, v17, v22, v10, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3950], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "emojiUsed:language:", v19, v17);

    if (v12)
      dispatch_async(MEMORY[0x1E0C80D38], v12);
  }
  -[_UIKBFeedbackGenerating actionOccurred:](self->_feedbackGenerator, "actionOccurred:", 1);
  -[TUIEmojiSearchInputViewController delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    -[TUIEmojiSearchInputViewController delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "emojiSearchWillInsertEmoji:forSearchQuery:", v29, self->_autocorrectedSearchQuery);

  }
  -[UIInputViewController textDocumentProxy](self, "textDocumentProxy");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "insertText:", v29);

  -[TUIEmojiSearchAnalyticsSession emojiInserted:](self->_analyticsSession, "emojiInserted:", v29);
}

- (void)didSelectEmoji:(id)a3 indexPath:(id)a4
{
  -[TUIEmojiSearchInputViewController _selectedEmojiString:query:indexPath:completion:](self, "_selectedEmojiString:query:indexPath:completion:", a3, self->_autocorrectedSearchQuery, a4, 0);
}

- (void)toggleGlow:(BOOL)a3
{
  -[TUIEmojiSearchView setShouldCreateButtonGlow:animated:](self->_emojiSearchView, "setShouldCreateButtonGlow:animated:", a3, a3);
}

- (void)emojiSearchResultsController:(id)a3 didSelectEmoji:(id)a4 indexPath:(id)a5
{
  -[TUIEmojiSearchInputViewController _selectedEmojiString:query:indexPath:completion:](self, "_selectedEmojiString:query:indexPath:completion:", a4, self->_autocorrectedSearchQuery, a5, 0);
}

- (void)emojiSearchResultsController:(id)a3 didRequestVariantSelectorForEmojiToken:(id)a4 fromRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  TUIEmojiVariantSelectorView *v26;
  TUIEmojiVariantSelectorView *variantSelectorView;
  TUIEmojiVariantSelectorView *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MaxX;
  void *v40;
  double v41;
  double v42;
  BOOL v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  UITapGestureRecognizer *v53;
  UITapGestureRecognizer *variantSelectorDismissGesture;
  TouchExclusionView *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  TouchExclusionView *v67;
  TouchExclusionView *variantSelectorDismissOverlayView;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  id v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  if (!self->_variantSelectorView)
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v14 = a4;
    -[TUIEmojiSearchInputViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchResultsCollectionViewController collectionView](self->_resultsViewController, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "convertRect:fromView:", v17, x, y, width, height);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v26 = -[TUIEmojiVariantSelectorView initWithFrame:emojiToken:originRect:]([TUIEmojiVariantSelectorView alloc], "initWithFrame:emojiToken:originRect:", v14, v10, v11, v12, v13, v19, v21, v23, v25);
    variantSelectorView = self->_variantSelectorView;
    self->_variantSelectorView = v26;

    -[TUIEmojiVariantSelectorView setDelegate:](self->_variantSelectorView, "setDelegate:", self);
    v28 = self->_variantSelectorView;
    -[TUIEmojiSearchInputViewController emojiSearchView](self, "emojiSearchView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    -[TUIEmojiVariantSelectorView sizeThatFits:](v28, "sizeThatFits:", v30, v31);
    v33 = v32;
    v35 = v34;

    v75.origin.x = v19;
    v75.origin.y = v21;
    v75.size.width = v23;
    v75.size.height = v25;
    v36 = CGRectGetMaxY(v75) - v35;
    UIRectGetCenter();
    v38 = v37 + v33 * -0.5;
    if (v38 >= 0.0)
    {
      v77.origin.x = v37 + v33 * -0.5;
      v77.origin.y = v36;
      v77.size.width = v33;
      v77.size.height = v35;
      v72 = v36;
      MaxX = CGRectGetMaxX(v77);
      -[TUIEmojiSearchInputViewController view](self, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bounds");
      v73 = v35;
      v42 = v41;

      v43 = MaxX <= v42;
      v36 = v72;
      v35 = v73;
      if (!v43)
      {
        -[TUIEmojiSearchInputViewController view](self, "view");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "bounds");
        v46 = v45;
        v78.origin.x = v19;
        v78.origin.y = v21;
        v78.size.width = v23;
        v78.size.height = v25;
        v47 = v46 - CGRectGetMaxX(v78);
        v48 = *(double *)&TUIEmojiVariantSelectorBubbleRadius;

        if (v47 >= v48)
        {
          -[TUIEmojiSearchInputViewController view](self, "view");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "bounds");
          v38 = v50 - v33;

        }
        else
        {
          v79.origin.x = v19;
          v79.origin.y = v21;
          v79.size.width = v23;
          v79.size.height = v25;
          v38 = CGRectGetMaxX(v79) - v33;
        }
        v36 = v72;
        v35 = v73;
      }
    }
    else
    {
      v76.origin.x = v19;
      v76.origin.y = v21;
      v76.size.width = v23;
      v76.size.height = v25;
      if (CGRectGetMinX(v76) >= *(double *)&TUIEmojiVariantSelectorBubbleRadius)
        v38 = 0.0;
      else
        v38 = v19;
    }
    -[TUIEmojiVariantSelectorView setFrame:](self->_variantSelectorView, "setFrame:", v38, v36, v33, v35);
    -[TUIEmojiSearchInputViewController view](self, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "window");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addSubview:", self->_variantSelectorView);

    v53 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__didRecognizeVariantDismissGesture_);
    variantSelectorDismissGesture = self->_variantSelectorDismissGesture;
    self->_variantSelectorDismissGesture = v53;

    -[UITapGestureRecognizer setCancelsTouchesInView:](self->_variantSelectorDismissGesture, "setCancelsTouchesInView:", 1);
    v55 = [TouchExclusionView alloc];
    -[TUIEmojiSearchInputViewController view](self, "view");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "window");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bounds");
    v59 = v58;
    v61 = v60;
    v63 = v62;
    v65 = v64;
    -[TUIEmojiVariantSelectorView variantCellContainerView](self->_variantSelectorView, "variantCellContainerView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[TouchExclusionView initWithFrame:excludingView:](v55, "initWithFrame:excludingView:", v66, v59, v61, v63, v65);
    variantSelectorDismissOverlayView = self->_variantSelectorDismissOverlayView;
    self->_variantSelectorDismissOverlayView = v67;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "colorWithAlphaComponent:", 0.01);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[TouchExclusionView setBackgroundColor:](self->_variantSelectorDismissOverlayView, "setBackgroundColor:", v70);

    -[TouchExclusionView addGestureRecognizer:](self->_variantSelectorDismissOverlayView, "addGestureRecognizer:", self->_variantSelectorDismissGesture);
    -[TUIEmojiSearchInputViewController view](self, "view");
    v74 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "window");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addSubview:", self->_variantSelectorDismissOverlayView);

  }
}

- (void)emojiSearchTextFieldWillBecomeActive:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIEmojiSearchInputViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emojiSearchTextFieldWillBecomeActive:", v4);

}

- (void)emojiSearchTextFieldDidBecomeActive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDate *v11;
  NSDate *lastActivationDate;
  id v13;

  v4 = a3;
  -[TUIEmojiSearchInputViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emojiSearchTextFieldDidBecomeActive:", v4);

  -[TUIEmojiSearchResultsCollectionViewController collectionView](self->_resultsViewController, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateLayout");

  -[TUIEmojiSearchInputViewController emojiSearchView](self, "emojiSearchView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3938], "keyplanePadding");
  objc_msgSend(v8, "updateInsetsIfNeeded:");

  -[TUIEmojiSearchInputViewController updateConfigurationForRemoteSearchController](self, "updateConfigurationForRemoteSearchController");
  -[TUIEmojiSearchInputViewController emojiSearchView](self, "emojiSearchView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
    -[TUIEmojiSearchInputViewController beginSearchForExactQuery:autocorrectedQuery:](self, "beginSearchForExactQuery:autocorrectedQuery:", v13, &stru_1E24FC6C0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastActivationDate = self->_lastActivationDate;
  self->_lastActivationDate = v11;

  -[TUIEmojiSearchAnalyticsSession beginSessionWithInitialSearchQuery:](self->_analyticsSession, "beginSessionWithInitialSearchQuery:", v13);
}

- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIEmojiSearchInputViewController _dismissVariantSelector](self, "_dismissVariantSelector");
  -[TUIEmojiSearchInputViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emojiSearchTextFieldWillBecomeInactive:", v4);

}

- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TUIEmojiSearchInputViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emojiSearchTextFieldDidBecomeInactive:", v4);

  -[TUIEmojiSearchAnalyticsSession endSession](self->_analyticsSession, "endSession");
}

- (void)_dismissVariantSelector
{
  TouchExclusionView *variantSelectorDismissOverlayView;
  TUIEmojiVariantSelectorView *variantSelectorView;

  -[TUIEmojiSearchResultsCollectionViewController setCellHighlightFrozen:](self->_resultsViewController, "setCellHighlightFrozen:", 0);
  -[TouchExclusionView removeFromSuperview](self->_variantSelectorDismissOverlayView, "removeFromSuperview");
  variantSelectorDismissOverlayView = self->_variantSelectorDismissOverlayView;
  self->_variantSelectorDismissOverlayView = 0;

  -[TUIEmojiVariantSelectorView removeFromSuperview](self->_variantSelectorView, "removeFromSuperview");
  variantSelectorView = self->_variantSelectorView;
  self->_variantSelectorView = 0;

}

- (void)variantSelectorValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *autocorrectedSearchQuery;
  _QWORD v8[5];

  objc_msgSend(a3, "selectedVariant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    autocorrectedSearchQuery = self->_autocorrectedSearchQuery;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__TUIEmojiSearchInputViewController_variantSelectorValueChanged___block_invoke;
    v8[3] = &unk_1E24FC068;
    v8[4] = self;
    -[TUIEmojiSearchInputViewController _selectedEmojiString:query:indexPath:completion:](self, "_selectedEmojiString:query:indexPath:completion:", v6, autocorrectedSearchQuery, 0, v8);

  }
}

- (void)dragAndDropWillBegin:(id)a3
{
  -[TouchExclusionView setHidden:](self->_variantSelectorDismissOverlayView, "setHidden:", 1);
}

- (void)dragAndDropDidEnd:(id)a3
{
  -[TouchExclusionView setHidden:](self->_variantSelectorDismissOverlayView, "setHidden:", 0);
}

- (TUIEmojiSearchInputViewControllerDelegate)delegate
{
  return (TUIEmojiSearchInputViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TUIEmojiSearchView)emojiSearchView
{
  return self->_emojiSearchView;
}

- (UIPredictiveViewController)childPredictionViewController
{
  return self->_childPredictionViewController;
}

- (BOOL)usesFloatingStyle
{
  return self->_usesFloatingStyle;
}

- (void)setUsesFloatingStyle:(BOOL)a3
{
  self->_usesFloatingStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childPredictionViewController, 0);
  objc_storeStrong((id *)&self->_emojiSearchView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_analyticsSession, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_lastActivationDate, 0);
  objc_storeStrong((id *)&self->_autocorrectedSearchQuery, 0);
  objc_storeStrong((id *)&self->_exactSearchQuery, 0);
  objc_storeStrong((id *)&self->_waitForAutocorrectionDelayTimer, 0);
  objc_storeStrong((id *)&self->_rateLimitedSearchQuery, 0);
  objc_storeStrong((id *)&self->_rateLimitedResults, 0);
  objc_storeStrong((id *)&self->_resultsUpdateRateLimitTimer, 0);
  objc_storeStrong((id *)&self->_variantSelectorDismissOverlayView, 0);
  objc_storeStrong((id *)&self->_variantSelectorDismissGesture, 0);
  objc_storeStrong((id *)&self->_variantSelectorView, 0);
  objc_storeStrong((id *)&self->_currentInputMode, 0);
  objc_storeStrong((id *)&self->_remoteSearchViewController, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
  objc_storeStrong((id *)&self->_emojiSearchSource, 0);
}

void __65__TUIEmojiSearchInputViewController_variantSelectorValueChanged___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dismissVariantSelector");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

void __106__TUIEmojiSearchInputViewController_emojiSearchSource_didProduceResults_forExactQuery_autocorrectedQuery___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[134];
  if (v4)
  {
    objc_msgSend(v3, "_displayResults:forExactQuery:autocorrectedQuery:", v4, v3[135], v3[139]);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    v3 = *(_QWORD **)(a1 + 32);
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v3, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "emojiSearchDidReceiveResults:forExactQuery:autocorrectedQuery:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112));

      v3 = *(_QWORD **)(a1 + 32);
    }
  }
  v8 = (void *)v3[134];
  v3[134] = 0;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 1080);
  *(_QWORD *)(v9 + 1080) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 1064);
  *(_QWORD *)(v11 + 1064) = 0;

}

void __80__TUIEmojiSearchInputViewController_emojiSearchTextField_didChangeSearchString___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[139])
  {
    objc_msgSend(v2, "beginSearchForExactQuery:autocorrectedQuery:", v2[138], &stru_1E24FC6C0);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v3 = (void *)v2[137];
  v2[137] = 0;

}

uint64_t __88__TUIEmojiSearchInputViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 1176);
  objc_msgSend(MEMORY[0x1E0DC3938], "keyplanePadding");
  return objc_msgSend(v1, "updateInsetsIfNeeded:");
}

void __52__TUIEmojiSearchInputViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[147], "searchTextField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginSearchForExactQuery:autocorrectedQuery:", v2, &stru_1E24FC6C0);

}

void __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateConfigurationForRemoteSearchController");

}

void __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v1 = (void *)*((_QWORD *)WeakRetained + 128);
    objc_msgSend(*((id *)WeakRetained + 147), "searchTextField");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "presentEmojiGenerationControllerWithInputString:", v3);

  }
}

void __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained[128], "presentCreateStickerPhotoPickerController");

}

void __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained[128], "presentAvatarEditor");

}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

@end
