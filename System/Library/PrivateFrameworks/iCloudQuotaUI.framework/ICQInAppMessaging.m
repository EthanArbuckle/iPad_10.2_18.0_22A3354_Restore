@implementation ICQInAppMessaging

- (BOOL)_termsNotAccepted
{
  void *v2;
  void *v3;
  char v4;

  -[ICQInAppMessaging accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "aa_needsToVerifyTerms");

  return v4;
}

uint64_t __47__ICQInAppMessaging__recalculateCurrentMessage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "regularOffer");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "premiumOffer");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "defaultOffer");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  result = objc_msgSend(*(id *)(a1 + 32), "isICloudReachable");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

- (id)_recalculateCurrentMessage
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint8_t v20[8];
  _QWORD v21[9];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__14;
  v42 = __Block_byref_object_dispose__14;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__14;
  v36 = __Block_byref_object_dispose__14;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__14;
  v30 = __Block_byref_object_dispose__14;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[ICQInAppMessaging unfairLock](self, "unfairLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __47__ICQInAppMessaging__recalculateCurrentMessage__block_invoke;
  v21[3] = &unk_24E3F5B00;
  v21[4] = self;
  v21[5] = &v38;
  v21[6] = &v32;
  v21[7] = &v26;
  v21[8] = &v22;
  objc_msgSend(v3, "synchronized:", v21);

  -[ICQInAppMessaging mockMessage](self, "mockMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "In-app messages sending mock message", v20, 2u);
    }

    -[ICQInAppMessaging mockMessage](self, "mockMessage");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!*((_BYTE *)v23 + 24))
  {
    if (-[ICQInAppMessaging isAirplaneModeEnabled](self, "isAirplaneModeEnabled"))
    {
      -[ICQInAppMessaging airplaneModeOnMessageFromDefaultOffer:](self, "airplaneModeOnMessageFromDefaultOffer:", v27[5]);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = -[ICQInAppMessaging _isCellularDataOff](self, "_isCellularDataOff");
      v15 = v27[5];
      if (v14)
        -[ICQInAppMessaging cellularDataOffMessageFromDefaultOffer:](self, "cellularDataOffMessageFromDefaultOffer:", v15);
      else
        -[ICQInAppMessaging serverUnreachableMessageFromDefaultOffer:](self, "serverUnreachableMessageFromDefaultOffer:", v15);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_5;
  }
  if (!-[ICQInAppMessaging _termsNotAccepted](self, "_termsNotAccepted"))
  {
    v9 = (void *)v39[5];
    -[ICQInAppMessaging placement](self, "placement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageSpecificationForPlacement:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_msgSend((id)v39[5], "level");

      if (v12)
      {
        v13 = v39;
LABEL_22:
        -[ICQInAppMessaging quotaMessageForOffer:](self, "quotaMessageForOffer:", v13[5]);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
    }
    else
    {

    }
    v16 = (void *)v33[5];
    -[ICQInAppMessaging placement](self, "placement");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "messageSpecificationForPlacement:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = objc_msgSend((id)v33[5], "level");

      if (v19)
      {
        v13 = v33;
        goto LABEL_22;
      }
    }
    else
    {

    }
    v7 = 0;
    goto LABEL_6;
  }
  -[ICQInAppMessaging termsNotAcceptedMessageFromDefaultOffer:](self, "termsNotAcceptedMessageFromDefaultOffer:", v27[5]);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v7 = (void *)v6;
LABEL_6:
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v7;
}

void __54__ICQInAppMessaging__recalculateAndPostCurrentMessage__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_recalculateCurrentMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v2;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Last in-app message: %{public}@.\nNew in-app message: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "lastMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v5))
  {

  }
  else
  {
    if (v2)
    {

      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 32), "lastMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_12;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "hasNewObserver") & 1) != 0)
  {
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "_postMessage:", v2);
    goto LABEL_13;
  }
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v2;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "In-app messages skipping notification for message because there has been no change to message: %{public}@", (uint8_t *)&v8, 0xCu);
  }

LABEL_13:
  objc_msgSend(*(id *)(a1 + 32), "setLastMessage:", v2);

}

- (ICQInAppMessage)lastMessage
{
  return self->_lastMessage;
}

void __50__ICQInAppMessaging__startMonitoringNetworkStatus__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setICloudReachable:", *(unsigned __int8 *)(a1 + 40));
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "In-app message: iCloud Reachability changed to %@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __50__ICQInAppMessaging__startMonitoringNetworkStatus__block_invoke(uint64_t a1, nw_path_t path)
{
  BOOL v3;
  void *v4;
  _QWORD v6[5];
  BOOL v7;

  v3 = (nw_path_get_status(path) & 0xFFFFFFFD) == 1;
  objc_msgSend(*(id *)(a1 + 32), "unfairLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__ICQInAppMessaging__startMonitoringNetworkStatus__block_invoke_2;
  v6[3] = &unk_24E3F37A0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v4, "synchronized:", v6);

  return objc_msgSend(*(id *)(a1 + 32), "_recalculateAndPostCurrentMessage");
}

