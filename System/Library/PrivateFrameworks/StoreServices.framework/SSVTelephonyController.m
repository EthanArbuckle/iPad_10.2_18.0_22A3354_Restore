@implementation SSVTelephonyController

uint64_t __31__SSVTelephonyController__init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ensureTelephonyHandlesAreReady");
}

- (BOOL)_ensureTelephonyHandlesAreReady
{
  void *v3;
  void *v4;
  BOOL v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[SSVTelephonyController _telephonyClient](self, "_telephonyClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SSVTelephonyController _telephonySubscriptionContext](self, "_telephonySubscriptionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_telephonyClient
{
  CoreTelephonyClient *v3;
  CoreTelephonyClient *telephonyClient;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_telephonyClient)
  {
    if (!self->_hasTelephonyCapability)
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = objc_msgSend(v5, "shouldLog");
      if (objc_msgSend(v5, "shouldLogToDisk"))
        v10 = v9 | 2;
      else
        v10 = v9;
      objc_msgSend(v5, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        v10 &= 2u;
      if (!v10)
        goto LABEL_34;
LABEL_22:
      v27 = 138543362;
      v28 = (id)objc_opt_class();
      v11 = v28;
      LODWORD(v26) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

LABEL_32:
      if (!v12)
      {
LABEL_35:

        return self->_telephonyClient;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v27, v26);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog(v5, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v8);
LABEL_34:

      goto LABEL_35;
    }
    if (!objc_msgSend((id)objc_opt_class(), "_hasRequiredTelephonyEntitlement"))
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13 = objc_msgSend(v5, "shouldLog");
      if (objc_msgSend(v5, "shouldLogToDisk"))
        v14 = v13 | 2;
      else
        v14 = v13;
      objc_msgSend(v5, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        v14 &= 2u;
      if (!v14)
        goto LABEL_34;
      v15 = (void *)objc_opt_class();
      v16 = (void *)MEMORY[0x1E0CB3898];
      v17 = v15;
      objc_msgSend(v16, "processInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "processName");
      v27 = 138543618;
      v28 = v15;
      v29 = 2114;
      v30 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v26) = 22;
      v12 = (void *)_os_log_send_and_compose_impl();

      goto LABEL_32;
    }
    v3 = (CoreTelephonyClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", self->_telephonyCallbackQueue);
    telephonyClient = self->_telephonyClient;
    self->_telephonyClient = v3;

    -[CoreTelephonyClient setDelegate:](self->_telephonyClient, "setDelegate:", self);
    if (!self->_telephonyClient)
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v6 = objc_msgSend(v5, "shouldLog");
      if (objc_msgSend(v5, "shouldLogToDisk"))
        v7 = v6 | 2;
      else
        v7 = v6;
      objc_msgSend(v5, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v7 &= 2u;
      if (!v7)
        goto LABEL_34;
      goto LABEL_22;
    }
  }
  return self->_telephonyClient;
}

- (id)_telephonySubscriptionContext
{
  CTXPCServiceSubscriptionContext *telephonySubscriptionContext;
  CTXPCServiceSubscriptionContext **p_telephonySubscriptionContext;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  int v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  int v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  p_telephonySubscriptionContext = &self->_telephonySubscriptionContext;
  telephonySubscriptionContext = self->_telephonySubscriptionContext;
  if (!telephonySubscriptionContext)
  {
    -[SSVTelephonyController _telephonyClient](self, "_telephonyClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
LABEL_29:

      telephonySubscriptionContext = *p_telephonySubscriptionContext;
      return telephonySubscriptionContext;
    }
    v44 = 0;
    objc_msgSend(v5, "getUserDefaultVoiceSubscriptionContext:", &v44);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v44;
    v9 = v8;
    if (v7 || !v8)
    {
      if (!v7)
      {
        v43 = v8;
        objc_msgSend(v6, "getActiveContexts:", &v43);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v43;

        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        v29 = -[NSObject shouldLog](v13, "shouldLog");
        if (-[NSObject shouldLogToDisk](v13, "shouldLogToDisk"))
          v30 = v29 | 2;
        else
          v30 = v29;
        -[NSObject OSLogObject](v13, "OSLogObject");
        v31 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          v30 &= 2u;
        if (v30)
        {
          v32 = (void *)objc_opt_class();
          v42 = v32;
          objc_msgSend(v10, "subscriptions");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 138543618;
          v46 = v32;
          v47 = 2114;
          v48 = v33;
          LODWORD(v41) = 22;
          v34 = (void *)_os_log_send_and_compose_impl();

          if (!v34)
            goto LABEL_27;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v34, 4, &v45, v41);
          v31 = objc_claimAutoreleasedReturnValue();
          free(v34);
          SSFileLog(v13, CFSTR("%@"), v35, v36, v37, v38, v39, v40, (uint64_t)v31);
        }

        goto LABEL_27;
      }
      objc_storeStrong((id *)&self->_telephonySubscriptionContext, v7);
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v17 = v16 | 2;
      else
        v17 = v16;
      objc_msgSend(v10, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        v17 &= 2u;
      if (v17)
      {
        v18 = (void *)objc_opt_class();
        v15 = v18;
        v19 = objc_msgSend(v7, "slotID");
        v45 = 138543874;
        v46 = v18;
        v47 = 2114;
        v48 = v7;
        v49 = 2048;
        v50 = v19;
        LODWORD(v41) = 32;
        goto LABEL_24;
      }
    }
    else
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      objc_msgSend(v10, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        v12 &= 2u;
      if (v12)
      {
        v14 = (void *)objc_opt_class();
        v45 = 138543618;
        v46 = v14;
        v47 = 2114;
        v48 = v9;
        v15 = v14;
        LODWORD(v41) = 22;
LABEL_24:
        v20 = (void *)_os_log_send_and_compose_impl();

        if (!v20)
        {
LABEL_28:

          goto LABEL_29;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v45, v41);
        v13 = objc_claimAutoreleasedReturnValue();
        free(v20);
        SSFileLog(v10, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v13);
      }
    }
    v27 = v9;
LABEL_27:

    v9 = v27;
    goto LABEL_28;
  }
  return telephonySubscriptionContext;
}

+ (BOOL)_hasRequiredTelephonyEntitlement
{
  if (_hasRequiredTelephonyEntitlement_sOnceToken != -1)
    dispatch_once(&_hasRequiredTelephonyEntitlement_sOnceToken, &__block_literal_global_42);
  return _hasRequiredTelephonyEntitlement_sHasRequiredTelephonyEntitlement;
}

void __58__SSVTelephonyController__hasRequiredTelephonyEntitlement__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  CFTypeRef v2;
  void *v3;
  CFTypeID v4;
  CFErrorRef error;

  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    error = 0;
    v2 = SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.CommCenter.fine-grained"), &error);
    if (v2)
    {
      v3 = (void *)v2;
      v4 = CFGetTypeID(v2);
      if (v4 == CFArrayGetTypeID())
        _hasRequiredTelephonyEntitlement_sHasRequiredTelephonyEntitlement = objc_msgSend(v3, "containsObject:", CFSTR("spi"));
      CFRelease(v3);
    }
    if (error)
      CFRelease(error);
    CFRelease(v1);
  }
}

