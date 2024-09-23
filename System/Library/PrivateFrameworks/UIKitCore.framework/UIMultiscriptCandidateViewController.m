@implementation UIMultiscriptCandidateViewController

- (UIMultiscriptCandidateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIMultiscriptCandidateViewController *v4;
  UIPredictionViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIMultiscriptCandidateViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = -[UIPredictionViewController initWithNibName:bundle:]([UIPredictionViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[UIMultiscriptCandidateViewController setCurrentViewController:](v4, "setCurrentViewController:", v5);

  }
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[UIMultiscriptCandidateViewController currentViewController](self, "currentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isVisibleForInputDelegate:inputViews:", v7, v6);

  return v9;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[UIMultiscriptCandidateViewController currentViewController](self, "currentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredHeightForTraitCollection:", v4);
  v7 = v6;

  return v7;
}

- (BOOL)hidesExpandableButton
{
  void *v2;
  char v3;

  -[UIMultiscriptCandidateViewController currentViewController](self, "currentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidesExpandableButton");

  return v3;
}

- (NSArray)displayedCandidates
{
  void *v2;
  void *v3;

  -[UIMultiscriptCandidateViewController currentViewController](self, "currentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayedCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)requiresKeyboard
{
  void *v2;
  char v3;

  -[UIMultiscriptCandidateViewController currentViewController](self, "currentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresKeyboard");

  return v3;
}

- (void)loadView
{
  UIMultiscriptCandidateView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(UIMultiscriptCandidateView);
  -[UIMultiscriptCandidateViewController setCandidateView:](self, "setCandidateView:", v3);
  -[UIViewController setView:](self, "setView:", v3);

  -[UIMultiscriptCandidateViewController alternativeCandidateAction](self, "alternativeCandidateAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMultiscriptCandidateViewController candidateView](self, "candidateView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlternativeCandidateAction:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_reloadArrangedSubviews, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_reloadArrangedSubviews, CFSTR("UIKeyboardLayoutDidChangedNotification"), 0);

  -[UIMultiscriptCandidateViewController reloadArrangedSubviews](self, "reloadArrangedSubviews");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIKeyboardLayoutDidChangedNotification"), 0);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autocorrectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAutocorrectionObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)UIMultiscriptCandidateViewController;
  -[UIViewController dealloc](&v7, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIMultiscriptCandidateViewController;
  -[UIViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[UIMultiscriptCandidateViewController reloadArrangedSubviews](self, "reloadArrangedSubviews");
}

- (id)alternativeCandidates
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  unint64_t v10;
  BOOL v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocorrectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrectionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "corrections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autocorrection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_6;
  objc_msgSend(v4, "predictions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (char *)objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v4, "emojiList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") == 0;

    v11 = (unint64_t)v8 > v10;
    v12 = &v8[-v10];
    if (!v11)
    {
LABEL_6:
      v8 = 0;
      goto LABEL_7;
    }
    v13 = (void *)MEMORY[0x1E0DBDB48];
    objc_msgSend(v4, "predictions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subarrayWithRange:", v10, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "listWithCorrections:predictions:", 0, v15);
    v8 = (char *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v8;
}

- (id)alternativeCandidateAction
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__UIMultiscriptCandidateViewController_alternativeCandidateAction__block_invoke;
  v3[3] = &unk_1E16B2C10;
  v3[4] = self;
  +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __66__UIMultiscriptCandidateViewController_alternativeCandidateAction__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "cachedCandidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setUpdatingCandidates:", 1);
    objc_msgSend(*(id *)(a1 + 32), "cachedCandidates");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCachedCandidates:", 0);
LABEL_5:
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "autocorrectionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutocorrectionList:", v9);

    objc_msgSend(*(id *)(a1 + 32), "setUpdatingCandidates:", 0);
    v6 = v9;
    goto LABEL_6;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCachedCandidates:", v5);

  objc_msgSend(*(id *)(a1 + 32), "alternativeCandidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = v6;
    objc_msgSend(*(id *)(a1 + 32), "setUpdatingCandidates:", 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)autocorrectionListDidChange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (!-[UIMultiscriptCandidateViewController updatingCandidates](self, "updatingCandidates"))
    -[UIMultiscriptCandidateViewController setCachedCandidates:](self, "setCachedCandidates:", 0);
  -[UIMultiscriptCandidateViewController cachedCandidates](self, "cachedCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIMultiscriptCandidateViewController candidateView](self, "candidateView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alternativeCandidatesButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 1;
  }
  else
  {
    -[UIMultiscriptCandidateViewController alternativeCandidates](self, "alternativeCandidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIMultiscriptCandidateViewController candidateView](self, "candidateView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alternativeCandidatesButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v7)
      v6 = 2;
    else
      v6 = 0;
  }
  objc_msgSend(v4, "setButtonState:", v6);

}

- (void)reloadArrangedSubviews
{
  void *v3;
  void *v4;
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
  int v15;
  void *v16;
  id v17;

  -[UIMultiscriptCandidateViewController currentViewController](self, "currentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMultiscriptCandidateViewController candidateView](self, "candidateView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[UIMultiscriptCandidateViewController candidateView](self, "candidateView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMultiscriptCandidateViewController currentViewController](self, "currentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadArrangedSubviews:", v13);

  }
  else
  {
    -[UIMultiscriptCandidateViewController currentViewController](self, "currentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController addChildViewController:](self, "addChildViewController:", v7);

    -[UIMultiscriptCandidateViewController candidateView](self, "candidateView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMultiscriptCandidateViewController currentViewController](self, "currentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadArrangedSubviews:", v10);

    -[UIMultiscriptCandidateViewController currentViewController](self, "currentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didMoveToParentViewController:", self);
  }

  -[UIMultiscriptCandidateViewController candidateView](self, "candidateView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "requiresAlternativeCandidatesButton");

  if (v15)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "autocorrectionController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAutocorrectionObserver:", self);

  }
}

- (int64_t)overrideUserInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[UIMultiscriptCandidateViewController currentViewController](self, "currentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "overrideUserInterfaceStyle");

  return v3;
}

- (UIPredictiveViewController)currentViewController
{
  return self->_currentViewController;
}

- (void)setCurrentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentViewController, a3);
}

- (UIMultiscriptCandidateView)candidateView
{
  return self->_candidateView;
}

- (void)setCandidateView:(id)a3
{
  objc_storeStrong((id *)&self->_candidateView, a3);
}

- (TIAutocorrectionList)cachedCandidates
{
  return self->_cachedCandidates;
}

- (void)setCachedCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCandidates, a3);
}

- (BOOL)updatingCandidates
{
  return self->_updatingCandidates;
}

- (void)setUpdatingCandidates:(BOOL)a3
{
  self->_updatingCandidates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCandidates, 0);
  objc_storeStrong((id *)&self->_candidateView, 0);
  objc_storeStrong((id *)&self->_currentViewController, 0);
}

@end
