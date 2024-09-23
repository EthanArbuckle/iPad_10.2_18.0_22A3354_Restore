@implementation STTelephonyStateProvider

void __52__STTelephonyStateProvider_subscriptionInfoForSlot___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[STTelephonyStateProvider _internalQueue_subscriptionContextForSlot:](*(char **)(a1 + 32), *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscriptionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (char)_internalQueue_subscriptionContextForSlot:(char *)a1
{
  uint64_t v2;

  if (a1)
  {
    if (a2 == 1)
    {
      v2 = 64;
    }
    else
    {
      if (a2 != 2)
        return (char *)0;
      v2 = 72;
    }
    a1 = (char *)*(id *)&a1[v2];
  }
  return a1;
}

_QWORD *__48__STTelephonyStateProvider_isSIMPresentForSlot___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = -[STTelephonyStateProvider _hasCTContextForSlot:](*(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

- (_QWORD)_hasCTContextForSlot:(_QWORD *)result
{
  _QWORD v2[5];

  if (result)
  {
    result = (_QWORD *)result[10];
    if (result)
    {
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __STTelephonyArrayContainsCTContextForSlot_block_invoke;
      v2[3] = &__block_descriptor_40_e48_B32__0__CTXPCServiceSubscriptionContext_8Q16_B24l;
      v2[4] = a2;
      return (_QWORD *)(objc_msgSend(result, "indexOfObjectPassingTest:", v2) != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  return result;
}

- (id)subscriptionInfoForSlot:(int64_t)a3
{
  NSObject *internalQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__STTelephonyStateProvider_subscriptionInfoForSlot___block_invoke;
  block[3] = &unk_1E8E18148;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)isSIMPresentForSlot:(int64_t)a3
{
  NSObject *internalQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__STTelephonyStateProvider_isSIMPresentForSlot___block_invoke;
  block[3] = &unk_1E8E18148;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __90__STTelephonyStateProvider__internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "subscriptionInfoDidChangeForStateProvider:slot:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __86__STTelephonyStateProvider__updateLastKnownNetworkCountryCodeInContext_withCTContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6 && (TUISOCountryCodeForMCC(), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = v8;
    -[STTelephonyStateProvider _updateNetworkCountryCode:inContext:withCTContext:](*(_QWORD *)(a1 + 32), v8, *(void **)(a1 + 40), *(void **)(a1 + 48));

  }
  else
  {
    STSystemStatusLogTelephonyState();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D02C7000, v10, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider: falling back to copyLastKnownMobileCountryCode", buf, 2u);
    }

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v12 = *(void **)(v11 + 56);
    else
      v12 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__STTelephonyStateProvider__updateLastKnownNetworkCountryCodeInContext_withCTContext___block_invoke_37;
    v14[3] = &unk_1E8E18580;
    v14[4] = v11;
    v13 = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v12, "copyLastKnownMobileCountryCode:completion:", v13, v14);

  }
}

void __78__STTelephonyStateProvider__updateNetworkCountryCode_inContext_withCTContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "subscriptionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLastKnownNetworkCountryCode:", *(_QWORD *)(a1 + 56));

    STSystemStatusLogTelephonyState();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 56);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D02C7000, v5, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider: got last known network country code: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "slotID"));
  }
}

uint64_t __59__STTelephonyStateProvider_isCellularRadioCapabilityActive__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[STTelephonyStateProvider _internalQueue_isCellularRadioCapabilityActive](*(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __53__STTelephonyStateProvider_carrierBundleInfoForSlot___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[STTelephonyStateProvider _internalQueue_subscriptionContextForSlot:](*(char **)(a1 + 32), *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "carrierBundleInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __45__STTelephonyStateProvider_isRadioModuleDead__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    LOBYTE(v1) = *(_BYTE *)(v1 + 18) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v1;
  return result;
}

void __45__STTelephonyStateProvider_cellChanged_cell___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider cellChanged:cell:]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v5, *(void **)(a1 + 40));

    goto LABEL_5;
  }
  v4 = v2;
  if (v3)
  {
    -[STTelephonyStateProvider _updateLastKnownNetworkCountryCodeInContext:withCTContext:](v3, v2, *(void **)(a1 + 40));
LABEL_5:
    v4 = v6;
  }

}

uint64_t __44__STTelephonyStateProvider_isDualSIMEnabled__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    LOBYTE(v1) = *(_BYTE *)(v1 + 17) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v1;
  return result;
}

- (BOOL)isRadioModuleDead
{
  NSObject *internalQueue;
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
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__STTelephonyStateProvider_isRadioModuleDead__block_invoke;
  v5[3] = &unk_1E8E18120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDualSIMEnabled
{
  NSObject *internalQueue;
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
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__STTelephonyStateProvider_isDualSIMEnabled__block_invoke;
  v5[3] = &unk_1E8E18120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCellularRadioCapabilityActive
{
  NSObject *internalQueue;
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
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__STTelephonyStateProvider_isCellularRadioCapabilityActive__block_invoke;
  v5[3] = &unk_1E8E18120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasCellularTelephony
{
  return self->_hasCellularTelephony;
}

- (void)cellChanged:(id)a3 cell:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__STTelephonyStateProvider_cellChanged_cell___block_invoke;
  v8[3] = &unk_1E8E17F10;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(internalQueue, v8);

}

- (id)carrierBundleInfoForSlot:(int64_t)a3
{
  NSObject *internalQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__STTelephonyStateProvider_carrierBundleInfoForSlot___block_invoke;
  block[3] = &unk_1E8E18148;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_updateNetworkCountryCode:(void *)a3 inContext:(void *)a4 withCTContext:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    v11 = *(NSObject **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__STTelephonyStateProvider__updateNetworkCountryCode_inContext_withCTContext___block_invoke;
    v12[3] = &unk_1E8E185A8;
    v12[4] = a1;
    v13 = v9;
    v14 = v8;
    v15 = v7;
    dispatch_async(v11, v12);

  }
}

- (void)_updateLastKnownNetworkCountryCodeInContext:(void *)a3 withCTContext:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    STSystemStatusLogTelephonyState();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D02C7000, v7, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider: requesting copyMobileCountryCode", buf, 2u);
    }

    v8 = *(void **)(a1 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__STTelephonyStateProvider__updateLastKnownNetworkCountryCodeInContext_withCTContext___block_invoke;
    v9[3] = &unk_1E8E18580;
    v9[4] = a1;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v8, "copyMobileCountryCode:completion:", v11, v9);

  }
}

- (char)_subscriptionContextForCTContext:(char *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "slotID");
    if (v5 == 1)
    {
      v6 = 64;
    }
    else
    {
      if (v5 != 2)
      {
        a1 = 0;
        goto LABEL_8;
      }
      v6 = 72;
    }
    a1 = (char *)*(id *)&a1[v6];
  }
LABEL_8:

  return a1;
}

- (void)_internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:(uint64_t)a1
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  if (a1)
  {
    v4 = *(id *)(a1 + 24);
    objc_msgSend(v4, "setRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__STTelephonyStateProvider__internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot___block_invoke;
    block[3] = &unk_1E8E18198;
    v9 = v5;
    v10 = a1;
    v11 = a2;
    v7 = v5;
    dispatch_async(v6, block);

  }
}

- (uint64_t)_internalQueue_isCellularRadioCapabilityActive
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (!*(_BYTE *)(result + 19))
      return 0;
    v2 = *(_QWORD *)(result + 96);
    if ((v2 & 0x8000000000000000) == 0)
      return v2 != 1;
    if (-[STTelephonyStateProvider _serverConnection](result))
    {
      v3 = _CTServerConnectionHideDataIndicator();
      if (!HIDWORD(v3))
      {
        STSystemStatusLogTelephonyState();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          STTelephonyCachedBooleanDebugName(1);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v10 = v5;
          _os_log_impl(&dword_1D02C7000, v4, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider-isCellularRadioCapabilityActive - queried for suppressesCellIndicators with new state=%{public}@", buf, 0xCu);

        }
        if (*(_QWORD *)(v1 + 96) == -1)
          *(_QWORD *)(v1 + 96) = 1;
        else
          -[STTelephonyStateProvider _setSuppressesCellIndicators:](v1, 1);
        goto LABEL_17;
      }
      -[STTelephonyStateProvider _serverConnectionDidError:](v1, v3);
      *(_QWORD *)(v1 + 96) = -2;
      STSystemStatusLogTelephonyState();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        STTelephonyCachedBooleanDebugName(*(_QWORD *)(v1 + 96));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v10 = v7;
        v8 = "STTelephonyStateProvider-isCellularRadioCapabilityActive - queried for suppressesCellIndicators with new state=%{public}@";
        goto LABEL_15;
      }
    }
    else
    {
      *(_QWORD *)(v1 + 96) = -2;
      STSystemStatusLogTelephonyState();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        STTelephonyCachedBooleanDebugName(*(_QWORD *)(v1 + 96));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v10 = v7;
        v8 = "STTelephonyStateProvider-isCellularRadioCapabilityActive - queried for _suppressesCellIndicators with new state=%{public}@";
LABEL_15:
        _os_log_impl(&dword_1D02C7000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);

      }
    }

LABEL_17:
    v2 = *(_QWORD *)(v1 + 96);
    return v2 != 1;
  }
  return result;
}

- (STTelephonyStateProvider)init
{
  STTelephonyStateProvider *v2;
  uint64_t v3;
  NSHashTable *observers;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  uint64_t v7;
  OS_dispatch_queue *observerQueue;
  uint64_t v9;
  OS_dispatch_queue *backgroundQueryQueue;
  uint64_t v11;
  CoreTelephonyClient *coreTelephonyClient;
  void *v13;
  id *v14;
  id v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id *v19;
  NSObject *v20;
  id *v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id *v28;
  _QWORD v29[4];
  id *v30;
  _QWORD block[4];
  id *v32;
  void *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  id *v37;
  objc_super v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43[5];
  id v44[5];
  id v45[5];
  id v46;
  id location;

  v38.receiver = self;
  v38.super_class = (Class)STTelephonyStateProvider;
  v2 = -[STTelephonyStateProvider init](&v38, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    v7 = BSDispatchQueueCreateSerial();
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v7;

    v9 = BSDispatchQueueCreateSerial();
    backgroundQueryQueue = v2->_backgroundQueryQueue;
    v2->_backgroundQueryQueue = (OS_dispatch_queue *)v9;

    v2->_containsCellularRadio = MGGetBoolAnswer();
    v2->_hasCellularTelephony = MGGetBoolAnswer();
    v2->_cachedSuppressesCellDataIndicator = -1;
    v2->_cachedSuppressesCellIndicators = -1;
    v2->_cachedNeedsUserIdentificationModule = -1;
    -[STTelephonyStateProvider _purgeSlot1SubscriptionState]((uint64_t)v2);
    -[STTelephonyStateProvider _purgeSlot2SubscriptionState]((uint64_t)v2);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v2->_backgroundQueryQueue);
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v11;

    -[CoreTelephonyClient setDelegate:](v2->_coreTelephonyClient, "setDelegate:", v2);
    -[STTelephonyStateProvider _serverConnection]((uint64_t)v2);
    objc_initWeak(&location, v2);
    v13 = (void *)MEMORY[0x1E0C809B0];
    v45[1] = (id)MEMORY[0x1E0C809B0];
    v45[2] = (id)3221225472;
    v45[3] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke;
    v45[4] = &unk_1E8E18508;
    objc_copyWeak(&v46, &location);
    _CTServerConnectionRegisterBlockForNotification();
    v44[1] = v13;
    v44[2] = (id)3221225472;
    v44[3] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_3;
    v44[4] = &unk_1E8E18508;
    objc_copyWeak(v45, &location);
    _CTServerConnectionRegisterBlockForNotification();
    v43[1] = v13;
    v43[2] = (id)3221225472;
    v43[3] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_5;
    v43[4] = &unk_1E8E18508;
    objc_copyWeak(v44, &location);
    _CTServerConnectionRegisterBlockForNotification();
    v39 = v13;
    v40 = 3221225472;
    v41 = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_7;
    v42 = &unk_1E8E18508;
    objc_copyWeak(v43, &location);
    _CTServerConnectionRegisterBlockForNotification();
    objc_destroyWeak(v43);
    objc_destroyWeak(v44);
    objc_destroyWeak(v45);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
    v33 = v13;
    v34 = 3221225472;
    v35 = __32__STTelephonyStateProvider_init__block_invoke;
    v36 = &unk_1E8E180F8;
    v14 = v2;
    v37 = v14;
    v15 = (id)BSLogAddStateCaptureBlockWithTitle();
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9B8]), "initWithQueue:", v2->_backgroundQueryQueue);
    v17 = v14[14];
    v14[14] = (id)v16;

    objc_msgSend(v14[14], "setDelegate:", v14);
    v18 = v2->_backgroundQueryQueue;
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __32__STTelephonyStateProvider_init__block_invoke_2;
    block[3] = &unk_1E8E18478;
    v19 = v14;
    v32 = v19;
    dispatch_async(v18, block);
    v20 = v2->_internalQueue;
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __32__STTelephonyStateProvider_init__block_invoke_3;
    v29[3] = &unk_1E8E18478;
    v21 = v19;
    v30 = v21;
    dispatch_async(v20, v29);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E20]), "initWithDelegate:queue:", v21, v2->_observerQueue);
    objc_storeStrong(v21 + 16, v22);
    v23 = v2->_observerQueue;
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = __32__STTelephonyStateProvider_init__block_invoke_4;
    v26[3] = &unk_1E8E17F10;
    v27 = v22;
    v28 = v21;
    v24 = v22;
    dispatch_async(v23, v26);

  }
  return v2;
}

