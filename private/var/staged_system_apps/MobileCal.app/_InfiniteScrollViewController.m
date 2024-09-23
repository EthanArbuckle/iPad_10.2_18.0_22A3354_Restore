@implementation _InfiniteScrollViewController

- (void)viewDidLayoutSubviews
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_InfiniteScrollViewController delegate](self, "delegate"));
  objc_msgSend(v2, "scrollViewDidLayoutSubviews");

}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_InfiniteScrollViewController;
  -[_InfiniteScrollViewController viewSafeAreaInsetsDidChange](&v4, "viewSafeAreaInsetsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_InfiniteScrollViewController delegate](self, "delegate"));
  objc_msgSend(v3, "scrollViewSafeAreasDidChange");

}

- (_InfiniteScrollViewControllerDelegate)delegate
{
  return (_InfiniteScrollViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