void __42__SSVTelephonyController_sharedController__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SSVTelephonyController _init]([SSVTelephonyController alloc], "_init");
  v1 = (void *)sharedController_sSharedController;
  sharedController_sSharedController = (uint64_t)v0;

}

- (id)_init
{
  SSVTelephonyController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *notificationQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *telephonyCallbackQueue;
  NSObject *v9;
  _QWORD block[4];
  SSVTelephonyController *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SSVTelephonyController;
  v2 = -[SSVTelephonyController init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSVTelephonyController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.StoreServices.SSVTelephonyController.notificationQueue", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.StoreServices.SSVTelephonyController.telephonyCallbackQueue", 0);
    telephonyCallbackQueue = v2->_telephonyCallbackQueue;
    v2->_telephonyCallbackQueue = (OS_dispatch_queue *)v7;

    v2->_hasTelephonyCapability = MGGetBoolAnswer();
    v2->_isPhoneNumberAccessRestricted = MGGetBoolAnswer();
    v9 = v2->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__SSVTelephonyController__init__block_invoke;
    block[3] = &unk_1E47B8790;
    v12 = v2;
    dispatch_sync(v9, block);

  }
  return v2;
}

void __37__SSVTelephonyController_phoneNumber__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_phoneNumber");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

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
  v9 = __Block_byref_object_copy__31;
  v10 = __Block_byref_object_dispose__31;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SSVTelephonyController_phoneNumber__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (BOOL)isPhoneNumberAccessRestricted
{
  return self->_isPhoneNumberAccessRestricted;
}

