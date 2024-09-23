@implementation SUScriptSubscriptionStatusRequest

- (SUScriptSubscriptionStatusRequest)init
{
  SUScriptSubscriptionStatusRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptSubscriptionStatusRequest;
  result = -[SUScriptObject init](&v3, sel_init);
  if (result)
    result->_carrierBundleProvisioningStyle = 1;
  return result;
}

- (id)_className
{
  return CFSTR("iTunesSubscriptionStatusRequest");
}

- (NSString)carrierBundleProvisioningStyleName
{
  unint64_t carrierBundleProvisioningStyle;
  __CFString *v4;

  -[SUScriptObject lock](self, "lock");
  carrierBundleProvisioningStyle = self->_carrierBundleProvisioningStyle;
  -[SUScriptObject unlock](self, "unlock");
  if (carrierBundleProvisioningStyle > 2)
    v4 = 0;
  else
    v4 = *off_24DE7D960[carrierBundleProvisioningStyle];
  return (NSString *)v4;
}

- (id)ignoreCache
{
  _BOOL4 ignoreCache;
  id *v4;

  -[SUScriptObject lock](self, "lock");
  ignoreCache = self->_ignoreCache;
  -[SUScriptObject unlock](self, "unlock");
  v4 = (id *)MEMORY[0x24BDBD270];
  if (!ignoreCache)
    v4 = (id *)MEMORY[0x24BDBD268];
  return *v4;
}

- (NSString)reasonName
{
  int64_t reason;
  void *v4;

  -[SUScriptObject lock](self, "lock");
  reason = self->_reason;
  -[SUScriptObject unlock](self, "unlock");
  if (reason == 1)
  {
    -[SUScriptSubscriptionStatusRequest reasonNameDeepLink](self, "reasonNameDeepLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)serviceName
{
  int64_t service;
  void *v4;

  -[SUScriptObject lock](self, "lock");
  service = self->_service;
  -[SUScriptObject unlock](self, "unlock");
  if (service == 1)
  {
    -[SUScriptSubscriptionStatusRequest serviceNameAppleMusic](self, "serviceNameAppleMusic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setCarrierBundleProvisioningStyleName:(id)a3
{
  int64_t v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("never")) & 1) != 0)
    {
      v4 = 0;
      goto LABEL_9;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("once")) & 1) != 0)
      goto LABEL_8;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("always")) & 1) != 0)
    {
      v4 = 2;
      goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
LABEL_8:
  v4 = 1;
LABEL_9:
  -[SUScriptObject lock](self, "lock");
  if (self->_carrierBundleProvisioningStyle != v4)
    self->_carrierBundleProvisioningStyle = v4;
  -[SUScriptObject unlock](self, "unlock");

}

- (void)setIgnoreCache:(id)a3
{
  int v4;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v5, "BOOLValue");
    -[SUScriptObject lock](self, "lock");
    if (self->_ignoreCache != v4)
      self->_ignoreCache = v4;
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

- (void)setReasonName:(id)a3
{
  void *v4;
  char v5;
  int64_t v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[SUScriptSubscriptionStatusRequest reasonNameDeepLink](self, "reasonNameDeepLink"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v7, "isEqualToString:", v4),
        v4,
        (v5 & 1) != 0))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v6 = 0;
  }
  -[SUScriptObject lock](self, "lock");
  if (self->_reason != v6)
    self->_reason = v6;
  -[SUScriptObject unlock](self, "unlock");

}

- (void)setServiceName:(id)a3
{
  void *v4;
  char v5;
  int64_t v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[SUScriptSubscriptionStatusRequest serviceNameAppleMusic](self, "serviceNameAppleMusic"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v7, "isEqualToString:", v4),
        v4,
        (v5 & 1) != 0))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v6 = 0;
  }
  -[SUScriptObject lock](self, "lock");
  if (self->_service != v6)
    self->_service = v6;
  -[SUScriptObject unlock](self, "unlock");

}

- (id)wantsPartialResults
{
  _BOOL4 wantsPartialResults;
  id *v4;

  -[SUScriptObject lock](self, "lock");
  wantsPartialResults = self->_wantsPartialResults;
  -[SUScriptObject unlock](self, "unlock");
  v4 = (id *)MEMORY[0x24BDBD270];
  if (!wantsPartialResults)
    v4 = (id *)MEMORY[0x24BDBD268];
  return *v4;
}

- (void)setWantsPartialResults:(id)a3
{
  int v4;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v5, "BOOLValue");
    -[SUScriptObject lock](self, "lock");
    if (self->_wantsPartialResults != v4)
      self->_wantsPartialResults = v4;
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

- (NSString)reasonNameDeepLink
{
  return (NSString *)CFSTR("deepLink");
}

- (NSString)serviceNameAppleMusic
{
  return (NSString *)CFSTR("AppleMusic");
}