uint64_t __32__STTelephonyStateProvider_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "debugDescription");
}

uint64_t __32__STTelephonyStateProvider_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "airplaneModeChanged");
}

void __32__STTelephonyStateProvider_init__block_invoke_3(uint64_t a1)
{
  -[STTelephonyStateProvider _updateState](*(_QWORD *)(a1 + 32));
}

- (void)_updateState
{
  unint64_t IsDead;
  _BOOL4 v3;
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  if (a1)
  {
    v6 = 0;
    if (!*(_BYTE *)(a1 + 19))
    {
      v3 = 0;
      goto LABEL_6;
    }
    -[STTelephonyStateProvider _serverConnection](a1);
    IsDead = _CTServerConnectionGetRadioModuleIsDead();
    if (!HIDWORD(IsDead))
    {
      v3 = v6 == 1;
LABEL_6:
      -[STTelephonyStateProvider setCachedRadioModuleDead:](a1, v3);
      -[STTelephonyStateProvider _updateDualSIMCapabilitySendingNotification:](a1, 0);
      v4 = *(NSObject **)(a1 + 48);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __40__STTelephonyStateProvider__updateState__block_invoke;
      v5[3] = &unk_1E8E18478;
      v5[4] = a1;
      dispatch_async(v4, v5);
      return;
    }
    -[STTelephonyStateProvider _serverConnectionDidError:](a1, IsDead);
  }
}

void __32__STTelephonyStateProvider_init__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "start");
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "getState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[STTelephonyStateProvider setStewieState:](v2, v3);

}

- (void)setStewieState:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _BYTE v21[24];
  void *v22;
  __int128 v23;
  char v24;
  char v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1 && *(id *)(a1 + 136) != v4)
  {
    objc_storeStrong((id *)(a1 + 136), a2);
    v5 = objc_msgSend(v4, "displayStewieInStatusBar");
    v6 = objc_msgSend(v4, "displayInactiveSOSInStatusBar");
    v7 = objc_msgSend(v4, "isStewieActiveOverBB");
    STSystemStatusLogTelephonyState();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v21 = 138544130;
      *(_QWORD *)&v21[4] = v9;
      *(_WORD *)&v21[12] = 2114;
      *(_QWORD *)&v21[14] = v10;
      *(_WORD *)&v21[22] = 2114;
      v22 = v11;
      LOWORD(v23) = 2114;
      *(_QWORD *)((char *)&v23 + 2) = v4;
      _os_log_impl(&dword_1D02C7000, v8, OS_LOG_TYPE_DEFAULT, "[STTelephonyStateProvider] Stewie state changed, displayStewieInStatusBar: %{public}@, displayInactiveSOSInStatusBar: %{public}@, usingStewieConnection: %{public}@, %{public}@", v21, 0x2Au);

    }
    v12 = *(id *)(a1 + 24);
    objc_msgSend(v12, "setRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(NSObject **)(a1 + 40);
    v15 = MEMORY[0x1E0C809B0];
    *(_QWORD *)v21 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v21[8] = 3221225472;
    *(_QWORD *)&v21[16] = __119__STTelephonyStateProvider__internalQueue_notifyObserversOfStewieStateChangedToUsingStewieForSOS_isInactiveSOSEnabled___block_invoke;
    v22 = &unk_1E8E185D0;
    *(_QWORD *)&v23 = v13;
    *((_QWORD *)&v23 + 1) = a1;
    v24 = v5;
    v25 = v6;
    v16 = v13;
    dispatch_async(v14, v21);

    v17 = *(id *)(a1 + 24);
    objc_msgSend(v17, "setRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *(NSObject **)(a1 + 40);
    *(_QWORD *)v21 = v15;
    *(_QWORD *)&v21[8] = 3221225472;
    *(_QWORD *)&v21[16] = __141__STTelephonyStateProvider__internalQueue_notifyObserversOfStewieStateChangedToUsingStewieForSOS_isInactiveSOSEnabled_usingStewieConnection___block_invoke;
    v22 = &unk_1E8E185F8;
    *(_QWORD *)&v23 = v18;
    *((_QWORD *)&v23 + 1) = a1;
    v24 = v5;
    v25 = v6;
    v26 = v7;
    v20 = v18;
    dispatch_async(v19, v21);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[STTelephonyStateProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STTelephonyStateProvider;
  -[STTelephonyStateProvider dealloc](&v3, sel_dealloc);
}

- (BOOL)isUsingStewieForSOS
{
  NSObject *internalQueue;
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
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__STTelephonyStateProvider_isUsingStewieForSOS__block_invoke;
  v5[3] = &unk_1E8E184A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __47__STTelephonyStateProvider_isUsingStewieForSOS__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[17];
  v3 = v2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "displayStewieInStatusBar");

}

- (BOOL)isInactiveSOSEnabled
{
  NSObject *internalQueue;
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
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__STTelephonyStateProvider_isInactiveSOSEnabled__block_invoke;
  v5[3] = &unk_1E8E184A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __48__STTelephonyStateProvider_isInactiveSOSEnabled__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[17];
  v3 = v2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "displayInactiveSOSInStatusBar");

}

- (BOOL)isUsingStewieConnection
{
  NSObject *internalQueue;
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
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__STTelephonyStateProvider_isUsingStewieConnection__block_invoke;
  v5[3] = &unk_1E8E184A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __51__STTelephonyStateProvider_isUsingStewieConnection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[17];
  v3 = v2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "isStewieActiveOverBB");

}

- (BOOL)needsUserIdentificationModule
{
  NSObject *internalQueue;
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
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__STTelephonyStateProvider_needsUserIdentificationModule__block_invoke;
  v5[3] = &unk_1E8E18120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__STTelephonyStateProvider_needsUserIdentificationModule__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[STTelephonyStateProvider _internalQueue_needsUserIdentificationModule](*(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (uint64_t)_internalQueue_needsUserIdentificationModule
{
  uint64_t v1;
  unint64_t IsUserIdentityModuleRequired;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if ((*(_QWORD *)(result + 104) & 0x8000000000000000) != 0
      && -[STTelephonyStateProvider _serverConnection](result))
    {
      IsUserIdentityModuleRequired = _CTServerConnectionIsUserIdentityModuleRequired();
      if (HIDWORD(IsUserIdentityModuleRequired))
      {
        -[STTelephonyStateProvider _serverConnectionDidError:](v1, IsUserIdentityModuleRequired);
      }
      else
      {
        *(_QWORD *)(v1 + 104) = 0;
        STSystemStatusLogTelephonyState();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          STTelephonyCachedBooleanDebugName(*(_QWORD *)(v1 + 104));
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v6 = v4;
          _os_log_impl(&dword_1D02C7000, v3, OS_LOG_TYPE_DEFAULT, "STelephonyStateProvider updated _needsUserIdentificationModule to %{public}@", buf, 0xCu);

        }
      }
    }
    return *(_QWORD *)(v1 + 104) == 1;
  }
  return result;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__STTelephonyStateProvider_addObserver___block_invoke;
  v7[3] = &unk_1E8E17F10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __40__STTelephonyStateProvider_addObserver___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[3];
  return objc_msgSend(v1, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__STTelephonyStateProvider_removeObserver___block_invoke;
  block[3] = &unk_1E8E17F10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

uint64_t __43__STTelephonyStateProvider_removeObserver___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[3];
  return objc_msgSend(v1, "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)mobileEquipmentInfoForSlot:(int64_t)a3
{
  NSObject *internalQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__STTelephonyStateProvider_mobileEquipmentInfoForSlot___block_invoke;
  block[3] = &unk_1E8E18148;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__STTelephonyStateProvider_mobileEquipmentInfoForSlot___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[STTelephonyStateProvider _internalQueue_subscriptionContextForSlot:](*(char **)(a1 + 32), *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mobileEquipmentInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)invalidate
{
  NSObject *internalQueue;
  _QWORD block[5];

  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__STTelephonyStateProvider_invalidate__block_invoke;
  block[3] = &unk_1E8E18478;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __38__STTelephonyStateProvider_invalidate__block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    _CTServerConnectionUnregisterForAllNotifications();
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 8));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
}

- (uint64_t)_serverConnection
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  result = *(_QWORD *)(a1 + 8);
  if (!result)
  {
    result = _CTServerConnectionCreateOnTargetQueue();
    *(_QWORD *)(a1 + 8) = result;
    if (!result)
    {
      STSystemStatusLogTelephonyState();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v4 = 0;
        _os_log_error_impl(&dword_1D02C7000, v3, OS_LOG_TYPE_ERROR, "Unable to create CTServerConnection. Telephony state may be incorrect.", v4, 2u);
      }

      return *(_QWORD *)(a1 + 8);
    }
  }
  return result;
}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = WeakRetained[4];
  else
    v2 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_2;
  block[3] = &unk_1E8E18478;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    -[STTelephonyStateProvider _updateState](v1);
}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = WeakRetained[4];
  else
    v2 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_4;
  block[3] = &unk_1E8E18478;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_4(uint64_t a1)
{
  -[STTelephonyStateProvider setCachedRadioModuleDead:](*(_QWORD *)(a1 + 32), 1);
}

- (void)setCachedRadioModuleDead:(uint64_t)a1
{
  char v2;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v2 = a2;
    if (*(unsigned __int8 *)(a1 + 18) != a2)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromBOOL();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Setting radio module dead: %@"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[STTelephonyStateProvider _logSubscriptionEvent:](a1, v6);

      *(_BYTE *)(a1 + 18) = v2;
      -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, 0);
    }
  }
}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_5(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = a2;
  if (WeakRetained)
    v5 = WeakRetained[4];
  else
    v5 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_6;
  v8[3] = &unk_1E8E17F10;
  v9 = WeakRetained;
  v10 = v4;
  v6 = v4;
  v7 = WeakRetained;
  dispatch_async(v5, v8);

}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    STSystemStatusLogTelephonyState();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel__hideDataIndicatorChanged_);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v4;
      v11 = 2114;
      v12 = v2;
      _os_log_impl(&dword_1D02C7000, v3, OS_LOG_TYPE_DEFAULT, "%@ received status info -> %{public}@", (uint8_t *)&v9, 0x16u);

    }
    if (v2)
    {
      objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CA77C0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = objc_msgSend(v5, "BOOLValue");
      else
        v6 = -1;
      objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CA7618]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = objc_msgSend(v8, "BOOLValue");
      else
        v7 = -1;

    }
    else
    {
      v6 = -1;
      v7 = -1;
    }
    if (*(_QWORD *)(v1 + 88) != v6)
    {
      *(_QWORD *)(v1 + 88) = v6;
      -[STTelephonyStateProvider _updateDataConnectionType](v1);
    }
    -[STTelephonyStateProvider _setSuppressesCellIndicators:](v1, v7);
  }

}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_7(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = WeakRetained[4];
  else
    v2 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_8;
  block[3] = &unk_1E8E18478;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 104) != -1)
    {
      *(_QWORD *)(v1 + 104) = -1;
      STSystemStatusLogTelephonyState();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_1D02C7000, v2, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider resetting _needsUserIdentificationModule (for postponement change)", v3, 2u);
      }

    }
    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](v1, 0);
  }
}

