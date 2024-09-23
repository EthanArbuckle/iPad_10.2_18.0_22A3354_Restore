@implementation _UITextServicesResponderProxy

+ (id)_proxyWithResponder:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeWeak(v5 + 3, v4);

  return v5;
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
  -[_UITextServicesResponderProxy delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "canPerformAction:withSender:", a3, v6);

  return (char)a3;
}

- (void)_share:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UITextServicesResponderProxy delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_beginSessionWithType:sender:", 8, v4);

}

- (void)_addShortcut:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UITextServicesResponderProxy delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_beginSessionWithType:sender:", 4, v4);

}

- (void)_define:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UITextServicesResponderProxy delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_beginSessionWithType:sender:", 2, v4);

}

- (void)_lookup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UITextServicesResponderProxy delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_beginSessionWithType:sender:", 16, v4);

}

- (void)_translate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UITextServicesResponderProxy delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_beginSessionWithType:sender:", 32, v4);

}

- (UIResponder)responder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_responder);
}

- (_UITextServicesResponderProxyDelegate)delegate
{
  return (_UITextServicesResponderProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_responder);
}

@end
