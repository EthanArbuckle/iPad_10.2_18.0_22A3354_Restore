@implementation SESDCKAssertion

- (SESDCKAssertion)initWithKeyIdentifier:(id)a3
{
  id v5;
  SESDCKAssertion *v6;
  SESDCKAssertion *v7;
  NSString *appletIdentifier;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SESDCKAssertion;
  v6 = -[SESDCKAssertion init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keyIdentifier, a3);
    appletIdentifier = v7->_appletIdentifier;
    v7->_appletIdentifier = (NSString *)CFSTR("A000000809434343444B417631");

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SESDCKAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SESDCKAssertion;
  -[SESDCKAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id v2;

  -[SESDCKAssertion synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate:", &__block_literal_global_309);

}

void __29__SESDCKAssertion_invalidate__block_invoke(uint64_t a1, void *a2)
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

void __29__SESDCKAssertion_invalidate__block_invoke_308(uint64_t a1, void *a2)
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
  -[SESDCKAssertion setProxy:](self, "setProxy:", 0);
}

- (id)proxy
{
  SESDCKAssertion *v2;
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
  SESDCKAssertion *obj;

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
  -[SESDCKAssertion proxy](self, "proxy");
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
