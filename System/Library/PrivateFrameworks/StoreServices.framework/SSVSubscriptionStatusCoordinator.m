@implementation SSVSubscriptionStatusCoordinator

void __53__SSVSubscriptionStatusCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sCoordinator;
  sCoordinator = (uint64_t)v1;

}

void __51__SSVSubscriptionStatusCoordinator_lastKnownStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40))
  {
    v3 = objc_msgSend((id)v2, "_copyValidStatusForStatus:");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
LABEL_3:

    return;
  }
  if (!*(_BYTE *)(v2 + 24))
  {
    v5 = (void *)objc_msgSend((id)v2, "_copyStatusFromUserDefaults");
    if (v5)
    {
      v9 = v5;
      v6 = objc_msgSend(*(id *)(a1 + 32), "_copyValidStatusForStatus:", v5);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = v9;
    }
    goto LABEL_3;
  }
}

uint64_t __40__SSVSubscriptionStatusCoordinator_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSubscriptionStatusAccessPolicyAllowingNotification:", 0);
}

- (SSVSubscriptionStatus)lastKnownStatus
{
  NSObject *dispatchQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SSVSubscriptionStatusCoordinator_lastKnownStatus__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSVSubscriptionStatus *)v3;
}

- (SSVSubscriptionStatusCoordinator)init
{
  SSVSubscriptionStatusCoordinator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *callbackQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  SSVSubscriptionStatusCoordinator *v10;
  void *v11;
  _QWORD block[4];
  SSVSubscriptionStatusCoordinator *v14;
  _QWORD handler[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SSVSubscriptionStatusCoordinator;
  v2 = -[SSVSubscriptionStatusCoordinator init](&v18, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSVSubscriptionStatusCoordinator.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.StoreServices.SSVSubscriptionStatusCoordinator", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v7 = v2->_dispatchQueue;
    v8 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __40__SSVSubscriptionStatusCoordinator_init__block_invoke;
    handler[3] = &unk_1E47B9768;
    objc_copyWeak(&v16, &location);
    notify_register_dispatch("com.apple.itunesstored.ssvsubscriptionstatuscoordinator.changed", &v2->_notificationToken, v7, handler);
    v9 = v2->_dispatchQueue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __40__SSVSubscriptionStatusCoordinator_init__block_invoke_2;
    block[3] = &unk_1E47B8790;
    v10 = v2;
    v14 = v10;
    dispatch_sync(v9, block);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel__accountStoreChangedNotification, 0x1E47DB6D0, 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel__deviceStoreFrontChangedNotification, CFSTR("SSDeviceStoreFrontChangedNotification"), 0);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_updateSubscriptionStatusAccessPolicyAllowingNotification:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  NSObject *callbackQueue;
  _QWORD block[5];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = +[SSPrivacyController shouldDisplayPrivacyLinkWithIdentifier:](SSPrivacyController, "shouldDisplayPrivacyLinkWithIdentifier:", CFSTR("com.apple.onboarding.applemusic"));
  if (self->_subscriptionStatusAccessPolicy != v5)
  {
    self->_subscriptionStatusAccessPolicy = v5;
    if (v3)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __94__SSVSubscriptionStatusCoordinator__updateSubscriptionStatusAccessPolicyAllowingNotification___block_invoke;
      block[3] = &unk_1E47B8790;
      block[4] = self;
      dispatch_async(callbackQueue, block);
    }
  }
}

