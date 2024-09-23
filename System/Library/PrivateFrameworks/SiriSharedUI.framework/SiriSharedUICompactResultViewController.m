@implementation SiriSharedUICompactResultViewController

- (void)loadView
{
  SiriSharedUICompactResultView *v3;

  v3 = objc_alloc_init(SiriSharedUICompactResultView);
  -[SiriSharedUICompactResultViewController setView:](self, "setView:", v3);

}

- (SiriSharedUICompactResultView)compactResultView
{
  void *v2;
  void *v3;
  SiriSharedUICompactResultView *v4;

  -[SiriSharedUICompactResultViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setContentPlatterViewController:(id)a3
{
  SiriSharedUIContentPlatterViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = (SiriSharedUIContentPlatterViewController *)a3;
  if (self->_contentPlatterViewController != v5)
  {
    -[SiriSharedUICompactResultViewController contentPlatterViewController](self, "contentPlatterViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_contentPlatterViewController, a3);
    -[SiriSharedUICompactResultViewController addChildViewController:](self, "addChildViewController:", v5);
    -[SiriSharedUICompactResultViewController compactResultView](self, "compactResultView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIContentPlatterViewController contentPlatterView](v5, "contentPlatterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__SiriSharedUICompactResultViewController_setContentPlatterViewController___block_invoke;
    v10[3] = &unk_1EA89CC58;
    v11 = v6;
    v9 = v6;
    objc_msgSend(v7, "setSnippetView:completion:", v8, v10);

    objc_msgSend(v9, "didMoveToParentViewController:", 0);
    -[SiriSharedUIContentPlatterViewController didMoveToParentViewController:](v5, "didMoveToParentViewController:", self);

  }
}

- (BOOL)_canShowWhileLocked
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DA7A40], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSiriSafeForLockScreen");

  return v3;
}

- (SiriSharedUIContentPlatterViewController)contentPlatterViewController
{
  return self->_contentPlatterViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPlatterViewController, 0);
}

@end
