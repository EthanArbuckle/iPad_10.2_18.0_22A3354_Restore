@implementation SROSmartRepliesManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  return (id)sharedManager_sharedManager;
}

void __39__SROSmartRepliesManager_sharedManager__block_invoke()
{
  SROSmartRepliesManager *v0;
  void *v1;

  v0 = objc_alloc_init(SROSmartRepliesManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (SROSmartRepliesManager)init
{
  SROSmartRepliesManager *v2;
  uint64_t v3;
  _TtC12SmartReplies21SRSmartRepliesManager *backingManager;
  SROSmartRepliesManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SROSmartRepliesManager;
  v2 = -[SROSmartRepliesManager init](&v7, sel_init);
  if (v2)
  {
    +[SRSmartRepliesManager shared](_TtC12SmartReplies21SRSmartRepliesManager, "shared");
    v3 = objc_claimAutoreleasedReturnValue();
    backingManager = v2->_backingManager;
    v2->_backingManager = (_TtC12SmartReplies21SRSmartRepliesManager *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)suggestionsForRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[SROSmartRepliesObjCCompatibilityUtils requestForWrappedRequest:](SROSmartRepliesObjCCompatibilityUtils, "requestForWrappedRequest:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRSmartRepliesManager suggestionsFor:](self->_backingManager, "suggestionsFor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SROSmartRepliesObjCCompatibilityUtils wrappedResponseForResponse:](SROSmartRepliesObjCCompatibilityUtils, "wrappedResponseForResponse:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)suggestionsForRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  _TtC12SmartReplies21SRSmartRepliesManager *backingManager;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  +[SROSmartRepliesObjCCompatibilityUtils requestForWrappedRequest:](SROSmartRepliesObjCCompatibilityUtils, "requestForWrappedRequest:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  backingManager = self->_backingManager;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__SROSmartRepliesManager_suggestionsForRequest_withCompletion___block_invoke;
  v10[3] = &unk_2518C3968;
  v11 = v6;
  v9 = v6;
  -[SRSmartRepliesManager suggestionsFor:completion:](backingManager, "suggestionsFor:completion:", v7, v10);

}

void __63__SROSmartRepliesManager_suggestionsForRequest_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[SROSmartRepliesObjCCompatibilityUtils wrappedResponseForResponse:](SROSmartRepliesObjCCompatibilityUtils, "wrappedResponseForResponse:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)registerResponse:(id)a3 forMessage:(id)a4 time:(id)a5 metadata:(id)a6 withLanguage:(id)a7
{
  -[SRSmartRepliesManager registerResponseFor:message:time:metadata:language:](self->_backingManager, "registerResponseFor:message:time:metadata:language:", a3, a4, a5, a6, a7);
}

- (void)registerResponseDisplayedAtIndex:(id)a3
{
  -[SROSmartRepliesManager registerResponseDisplayedAtIndex:withDisplaySetting:](self, "registerResponseDisplayedAtIndex:withDisplaySetting:", a3, 0);
}

- (void)registerResponseDisplayedAtIndex:(id)a3 withDisplaySetting:(id)a4
{
  -[SRSmartRepliesManager registerResponseDisplayedAtIndex:displaySetting:](self->_backingManager, "registerResponseDisplayedAtIndex:displaySetting:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingManager, 0);
}

@end