- (void)_serverConnectionDidError:(uint64_t)a1
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  STSystemStatusLogTelephonyState();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    v9 = a2;
    v10 = 1024;
    v11 = HIDWORD(a2);
    v12 = 2114;
    v13 = v6;
    _os_log_error_impl(&dword_1D02C7000, v4, OS_LOG_TYPE_ERROR, "CTServerConnection returned error: (%i, %i). Destroying connection. (Callstack: %{public}@)", buf, 0x18u);

  }
  v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__STTelephonyStateProvider__serverConnectionDidError___block_invoke;
  block[3] = &unk_1E8E18478;
  block[4] = a1;
  dispatch_async(v5, block);
}

void __54__STTelephonyStateProvider__serverConnectionDidError___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  uint64_t v4;
  dispatch_time_t v5;
  _QWORD *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v3 = (_BYTE *)v2[15];
    if (v3)
    {
      *v3 = 1;
      v4 = *(_QWORD *)(a1 + 32);
      if (v4)
      {
        *(_QWORD *)(v4 + 120) = 0;
        v2 = *(_QWORD **)(a1 + 32);
      }
      else
      {
        v2 = 0;
      }
    }
  }
  objc_initWeak(&location, v2);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = dispatch_time(0, 1000000000);
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[4];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__STTelephonyStateProvider__serverConnectionDidError___block_invoke_2;
  block[3] = &unk_1E8E18530;
  block[4] = &v11;
  v7 = v6;
  objc_copyWeak(&v10, &location);
  dispatch_after(v5, v7, block);

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    *(_QWORD *)(v8 + 120) = v12 + 3;
  objc_destroyWeak(&v10);
  _Block_object_dispose(&v11, 8);
  objc_destroyWeak(&location);
}

void __54__STTelephonyStateProvider__serverConnectionDidError___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      WeakRetained[15] = 0;
      v2 = WeakRetained;
      -[STTelephonyStateProvider _updateState]((uint64_t)WeakRetained);
      WeakRetained = v2;
    }

  }
}

- (void)_setCallForwardingIndicator:(void *)a3 inSubscriptionContext:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a3;
  if (a1)
  {
    v11 = v5;
    objc_msgSend(v5, "subscriptionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "callForwardingIndicator") != a2)
    {
      objc_msgSend(v6, "setCallForwardingIndicator:", a2);
      v7 = (void *)MEMORY[0x1E0CB3940];
      STTelephonyCallForwardingIndicatorDebugName(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("updated callForwardingIndicator to %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](a1, v9, v11);

      v10 = -[STTelephonyStateProvider _subscriptionSlotForContext:](a1, v11);
      -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, v10);
    }

    v5 = v11;
  }

}

- (void)_stopFakeServiceForContext:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    -[STTelephonyStateProvider _cancelFakeServiceForContext:](v3);
    objc_msgSend(v5, "cachedCTOperatorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      -[STTelephonyStateProvider _setOperatorName:inSubscriptionContext:](a1, v4, v5);
    else
      -[STTelephonyStateProvider _reallySetOperatorName:inSubscriptionContext:](a1, 0, v5);

    v3 = v5;
  }

}

- (void)_setRegistrationStatus:(void *)a3 inSubscriptionContext:
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "subscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "registrationStatus");
  if (v6 != a2)
  {
    v7 = v6;
    objc_msgSend(v5, "setRegistrationStatus:", a2);
    if (a2 != 1)
      objc_msgSend(v13, "setPretendingToSearch:", 0);
    v8 = (void *)MEMORY[0x1E0CB3940];
    STTelephonyRegistrationStatusDebugName(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    STTelephonyRegistrationStatusDebugName(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("registration status changed from %@ to %@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)a1, v11, v13);

    if (a2 == 2)
      -[STTelephonyStateProvider _updateCallForwardingIndicatorForContext:](a1, v13);
    else
      -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:]((uint64_t)a1, 0, v13);
  }
  -[STTelephonyStateProvider _cancelFakeRegistrationForContext:](v13);
  v12 = -[STTelephonyStateProvider _subscriptionSlotForContext:]((uint64_t)a1, v13);
  -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:]((uint64_t)a1, v12);

}

void __51__STTelephonyStateProvider__airplaneModeDidChange___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  if (objc_msgSend(*(id *)(a1 + 32), "isPretendingToSearch"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[STTelephonyStateProvider _updateRegistrationNowInSubscriptionContext:](WeakRetained, *(void **)(a1 + 32));

  }
}

- (void)_updateRegistrationNowInSubscriptionContext:(_QWORD *)a1
{
  void *v3;
  unint64_t v4;
  id v5;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(v5, "cachedCTRegistrationDisplayStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = STTelephonyRegistrationStatusForStatus(v3);
    -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:](a1, v4, v5);

    objc_msgSend(v5, "setPretendingToSearch:", 0);
  }
}

- (void)_updateCallForwardingIndicatorForContext:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  objc_msgSend(v3, "subscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SIMStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA77F8]))
  {
    v6 = -[STTelephonyStateProvider _internalQueue_needsUserIdentificationModule]((uint64_t)a1);

    if (v6)
    {
      v7 = (uint64_t)a1;
      v8 = 2;
LABEL_9:
      -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:](v7, v8, v3);
      goto LABEL_10;
    }
  }
  else
  {

  }
  if (objc_msgSend(v4, "registrationStatus") != 2 || !objc_msgSend(a1, "hasCellularTelephony"))
  {
    v7 = (uint64_t)a1;
    v8 = 0;
    goto LABEL_9;
  }
  v9 = (void *)a1[7];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke;
  v10[3] = &unk_1E8E18848;
  v10[4] = a1;
  v11 = v3;
  objc_msgSend(v9, "getSubscriptionInfo:", v10);

LABEL_10:
}

void __51__STTelephonyStateProvider__airplaneModeDidChange___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;

  if (objc_msgSend(*(id *)(a1 + 32), "isPretendingToSearch"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[STTelephonyStateProvider _updateRegistrationNowInSubscriptionContext:](WeakRetained, *(void **)(a1 + 32));

  }
}

- (void)_updateDataConnectionTypeForContext:(uint64_t)a1
{
  int v3;
  int isCellularRadioCapability;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v3 = *(unsigned __int8 *)(a1 + 20);
  isCellularRadioCapability = -[STTelephonyStateProvider _internalQueue_isCellularRadioCapabilityActive](a1);
  v5 = *(_QWORD *)(a1 + 88);
  if (v5 < 0)
  {
    -[STTelephonyStateProvider _serverConnection](a1);
    v6 = _CTServerConnectionHideRatIndicator();
    if (HIDWORD(v6))
    {
      -[STTelephonyStateProvider _serverConnectionDidError:](a1, v6);
      *(_QWORD *)(a1 + 88) = -2;
      STSystemStatusLogTelephonyState();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        STTelephonyCachedBooleanDebugName(*(_QWORD *)(a1 + 88));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v11;
        _os_log_impl(&dword_1D02C7000, v10, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider - queried for _suppressesCellDataIndicator with new state=%{public}@", buf, 0xCu);

      }
    }
    else
    {
      STSystemStatusLogTelephonyState();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        STTelephonyCachedBooleanDebugName(0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v8;
        _os_log_impl(&dword_1D02C7000, v7, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider - queried for _suppressesCellDataIndicator with new state=%{public}@", buf, 0xCu);

      }
      v9 = *(_QWORD *)(a1 + 88);
      if (v9 == -1)
      {
        *(_QWORD *)(a1 + 88) = 0;
      }
      else if (v9)
      {
        *(_QWORD *)(a1 + 88) = 0;
        -[STTelephonyStateProvider _updateDataConnectionType](a1);
      }
    }
    v5 = *(_QWORD *)(a1 + 88);
  }
  v12 = 0;
  v13 = isCellularRadioCapability ^ 1;
  if (v3)
  {
    v14 = v20;
  }
  else
  {
    v14 = v20;
    if ((v13 & 1) == 0 && v5 != 1)
    {
      v12 = objc_msgSend(v20, "modemDataConnectionType");
      v14 = v20;
      if ((unint64_t)(v12 - 7) <= 3)
      {
        objc_msgSend(v20, "carrierBundleInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "LTEConnectionShows4G");

        v14 = v20;
        if (v16)
          v12 = 6;
      }
    }
  }
  if (v5 == 1)
    v17 = 1;
  else
    v17 = v13;
  objc_msgSend(v14, "subscriptionInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBootstrap:", v17);
  objc_msgSend(v18, "setDataConnectionType:", v12);
  -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](a1, CFSTR("updated data connection type"), v20);
  v19 = -[STTelephonyStateProvider _subscriptionSlotForContext:](a1, v20);
  -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, v19);

}

- (void)_updateDualSIMCapabilitySendingNotification:(uint64_t)a1
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  char v10;

  if (a1)
  {
    v4 = *(id *)(a1 + 56);
    v5 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__STTelephonyStateProvider__updateDualSIMCapabilitySendingNotification___block_invoke;
    block[3] = &unk_1E8E18788;
    v8 = v4;
    v9 = a1;
    v10 = a2;
    v6 = v4;
    dispatch_async(v5, block);

  }
}

uint64_t __40__STTelephonyStateProvider__updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscriptionInfoDidChange");
}

- (STTelephonySubscriptionContext)_newSubscriptionContext
{
  STTelephonySubscriptionContext *v0;
  STMutableTelephonySubscriptionInfo *v1;
  STMutableTelephonyCarrierBundleInfo *v2;
  STMutableTelephonyMobileEquipmentInfo *v3;

  v0 = objc_alloc_init(STTelephonySubscriptionContext);
  v1 = objc_alloc_init(STMutableTelephonySubscriptionInfo);
  -[STTelephonySubscriptionContext setSubscriptionInfo:](v0, "setSubscriptionInfo:", v1);
  v2 = objc_alloc_init(STMutableTelephonyCarrierBundleInfo);
  -[STTelephonySubscriptionContext setCarrierBundleInfo:](v0, "setCarrierBundleInfo:", v2);
  v3 = objc_alloc_init(STMutableTelephonyMobileEquipmentInfo);
  -[STTelephonySubscriptionContext setMobileEquipmentInfo:](v0, "setMobileEquipmentInfo:", v3);

  return v0;
}

- (void)_purgeSlot1SubscriptionState
{
  void *v2;
  STTelephonySubscriptionContext *v3;
  void *v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 64);
    if (v2)
      -[STTelephonyStateProvider _cancelFakeServiceAndRegistrationForContext:](a1, v2);
    v3 = -[STTelephonyStateProvider _newSubscriptionContext]();
    v4 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v3;

  }
}

- (void)_purgeSlot2SubscriptionState
{
  void *v2;
  STTelephonySubscriptionContext *v3;
  void *v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 72);
    if (v2)
      -[STTelephonyStateProvider _cancelFakeServiceAndRegistrationForContext:](a1, v2);
    v3 = -[STTelephonyStateProvider _newSubscriptionContext]();
    v4 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v3;

  }
}

- (void)_cancelFakeServiceAndRegistrationForContext:(uint64_t)a1
{
  id v2;

  if (a1)
  {
    v2 = a2;
    -[STTelephonyStateProvider _cancelFakeServiceForContext:](v2);
    -[STTelephonyStateProvider _cancelFakeRegistrationForContext:](v2);
    -[STTelephonyStateProvider _cancelFakeCellularRegistrationForContext:](v2);

  }
}

- (void)_cancelFakeServiceForContext:(void *)a1
{
  _BYTE *v1;
  id v2;

  v2 = a1;
  v1 = (_BYTE *)objc_msgSend(v2, "fakeServiceCanceled");
  if (v1)
  {
    *v1 = 1;
    objc_msgSend(v2, "setFakeServiceCanceled:", 0);
  }

}

