@implementation NetworkProvider

- (NetworkProvider)init
{
  NetworkProvider *v2;
  NWPathEvaluator *v3;
  NWPathEvaluator *networkPathEvaluator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NetworkProvider;
  v2 = -[NetworkProvider init](&v6, "init");
  if (v2)
  {
    if (!objc_opt_class(NWPathEvaluator)
      || (v3 = (NWPathEvaluator *)objc_alloc_init((Class)NWPathEvaluator),
          networkPathEvaluator = v2->_networkPathEvaluator,
          v2->_networkPathEvaluator = v3,
          networkPathEvaluator,
          !v2->_networkPathEvaluator))
    {

      return 0;
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  id v2;
  NetworkProvider *v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!sharedInstance_networkProvider)
  {
    v3 = objc_alloc_init(NetworkProvider);
    v4 = (void *)sharedInstance_networkProvider;
    sharedInstance_networkProvider = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (id)sharedInstance_networkProvider;
}

- (BOOL)networkReachable
{
  NWPathEvaluator *v2;
  id v3;
  id v4;

  v2 = -[NetworkProvider networkPathEvaluator](self, "networkPathEvaluator");
  v3 = -[NWPathEvaluator path](v2, "path");
  v4 = objc_msgSend(v3, "status");

  return (((unint64_t)v4 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (NWPathEvaluator)networkPathEvaluator
{
  return self->_networkPathEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkPathEvaluator, 0);
}

@end