- (id)_phoneNumber
{
  NSString *v3;
  NSString *v4;
  CFTypeID v5;
  NSString *phoneNumber;
  CoreTelephonyClient *telephonyClient;
  CTXPCServiceSubscriptionContext *telephonySubscriptionContext;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString *v25;
  uint64_t v27;
  id v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_hasTelephonyCapability && !self->_phoneNumber)
  {
    if (MGGetBoolAnswer())
    {
      v3 = (NSString *)CFPreferencesCopyAppValue(CFSTR("ISPhoneNumber"), CFSTR("com.apple.itunesstored"));
      if (v3)
      {
        v4 = v3;
        v5 = CFGetTypeID(v3);
        if (v5 == CFStringGetTypeID())
        {
          phoneNumber = self->_phoneNumber;
          self->_phoneNumber = v4;

        }
        else
        {
          CFRelease(v4);
        }
      }
    }
    if (!self->_phoneNumber
      && -[SSVTelephonyController _ensureTelephonyHandlesAreReady](self, "_ensureTelephonyHandlesAreReady"))
    {
      telephonyClient = self->_telephonyClient;
      telephonySubscriptionContext = self->_telephonySubscriptionContext;
      v28 = 0;
      -[CoreTelephonyClient getPhoneNumber:error:](telephonyClient, "getPhoneNumber:error:", telephonySubscriptionContext, &v28);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v28;
      v11 = v10;
      if (v9 || !v10)
      {
        objc_msgSend(v9, "number");
        v25 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = self->_phoneNumber;
        self->_phoneNumber = v25;
        goto LABEL_24;
      }
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13 = objc_msgSend(v12, "shouldLog");
      if (objc_msgSend(v12, "shouldLogToDisk"))
        v14 = v13 | 2;
      else
        v14 = v13;
      objc_msgSend(v12, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        v14 &= 2u;
      if (v14)
      {
        v16 = (void *)objc_opt_class();
        v29 = 138543618;
        v30 = v16;
        v31 = 2114;
        v32 = v11;
        v17 = v16;
        LODWORD(v27) = 22;
        v18 = (void *)_os_log_send_and_compose_impl();

        if (!v18)
        {
LABEL_24:

          return self->_phoneNumber;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v29, v27);
        v15 = objc_claimAutoreleasedReturnValue();
        free(v18);
        SSFileLog(v12, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v15);
      }

      goto LABEL_24;
    }
  }
  return self->_phoneNumber;
}

+ (SSVTelephonyController)sharedController
{
  if (sharedController_sOnceToken != -1)
    dispatch_once(&sharedController_sOnceToken, &__block_literal_global_17);
  return (SSVTelephonyController *)(id)sharedController_sSharedController;
}

- (void)dealloc
{
  NSObject *accessQueue;
  objc_super v4;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SSVTelephonyController_dealloc__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)SSVTelephonyController;
  -[SSVTelephonyController dealloc](&v4, sel_dealloc);
}

uint64_t __33__SSVTelephonyController_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setDelegate:", 0);
}

- (NSString)operatorName
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
  v9 = __Block_byref_object_copy__31;
  v10 = __Block_byref_object_dispose__31;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__SSVTelephonyController_operatorName__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __38__SSVTelephonyController_operatorName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_operatorName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)providerName
{
  CFPropertyListRef v3;
  const void *v4;
  CFTypeID v5;
  void *v6;
  void *v7;
  NSObject *accessQueue;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__31;
  v16 = __Block_byref_object_dispose__31;
  v17 = 0;
  if (MGGetBoolAnswer())
  {
    v3 = CFPreferencesCopyAppValue(CFSTR("ISCellularOperatorName"), CFSTR("com.apple.itunesstored"));
    v4 = v3;
    if (v3)
    {
      v5 = CFGetTypeID(v3);
      if (v5 == CFStringGetTypeID())
      {
        v6 = (void *)v13[5];
        v13[5] = (uint64_t)v4;

      }
      else
      {
        CFRelease(v4);
      }
    }
  }
  v7 = (void *)v13[5];
  if (!v7)
  {
    accessQueue = self->_accessQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__SSVTelephonyController_providerName__block_invoke;
    v11[3] = &unk_1E47B8718;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(accessQueue, v11);
    v7 = (void *)v13[5];
  }
  v9 = v7;
  _Block_object_dispose(&v12, 8);

  return (NSString *)v9;
}

