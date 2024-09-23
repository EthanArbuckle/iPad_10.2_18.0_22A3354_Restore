@implementation ICQDaemonOfferStubs

+ (id)persistenceKey
{
  return CFSTR("_ICQCachedOfferStubsInternal");
}

+ (id)daemonOfferStubsDictionarySample
{
  return &unk_1E8B551B0;
}

- (id)chooseStub
{
  void *v3;
  void *v4;
  void *v5;

  -[ICQDaemonOfferStubs serverStubs](self, "serverStubs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQDaemonOfferConditions currentConditions](ICQDaemonOfferConditions, "currentConditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs _chooseStubFromServerStubs:conditions:](self, "_chooseStubFromServerStubs:conditions:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)chooseStubForConditions:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICQDaemonOfferStubs serverStubs](self, "serverStubs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs _chooseStubFromServerStubs:conditions:](self, "_chooseStubFromServerStubs:conditions:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)chooseFirstStub
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  ICQDaemonOfferStub *v7;

  -[ICQDaemonOfferStubs serverStubs](self, "serverStubs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[ICQDaemonOfferStubs serverStubs](self, "serverStubs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[ICQDaemonOfferStub initWithServerDictionary:]([ICQDaemonOfferStub alloc], "initWithServerDictionary:", v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)chooseBuddyStub
{
  void *v3;
  void *v4;
  void *v5;

  -[ICQDaemonOfferStubs buddyStubs](self, "buddyStubs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQDaemonOfferConditions currentConditions](ICQDaemonOfferConditions, "currentConditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs _chooseStubFromServerStubs:conditions:](self, "_chooseStubFromServerStubs:conditions:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)chooseBuddyStubForConditions:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICQDaemonOfferStubs buddyStubs](self, "buddyStubs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs _chooseStubFromServerStubs:conditions:](self, "_chooseStubFromServerStubs:conditions:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)chooseDefaultStub
{
  void *v3;
  void *v4;
  void *v5;

  -[ICQDaemonOfferStubs defaultStubs](self, "defaultStubs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQDaemonOfferConditions currentConditions](ICQDaemonOfferConditions, "currentConditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs _chooseStubFromServerStubs:conditions:](self, "_chooseStubFromServerStubs:conditions:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)chooseDefaultStubForConditions:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICQDaemonOfferStubs defaultStubs](self, "defaultStubs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs _chooseStubFromServerStubs:conditions:](self, "_chooseStubFromServerStubs:conditions:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)chooseFirstDefaultStub
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  ICQDaemonOfferStub *v7;

  -[ICQDaemonOfferStubs defaultStubs](self, "defaultStubs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[ICQDaemonOfferStubs defaultStubs](self, "defaultStubs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[ICQDaemonOfferStub initWithServerDictionary:]([ICQDaemonOfferStub alloc], "initWithServerDictionary:", v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)choosePremiumStub
{
  void *v3;
  void *v4;
  void *v5;

  -[ICQDaemonOfferStubs premiumStubs](self, "premiumStubs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQDaemonOfferConditions currentConditions](ICQDaemonOfferConditions, "currentConditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs _chooseStubFromServerStubs:conditions:](self, "_chooseStubFromServerStubs:conditions:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)choosePremiumStubForConditions:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICQDaemonOfferStubs premiumStubs](self, "premiumStubs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs _chooseStubFromServerStubs:conditions:](self, "_chooseStubFromServerStubs:conditions:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)chooseFirstPremiumStub
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  ICQDaemonOfferStub *v7;

  -[ICQDaemonOfferStubs premiumStubs](self, "premiumStubs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[ICQDaemonOfferStubs premiumStubs](self, "premiumStubs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[ICQDaemonOfferStub initWithServerDictionary:]([ICQDaemonOfferStub alloc], "initWithServerDictionary:", v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)chooseEventStub
{
  void *v3;
  void *v4;

  +[ICQDaemonOfferConditions currentConditions](ICQDaemonOfferConditions, "currentConditions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs chooseEventStubForConditions:](self, "chooseEventStubForConditions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)chooseEventStubForConditions:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICQDaemonOfferStubs eventStubs](self, "eventStubs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs _chooseStubFromServerStubs:conditions:](self, "_chooseStubFromServerStubs:conditions:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)chooseFirstEventStub
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  ICQDaemonOfferStub *v7;
  void *v8;

  -[ICQDaemonOfferStubs eventStubs](self, "eventStubs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[ICQDaemonOfferStubs eventStubs](self, "eventStubs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[ICQDaemonOfferStub initWithServerDictionary:]([ICQDaemonOfferStub alloc], "initWithServerDictionary:", v6);
    +[ICQDaemonOfferConditions currentConditions](ICQDaemonOfferConditions, "currentConditions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQDaemonOfferStub setConditionsWhenChosen:](v7, "setConditionsWhenChosen:", v8);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)containsOfferID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ICQDaemonOfferStubs serverStubs](self, "serverStubs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICQDaemonOfferStubs _stubsArrayContainsOfferID:stubs:](self, "_stubsArrayContainsOfferID:stubs:", v4, v5))
  {
    v6 = 1;
  }
  else
  {
    -[ICQDaemonOfferStubs premiumStubs](self, "premiumStubs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICQDaemonOfferStubs _stubsArrayContainsOfferID:stubs:](self, "_stubsArrayContainsOfferID:stubs:", v4, v7))
    {
      v6 = 1;
    }
    else
    {
      -[ICQDaemonOfferStubs defaultStubs](self, "defaultStubs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ICQDaemonOfferStubs _stubsArrayContainsOfferID:stubs:](self, "_stubsArrayContainsOfferID:stubs:", v4, v8))
      {
        v6 = 1;
      }
      else
      {
        -[ICQDaemonOfferStubs buddyStubs](self, "buddyStubs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[ICQDaemonOfferStubs _stubsArrayContainsOfferID:stubs:](self, "_stubsArrayContainsOfferID:stubs:", v4, v9))
        {
          v6 = 1;
        }
        else
        {
          -[ICQDaemonOfferStubs eventStubs](self, "eventStubs");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = -[ICQDaemonOfferStubs _stubsArrayContainsOfferID:stubs:](self, "_stubsArrayContainsOfferID:stubs:", v4, v10);

        }
      }

    }
  }

  return v6;
}

- (id)_initWithAccount:(id)a3 serverDictionary:(id)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQDaemonOfferStubs;
  v4 = -[ICQDaemonPersisted _initWithAccount:serverDictionary:](&v7, sel__initWithAccount_serverDictionary_, a3, a4);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "_initServerStubsFromServerDictionary");
  return v5;
}

- (id)_initWithAccount:(id)a3 error:(id)a4
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICQDaemonOfferStubs;
  v4 = -[ICQDaemonPersisted _initWithAccount:error:](&v13, sel__initWithAccount_error_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)v4[7];
    v7 = MEMORY[0x1E0C9AA60];
    v4[7] = MEMORY[0x1E0C9AA60];

    v8 = (void *)v5[8];
    v5[8] = v7;

    v9 = (void *)v5[9];
    v5[9] = v7;

    v10 = (void *)v5[10];
    v5[10] = v7;

    v11 = (void *)v5[11];
    v5[11] = v7;

  }
  return v5;
}

- (ICQDaemonOfferStubs)initWithDictionary:(id)a3
{
  ICQDaemonOfferStubs *v3;
  ICQDaemonOfferStubs *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQDaemonOfferStubs;
  v3 = -[ICQDaemonPersisted initWithDictionary:](&v6, sel_initWithDictionary_, a3);
  v4 = v3;
  if (v3)
    -[ICQDaemonOfferStubs _initServerStubsFromServerDictionary](v3, "_initServerStubsFromServerDictionary");
  return v4;
}

- (void)setServerDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQDaemonOfferStubs;
  -[ICQDaemonPersisted setServerDictionary:](&v4, sel_setServerDictionary_, a3);
  -[ICQDaemonOfferStubs _initServerStubsFromServerDictionary](self, "_initServerStubsFromServerDictionary");
}

- (id)sortedServerStubs:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_17);
}

uint64_t __41__ICQDaemonOfferStubs_sortedServerStubs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("priority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("priority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_msgSend(v5, "integerValue");
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v6)
      goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "integerValue");
    goto LABEL_9;
  }
LABEL_8:
  v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
  if (v7 < v8)
    v9 = -1;
  else
    v9 = v7 > v8;

  return v9;
}

- (void)_initServerStubsFromServerDictionary
{
  void *v3;
  _BOOL4 v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *serverStubs;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *buddyStubs;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *defaultStubs;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *premiumStubs;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *eventStubs;
  id v24;

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceOffers"));
  v24 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[ICQDaemonOfferStubs _isValidServerStubs:key:](self, "_isValidServerStubs:key:", v24, CFSTR("deviceOffers"));
  v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  if (v4)
  {
    -[ICQDaemonOfferStubs sortedServerStubs:](self, "sortedServerStubs:", v24);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    serverStubs = self->_serverStubs;
    self->_serverStubs = v6;
  }
  else
  {
    serverStubs = self->_serverStubs;
    self->_serverStubs = (NSArray *)MEMORY[0x1E0C9AA60];
  }

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("buddyOffers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ICQDaemonOfferStubs _isValidServerStubs:key:](self, "_isValidServerStubs:key:", v9, CFSTR("buddyOffers")))
  {
    -[ICQDaemonOfferStubs sortedServerStubs:](self, "sortedServerStubs:", v9);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    buddyStubs = self->_buddyStubs;
    self->_buddyStubs = v10;
  }
  else
  {
    buddyStubs = self->_buddyStubs;
    self->_buddyStubs = v5;
  }

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("defaultOffers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ICQDaemonOfferStubs _isValidServerStubs:key:](self, "_isValidServerStubs:key:", v13, CFSTR("defaultOffers")))
  {
    -[ICQDaemonOfferStubs sortedServerStubs:](self, "sortedServerStubs:", v13);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    defaultStubs = self->_defaultStubs;
    self->_defaultStubs = v14;
  }
  else
  {
    defaultStubs = self->_defaultStubs;
    self->_defaultStubs = v5;
  }

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("premiumOffers"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ICQDaemonOfferStubs _isValidServerStubs:key:](self, "_isValidServerStubs:key:", v17, CFSTR("premiumOffers")))
  {
    -[ICQDaemonOfferStubs sortedServerStubs:](self, "sortedServerStubs:", v17);
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
    premiumStubs = self->_premiumStubs;
    self->_premiumStubs = v18;
  }
  else
  {
    premiumStubs = self->_premiumStubs;
    self->_premiumStubs = v5;
  }

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("eventOffers"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ICQDaemonOfferStubs _isValidServerStubs:key:](self, "_isValidServerStubs:key:", v21, CFSTR("eventOffers")))
  {
    -[ICQDaemonOfferStubs sortedServerStubs:](self, "sortedServerStubs:", v21);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    eventStubs = self->_eventStubs;
    self->_eventStubs = v22;
  }
  else
  {
    eventStubs = self->_eventStubs;
    self->_eventStubs = v5;
  }

}

- (BOOL)_isValidServerStubs:(id)a3 key:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  if (!v5)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ is missing", buf, 0xCu);
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v20 = v6;
      v21 = 2112;
      v22 = v9;
      v10 = v9;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "invalid %{public}@ of class %@", buf, 0x16u);

    }
LABEL_9:

    v7 = 0;
    *((_BYTE *)v16 + 24) = 0;
    goto LABEL_10;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__ICQDaemonOfferStubs__isValidServerStubs_key___block_invoke;
  v12[3] = &unk_1E8B39EE0;
  v13 = v6;
  v14 = &v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);

  v7 = *((_BYTE *)v16 + 24) != 0;
