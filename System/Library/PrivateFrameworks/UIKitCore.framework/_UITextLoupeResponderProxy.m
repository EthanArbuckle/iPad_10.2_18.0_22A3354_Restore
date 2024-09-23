@implementation _UITextLoupeResponderProxy

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)_proxyWithResponder:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeWeak(v5 + 3, v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_responder);
}

- (id)nextResponder
{
  return objc_loadWeakRetained((id *)&self->_responder);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[_UITextLoupeResponderProxy delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "canPerformAction:withSender:", a3, v6);

  return (char)a3;
}

- (UIResponder)responder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_responder);
}

- (_UITextLoupeResponderProxyDelegate)delegate
{
  return (_UITextLoupeResponderProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
