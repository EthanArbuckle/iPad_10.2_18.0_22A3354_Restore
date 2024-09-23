@implementation WLKNetworkRequestReauthCoordinator

+ (id)coordinator
{
  if (coordinator_onceToken != -1)
    dispatch_once(&coordinator_onceToken, &__block_literal_global_32);
  return (id)coordinator___coordinator;
}

void __49__WLKNetworkRequestReauthCoordinator_coordinator__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[WLKNetworkRequestReauthCoordinator _init]([WLKNetworkRequestReauthCoordinator alloc], "_init");
  v1 = (void *)coordinator___coordinator;
  coordinator___coordinator = (uint64_t)v0;

}

- (id)_init
{
  WLKNetworkRequestReauthCoordinator *v2;
  NSLock *v3;
  NSLock *lock;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WLKNetworkRequestReauthCoordinator;
  v2 = -[WLKNetworkRequestReauthCoordinator init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v2->_lock;
    v2->_lock = v3;

    -[NSLock setName:](v2->_lock, "setName:", CFSTR("WLKNetworkRequestRetryLock"));
    objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultConcurrentQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v2, CFSTR("operationCount"), 3, CFSTR("_WLKNetworkRequestReauthCoordinatorObservationContext"));

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultConcurrentQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("operationCount"));

  v4.receiver = self;
  v4.super_class = (Class)WLKNetworkRequestReauthCoordinator;
  -[WLKNetworkRequestReauthCoordinator dealloc](&v4, sel_dealloc);
}

- (void)markPrompt
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultConcurrentQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    -[WLKNetworkRequestReauthCoordinator setSessionPrompt:](self, "setSessionPrompt:", 1);
}

- (void)lock
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultConcurrentQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    -[NSLock lock](self->_lock, "lock");
}

- (void)unlock
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultConcurrentQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    -[NSLock unlock](self->_lock, "unlock");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  objc_super v8;

  if (a6 == CFSTR("_WLKNetworkRequestReauthCoordinatorObservationContext"))
  {
    objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8], a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "unsignedIntegerValue"))
      -[WLKNetworkRequestReauthCoordinator setSessionPrompt:](self, "setSessionPrompt:", 0);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WLKNetworkRequestReauthCoordinator;
    -[WLKNetworkRequestReauthCoordinator observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (BOOL)sessionPrompt
{
  return self->_sessionPrompt;
}

- (void)setSessionPrompt:(BOOL)a3
{
  self->_sessionPrompt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