- (id)_copyValidStatusForStatus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;

  v3 = a3;
  if (v3)
  {
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "accountIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 == (void *)v7)
    {
      v9 = 1;
    }
    else if (v7)
    {
      v9 = objc_msgSend(v6, "isEqualToNumber:", v7);
    }
    else
    {
      v9 = 0;
    }
    +[SSVTelephonyController sharedController](SSVTelephonyController, "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isPhoneNumberAccessRestricted") & 1) == 0)
    {
      objc_msgSend(v11, "phoneNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "phoneNumber");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v12 != (void *)v13)
      {
        v14 = (void *)v13;
        if (v13)
          v15 = objc_msgSend(v12, "isEqualToString:", v13);
        else
          v15 = 0;

        if ((v9 | v15) != 1)
        {
          v10 = 0;
LABEL_21:

          goto LABEL_22;
        }
LABEL_14:
        v16 = (void *)objc_msgSend(v3, "copy");
        v10 = v16;
        if ((v9 & 1) == 0)
          objc_msgSend(v16, "resetAccountBasedProperties");
        if ((v15 & 1) == 0)
          objc_msgSend(v10, "resetCarrierBundlingProperties");
        goto LABEL_21;
      }

    }
    LOBYTE(v15) = 1;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_22:

  return v10;
}

- (id)_copyStatusFromUserDefaults
{
  CFPropertyListRef v2;
  const void *v3;
  CFTypeID v4;
  SSVSubscriptionStatus *v5;

  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
  v2 = CFPreferencesCopyAppValue(CFSTR("FuseSubscriptionStatus"), CFSTR("com.apple.itunesstored"));
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  if (v4 == CFDictionaryGetTypeID())
    v5 = -[SSVSubscriptionStatus initWithUserDefaultsRepresentation:]([SSVSubscriptionStatus alloc], "initWithUserDefaultsRepresentation:", v3);
  else
    v5 = 0;
  CFRelease(v3);
  return v5;
}

+ (id)sharedCoordinator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SSVSubscriptionStatusCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sOnce != -1)
    dispatch_once(&sOnce, block);
  return (id)sCoordinator;
}

void __40__SSVSubscriptionStatusCoordinator_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_externalChangeNotification");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E47DB6D0, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SSDeviceStoreFrontChangedNotification"), 0);
  notify_cancel(self->_notificationToken);

  v4.receiver = self;
  v4.super_class = (Class)SSVSubscriptionStatusCoordinator;
  -[SSVSubscriptionStatusCoordinator dealloc](&v4, sel_dealloc);
}

+ (id)copyStatusFromUserDefaults
{
  CFPropertyListRef v2;
  const void *v3;
  CFTypeID v4;
  SSVSubscriptionStatus *v5;

  v2 = CFPreferencesCopyAppValue(CFSTR("FuseSubscriptionStatus"), CFSTR("com.apple.itunesstored"));
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  if (v4 == CFDictionaryGetTypeID())
    v5 = -[SSVSubscriptionStatus initWithUserDefaultsRepresentation:]([SSVSubscriptionStatus alloc], "initWithUserDefaultsRepresentation:", v3);
  else
    v5 = 0;
  CFRelease(v3);
  return v5;
}

- (void)getStatusWithOptions:(id)a3 statusBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SSVSubscriptionStatusCoordinator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke;
  block[3] = &unk_1E47B8740;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  char v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  SSVSubscriptionStatusRequest *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  NSObject *v39;
  _QWORD v40[4];
  id v41;
  id location;
  _QWORD block[4];
  id v44;
  id v45;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("SSVSubscriptionStatusOptionIgnoreCache"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) != 0)
    goto LABEL_2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("SSVSubscriptionStatusOptionAllowsExpiredStatuses"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if ((v6 & 1) != 0
      || *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48)
      && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48)),
          v9 = v8,
          v7,
          v9 <= 3600.0))
    {
      v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "_copyValidStatusForStatus:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
      goto LABEL_15;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("SSVSubscriptionStatusOptionAllowsExpiredStatuses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if ((v11 & 1) != 0)
    goto LABEL_10;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "_copyStatusDateFromUserDefaults");
  if (!v4)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v4);
  v14 = v13;

  if (v14 > 3600.0)
  {
LABEL_2:
    v4 = 0;
  }
  else
  {
LABEL_10:
    v15 = (void *)objc_msgSend(*(id *)(a1 + 40), "_copyStatusFromUserDefaults");
    if (v15)
      v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "_copyValidStatusForStatus:", v15);
    else
      v4 = 0;

  }
