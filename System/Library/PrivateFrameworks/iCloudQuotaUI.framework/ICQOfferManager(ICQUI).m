@implementation ICQOfferManager(ICQUI)

- (void)fetchAndPresentUpsellForBundleIdentifier:()ICQUI event:completion:
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  void *v29;
  id v30;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ICQOfferManager(ICQUI) fetchAndPresentUpsellForBundleIdentifier:event:completion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  v19 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleForKey:", CFSTR("lastiCloudAppLaunchCheck"));
  v21 = (void *)objc_msgSend(v19, "initWithTimeIntervalSince1970:");

  objc_msgSend(v21, "timeIntervalSinceNow");
  if (v22 <= -172800.0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSince1970");
    objc_msgSend(v24, "setDouble:forKey:", CFSTR("lastiCloudAppLaunchCheck"));

    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke;
    v26[3] = &unk_24E3F52C8;
    v27 = v9;
    v28 = v8;
    v29 = a1;
    v30 = v10;
    objc_msgSend(a1, "getOfferForBundleIdentifier:completion:", v28, v26);

  }
  else
  {
    _ICQGetLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v23, OS_LOG_TYPE_DEFAULT, "Last app launch link check was <48h ago, skipping check", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (id)flowManager
{
  return objc_getAssociatedObject(a1, &ICQUIUpsellTriggerEventFlowManagerKey);
}

- (void)setFlowManager:()ICQUI
{
  objc_setAssociatedObject(a1, &ICQUIUpsellTriggerEventFlowManagerKey, a3, (void *)1);
}

- (void)upgradeFlowManagerDidCancel:()ICQUI
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "flowManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == v4)
  {
    if (v7)
    {
      v13 = 138543362;
      v14 = (id)objc_opt_class();
      v11 = v14;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did cancel", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(a1, "flowManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", 0);

    objc_msgSend(a1, "setFlowManager:", 0);
  }
  else
  {
    if (v7)
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      objc_msgSend(a1, "flowManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did cancel for manager %@ instead of %@", (uint8_t *)&v13, 0x20u);

    }
  }

}

- (void)upgradeFlowManagerDidComplete:()ICQUI
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "flowManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == v4)
  {
    if (v7)
    {
      v12 = 138543362;
      v13 = (id)objc_opt_class();
      v11 = v13;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did complete", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(a1, "setFlowManager:", 0);
  }
  else
  {
    if (v7)
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      objc_msgSend(a1, "flowManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did complete for manager %@ instead of %@", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)_getCachedLinkData:()ICQUI completion:
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  v6 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v7 = (void *)getINDaemonConnectionClass_softClass_4;
  v14 = getINDaemonConnectionClass_softClass_4;
  if (!getINDaemonConnectionClass_softClass_4)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getINDaemonConnectionClass_block_invoke_4;
    v10[3] = &unk_24E3F3868;
    v10[4] = &v11;
    __getINDaemonConnectionClass_block_invoke_4((uint64_t)v10);
    v7 = (void *)v12[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v11, 8);
  v9 = objc_alloc_init(v8);
  objc_msgSend(v9, "getCacheDataForLink:completion:", v5, v6);

}

- (void)fetchAndPresentUpsellForBundleIdentifier:()ICQUI event:completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21F2CC000, a1, a3, "Checking for app launch link to present", a5, a6, a7, a8, 0);
}

@end