- (void)_cancelFakeRegistrationForContext:(void *)a1
{
  _BYTE *v1;
  id v2;

  v2 = a1;
  v1 = (_BYTE *)objc_msgSend(v2, "fakeRegistrationCanceled");
  if (v1)
  {
    *v1 = 1;
    objc_msgSend(v2, "setFakeRegistrationCanceled:", 0);
  }

}

- (void)_cancelFakeCellularRegistrationForContext:(void *)a1
{
  _BYTE *v1;
  id v2;

  v2 = a1;
  v1 = (_BYTE *)objc_msgSend(v2, "fakeCellularRegistrationCanceled");
  if (v1)
  {
    *v1 = 1;
    objc_msgSend(v2, "setFakeCellularRegistrationCanceled:", 0);
  }

}

void __86__STTelephonyStateProvider__updateLastKnownNetworkCountryCodeInContext_withCTContext___block_invoke_37(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (a2)
  {
    if (!a3)
    {
      TUISOCountryCodeForMCC();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[STTelephonyStateProvider _updateNetworkCountryCode:inContext:withCTContext:](*(_QWORD *)(a1 + 32), v4, *(void **)(a1 + 40), *(void **)(a1 + 48));

    }
  }
}

- (void)_logSubscriptionEvent:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    STSystemStatusLogTelephonyState();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543618;
      v6 = v3;
      v7 = 2114;
      v8 = a1;
      _os_log_impl(&dword_1D02C7000, v4, OS_LOG_TYPE_DEFAULT, "[STTelephonyStateProvider]: %{public}@ -- manager: %{public}@", (uint8_t *)&v5, 0x16u);
    }

  }
}

- (void)_updateDataConnectionType
{
  -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](a1, *(void **)(a1 + 64));
  -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](a1, *(void **)(a1 + 72));
}

- (void)_setSuppressesCellIndicators:(uint64_t)a1
{
  if (*(_QWORD *)(a1 + 96) != a2)
  {
    *(_QWORD *)(a1 + 96) = a2;
    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, 0);
    -[STTelephonyStateProvider _updateDataConnectionType](a1);
  }
}

void __91__STTelephonyStateProvider__internalQueue_notifyObserversOfCarrierBundleInfoChangeForSlot___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "carrierBundleInfoDidChangeForStateProvider:slot:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __119__STTelephonyStateProvider__internalQueue_notifyObserversOfStewieStateChangedToUsingStewieForSOS_isInactiveSOSEnabled___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "stewieStateDidChangeForStateProvider:usingStewieForSOS:isInactiveSOSEnabled:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __141__STTelephonyStateProvider__internalQueue_notifyObserversOfStewieStateChangedToUsingStewieForSOS_isInactiveSOSEnabled_usingStewieConnection___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "stewieStateDidChangeForStateProvider:usingStewieForSOS:isInactiveSOSEnabled:usingStewieConnection:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_logSubscriptionEvent:(void *)a3 forCTContext:
{
  id v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  int v10;
  __CFString *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = objc_msgSend(a3, "slotID");
    v7 = CFSTR("Unknown Slot");
    if (v6 == 2)
      v7 = CFSTR("Slot 2");
    if (v6 == 1)
      v7 = CFSTR("Slot 1");
    v8 = v7;
    STSystemStatusLogTelephonyState();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543874;
      v11 = v8;
      v12 = 2114;
      v13 = v5;
      v14 = 2114;
      v15 = a1;
      _os_log_impl(&dword_1D02C7000, v9, OS_LOG_TYPE_DEFAULT, "[STTelephonyStateProvider %{public}@]: %{public}@ -- manager: %{public}@", (uint8_t *)&v10, 0x20u);
    }

  }
}

- (void)_logSubscriptionEvent:(void *)a3 forContext:
{
  id v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  int v10;
  __CFString *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = -[STTelephonyStateProvider _subscriptionSlotForContext:](a1, a3);
  v7 = CFSTR("Unknown Slot");
  if (v6 == 2)
    v7 = CFSTR("Slot 2");
  if (v6 == 1)
    v7 = CFSTR("Slot 1");
  v8 = v7;
  STSystemStatusLogTelephonyState();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v5;
    v14 = 2114;
    v15 = a1;
    _os_log_impl(&dword_1D02C7000, v9, OS_LOG_TYPE_DEFAULT, "[STTelephonyStateProvider %{public}@]: %{public}@ -- manager: %{public}@", (uint8_t *)&v10, 0x20u);
  }

}

- (uint64_t)_subscriptionSlotForContext:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    if (*(id *)(a1 + 64) == v3)
      a1 = 1;
    else
      a1 = 2 * (*(_QWORD *)(a1 + 72) == (_QWORD)v3);
  }

  return a1;
}

- (void)subscriptionInfoDidChange
{
  NSObject *internalQueue;
  _QWORD block[5];

  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke;
  block[3] = &unk_1E8E18478;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 56);
  else
    v2 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_2;
  v4[3] = &unk_1E8E18670;
  v4[4] = v1;
  return objc_msgSend(v2, "getSubscriptionInfo:", v4);
}

void __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v5 = a2;
  v6 = *(_QWORD **)(a1 + 32);
  if (a3)
  {
    if (v6)
      v7 = v6[4];
    else
      v7 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_2_62;
    block[3] = &unk_1E8E18478;
    block[4] = v6;
    dispatch_async(v7, block);
  }
  else
  {
    if (v6)
      v6 = (_QWORD *)v6[7];
    v8 = v6;
    objc_msgSend(v8, "getCurrentDataSubscriptionContextSync:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscriptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_3;
    v23[3] = &unk_1E8E18620;
    v23[4] = *(_QWORD *)(a1 + 32);
    v13 = v10;
    v24 = v13;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v23);

    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      v15 = *(NSObject **)(v14 + 32);
    else
      v15 = 0;
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_4;
    v19[3] = &unk_1E8E185A8;
    v19[4] = v14;
    v20 = v5;
    v21 = v13;
    v22 = v9;
    v16 = v9;
    v17 = v13;
    dispatch_async(v15, v19);

  }
}

void __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  STTelephonySubscriptionContext *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  STMutableTelephonyMobileEquipmentInfo *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id block[5];
  id v37;
  id v38;

  v35 = a2;
  if (objc_msgSend(v35, "slotID"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = v35;
      v5 = -[STTelephonyStateProvider _newSubscriptionContext]();
      -[STTelephonySubscriptionContext subscriptionInfo](v5, "subscriptionInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v4;
      v8 = *(void **)(v3 + 56);
      v38 = 0;
      v9 = v8;
      objc_msgSend(v9, "getSIMStatus:error:", v7, &v38);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v38;

      if (v11)
      {
        v12 = *(NSObject **)(v3 + 32);
        block[0] = (id)MEMORY[0x1E0C809B0];
        block[1] = (id)3221225472;
        block[2] = __72__STTelephonyStateProvider__backgroundQueryQueue_SIMStatusForCTContext___block_invoke;
        block[3] = &unk_1E8E17F10;
        block[4] = (id)v3;
        v37 = v7;
        dispatch_async(v12, block);

        v13 = 0;
      }
      else
      {
        v13 = v10;
      }

      objc_msgSend(v6, "setSIMStatus:", v13);
      v14 = v7;
      v15 = objc_alloc_init(STMutableTelephonyMobileEquipmentInfo);
      v16 = *(void **)(v3 + 56);
      block[0] = 0;
      v17 = v16;
      objc_msgSend(v17, "getMobileEquipmentInfoFor:error:", v14, block);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = block[0];
      if (!v19)
      {
        objc_msgSend(v18, "MEID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[STMutableTelephonyMobileEquipmentInfo setMEID:](v15, "setMEID:", v20);

        objc_msgSend(v18, "IMEI");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[STMutableTelephonyMobileEquipmentInfo setIMEI:](v15, "setIMEI:", v21);

        objc_msgSend(v18, "ICCID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[STMutableTelephonyMobileEquipmentInfo setICCID:](v15, "setICCID:", v22);

        objc_msgSend(v18, "CSN");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[STMutableTelephonyMobileEquipmentInfo setCSN:](v15, "setCSN:", v23);

        objc_msgSend(v18, "baseId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[STMutableTelephonyMobileEquipmentInfo setBootstrapICCID:](v15, "setBootstrapICCID:", v24);

      }
      -[STTelephonySubscriptionContext setMobileEquipmentInfo:](v5, "setMobileEquipmentInfo:", v15);
      -[STTelephonySubscriptionContext carrierBundleInfo](v5, "carrierBundleInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSuppressSOSOnlyWithLimitedService:", -[STTelephonyStateProvider _backgroundQueryQueue_shouldSuppressSOSOnlyWithLimitedServiceForCTContext:](*(void **)(v3 + 56), v14));

      v26 = *(void **)(v3 + 56);
      block[0] = 0;
      v27 = v26;
      objc_msgSend(v27, "getShortLabel:error:", v14, block);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = block[0];

      v30 = 0;
      if (!v29)
        v30 = v28;

      objc_msgSend(v6, "setShortSIMLabel:", v30);
      objc_msgSend(v14, "userDataPreferred");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPreferredForDataConnections:", objc_msgSend(v31, "BOOLValue"));

      objc_msgSend(v14, "uuid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "UUIDString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIdentifier:", v33);

      v34 = objc_msgSend(v14, "isSimHidden");
      objc_msgSend(v6, "setHiddenSIM:", v34);

    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v35);

  }
}

void __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  const char *v14;
  void *v15;
  unsigned __int8 v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  id obj;
  uint64_t v46;
  void *v47;
  _QWORD v48[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint8_t v58[128];
  __int128 buf;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[STTelephonyStateProvider _logSubscriptionEvent:](*(_QWORD *)(a1 + 32), CFSTR("got new subscription info"));
  objc_msgSend(*(id *)(a1 + 40), "subscriptionsInUse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v2, "mutableCopy");

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v3 = *(id *)(a1 + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v54 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "slotID");
        if (v47)
        {
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v60 = __STTelephonyArrayContainsCTContextForSlot_block_invoke;
          v61 = &__block_descriptor_40_e48_B32__0__CTXPCServiceSubscriptionContext_8Q16_B24l;
          v62 = v9;
          if (objc_msgSend(v47, "indexOfObjectPassingTest:", &buf) != 0x7FFFFFFFFFFFFFFFLL)
            continue;
        }
        objc_msgSend(v8, "labelID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v47, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v5);
  }

  v11 = -[STTelephonyStateProvider _hasCTContextForSlot:](*(_QWORD **)(a1 + 32), 1);
  v12 = -[STTelephonyStateProvider _hasCTContextForSlot:](*(_QWORD **)(a1 + 32), 2);
  v13 = *(void **)(a1 + 32);
  v15 = (void *)objc_msgSend(v47, "copy");
  if (v13)
    objc_setProperty_nonatomic_copy(v13, v14, v15, 80);

  v16 = -[STTelephonyStateProvider _hasCTContextForSlot:](*(_QWORD **)(a1 + 32), 1);
  v17 = -[STTelephonyStateProvider _hasCTContextForSlot:](*(_QWORD **)(a1 + 32), 2);
  v18 = *(_QWORD *)(a1 + 32);
  if (!v11 || (v16 & 1) != 0)
  {
    if (v18)
      v19 = *(void **)(v18 + 64);
    else
      v19 = 0;
    -[STTelephonyStateProvider _cancelFakeServiceAndRegistrationForContext:](v18, v19);
  }
  else
  {
    -[STTelephonyStateProvider _purgeSlot1SubscriptionState](v18);
  }
  v20 = *(_QWORD *)(a1 + 32);
  if (((v12 ^ 1 | v17) & 1) != 0)
  {
    if (v20)
      v21 = *(void **)(v20 + 72);
    else
      v21 = 0;
    -[STTelephonyStateProvider _cancelFakeServiceAndRegistrationForContext:](v20, v21);
  }
  else
  {
    -[STTelephonyStateProvider _purgeSlot2SubscriptionState](v20);
  }
  STSystemStatusLogTelephonyState();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v47;
    _os_log_impl(&dword_1D02C7000, v22, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider: cached new SIM subscriptions: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = *(id *)(a1 + 48);
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v23)
  {
    v24 = v23;
    v46 = *(_QWORD *)v50;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v50 != v46)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v25);
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        v30 = *(_QWORD **)(a1 + 32);
        if (v30)
        {
          v31 = v28;
          v32 = v27;
          objc_msgSend(v32, "mobileEquipmentInfo");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setMobileEquipmentInfo:", v33);

          objc_msgSend(v32, "carrierBundleInfo");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setCarrierBundleInfo:", v34);

          objc_msgSend(v32, "subscriptionInfo");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "SIMStatus");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[STTelephonyStateProvider _setSIMStatus:inSubscriptionContext:](v30, v36, v31);

          objc_msgSend(v31, "subscriptionInfo");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "shortSIMLabel");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setShortSIMLabel:", v38);

          objc_msgSend(v37, "setPreferredForDataConnections:", objc_msgSend(v35, "isPreferredForDataConnections"));
          objc_msgSend(v35, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setIdentifier:", v39);

          objc_msgSend(v37, "setHiddenSIM:", objc_msgSend(v35, "isHiddenSIM"));
          v40 = *(_QWORD *)(a1 + 32);
          v41 = v26;
          if (v40)
          {
            v42 = *(void **)(v40 + 56);
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v60 = __65__STTelephonyStateProvider__queryRegistrationStatusForCTContext___block_invoke;
            v61 = &unk_1E8E18760;
            v62 = v40;
            v63 = v41;
            objc_msgSend(v42, "copyRegistrationDisplayStatus:completion:", v63, &buf);

          }
        }
        else
        {
          v43 = v26;
        }

        ++v25;
      }
      while (v24 != v25);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      v24 = v44;
    }
    while (v44);
  }

  -[STTelephonyStateProvider _updateDataConnectedSubscriptionContextForCTContext:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 56));
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_59;
  v48[3] = &unk_1E8E18648;
  v48[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v47, "enumerateObjectsUsingBlock:", v48);
  -[STTelephonyStateProvider _logSubscriptionEvent:](*(_QWORD *)(a1 + 32), CFSTR("kicked off updates for new subscription info"));

}

