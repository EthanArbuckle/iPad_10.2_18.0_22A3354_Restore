@implementation _UIWebViewScrollViewDelegateForwarder

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIWebViewScrollViewDelegateForwarder;
  result = -[_UIWebViewScrollViewDelegateForwarder methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result)
  {
    result = (id)-[UIWebView methodSignatureForSelector:](self->_webView, "methodSignatureForSelector:", a3);
    if (!result)
      return (id)-[UIScrollViewDelegate methodSignatureForSelector:](self->_delegate, "methodSignatureForSelector:", a3);
  }
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIWebViewScrollViewDelegateForwarder;
  if (-[_UIWebViewScrollViewDelegateForwarder respondsToSelector:](&v5, sel_respondsToSelector_)
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (void)forwardInvocation:(id)a3
{
  char v5;
  objc_super v6;

  objc_msgSend(a3, "selector");
  v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) != 0)
    objc_msgSend(a3, "invokeWithTarget:", self->_webView);
  objc_msgSend(a3, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "invokeWithTarget:", self->_delegate);
  }
  else if ((v5 & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIWebViewScrollViewDelegateForwarder;
    -[_UIWebViewScrollViewDelegateForwarder forwardInvocation:](&v6, sel_forwardInvocation_, a3);
  }
}

- (UIScrollViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (UIScrollViewDelegate *)a3;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  self->_webView = (UIWebView *)a3;
}

@end
