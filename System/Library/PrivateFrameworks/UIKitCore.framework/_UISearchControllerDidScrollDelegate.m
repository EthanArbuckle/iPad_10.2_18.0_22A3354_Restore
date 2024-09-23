@implementation _UISearchControllerDidScrollDelegate

- (void)_didScroll
{
  void *v3;
  char v4;
  id v5;

  -[_UISearchControllerDidScrollDelegate controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UISearchControllerDidScrollDelegate controller](self, "controller");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_didScroll");

  }
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_UISearchControllerDidScrollDelegate controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_UISearchControllerDidScrollDelegate controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_observeScrollViewDidScroll:", v7);

  }
}

- (_UIScrollViewScrollObserver_Internal)controller
{
  return (_UIScrollViewScrollObserver_Internal *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_controller);
}

@end