- (void)_updateDataConnectedSubscriptionContextForCTContext:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v3 = a2;
  if (a1)
  {
    v17 = v3;
    if (v3)
    {
      v4 = objc_msgSend(v3, "slotID");
      if (v4)
      {
        v5 = v4;
        if (-[STTelephonyStateProvider _hasCTContextForSlot:]((_QWORD *)a1, v4))
        {
          if (v5 == 2)
          {
            v14 = *(void **)(a1 + 64);
            v15 = *(id *)(a1 + 72);
            v8 = v14;
            objc_msgSend(v8, "subscriptionInfo");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setProvidingDataConnection:", 0);

            objc_msgSend(v15, "subscriptionInfo");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v11 = v10;
            v12 = 1;
            goto LABEL_12;
          }
          if (v5 == 1)
          {
            v6 = *(void **)(a1 + 64);
            v7 = *(id *)(a1 + 72);
            v8 = v6;
            objc_msgSend(v8, "subscriptionInfo");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setProvidingDataConnection:", 1);

            objc_msgSend(v7, "subscriptionInfo");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v11 = v10;
            v12 = 0;
LABEL_12:
            objc_msgSend(v11, "setProvidingDataConnection:", v12);

            goto LABEL_9;
          }
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 64), "subscriptionInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProvidingDataConnection:", 0);

    objc_msgSend(*(id *)(a1 + 72), "subscriptionInfo");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProvidingDataConnection:", 0);
LABEL_9:

    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, 0);
    v3 = v17;
  }

}

void __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_59(uint64_t a1, void *a2)
{
  char *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  _QWORD block[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;

  v3 = *(char **)(a1 + 32);
  v4 = a2;
  -[STTelephonyStateProvider _subscriptionContextForCTContext:](v3, v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "subscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSIMLabel:", v6);

  v7 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v8;
  if (v7)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = *(void **)(v7 + 56);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke;
    v30[3] = &unk_1E8E18698;
    v30[4] = v7;
    v12 = v8;
    v31 = v12;
    v13 = v11;
    objc_msgSend(v13, "getSignalStrengthInfo:completion:", v12, v30);
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_2;
    v28[3] = &unk_1E8E186C0;
    v28[4] = v7;
    v14 = v12;
    v29 = v14;
    objc_msgSend(v13, "copyOperatorName:completion:", v14, v28);
    v26[0] = v10;
    v26[1] = 3221225472;
    v26[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_3;
    v26[3] = &unk_1E8E186E8;
    v26[4] = v7;
    v15 = v14;
    v27 = v15;
    objc_msgSend(v13, "getDataStatus:completion:", v15, v26);
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_4;
    v24[3] = &unk_1E8E18710;
    v24[4] = v7;
    v16 = v15;
    v25 = v16;
    objc_msgSend(v13, "isNetworkReselectionNeeded:completion:", v16, v24);
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_5;
    v22[3] = &unk_1E8E18738;
    v22[4] = v7;
    v17 = v16;
    v23 = v17;
    objc_msgSend(v13, "copyRejectCauseCode:completion:", v17, v22);
    -[STTelephonyStateProvider _queryCallForwardingStateForCTContext:](v7, v17);
    v18 = *(NSObject **)(v7 + 48);
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_6;
    block[3] = &unk_1E8E17F10;
    block[4] = v7;
    v21 = v17;
    dispatch_async(v18, block);

  }
}

void __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_2_62(uint64_t a1)
{
  -[STTelephonyStateProvider _logSubscriptionEvent:](*(_QWORD *)(a1 + 32), CFSTR("failed to get new subscription info"));
}

- (uint64_t)_backgroundQueryQueue_shouldSuppressSOSOnlyWithLimitedServiceForCTContext:(void *)a1
{
  id v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  v3 = a1;
  v4 = (objc_class *)MEMORY[0x1E0CA6D00];
  v5 = a2;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBundleType:", 6);
  v10 = 0;
  v7 = (void *)objc_msgSend(v3, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v5, CFSTR("SuppressSOSOnlyWithLimitedService"), v6, &v10);

  if (v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    v8 = 0;
  else
    v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

void __72__STTelephonyStateProvider__backgroundQueryQueue_SIMStatusForCTContext___block_invoke(uint64_t a1)
{
  -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](*(_QWORD *)(a1 + 32), CFSTR("failed to get SIM status"), *(void **)(a1 + 40));
}

- (void)_setSIMStatus:(void *)a3 inSubscriptionContext:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if (a1)
  {
    v5 = a3;
    objc_msgSend(v5, "subscriptionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SIMStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v11) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SIM status not changing (%@) - firing notification anyway"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)a1, v8, v5);

    }
    else
    {
      objc_msgSend(v6, "setSIMStatus:", v11);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SIM status changed from %@ to %@"), v7, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)a1, v9, v5);

      -[STTelephonyStateProvider _updateCallForwardingIndicatorForContext:](a1, v5);
    }
    v10 = -[STTelephonyStateProvider _subscriptionSlotForContext:]((uint64_t)a1, v5);

    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:]((uint64_t)a1, v10);
  }

}

uint64_t __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return objc_msgSend(*(id *)(result + 32), "signalStrengthChanged:info:", *(_QWORD *)(result + 40), a2);
  return result;
}

uint64_t __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return objc_msgSend(*(id *)(result + 32), "operatorNameChanged:name:", *(_QWORD *)(result + 40), a2);
  return result;
}

uint64_t __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return objc_msgSend(*(id *)(result + 32), "dataStatus:dataStatusInfo:", *(_QWORD *)(result + 40), a2);
  return result;
}

void __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_4(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3)
    -[STTelephonyStateProvider _handleNetworkReselectionNeeded:forCTContext:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40));
}

- (void)_handleNetworkReselectionNeeded:(void *)a3 forCTContext:
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__STTelephonyStateProvider__handleNetworkReselectionNeeded_forCTContext___block_invoke;
    block[3] = &unk_1E8E18788;
    block[4] = a1;
    v9 = v5;
    v10 = a2;
    dispatch_async(v7, block);

  }
}

uint64_t __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_5(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return objc_msgSend(*(id *)(result + 32), "rejectCauseCodeChanged:causeCode:", *(_QWORD *)(result + 40), a2);
  return result;
}

- (void)_queryCallForwardingStateForCTContext:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__STTelephonyStateProvider__queryCallForwardingStateForCTContext___block_invoke;
    v6[3] = &unk_1E8E18710;
    v6[4] = a1;
    v7 = v3;
    objc_msgSend(v5, "isUnconditionalCallForwardingActive:completion:", v7, v6);

  }
}

uint64_t __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operatorBundleChange:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__STTelephonyStateProvider__queryRegistrationStatusForCTContext___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return objc_msgSend(*(id *)(result + 32), "displayStatusChanged:status:", *(_QWORD *)(result + 40), a2);
  return result;
}

void __66__STTelephonyStateProvider__queryCallForwardingStateForCTContext___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  if (!a3)
  {
    v11 = v3;
    v12 = v4;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(NSObject **)(v6 + 32);
    else
      v7 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__STTelephonyStateProvider__queryCallForwardingStateForCTContext___block_invoke_2;
    block[3] = &unk_1E8E18788;
    block[4] = v6;
    v9 = *(id *)(a1 + 40);
    v10 = a2;
    dispatch_async(v7, block);

  }
}

void __66__STTelephonyStateProvider__queryCallForwardingStateForCTContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 48))
      v3 = 1;
    else
      v3 = 2;
    -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:](*(_QWORD *)(a1 + 32), v3, v2);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider _queryCallForwardingStateForCTContext:]_block_invoke_2", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v4, v5, *(void **)(a1 + 40));

  }
}

- (void)dualSimCapabilityDidChange
{
  NSObject *internalQueue;
  _QWORD block[5];

  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__STTelephonyStateProvider_dualSimCapabilityDidChange__block_invoke;
  block[3] = &unk_1E8E18478;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __54__STTelephonyStateProvider_dualSimCapabilityDidChange__block_invoke(uint64_t a1)
{
  -[STTelephonyStateProvider _updateDualSIMCapabilitySendingNotification:](*(_QWORD *)(a1 + 32), 1);
}

void __72__STTelephonyStateProvider__updateDualSIMCapabilitySendingNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  char v8;
  _QWORD block[5];
  char v10;
  char v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = 0;
  v3 = objc_msgSend(v2, "getDualSimCapability:", &v12);
  v4 = v12;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    v6 = *(NSObject **)(v5 + 32);
  else
    v6 = 0;
  if (v4)
    v7 = 0;
  else
    v7 = v3 == 2;
  v8 = v7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__STTelephonyStateProvider__updateDualSIMCapabilitySendingNotification___block_invoke_2;
  block[3] = &unk_1E8E187B0;
  block[4] = v5;
  v10 = v8;
  v11 = *(_BYTE *)(a1 + 48);
  dispatch_async(v6, block);

}

void __72__STTelephonyStateProvider__updateDualSIMCapabilitySendingNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromBOOL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Setting dual SIM enabled: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTelephonyStateProvider _logSubscriptionEvent:](v2, v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    *(_BYTE *)(v6 + 17) = *(_BYTE *)(a1 + 40);
  if (*(_BYTE *)(a1 + 41))
    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](*(_QWORD *)(a1 + 32), 0);
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__STTelephonyStateProvider_signalStrengthChanged_info___block_invoke;
  block[3] = &unk_1E8E18260;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __55__STTelephonyStateProvider_signalStrengthChanged_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v15 = v2;
  if (v2)
  {
    -[STTelephonyStateProvider _updateLastKnownNetworkCountryCodeInContext:withCTContext:](v3, v2, *(void **)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "displayBars");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

    objc_msgSend(*(id *)(a1 + 48), "maxDisplayBars");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    v8 = *(_QWORD *)(a1 + 32);
    v9 = v15;
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "subscriptionInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "signalStrengthBars");
      if (v12 != v5 || objc_msgSend(v11, "maxSignalStrengthBars") != v7)
      {
        objc_msgSend(v11, "setSignalStrengthBars:", v5);
        objc_msgSend(v11, "setMaxSignalStrengthBars:", v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updated signal strength from %lu to %lu"), v12, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](v8, v13, v10);

        v14 = -[STTelephonyStateProvider _subscriptionSlotForContext:](v8, v10);
        -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](v8, v14);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider signalStrengthChanged:info:]_block_invoke");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v10, *(void **)(a1 + 40));
  }

}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__STTelephonyStateProvider_operatorNameChanged_name___block_invoke;
  block[3] = &unk_1E8E18260;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __53__STTelephonyStateProvider_operatorNameChanged_name___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6 = (id)v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("got new operator name: %@"), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v4, *(void **)(a1 + 40));

    objc_msgSend(v6, "setCachedCTOperatorName:", *(_QWORD *)(a1 + 48));
    -[STTelephonyStateProvider _setOperatorName:inSubscriptionContext:](*(unsigned __int8 **)(a1 + 32), *(void **)(a1 + 48), v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider operatorNameChanged:name:]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v5, *(void **)(a1 + 40));

  }
}

