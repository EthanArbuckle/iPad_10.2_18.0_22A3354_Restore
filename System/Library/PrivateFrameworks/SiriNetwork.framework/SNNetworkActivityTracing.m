@implementation SNNetworkActivityTracing

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sSharedInstance;
}

void __42__SNNetworkActivityTracing_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SNNetworkActivityTracing _init]([SNNetworkActivityTracing alloc], "_init");
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

- (id)_init
{
  SNNetworkActivityTracing *v2;
  uint64_t v3;
  SNNetworkActivityTracingInternal *underlyingNetworkActivityTracingInternal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SNNetworkActivityTracing;
  v2 = -[SNNetworkActivityTracing init](&v6, sel_init);
  if (v2)
  {
    +[SNNetworkActivityTracingInternal shared](SNNetworkActivityTracingInternal, "shared");
    v3 = objc_claimAutoreleasedReturnValue();
    underlyingNetworkActivityTracingInternal = v2->_underlyingNetworkActivityTracingInternal;
    v2->_underlyingNetworkActivityTracingInternal = (SNNetworkActivityTracingInternal *)v3;

  }
  return v2;
}

- (void)networkActivityStart:(int64_t)a3 activate:(BOOL)a4 completion:(id)a5
{
  -[SNNetworkActivityTracingInternal startWithLabel:activate:completion:](self->_underlyingNetworkActivityTracingInternal, "startWithLabel:activate:completion:", a3, a4, a5);
}

- (void)networkActivityActivate:(int64_t)a3 completion:(id)a4
{
  -[SNNetworkActivityTracingInternal activateWithLabel:completion:](self->_underlyingNetworkActivityTracingInternal, "activateWithLabel:completion:", a3, a4);
}

- (void)networkActivityStop:(int64_t)a3 withReason:(int64_t)a4 andError:(id)a5 completion:(id)a6
{
  -[SNNetworkActivityTracingInternal stopWithLabel:reason:error:completion:](self->_underlyingNetworkActivityTracingInternal, "stopWithLabel:reason:error:completion:", a3, a4, a5, a6);
}

- (void)networkActivityTracingCancel:(id)a3
{
  -[SNNetworkActivityTracingInternal tracingCancelWithCompletion:](self->_underlyingNetworkActivityTracingInternal, "tracingCancelWithCompletion:", a3);
}

- (void)currentNetworkActivityTokenWithCompletion:(id)a3
{
  -[SNNetworkActivityTracingInternal currentNetworkActivityToken:](self->_underlyingNetworkActivityTracingInternal, "currentNetworkActivityToken:", a3);
}

- (SNNetworkActivityTracingInternal)underlyingNetworkActivityTracingInternal
{
  return self->_underlyingNetworkActivityTracingInternal;
}

- (void)setUnderlyingNetworkActivityTracingInternal:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingNetworkActivityTracingInternal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingNetworkActivityTracingInternal, 0);
}

@end
