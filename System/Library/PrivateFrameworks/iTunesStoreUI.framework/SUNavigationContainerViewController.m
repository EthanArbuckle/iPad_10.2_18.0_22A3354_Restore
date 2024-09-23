@implementation SUNavigationContainerViewController

- (SUNavigationContainerViewController)initWithChildViewController:(id)a3
{
  id v4;
  SUNavigationContainerViewController *v5;
  id v6;
  void *v7;
  void *v8;
  AMSBinaryPromise *v9;
  AMSBinaryPromise *appearancePromise;
  void *v11;
  void *v12;
  SUNavigationContainerViewController *v13;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)SUNavigationContainerViewController;
    v5 = -[SUViewController init](&v15, sel_init);
    if (v5)
    {
      v6 = v4;
      objc_msgSend(v6, "parentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "willMoveToParentViewController:", 0);
        objc_msgSend(v6, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        objc_msgSend(v6, "removeFromParentViewController");
      }
      v9 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x24BE08078]);
      appearancePromise = v5->_appearancePromise;
      v5->_appearancePromise = v9;

      -[SUNavigationContainerViewController addChildViewController:](v5, "addChildViewController:", v6);
      -[SUNavigationContainerViewController view](v5, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v12);

      objc_msgSend(v6, "didMoveToParentViewController:", v5);
    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUNavigationContainerViewController;
  -[SUNavigationContainerViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SUNavigationContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUNavigationContainerViewController;
  -[SUNavigationContainerViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  -[SUNavigationContainerViewController embeddedViewController](self, "embeddedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUNavigationContainerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUNavigationContainerViewController;
  -[SUViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[SUNavigationContainerViewController appearancePromise](self, "appearancePromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithSuccess");

  if (-[SUNavigationContainerViewController shouldRunPopHandler](self, "shouldRunPopHandler"))
  {
    -[SUNavigationContainerViewController setShouldRunPopHandler:](self, "setShouldRunPopHandler:", 0);
    -[SUNavigationContainerViewController popHandler](self, "popHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SUNavigationContainerViewController popHandler](self, "popHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, SUNavigationContainerViewController *))v6)[2](v6, self);

    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SUNavigationContainerViewController *v6;
  _BOOL8 v7;
  objc_super v8;

  v3 = a3;
  -[UIViewController su_closestNavigationController](self, "su_closestNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (SUNavigationContainerViewController *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != self;

  -[SUNavigationContainerViewController setShouldRunPopHandler:](self, "setShouldRunPopHandler:", v7);
  v8.receiver = self;
  v8.super_class = (Class)SUNavigationContainerViewController;
  -[SUViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  objc_super v6;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE08078]);
  -[SUNavigationContainerViewController setAppearancePromise:](self, "setAppearancePromise:", v5);

  v6.receiver = self;
  v6.super_class = (Class)SUNavigationContainerViewController;
  -[SUViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)setEmbeddedViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  id v23;
  SUNavigationContainerViewController *v24;
  void (**v25)(_QWORD);

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[SUNavigationContainerViewController embeddedViewController](self, "embeddedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v12 = v11;
  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDF6F98]);
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

  }
  objc_msgSend(v12, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  objc_msgSend(v15, "setFrame:");

  objc_msgSend(v10, "willMoveToParentViewController:", 0);
  if (a4)
  {
    -[SUNavigationContainerViewController addChildViewController:](self, "addChildViewController:", v12);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __85__SUNavigationContainerViewController_setEmbeddedViewController_animated_completion___block_invoke_2;
    v21[3] = &unk_24DE7CF40;
    v22 = v10;
    v23 = v12;
    v24 = self;
    v25 = v9;
    v20.receiver = self;
    v20.super_class = (Class)SUNavigationContainerViewController;
    -[SUNavigationContainerViewController transitionFromViewController:toViewController:duration:options:animations:completion:](&v20, sel_transitionFromViewController_toViewController_duration_options_animations_completion_, v22, v23, 5242880, &__block_literal_global_9, v21, 0.5);

  }
  else
  {
    objc_msgSend(v10, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeFromSuperview");

    objc_msgSend(v10, "removeFromParentViewController");
    -[SUNavigationContainerViewController addChildViewController:](self, "addChildViewController:", v12);
    -[SUNavigationContainerViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

    objc_msgSend(v12, "didMoveToParentViewController:", self);
    if (v9)
      v9[2](v9);
  }

}

uint64_t __85__SUNavigationContainerViewController_setEmbeddedViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 40), "didMoveToParentViewController:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (UIViewController)embeddedViewController
{
  void *v2;
  void *v3;

  -[SUNavigationContainerViewController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (AMSBinaryPromise)appearancePromise
{
  return self->_appearancePromise;
}

- (void)setAppearancePromise:(id)a3
{
  objc_storeStrong((id *)&self->_appearancePromise, a3);
}

- (BOOL)bridgedNavigation
{
  return self->_bridgedNavigation;
}

- (void)setBridgedNavigation:(BOOL)a3
{
  self->_bridgedNavigation = a3;
}

- (id)popHandler
{
  return self->_popHandler;
}

- (void)setPopHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (BOOL)shouldRunPopHandler
{
  return self->_shouldRunPopHandler;
}

- (void)setShouldRunPopHandler:(BOOL)a3
{
  self->_shouldRunPopHandler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_popHandler, 0);
  objc_storeStrong((id *)&self->_appearancePromise, 0);
}

@end
