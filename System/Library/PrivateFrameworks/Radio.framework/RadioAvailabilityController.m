@implementation RadioAvailabilityController

uint64_t __47__RadioAvailabilityController_isRadioAvailable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 33);
  return result;
}

void __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_2(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "BOOLValue");
  v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 != v2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3 != 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_updateRadioAvailabilityAllowingNotifications:", 1);
  }
  v7 = *(void **)(a1 + 48);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_3;
    block[3] = &unk_24CA2E938;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v14 = v9;
    block[4] = v10;
    v13 = v11;
    dispatch_async(v8, block);

  }
}

- (BOOL)isRadioAvailable
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__RadioAvailabilityController_isRadioAvailable__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateRadioAvailabilityWithStoreURLBag:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *calloutSerialQueue;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  BOOL v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v11 = 0;
    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v11, "radioConfigurationDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != 0;

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke;
    v21[3] = &unk_24CA2E988;
    v24 = v16;
    v22 = 0;
    v23 = v10;
    v21[4] = self;
    v17 = v10;
    -[RadioAvailabilityController _currentStoreFrontIdentifierWithCompletion:](self, "_currentStoreFrontIdentifierWithCompletion:", v21);

    v14 = v23;
    goto LABEL_6;
  }
  v11 = -[RadioStoreBag _initWithURLBag:]([RadioStoreBag alloc], "_initWithURLBag:", v8);
  if (!v9)
    goto LABEL_5;
LABEL_3:
  calloutSerialQueue = self->_calloutSerialQueue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_4;
  v18[3] = &unk_24CA2E9B0;
  v20 = v10;
  v19 = v9;
  v13 = v10;
  dispatch_async(calloutSerialQueue, v18);

  v14 = v20;
LABEL_6:

}

- (void)_currentStoreFrontIdentifierWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__RadioAvailabilityController__currentStoreFrontIdentifierWithCompletion___block_invoke;
  v7[3] = &unk_24CA2E880;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "getPropertiesForUserIdentity:completionHandler:", v5, v7);

}

- (RadioAvailabilityController)init
{
  RadioAvailabilityController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutSerialQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *restrictionLoadQueue;
  void *v9;
  void *v10;
  NSNumber *isRadioAvailableFromBag;
  int AppBooleanValue;
  _BOOL8 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  Boolean keyExistsAndHasValidFormat;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RadioAvailabilityController;
  v2 = -[RadioAvailabilityController init](&v19, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Radio.RadioAvailabilityController.accessQueue", MEMORY[0x24BDAC9C0]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.Radio.RadioAvailabilityController.calloutSerialQueue", 0);
    calloutSerialQueue = v2->_calloutSerialQueue;
    v2->_calloutSerialQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.Radio.RadioAvailabilityController.restrictionLoadQueue", 0);
    restrictionLoadQueue = v2->_restrictionLoadQueue;
    v2->_restrictionLoadQueue = (OS_dispatch_queue *)v7;

    -[RadioAvailabilityController _currentStoreFrontIdentifier](v2, "_currentStoreFrontIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)CFPreferencesCopyAppValue(CFSTR("RadioLastKnownAvailableStoreFrontIdentifier"), (CFStringRef)-[RadioAvailabilityController _userDefaultsDomain](v2, "_userDefaultsDomain"));
    if (objc_msgSend(v10, "isNSString") && objc_msgSend(v10, "isEqualToString:", v9))
    {
      isRadioAvailableFromBag = v2->_isRadioAvailableFromBag;
      v2->_isRadioAvailableFromBag = (NSNumber *)MEMORY[0x24BDBD1C8];
    }
    else
    {
      keyExistsAndHasValidFormat = 0;
      AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("IsRadioAvailable"), CFSTR("com.apple.mobileipod"), &keyExistsAndHasValidFormat);
      if (!keyExistsAndHasValidFormat)
      {
LABEL_8:
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "registerObserver:", v2);
        objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "registerObserver:", v2);

        v2->_isRadioRestricted = -[RadioAvailabilityController _calculateRadioRestricted](v2, "_calculateRadioRestricted");
        -[RadioAvailabilityController _updateRadioAvailabilityAllowingNotifications:](v2, "_updateRadioAvailabilityAllowingNotifications:", 0);
        -[RadioAvailabilityController _reloadRadioBagAvailabilityWithCompletionHandler:](v2, "_reloadRadioBagAvailabilityWithCompletionHandler:", 0);

        return v2;
      }
      v13 = AppBooleanValue != 0;
      CFPreferencesSetAppValue(CFSTR("IsRadioAvailable"), 0, CFSTR("com.apple.mobileipod"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      isRadioAvailableFromBag = v2->_isRadioAvailableFromBag;
      v2->_isRadioAvailableFromBag = (NSNumber *)v14;
    }

    goto LABEL_8;
  }
  return v2;
}

void __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  const void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  if (*(_BYTE *)(a1 + 56))
    v3 = a2;
  else
    v3 = 0;
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  CFPreferencesSetAppValue(CFSTR("RadioLastKnownAvailableStoreFrontIdentifier"), v3, (CFStringRef)objc_msgSend(v4, "_userDefaultsDomain"));

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 8);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_2;
  v8[3] = &unk_24CA2E960;
  v8[4] = v6;
  v11 = *(_BYTE *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  dispatch_barrier_async(v7, v8);

}

