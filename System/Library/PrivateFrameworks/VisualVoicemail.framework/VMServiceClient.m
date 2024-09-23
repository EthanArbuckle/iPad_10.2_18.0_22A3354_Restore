@implementation VMServiceClient

- (VMServiceClient)init
{
  VMServiceClient *v2;
  VMVoicemailManager *v3;
  VMVoicemailManager *voicemailManager;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VMServiceClient;
  v2 = -[VMServiceClient init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VMVoicemailManager);
    voicemailManager = v2->_voicemailManager;
    v2->_voicemailManager = v3;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_handleVoicemailsChangedNotification_, CFSTR("VMVoicemailVoicemailsChangedNotification"), v2->_voicemailManager);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_handleSubscriptionStatusChangedNotification_, CFSTR("VMVoicemailSubscriptionStateStatusChangedNotification"), v2->_voicemailManager);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_handleOnlineStatusChangedNotification_, CFSTR("VMVoicemailOnlineStatusChangedNotification"), v2->_voicemailManager);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VMServiceClient;
  -[VMServiceClient dealloc](&v4, sel_dealloc);
}

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1)
    dispatch_once(&sharedClient_onceToken, &__block_literal_global);
  return (id)__sharedServiceClient;
}

void __31__VMServiceClient_sharedClient__block_invoke()
{
  VMServiceClient *v0;
  void *v1;

  v0 = objc_alloc_init(VMServiceClient);
  v1 = (void *)__sharedServiceClient;
  __sharedServiceClient = (uint64_t)v0;

}

- (id)sharedAccount
{
  if (sharedAccount_onceToken != -1)
    dispatch_once(&sharedAccount_onceToken, &__block_literal_global_11);
  return (id)sharedAccount___legacyAccount;
}

void __32__VMServiceClient_sharedAccount__block_invoke()
{
  VMLegacyAccount *v0;
  void *v1;

  v0 = objc_alloc_init(VMLegacyAccount);
  v1 = (void *)sharedAccount___legacyAccount;
  sharedAccount___legacyAccount = (uint64_t)v0;

}

- (BOOL)sharedServiceIsSubscribed
{
  void *v2;
  char v3;

  -[VMServiceClient voicemailManager](self, "voicemailManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSubscribed");

  return v3;
}

- (VMVoicemailManager)voicemailManager
{
  return self->_voicemailManager;
}

- (void)setVoicemailManager:(id)a3
{
  objc_storeStrong((id *)&self->_voicemailManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicemailManager, 0);
}

@end