LABEL_15:
  if (!objc_msgSend(v4, "carrierBundlingStatus") || objc_msgSend(v4, "carrierBundlingStatus") == 3)
    goto LABEL_17;
  if (objc_msgSend(v4, "accountStatus"))
  {
    if (!v4)
      goto LABEL_17;
  }
  else
  {
    v33 = objc_msgSend(v4, "carrierBundlingStatus");
    if (!v4 || v33 != 4)
      goto LABEL_17;
  }
  objc_msgSend(v4, "subscriptionExpirationDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v34
    || (v35 = v34, objc_msgSend(v34, "timeIntervalSinceNow"), v37 = v36, v35, v37 > 2.22044605e-16))
  {
    v38 = *(void **)(a1 + 48);
    v39 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke_2;
    block[3] = &unk_1E47B8A98;
    v45 = v38;
    v44 = v4;
    dispatch_async(v39, block);

    goto LABEL_31;
  }
LABEL_17:
  v16 = *(void **)(a1 + 48);
  if (v16)
  {
    v17 = (void *)objc_msgSend(v16, "copy");
    v18 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    if (!v18)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(void **)(v20 + 72);
      *(_QWORD *)(v20 + 72) = v19;

      v18 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    }
    v22 = (void *)MEMORY[0x1A8585DF0](v17);
    objc_msgSend(v18, "addObject:", v22);

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
  {
    v23 = objc_alloc_init(SSVSubscriptionStatusRequest);
    v24 = *(_QWORD *)(a1 + 40);
    v25 = *(void **)(v24 + 8);
    *(_QWORD *)(v24 + 8) = v23;

    v26 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("SSVSubscriptionStatusOptionAuthenticatesIfNecessary"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAuthenticatesIfNecessary:", objc_msgSend(v27, "BOOLValue"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setCarrierBundleProvisioningStyle:", 1);
    v28 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("SSVSubscriptionStatusOptionLocalizedAuthenticationReason"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setLocalizedAuthenticationReason:", v29);

    v30 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("reason"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setReason:", v31);

    objc_initWeak(&location, *(id *)(a1 + 40));
    v32 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke_3;
    v40[3] = &unk_1E47B97B0;
    objc_copyWeak(&v41, &location);
    objc_msgSend(v32, "startWithStatusResponseBlock:", v40);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
LABEL_31:

}

uint64_t __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), 1, 0);
  return result;
}

void __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleRequestResponseWithStatus:isFinal:error:", v8, a3, v7);

}

- (void)_deviceStoreFrontChangedNotification
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SSVSubscriptionStatusCoordinator__deviceStoreFrontChangedNotification__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __72__SSVSubscriptionStatusCoordinator__deviceStoreFrontChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_externalChangeNotification");
}

- (void)modifyLastKnownStatusUsingBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SSVSubscriptionStatusCoordinator_modifyLastKnownStatusUsingBlock___block_invoke;
  v7[3] = &unk_1E47B8AC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __68__SSVSubscriptionStatusCoordinator_modifyLastKnownStatusUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = v6;
  if (v6)
  {
    v3 = objc_msgSend(v6, "copy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

- (void)reset
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSVSubscriptionStatusCoordinator_reset__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __41__SSVSubscriptionStatusCoordinator_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

}

+ (void)updateUserDefaultsWithStatus:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = (void *)objc_msgSend(a3, "copyUserDefaultsRepresentation");
  if (v3)
  {
    v6 = v3;
    v4 = v3;
    CFPreferencesSetAppValue(CFSTR("FuseSubscriptionStatus"), v4, CFSTR("com.apple.itunesstored"));
    CFRelease(v4);
    v5 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    CFPreferencesSetAppValue(CFSTR("FuseSubscriptionStatusDate"), v5, CFSTR("com.apple.itunesstored"));
    CFRelease(v5);
    CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
    v3 = v6;
  }

}

