@implementation SKADatabaseSubscriptionAssertion

- (SKADatabaseSubscriptionAssertion)initWithCoreDataSubscriptionAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SKADatabaseSubscriptionAssertion *v8;

  v4 = a3;
  objc_msgSend(v4, "channelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SKADatabaseSubscriptionAssertion initWithChannelIdentifier:statusTypeIdentifier:applicationIdentifier:](self, "initWithChannelIdentifier:statusTypeIdentifier:applicationIdentifier:", v5, v6, v7);
  return v8;
}

- (SKADatabaseSubscriptionAssertion)initWithChannelIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKADatabaseSubscriptionAssertion *v11;
  uint64_t v12;
  NSString *channelIdentifier;
  uint64_t v14;
  NSString *statusTypeIdentifier;
  uint64_t v16;
  NSString *applicationIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SKADatabaseSubscriptionAssertion;
  v11 = -[SKADatabaseSubscriptionAssertion init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    channelIdentifier = v11->_channelIdentifier;
    v11->_channelIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    statusTypeIdentifier = v11->_statusTypeIdentifier;
    v11->_statusTypeIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    applicationIdentifier = v11->_applicationIdentifier;
    v11->_applicationIdentifier = (NSString *)v16;

  }
  return v11;
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end
