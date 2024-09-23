@implementation WLKSubscriptionData

void __42__WLKSubscriptionData_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "wlk_numberForKey:", CFSTR("adamId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v3);
  if (objc_msgSend(v8, "wlk_BOOLForKey:defaultValue:", CFSTR("isActive"), 0))
    ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  objc_msgSend(v8, "wlk_stringForKey:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("TV_PLUS")))
    goto LABEL_8;
  v5 = objc_msgSend(v8, "wlk_BOOLForKey:defaultValue:", CFSTR("isActive"), 0);

  if (v5)
  {
    v6 = objc_msgSend(v8, "copy");
    v7 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = v6;
LABEL_8:

  }
}

- (WLKSubscriptionData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  WLKSubscriptionData *v12;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_WLKSubscriptionDataCoderKeyBackingDictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WLKSubscriptionData initWithDictionary:](self, "initWithDictionary:", v11);

    v12 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
    v12 = 0;
  }

  return v12;
}

- (WLKSubscriptionData)initWithDictionary:(id)a3
{
  id v4;
  WLKSubscriptionData *v5;
  uint64_t v6;
  NSDictionary *backingDictionary;
  uint64_t v8;
  NSArray *subscriptionArray;
  uint64_t v10;
  NSDictionary *account;
  uint64_t v12;
  NSDictionary *family;
  id v14;
  NSArray *v15;
  id v16;
  WLKSubscriptionData *v17;
  uint64_t v18;
  NSDictionary *subscriptionsByAdamID;
  WLKSubscriptionData *v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  WLKSubscriptionData *v28;
  objc_super v29;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v29.receiver = self;
    v29.super_class = (Class)WLKSubscriptionData;
    v5 = -[WLKSubscriptionData init](&v29, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      backingDictionary = v5->_backingDictionary;
      v5->_backingDictionary = (NSDictionary *)v6;

      -[NSDictionary wlk_arrayForKey:](v5->_backingDictionary, "wlk_arrayForKey:", CFSTR("subscriptions"));
      v8 = objc_claimAutoreleasedReturnValue();
      subscriptionArray = v5->_subscriptionArray;
      v5->_subscriptionArray = (NSArray *)v8;

      -[NSDictionary wlk_dictionaryForKey:](v5->_backingDictionary, "wlk_dictionaryForKey:", CFSTR("account"));
      v10 = objc_claimAutoreleasedReturnValue();
      account = v5->_account;
      v5->_account = (NSDictionary *)v10;

      -[NSDictionary wlk_dictionaryForKey:](v5->_backingDictionary, "wlk_dictionaryForKey:", CFSTR("family"));
      v12 = objc_claimAutoreleasedReturnValue();
      family = v5->_family;
      v5->_family = (NSDictionary *)v12;

      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = v5->_subscriptionArray;
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __42__WLKSubscriptionData_initWithDictionary___block_invoke;
      v26 = &unk_1E68A9E00;
      v16 = v14;
      v27 = v16;
      v17 = v5;
      v28 = v17;
      -[NSArray enumerateObjectsUsingBlock:](v15, "enumerateObjectsUsingBlock:", &v23);
      if (objc_msgSend(v16, "count", v23, v24, v25, v26))
      {
        v18 = objc_msgSend(v16, "copy");
        subscriptionsByAdamID = v17->_subscriptionsByAdamID;
        v17->_subscriptionsByAdamID = (NSDictionary *)v18;

      }
    }
    self = v5;
    v20 = self;
  }
  else
  {
    WLKSubscriptionSyncLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v21, OS_LOG_TYPE_DEFAULT, "Initializing WLKSubscriptionData with an empty dictionary", buf, 2u);
    }

    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backingDictionary, CFSTR("_WLKSubscriptionDataCoderKeyBackingDictionary"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)subscriptions
{
  return (id)-[NSArray copy](self->_subscriptionArray, "copy");
}

- (id)subscriptionByAdamID:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary wlk_dictionaryForKey:](self->_subscriptionsByAdamID, "wlk_dictionaryForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)currentFamily
{
  return self->_family;
}

- (id)currentAccount
{
  return self->_account;
}

- (BOOL)isTVPlusSubscriber
{
  void *v2;
  BOOL v3;

  -[WLKSubscriptionData activeTVPlusSubscription](self, "activeTVPlusSubscription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)activeSubscriptionsCount
{
  return self->_activeSubscriptionsCount;
}

- (id)activeTVPlusSubscription
{
  return self->_activeTVPlusSubscription;
}

- (BOOL)isEqual:(id)a3
{
  WLKSubscriptionData *v4;
  BOOL v5;

  v4 = (WLKSubscriptionData *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[WLKSubscriptionData isEqualToSubscriptionData:](self, "isEqualToSubscriptionData:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_backingDictionary, "hash");
}

- (BOOL)isEqualToSubscriptionData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  char v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)*((_QWORD *)v4 + 1);
    v7 = self->_backingDictionary;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v7 && v8)
        v10 = -[NSDictionary isEqual:](v7, "isEqual:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTVPlusSubscription, 0);
  objc_storeStrong((id *)&self->_subscriptionsByAdamID, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_subscriptionArray, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

@end
