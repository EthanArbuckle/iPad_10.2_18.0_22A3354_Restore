@implementation VSJSMessagePort

- (void)postMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  VSScriptSecurityOrigin *v15;

  v4 = a3;
  v15 = objc_alloc_init(VSScriptSecurityOrigin);
  v5 = objc_alloc(MEMORY[0x24BDD1808]);
  -[IKJSObject appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "app");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appJSURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithURL:resolvingAgainstBaseURL:", v8, 1);

  objc_msgSend(v9, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptSecurityOrigin setScheme:](v15, "setScheme:", v10);

  objc_msgSend(v9, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptSecurityOrigin setHost:](v15, "setHost:", v11);

  objc_msgSend(v9, "port");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptSecurityOrigin setPort:](v15, "setPort:", objc_msgSend(v12, "integerValue"));

  VSScriptMessageForValueFromContextWithOrigin(v4, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[VSJSMessagePort delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messagePort:didReceiveMessage:", self, v13);

  }
}

- (VSJSMessagePortDelegate)delegate
{
  return (VSJSMessagePortDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