void __39__ICQInAppMessaging__fetchRegularOffer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "In-app messages received regular offer %{public}@", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "unfairLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __39__ICQInAppMessaging__fetchRegularOffer__block_invoke_66;
  v16 = &unk_24E3F5978;
  objc_copyWeak(&v18, (id *)(a1 + 32));
  v11 = v5;
  v17 = v11;
  objc_msgSend(v10, "synchronized:", &v13);

  v12 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v12, "_recalculateAndPostCurrentMessage", v13, v14, v15, v16);

  objc_destroyWeak(&v18);
}

void __39__ICQInAppMessaging__fetchPremiumOffer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "In-app messages received premium offer %{public}@", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "unfairLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __39__ICQInAppMessaging__fetchPremiumOffer__block_invoke_68;
  v16 = &unk_24E3F5978;
  objc_copyWeak(&v18, (id *)(a1 + 32));
  v11 = v5;
  v17 = v11;
  objc_msgSend(v10, "synchronized:", &v13);

  v12 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v12, "_recalculateAndPostCurrentMessage", v13, v14, v15, v16);

  objc_destroyWeak(&v18);
}

void __39__ICQInAppMessaging__fetchDefaultOffer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "In-app messages received default offer %{public}@", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "unfairLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __39__ICQInAppMessaging__fetchDefaultOffer__block_invoke_70;
  v16 = &unk_24E3F5978;
  objc_copyWeak(&v18, (id *)(a1 + 32));
  v11 = v5;
  v17 = v11;
  objc_msgSend(v10, "synchronized:", &v13);

  v12 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v12, "_recalculateAndPostCurrentMessage", v13, v14, v15, v16);

  objc_destroyWeak(&v18);
}

void __34__ICQInAppMessaging__postMessage___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __34__ICQInAppMessaging__postMessage___block_invoke_2;
    v3[3] = &unk_24E3F3610;
    v4 = v1;
    objc_msgSend(v4, "fetchIconIfNeededWithCompletion:", v3);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ICQCurrentInAppMessageChangedNotification"), 0, MEMORY[0x24BDBD1B8]);

  }
}

void __27__ICQInAppMessaging_shared__block_invoke()
{
  ICQInAppMessaging *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(ICQInAppMessaging);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.cloud.quota"));
  objc_msgSend((id)shared_shared, "setDefaults:", v2);

  objc_msgSend((id)shared_shared, "setICloudReachable:", 1);
  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)shared_shared, "setSharedOfferManager:", v3);

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)shared_shared, "setAccountStore:", v4);

}

- (ICQUnfairLock)unfairLock
{
  return self->_unfairLock;
}

- (ICQOfferManager)sharedOfferManager
{
  return self->_sharedOfferManager;
}

- (void)setSharedOfferManager:(id)a3
{
  objc_storeStrong((id *)&self->_sharedOfferManager, a3);
}

- (void)setRegularOffer:(id)a3
{
  objc_storeStrong((id *)&self->_regularOffer, a3);
}

- (void)setRadioPrefs:(id)a3
{
  objc_storeStrong((id *)&self->_radioPrefs, a3);
}

- (void)setPremiumOffer:(id)a3
{
  objc_storeStrong((id *)&self->_premiumOffer, a3);
}

- (void)setPlacement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setMockMessage:(id)a3
{
  objc_storeStrong((id *)&self->_mockMessage, a3);
}

- (void)setLastMessage:(id)a3
{
  objc_storeStrong((id *)&self->_lastMessage, a3);
}

- (void)setIsRegisteredForNotifications:(BOOL)a3
{
  self->_isRegisteredForNotifications = a3;
}

- (void)setICloudReachable:(BOOL)a3
{
  self->_iCloudReachable = a3;
}

- (void)setHasNewObserver:(BOOL)a3
{
  self->_hasNewObserver = a3;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void)setDefaultOffer:(id)a3
{
  objc_storeStrong((id *)&self->_defaultOffer, a3);
}

- (void)setConnectivityMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_connectivityMonitor, a3);
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (ICQOffer)regularOffer
{
  return self->_regularOffer;
}

- (RadiosPreferences)radioPrefs
{
  return self->_radioPrefs;
}

- (ICQPremiumOffer)premiumOffer
{
  return self->_premiumOffer;
}