- (void)_setOperatorName:(void *)a3 inSubscriptionContext:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  void *v24;
  _BOOL4 v25;
  int v26;
  uint64_t v27;
  int v28;
  void *v29;
  id v30;
  dispatch_time_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  unsigned __int8 *val;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id location;
  _QWORD block[4];
  id v48;
  __int128 *v49;
  id v50[12];

  v50[10] = *(id *)MEMORY[0x1E0C80C00];
  v39 = a2;
  v5 = a3;
  val = a1;
  if (!a1)
    goto LABEL_40;
  v38 = v5;
  objc_msgSend(v5, "subscriptionInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "operatorName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v39;
  v37 = v38;
  objc_msgSend(v37, "statusBarImages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = 0;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, block, 16);
  if (!v8)
    goto LABEL_20;
  v9 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v43 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      objc_msgSend(v11, "objectForKey:", CFSTR("CarrierName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("AllowPrefixMatching"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      v15 = v6;
      v16 = v12;
      v17 = v16;
      if (v16 == v15)
      {

LABEL_16:
        objc_msgSend(v11, "objectForKey:", CFSTR("StatusBarCarrierName"));
        v15 = v7;
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

        goto LABEL_18;
      }
      if (!v6 || !v16)
      {

        goto LABEL_17;
      }
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E8E18D48);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E8E18D48);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        v20 = objc_msgSend(v18, "rangeOfString:options:", v19, 1);
      else
        v20 = objc_msgSend(v18, "compare:options:", v19, 1);
      v21 = v20 == 0;

      if (v21)
        goto LABEL_16;
LABEL_18:

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, block, 16);
  }
  while (v8);
LABEL_20:

  if (v7)
    v22 = v7;
  else
    v22 = v6;
  v23 = v22;

  v24 = v36;
  if ((objc_msgSend(v23, "isEqualToString:", v36) & 1) != 0)
  {
    -[STTelephonyStateProvider _cancelFakeServiceForContext:](v37);
  }
  else
  {
    if (objc_msgSend(v36, "length"))
      v25 = objc_msgSend(v23, "length") != 0;
    else
      v25 = 1;
    v26 = val[20];
    v27 = objc_msgSend(v23, "length");
    v28 = v27 == 0;
    if (!v26 && !v27)
    {
      objc_msgSend(v40, "SIMStatus");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "isEqual:", *MEMORY[0x1E0CA77F8]))
        v28 = -[STTelephonyStateProvider _internalQueue_needsUserIdentificationModule]((uint64_t)val);
      else
        v28 = 0;
      v24 = v36;

    }
    if (((v25 | v28) & 1) != 0)
    {
      -[STTelephonyStateProvider _reallySetOperatorName:inSubscriptionContext:]((uint64_t)val, v23, v37);
    }
    else
    {
      v30 = v37;
      if (!objc_msgSend(v30, "fakeServiceCanceled"))
      {
        objc_initWeak(&location, val);
        *(_QWORD *)&v42 = 0;
        *((_QWORD *)&v42 + 1) = &v42;
        *(_QWORD *)&v43 = 0x2020000000;
        BYTE8(v43) = 0;
        v31 = dispatch_time(0, 10000000000);
        v32 = (void *)*((_QWORD *)val + 4);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __67__STTelephonyStateProvider__startFakeServiceIfNecessaryForContext___block_invoke;
        block[3] = &unk_1E8E187D8;
        v49 = &v42;
        v33 = v30;
        v48 = v33;
        v34 = v32;
        objc_copyWeak(v50, &location);
        dispatch_after(v31, v34, block);

        objc_msgSend(v33, "setFakeServiceCanceled:", *((_QWORD *)&v42 + 1) + 24);
        objc_destroyWeak(v50);

        _Block_object_dispose(&v42, 8);
        objc_destroyWeak(&location);
      }

      v24 = v36;
    }
  }

  v5 = v38;
LABEL_40:

}

- (void)_reallySetOperatorName:(void *)a3 inSubscriptionContext:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v5, "subscriptionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operatorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", v7) & 1) == 0)
  {
    objc_msgSend(v6, "setOperatorName:", v10);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("operatorName changed from '%@' to '%@'"), v7, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](a1, v8, v5);

  }
  -[STTelephonyStateProvider _cancelFakeServiceForContext:](v5);
  v9 = -[STTelephonyStateProvider _subscriptionSlotForContext:](a1, v5);
  -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, v9);

}

void __67__STTelephonyStateProvider__startFakeServiceIfNecessaryForContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "setFakeServiceCanceled:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[STTelephonyStateProvider _stopFakeServiceForContext:]((uint64_t)WeakRetained, *(void **)(a1 + 32));

  }
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke;
  block[3] = &unk_1E8E18260;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 56);
  else
    v3 = 0;
  v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke_2;
  v5[3] = &unk_1E8E18580;
  v5[4] = v2;
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "copyRegistrationStatus:completion:", v6, v5);

}

void __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  if (!a3)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(NSObject **)(v6 + 32);
    else
      v7 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke_3;
    v8[3] = &unk_1E8E185A8;
    v8[4] = v6;
    v9 = *(id *)(a1 + 40);
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    dispatch_async(v7, v8);

  }
}

void __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  dispatch_time_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  NSObject *queue;
  id v41;
  dispatch_time_t when;
  id *v43;
  char v44;
  void *v45;
  id v46;
  unint64_t v47;
  id v48;
  id v49;
  id v50;
  uint64_t block;
  uint64_t v52;
  void (*v53)(uint64_t);
  void *v54;
  id v55;
  uint64_t *v56;
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  id location[2];

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD **)(a1 + 32);
  v50 = (id)v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "registrationDisplayStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 56), "isRegistrationForcedHome");
    v44 = objc_msgSend(*(id *)(a1 + 56), "changedDueToSimRemoval");
    v7 = *(void **)(a1 + 40);
    v49 = v4;
    v8 = v5;
    v9 = v50;
    v10 = v7;
    if (v3)
    {
      -[STTelephonyStateProvider _updateLastKnownNetworkCountryCodeInContext:withCTContext:]((uint64_t)v3, v9, v10);
      v47 = STTelephonyRegistrationStatusForStatus(v8);
      v11 = v49;
      v48 = v8;
      v46 = v9;
      v12 = v9;
      objc_msgSend(v12, "subscriptionInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cachedCTRegistrationCellularStatus");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14 || (objc_msgSend(v14, "isEqualToString:", v11) & 1) == 0)
      {
        v16 = v11;
        v17 = STTelephonyRegistrationStatusForStatus(v11);
        if (v17 == 2 || objc_msgSend(v13, "cellularRegistrationStatus") != 2)
        {
          -[STTelephonyStateProvider _setCellRegistrationStatus:inSubscriptionContext:]((uint64_t)v3, v17, v12);
        }
        else
        {
          v18 = v12;
          if (!objc_msgSend(v18, "fakeCellularRegistrationCanceled"))
          {
            objc_initWeak(location, v3);
            v58 = 0;
            v59 = &v58;
            v60 = 0x2020000000;
            v61 = 0;
            when = dispatch_time(0, 10000000000);
            v43 = (id *)v3[4];
            block = MEMORY[0x1E0C809B0];
            v52 = 3221225472;
            v53 = __80__STTelephonyStateProvider__startFakeCellularRegistrationIfNecessaryForContext___block_invoke;
            v54 = &unk_1E8E187D8;
            v56 = &v58;
            v41 = v18;
            v55 = v41;
            queue = v43;
            objc_copyWeak(&v57, location);
            dispatch_after(when, queue, &block);

            objc_msgSend(v41, "setFakeCellularRegistrationCanceled:", v59 + 3);
            objc_destroyWeak(&v57);

            _Block_object_dispose(&v58, 8);
            objc_destroyWeak(location);
          }

        }
        v11 = v16;
        objc_msgSend(v12, "setCachedCTRegistrationCellularStatus:", v16);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cached cell status changed from %@ to %@"), v15, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)v3, v19, v12);

      }
      v20 = v15;
      v21 = v13;
      v45 = v11;
      objc_msgSend(v12, "cachedCTRegistrationDisplayStatus");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = v48;
      if (!v22 || (objc_msgSend(v22, "isEqualToString:", v48) & 1) == 0)
      {
        objc_msgSend(v12, "setCachedCTRegistrationDisplayStatus:", v48);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cached display status changed from %@ to %@"), v23, v48);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)v3, v25, v12);

      }
      if ((_DWORD)v6 != objc_msgSend(v21, "isRegisteredWithoutCellular"))
      {
        objc_msgSend(v21, "setRegisteredWithoutCellular:", v6);
        v26 = v10;
        v27 = v8;
        v28 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromBOOL();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBOOL();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("forcedHome status changed from %@ to %@"), v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)v3, v31, v12);

        v8 = v27;
        v10 = v26;

        v24 = v48;
      }

      if (v47 == 2)
      {
        -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:](v3, 2uLL, v12);
      }
      else
      {
        objc_msgSend(v12, "subscriptionInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        switch(objc_msgSend(v32, "registrationStatus"))
        {
          case 0:
            goto LABEL_27;
          case 1:
            if (!objc_msgSend(v12, "isPretendingToSearch"))
              goto LABEL_21;
            if (v47 != 1)
              break;
            goto LABEL_27;
          case 2:
            if ((v44 & 1) != 0)
              goto LABEL_27;
            if (-[STTelephonyStateProvider _internalQueue_needsUserIdentificationModule]((uint64_t)v3))
            {
              objc_msgSend(v32, "SIMStatus");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "isEqual:", *MEMORY[0x1E0CA77F8]);

              if (v34)
                goto LABEL_27;
            }
            v35 = v12;
            if (!objc_msgSend(v35, "fakeRegistrationCanceled"))
            {
              objc_initWeak(location, v3);
              v58 = 0;
              v59 = &v58;
              v60 = 0x2020000000;
              v61 = 0;
              v36 = dispatch_time(0, 10000000000);
              v37 = (void *)v3[4];
              block = MEMORY[0x1E0C809B0];
              v52 = 3221225472;
              v53 = __72__STTelephonyStateProvider__startFakeRegistrationIfNecessaryForContext___block_invoke;
              v54 = &unk_1E8E187D8;
              v56 = &v58;
              v38 = v35;
              v55 = v38;
              v39 = v37;
              objc_copyWeak(&v57, location);
              dispatch_after(v36, v39, &block);

              objc_msgSend(v38, "setFakeRegistrationCanceled:", v59 + 3);
              objc_destroyWeak(&v57);

              _Block_object_dispose(&v58, 8);
              objc_destroyWeak(location);
            }

            break;
          case 3:
          case 4:
LABEL_21:
            if (v47 == 1)
LABEL_27:
              -[STTelephonyStateProvider _updateRegistrationNowInSubscriptionContext:](v3, v12);
            else
              -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:](v3, v47, v12);
            break;
          default:
            break;
        }

      }
      v9 = v46;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider displayStatusChanged:status:]_block_invoke_3");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:]((uint64_t)v3, v8, *(void **)(a1 + 40));
  }

}