LABEL_10:
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __47__ICQDaemonOfferStubs__isValidServerStubs_key___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v11 = 138543874;
      v12 = v9;
      v13 = 2048;
      v14 = a3;
      v15 = 2112;
      v16 = (id)objc_opt_class();
      v10 = v16;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "invalid %{public}@[%ld] of class %@", (uint8_t *)&v11, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (id)_chooseStubFromServerStubs:(id)a3 conditions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  _UNKNOWN **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  ICQDaemonOfferStub *v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      v10 = CFSTR("criteria");
      v11 = &off_1E8B37000;
      v27 = *(_QWORD *)v30;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
        _ICQDictionaryForKey(v13, v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc((Class)v11[204]), "initWithServerDictionary:", v14);
        _ICQGetLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          _ICQStringForKey(v13, CFSTR("offerType"));
          v17 = v6;
          v18 = v10;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          _ICQStringForKey(v13, CFSTR("type"));
          v20 = v8;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v34 = v19;
          v35 = 2114;
          v36 = v21;
          v37 = 2114;
          v38 = v14;
          _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "checking criteria for offer type %{public}@ type %{public}@ criteria\n%{public}@", buf, 0x20u);

          v8 = v20;
          v10 = v18;
          v6 = v17;
          v9 = v27;
          v11 = &off_1E8B37000;
        }

        if ((objc_msgSend(v15, "isSatisfiedByConditions:", v6) & 1) != 0)
          break;

        if (v8 == ++v12)
        {
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_12;
        }
      }
      v22 = -[ICQDaemonOfferStub initWithServerDictionary:]([ICQDaemonOfferStub alloc], "initWithServerDictionary:", v13);

      if (!v22)
        goto LABEL_15;
      -[ICQDaemonOfferStub setConditionsWhenChosen:](v22, "setConditionsWhenChosen:", v6);
    }
    else
    {
LABEL_12:

LABEL_15:
      _ICQGetLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v23, OS_LOG_TYPE_DEFAULT, "choose stub: none with matching criteria found", buf, 2u);
      }

      v22 = 0;
    }
    v5 = v26;
  }
  else
  {
    _ICQGetLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v24, OS_LOG_TYPE_DEFAULT, "choose stub: none present", buf, 2u);
    }

    v22 = 0;
  }

  return v22;
}

