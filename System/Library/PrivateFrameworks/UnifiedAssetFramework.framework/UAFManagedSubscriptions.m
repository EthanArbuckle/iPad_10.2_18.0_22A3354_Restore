@implementation UAFManagedSubscriptions

+ (id)getConcurrentQueue
{
  if (qword_2540B1DB0 != -1)
    dispatch_once(&qword_2540B1DB0, &__block_literal_global_15);
  return (id)qword_2540B1DB8;
}

void __45__UAFManagedSubscriptions_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFManagedSubscriptions.Concurrent", MEMORY[0x24BDAC9C0]);
  v1 = (void *)qword_2540B1DB8;
  qword_2540B1DB8 = (uint64_t)v0;

}

+ (id)getExistingSubscription:(id)a3 subscriber:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[UAFAssetSetManager sharedManager](UAFAssetSetManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscriptionsForSubscriber:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "name", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v5);

        if ((v15 & 1) != 0)
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

+ (id)validateUsageAlias:(id)a3 usageAliasValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getUsageAlias:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && (objc_msgSend(v8, "values"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "objectForKeyedSubscript:", v6),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      v14 = v5;
      v15 = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextSubscription);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "+[UAFManagedSubscriptions validateUsageAlias:usageAliasValue:]";
        v18 = 2114;
        v19 = v6;
        v20 = 2114;
        v21 = v5;
        _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, "%s Usage Alias Value %{public}@ for Usage Alias %{public}@ does not exist, treating value as nil", buf, 0x20u);
      }

      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)createHoldSubscription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UAFAssetSetSubscription *v7;
  void *v8;
  void *v9;
  UAFAssetSetSubscription *v10;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".hold"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 172800.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [UAFAssetSetSubscription alloc];
  objc_msgSend(v3, "assetSets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usageAliases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UAFAssetSetSubscription initWithName:assetSets:usageAliases:expires:](v7, "initWithName:assetSets:usageAliases:expires:", v5, v8, v9, v6);
  return v10;
}

+ (void)manageSubscription:(id)a3 subscriber:(id)a4 assetSets:(id)a5 usageAliases:(id)a6 useHold:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  UAFAssetSetSubscription *v23;
  _BOOL4 v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  _QWORD v35[2];
  UAFAssetSetSubscription *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  UAFAssetSetSubscription *v44;
  __int16 v45;
  void *v46;
  id v47;
  _QWORD v48[2];

  v7 = a7;
  v48[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = (unint64_t)a5;
  v14 = (unint64_t)a6;
  +[UAFManagedSubscriptions getExistingSubscription:subscriber:](UAFManagedSubscriptions, "getExistingSubscription:subscriber:", v11, v12);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v13 | v14)
  {
    v23 = -[UAFAssetSetSubscription initWithName:assetSets:usageAliases:]([UAFAssetSetSubscription alloc], "initWithName:assetSets:usageAliases:", v11, v13, v14);
    v24 = -[UAFAssetSetSubscription isEqual:](v23, "isEqual:", v16);
    UAFGetLogCategory((id *)&UAFLogContextSubscription);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v26)
      {
        -[UAFAssetSetSubscription name](v23, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v38 = "+[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:]";
        v39 = 2114;
        v40 = v27;
        v41 = 2114;
        v42 = v12;
        _os_log_impl(&dword_229282000, v25, OS_LOG_TYPE_DEFAULT, "%s Not updating subscription %{public}@ for subscriber %{public}@ as it is up to date", buf, 0x20u);

      }
    }
    else
    {
      if (v26)
      {
        -[UAFAssetSetSubscription name](v23, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v38 = "+[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:]";
        v39 = 2114;
        v40 = v28;
        v41 = 2114;
        v42 = v12;
        v43 = 2114;
        v44 = v23;
        v45 = 2114;
        v46 = v16;
        _os_log_impl(&dword_229282000, v25, OS_LOG_TYPE_DEFAULT, "%s Updating subscription %{public}@ for subscriber %{public}@ as it is not up to date: %{public}@ != %{public}@", buf, 0x34u);

      }
      +[UAFManagedSubscriptions createHoldSubscription:](UAFManagedSubscriptions, "createHoldSubscription:", v16);
      v25 = objc_claimAutoreleasedReturnValue();
      v36 = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 && v25)
      {
        v35[0] = v23;
        v35[1] = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
        v30 = objc_claimAutoreleasedReturnValue();

        v29 = (void *)v30;
      }
      +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager", v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:](UAFAssetSetManager, "subscribe:subscriptions:storeManager:configurationManager:", v12, v29, v31, v32);

      v13 = v34;
    }
    goto LABEL_19;
  }
  if (v15)
  {
    if (v7)
    {
      +[UAFManagedSubscriptions createHoldSubscription:](UAFManagedSubscriptions, "createHoldSubscription:", v15);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
      {
        v48[0] = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 1);
        v19 = objc_claimAutoreleasedReturnValue();
        +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
        v21 = v13;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:](UAFAssetSetManager, "subscribe:subscriptions:storeManager:configurationManager:", v12, v19, v20, v22);

        v13 = v21;
      }
      else
      {
        UAFGetLogCategory((id *)&UAFLogContextSubscription);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v38 = "+[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:]";
          _os_log_impl(&dword_229282000, v19, OS_LOG_TYPE_DEFAULT, "%s Not creating hold subscription, as hold sub unexpectedly nil", buf, 0xCu);
        }
      }

    }
    v47 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
    v23 = (UAFAssetSetSubscription *)objc_claimAutoreleasedReturnValue();
    +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
    v25 = objc_claimAutoreleasedReturnValue();
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:](UAFAssetSetManager, "unsubscribe:subscriptions:storeManager:configurationManager:", v12, v23, v25, v33);

