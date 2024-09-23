@implementation PSUICoreTelephonyPostponementCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  return (id)sharedInstance_cacheInstance;
}

void __52__PSUICoreTelephonyPostponementCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUICoreTelephonyPostponementCache initPrivate]([PSUICoreTelephonyPostponementCache alloc], "initPrivate");
  v1 = (void *)sharedInstance_cacheInstance;
  sharedInstance_cacheInstance = (uint64_t)v0;

}

- (id)initPrivate
{
  PSUICoreTelephonyPostponementCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  CoreTelephonyClient *client;
  CTActivationPolicyState *activationPolicyState;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSUICoreTelephonyPostponementCache;
  v2 = -[PSUICoreTelephonyPostponementCache init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.preferences.coretelephony_client_postponement_queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v2->_queue);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v6;

    -[CoreTelephonyClient setDelegate:](v2->_client, "setDelegate:", v2);
    activationPolicyState = v2->_activationPolicyState;
    v2->_activationPolicyState = 0;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_willEnterForeground, *MEMORY[0x24BEBE008], 0);

  }
  return v2;
}

- (PSUICoreTelephonyPostponementCache)init
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  _PSGLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[PSUICoreTelephonyPostponementCache init]";
    _os_log_error_impl(&dword_22E024000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)willEnterForeground
{
  CTActivationPolicyState *activationPolicyState;

  activationPolicyState = self->_activationPolicyState;
  self->_activationPolicyState = 0;

}

- (void)fetchActivationPolicyState
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[PSUICoreTelephonyPostponementCache fetchActivationPolicyState]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_22E024000, a2, OS_LOG_TYPE_ERROR, "%s fetch failed: %@", (uint8_t *)&v2, 0x16u);
}

- (id)getActivationPolicyState
{
  void *v3;
  PSUICoreTelephonyPostponementCache *v4;
  void *v5;

  -[PSUICoreTelephonyPostponementCache activationPolicyState](self, "activationPolicyState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PSUICoreTelephonyPostponementCache fetchActivationPolicyState](self, "fetchActivationPolicyState");
  v4 = self;
  objc_sync_enter(v4);
  -[PSUICoreTelephonyPostponementCache activationPolicyState](v4, "activationPolicyState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v5;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (CTActivationPolicyState)activationPolicyState
{
  return (CTActivationPolicyState *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActivationPolicyState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationPolicyState, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
