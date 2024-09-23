@implementation SPUIViewController

- (id)contentScrollView
{
  void *v2;
  void *v3;

  -[SPUIViewController activeViewController](self, "activeViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activeViewController
{
  void *v2;
  void *v3;

  -[SPUIViewController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isActiveViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPUIViewController activeViewController](self, "activeViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)activateViewController:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  SPUIViewController *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  -[SPUIViewController activeViewController](self, "activeViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v6)
  {
    v8 = MEMORY[0x24BEB0818];
    v9 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
    if (!v9)
    {
      SPUIInitLogging();
      v9 = *(NSObject **)(v8 + 40);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E078000, v9, OS_LOG_TYPE_DEFAULT, "activating vc", buf, 2u);
    }
    objc_msgSend(v7, "removeFromParentViewController");
    if (v6)
    {
      -[SPUIViewController addChildViewController:](self, "addChildViewController:", v6);
      -[SPUIViewController willUpdateActiveViewController](self, "willUpdateActiveViewController");
      -[SPUIViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v11);

      v12 = (void *)MEMORY[0x24BE85220];
      objc_msgSend(v6, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constrainViewToContainer:", v13);

      objc_msgSend(v6, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAlpha:", 0.0);

      v15 = (void *)MEMORY[0x24BE85288];
      v16 = MEMORY[0x24BDAC760];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __53__SPUIViewController_activateViewController_animate___block_invoke;
      v20[3] = &unk_24F9D6078;
      v21 = v6;
      v22 = v7;
      v17[0] = v16;
      v17[1] = 3221225472;
      v17[2] = __53__SPUIViewController_activateViewController_animate___block_invoke_2;
      v17[3] = &unk_24F9D6078;
      v18 = v22;
      v19 = self;
      objc_msgSend(v15, "performAnimatableChanges:animated:completion:", v20, v4, v17);

    }
  }

}

- (SPUIViewControllerDelegate)delegate
{
  return (SPUIViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SPUIResultsViewController)searchResultViewController
{
  return (SPUIResultsViewController *)objc_getProperty(self, a2, 984, 1);
}

- (SPUIViewController)init
{
  SPUIViewController *v2;
  SPUIResultsViewController *v3;
  void *v4;
  SPUIResultsViewController *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SPUIViewController;
  v2 = -[SPUIViewController init](&v9, sel_init);
  if (v2)
  {
    v3 = [SPUIResultsViewController alloc];
    +[SPUISearchModel sharedGeneralInstance](SPUISearchModel, "sharedGeneralInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SPUIResultsViewController initWithSearchModel:](v3, "initWithSearchModel:", v4);
    -[SPUIViewController setSearchResultViewController:](v2, "setSearchResultViewController:", v5);

    -[SPUIViewController searchResultViewController](v2, "searchResultViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v2);

    -[SPUIViewController searchResultViewController](v2, "searchResultViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFeedbackListener:", v2);

  }
  return v2;
}

- (void)setSearchResultViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  if (objc_msgSend((id)objc_opt_class(), "isFeedbackSelector:", a3)
    && !-[SPUIViewController isInStateRestoration](self, "isInStateRestoration"))
  {
    +[SPUIFeedbackManager feedbackListener](SPUIFeedbackManager, "feedbackListener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SPUIViewController;
    -[SPUIViewController forwardingTargetForSelector:](&v7, sel_forwardingTargetForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPUIViewController;
  if (-[SPUIViewController respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_class(), "isFeedbackSelector:", a3);
    if (v5)
      LOBYTE(v5) = !-[SPUIViewController isInStateRestoration](self, "isInStateRestoration");
  }
  return v5;
}

+ (BOOL)isFeedbackSelector:(SEL)a3
{
  return (unint64_t)protocol_getMethodDescription((Protocol *)&unk_255E25B40, a3, 0, 1).name != 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

uint64_t __53__SPUIViewController_activateViewController_animate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
  return objc_msgSend(*(id *)(a1 + 40), "didUpdateActiveViewController");
}

void __53__SPUIViewController_activateViewController_animate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

- (id)currentQuery
{
  return 0;
}

- (void)didTapInEmptyRegion
{
  id v2;

  -[SPUIViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissSearchViewWithReason:", 2);

}

- (BOOL)isInStateRestoration
{
  return self->_isInStateRestoration;
}

- (void)setIsInStateRestoration:(BOOL)a3
{
  self->_isInStateRestoration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
