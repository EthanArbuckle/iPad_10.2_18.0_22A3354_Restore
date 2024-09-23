@implementation WFEditorDrawerViewController

- (WFEditorDrawerViewController)initWithHome:(id)a3 workflow:(id)a4 actionSuggester:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  WFEditorDrawerViewController *v14;
  WFEditorDrawerViewController *v15;
  WFEditorDrawerViewController *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEditorDrawerViewController.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEditorDrawerViewController.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionSuggester"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)WFEditorDrawerViewController;
  v14 = -[WFEditorDrawerViewController init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a3);
    objc_storeStrong((id *)&v15->_workflow, a4);
    objc_storeStrong((id *)&v15->_actionSuggester, a5);
    v16 = v15;
  }

  return v15;
}

- (void)loadView
{
  void *v3;
  WFEditorDrawerHostingViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  WFEditorDrawerHostingViewController *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  WFEditorDrawerHostingViewController *hostingViewController;
  void *v26;
  id v27;

  v3 = (void *)objc_opt_new();
  -[WFEditorDrawerViewController setView:](self, "setView:", v3);

  v4 = [WFEditorDrawerHostingViewController alloc];
  -[WFEditorDrawerViewController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditorDrawerViewController workflow](self, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditorDrawerViewController actionSuggester](self, "actionSuggester");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFEditorDrawerHostingViewController initWithHome:workflow:actionSuggester:](v4, "initWithHome:workflow:actionSuggester:", v5, v6, v7);

  -[WFEditorDrawerViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditorDrawerHostingViewController setDelegate:](v8, "setDelegate:", v9);

  -[WFEditorDrawerHostingViewController setNavigationStyle:](v8, "setNavigationStyle:", -[WFEditorDrawerViewController navigationStyle](self, "navigationStyle"));
  -[WFEditorDrawerHostingViewController setScrollViewObserver:](v8, "setScrollViewObserver:", self);
  -[WFEditorDrawerViewController addChildViewController:](self, "addChildViewController:", v8);
  -[WFEditorDrawerViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[WFEditorDrawerHostingViewController view](v8, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditorDrawerHostingViewController view](v8, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBackgroundColor:", v20);

  -[WFEditorDrawerHostingViewController view](v8, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAutoresizingMask:", 18);

  -[WFEditorDrawerViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditorDrawerHostingViewController view](v8, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v24);

  -[WFEditorDrawerHostingViewController didMoveToParentViewController:](v8, "didMoveToParentViewController:", self);
  hostingViewController = self->_hostingViewController;
  self->_hostingViewController = v8;

  -[UIViewController wf_drawerItem](self, "wf_drawerItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFauxHeaderHeight:", 68.0);

  -[WFEditorDrawerViewController view](self, "view");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityIdentifier:", CFSTR("editor.drawer"));

}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[WFEditorDrawerViewController hostingViewController](self, "hostingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentScrollViewForEdge:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setDelegate:(id)a3
{
  WFActionDrawerDelegate **p_delegate;
  id v5;
  id v6;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  -[WFEditorDrawerViewController hostingViewController](self, "hostingViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

}

- (void)setNavigationStyle:(unint64_t)a3
{
  id v4;

  self->_navigationStyle = a3;
  -[WFEditorDrawerViewController hostingViewController](self, "hostingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationStyle:", a3);

}

- (void)focusSearchBar
{
  id v2;

  -[WFEditorDrawerViewController hostingViewController](self, "hostingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusSearchBar");

}

- (void)clearSearchBar
{
  id v2;

  -[WFEditorDrawerViewController hostingViewController](self, "hostingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSearchBar");

}

- (void)performScrollingTest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFEditorDrawerViewController hostingViewController](self, "hostingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performScrollingTest:", v4);

}

- (void)didTransitionToVisibility:(unint64_t)a3
{
  id v4;

  -[WFEditorDrawerViewController hostingViewController](self, "hostingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTransitionToVisibility:", a3);

}

- (void)activeScrollViewDidChange
{
  void *v3;
  void *v4;
  WFEditorDrawerScrollViewDelegate *v5;
  void *v6;
  WFEditorDrawerScrollViewDelegate *v7;
  WFEditorDrawerScrollViewDelegate *scrollViewDelegate;
  void *v9;
  id v10;

  -[UIViewController wf_drawerItem](self, "wf_drawerItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[WFEditorDrawerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFEditorDrawerScrollViewDelegate findScrollViewInView:](WFEditorDrawerScrollViewDelegate, "findScrollViewInView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v4)
  {
    v5 = [WFEditorDrawerScrollViewDelegate alloc];
    objc_msgSend(v4, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFEditorDrawerScrollViewDelegate initWithDrawerItem:originalDelegate:](v5, "initWithDrawerItem:originalDelegate:", v10, v6);
    scrollViewDelegate = self->_scrollViewDelegate;
    self->_scrollViewDelegate = v7;

    -[WFEditorDrawerViewController scrollViewDelegate](self, "scrollViewDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v9);
  }
  else
  {
    v9 = self->_scrollViewDelegate;
    self->_scrollViewDelegate = 0;
  }

}

- (WFActionDrawerDelegate)delegate
{
  return (WFActionDrawerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)navigationStyle
{
  return self->_navigationStyle;
}

- (HMHome)home
{
  return self->_home;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (WFContextualActionSuggester)actionSuggester
{
  return self->_actionSuggester;
}

- (WFEditorDrawerHostingViewController)hostingViewController
{
  return self->_hostingViewController;
}

- (WFEditorDrawerScrollViewDelegate)scrollViewDelegate
{
  return self->_scrollViewDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewDelegate, 0);
  objc_storeStrong((id *)&self->_hostingViewController, 0);
  objc_storeStrong((id *)&self->_actionSuggester, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