- (void)performRequestWithCallbackFunction:(id)a3
{
  id v4;
  SUScriptFunction *v5;
  int64_t service;
  int64_t reason;
  int64_t carrierBundleProvisioningStyle;
  _BOOL4 ignoreCache;
  BOOL wantsPartialResults;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  SUScriptFunction *v15;
  _QWORD v16[5];
  SUScriptFunction *v17;
  BOOL v18;
  BOOL v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", v4);
    -[SUScriptFunction setThisObject:](v5, "setThisObject:", self);
    -[SUScriptObject lock](self, "lock");
    service = self->_service;
    reason = self->_reason;
    carrierBundleProvisioningStyle = self->_carrierBundleProvisioningStyle;
    ignoreCache = self->_ignoreCache;
    wantsPartialResults = self->_wantsPartialResults;
    -[SUScriptObject unlock](self, "unlock");
    if (!service)
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v11 = reason == 1;
    v12 = (void *)objc_msgSend(objc_alloc((Class)getICStoreRequestContextClass[0]()), "initWithBlock:", &__block_literal_global_12);
    v13 = (void *)objc_msgSend(objc_alloc((Class)getICMusicSubscriptionStatusRequestClass[0]()), "initWithStoreRequestContext:", v12);
    objc_msgSend(v13, "setCarrierBundleProvisioningStyle:", carrierBundleProvisioningStyle);
    objc_msgSend(v13, "setReason:", v11);
    if (ignoreCache)
    {
      objc_msgSend(v13, "setShouldIgnoreCache:", 1);
    }
    else
    {
      objc_msgSend(v13, "setAllowsFallbackToExpiredStatus:", 1);
      objc_msgSend(v13, "setAllowsFallbackToStatusNeedingReload:", 1);
    }
    objc_msgSend((Class)getICMusicSubscriptionStatusControllerClass[0](), "sharedStatusController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __72__SUScriptSubscriptionStatusRequest_performRequestWithCallbackFunction___block_invoke_2;
    v16[3] = &unk_24DE7D920;
    v18 = ignoreCache;
    v19 = wantsPartialResults;
    v16[4] = self;
    v17 = v5;
    v15 = v5;
    objc_msgSend(v14, "performSubscriptionStatusRequest:withStatusHandler:", v13, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

void __72__SUScriptSubscriptionStatusRequest_performRequestWithCallbackFunction___block_invoke(uint64_t a1, void *a2)
{
  Class (__cdecl *v2)();
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (Class (__cdecl *)())getICUserIdentityClass_0[0];
  v3 = a2;
  -[objc_class activeAccount](v2(), "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentity:", v4);

  objc_msgSend((Class)getICUserIdentityStoreClass[0](), "defaultIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentityStore:", v5);

  objc_msgSend(v3, "setAllowsExpiredBags:", 1);
  v6 = (id)objc_msgSend(objc_alloc((Class)getICURLResponseAuthenticationProviderClass[0]()), "initWithUserInteractionLevel:", 1);
  objc_msgSend(v3, "setAuthenticationProvider:", v6);

}

void __72__SUScriptSubscriptionStatusRequest_performRequestWithCallbackFunction___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v5 = a2;
  objc_msgSend(v5, "subscriptionStatus");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinalResponse");

  if (a3 && !*(_BYTE *)(a1 + 48))
  {
    objc_msgSend((Class)getICUserIdentityClass_0[0](), "autoupdatingActiveAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class sharedMonitorForIdentity:](getICMusicSubscriptionStatusMonitorClass_0(), "sharedMonitorForIdentity:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscriptionStatus");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = 1;
    v8 = (void *)v11;
    goto LABEL_8;
  }
  if ((v6 & 1) != 0)
  {
    v7 = 1;
    v8 = v12;
LABEL_8:
    v13 = v8;
    objc_msgSend(*(id *)(a1 + 32), "_handleRequestCompletionWithSubscriptionStatus:isFinal:scriptCallbackFunction:", v8, v7, *(_QWORD *)(a1 + 40));
    v8 = v13;
    goto LABEL_9;
  }
  v8 = v12;
  if (*(_BYTE *)(a1 + 49))
  {
    v7 = 0;
    goto LABEL_8;
  }
LABEL_9:

}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_54, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptSubscriptionStatusRequest;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_39, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptSubscriptionStatusRequest;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptSubscriptionStatusRequest;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_54, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  void *v2;

  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_39 = (uint64_t)sel_performRequestWithCallbackFunction_;
    unk_255186C60 = CFSTR("perform");
    v2 = (void *)__KeyMapping_54;
    __KeyMapping_54 = (uint64_t)&unk_24DEDC6D0;

  }
}

- (void)_handleRequestCompletionWithSubscriptionStatus:(id)a3 isFinal:(BOOL)a4 scriptCallbackFunction:(id)a5
{
  _BOOL8 v5;
  id v7;
  SUScriptSubscriptionStatusResponse *v8;
  void *v9;
  id v10;

  v5 = a4;
  v10 = a5;
  v7 = a3;
  v8 = -[SUScriptSubscriptionStatusResponse initWithSubscriptionStatus:isFinal:]([SUScriptSubscriptionStatusResponse alloc], "initWithSubscriptionStatus:isFinal:", v7, v5);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callWithArguments:", v9);

  if (v5)
    objc_msgSend(v10, "setThisObject:", 0);

}

@end