- (BOOL)_stubsArrayContainsOfferID:(id)a3 stubs:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("offerId"), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if ((v12 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (NSArray)serverStubs
{
  return self->_serverStubs;
}

- (NSArray)buddyStubs
{
  return self->_buddyStubs;
}

- (NSArray)defaultStubs
{
  return self->_defaultStubs;
}

- (NSArray)premiumStubs
{
  return self->_premiumStubs;
}

- (NSArray)eventStubs
{
  return self->_eventStubs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStubs, 0);
  objc_storeStrong((id *)&self->_premiumStubs, 0);
  objc_storeStrong((id *)&self->_defaultStubs, 0);
  objc_storeStrong((id *)&self->_buddyStubs, 0);
  objc_storeStrong((id *)&self->_serverStubs, 0);
}

- (id)chooseStubForOfferType:(int64_t)a3
{
  void *v5;
  void *v6;

  -[ICQDaemonOfferStubs serverStubs](self, "serverStubs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs _chooseStubFromServerStubs:offerType:](self, "_chooseStubFromServerStubs:offerType:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)chooseBuddyStubForOfferType:(int64_t)a3
{
  void *v5;
  void *v6;

  -[ICQDaemonOfferStubs buddyStubs](self, "buddyStubs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferStubs _chooseStubFromServerStubs:offerType:](self, "_chooseStubFromServerStubs:offerType:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_chooseStubFromServerStubs:(id)a3 offerType:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  ICQDaemonOfferStub *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[ICQDaemonOfferConditions currentConditions](ICQDaemonOfferConditions, "currentConditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v23 = v6;
    v24 = v5;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        _ICQStringForKey(v11, CFSTR("offerType"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = _ICQOfferTypeForServerString(v12);
        _ICQGetLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13 == a4)
          break;
        if (v15)
        {
          _ICQStringForOfferType(v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          _ICQStringForOfferType(a4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v31 = v16;
          v32 = 2112;
          v33 = v12;
          v34 = 2112;
          v35 = v17;
          _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "skipping server offer type %@ (%@) because it doesn't match requested %@", buf, 0x20u);

        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_12;
        }
      }
      if (v15)
      {
        _ICQStringForOfferType(a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v18;
        v32 = 2112;
        v33 = v11;
        _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "choose offer type (%@):\n%@", buf, 0x16u);

      }
      v19 = -[ICQDaemonOfferStub initWithServerDictionary:]([ICQDaemonOfferStub alloc], "initWithServerDictionary:", v11);

      v5 = v24;
      if (v19)
        goto LABEL_21;
    }
    else
    {
LABEL_12:

      v5 = v24;
    }
    _ICQGetLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      _ICQStringForOfferType(a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_log_impl(&dword_1CDEBD000, v20, OS_LOG_TYPE_DEFAULT, "choose offer type (%@): none found", buf, 0xCu);

    }
  }
  else
  {
    _ICQGetLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v20, OS_LOG_TYPE_DEFAULT, "choose offer type: none present", buf, 2u);
    }
  }

  v19 = 0;
LABEL_21:
  -[ICQDaemonOfferStub setConditionsWhenChosen:](v19, "setConditionsWhenChosen:", v6, v23, v24);

  return v19;
}

@end