- (void)_setCellRegistrationStatus:(void *)a3 inSubscriptionContext:
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  if (a1)
  {
    objc_msgSend(v13, "subscriptionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "cellularRegistrationStatus");
    if (v6 != a2)
    {
      v7 = v6;
      objc_msgSend(v5, "setCellularRegistrationStatus:", a2);
      v8 = (void *)MEMORY[0x1E0CB3940];
      STTelephonyRegistrationStatusDebugName(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      STTelephonyRegistrationStatusDebugName(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("cell status changed from %@ to %@"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](a1, v11, v13);

      v12 = -[STTelephonyStateProvider _subscriptionSlotForContext:](a1, v13);
      -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, v12);
    }
    -[STTelephonyStateProvider _cancelFakeCellularRegistrationForContext:](v13);

  }
}

void __72__STTelephonyStateProvider__startFakeRegistrationIfNecessaryForContext___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "setFakeRegistrationCanceled:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[STTelephonyStateProvider _updateRegistrationNowInSubscriptionContext:](WeakRetained, *(void **)(a1 + 32));

  }
}

void __80__STTelephonyStateProvider__startFakeCellularRegistrationIfNecessaryForContext___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  id WeakRetained;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "setFakeCellularRegistrationCanceled:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "cachedCTRegistrationCellularStatus");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = STTelephonyRegistrationStatusForStatus(v2);
    -[STTelephonyStateProvider _setCellRegistrationStatus:inSubscriptionContext:]((uint64_t)WeakRetained, v3, *(void **)(a1 + 32));

  }
}

- (void)networkReselectionNeeded:(id)a3
{
  -[STTelephonyStateProvider _handleNetworkReselectionNeeded:forCTContext:]((uint64_t)self, 1, a3);
}

- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5
{
  if (a4)
    -[STTelephonyStateProvider _handleNetworkReselectionNeeded:forCTContext:]((uint64_t)self, 0, a3);
}

void __73__STTelephonyStateProvider__handleNetworkReselectionNeeded_forCTContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v10 = (id)v2;
  if (v2)
  {
    v4 = *(unsigned __int8 *)(a1 + 48);
    v5 = *(id *)(a1 + 40);
    if (v3)
    {
      objc_msgSend(v10, "subscriptionInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v4 != 0) != objc_msgSend(v6, "isNetworkReselectionNeeded"))
      {
        objc_msgSend(v6, "setNetworkReselectionNeeded:", v4 != 0);
        v7 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromBOOL();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("Set network reselection needed: %@"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v9, v5);

        -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](v3, objc_msgSend(v5, "slotID"));
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider _handleNetworkReselectionNeeded:forCTContext:]_block_invoke");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v5, *(void **)(a1 + 40));
  }

}

- (void)rejectCauseCodeChanged:(id)a3 causeCode:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__STTelephonyStateProvider_rejectCauseCodeChanged_causeCode___block_invoke;
  block[3] = &unk_1E8E18260;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __61__STTelephonyStateProvider_rejectCauseCodeChanged_causeCode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v11 = (id)v2;
  if (v2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "integerValue");
    v5 = v11;
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "subscriptionInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "registrationRejectionCauseCode");
      if (v8 != v4)
      {
        v9 = v8;
        objc_msgSend(v7, "setRegistrationRejectionCauseCode:", v4);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Registration rejection cause code changed from %ld to %ld"), v9, v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](v3, v10, v6);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider rejectCauseCodeChanged:causeCode:]_block_invoke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v6, *(void **)(a1 + 40));
  }

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__STTelephonyStateProvider_simStatusDidChange_status___block_invoke;
  block[3] = &unk_1E8E18260;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __54__STTelephonyStateProvider_simStatusDidChange_status___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  id v5;

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD **)(a1 + 32);
  v5 = v2;
  if (v2)
  {
    -[STTelephonyStateProvider _setSIMStatus:inSubscriptionContext:](v3, *(void **)(a1 + 48), v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider simStatusDidChange:status:]_block_invoke", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:]((uint64_t)v3, v4, *(void **)(a1 + 40));

  }
}

- (void)servingNetworkChanged:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__STTelephonyStateProvider_servingNetworkChanged___block_invoke;
  v7[3] = &unk_1E8E17F10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __50__STTelephonyStateProvider_servingNetworkChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider servingNetworkChanged:]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v5, *(void **)(a1 + 40));

    goto LABEL_5;
  }
  v4 = v2;
  if (v3)
  {
    -[STTelephonyStateProvider _updateLastKnownNetworkCountryCodeInContext:withCTContext:](v3, v2, *(void **)(a1 + 40));
LABEL_5:
    v4 = v6;
  }

}

- (void)currentDataSimChanged:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__STTelephonyStateProvider_currentDataSimChanged___block_invoke;
  v7[3] = &unk_1E8E17F10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __50__STTelephonyStateProvider_currentDataSimChanged___block_invoke(uint64_t a1)
{
  -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](*(_QWORD *)(a1 + 32), CFSTR("current data SIM changed to this slot"), *(void **)(a1 + 40));
  -[STTelephonyStateProvider _updateDataConnectedSubscriptionContextForCTContext:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__STTelephonyStateProvider_dataStatus_dataStatusInfo___block_invoke;
  block[3] = &unk_1E8E18260;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __54__STTelephonyStateProvider_dataStatus_dataStatusInfo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v20 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 48);
    v5 = v2;
    if (v3)
    {
      v6 = v4;
      v7 = objc_msgSend(v6, "indicator");
      v8 = objc_msgSend(v6, "indicatorOverride");
      v9 = objc_msgSend(v6, "radioTechnology");

      v10 = STTelephonyDataConnectionTypeForIndicatorNameAndRadioTechnology(v7, v9);
      v11 = STTelephonyDataConnectionTypeForIndicatorNameAndRadioTechnology(v8, v9);
      v12 = v11;
      if ((unint64_t)(v11 - 11) >= 4 && (v10 != 7 || (unint64_t)(v11 - 7) >= 4))
      {
        if (v8 == 7 && (v10 & 0xE) == 4)
          v12 = 6;
        else
          v12 = v10;
      }
      v14 = objc_msgSend(v5, "modemDataConnectionType");
      if (v14 != v12)
      {
        v15 = v14;
        objc_msgSend(v5, "setModemDataConnectionType:", v12);
        v16 = (void *)MEMORY[0x1E0CB3940];
        STTelephonyDataConnectionTypeDebugName(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        STTelephonyDataConnectionTypeDebugName(v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("_updateModemDataConnectionTypeWithCTInfo: - cellular data connection changed from %@ to %@"), v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](v3, v19, v5);

      }
      -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](v3, v5);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider dataStatus:dataStatusInfo:]_block_invoke");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v5, *(void **)(a1 + 40));
  }

}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  void *v5;
  STMutableTelephonyCarrierBundleInfo *v6;
  CoreTelephonyClient *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *internalQueue;
  STMutableTelephonyCarrierBundleInfo *v23;
  id v24;
  _QWORD block[5];
  id v26;
  STMutableTelephonyCarrierBundleInfo *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    v6 = objc_alloc_init(STMutableTelephonyCarrierBundleInfo);
    v7 = self->_coreTelephonyClient;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);
    v33 = 0;
    v9 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v7, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v5, CFSTR("DataIndicatorOverrideForLTE"), v8, &v33);
    if (!v33)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("4G"));
      else
        v10 = 0;
      -[STMutableTelephonyCarrierBundleInfo setLTEConnectionShows4G:](v6, "setLTEConnectionShows4G:", v10);
    }
    v32 = 0;
    v11 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v7, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v5, CFSTR("UserCanReinitiateActivation"), v8, &v32);
    v12 = v32;

    if (!v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = objc_msgSend(v11, "BOOLValue") ^ 1;
      else
        v13 = 0;
      -[STMutableTelephonyCarrierBundleInfo setReinitiatingActivationDisabled:](v6, "setReinitiatingActivationDisabled:", v13);
    }
    v31 = 0;
    v14 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v7, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v5, CFSTR("CustomerServicePhoneNumber"), v8, &v31);
    v15 = v31;

    if (!v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[STMutableTelephonyCarrierBundleInfo setCustomerServicePhoneNumber:](v6, "setCustomerServicePhoneNumber:", v14);
    }
    v30 = 0;
    v16 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v7, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v5, CFSTR("DisabledApplications"), v8, &v30);
    v17 = v30;

    if (!v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[STMutableTelephonyCarrierBundleInfo setDisabledApplicationIDs:](v6, "setDisabledApplicationIDs:", v16);
    }
    v29 = 0;
    v18 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v7, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v5, CFSTR("CarrierName"), v8, &v29);
    v19 = v29;

    if (!v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[STMutableTelephonyCarrierBundleInfo setCarrierName:](v6, "setCarrierName:", v18);
    }
    v28 = 0;
    v20 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v7, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v5, CFSTR("HomeCountryCode"), v8, &v28);
    v21 = v28;

    if (!v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[STMutableTelephonyCarrierBundleInfo setHomeCountryCode:](v6, "setHomeCountryCode:", v20);
    }
    -[STMutableTelephonyCarrierBundleInfo setSuppressSOSOnlyWithLimitedService:](v6, "setSuppressSOSOnlyWithLimitedService:", -[STTelephonyStateProvider _backgroundQueryQueue_shouldSuppressSOSOnlyWithLimitedServiceForCTContext:](self->_coreTelephonyClient, v5));

    internalQueue = self->_internalQueue;
  }
  else
  {

    v6 = 0;
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__STTelephonyStateProvider_carrierBundleChange___block_invoke;
  block[3] = &unk_1E8E18260;
  block[4] = self;
  v26 = v5;
  v27 = v6;
  v23 = v6;
  v24 = v5;
  dispatch_async(internalQueue, block);

}

void __48__STTelephonyStateProvider_carrierBundleChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  uint8_t buf[8];
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v14 = (id)v2;
  if (v2)
  {
    v4 = *(id *)(a1 + 48);
    v5 = v14;
    if (v3)
    {
      if (*(_QWORD *)(v3 + 104) != -1)
      {
        *(_QWORD *)(v3 + 104) = -1;
        STSystemStatusLogTelephonyState();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D02C7000, v6, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider resetting _needsUserIdentificationModule (for carrier bundle change)", buf, 2u);
        }

      }
      v7 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v5, "setCarrierBundleInfo:", v7);

      -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](v3, CFSTR("carrier bundle changed"), v5);
      v8 = -[STTelephonyStateProvider _subscriptionSlotForContext:](v3, v5);
      v9 = *(id *)(v3 + 24);
      objc_msgSend(v9, "setRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = *(NSObject **)(v3 + 40);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __91__STTelephonyStateProvider__internalQueue_notifyObserversOfCarrierBundleInfoChangeForSlot___block_invoke;
      v18 = &unk_1E8E18198;
      v19 = v10;
      v20 = v3;
      v21 = v8;
      v12 = v10;
      dispatch_async(v11, buf);

      -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](v3, v5);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider carrierBundleChange:]_block_invoke", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v13, *(void **)(a1 + 40));

  }
}

- (void)operatorBundleChange:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[STTelephonyStateProvider carrierBundleChange:](self, "carrierBundleChange:", v4);
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__STTelephonyStateProvider_operatorBundleChange___block_invoke;
  v7[3] = &unk_1E8E17F10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __49__STTelephonyStateProvider_operatorBundleChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 2);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 56);
  else
    v4 = 0;
  v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__STTelephonyStateProvider_operatorBundleChange___block_invoke_2;
  v6[3] = &unk_1E8E18800;
  v6[4] = v3;
  v7 = v5;
  objc_msgSend(v4, "copyCarrierBundleValueWithDefault:key:bundleType:completion:", v7, CFSTR("StatusBarImages"), v2, v6);

}

void __49__STTelephonyStateProvider_operatorBundleChange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v17;
        while (2)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v6);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_15;
            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            continue;
          break;
        }
      }

      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
        v12 = *(NSObject **)(v11 + 32);
      else
        v12 = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__STTelephonyStateProvider_operatorBundleChange___block_invoke_3;
      block[3] = &unk_1E8E18260;
      block[4] = v11;
      v14 = *(id *)(a1 + 40);
      v15 = v6;
      dispatch_async(v12, block);

LABEL_15:
    }
  }

}