- (NSString)placement
{
  return self->_placement;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  -[ICQInAppMessaging defaults](self, "defaults", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("debug-in-app-message"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v11, "isEqual:", v8);

  if (v9)
  {
    -[ICQInAppMessaging setMockMessage:](self, "setMockMessage:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging setMockMessage:](self, "setMockMessage:", v10);

    -[ICQInAppMessaging _recalculateAndPostCurrentMessage](self, "_recalculateAndPostCurrentMessage");
  }

}

- (void)observeUpdates
{
  id v3;

  -[ICQInAppMessaging bundleID](self, "bundleID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging _observeUpdatesForBundleID:](self, "_observeUpdatesForBundleID:", v3);

}

- (void)observeUpdatesForBundleID:(id)a3 placement:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Client requested in-app message updates in bundle %{public}@ with placement %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[ICQInAppMessaging bundleID](self, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
    -[ICQInAppMessaging setBundleID:](self, "setBundleID:", v6);
  -[ICQInAppMessaging setPlacement:](self, "setPlacement:", v7);
  -[ICQInAppMessaging setHasNewObserver:](self, "setHasNewObserver:", 1);
  if (!-[ICQInAppMessaging isRegisteredForNotifications](self, "isRegisteredForNotifications"))
  {
    -[ICQInAppMessaging setIsRegisteredForNotifications:](self, "setIsRegisteredForNotifications:", 1);
    -[ICQInAppMessaging _registerForNotifications](self, "_registerForNotifications");
  }
  -[ICQInAppMessaging _recalculateAndPostCurrentMessage](self, "_recalculateAndPostCurrentMessage");

}

- (ICQInAppMessage)mockMessage
{
  return self->_mockMessage;
}

- (BOOL)isRegisteredForNotifications
{
  return self->_isRegisteredForNotifications;
}

- (BOOL)isICloudReachable
{
  return self->_iCloudReachable;
}

- (ICQInAppMessaging)init
{
  ICQInAppMessaging *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *messageQueue;
  void *v6;
  uint64_t v7;
  NSString *bundleID;
  ICQUnfairLock *v9;
  ICQUnfairLock *unfairLock;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *connectivityQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *radiosPrefsQueue;
  NSObject *v17;
  _QWORD block[4];
  ICQInAppMessaging *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ICQInAppMessaging;
  v2 = -[ICQInAppMessaging init](&v21, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.icq.in-app-Message", v3);
    messageQueue = v2->_messageQueue;
    v2->_messageQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    bundleID = v2->_bundleID;
    v2->_bundleID = (NSString *)v7;

    objc_storeStrong((id *)&v2->_placement, CFSTR("InApp"));
    v9 = (ICQUnfairLock *)objc_alloc_init(MEMORY[0x24BEC7338]);
    unfairLock = v2->_unfairLock;
    v2->_unfairLock = v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.icloud.quota.in-app-messaging-connectivity", v11);
    connectivityQueue = v2->_connectivityQueue;
    v2->_connectivityQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.icloud.quota.in-app-messaging-radios-prefs", v14);
    radiosPrefsQueue = v2->_radiosPrefsQueue;
    v2->_radiosPrefsQueue = (OS_dispatch_queue *)v15;

    v17 = v2->_radiosPrefsQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __25__ICQInAppMessaging_init__block_invoke;
    block[3] = &unk_24E3F3610;
    v20 = v2;
    dispatch_sync(v17, block);

  }
  return v2;
}

- (BOOL)hasNewObserver
{
  return self->_hasNewObserver;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (ICQOffer)defaultOffer
{
  return self->_defaultOffer;
}

- (OS_nw_path_monitor)connectivityMonitor
{
  return self->_connectivityMonitor;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)_startMonitoringNetworkStatus
{
  nw_path_monitor_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD update_handler[5];

  v3 = nw_path_monitor_create();
  -[ICQInAppMessaging setConnectivityMonitor:](self, "setConnectivityMonitor:", v3);

  -[ICQInAppMessaging connectivityMonitor](self, "connectivityMonitor");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_set_queue(v4, (dispatch_queue_t)self->_connectivityQueue);

  -[ICQInAppMessaging connectivityMonitor](self, "connectivityMonitor");
  v5 = objc_claimAutoreleasedReturnValue();
  update_handler[0] = MEMORY[0x24BDAC760];
  update_handler[1] = 3221225472;
  update_handler[2] = __50__ICQInAppMessaging__startMonitoringNetworkStatus__block_invoke;
  update_handler[3] = &unk_24E3F5AD8;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v5, update_handler);

  -[ICQInAppMessaging connectivityMonitor](self, "connectivityMonitor");
  v6 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_start(v6);

}

- (void)_registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CoreTelephonyClient *v9;
  CoreTelephonyClient *ctClient;

  -[ICQInAppMessaging defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("debug-in-app-message"), 5, 0);

  -[ICQInAppMessaging _fetchInitialOfferStates](self, "_fetchInitialOfferStates");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__fetchRegularOffer, *MEMORY[0x24BEC7218], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__fetchPremiumOffer, *MEMORY[0x24BEC7220], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__fetchDefaultOffer, *MEMORY[0x24BEC7210], 0);

  v7 = *MEMORY[0x24BEBE008];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__recalculateAndPostCurrentMessage, v7, 0);

  -[ICQInAppMessaging _startMonitoringNetworkStatus](self, "_startMonitoringNetworkStatus");
  self->_cellularDataConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  v9 = (CoreTelephonyClient *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", self->_connectivityQueue);
  ctClient = self->_ctClient;
  self->_ctClient = v9;

  -[CoreTelephonyClient setDelegate:](self->_ctClient, "setDelegate:", self);
}

- (void)_recalculateAndPostCurrentMessage
{
  NSObject *messageQueue;
  _QWORD block[5];

  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__ICQInAppMessaging__recalculateAndPostCurrentMessage__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(messageQueue, block);
}

- (void)_postMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICQInAppMessaging setHasNewObserver:](self, "setHasNewObserver:", 0);
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "In-app messages posting notification for message: %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ICQInAppMessaging__postMessage___block_invoke;
  block[3] = &unk_24E3F3610;
  v9 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQAnalytics logInAppBannerImpressionWithAppIdentifier:](ICQAnalytics, "logInAppBannerImpressionWithAppIdentifier:", v7);

}

