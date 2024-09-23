@implementation PSSSSubscriptionManager

- (PSSSSubscriptionManager)init
{
  PSSSSubscriptionManager *v2;
  VSSubscriptionRegistrationCenter *v3;
  VSSubscriptionRegistrationCenter *registrationCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSSSSubscriptionManager;
  v2 = -[PSSSSubscriptionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (VSSubscriptionRegistrationCenter *)objc_alloc_init(MEMORY[0x24BDF8C98]);
    registrationCenter = v2->_registrationCenter;
    v2->_registrationCenter = v3;

  }
  return v2;
}

- (void)registerSubscriptionWithInfo:(id)a3 expirationDate:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x24BDF8C90];
  v7 = a4;
  v8 = a3;
  v10 = objc_alloc_init(v6);
  objc_msgSend(v10, "setSubscriptionInfo:", v8);

  objc_msgSend(v10, "setExpirationDate:", v7);
  -[PSSSSubscriptionManager registrationCenter](self, "registrationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerSubscription:", v10);

}

- (void)unregisterSubscriptionWithInfo:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDF8F48];
  v12[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSSSubscriptionManager registrationCenter](self, "registrationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__PSSSSubscriptionManager_unregisterSubscriptionWithInfo___block_invoke;
  v9[3] = &unk_24FEC3320;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v8, "fetchActiveSubscriptionsWithOptions:completionHandler:", v6, v9);

}

void __58__PSSSSubscriptionManager_unregisterSubscriptionWithInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "removeSubscriptions:", v3);

}

- (void)unregisterAllSubscriptions
{
  id v2;

  -[PSSSSubscriptionManager registrationCenter](self, "registrationCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCurrentSubscription:", 0);

}

- (VSSubscriptionRegistrationCenter)registrationCenter
{
  return self->_registrationCenter;
}

- (void)setRegistrationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_registrationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationCenter, 0);
}

@end