void __38__SSVTelephonyController_providerName__block_invoke(uint64_t a1)
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
    v4 = *(void **)(v3 + 64);
    v5 = *(_QWORD *)(v3 + 72);
    v8 = 0;
    v6 = (void *)objc_msgSend(v4, "copyCarrierBundleValue:key:bundleType:error:", v5, CFSTR("CarrierName"), v2, &v8);
    v7 = v8;
    if (objc_msgSend(v6, "isNSString"))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);

  }
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
  v9 = __Block_byref_object_copy__31;
  v10 = __Block_byref_object_dispose__31;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SSVTelephonyController_mobileSubscriberCountryCode__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __53__SSVTelephonyController_mobileSubscriberCountryCode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_ensureTelephonyHandlesAreReady"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 64);
    v4 = *(_QWORD *)(v2 + 72);
    v24 = 0;
    v5 = objc_msgSend(v3, "copyMobileSubscriberCountryCode:error:", v4, &v24);
    v6 = v24;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      v9 = 1;
    else
      v9 = v6 == 0;
    if (v9)
      goto LABEL_18;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      v14 = (void *)objc_opt_class();
      v25 = 138543618;
      v26 = v14;
      v27 = 2114;
      v28 = v6;
      v15 = v14;
      LODWORD(v23) = 22;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_17:

LABEL_18:
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v25, v23);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v10, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v13);
    }

    goto LABEL_17;
  }
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
  v9 = __Block_byref_object_copy__31;
  v10 = __Block_byref_object_dispose__31;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SSVTelephonyController_mobileSubscriberNetworkCode__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __53__SSVTelephonyController_mobileSubscriberNetworkCode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_ensureTelephonyHandlesAreReady"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 64);
    v4 = *(_QWORD *)(v2 + 72);
    v24 = 0;
    v5 = objc_msgSend(v3, "copyMobileSubscriberNetworkCode:error:", v4, &v24);
    v6 = v24;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      v9 = 1;
    else
      v9 = v6 == 0;
    if (v9)
      goto LABEL_18;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      v14 = (void *)objc_opt_class();
      v25 = 138543618;
      v26 = v14;
      v27 = 2114;
      v28 = v6;
      v15 = v14;
      LODWORD(v23) = 22;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_17:

LABEL_18:
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v25, v23);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v10, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v13);
    }

    goto LABEL_17;
  }
}

- (NSString)registrationStatus
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
  v9 = __Block_byref_object_copy__31;
  v10 = __Block_byref_object_dispose__31;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SSVTelephonyController_registrationStatus__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __44__SSVTelephonyController_registrationStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_registrationStatus");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

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
  v9 = __Block_byref_object_copy__31;
  v10 = __Block_byref_object_dispose__31;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__SSVTelephonyController_IMEI__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __30__SSVTelephonyController_IMEI__block_invoke(uint64_t a1)
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
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_ensureTelephonyHandlesAreReady"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 64);
    v4 = *(_QWORD *)(v2 + 72);
    v25 = 0;
    objc_msgSend(v3, "getMobileEquipmentInfoFor:error:", v4, &v25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v25;
    objc_msgSend(v5, "IMEI");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (v5)
      v10 = 1;
    else
      v10 = v6 == 0;
    if (v10)
      goto LABEL_18;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      v13 &= 2u;
    if (v13)
    {
      v15 = (void *)objc_opt_class();
      v26 = 138543618;
      v27 = v15;
      v28 = 2114;
      v29 = v6;
      v16 = v15;
      LODWORD(v24) = 22;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_17:

LABEL_18:
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, &v26, v24);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v17);
      SSFileLog(v11, CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v14);
    }

    goto LABEL_17;
  }
}