- (void)_observeUpdatesForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Client requested in-app message updates in bundle %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[ICQInAppMessaging observeUpdatesForBundleID:placement:](self, "observeUpdatesForBundleID:placement:", v4, CFSTR("InApp"));
}

- (void)_fetchRegularOffer
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[ICQInAppMessaging sharedOfferManager](self, "sharedOfferManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__ICQInAppMessaging__fetchRegularOffer__block_invoke;
  v5[3] = &unk_24E3F5B28;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "getOfferForBundleIdentifier:completion:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_fetchPremiumOffer
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[ICQInAppMessaging sharedOfferManager](self, "sharedOfferManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__ICQInAppMessaging__fetchPremiumOffer__block_invoke;
  v5[3] = &unk_24E3F5B50;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "getPremiumOfferForBundleIdentifier:completion:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_fetchInitialOfferStates
{
  -[ICQInAppMessaging _fetchRegularOffer](self, "_fetchRegularOffer");
  -[ICQInAppMessaging _fetchPremiumOffer](self, "_fetchPremiumOffer");
  -[ICQInAppMessaging _fetchDefaultOffer](self, "_fetchDefaultOffer");
}

- (void)_fetchDefaultOffer
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[ICQInAppMessaging sharedOfferManager](self, "sharedOfferManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__ICQInAppMessaging__fetchDefaultOffer__block_invoke;
  v4[3] = &unk_24E3F5B28;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "getDefaultOfferWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_23);
  return (id)shared_shared;
}

uint64_t __25__ICQInAppMessaging_init__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BE04788]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setDelegate:");
}

- (void)observeUpdatesForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Client requested in-app message updates in bundle %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[ICQInAppMessaging observeUpdatesForBundleID:placement:](self, "observeUpdatesForBundleID:placement:", v4, CFSTR("InApp"));
}

- (void)stopObservingUpdates
{
  void *v3;
  void *v4;
  NSObject *v5;

  if (-[ICQInAppMessaging isRegisteredForNotifications](self, "isRegisteredForNotifications"))
  {
    -[ICQInAppMessaging defaults](self, "defaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("debug-in-app-message"));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

    -[ICQInAppMessaging connectivityMonitor](self, "connectivityMonitor");
    v5 = objc_claimAutoreleasedReturnValue();
    nw_path_monitor_cancel(v5);

    -[ICQInAppMessaging setICloudReachable:](self, "setICloudReachable:", 1);
    -[ICQInAppMessaging setIsRegisteredForNotifications:](self, "setIsRegisteredForNotifications:", 0);
  }
}

- (void)fetchMessageWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQInAppMessaging bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Client requested single in-app message updates in bundle %{public}@", buf, 0xCu);

  }
  -[ICQInAppMessaging _recalculateCurrentMessage](self, "_recalculateCurrentMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQInAppMessaging bundleID](self, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Returning message: %@, to client: %@", buf, 0x16u);

  }
  if (v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__ICQInAppMessaging_fetchMessageWithCompletion___block_invoke;
    v10[3] = &unk_24E3F43C0;
    v12 = v4;
    v11 = v7;
    objc_msgSend(v11, "fetchIconIfNeededWithCompletion:", v10);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

uint64_t __48__ICQInAppMessaging_fetchMessageWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)fetchMessageForReason:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_msgSend(a4, "copy");
  -[ICQInAppMessaging fetchMessageForReason:pendingItemsCount:withCompletion:](self, "fetchMessageForReason:pendingItemsCount:withCompletion:", v6, 0, v7);

}