void __49__STTelephonyStateProvider_operatorBundleChange___block_invoke_3(uint64_t a1)
{
  void *v2;
  unsigned __int8 *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_msgSend(v6, "setStatusBarImages:", v2);

    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](*(_QWORD *)(a1 + 32), CFSTR("operator bundle changed"), *(void **)(a1 + 40));
    v3 = *(unsigned __int8 **)(a1 + 32);
    objc_msgSend(v6, "cachedCTOperatorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _setOperatorName:inSubscriptionContext:](v3, v4, v6);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider operatorBundleChange:]_block_invoke_3");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v5, v4, *(void **)(a1 + 40));
  }

}

- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6
{
  id v10;
  id v11;
  NSObject *internalQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int v18;
  int v19;

  v10 = a3;
  v11 = a6;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__STTelephonyStateProvider_suppServicesEvent_event_settingsType_data___block_invoke;
  v15[3] = &unk_1E8E18170;
  v18 = a4;
  v19 = a5;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(internalQueue, v15);

}

void __70__STTelephonyStateProvider_suppServicesEvent_event_settingsType_data___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if ((*(_DWORD *)(a1 + 56) | 4) == 5 && *(_DWORD *)(a1 + 60) == 2)
  {
    -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "active");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "BOOLValue"))
        v3 = 1;
      else
        v3 = 2;

      -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:](*(_QWORD *)(a1 + 32), v3, v6);
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- did not have matching context"), "-[STTelephonyStateProvider suppServicesEvent:event:settingsType:data:]_block_invoke", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v4, v5, *(void **)(a1 + 40));

    }
  }
}

void __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(NSObject **)(v7 + 32);
    else
      v8 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke_2;
    block[3] = &unk_1E8E18260;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v13 = v9;
    v14 = v10;
    v15 = v11;
    dispatch_async(v8, block);

  }
}

void __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "subscriptionsInUse");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[STTelephonyStateProvider _subscriptionSlotForContext:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke_3;
    v7[3] = &__block_descriptor_40_e48_B32__0__CTXPCServiceSubscriptionContext_8Q16_B24l;
    v7[4] = v2;
    v3 = objc_msgSend(v6, "indexOfObjectPassingTest:", v7);
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = v4;
        -[STTelephonyStateProvider _queryCallForwardingStateForCTContext:](*(_QWORD *)(a1 + 40), v4);

      }
    }
  }

}

BOOL __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "slotID") == *(_QWORD *)(a1 + 32);
}

- (void)airplaneModeChanged
{
  RadiosPreferences *radiosPreferences;
  RadiosPreferences *v4;
  char v5;
  NSObject *internalQueue;
  _QWORD v7[5];
  char v8;

  if (self)
    radiosPreferences = self->_radiosPreferences;
  else
    radiosPreferences = 0;
  v4 = radiosPreferences;
  -[RadiosPreferences refresh](v4, "refresh");
  v5 = -[RadiosPreferences airplaneMode](v4, "airplaneMode");
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__STTelephonyStateProvider_airplaneModeChanged__block_invoke;
  v7[3] = &unk_1E8E18870;
  v8 = v5;
  v7[4] = self;
  dispatch_async(internalQueue, v7);

}

void __47__STTelephonyStateProvider_airplaneModeChanged__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  dispatch_time_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  dispatch_time_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id location;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (v1 != *(unsigned __int8 *)(v2 + 20))
    {
      *(_BYTE *)(v2 + 20) = v1;
      v3 = *(_QWORD *)(a1 + 32);
      if (v3)
      {
        v4 = *(unsigned __int8 *)(a1 + 40);
        v5 = *(id *)(v3 + 64);
        v6 = *(id *)(v3 + 72);
        if (v4)
        {
          -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:](v3, 0, v5);
          if (objc_msgSend(v5, "isFakingService"))
            -[STTelephonyStateProvider _stopFakeServiceForContext:](v3, v5);
          -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:](v3, 0, v6);
          if (objc_msgSend(v6, "isFakingService"))
            -[STTelephonyStateProvider _stopFakeServiceForContext:](v3, v6);
        }
        else
        {
          objc_initWeak(&location, (id)v3);
          objc_msgSend(v5, "cachedCTRegistrationDisplayStatus");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = STTelephonyRegistrationStatusForStatus(v7);

          if (v8 - 3 > 0xFFFFFFFFFFFFFFFDLL)
          {
            objc_msgSend(v5, "subscriptionInfo");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "registrationStatus");

            objc_msgSend(v5, "setPretendingToSearch:", 0);
            -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:]((_QWORD *)v3, v8, v5);
            if (v13 == v8)
              -[STTelephonyStateProvider _updateCallForwardingIndicatorForContext:]((_QWORD *)v3, v5);
          }
          else
          {
            objc_msgSend(v5, "setPretendingToSearch:", 1);
            -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:]((_QWORD *)v3, 1uLL, v5);
            v9 = dispatch_time(0, 15000000000);
            v10 = *(void **)(v3 + 32);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __51__STTelephonyStateProvider__airplaneModeDidChange___block_invoke;
            block[3] = &unk_1E8E18558;
            v25 = v5;
            v11 = v10;
            objc_copyWeak(&v26, &location);
            dispatch_after(v9, v11, block);

            objc_destroyWeak(&v26);
          }
          objc_msgSend(v6, "cachedCTRegistrationDisplayStatus");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = STTelephonyRegistrationStatusForStatus(v14);

          if (v15 - 3 > 0xFFFFFFFFFFFFFFFDLL)
          {
            objc_msgSend(v6, "subscriptionInfo");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "registrationStatus");

            objc_msgSend(v6, "setPretendingToSearch:", 0);
            -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:]((_QWORD *)v3, v15, v6);
            if (v20 == v15)
              -[STTelephonyStateProvider _updateCallForwardingIndicatorForContext:]((_QWORD *)v3, v6);
          }
          else
          {
            objc_msgSend(v6, "setPretendingToSearch:", 1);
            -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:]((_QWORD *)v3, 1uLL, v6);
            v16 = dispatch_time(0, 15000000000);
            v17 = *(void **)(v3 + 32);
            v21[0] = MEMORY[0x1E0C809B0];
            v21[1] = 3221225472;
            v21[2] = __51__STTelephonyStateProvider__airplaneModeDidChange___block_invoke_2;
            v21[3] = &unk_1E8E18558;
            v22 = v6;
            v18 = v17;
            objc_copyWeak(&v23, &location);
            dispatch_after(v16, v18, v21);

            objc_destroyWeak(&v23);
          }
          objc_destroyWeak(&location);
        }
        -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](v3, v5);
        -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](v3, v6);

      }
    }
  }
}

- (void)stateChanged:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    observerQueue = self->_observerQueue;
  else
    observerQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__STTelephonyStateProvider_stateChanged___block_invoke;
  v7[3] = &unk_1E8E17F10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(observerQueue, v7);

}

void __41__STTelephonyStateProvider_stateChanged___block_invoke(uint64_t a1)
{
  -[STTelephonyStateProvider setStewieState:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (NSString)description
{
  return (NSString *)-[STTelephonyStateProvider descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STTelephonyStateProvider debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STTelephonyStateProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  STTelephonySubscriptionContext *slot1SubscriptionContext;
  void *v7;
  void *v8;
  STTelephonySubscriptionContext *slot2SubscriptionContext;
  void *v10;
  void *v11;
  id v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_cachedDualSIMEnabled, CFSTR("dualSIMEnabled"));
    slot1SubscriptionContext = self->_slot1SubscriptionContext;
  }
  else
  {
    v13 = (id)objc_msgSend(v3, "appendBool:withName:", 0, CFSTR("dualSIMEnabled"));
    slot1SubscriptionContext = 0;
  }
  -[STTelephonySubscriptionContext subscriptionInfo](slot1SubscriptionContext, "subscriptionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "succinctDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("slot1SubscriptionInfo"));

  if (self)
    slot2SubscriptionContext = self->_slot2SubscriptionContext;
  else
    slot2SubscriptionContext = 0;
  -[STTelephonySubscriptionContext subscriptionInfo](slot2SubscriptionContext, "subscriptionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "succinctDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v11, CFSTR("slot2SubscriptionInfo"));

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STTelephonyStateProvider descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  STTelephonyStateProvider *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__STTelephonyStateProvider_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E17F10;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __66__STTelephonyStateProvider_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  id v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(unsigned __int8 *)(v3 + 17) != 0;
  else
    v4 = 0;
  v5 = (id)objc_msgSend(v2, "appendBool:withName:", v4, CFSTR("dualSIMEnabled"));
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD **)(a1 + 40);
  if (v6)
    v6 = (_QWORD *)v6[8];
  v8 = v6;
  objc_msgSend(v8, "subscriptionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "appendObject:withName:", v9, CFSTR("slot1SubscriptionInfo"));

  v12 = *(void **)(a1 + 32);
  v11 = *(_QWORD **)(a1 + 40);
  if (v11)
    v11 = (_QWORD *)v11[9];
  v15 = v11;
  objc_msgSend(v15, "subscriptionInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "appendObject:withName:", v13, CFSTR("slot2SubscriptionInfo"));

}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  STTelephonyStateProvider *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  STTelephonyStateProvider *v15;

  v3 = self;
  if (self)
  {
    v4 = (void *)MEMORY[0x1E0D01748];
    v5 = a3;
    objc_msgSend(v4, "builderWithObject:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", 1);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __71__STTelephonyStateProvider_debugDescriptionBuilderWithMultilinePrefix___block_invoke;
    v13 = &unk_1E8E17F10;
    v7 = v6;
    v14 = v7;
    v15 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, &v10);

    v3 = (STTelephonyStateProvider *)v7;
  }
  -[STTelephonyStateProvider build](v3, "build", a3, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __71__STTelephonyStateProvider_debugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  id v5;
  id v6;
  uint64_t v7;
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _BOOL8 v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(unsigned __int8 *)(v3 + 19) != 0;
  else
    v4 = 0;
  v5 = (id)objc_msgSend(v2, "appendBool:withName:", v4, CFSTR("containsCellularRadio"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "hasCellularTelephony"), CFSTR("hasCellularTelephony"));
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    v8 = *(unsigned __int8 *)(v7 + 18) != 0;
  else
    v8 = 0;
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", v8, CFSTR("radioModuleDead"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUsingStewieForSOS"), CFSTR("usingStewieForSOS"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isInactiveSOSEnabled"), CFSTR("inactiveSOSEnabled"));
  v13 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    v14 = *(_QWORD *)(v12 + 88);
  else
    v14 = 0;
  STTelephonyCachedBooleanDebugName(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendString:withName:", v15, CFSTR("suppressesCellDataIndicator"));

  v17 = *(void **)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    v18 = *(_QWORD *)(v16 + 96);
  else
    v18 = 0;
  STTelephonyCachedBooleanDebugName(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendString:withName:", v19, CFSTR("suppressesCellIndicators"));

  v20 = *(_QWORD *)(a1 + 40);
  if (v20)
    v21 = *(unsigned __int8 *)(v20 + 17) != 0;
  else
    v21 = 0;
  v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", v21, CFSTR("dualSIMEnabled"));
  v23 = *(_QWORD *)(a1 + 40);
  if (v23)
    v24 = *(_QWORD *)(v23 + 64);
  else
    v24 = 0;
  v25 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v24, CFSTR("slot1SubscriptionContext"));
  v26 = *(_QWORD *)(a1 + 40);
  if (v26)
    v27 = *(_QWORD *)(v26 + 72);
  else
    v27 = 0;
  v28 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v27, CFSTR("slot2SubscriptionContext"));
  v29 = *(_QWORD *)(a1 + 40);
  if (v29)
    v30 = *(_QWORD *)(v29 + 80);
  else
    v30 = 0;
  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", v30, CFSTR("cachedCTContexts"), 0);
  v32 = *(void **)(a1 + 32);
  v31 = *(_QWORD *)(a1 + 40);
  if (v31)
    v33 = *(_QWORD *)(v31 + 104);
  else
    v33 = 0;
  STTelephonyCachedBooleanDebugName(v33);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "appendString:withName:", v34, CFSTR("needsUserIdentificationModule"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stewieState, 0);
  objc_storeStrong((id *)&self->_stewieStateMonitor, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_cachedCTContexts, 0);
  objc_storeStrong((id *)&self->_slot2SubscriptionContext, 0);
  objc_storeStrong((id *)&self->_slot1SubscriptionContext, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_backgroundQueryQueue, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
