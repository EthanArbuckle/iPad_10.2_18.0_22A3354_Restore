@implementation _BEWKUserContentControllerScriptMessageHandlerProxy

- (_BEWKUserContentControllerScriptMessageHandlerProxy)initWithHandler:(id)a3
{
  id v4;
  _BEWKUserContentControllerScriptMessageHandlerProxy *v5;
  _BEWKUserContentControllerScriptMessageHandlerProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BEWKUserContentControllerScriptMessageHandlerProxy;
  v5 = -[_BEWKUserContentControllerScriptMessageHandlerProxy init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_handler, v4);

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[_BEWKUserContentControllerScriptMessageHandlerProxy handler](self, "handler"));
  objc_msgSend(v8, "userContentController:didReceiveScriptMessage:", v7, v6);

}

- (WKScriptMessageHandler)handler
{
  return (WKScriptMessageHandler *)objc_loadWeakRetained((id *)&self->_handler);
}

- (void)setHandler:(id)a3
{
  objc_storeWeak((id *)&self->_handler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_handler);
}

@end