- (void)fetchMessageForReason:(id)a3 pendingItemsCount:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[9];
  _QWORD v32[3];
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__14;
  v50 = __Block_byref_object_dispose__14;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__14;
  v44 = __Block_byref_object_dispose__14;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__14;
  v38 = __Block_byref_object_dispose__14;
  v39 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  -[ICQInAppMessaging unfairLock](self, "unfairLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __76__ICQInAppMessaging_fetchMessageForReason_pendingItemsCount_withCompletion___block_invoke;
  v31[3] = &unk_24E3F5B00;
  v31[4] = self;
  v31[5] = &v46;
  v31[6] = &v40;
  v31[7] = &v34;
  v31[8] = v32;
  objc_msgSend(v11, "synchronized:", v31);

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("AirplaneModeOn")))
  {
    -[ICQInAppMessaging airplaneModeOnMessageFromDefaultOffer:](self, "airplaneModeOnMessageFromDefaultOffer:", v35[5]);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("WiFiConnectivityIssues")))
  {
    -[ICQInAppMessaging serverUnreachableMessageFromDefaultOffer:](self, "serverUnreachableMessageFromDefaultOffer:", v35[5]);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CellularDataOff")))
  {
    -[ICQInAppMessaging cellularDataOffMessageFromDefaultOffer:](self, "cellularDataOffMessageFromDefaultOffer:", v35[5]);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("TermsNotAccepted")))
  {
    -[ICQInAppMessaging termsNotAcceptedMessageFromDefaultOffer:](self, "termsNotAcceptedMessageFromDefaultOffer:", v35[5]);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("UploadFailure")))
  {
    -[ICQInAppMessaging uploadFailureMessageForPendingItemCount:defaultOffer:](self, "uploadFailureMessageForPendingItemCount:defaultOffer:", v9, v35[5]);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v14 = (void *)v47[5];
  -[ICQInAppMessaging placement](self, "placement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageSpecificationForPlacement:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_msgSend((id)v47[5], "level") == 0;

    if (!v17)
    {
      v18 = v47;
LABEL_18:
      -[ICQInAppMessaging quotaMessageForOffer:](self, "quotaMessageForOffer:", v18[5]);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_19:
      v23 = (void *)v13;
      if (v13)
      {
        _ICQGetLogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          -[ICQInAppMessaging bundleID](self, "bundleID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v53 = v23;
          v54 = 2112;
          v55 = v25;
          _os_log_impl(&dword_21F2CC000, v24, OS_LOG_TYPE_DEFAULT, "Returning in-app message: %@, to client: %@", buf, 0x16u);

        }
        v28[0] = v12;
        v28[1] = 3221225472;
        v28[2] = __76__ICQInAppMessaging_fetchMessageForReason_pendingItemsCount_withCompletion___block_invoke_62;
        v28[3] = &unk_24E3F43C0;
        v30 = v10;
        v26 = v23;
        v29 = v26;
        objc_msgSend(v26, "fetchIconIfNeededWithCompletion:", v28);

        goto LABEL_27;
      }
      goto LABEL_24;
    }
  }
  else
  {

  }
  v19 = (void *)v41[5];
  -[ICQInAppMessaging placement](self, "placement");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageSpecificationForPlacement:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {

    goto LABEL_24;
  }
  v22 = objc_msgSend((id)v41[5], "level") == 0;

  if (!v22)
  {
    v18 = v41;
    goto LABEL_18;
  }
LABEL_24:
  _ICQGetLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    -[ICQInAppMessaging fetchMessageForReason:pendingItemsCount:withCompletion:].cold.1((uint64_t)v8, v27);

  ICQCreateError();
  v26 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v26);
LABEL_27:

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

}

uint64_t __76__ICQInAppMessaging_fetchMessageForReason_pendingItemsCount_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "regularOffer");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "premiumOffer");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "defaultOffer");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  result = objc_msgSend(*(id *)(a1 + 32), "isICloudReachable");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t __76__ICQInAppMessaging_fetchMessageForReason_pendingItemsCount_withCompletion___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (BOOL)isAirplaneModeEnabled
{
  NSObject *radiosPrefsQueue;
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
  radiosPrefsQueue = self->_radiosPrefsQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__ICQInAppMessaging_isAirplaneModeEnabled__block_invoke;
  v5[3] = &unk_24E3F4348;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(radiosPrefsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__ICQInAppMessaging_isAirplaneModeEnabled__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "radioPrefs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "airplaneMode");

}

- (void)airplaneModeChanged
{
  NSObject *v3;
  _BOOL4 v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[ICQInAppMessaging isAirplaneModeEnabled](self, "isAirplaneModeEnabled");
    v5 = CFSTR("NO");
    if (v4)
      v5 = CFSTR("YES");
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "In-app message: Airplane mode changed to %@", (uint8_t *)&v6, 0xCu);
  }

  -[ICQInAppMessaging _recalculateAndPostCurrentMessage](self, "_recalculateAndPostCurrentMessage");
}

- (void)dataSettingsChanged:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICQInAppMessaging dataSettingsChanged:]";
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "In-app message: %s", (uint8_t *)&v5, 0xCu);
  }

  -[ICQInAppMessaging _recalculateAndPostCurrentMessage](self, "_recalculateAndPostCurrentMessage");
}

void __39__ICQInAppMessaging__fetchRegularOffer__block_invoke_66(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setRegularOffer:", v1);

}

void __39__ICQInAppMessaging__fetchPremiumOffer__block_invoke_68(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setPremiumOffer:", v1);

}

void __39__ICQInAppMessaging__fetchDefaultOffer__block_invoke_70(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDefaultOffer:", v1);

}

- (unint64_t)_contentTypeForQuotaOffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v11;
  char v12;

  v4 = a3;
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.iCloudDriveApp")) & 1) != 0)
    goto LABEL_6;
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.finder")) & 1) != 0)
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
  {

    goto LABEL_5;
  }
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.appkit.xpc.openAndSavePanelService"));

  if ((v12 & 1) == 0)
  {
    v8 = -[ICQInAppMessaging _contentTypeForMessageWithOffer:](self, "_contentTypeForMessageWithOffer:", v4);
    goto LABEL_8;
  }
