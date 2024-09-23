@implementation SKIMessagesGatekeeperPayload

- (SKIMessagesGatekeeperPayload)initWithAppBundleId:(id)a3
{
  id v5;
  SKIMessagesGatekeeperPayload *v6;
  SKIMessagesGatekeeperPayload *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKIMessagesGatekeeperPayload;
  v6 = -[SKIMessagesGatekeeperPayload init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appBundleId, a3);

  return v7;
}

- (SKIMessagesGatekeeperPayload)initWithDictionary:(id)a3
{
  id v4;
  SKIMessagesGatekeeperPayload *v5;
  uint64_t v6;
  NSString *appBundleId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKIMessagesGatekeeperPayload;
  v5 = -[SKIMessagesGatekeeperPayload init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("appBundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v6;

  }
  return v5;
}

- (SKIDirectInvocationPayload)invocationPayload
{
  SKIDirectInvocationPayload *v3;
  SKIDirectInvocationPayload *v4;
  void *v5;

  v3 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.DirectInvocation.Messages.TriggerGatekeeper"));
  v4 = v3;
  if (self->_appBundleId)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
    objc_msgSend(v5, "setObject:forKey:", self->_appBundleId, CFSTR("appBundleId"));
    -[SKIDirectInvocationPayload setUserData:](v4, "setUserData:", v5);

  }
  else
  {
    -[SKIDirectInvocationPayload setUserData:](v3, "setUserData:", MEMORY[0x24BDBD1B8]);
  }
  return v4;
}

+ (BOOL)supports:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.siri.DirectInvocation.Messages.TriggerGatekeeper"));
}

- (NSString)appBundleId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