LABEL_19:
  }

}

+ (id)morphunUsagesForLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3
    && (objc_msgSend(getMorphunAssetsClass(), "isLocaleEmbedded:", v3) & 1) == 0
    && objc_msgSend(getMorphunAssetsClass(), "isLocaleDownloadSupported:", v3))
  {
    objc_msgSend(getMorphunAssetsClass(), "getFactorNameForLocale:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.siri.nl.morphun.")))
    {
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.siri.nl.morphun."), "length"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v5;
      v11 = CFSTR("com.apple.siri.understanding");
      v9 = CFSTR("morphun.language");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)manageAssistantSubscription:(id)a3 withMode:(int64_t)a4
{
  const __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if ((unint64_t)a4 > 3)
    v4 = CFSTR("com.apple.siri.assistant.language");
  else
    v4 = off_24F1F8588[a4];
  v5 = (void *)MEMORY[0x24BDBCEA0];
  v6 = a3;
  objc_msgSend(v5, "localeWithLocaleIdentifier:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[UAFManagedSubscriptions morphunUsagesForLocale:](UAFManagedSubscriptions, "morphunUsagesForLocale:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFManagedSubscriptions validateUsageAlias:usageAliasValue:](UAFManagedSubscriptions, "validateUsageAlias:usageAliasValue:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:](UAFManagedSubscriptions, "manageSubscription:subscriber:assetSets:usageAliases:useHold:", CFSTR("language"), CFSTR("com.apple.siri.assistant"), v7, v8, 1);
}

+ (void)manageNLSystemLanguageSubscription:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCEA0];
  v4 = a3;
  objc_msgSend(v3, "localeWithLocaleIdentifier:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[UAFManagedSubscriptions morphunUsagesForLocale:](UAFManagedSubscriptions, "morphunUsagesForLocale:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFManagedSubscriptions validateUsageAlias:usageAliasValue:](UAFManagedSubscriptions, "validateUsageAlias:usageAliasValue:", CFSTR("com.apple.siri.nl.system.language"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {

    v5 = 0;
  }
  +[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:](UAFManagedSubscriptions, "manageSubscription:subscriber:assetSets:usageAliases:useHold:", CFSTR("system.language"), CFSTR("com.apple.siri.nl"), v5, v6, 1);

}

+ (void)manageMorphunSystemLocaleSubscription:(id)a3
{
  id v3;

  +[UAFManagedSubscriptions morphunUsagesForLocale:](UAFManagedSubscriptions, "morphunUsagesForLocale:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:](UAFManagedSubscriptions, "manageSubscription:subscriber:assetSets:usageAliases:useHold:", CFSTR("system.locale"), CFSTR("com.apple.siri.morphun"), v3, 0, 1);

}

+ (void)managePlatformSubscription
{
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("com.apple.siri.uaf.platform");
  v4[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:](UAFManagedSubscriptions, "manageSubscription:subscriber:assetSets:usageAliases:useHold:", CFSTR("platform"), CFSTR("com.apple.siri.uaf"), v2, 0, 1);

}

+ (BOOL)_deviceSupportsGenerativeModelSystems
{
  if (qword_2540B1DC0 != -1)
    dispatch_once(&qword_2540B1DC0, &__block_literal_global_229);
  return _MergedGlobals_14;
}

uint64_t __64__UAFManagedSubscriptions__deviceSupportsGenerativeModelSystems__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _MergedGlobals_14 = result;
  return result;
}

+ (void)manageSummarizationKitSubscription
{
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (+[UAFManagedSubscriptions _deviceSupportsGenerativeModelSystems](UAFManagedSubscriptions, "_deviceSupportsGenerativeModelSystems"))
  {
    v3 = CFSTR("com.apple.summarizationkit");
    v4[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:](UAFManagedSubscriptions, "manageSubscription:subscriber:assetSets:usageAliases:useHold:", CFSTR("configuration"), CFSTR("com.apple.summarizationkit"), v2, 0, 1);

  }
}

+ (void)manageGMSSiriLanguageSubscription:(BOOL)a3 language:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDBCEA0];
    v5 = a4;
    objc_msgSend(v4, "localeWithLocaleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFManagedSubscriptions morphunUsagesForLocale:](UAFManagedSubscriptions, "morphunUsagesForLocale:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[UAFManagedSubscriptions validateUsageAlias:usageAliasValue:](UAFManagedSubscriptions, "validateUsageAlias:usageAliasValue:", CFSTR("com.apple.siri.assistant.assistantengine.language"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  +[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:](UAFManagedSubscriptions, "manageSubscription:subscriber:assetSets:usageAliases:useHold:", CFSTR("language"), CFSTR("com.apple.siri.intelligenceengine"), v8, v7, 0);

}

+ (void)manageXRSubscription:(id)a3 subscribe:(BOOL)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a4)
  {
    v4 = (void *)MEMORY[0x24BDBCEA0];
    v5 = a3;
    objc_msgSend(v4, "localeWithLocaleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFManagedSubscriptions morphunUsagesForLocale:](UAFManagedSubscriptions, "morphunUsagesForLocale:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[UAFManagedSubscriptions validateUsageAlias:usageAliasValue:](UAFManagedSubscriptions, "validateUsageAlias:usageAliasValue:", CFSTR("com.apple.siri.assistant.language"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  +[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:](UAFManagedSubscriptions, "manageSubscription:subscriber:assetSets:usageAliases:useHold:", CFSTR("language"), CFSTR("com.apple.siri.assistant.xr"), v8, v7, 1);

}

@end