LABEL_7:
  v8 = -[ICQInAppMessaging _contentTypeForDriveWithOffer:](self, "_contentTypeForDriveWithOffer:", v4);
LABEL_8:
  v9 = v8;

  return v9;
}

- (unint64_t)_contentTypeForMessageWithOffer:(id)a3
{
  return objc_msgSend(a3, "level") == 3;
}

- (unint64_t)_contentTypeForDriveWithOffer:(id)a3
{
  if (objc_msgSend(a3, "level") == 3)
    return 3;
  else
    return 2;
}

- (id)_symbolNameForQuotaOffer:(id)a3
{
  objc_msgSend(a3, "level");
  return CFSTR("exclamationmark.triangle");
}

- (id)_actionsForBannerSpecification:(id)a3 offer:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ICQLinkInAppAction *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "links", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = -[ICQLinkInAppAction initWithLink:inOffer:]([ICQLinkInAppAction alloc], "initWithLink:inOffer:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v6);
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_dismissActionForBannerSpecification:(id)a3 offer:(id)a4
{
  id v5;
  id v6;
  ICQLinkInAppAction *v7;
  ICQLinkInAppAction *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "dismissLink");
  v7 = (ICQLinkInAppAction *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [ICQLinkInAppAction alloc];
    objc_msgSend(v5, "dismissLink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICQLinkInAppAction initWithLink:inOffer:](v8, "initWithLink:inOffer:", v9, v6);

  }
  return v7;
}

- (id)quotaMessageForOffer:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICQInAppMessage *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  ICQInAppMessage *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "isPremiumOffer");
    v7 = CFSTR("regular");
    if (v6)
      v7 = CFSTR("premium");
    *(_DWORD *)buf = 138543362;
    v29 = v7;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "In-app messages sending %{public}@ offer message", buf, 0xCu);
  }

  objc_msgSend(v4, "deviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging placement](self, "placement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageSpecificationForPlacement:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v8;
  objc_msgSend(v8, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleWithKey:", v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageWithKey:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQInAppMessaging _actionsForBannerSpecification:offer:](self, "_actionsForBannerSpecification:offer:", v10, v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging _dismissActionForBannerSpecification:offer:](self, "_dismissActionForBannerSpecification:offer:", v10, v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reason");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[ICQInAppMessaging _contentTypeForQuotaOffer:](self, "_contentTypeForQuotaOffer:", v4);
  v13 = [ICQInAppMessage alloc];
  objc_msgSend(v4, "offerId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging _symbolNameForQuotaOffer:](self, "_symbolNameForQuotaOffer:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging _accountIdentifier](self, "_accountIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconSpecification");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:](v13, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:", v21, v14, v24, v26, v25, v15, v16, v17, v23, v20, v18);

  return v22;
}

- (id)airplaneModeOnMessageFromDefaultOffer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  ICQInAppMessage *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ICQInAppMessage *v19;
  void *v20;
  void *v21;
  ICQInAppMessage *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  ICQLinkInAppAction *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  ICQInAppMessage *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[16];
  ICQLinkInAppAction *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "In-app messages sending airplane mode message", buf, 2u);
  }

  objc_msgSend(v4, "deviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging placement](self, "placement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageSpecificationForReason:bundleId:placement:", CFSTR("AirplaneModeOn"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleWithKey:", v10);
    v39 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageWithKey:", v11);
    v37 = objc_claimAutoreleasedReturnValue();

    -[ICQInAppMessaging _actionsForBannerSpecification:offer:](self, "_actionsForBannerSpecification:offer:", v9, v4);
    v12 = objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging _dismissActionForBannerSpecification:offer:](self, "_dismissActionForBannerSpecification:offer:", v9, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [ICQInAppMessage alloc];
    -[ICQInAppMessaging _accountIdentifier](self, "_accountIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging bundleID](self, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconSpecification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)v12;
    v34 = v12;
    v18 = v6;
    v19 = v14;
    v21 = (void *)v37;
    v20 = (void *)v39;
    v22 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:](v19, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:", 0, CFSTR("AirplaneMode"), CFSTR("AirplaneModeOn"), v39, v37, 0, v15, v16, v34, v13, v17);
  }
  else
  {
    v36 = v6;
    v38 = v4;
    _ICQGetLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v23, OS_LOG_TYPE_DEFAULT, "No message content found for Airplane Mode On, using default message", buf, 2u);
    }

    v24 = (void *)MEMORY[0x24BEC72E0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_MODE_ON_BUTTON_TITLE"), &stru_24E400750);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *MEMORY[0x24BEC71E8];
    v45[0] = *MEMORY[0x24BEC7238];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "linkWithText:options:action:parameters:", v26, 0, 6, v27);
    v40 = objc_claimAutoreleasedReturnValue();

    v28 = -[ICQLinkInAppAction initWithLink:]([ICQLinkInAppAction alloc], "initWithLink:", v40);
    v35 = [ICQInAppMessage alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_MODE_ON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_MODE_ON_SUBTITLE"), &stru_24E400750, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging _accountIdentifier](self, "_accountIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging bundleID](self, "bundleID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "iconSpecification");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)v29;
    v22 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:](v35, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:", 0, CFSTR("AirplaneMode"), CFSTR("AirplaneModeOn"), v29, v16, 0, v17, v30, v31, v32);

    v21 = v28;
    v4 = v38;
    v20 = (void *)v40;
    v9 = 0;
    v18 = v36;
  }

  return v22;
}

