@implementation DOCTabbedBrowserView

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DOCTabbedBrowserView;
  -[DOCTabbedBrowserView willMoveToWindow:](&v8, "willMoveToWindow:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserView delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "tabbedBrowserView:willMoveToWindow:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserView delegate](self, "delegate"));
    objc_msgSend(v7, "tabbedBrowserView:willMoveToWindow:", self, v4);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)didMoveToWindow
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserView;
  -[DOCTabbedBrowserView didMoveToWindow](&v7, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserView delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "tabbedBrowserView:didMoveToWindow:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserView delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserView window](self, "window"));
    objc_msgSend(v5, "tabbedBrowserView:didMoveToWindow:", self, v6);

  }
}

- (DOCTabbedBrowserViewDelegate)delegate
{
  return (DOCTabbedBrowserViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
