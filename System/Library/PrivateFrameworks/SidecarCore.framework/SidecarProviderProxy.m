@implementation SidecarProviderProxy

- (SidecarProviderProxy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SidecarProviderProxy;
  return -[SidecarProviderProxy init](&v3, sel_init);
}

- (void)sidecarSessionStarted:(id)a3
{
  objc_msgSend(a3, "setDelegate:", self);
}

- (void)sidecarSession:(id)a3 receivedMessage:(id)a4
{
  SidecarServiceProviderDelegate **p_delegate;
  id v6;
  id v7;
  SidecarResponse *v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = -[SidecarRequest initWithSession:message:]([SidecarResponse alloc], "initWithSession:message:", v7, v6);

  -[SidecarRequest setDelegate:](v8, "setDelegate:", WeakRetained);
  objc_msgSend(v7, "setDelegate:", v8);
  -[SidecarRequest sidecarSessionStarted:](v8, "sidecarSessionStarted:", v7);

  objc_msgSend(WeakRetained, "sidecarServiceProviderHandleRequest:", v8);
}

- (void)sidecarServiceTerminate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sidecarServiceProviderTerminate");

}

- (SidecarServiceProviderDelegate)delegate
{
  return (SidecarServiceProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

+ (SidecarProviderProxy)defaultProxy
{
  if (defaultProxy_once != -1)
    dispatch_once(&defaultProxy_once, &__block_literal_global_268);
  return (SidecarProviderProxy *)(id)defaultProxy_proxy;
}

void __36__SidecarProviderProxy_defaultProxy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultProxy_proxy;
  defaultProxy_proxy = v0;

}

@end
