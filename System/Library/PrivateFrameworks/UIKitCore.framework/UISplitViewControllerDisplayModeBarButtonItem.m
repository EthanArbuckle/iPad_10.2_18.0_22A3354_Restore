@implementation UISplitViewControllerDisplayModeBarButtonItem

- (id)target
{
  objc_super v4;

  -[UISplitViewControllerDisplayModeBarButtonItem _wasUsed](self, "_wasUsed");
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerDisplayModeBarButtonItem;
  -[UIBarButtonItem target](&v4, sel_target);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_wasUsed
{
  id v3;

  if (!self->_hasBeenUsed)
  {
    self->_hasBeenUsed = 1;
    -[UISplitViewControllerDisplayModeBarButtonItem _impl](self, "_impl");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_displayModeBarButtonItemWasUsedForFirstTime:", self);

  }
}

- (UISplitViewControllerImpl)_impl
{
  return (UISplitViewControllerImpl *)objc_loadWeakRetained((id *)&self->_impl);
}

- (void)_setImpl:(id)a3
{
  objc_storeWeak((id *)&self->_impl, a3);
}

- (void)_setOwningNavigationItem:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[UIBarButtonItem _owningNavigationItem](self, "_owningNavigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)UISplitViewControllerDisplayModeBarButtonItem;
  -[UIBarButtonItem _setOwningNavigationItem:](&v6, sel__setOwningNavigationItem_, v4);

  if (v4 && !v5)
    -[UISplitViewControllerDisplayModeBarButtonItem _wasUsed](self, "_wasUsed");

}

- (SEL)action
{
  objc_super v4;

  -[UISplitViewControllerDisplayModeBarButtonItem _wasUsed](self, "_wasUsed");
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerDisplayModeBarButtonItem;
  return -[UIBarButtonItem action](&v4, sel_action);
}

- (BOOL)_hasBeenUsed
{
  return self->_hasBeenUsed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_impl);
}

@end
