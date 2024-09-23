@implementation UISearchContainerViewController

- (UISearchContainerViewController)initWithSearchController:(UISearchController *)searchController
{
  UISearchController *v5;
  UISearchContainerViewController *v6;
  UISearchContainerViewController *v7;
  objc_super v9;

  v5 = searchController;
  v9.receiver = self;
  v9.super_class = (Class)UISearchContainerViewController;
  v6 = -[UIViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchController, searchController);
    -[UISearchContainerViewController commonInit](v7, "commonInit");
  }

  return v7;
}

- (UISearchContainerViewController)initWithCoder:(id)a3
{
  id v4;
  UISearchContainerViewController *v5;
  uint64_t v6;
  UISearchController *searchController;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISearchContainerViewController;
  v5 = -[UIViewController initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISearchContainerViewControllerSearchController"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchController = v5->_searchController;
    v5->_searchController = (UISearchController *)v6;

    -[UISearchContainerViewController commonInit](v5, "commonInit");
  }

  return v5;
}

- (void)commonInit
{
  -[UIViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISearchContainerViewController;
  v4 = a3;
  -[UIViewController encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchController, CFSTR("UISearchContainerViewControllerSearchController"), v5.receiver, v5.super_class);

}

- (void)_presentSearchControllerIfNecessary
{
  void *v3;
  UISearchContainerViewController *v4;
  UISearchContainerViewController *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];

  -[UISearchContainerViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (UISearchContainerViewController *)objc_claimAutoreleasedReturnValue();
  if (v4 == self)
  {

  }
  else
  {
    v5 = v4;
    v6 = -[UISearchContainerViewController isPresentingSearchController](self, "isPresentingSearchController");

    if (!v6)
    {
      -[UISearchContainerViewController setIsPresentingSearchController:](self, "setIsPresentingSearchController:", 1);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __70__UISearchContainerViewController__presentSearchControllerIfNecessary__block_invoke;
      v11[3] = &unk_1E16B1B28;
      v11[4] = self;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v11);
      return;
    }
  }
  -[UISearchContainerViewController searchController](self, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_updateSystemInputViewController");

  -[UIViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == 3)
  {
    -[UISearchContainerViewController searchController](self, "searchController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_limitedUIDidChangeAnimated:", 0);

  }
}

void __70__UISearchContainerViewController__presentSearchControllerIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "tabBarController");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "tabBarController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 == *(void **)(a1 + 32))
    {
      objc_msgSend(v5, "tabBarController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_isFocusedTabVisible");

      if (!v8)
        return;
    }
    else
    {

    }
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "searchController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__UISearchContainerViewController__presentSearchControllerIfNecessary__block_invoke_2;
  v11[3] = &unk_1E16B3F40;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v9, "presentViewController:animated:completion:", v10, 0, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __70__UISearchContainerViewController__presentSearchControllerIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsPresentingSearchController:", 0);

}

- (void)_prepareForContainerTransition:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIViewController parentViewController](self, "parentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[UISearchContainerViewController _presentSearchControllerIfNecessary](self, "_presentSearchControllerIfNecessary");
}

- (BOOL)_transitionsChildViewControllers
{
  return 0;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchContainerViewController;
  -[UIViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", _UIBarsApplyChromelessEverywhere() ^ 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISearchContainerViewController;
  -[UIViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[UISearchContainerViewController _presentSearchControllerIfNecessary](self, "_presentSearchControllerIfNecessary");
  -[UISearchContainerViewController searchController](self, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_shouldLogAppearance:", 0);

  AnalyticsSendEventLazy();
}

id __49__UISearchContainerViewController_viewDidAppear___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  _UIPrivateMainBundleIdentifier();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    v4 = CFSTR("bundle_id");
    v5[0] = v0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchContainerViewController;
  -[UIViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
  AnalyticsSendEventLazy();
}

id __52__UISearchContainerViewController_viewDidDisappear___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  _UIPrivateMainBundleIdentifier();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    v4 = CFSTR("bundle_id");
    v5[0] = v0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)setTabBarObservedScrollView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v4 = a3;
  -[UISearchContainerViewController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_tvShouldScrollWithObservedScrollViewIfPossible");

  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchContainerViewController;
    -[UISearchContainerViewController setTabBarObservedScrollView:](&v7, sel_setTabBarObservedScrollView_, v4);
  }

}

- (BOOL)_isTVSearchControllerContainer
{
  return 0;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (BOOL)isPresentingSearchController
{
  return self->_isPresentingSearchController;
}

- (void)setIsPresentingSearchController:(BOOL)a3
{
  self->_isPresentingSearchController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