+ (id)_existingSharedCoordinator
{
  return (id)sCoordinator;
}

- (void)_invalidateLastKnownStatus
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SSVSubscriptionStatusCoordinator__invalidateLastKnownStatus__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __62__SSVSubscriptionStatusCoordinator__invalidateLastKnownStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

}

- (void)_accountStoreChangedNotification
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SSVSubscriptionStatusCoordinator__accountStoreChangedNotification__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __68__SSVSubscriptionStatusCoordinator__accountStoreChangedNotification__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_validateLastKnownStatus");
  return objc_msgSend(*(id *)(a1 + 32), "_updateSubscriptionStatusAccessPolicyAllowingNotification:", 1);
}

- (id)_copyStatusDateFromUserDefaults
{
  CFPropertyListRef v2;
  const void *v3;
  CFTypeID v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
  v2 = CFPreferencesCopyAppValue(CFSTR("FuseSubscriptionStatusDate"), CFSTR("com.apple.itunesstored"));
  v3 = v2;
  if (v2)
  {
    v4 = CFGetTypeID(v2);
    if (v4 != CFDateGetTypeID())
    {
      CFRelease(v3);
      return 0;
    }
  }
  return (id)v3;
}

- (void)_externalChangeNotification
{
  SSVSubscriptionStatus *lastKnownStatus;
  NSDate *lastStatusDate;
  NSObject *callbackQueue;
  _QWORD block[5];

  lastKnownStatus = self->_lastKnownStatus;
  if (lastKnownStatus)
  {
    self->_didReset = 0;
    self->_lastKnownStatus = 0;

    lastStatusDate = self->_lastStatusDate;
    self->_lastStatusDate = 0;

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SSVSubscriptionStatusCoordinator__externalChangeNotification__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __63__SSVSubscriptionStatusCoordinator__externalChangeNotification__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SSVSubscriptionStatusDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_fireStatusBlocksWithStatus:(id)a3 isFinal:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *callbackQueue;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  BOOL v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)-[NSMutableArray copy](self->_statusBlocks, "copy");
  if (v6)
    -[NSMutableArray removeAllObjects](self->_statusBlocks, "removeAllObjects");
  if (objc_msgSend(v10, "count"))
  {
    callbackQueue = self->_callbackQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__SSVSubscriptionStatusCoordinator__fireStatusBlocksWithStatus_isFinal_error___block_invoke;
    v12[3] = &unk_1E47B97D8;
    v13 = v10;
    v14 = v8;
    v16 = v6;
    v15 = v9;
    dispatch_async(callbackQueue, v12);

  }
}

void __78__SSVSubscriptionStatusCoordinator__fireStatusBlocksWithStatus_isFinal_error___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_handleRequestResponseWithStatus:(id)a3 isFinal:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SSVSubscriptionStatusCoordinator *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__SSVSubscriptionStatusCoordinator__handleRequestResponseWithStatus_isFinal_error___block_invoke;
  v13[3] = &unk_1E47B97D8;
  v17 = a4;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

uint64_t __83__SSVSubscriptionStatusCoordinator__handleRequestResponseWithStatus_isFinal_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;

  if (*(_BYTE *)(a1 + 56))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 0;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 40), *(id *)(a1 + 32));
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(void **)(v3 + 48);
      *(_QWORD *)(v3 + 48) = v2;

    }
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = 0;

    v7 = *(_BYTE *)(a1 + 56) != 0;
  }
  else
  {
    v7 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 40), "_fireStatusBlocksWithStatus:isFinal:error:", *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(a1 + 48));
}

