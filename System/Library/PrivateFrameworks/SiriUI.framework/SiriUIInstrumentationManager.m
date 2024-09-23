@implementation SiriUIInstrumentationManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  return (id)sharedManager_sharedManager;
}

void __45__SiriUIInstrumentationManager_sharedManager__block_invoke()
{
  SiriUIInstrumentationManager *v0;
  void *v1;

  v0 = objc_alloc_init(SiriUIInstrumentationManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (SiriUIInstrumentationManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriUIInstrumentationManager;
  return -[SiriUIInstrumentationManager init](&v3, sel_init);
}

- (AFAnalyticsTurnBasedInstrumentationContext)currentInstrumentationTurnContext
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEA8640], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInstrumentationTurnContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AFAnalyticsTurnBasedInstrumentationContext *)v3;
}

- (void)storeCurrentInstrumentationTurnContext:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BEA8640];
  v4 = a3;
  objc_msgSend(v3, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeCurrentInstrumentationTurnContext:", v4);

}

- (void)emitUUFRPresentedEventWith:(id)a3 snippetClass:(id)a4 dialogIdentifier:(id)a5 dialogPhase:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = (void *)MEMORY[0x24BEA8640];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "sharedManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emitUUFRPresentedEventWith:snippetClass:dialogIdentifier:dialogPhase:", v13, v12, v11, v10);

}

- (id)associatedDialogIdentifiersForAceObjectIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BEA8640];
  v4 = a3;
  objc_msgSend(v3, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedDialogIdentifiersForAceObjectIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
