@implementation ICTelephonyController

- (id)_init
{
  ICTelephonyController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *telephonyCallbackQueue;
  NSObject *v7;
  _QWORD block[4];
  ICTelephonyController *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICTelephonyController;
  v2 = -[ICTelephonyController init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICTelephonyController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICTelephonyController.telephonyCallbackQueue", 0);
    telephonyCallbackQueue = v2->_telephonyCallbackQueue;
    v2->_telephonyCallbackQueue = (OS_dispatch_queue *)v5;

    v7 = v2->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__ICTelephonyController__init__block_invoke;
    block[3] = &unk_1E43913D8;
    v10 = v2;
    dispatch_sync(v7, block);

  }
  return v2;
}

- (void)dealloc
{
  NSObject *accessQueue;
  objc_super v4;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ICTelephonyController_dealloc__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)ICTelephonyController;
  -[ICTelephonyController dealloc](&v4, sel_dealloc);
}

- (NSString)phoneNumber
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29695;
  v10 = __Block_byref_object_dispose__29696;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__ICTelephonyController_phoneNumber__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)providerName
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29695;
  v10 = __Block_byref_object_dispose__29696;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ICTelephonyController_providerName__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)mobileSubscriberCountryCode
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29695;
  v10 = __Block_byref_object_dispose__29696;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__ICTelephonyController_mobileSubscriberCountryCode__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)mobileSubscriberNetworkCode
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29695;
  v10 = __Block_byref_object_dispose__29696;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__ICTelephonyController_mobileSubscriberNetworkCode__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)IMEI
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29695;
  v10 = __Block_byref_object_dispose__29696;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__ICTelephonyController_IMEI__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (BOOL)sendSMSWithText:(id)a3 toPhoneNumber:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  char v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__29695;
  v24 = __Block_byref_object_dispose__29696;
  v25 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ICTelephonyController_sendSMSWithText_toPhoneNumber_error___block_invoke;
  block[3] = &unk_1E438F458;
  block[4] = self;
  v11 = v9;
  v16 = v11;
  v18 = &v26;
  v12 = v8;
  v17 = v12;
  v19 = &v20;
  dispatch_sync(accessQueue, block);
  if (a5)
    *a5 = objc_retainAutorelease((id)v21[5]);
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)activeSubscriptionsDidChange
{
  NSObject *v3;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Telephony active subscriptions did change.", buf, 2u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ICTelephonyController_activeSubscriptionsDidChange__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)phoneNumberAvailable:(id)a3
{
  NSObject *v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Telephony phone number available.", buf, 2u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ICTelephonyController_phoneNumberAvailable___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)phoneNumberChanged:(id)a3
{
  NSObject *v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Telephony phone number changed.", buf, 2u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ICTelephonyController_phoneNumberChanged___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (BOOL)_ensureTelephonyHandlesAreReady
{
  void *v3;
  void *v4;
  BOOL v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[ICTelephonyController _telephonyClient](self, "_telephonyClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICTelephonyController _telephonySubscriptionContext](self, "_telephonySubscriptionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_handleActiveSubscriptionsDidChange
{
  CTXPCServiceSubscriptionContext *telephonySubscriptionContext;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  telephonySubscriptionContext = self->_telephonySubscriptionContext;
  self->_telephonySubscriptionContext = 0;

  -[ICTelephonyController _ensureTelephonyHandlesAreReady](self, "_ensureTelephonyHandlesAreReady");
  -[ICTelephonyController _updatePhoneNumberAllowingDidChangeNotification:](self, "_updatePhoneNumberAllowingDidChangeNotification:", 1);
}

- (id)_telephonyClient
{
  CoreTelephonyClient *telephonyClient;
  void *v4;
  int v5;
  CoreTelephonyClient *v6;
  CoreTelephonyClient *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  os_log_type_t v12;
  __int16 v14;
  __int16 v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  telephonyClient = self->_telephonyClient;
  if (!telephonyClient)
  {
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasTelephonyCapability");

    if (!v5)
    {
      v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 0;
        v9 = "Current device does not have telephony capability. Skipping telephony client initialization.";
        v10 = (uint8_t *)&v14;
        v11 = v8;
        v12 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:

      telephonyClient = self->_telephonyClient;
      return telephonyClient;
    }
    v6 = (CoreTelephonyClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", self->_telephonyCallbackQueue);
    v7 = self->_telephonyClient;
    self->_telephonyClient = v6;

    -[CoreTelephonyClient setDelegate:](self->_telephonyClient, "setDelegate:", self);
    telephonyClient = self->_telephonyClient;
    if (!telephonyClient)
    {
      v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v15 = 0;
        v9 = "Failed to instantiate CoreTelephonyClient.";
        v10 = (uint8_t *)&v15;
        v11 = v8;
        v12 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_1A03E3000, v11, v12, v9, v10, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  return telephonyClient;
}

- (id)_telephonySubscriptionContext
{
  CTXPCServiceSubscriptionContext *telephonySubscriptionContext;
  id *p_telephonySubscriptionContext;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  p_telephonySubscriptionContext = (id *)&self->_telephonySubscriptionContext;
  telephonySubscriptionContext = self->_telephonySubscriptionContext;
  if (!telephonySubscriptionContext)
  {
    -[ICTelephonyController _telephonyClient](self, "_telephonyClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
LABEL_15:

      telephonySubscriptionContext = (CTXPCServiceSubscriptionContext *)*p_telephonySubscriptionContext;
      return telephonySubscriptionContext;
    }
    v21 = 0;
    objc_msgSend(v5, "getUserDefaultVoiceSubscriptionContext:", &v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21;
    v9 = v8;
    if (v7 || !v8)
    {
      if (!v7)
      {
        v20 = v8;
        objc_msgSend(v6, "getActiveContexts:", &v20);
        v10 = objc_claimAutoreleasedReturnValue();
        v16 = v20;

        v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          -[NSObject subscriptions](v10, "subscriptions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v18;
          _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "Could not find a valid telephony subscription context. Available telephony subscription contexts: %{public}@.", buf, 0xCu);

        }
        v9 = v16;
        goto LABEL_14;
      }
      objc_storeStrong(p_telephonySubscriptionContext, v7);
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v7, "slotID");
        *(_DWORD *)buf = 138543618;
        v23 = v7;
        v24 = 2048;
        v25 = v15;
        v11 = "Found telephony subscription context %{public}@ at slot %ld as the user default voice one.";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEFAULT;
        v14 = 22;
        goto LABEL_10;
      }
    }
    else
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v9;
        v11 = "Failed to get telephony user default voice subscription context with error: %{public}@.";
        v12 = v10;
        v13 = OS_LOG_TYPE_ERROR;
        v14 = 12;
LABEL_10:
        _os_log_impl(&dword_1A03E3000, v12, v13, v11, buf, v14);
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  return telephonySubscriptionContext;
}

- (void)_updatePhoneNumberAllowingDidChangeNotification:(BOOL)a3
{
  _BOOL4 v3;
  CoreTelephonyClient *telephonyClient;
  CTXPCServiceSubscriptionContext *telephonySubscriptionContext;
  void *v7;
  ICTelephonyController *v8;
  ICTelephonyController *v9;
  BOOL v10;
  NSString *v11;
  NSObject *v12;
  NSString *v14;
  NSString *v15;
  char v16;
  NSObject *v17;
  NSString *phoneNumber;
  NSString *v19;
  NSString *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  ICTelephonyController *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  NSString *v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (-[ICTelephonyController _ensureTelephonyHandlesAreReady](self, "_ensureTelephonyHandlesAreReady"))
  {
    telephonyClient = self->_telephonyClient;
    telephonySubscriptionContext = self->_telephonySubscriptionContext;
    v23 = 0;
    -[CoreTelephonyClient getPhoneNumber:error:](telephonyClient, "getPhoneNumber:error:", telephonySubscriptionContext, &v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (ICTelephonyController *)v23;
    v9 = v8;
    if (v7)
      v10 = 1;
    else
      v10 = v8 == 0;
    if (v10)
    {
      objc_msgSend(v7, "number");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v9;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "Failed to retrieve telephony phone number with error: %{public}@.", buf, 0xCu);
      }

      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  v14 = self->_phoneNumber;
  if (v14 == v11)
  {

  }
  else
  {
    v15 = v14;
    v16 = -[NSString isEqual:](v14, "isEqual:", v11);

    if ((v16 & 1) == 0)
    {
      v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        phoneNumber = self->_phoneNumber;
        *(_DWORD *)buf = 138412802;
        v25 = self;
        v26 = 2112;
        v27 = phoneNumber;
        v28 = 2112;
        v29 = v11;
        _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%@ phone number changed from %@ to %@.", buf, 0x20u);
      }

      v19 = (NSString *)-[NSString copy](v11, "copy");
      v20 = self->_phoneNumber;
      self->_phoneNumber = v19;

      if (v3)
      {
        dispatch_get_global_queue(0, 0);
        v21 = objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __73__ICTelephonyController__updatePhoneNumberAllowingDidChangeNotification___block_invoke;
        v22[3] = &unk_1E43913D8;
        v22[4] = self;
        dispatch_async(v21, v22);

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonySubscriptionContext, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_telephonyCallbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __73__ICTelephonyController__updatePhoneNumberAllowingDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICTelephonyPhoneNumberDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __44__ICTelephonyController_phoneNumberChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePhoneNumberAllowingDidChangeNotification:", 1);
}

uint64_t __46__ICTelephonyController_phoneNumberAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePhoneNumberAllowingDidChangeNotification:", 1);
}

uint64_t __53__ICTelephonyController_activeSubscriptionsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleActiveSubscriptionsDidChange");
}

void __61__ICTelephonyController_sendSMSWithText_toPhoneNumber_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_ensureTelephonyHandlesAreReady"))
  {
    objc_msgSend(MEMORY[0x1E0CA6DD0], "phoneNumberWithDigits:digits:countryCode:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "slotID"), *(_QWORD *)(a1 + 40), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA6DB0], "sharedMessageCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "canonicalFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "sendSMSWithText:text:serviceCenter:toAddress:", v4, v5, 0, v6);

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Telephony request to send SMS to %@ failed. Telephony context: %{public}@.", buf, 0x16u);
    }

    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "slotID");
    if (v10 > 2)
      v11 = 0;
    else
      v11 = off_1E438F478[v10];
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -8000, CFSTR("Failed to send SMS using telephony slot: %@."), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

void __29__ICTelephonyController_IMEI__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_ensureTelephonyHandlesAreReady"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 32);
    v4 = *(_QWORD *)(v2 + 40);
    v12 = 0;
    objc_msgSend(v3, "getMobileEquipmentInfoFor:error:", v4, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    objc_msgSend(v5, "IMEI");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (v5)
      v10 = 1;
    else
      v10 = v6 == 0;
    if (!v10)
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v6;
        _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve telephony mobile equipment info with error: %{public}@.", buf, 0xCu);
      }

    }
  }
}

void __52__ICTelephonyController_mobileSubscriberNetworkCode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_ensureTelephonyHandlesAreReady"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 32);
    v4 = *(_QWORD *)(v2 + 40);
    v11 = 0;
    v5 = objc_msgSend(v3, "copyMobileSubscriberNetworkCode:error:", v4, &v11);
    v6 = v11;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      v9 = 1;
    else
      v9 = v6 == 0;
    if (!v9)
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v6;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve telephony mobile subscriber network code with error: %{public}@.", buf, 0xCu);
      }

    }
  }
}

void __52__ICTelephonyController_mobileSubscriberCountryCode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_ensureTelephonyHandlesAreReady"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 32);
    v4 = *(_QWORD *)(v2 + 40);
    v11 = 0;
    v5 = objc_msgSend(v3, "copyMobileSubscriberCountryCode:error:", v4, &v11);
    v6 = v11;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      v9 = 1;
    else
      v9 = v6 == 0;
    if (!v9)
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v6;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve telephony mobile subscriber country code with error: %{public}@.", buf, 0xCu);
      }

    }
  }
}

void __37__ICTelephonyController_providerName__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "_ensureTelephonyHandlesAreReady"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    v5 = *(_QWORD *)(v3 + 40);
    v8 = 0;
    v6 = (void *)objc_msgSend(v4, "copyCarrierBundleValue:key:bundleType:error:", v5, CFSTR("CarrierName"), v2, &v8);
    v7 = v8;
    if (_NSIsNSString())
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);

  }
}

void __36__ICTelephonyController_phoneNumber__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __32__ICTelephonyController_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:", 0);
}

uint64_t __30__ICTelephonyController__init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePhoneNumberAllowingDidChangeNotification:", 0);
}

+ (ICTelephonyController)sharedController
{
  if (sharedController_sOnceToken != -1)
    dispatch_once(&sharedController_sOnceToken, &__block_literal_global_29725);
  return (ICTelephonyController *)(id)sharedController_sSharedController;
}

void __41__ICTelephonyController_sharedController__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICTelephonyController _init]([ICTelephonyController alloc], "_init");
  v1 = (void *)sharedController_sSharedController;
  sharedController_sSharedController = (uint64_t)v0;

}

@end