- (BOOL)sendSMSWithText:(id)a3 toPhoneNumber:(id)a4 countryCode:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *accessQueue;
  id v14;
  id v15;
  id v16;
  char v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__31;
  v29 = __Block_byref_object_dispose__31;
  v30 = 0;
  accessQueue = self->_accessQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__SSVTelephonyController_sendSMSWithText_toPhoneNumber_countryCode_error___block_invoke;
  v19[3] = &unk_1E47BD098;
  v19[4] = self;
  v14 = v11;
  v20 = v14;
  v15 = v12;
  v21 = v15;
  v23 = &v31;
  v16 = v10;
  v22 = v16;
  v24 = &v25;
  dispatch_sync(accessQueue, v19);
  if (a6)
    *a6 = objc_retainAutorelease((id)v26[5]);
  v17 = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __74__SSVTelephonyController_sendSMSWithText_toPhoneNumber_countryCode_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_ensureTelephonyHandlesAreReady"))
  {
    objc_msgSend(MEMORY[0x1E0CA6DD0], "phoneNumberWithDigits:digits:countryCode:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "slotID"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA6DB0], "sharedMessageCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "canonicalFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3, "sendSMSWithText:text:serviceCenter:toAddress:", v4, v5, 0, v6);

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v11 = (void *)objc_opt_class();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v33 = 138543874;
      v34 = v11;
      v35 = 2112;
      v36 = v12;
      v37 = 2114;
      v38 = v13;
      v14 = v11;
      LODWORD(v30) = 32;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "slotID");
        if (v22 > 2)
          v23 = 0;
        else
          v23 = off_1E47BD0B8[v22];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to send SMS using telephony slot: %@."), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v31 = *MEMORY[0x1E0CB2D50];
        v32 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("SSErrorDomain"), 720, v26);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v29 = *(void **)(v28 + 40);
        *(_QWORD *)(v28 + 40) = v27;

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v33, v30);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v7, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v10);
    }

    goto LABEL_15;
  }
}

- (void)activeSubscriptionsDidChange
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *accessQueue;
  uint64_t v16;
  _QWORD block[5];
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  v18 = 138543362;
  v19 = (id)objc_opt_class();
  v7 = v19;
  LODWORD(v16) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v18, v16);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_11:

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SSVTelephonyController_activeSubscriptionsDidChange__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __54__SSVTelephonyController_activeSubscriptionsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_ensureTelephonyHandlesAreReady");
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SSVTelephonyController_displayStatusChanged_status___block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __54__SSVTelephonyController_displayStatusChanged_status___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRegistrationStatus");
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SSVTelephonyController_operatorNameChanged_name___block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __51__SSVTelephonyController_operatorNameChanged_name___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateOperatorName");
}

- (void)phoneNumberAvailable:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SSVTelephonyController_phoneNumberAvailable___block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __47__SSVTelephonyController_phoneNumberAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePhoneNumber");
}

- (void)phoneNumberChanged:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SSVTelephonyController_phoneNumberChanged___block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __45__SSVTelephonyController_phoneNumberChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePhoneNumber");
}

- (void)_updatePhoneNumber
{
  NSObject *notificationQueue;
  NSString *phoneNumber;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_isPhoneNumberAccessRestricted)
    goto LABEL_2;
  v7 = self->_phoneNumber;
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = 0;

  -[SSVTelephonyController _phoneNumber](self, "_phoneNumber");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v7 == v5)
  {

    return;
  }
  v6 = -[NSString isEqualToString:](v7, "isEqualToString:", v5);

  if (!v6)
  {
LABEL_2:
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SSVTelephonyController__updatePhoneNumber__block_invoke;
    block[3] = &unk_1E47B8790;
    block[4] = self;
    dispatch_async(notificationQueue, block);
  }
}

