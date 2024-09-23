@implementation PSSSSubscriptionManagerInternal

- (void)getActiveSubscriptionServicesMatchingBundleIdentifiers:(id)a3 domainIdentifiers:(id)a4 maximumExpirationLimit:(double)a5 completionHandler:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a6;
  if (v8)
  {
    VSSubscriptionFetchOptionsForBundleIdentifiersAndDomainNames();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v11, v10);
    -[PSSSSubscriptionManagerInternal registrationCenter](self, "registrationCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __149__PSSSSubscriptionManagerInternal_getActiveSubscriptionServicesMatchingBundleIdentifiers_domainIdentifiers_maximumExpirationLimit_completionHandler___block_invoke;
    v15[3] = &unk_24FEC3348;
    v16 = v12;
    v17 = v8;
    v14 = v12;
    objc_msgSend(v13, "fetchActiveSubscriptionsWithOptions:completionHandler:", v9, v15);

  }
}

- (VSSubscriptionRegistrationCenter)registrationCenter
{
  return self->_registrationCenter;
}

void __149__PSSSSubscriptionManagerInternal_getActiveSubscriptionServicesMatchingBundleIdentifiers_domainIdentifiers_maximumExpirationLimit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    v23 = v5;
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = v4;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v13 = *(void **)(a1 + 32);
          objc_msgSend(v12, "modificationDate", v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "containsDate:", v14);

          v16 = (void *)objc_opt_new();
          objc_msgSend(v12, "source");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "copy");

          objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("provider"));
          objc_msgSend(v12, "subscriptionInfo");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v20, "copy");
          objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("type"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v22, CFSTR("active"));

          objc_msgSend(v7, "setObject:forKey:", v16, v19);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);
    }

    v6 = v23;
    v4 = v24;
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (PSSSSubscriptionManagerInternal)init
{
  PSSSSubscriptionManagerInternal *v2;
  VSSubscriptionRegistrationCenter *v3;
  VSSubscriptionRegistrationCenter *registrationCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSSSSubscriptionManagerInternal;
  v2 = -[PSSSSubscriptionManagerInternal init](&v6, sel_init);
  if (v2)
  {
    v3 = (VSSubscriptionRegistrationCenter *)objc_alloc_init(MEMORY[0x24BDF8C98]);
    registrationCenter = v2->_registrationCenter;
    v2->_registrationCenter = v3;

  }
  return v2;
}

- (void)registerSubscriptionServiceForURL:(id)a3 withSubscriptionInfo:(id)a4 expirationDate:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BDF8CA0];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "subscriptionSourceForWebsiteWithURL:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDF8C90]);
  objc_msgSend(v11, "setSource:", v13);
  objc_msgSend(v11, "setExpirationDate:", v9);

  objc_msgSend(v11, "setSubscriptionInfo:", v10);
  -[PSSSSubscriptionManagerInternal registrationCenter](self, "registrationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerSubscription:", v11);

}

- (void)removeSubscriptionServiceForURL:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF8CA0], "subscriptionSourceForWebsiteWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDF8F40];
  v12 = v4;
  v13 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSSSSubscriptionManagerInternal registrationCenter](self, "registrationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__PSSSSubscriptionManagerInternal_removeSubscriptionServiceForURL___block_invoke;
  v10[3] = &unk_24FEC3320;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v9, "fetchActiveSubscriptionsWithOptions:completionHandler:", v7, v10);

}

void __67__PSSSSubscriptionManagerInternal_removeSubscriptionServiceForURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "removeSubscriptions:", v3);

}

- (void)removeWebSubscriptionServicesCreatedAfterDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  VSSubscriptionFetchOptionsForWebSubscriptionsCreatedAfterDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSSSubscriptionManagerInternal registrationCenter](self, "registrationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__PSSSSubscriptionManagerInternal_removeWebSubscriptionServicesCreatedAfterDate___block_invoke;
  v7[3] = &unk_24FEC3320;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "fetchActiveSubscriptionsWithOptions:completionHandler:", v4, v7);

}

void __81__PSSSSubscriptionManagerInternal_removeWebSubscriptionServicesCreatedAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "removeSubscriptions:", v3);

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