- (id)serverUnreachableMessageFromDefaultOffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ICQInAppMessage *v14;
  void *v15;
  void *v16;
  void *v17;
  ICQInAppMessage *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  ICQInAppMessage *v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "deviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging placement](self, "placement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageSpecificationForReason:bundleId:placement:", CFSTR("WiFiConnectivityIssues"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v5;
  if (v8)
  {
    objc_msgSend(v5, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleWithKey:", v9);
    v24 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageWithKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQInAppMessaging _actionsForBannerSpecification:offer:](self, "_actionsForBannerSpecification:offer:", v8, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging _dismissActionForBannerSpecification:offer:](self, "_dismissActionForBannerSpecification:offer:", v8, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [ICQInAppMessage alloc];
    -[ICQInAppMessaging _accountIdentifier](self, "_accountIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging bundleID](self, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconSpecification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v14;
    v19 = (void *)v24;
    v20 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:](v18, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:", 4, CFSTR("ServerUnreeachable"), CFSTR("WiFiConnectivityIssues"), v24, v11, 0, v15, v16, v12, v13, v17);
  }
  else
  {
    v25 = [ICQInAppMessage alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SERVER_UNREACHABLE_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SERVER_UNREACHABLE_SUBTITLE"), &stru_24E400750, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging _accountIdentifier](self, "_accountIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging bundleID](self, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "iconSpecification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:](v25, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:", 4, CFSTR("ServerUnreeachable"), CFSTR("WiFiConnectivityIssues"), v11, v13, 0, v15, v16, MEMORY[0x24BDBD1A8], v17);
  }
  v22 = (void *)v20;

  return v22;
}

- (id)cellularDataOffMessageFromDefaultOffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ICQInAppMessage *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ICQInAppMessage *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  ICQLinkInAppAction *v34;
  ICQInAppMessage *v35;
  void *v36;
  void *v37;
  void *v38;
  ICQLinkInAppAction *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "deviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging placement](self, "placement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageSpecificationForReason:bundleId:placement:", CFSTR("CellularDataOff"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v5;
  v38 = v4;
  if (v8)
  {
    objc_msgSend(v5, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleWithKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageWithKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQInAppMessaging _actionsForBannerSpecification:offer:](self, "_actionsForBannerSpecification:offer:", v8, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging _dismissActionForBannerSpecification:offer:](self, "_dismissActionForBannerSpecification:offer:", v8, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [ICQInAppMessage alloc];
    -[ICQInAppMessaging _accountIdentifier](self, "_accountIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging bundleID](self, "bundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconSpecification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)v10;
    v20 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:](v15, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:", 0, CFSTR("CellularDataOff"), CFSTR("CellularDataOff"), v10, v12, 0, v16, v17, v13, v14, v18);

  }
  else
  {
    v21 = (void *)MEMORY[0x24BEC72E0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CELLULAR_OFF_BUTTON_TITLE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *MEMORY[0x24BEC71E8];
    v41[0] = *MEMORY[0x24BEC71F8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "linkWithText:options:action:parameters:", v23, 0, 6, v24);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = -[ICQLinkInAppAction initWithLink:]([ICQLinkInAppAction alloc], "initWithLink:", v36);
    v35 = [ICQInAppMessage alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CELLULAR_OFF_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CELLULAR_OFF_SUBTITLE"), &stru_24E400750, CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging _accountIdentifier](self, "_accountIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging bundleID](self, "bundleID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "iconSpecification");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:](v35, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:", 0, CFSTR("CellularDataOff"), CFSTR("CellularDataOff"), v26, v28, 0, v29, v30, v31, v32);

  }
  return v20;
}

- (id)termsNotAcceptedMessageFromDefaultOffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ICQInAppMessage *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ICQInAppMessage *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ICQLinkInAppAction *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  ICQLinkInAppAction *v33;
  void *v34;
  void *v35;
  ICQInAppMessage *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint8_t buf[16];
  ICQLinkInAppAction *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "deviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging placement](self, "placement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageSpecificationForReason:bundleId:placement:", CFSTR("TermsNotAccepted"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v5;
  if (v8)
  {
    objc_msgSend(v5, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleWithKey:", v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageWithKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQInAppMessaging _actionsForBannerSpecification:offer:](self, "_actionsForBannerSpecification:offer:", v8, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging _dismissActionForBannerSpecification:offer:](self, "_dismissActionForBannerSpecification:offer:", v8, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [ICQInAppMessage alloc];
    -[ICQInAppMessaging _accountIdentifier](self, "_accountIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging bundleID](self, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconSpecification");
    v17 = v4;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:](v14, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:", 1, CFSTR("TermsNotAccepted"), CFSTR("TermsNotAccepted"), v39, v11, 0, v15, v16, v12, v13, v18);

    v20 = v41;
  }
  else
  {
    v40 = v4;
    _ICQGetLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v21, OS_LOG_TYPE_DEFAULT, "No message content found for Terms not Accepted, using default message", buf, 2u);
    }

    v22 = (void *)MEMORY[0x24BEC72E0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("TERMS_NOT_ACCEPTED_BUTTON_TITLE"), &stru_24E400750);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *MEMORY[0x24BEC71E8];
    v45[0] = CFSTR("https://setup.icloud.com/email/prefs/storage?root=APPLE_ACCOUNT");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "linkWithText:options:action:parameters:", v24, 0, 6, v25);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = -[ICQLinkInAppAction initWithLink:]([ICQLinkInAppAction alloc], "initWithLink:", v38);
    v37 = [ICQInAppMessage alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("TERMS_NOT_ACCEPTED_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("TERMS_NOT_ACCEPTED_SUBTITLE"), &stru_24E400750, CFSTR("Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging _accountIdentifier](self, "_accountIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging bundleID](self, "bundleID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v26;
    v33 = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "iconSpecification");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:](v37, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:", 1, CFSTR("TermsNotAccepted"), CFSTR("TermsNotAccepted"), v28, v30, 0, v31, v32, v34, v35);

    v17 = v40;
    v20 = v41;
    v8 = 0;
  }

  return v19;
}

