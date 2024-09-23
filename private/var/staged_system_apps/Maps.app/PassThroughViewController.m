@implementation PassThroughViewController

- (void)loadView
{
  PassThroughView *v3;

  v3 = -[PassThroughView initWithFrame:]([PassThroughView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[PassThroughView setDelegate:](v3, "setDelegate:", self);
  -[PassThroughViewController setView:](self, "setView:", v3);

}

- (UIView)passThroughView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "passThroughView"));

  return (UIView *)v3;
}

- (void)setTargetView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PassThroughViewController view](self, "view"));
  objc_msgSend(v5, "setTargetView:", v4);

}

- (UIView)targetView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "targetView"));

  return (UIView *)v3;
}

- (void)passThroughView:(id)a3 didMoveToView:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PassThroughViewController viewIfLoaded](self, "viewIfLoaded"));

  if (v7 == v6)
  {
    if (a4)
    {
      self->_hasParentView = 1;
      -[PassThroughViewController viewDidMoveToParent](self, "viewDidMoveToParent");
    }
    else
    {
      self->_hasParentView = 0;
      -[PassThroughViewController viewDidRemoveFromParent](self, "viewDidRemoveFromParent");
    }
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PassThroughViewController;
  v4 = a3;
  -[PassThroughViewController didMoveToParentViewController:](&v5, "didMoveToParentViewController:", v4);
  -[PassThroughViewController _reloadAXIdentifierWithParentViewController:](self, "_reloadAXIdentifierWithParentViewController:", v4, v5.receiver, v5.super_class);

}

- (void)_reloadAXIdentifierWithParentViewController:(id)a3
{
  id v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class(v4);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>.%@<%p>"), v7, v13, v10, self));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughViewController view](self, "view"));
    objc_msgSend(v12, "setAccessibilityIdentifier:", v11);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughViewController view](self, "view"));
    objc_msgSend(v7, "setAccessibilityIdentifier:", 0);
  }

}

- (PassThroughViewControllerDelegate)delegate
{
  return (PassThroughViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasParentView
{
  return self->_hasParentView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
