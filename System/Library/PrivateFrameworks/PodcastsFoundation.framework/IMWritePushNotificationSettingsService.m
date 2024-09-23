@implementation IMWritePushNotificationSettingsService

- (IMWritePushNotificationSettingsService)initWithData:(id)a3
{
  id v4;
  IMWritePushNotificationSettingsService *v5;
  IMWritePushNotificationSettingsService *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMWritePushNotificationSettingsService;
  v5 = -[IMBaseStoreService init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IMWritePushNotificationSettingsService setData:](v5, "setData:", v4);
    -[IMBaseStoreService setPersonalizeRequests:](v6, "setPersonalizeRequests:", 1);
  }

  return v6;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[IMPushNotificationSettingsService endpointURLForKey:](self, "endpointURLForKey:", CFSTR("setPushNotificationSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__IMWritePushNotificationSettingsService_urlRequest__block_invoke;
  v6[3] = &unk_1E54D3BD0;
  v6[4] = self;
  objc_msgSend(v3, "thenWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __52__IMWritePushNotificationSettingsService_urlRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v3, "addValue:forHTTPHeaderField:", CFSTR("application/json; charset=utf-8"), CFSTR("Content-Type"));
  objc_msgSend(*(id *)(a1 + 32), "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHTTPBody:", v4);

  objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
