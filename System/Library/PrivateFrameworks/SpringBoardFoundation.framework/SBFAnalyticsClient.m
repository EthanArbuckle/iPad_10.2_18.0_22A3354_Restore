@implementation SBFAnalyticsClient

- (void)emitEvent:(unint64_t)a3 withPayload:(id)a4
{
  SBFAnalyticsBackend *backend;
  id v7;
  SBAnalyticsContextProvider *v8;

  backend = self->_backend;
  v7 = a4;
  v8 = -[SBAnalyticsContextProvider initWithEventPayload:backend:]([SBAnalyticsContextProvider alloc], "initWithEventPayload:backend:", v7, self->_backend);

  -[SBFAnalyticsBackend handleEvent:withContext:](backend, "handleEvent:withContext:", a3, v8);
}

- (void)emitEvent:(unint64_t)a3
{
  -[SBFAnalyticsClient emitEvent:withPayload:](self, "emitEvent:withPayload:", a3, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_14);
  return (id)sharedInstance___client;
}

void __36__SBFAnalyticsClient_sharedInstance__block_invoke()
{
  SBFAnalyticsClient *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SBFAnalyticsClient alloc];
  +[SBFAnalyticsBackend sharedInstance](SBFAnalyticsBackend, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SBFAnalyticsClient initWithBackend:](v0, "initWithBackend:", v3);
  v2 = (void *)sharedInstance___client;
  sharedInstance___client = v1;

}

- (SBFAnalyticsClient)initWithBackend:(id)a3
{
  id v5;
  SBFAnalyticsClient *v6;
  SBFAnalyticsClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFAnalyticsClient;
  v6 = -[SBFAnalyticsClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backend, a3);

  return v7;
}

- (void)registerForQueryName:(unint64_t)a3 handler:(id)a4
{
  -[SBFAnalyticsBackend registerForQueryName:handler:](self->_backend, "registerForQueryName:handler:", a3, a4);
}

- (void)setSignificantTimeChangedNotificationName:(id)a3
{
  void *v4;
  id v5;
  NSString *v6;
  NSString *significantTimeChangedNotificationName;
  id v8;

  if (self->_significantTimeChangedNotificationName != a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, self->_significantTimeChangedNotificationName, 0);
    v6 = (NSString *)objc_msgSend(v5, "copy");

    significantTimeChangedNotificationName = self->_significantTimeChangedNotificationName;
    self->_significantTimeChangedNotificationName = v6;

    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__noteSignificantTimeChanged_, self->_significantTimeChangedNotificationName, 0);
  }
}

- (void)_noteSignificantTimeChanged:(id)a3
{
  -[SBFAnalyticsClient emitEvent:](self, "emitEvent:", 11);
}

- (NSString)significantTimeChangedNotificationName
{
  return self->_significantTimeChangedNotificationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantTimeChangedNotificationName, 0);
  objc_storeStrong((id *)&self->_backend, 0);
}

@end
