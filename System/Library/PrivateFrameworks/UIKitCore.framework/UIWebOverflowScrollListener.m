@implementation UIWebOverflowScrollListener

- (UIWebOverflowScrollListener)initWithScrollView:(id)a3
{
  UIWebOverflowScrollListener *v4;
  UIWebOverflowScrollListener *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebOverflowScrollListener;
  v4 = -[UIWebOverflowScrollListener init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_scrollView = (UIWebOverflowScrollView *)a3;
    objc_msgSend(a3, "setDelegate:", v4);
  }
  return v5;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[UIWebBrowserView _overflowScrollView:willStartScrollingForNode:](-[UIWebOverflowScrollView webBrowserView](self->_scrollView, "webBrowserView", a3), "_overflowScrollView:willStartScrollingForNode:", self->_scrollView, -[UIWebOverflowScrollView node](self->_scrollView, "node"));
}

- (void)_didCompleteScrolling
{
  -[UIWebBrowserView _overflowScrollView:scrollOffsetChangedForNode:whileScrolling:](-[UIWebOverflowScrollView webBrowserView](self->_scrollView, "webBrowserView"), "_overflowScrollView:scrollOffsetChangedForNode:whileScrolling:", self->_scrollView, -[UIWebOverflowScrollView node](self->_scrollView, "node"), 0);
  -[UIWebBrowserView _overflowScrollView:didEndScrollingForNode:](-[UIWebOverflowScrollView webBrowserView](self->_scrollView, "webBrowserView"), "_overflowScrollView:didEndScrollingForNode:", self->_scrollView, -[UIWebOverflowScrollView node](self->_scrollView, "node"));
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[UIWebOverflowScrollListener _didCompleteScrolling](self, "_didCompleteScrolling", a3);
}

@end
