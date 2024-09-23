@implementation SiriCoreNWContext

- (SiriCoreNWContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SiriCoreNWContext.m"), 29, CFSTR("%s is marked as NS_UNAVAILABLE. Use the designated initializer instead."), "-[SiriCoreNWContext init]");

  return 0;
}

- (id)_init
{
  SiriCoreNWContext *v2;
  uint64_t v3;
  OS_nw_context *context;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriCoreNWContext;
  v2 = -[SiriCoreNWContext init](&v6, sel_init);
  if (v2)
  {
    v3 = nw_context_create();
    context = v2->_context;
    v2->_context = (OS_nw_context *)v3;

    nw_context_set_scheduling_mode();
    nw_context_set_isolate_protocol_stack();
    nw_context_set_privacy_level();
    nw_context_set_isolate_protocol_cache();
  }
  return v2;
}

- (id)nwContext
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_658);
  return (id)sharedInstance_sSharedInstance;
}

void __35__SiriCoreNWContext_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SiriCoreNWContext _init]([SiriCoreNWContext alloc], "_init");
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

@end