void __44__SSVTelephonyController__updatePhoneNumber__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SSVTelephonyPhoneNumberDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (id)_operatorName
{
  NSString *v3;
  NSString *v4;
  CFTypeID v5;
  NSString *operatorName;
  CoreTelephonyClient *telephonyClient;
  CTXPCServiceSubscriptionContext *telephonySubscriptionContext;
  void *v9;
  id v10;
  NSString *v11;
  NSString *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  id v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_operatorName)
  {
    if (MGGetBoolAnswer())
    {
      v3 = (NSString *)CFPreferencesCopyAppValue(CFSTR("ISCellularOperatorName"), CFSTR("com.apple.itunesstored"));
      if (v3)
      {
        v4 = v3;
        v5 = CFGetTypeID(v3);
        if (v5 == CFStringGetTypeID())
        {
          operatorName = self->_operatorName;
          self->_operatorName = v4;

        }
        else
        {
          CFRelease(v4);
        }
      }
    }
    if (!self->_operatorName
      && -[SSVTelephonyController _ensureTelephonyHandlesAreReady](self, "_ensureTelephonyHandlesAreReady"))
    {
      telephonyClient = self->_telephonyClient;
      telephonySubscriptionContext = self->_telephonySubscriptionContext;
      v28 = 0;
      -[CoreTelephonyClient getLocalizedOperatorName:error:](telephonyClient, "getLocalizedOperatorName:error:", telephonySubscriptionContext, &v28);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v28;
      v11 = (NSString *)objc_msgSend(v9, "copy");
      v12 = self->_operatorName;
      self->_operatorName = v11;

      if (self->_operatorName || !v10)
        goto LABEL_23;
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v14 = objc_msgSend(v13, "shouldLog");
      if (objc_msgSend(v13, "shouldLogToDisk"))
        v15 = v14 | 2;
      else
        v15 = v14;
      objc_msgSend(v13, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        v15 &= 2u;
      if (v15)
      {
        v17 = (void *)objc_opt_class();
        v29 = 138543618;
        v30 = v17;
        v31 = 2114;
        v32 = v10;
        v18 = v17;
        LODWORD(v27) = 22;
        v19 = (void *)_os_log_send_and_compose_impl();

        if (!v19)
        {
LABEL_22:

LABEL_23:
          return self->_operatorName;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v29, v27);
        v16 = objc_claimAutoreleasedReturnValue();
        free(v19);
        SSFileLog(v13, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v16);
      }

      goto LABEL_22;
    }
  }
  return self->_operatorName;
}

- (void)_updateOperatorName
{
  NSString *v3;
  NSString *operatorName;
  NSString *v5;
  NSObject *notificationQueue;
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = self->_operatorName;
  operatorName = self->_operatorName;
  self->_operatorName = 0;

  -[SSVTelephonyController _operatorName](self, "_operatorName");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v3 != v5 && !-[NSString isEqualToString:](v3, "isEqualToString:", v5))
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__SSVTelephonyController__updateOperatorName__block_invoke;
    block[3] = &unk_1E47B8790;
    block[4] = self;
    dispatch_async(notificationQueue, block);
  }

}

void __45__SSVTelephonyController__updateOperatorName__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SSVTelephonyOperatorNameDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (id)_registrationStatus
{
  CoreTelephonyClient *telephonyClient;
  CTXPCServiceSubscriptionContext *telephonySubscriptionContext;
  NSString *v5;
  id v6;
  NSString *registrationStatus;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_registrationStatus
    && -[SSVTelephonyController _ensureTelephonyHandlesAreReady](self, "_ensureTelephonyHandlesAreReady"))
  {
    telephonyClient = self->_telephonyClient;
    telephonySubscriptionContext = self->_telephonySubscriptionContext;
    v23 = 0;
    v5 = (NSString *)-[CoreTelephonyClient copyRegistrationStatus:error:](telephonyClient, "copyRegistrationStatus:error:", telephonySubscriptionContext, &v23);
    v6 = v23;
    registrationStatus = self->_registrationStatus;
    self->_registrationStatus = v5;

    if (self->_registrationStatus || !v6)
      goto LABEL_17;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (v10)
    {
      v12 = (void *)objc_opt_class();
      v24 = 138543618;
      v25 = v12;
      v26 = 2114;
      v27 = v6;
      v13 = v12;
      LODWORD(v22) = 22;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_16:

LABEL_17:
        return self->_registrationStatus;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v24, v22);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

    goto LABEL_16;
  }
  return self->_registrationStatus;
}

- (void)_updateRegistrationStatus
{
  NSString *v3;
  NSString *registrationStatus;
  NSString *v5;
  NSObject *notificationQueue;
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = self->_registrationStatus;
  registrationStatus = self->_registrationStatus;
  self->_registrationStatus = 0;

  -[SSVTelephonyController _registrationStatus](self, "_registrationStatus");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v3 != v5 && !-[NSString isEqualToString:](v3, "isEqualToString:", v5))
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SSVTelephonyController__updateRegistrationStatus__block_invoke;
    block[3] = &unk_1E47B8790;
    block[4] = self;
    dispatch_async(notificationQueue, block);
  }

}

void __51__SSVTelephonyController__updateRegistrationStatus__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SSVTelephonyRegistrationDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonySubscriptionContext, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_registrationStatus, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_telephonyCallbackQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
