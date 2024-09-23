@implementation _UISplitViewControllerColumnContents

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (UIViewController)navigationControllerWrapper
{
  return self->_navigationControllerWrapper;
}

- (UIViewController)viewController
{
  UIViewController *viewController;
  UIViewController *p_super;
  UIViewController *v4;
  UIViewController *v6;

  viewController = self->_viewController;
  if (viewController)
  {
    p_super = viewController;
    v4 = p_super;
  }
  else
  {
    -[UINavigationController topViewController](self->_navigationController, "topViewController");
    p_super = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v4 = p_super;
    if (!p_super)
      p_super = &self->_navigationController->super;
  }
  v6 = p_super;

  return v6;
}

- (_UISplitViewControllerColumnContents)initWithViewController:(id)a3 navigationController:(id)a4 navigationControllerWrapper:(id)a5
{
  unint64_t v9;
  unint64_t v10;
  id v11;
  _UISplitViewControllerColumnContents *v12;
  id *p_isa;
  _UISplitViewControllerColumnContents *v14;
  objc_super v16;

  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  if (v9 | v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)_UISplitViewControllerColumnContents;
    v12 = -[_UISplitViewControllerColumnContents init](&v16, sel_init);
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_viewController, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[_UISplitViewControllerColumnContents initWithViewController:navigationController:] requires at least one of viewController or navigationController to be non-nil"));
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationControllerWrapper, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISplitViewControllerColumnContents;
  -[_UISplitViewControllerColumnContents description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UISplitViewControllerColumnContents viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" viewController=%p"), v5);

  if (self->_navigationController)
    objc_msgSend(v4, "appendFormat:", CFSTR(" navController=%p"), self->_navigationController);
  if (self->_navigationControllerWrapper)
    objc_msgSend(v4, "appendFormat:", CFSTR(" navWrapper=%p"), self->_navigationControllerWrapper);
  return v4;
}

@end
