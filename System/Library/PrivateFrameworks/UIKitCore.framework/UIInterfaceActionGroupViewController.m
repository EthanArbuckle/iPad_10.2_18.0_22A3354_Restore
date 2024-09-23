@implementation UIInterfaceActionGroupViewController

- (UIInterfaceActionGroupViewController)initWithActionGroup:(id)a3
{
  id v5;
  UIInterfaceActionGroupViewController *v6;
  UIInterfaceActionGroupViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIInterfaceActionGroupViewController;
  v6 = -[UIViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_actionGroup, a3);

  return v7;
}

- (void)reloadVisualStyle
{
  id v2;

  -[UIInterfaceActionGroupViewController actionGroupView](self, "actionGroupView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadVisualStyle");

}

- (void)setVisualStyleProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyleProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_visualStyleProvider, obj);
    -[UIInterfaceActionGroupViewController actionGroupView](self, "actionGroupView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVisualStyleProvider:", obj);

  }
}

- (UIInterfaceActionVisualStyleProviding)visualStyleProvider
{
  return (UIInterfaceActionVisualStyleProviding *)objc_loadWeakRetained((id *)&self->_visualStyleProvider);
}

- (UIInterfaceActionVisualStyle)visualStyle
{
  void *v2;
  void *v3;

  -[UIInterfaceActionGroupViewController actionGroupView](self, "actionGroupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIInterfaceActionVisualStyle *)v3;
}

- (id)defaultVisualStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[UIInterfaceActionGroupViewController actionGroupView](self, "actionGroupView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultVisualStyleForTraitCollection:presentationStyle:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)loadView
{
  UIInterfaceActionGroupView *v3;
  void *v4;
  void *v5;
  UIInterfaceActionGroupView *v6;
  UIInterfaceActionGroupView *actionGroupView;

  v3 = [UIInterfaceActionGroupView alloc];
  -[UIInterfaceActionGroupViewController actionGroup](self, "actionGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupViewController visualStyleProvider](self, "visualStyleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIInterfaceActionGroupView _initWithActionGroup:visualStyleProvider:actionHandlerInvocationDelegate:](v3, "_initWithActionGroup:visualStyleProvider:actionHandlerInvocationDelegate:", v4, v5, self);
  actionGroupView = self->_actionGroupView;
  self->_actionGroupView = v6;

  -[UIInterfaceActionGroupView setSpringLoaded:](self->_actionGroupView, "setSpringLoaded:", -[UIInterfaceActionGroupViewController isSpringLoaded](self, "isSpringLoaded"));
  -[UIViewController setView:](self, "setView:", self->_actionGroupView);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__UIInterfaceActionGroupViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E16B2150;
  v9[4] = self;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v9, 0);
  v8.receiver = self;
  v8.super_class = (Class)UIInterfaceActionGroupViewController;
  -[UIViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v7, v6);

}

uint64_t __98__UIInterfaceActionGroupViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadVisualStyle");
}

- (void)viewWillAppear:(BOOL)a3
{
  UIInterfaceActionGroupView *actionGroupView;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionGroupViewController;
  -[UIViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  actionGroupView = self->_actionGroupView;
  -[UIViewController transitionCoordinator](self, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView configureForPresentAlongsideTransitionCoordinator:](actionGroupView, "configureForPresentAlongsideTransitionCoordinator:", v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  UIInterfaceActionGroupView *actionGroupView;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionGroupViewController;
  -[UIViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  actionGroupView = self->_actionGroupView;
  -[UIViewController transitionCoordinator](self, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView configureForDismissAlongsideTransitionCoordinator:](actionGroupView, "configureForDismissAlongsideTransitionCoordinator:", v5);

}

- (void)setSpringLoaded:(BOOL)a3
{
  self->_springLoaded = a3;
  -[UIInterfaceActionGroupView setSpringLoaded:](self->_actionGroupView, "setSpringLoaded:");
}

- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id, char *);
  void (**v10)(_QWORD);
  char v11;

  v8 = a3;
  v9 = (void (**)(id, id, char *))a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = 1;
  if (v9 && (v9[2](v9, v8, &v11), !v11))
    v10[2](v10);
  else
    -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10);

}

- (BOOL)isSpringLoaded
{
  return self->_springLoaded;
}

- (UIInterfaceActionGroup)actionGroup
{
  return self->_actionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGroup, 0);
  objc_storeStrong((id *)&self->_actionGroupView, 0);
  objc_destroyWeak((id *)&self->_visualStyleProvider);
}

@end
