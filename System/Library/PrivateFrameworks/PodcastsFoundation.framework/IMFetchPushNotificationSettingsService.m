@implementation IMFetchPushNotificationSettingsService

- (IMFetchPushNotificationSettingsService)init
{
  IMFetchPushNotificationSettingsService *v2;
  IMFetchPushNotificationSettingsService *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMFetchPushNotificationSettingsService;
  v2 = -[IMBaseStoreService init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IMBaseStoreService setPersonalizeRequests:](v2, "setPersonalizeRequests:", 1);
  return v3;
}

- (id)urlRequest
{
  void *v2;
  void *v3;

  -[IMPushNotificationSettingsService endpointURLForKey:](self, "endpointURLForKey:", CFSTR("getPushNotificationSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thenWithBlock:", &__block_literal_global_22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __52__IMFetchPushNotificationSettingsService_urlRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CFDBD8];
  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
