@implementation SWWeakScriptMessageHandler

- (SWWeakScriptMessageHandler)initWithScriptMessageHandler:(id)a3
{
  id v4;
  SWWeakScriptMessageHandler *v5;
  SWWeakScriptMessageHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SWWeakScriptMessageHandler;
  v5 = -[SWWeakScriptMessageHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scriptMessageHandler, v4);

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SWWeakScriptMessageHandler scriptMessageHandler](self, "scriptMessageHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userContentController:didReceiveScriptMessage:", v7, v6);

}

- (WKScriptMessageHandler)scriptMessageHandler
{
  return (WKScriptMessageHandler *)objc_loadWeakRetained((id *)&self->_scriptMessageHandler);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scriptMessageHandler);
}

@end