void __94__SSVSubscriptionStatusCoordinator__updateSubscriptionStatusAccessPolicyAllowingNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SSVSubscriptionStatusAccessPolicyDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_validateLastKnownStatus
{
  SSVSubscriptionStatus *v3;
  SSVSubscriptionStatus *lastKnownStatus;
  NSDate *lastStatusDate;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_lastKnownStatus)
  {
    v3 = -[SSVSubscriptionStatusCoordinator _copyValidStatusForStatus:](self, "_copyValidStatusForStatus:");
    lastKnownStatus = self->_lastKnownStatus;
    self->_lastKnownStatus = v3;

    if (!self->_lastKnownStatus)
    {
      lastStatusDate = self->_lastStatusDate;
      self->_lastStatusDate = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBlocks, 0);
  objc_storeStrong((id *)&self->_lastStatusDate, 0);
  objc_storeStrong((id *)&self->_lastKnownStatus, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
}

+ (void)beginSuspendingSubscriptionStatusChangeNotifications
{
  NSObject *v2;

  objc_msgSend(a1, "_changeNotificationSuspensionAccessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_36);

}

void __97__SSVSubscriptionStatusCoordinator_Private__beginSuspendingSubscriptionStatusChangeNotifications__block_invoke()
{
  ++_SSVSubscriptionStatusChangeNotificationSuspensionCount;
}

+ (void)endSuspendingSubscriptionStatusChangeNotifications
{
  NSObject *v3;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  objc_msgSend(a1, "_changeNotificationSuspensionAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__SSVSubscriptionStatusCoordinator_Private__endSuspendingSubscriptionStatusChangeNotifications__block_invoke;
  block[3] = &unk_1E47B8A28;
  block[4] = &v5;
  dispatch_sync(v3, block);

  if (*((_BYTE *)v6 + 24))
    objc_msgSend(a1, "_sendChangeNotification");
  _Block_object_dispose(&v5, 8);
}

uint64_t __95__SSVSubscriptionStatusCoordinator_Private__endSuspendingSubscriptionStatusChangeNotifications__block_invoke(uint64_t result)
{
  char v1;

  if (!--_SSVSubscriptionStatusChangeNotificationSuspensionCount)
  {
    v1 = _SSVSubscriptionStatusChangeNotificationWasDeferred;
    if (_SSVSubscriptionStatusChangeNotificationWasDeferred == 1)
    {
      _SSVSubscriptionStatusChangeNotificationWasDeferred = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v1;
    }
  }
  return result;
}

+ (void)removeUserDefaultsForAccountIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_msgSend(a1, "copyStatusFromUserDefaults");
  objc_msgSend(v4, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v5 && objc_msgSend(v6, "isEqual:", v5))
  {
    objc_msgSend(v4, "resetAccountBasedProperties");
    objc_msgSend(a1, "updateUserDefaultsWithStatus:", v4);
  }

}

+ (void)sendChangeNotification
{
  NSObject *v3;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  objc_msgSend(a1, "_changeNotificationSuspensionAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SSVSubscriptionStatusCoordinator_Private__sendChangeNotification__block_invoke;
  block[3] = &unk_1E47B8A28;
  block[4] = &v5;
  dispatch_sync(v3, block);

  if (*((_BYTE *)v6 + 24))
    objc_msgSend(a1, "_sendChangeNotification");
  _Block_object_dispose(&v5, 8);
}

uint64_t __67__SSVSubscriptionStatusCoordinator_Private__sendChangeNotification__block_invoke(uint64_t result)
{
  if (_SSVSubscriptionStatusChangeNotificationSuspensionCount)
    _SSVSubscriptionStatusChangeNotificationWasDeferred = 1;
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

+ (void)updateWithResponseDictionary:(id)a3 accountIdentifier:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  SSVSubscriptionStatus *v11;
  SSVSubscriptionStatus *v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  SSVSubscriptionStatus *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a4;
  objc_msgSend(a3, "objectForKey:", CFSTR("subscriptionStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = v9 == v26;
    else
      v10 = 1;
    if (!v10 && (!v26 || !objc_msgSend(v26, "isEqualToNumber:", v9)))
      goto LABEL_31;
    v11 = objc_alloc_init(SSVSubscriptionStatus);
    -[SSVSubscriptionStatus setAccountIdentifier:](v11, "setAccountIdentifier:", v26);
    -[SSVSubscriptionStatus setValuesUsingStatusDictionary:](v11, "setValuesUsingStatusDictionary:", v6);
    v12 = (SSVSubscriptionStatus *)objc_msgSend(a1, "copyStatusFromUserDefaults");
    if (!v12)
    {
      v22 = a1;
      v23 = v11;
      goto LABEL_29;
    }
    v13 = -[SSVSubscriptionStatus accountStatus](v11, "accountStatus");
    v14 = -[SSVSubscriptionStatus accountStatus](v12, "accountStatus");
    v15 = v13 != v14;
    if (v13 != v14)
      -[SSVSubscriptionStatus setAccountStatus:](v12, "setAccountStatus:", v13);
    v16 = -[SSVSubscriptionStatus carrierBundlingStatus](v11, "carrierBundlingStatus");
    if (v16 != -[SSVSubscriptionStatus carrierBundlingStatus](v12, "carrierBundlingStatus"))
    {
      -[SSVSubscriptionStatus setCarrierBundlingStatus:](v12, "setCarrierBundlingStatus:", v16);
      v15 = 1;
    }
    -[SSVSubscriptionStatus accountIdentifier](v12, "accountIdentifier");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17 == v26)
    {

    }
    else
    {
      if (v26
        && (-[SSVSubscriptionStatus accountIdentifier](v12, "accountIdentifier"),
            (v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v19 = (void *)v18;
        -[SSVSubscriptionStatus accountIdentifier](v12, "accountIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v26, "isEqualToNumber:", v20);

        if ((v21 & 1) != 0)
          goto LABEL_22;
      }
      else
      {

      }
      -[SSVSubscriptionStatus setAccountIdentifier:](v12, "setAccountIdentifier:", v26);
      v15 = 1;
    }
LABEL_22:
    v24 = -[SSVSubscriptionStatus acceptedStoreTermsVersion](v11, "acceptedStoreTermsVersion");
    if (v24 != -[SSVSubscriptionStatus acceptedStoreTermsVersion](v12, "acceptedStoreTermsVersion"))
    {
      -[SSVSubscriptionStatus setAcceptedStoreTermsVersion:](v12, "setAcceptedStoreTermsVersion:", v24);
      v15 = 1;
    }
    v25 = -[SSVSubscriptionStatus latestStoreTermsVersion](v11, "latestStoreTermsVersion");
    if (v25 == -[SSVSubscriptionStatus latestStoreTermsVersion](v12, "latestStoreTermsVersion"))
    {
      if (!v15)
        goto LABEL_30;
    }
    else
    {
      -[SSVSubscriptionStatus setLatestStoreTermsVersion:](v12, "setLatestStoreTermsVersion:", v25);
    }
    v22 = a1;
    v23 = v12;
LABEL_29:
    objc_msgSend(v22, "updateUserDefaultsWithStatus:", v23);
    objc_msgSend(a1, "sendChangeNotification");
LABEL_30:

LABEL_31:
  }

}

+ (id)_changeNotificationSuspensionAccessQueue
{
  if (_changeNotificationSuspensionAccessQueue_sOnceToken != -1)
    dispatch_once(&_changeNotificationSuspensionAccessQueue_sOnceToken, &__block_literal_global_4_0);
  return (id)_changeNotificationSuspensionAccessQueue_sChangeNotificationSuspensionAccessQueue;
}

void __85__SSVSubscriptionStatusCoordinator_Private___changeNotificationSuspensionAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.itunesstored.SSVSubscriptionStatusCoordinator.changeNotificationSuspensionAccessQueue", 0);
  v1 = (void *)_changeNotificationSuspensionAccessQueue_sChangeNotificationSuspensionAccessQueue;
  _changeNotificationSuspensionAccessQueue_sChangeNotificationSuspensionAccessQueue = (uint64_t)v0;

}

+ (void)_sendChangeNotification
{
  notify_post("com.apple.itunesstored.ssvsubscriptionstatuscoordinator.changed");
}

@end