- (id)_userDefaultsDomain
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateRadioAvailabilityAllowingNotifications:(BOOL)a3
{
  _BOOL4 v4;
  NSObject *calloutSerialQueue;
  _QWORD block[5];

  if (-[NSNumber BOOLValue](self->_isRadioAvailableFromBag, "BOOLValue", a3))
    v4 = !self->_isRadioRestricted;
  else
    v4 = 0;
  if (self->_isRadioAvailable != v4)
  {
    self->_isRadioAvailable = v4;
    calloutSerialQueue = self->_calloutSerialQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__RadioAvailabilityController__updateRadioAvailabilityAllowingNotifications___block_invoke;
    block[3] = &unk_24CA2EB28;
    block[4] = self;
    dispatch_async(calloutSerialQueue, block);
  }
}

- (void)_reloadRadioBagAvailabilityWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC89F8]), "initWithBlock:", &__block_literal_global_1020);
  objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__RadioAvailabilityController__reloadRadioBagAvailabilityWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_24CA2E8E8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getBagForRequestContext:withCompletionHandler:", v5, v8);

}

- (BOOL)_calculateRadioRestricted
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63A70]) == 2;

  return v3;
}

void __80__RadioAvailabilityController__reloadRadioBagAvailabilityWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setAllowsExpiredBags:", 1);
  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentity:", v3);

}

- (id)_currentStoreFrontIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPropertiesForUserIdentity:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "storefrontIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localStoreAccountProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storefrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __74__RadioAvailabilityController__currentStoreFrontIdentifierWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "storefrontIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localStoreAccountProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storefrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __80__RadioAvailabilityController__reloadRadioBagAvailabilityWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRadioAvailabilityWithStoreURLBag:error:completionHandler:", a2, a3, *(_QWORD *)(a1 + 40));
}

void __77__RadioAvailabilityController__updateRadioAvailabilityAllowingNotifications___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("RadioAvailabilityControllerRadioAvailableDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

_BYTE *__78__RadioAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[32])
    return (_BYTE *)objc_msgSend(result, "_reloadRadioBagAvailabilityWithCompletionHandler:", 0);
  return result;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  if (objc_msgSend(a3, "isRemoteServerLikelyReachable"))
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__RadioAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke;
    block[3] = &unk_24CA2EB28;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)RadioAvailabilityController;
  -[RadioAvailabilityController dealloc](&v5, sel_dealloc);
}

- (BOOL)hasLoadedRadioAvailability
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__RadioAvailabilityController_hasLoadedRadioAvailability__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)getRadioAvailabilityWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__RadioAvailabilityController_getRadioAvailabilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_24CA2E9B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)_reloadRadioRestriction
{
  NSObject *restrictionLoadQueue;
  _QWORD block[5];

  restrictionLoadQueue = self->_restrictionLoadQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__RadioAvailabilityController__reloadRadioRestriction__block_invoke;
  block[3] = &unk_24CA2EB28;
  block[4] = self;
  dispatch_async(restrictionLoadQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveAccountUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_isRadioAvailableFromBag, 0);
  objc_storeStrong((id *)&self->_restrictionLoadQueue, 0);
  objc_storeStrong((id *)&self->_calloutSerialQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "msv_errorByRemovingUnsafeUserInfo");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 33);
  objc_msgSend(*(id *)(a1 + 40), "msv_errorByRemovingUnsafeUserInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

}

void __54__RadioAvailabilityController__reloadRadioRestriction__block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_calculateRadioRestricted");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__RadioAvailabilityController__reloadRadioRestriction__block_invoke_2;
  v5[3] = &unk_24CA2E910;
  v5[4] = v3;
  v6 = v2;
  dispatch_barrier_async(v4, v5);
}

uint64_t __54__RadioAvailabilityController__reloadRadioRestriction__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 48) != v2)
  {
    *(_BYTE *)(v1 + 48) = v2;
    return objc_msgSend(*(id *)(result + 32), "_updateRadioAvailabilityAllowingNotifications:", 1);
  }
  return result;
}

void __73__RadioAvailabilityController_getRadioAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (*(_BYTE *)(v2 + 32))
  {
    if (v3)
    {
      v4 = *(_BYTE *)(v2 + 33);
      v5 = *(NSObject **)(v2 + 16);
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __73__RadioAvailabilityController_getRadioAvailabilityWithCompletionHandler___block_invoke_2;
      v6[3] = &unk_24CA2E858;
      v7 = v3;
      v8 = v4;
      dispatch_async(v5, v6);

    }
  }
  else
  {
    objc_msgSend((id)v2, "_reloadRadioBagAvailabilityWithCompletionHandler:", v3);
  }
}

uint64_t __73__RadioAvailabilityController_getRadioAvailabilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

uint64_t __57__RadioAvailabilityController_hasLoadedRadioAvailability__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40) != 0;
  return result;
}

@end
