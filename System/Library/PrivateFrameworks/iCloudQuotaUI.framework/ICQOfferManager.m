@implementation ICQOfferManager

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  unsigned int (*v10)(void);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void (*v14)(void);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  int8x16_t v22;
  _QWORD v23[4];
  id v24;
  int8x16_t v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v12;
      v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "Failed to load offer for event: %@, error: %@", buf, 0x16u);

    }
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_14;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.cloud.quota"));
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("debug-trigger-event"));

  if (!v8)
  {
    v15 = *(void **)(a1 + 48);
    objc_msgSend(v5, "appLaunchLink");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v15, "shouldPresentAppLaunchLink:", v16);

    if ((_DWORD)v15)
    {
      v17 = *(void **)(a1 + 48);
      objc_msgSend(v5, "appLaunchLink");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "link");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3;
      v23[3] = &unk_24E3F52A0;
      v27 = *(id *)(a1 + 56);
      v24 = v5;
      v22 = *(int8x16_t *)(a1 + 40);
      v20 = (id)v22.i64[0];
      v25 = vextq_s8(v22, v22, 8uLL);
      v26 = *(id *)(a1 + 32);
      objc_msgSend(v17, "_getCachedLinkData:completion:", v19, v23);

      goto LABEL_17;
    }
    _ICQGetLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_cold_1(a1, v21);

    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_14:
    v14();
    goto LABEL_17;
  }
  objc_msgSend(v5, "messageSpecificationForReason:bundleId:placement:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("InApp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  if (v9)
  {
    if (v10())
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_2;
      block[3] = &unk_24E3F4098;
      block[4] = *(_QWORD *)(a1 + 48);
      v29 = v5;
      v30 = v9;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }
  else
  {
    v10();
  }

LABEL_17:
}

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_2(uint64_t a1)
{
  ICQUpgradeFlowManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = -[ICQUpgradeFlowManager initWithOffer:]([ICQUpgradeFlowManager alloc], "initWithOffer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setFlowManager:", v2);

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "flowManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v3);

  objc_msgSend(*(id *)(a1 + 32), "flowManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "links");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginRemoteUpgradeFlowWithICQLink:", v6);

}

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;

  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 64) + 16))())
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_32;
    v16[3] = &unk_24E3F51A0;
    v17 = *(id *)(a1 + 32);
    v12 = v3;
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(a1 + 48);
    v18 = v12;
    v19 = v13;
    v20 = v14;
    dispatch_async(MEMORY[0x24BDAC9B8], v16);

    v15 = v17;
  }
  else
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3_cold_1(a1, v15);
  }

}

uint64_t __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ICQUpgradeFlowManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "appLaunchLink");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "link");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40) != 0;
    v16 = 138412546;
    v17 = v4;
    v18 = 1024;
    v19 = v5;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Presenting app launch link %@, has prefetched data %d", (uint8_t *)&v16, 0x12u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "appLaunchLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "link");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setServerUIContent:", v6);

  v9 = -[ICQUpgradeFlowManager initWithOffer:]([ICQUpgradeFlowManager alloc], "initWithOffer:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "setFlowManager:", v9);

  v10 = *(void **)(a1 + 48);
  objc_msgSend(v10, "flowManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", v10);

  objc_msgSend(*(id *)(a1 + 48), "flowManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appLaunchLink");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "link");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "beginRemoteUpgradeFlowWithICQLink:", v14);

  return objc_msgSend(*(id *)(a1 + 48), "appLaunchLinkDidPresentForBundleIdentifier:", *(_QWORD *)(a1 + 56));
}

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_DEBUG, "No AppLaunchLink found for bundle %@", (uint8_t *)&v3, 0xCu);
}

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Presenting app launch link for bundle %@, event %@, was cancelled by calling app", (uint8_t *)&v4, 0x16u);
}

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21F2CC000, a1, a3, "Found offer with app launch link", a5, a6, a7, a8, 0);
}

@end
