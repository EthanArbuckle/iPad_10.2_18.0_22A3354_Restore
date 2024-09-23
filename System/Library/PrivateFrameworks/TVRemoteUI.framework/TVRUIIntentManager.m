@implementation TVRUIIntentManager

+ (void)donateIntentsForDeviceWithID:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  NSObject *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _TVRUIIntentManagerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "+[TVRUIIntentManager donateIntentsForDeviceWithID:name:]";
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    dispatch_get_global_queue(17, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__TVRUIIntentManager_donateIntentsForDeviceWithID_name___block_invoke;
    block[3] = &unk_24DE2CEA8;
    v12 = v6;
    v13 = v7;
    v14 = a1;
    dispatch_async(v9, block);

    v10 = v12;
  }
  else
  {
    _TVRUIIntentManagerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[TVRUIIntentManager donateIntentsForDeviceWithID:name:].cold.1((uint64_t)v6, (uint64_t)v7, v10);
  }

}

void __56__TVRUIIntentManager_donateIntentsForDeviceWithID_name___block_invoke(uint64_t a1)
{
  WakeAppleTVIntent *v2;
  LaunchRemoteIntent *v3;
  LaunchTVAppIntent *v4;
  TVRDevice *v5;

  v5 = -[TVRDevice initWithIdentifier:displayString:pronunciationHint:]([TVRDevice alloc], "initWithIdentifier:displayString:pronunciationHint:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));
  v2 = objc_alloc_init(WakeAppleTVIntent);
  -[WakeAppleTVIntent setDevice:](v2, "setDevice:", v5);
  objc_msgSend(*(id *)(a1 + 48), "_donateInteractionforIntent:launchID:", v2, CFSTR("com.apple.TVRemoteUIService"));
  v3 = objc_alloc_init(LaunchRemoteIntent);
  -[LaunchRemoteIntent setDevice:](v3, "setDevice:", v5);
  objc_msgSend(*(id *)(a1 + 48), "_donateInteractionforIntent:launchID:", v3, CFSTR("com.apple.TVRemoteUIService"));
  v4 = objc_alloc_init(LaunchTVAppIntent);
  -[LaunchTVAppIntent setDevice:](v4, "setDevice:", v5);
  objc_msgSend(*(id *)(a1 + 48), "_donateInteractionforIntent:launchID:", v4, CFSTR("com.apple.TVRemoteUIService"));

}

+ (void)_donateInteractionforIntent:(id)a3 launchID:(id)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "_setLaunchId:", CFSTR("com.apple.TVRemoteUIService"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9DF0]), "initWithIntent:response:", v4, 0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__TVRUIIntentManager__donateInteractionforIntent_launchID___block_invoke;
  v8[3] = &unk_24DE2CED0;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "donateInteractionWithCompletion:", v8);

}

void __59__TVRUIIntentManager__donateInteractionforIntent_launchID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _TVRUIIntentManagerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__TVRUIIntentManager__donateInteractionforIntent_launchID___block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Successfully donated intent=%{public}@, interaction=%{public}@, ", (uint8_t *)&v8, 0x16u);
  }

}

+ (void)donateIntentsForDeviceWithID:(os_log_t)log name:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21B042000, log, OS_LOG_TYPE_ERROR, "Cannot donate intents due to deviceID or name being invalid. deviceID - %@. Name - %@", (uint8_t *)&v3, 0x16u);
}

void __59__TVRUIIntentManager__donateInteractionforIntent_launchID___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_21B042000, log, OS_LOG_TYPE_ERROR, "Error donating intent=%{public}@, interaction=%{public}@, error=%{public}@", (uint8_t *)&v5, 0x20u);
}

@end
