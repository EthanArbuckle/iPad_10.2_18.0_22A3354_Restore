@implementation SESAssertion

- (SESAssertion)initWithKeyIdentifier:(id)a3 appletIdentifier:(id)a4
{
  id v7;
  id v8;
  SESAssertion *v9;
  SESAssertion *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SESAssertion;
  v9 = -[SESAssertion init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyIdentifier, a3);
    objc_storeStrong((id *)&v10->_appletIdentifier, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SESAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SESAssertion;
  -[SESAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id v2;

  -[SESAssertion synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_9);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate:", &__block_literal_global_307);

}

void __26__SESAssertion_invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    SESDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_20A048000, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __26__SESAssertion_invalidate__block_invoke_306(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    SESDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_20A048000, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)didInvalidate
{
  -[SESAssertion setProxy:](self, "setProxy:", 0);
}

- (id)proxy
{
  SESAssertion *v2;
  SESAssertionInterface *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_proxy;
  objc_sync_exit(v2);

  return v3;
}

- (void)setProxy:(id)a3
{
  SESAssertionInterface *v4;
  SESAssertionInterface *proxy;
  SESAssertion *obj;

  v4 = (SESAssertionInterface *)a3;
  obj = self;
  objc_sync_enter(obj);
  proxy = obj->_proxy;
  obj->_proxy = v4;

  objc_sync_exit(obj);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  -[SESAssertion proxy](self, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    SESDefaultLogObject();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);

  }
  return v6;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