- (id)uploadFailureMessageForPendingItemCount:(id)a3 defaultOffer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  ICQInAppMessage *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ICQInAppMessage *v23;
  ICQInAppMessage *v24;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BEC7340], "templateKeyForItemCount:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging bundleID](self, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessaging placement](self, "placement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageSpecificationForReason:bundleId:placement:", CFSTR("UploadFailure"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BEC7340], "wordsToReplaceForItemCount:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BEC7350];
    objc_msgSend(v11, "titleWithKey:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v12;
    objc_msgSend(v13, "replaceWordsIn:with:", v14, v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BEC7350];
    objc_msgSend(v11, "messageWithKey:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "replaceWordsIn:with:", v16, v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQInAppMessaging _actionsForBannerSpecification:offer:](self, "_actionsForBannerSpecification:offer:", v11, v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging _dismissActionForBannerSpecification:offer:](self, "_dismissActionForBannerSpecification:offer:", v11, v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v7;
    v17 = v6;
    v18 = [ICQInAppMessage alloc];
    -[ICQInAppMessaging _accountIdentifier](self, "_accountIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInAppMessaging bundleID](self, "bundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconSpecification");
    v21 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v18;
    v6 = v17;
    v7 = v29;
    v24 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:](v23, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:", 1, CFSTR("UploadFailure"), CFSTR("UploadFailure"), v30, v28, 0, v19, v20, v27, v26, v22);

    v8 = v21;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __34__ICQInAppMessaging__postMessage___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("ICQInAppMessage");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ICQCurrentInAppMessageChangedNotification"), 0, v4);

}

- (id)_accountIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[ICQInAppMessaging accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_isCellularDataOff
{
  uint64_t CellularDataSettings;
  NSObject *v3;
  char v5;
  char v6;

  v6 = 1;
  v5 = 1;
  CellularDataSettings = _CTServerConnectionGetCellularDataSettings();
  if ((_DWORD)CellularDataSettings)
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[ICQInAppMessaging _isCellularDataOff].cold.2(CellularDataSettings, SHIDWORD(CellularDataSettings), v3);

  }
  return v5 == 0;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setUnfairLock:(id)a3
{
  objc_storeStrong((id *)&self->_unfairLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_unfairLock, 0);
  objc_storeStrong((id *)&self->_lastMessage, 0);
  objc_storeStrong((id *)&self->_connectivityMonitor, 0);
  objc_storeStrong((id *)&self->_mockMessage, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_defaultOffer, 0);
  objc_storeStrong((id *)&self->_premiumOffer, 0);
  objc_storeStrong((id *)&self->_regularOffer, 0);
  objc_storeStrong((id *)&self->_sharedOfferManager, 0);
  objc_storeStrong((id *)&self->_radioPrefs, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_radiosPrefsQueue, 0);
  objc_storeStrong((id *)&self->_connectivityQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
}

- (void)fetchMessageForReason:(uint64_t)a1 pendingItemsCount:(NSObject *)a2 withCompletion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Unable to find in-app message for reason %@", (uint8_t *)&v2, 0xCu);
}

- (void)_isCellularDataOff
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "Error retrieving state for cellular data switch. Domain: %d, error: %d", (uint8_t *)v3, 0xEu);
}

@end
