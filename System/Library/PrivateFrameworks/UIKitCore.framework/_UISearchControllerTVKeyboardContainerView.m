@implementation _UISearchControllerTVKeyboardContainerView

- (UIScrollView)observedScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_observedScrollView);
}

- (void)setObservedScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_observedScrollView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observedScrollView);
}

@end
