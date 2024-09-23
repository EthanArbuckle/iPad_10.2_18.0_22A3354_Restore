@implementation UAFAssetSetManager

+ (UAFAssetSetManager)sharedManager
{
  if (qword_2540B1D88 != -1)
    dispatch_once(&qword_2540B1D88, &__block_literal_global_249);
  return (UAFAssetSetManager *)(id)qword_2540B1D90;
}

- (id)assetNamesForAssetSet:(id)a3 usages:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAssetSet:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[UAFAssetSetManager assetNamesForAssetSet:usages:]";
      v35 = 2114;
      v36 = v5;
      _os_log_impl(&dword_229282000, v13, OS_LOG_TYPE_DEFAULT, "%s No configuration for asset set: %{public}@", buf, 0x16u);
    }
    goto LABEL_20;
  }
  objc_msgSend(v8, "getAssets:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v34 = "-[UAFAssetSetManager assetNamesForAssetSet:usages:]";
      v35 = 2114;
      v36 = v5;
      v37 = 2114;
      v38 = v6;
      _os_log_impl(&dword_229282000, v23, OS_LOG_TYPE_DEFAULT, "%s Error retrieving assets for %{public}@ with usages: %{public}@", buf, 0x20u);
    }

    v13 = 0;
LABEL_20:
    v12 = 0;
    goto LABEL_21;
  }
  v11 = (void *)v10;
  v25 = v9;
  v26 = v6;
  v27 = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v11;
  v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v14)
    goto LABEL_14;
  v15 = v14;
  v16 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v29 != v16)
        objc_enumerationMutation(v13);
      v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
      -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TrialFactor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {

      }
      else
      {
        -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AssetSpecifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          continue;
      }
      objc_msgSend(v12, "addObject:", v18);
    }
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v15);
LABEL_14:

  v6 = v26;
  v5 = v27;
  v9 = v25;
LABEL_21:

  return v12;
}

+ (id)getConcurrentQueue
{
  if (_MergedGlobals_13 != -1)
    dispatch_once(&_MergedGlobals_13, &__block_literal_global_14);
  return (id)qword_2540B1D70;
}

void __40__UAFAssetSetManager_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFAssetSetManager.Concurrent", MEMORY[0x24BDAC9C0]);
  v1 = (void *)qword_2540B1D70;
  qword_2540B1D70 = (uint64_t)v0;

}

+ (id)getSerialQueue
{
  if (qword_2540B1D78 != -1)
    dispatch_once(&qword_2540B1D78, &__block_literal_global_189_1);
  return (id)qword_2540B1D80;
}

void __36__UAFAssetSetManager_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFAssetSetManager.Serial", 0);
  v1 = (void *)qword_2540B1D80;
  qword_2540B1D80 = (uint64_t)v0;

}

+ (BOOL)userIsValidForAssetSetManagement:(unsigned int)a3
{
  return 1;
}

+ (id)_subscriptionDiffersFromDB:(id)a3 subscriber:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v24 = a4;
  +[UAFSubscriptionStoreManager defaultManager](UAFSubscriptionStoreManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v25 = 0;
        v15 = objc_msgSend(v14, "isValid:error:", 0, &v25);
        v16 = v25;
        v17 = v16;
        if ((v15 & 1) == 0)
        {
          if (a5)
            *a5 = objc_retainAutorelease(v16);
          UAFGetLogCategory((id *)&UAFLogContextSubscription);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v31 = "+[UAFAssetSetManager _subscriptionDiffersFromDB:subscriber:error:]";
            v32 = 2114;
            v33 = v24;
            v34 = 2114;
            v35 = v14;
            v36 = 2114;
            v37 = v17;
            _os_log_error_impl(&dword_229282000, v21, OS_LOG_TYPE_ERROR, "%s Subscription invalid for subscriber %{public}@, subscription:%{public}@: %{public}@", buf, 0x2Au);
          }

          v20 = 0;
          goto LABEL_18;
        }
        objc_msgSend(v14, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "getSubscription:subscriber:", v18, v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19 || (objc_msgSend(v14, "isEqual:", v19) & 1) == 0)
          objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(v8, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v20;
}

+ (void)subscribe:(id)a3 subscriptions:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[3];
  _QWORD v35[3];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    +[UAFAssetSetManager getConcurrentQueue](UAFAssetSetManager, "getConcurrentQueue");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v33 = 0;
  +[UAFAssetSetManager _subscriptionDiffersFromDB:subscriber:error:](UAFAssetSetManager, "_subscriptionDiffersFromDB:subscriber:error:", v10, v9, &v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v33;
  v15 = v14;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 0;
  if (v16)
  {
    if (objc_msgSend(v13, "count"))
    {
      UAFGetLogCategory((id *)&UAFLogContextSubscription);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v37 = "+[UAFAssetSetManager subscribe:subscriptions:queue:completion:]";
        v38 = 2114;
        v39 = v9;
        v40 = 2114;
        v41 = v13;
        _os_log_impl(&dword_229282000, v19, OS_LOG_TYPE_DEFAULT, "%s Changed subscriptions for '%{public}@': '%{public}@'", buf, 0x20u);
      }

      v34[0] = CFSTR("Operation");
      v34[1] = CFSTR("Subscriber");
      v35[0] = CFSTR("Subscribe");
      v35[1] = v9;
      v34[2] = CFSTR("Subscriptions");
      v35[2] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_opt_new();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_196;
      v24[3] = &unk_24F1F8208;
      v25 = v20;
      v27 = v12;
      v26 = v11;
      v21 = v20;
      v22 = (void *)MEMORY[0x22E2C6D60](v24);
      objc_msgSend(v21, "operationWithConfig:completion:", v18, v22);

      goto LABEL_19;
    }
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v37 = "+[UAFAssetSetManager subscribe:subscriptions:queue:completion:]";
      v38 = 2114;
      v39 = v9;
      v40 = 2114;
      v41 = v10;
      _os_log_impl(&dword_229282000, v23, OS_LOG_TYPE_DEFAULT, "%s No subscription changes for subscriber '%{public}@' and subscriptions '%{public}@'", buf, 0x20u);
    }

    if (v12)
    {
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_193;
      v28[3] = &unk_24F1F7D48;
      v29 = v12;
      dispatch_async(v11, v28);
      v18 = v29;
      goto LABEL_19;
    }
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextSubscription);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v37 = "+[UAFAssetSetManager subscribe:subscriptions:queue:completion:]";
      v38 = 2114;
      v39 = v9;
      v40 = 2114;
      v41 = v15;
      _os_log_error_impl(&dword_229282000, v17, OS_LOG_TYPE_ERROR, "%s Not attempting to update subscriptions for %{public}@: %{public}@", buf, 0x20u);
    }

    if (v12)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke;
      block[3] = &unk_24F1F7A40;
      v32 = v12;
      v31 = v15;
      dispatch_async(v11, block);

      v18 = v32;
LABEL_19:

    }
  }

}

uint64_t __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_193(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_196(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_2;
    v6[3] = &unk_24F1F7A40;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)getComparableUsages:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__UAFAssetSetManager_getComparableUsages___block_invoke;
  v8[3] = &unk_24F1F8230;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __42__UAFAssetSetManager_getComparableUsages___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = a2;
  objc_msgSend(v5, "setWithArray:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

+ (BOOL)shouldConfigure:(id)a3 newUsages:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v23;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[UAFAssetSetManager getComparableUsages:](UAFAssetSetManager, "getComparableUsages:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAssetSetManager getComparableUsages:](UAFAssetSetManager, "getComparableUsages:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v8))
  {
    UAFGetLogCategory((id *)&UAFLogContextSubscription);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[UAFAssetSetManager shouldConfigure:newUsages:]";
      _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s old and new usages equal, skipping configure", (uint8_t *)&buf, 0xCu);
    }
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v5, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v9 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v6, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((-[NSObject isEqual:](v9, "isEqual:", v15) & 1) != 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v23 = 0x2020000000;
      v24 = 0;
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __48__UAFAssetSetManager_shouldConfigure_newUsages___block_invoke;
      v18[3] = &unk_24F1F8258;
      v19 = v5;
      v20 = v6;
      p_buf = &buf;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v18);
      v10 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextSubscription);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "+[UAFAssetSetManager shouldConfigure:newUsages:]";
        _os_log_impl(&dword_229282000, v16, OS_LOG_TYPE_DEFAULT, "%s old and new usages cover different asset sets, requiring configure", (uint8_t *)&buf, 0xCu);
      }

      v10 = 1;
    }

  }
  return v10;
}

void __48__UAFAssetSetManager_shouldConfigure_newUsages___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAssetSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[UAFAutoAssetManager getSpecifiers:assetSetUsages:](UAFAutoAssetManager, "getSpecifiers:assetSetUsages:", v8, a1[4]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAutoAssetManager getSpecifiers:assetSetUsages:](UAFAutoAssetManager, "getSpecifiers:assetSetUsages:", v8, a1[5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    UAFGetLogCategory((id *)&UAFLogContextSubscription);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "+[UAFAssetSetManager shouldConfigure:newUsages:]_block_invoke";
      _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_DEFAULT, "%s resulting specifiers different, requiring configure", (uint8_t *)&v12, 0xCu);
    }

  }
}

+ (BOOL)subscribe:(id)a3 subscriptions:(id)a4 storeManager:(id)a5 configurationManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = 0;
  +[UAFAssetSetManager _subscriptionDiffersFromDB:subscriber:error:](UAFAssetSetManager, "_subscriptionDiffersFromDB:subscriber:error:", v10, v9, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  v15 = v14;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 0;
  if (v16)
  {
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v11, "getAllSystemAssetSetUsages");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v11, "subscribe:subscriptions:expires:", v9, v13, 0);
      UAFGetLogCategory((id *)&UAFLogContextSubscription);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v25 = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:]";
          v26 = 2114;
          v27 = v10;
          v28 = 2114;
          v29 = v9;
          _os_log_impl(&dword_229282000, v20, OS_LOG_TYPE_DEFAULT, "%s Updated storage to reflect subscriptions %{public}@ for subscriber %{public}@", buf, 0x20u);
        }

        objc_msgSend(v11, "updateSystemAssetSetUsages:", 0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (+[UAFAssetSetManager shouldConfigure:newUsages:](UAFAssetSetManager, "shouldConfigure:newUsages:", v17, v20))
        {
          +[UAFAssetSetManager configureAssetDelivery:configurationManager:lockIfUnchanged:](UAFAssetSetManager, "configureAssetDelivery:configurationManager:lockIfUnchanged:", v11, v12, 0);
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextSubscription);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v25 = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:]";
            _os_log_impl(&dword_229282000, v21, OS_LOG_TYPE_DEFAULT, "%s Updated subscriptions results in no usage changes, skipping reconfiguration", buf, 0xCu);
          }

        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v25 = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:]";
        v26 = 2114;
        v27 = v10;
        v28 = 2114;
        v29 = v9;
        _os_log_error_impl(&dword_229282000, v20, OS_LOG_TYPE_ERROR, "%s Failed to update storage to reflect subscriptions %{public}@ for subscriber %{public}@", buf, 0x20u);
      }

    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextSubscription);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v25 = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:]";
        v26 = 2114;
        v27 = v9;
        v28 = 2114;
        v29 = v10;
        _os_log_impl(&dword_229282000, v17, OS_LOG_TYPE_DEFAULT, "%s No subscription changes for subscriber '%{public}@' and subscriptions '%{public}@'", buf, 0x20u);
      }
      v18 = 1;
    }
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextSubscription);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:]";
      v26 = 2114;
      v27 = v9;
      v28 = 2114;
      v29 = v15;
      _os_log_error_impl(&dword_229282000, v17, OS_LOG_TYPE_ERROR, "%s Not attempting to update subscriptions for %{public}@: %{public}@", buf, 0x20u);
    }
    v18 = 0;
  }

  return v18;
}

+ (void)unsubscribe:(id)a3 subscriptions:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[3];
  _QWORD v25[3];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    +[UAFAssetSetManager getConcurrentQueue](UAFAssetSetManager, "getConcurrentQueue");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  UAFGetLogCategory((id *)&UAFLogContextSubscription);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "+[UAFAssetSetManager unsubscribe:subscriptions:queue:completion:]";
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_229282000, v13, OS_LOG_TYPE_DEFAULT, "%s Unsubscribing for '%{public}@'", buf, 0x16u);
  }

  v24[0] = CFSTR("Operation");
  v24[1] = CFSTR("Subscriber");
  v25[0] = CFSTR("Unsubscribe");
  v25[1] = v9;
  v24[2] = CFSTR("Subscriptions");
  v25[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __65__UAFAssetSetManager_unsubscribe_subscriptions_queue_completion___block_invoke;
  v20[3] = &unk_24F1F8208;
  v22 = v11;
  v23 = v12;
  v21 = v15;
  v16 = v11;
  v17 = v12;
  v18 = v15;
  v19 = (void *)MEMORY[0x22E2C6D60](v20);
  objc_msgSend(v18, "operationWithConfig:completion:", v14, v19);

}

void __65__UAFAssetSetManager_unsubscribe_subscriptions_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__UAFAssetSetManager_unsubscribe_subscriptions_queue_completion___block_invoke_2;
    v6[3] = &unk_24F1F7A40;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __65__UAFAssetSetManager_unsubscribe_subscriptions_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)unsubscribe:(id)a3 subscriptions:(id)a4 storeManager:(id)a5 configurationManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "getSubscription:subscriber:", v19, v9, (_QWORD)v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v11, "getAllSystemAssetSetUsages");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v11, "unsubscribe:subscriptions:", v9, v22);

    UAFGetLogCategory((id *)&UAFLogContextSubscription);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if ((v23 & 1) != 0)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "+[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:]";
        v34 = 2114;
        v35 = v14;
        v36 = 2114;
        v37 = v9;
        _os_log_impl(&dword_229282000, v25, OS_LOG_TYPE_DEFAULT, "%s Updated storage to reflect removal of subscriptions %{public}@ for subscriber %{public}@", buf, 0x20u);
      }

      objc_msgSend(v11, "updateSystemAssetSetUsages:", 0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (+[UAFAssetSetManager shouldConfigure:newUsages:](UAFAssetSetManager, "shouldConfigure:newUsages:", v21, v25))
      {
        +[UAFAssetSetManager configureAssetDelivery:configurationManager:lockIfUnchanged:](UAFAssetSetManager, "configureAssetDelivery:configurationManager:lockIfUnchanged:", v11, v12, 0);
      }
      else
      {
        UAFGetLogCategory((id *)&UAFLogContextSubscription);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "+[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:]";
          _os_log_impl(&dword_229282000, v26, OS_LOG_TYPE_DEFAULT, "%s Updated subscriptions results in no usage changes, skipping reconfiguration", buf, 0xCu);
        }

      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "+[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:]";
      v34 = 2114;
      v35 = v14;
      v36 = 2114;
      v37 = v9;
      _os_log_error_impl(&dword_229282000, v25, OS_LOG_TYPE_ERROR, "%s Failed to update storage to reflect subscriptions %{public}@ for subscriber %{public}@", buf, 0x20u);
    }

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextSubscription);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "+[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:]";
      v34 = 2114;
      v35 = v9;
      v36 = 2114;
      v37 = v14;
      _os_log_impl(&dword_229282000, v21, OS_LOG_TYPE_DEFAULT, "%s No changes found for subscriber %{public}@ subscriptions: %{public}@", buf, 0x20u);
    }
    v23 = 1;
  }

  return v23;
}

+ (id)getSubscriptions:(id)a3 storeManager:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    +[UAFSubscriptionStoreManager defaultManager](UAFSubscriptionStoreManager, "defaultManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "getSubscriptions:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getAssetSetUsages:(id)a3 storeManager:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    +[UAFSubscriptionStoreManager defaultManager](UAFSubscriptionStoreManager, "defaultManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "getSystemAssetSetUsages:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)diskSpaceNeededForSubscriber:(id)a3 subscriptionName:(id)a4 error:(id *)a5
{
  return -[UAFAssetSetManager diskSpaceNeededForSubscriber:subscriptionName:storeManager:configurationManager:error:](self, "diskSpaceNeededForSubscriber:subscriptionName:storeManager:configurationManager:error:", a3, a4, 0, 0, a5);
}

- (id)diskSpaceNeededForSubscriber:(id)a3 subscriptionName:(id)a4 storeManager:(id)a5 configurationManager:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    +[UAFSubscriptionStoreManager defaultManager](UAFSubscriptionStoreManager, "defaultManager");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_3;
  }
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  if (v12)
  {
    objc_msgSend(v13, "getSubscription:subscriber:", v12, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    objc_msgSend(v13, "getSubscriptions:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v23 = 136315650;
    v24 = "-[UAFAssetSetManager diskSpaceNeededForSubscriber:subscriptionName:storeManager:configurationManager:error:]";
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = v17;
    _os_log_debug_impl(&dword_229282000, v18, OS_LOG_TYPE_DEBUG, "%s Subscriptions for %{public}@: %{public}@", (uint8_t *)&v23, 0x20u);
  }

  objc_msgSend(v15, "applySubscriptions:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v23 = 136315394;
    v24 = "-[UAFAssetSetManager diskSpaceNeededForSubscriber:subscriptionName:storeManager:configurationManager:error:]";
    v25 = 2114;
    v26 = v19;
    _os_log_debug_impl(&dword_229282000, v20, OS_LOG_TYPE_DEBUG, "%s All asset set usages now %{public}@", (uint8_t *)&v23, 0x16u);
  }

  +[UAFAutoAssetManager spaceNeededForAssetSetUsages:key:configurationManager:error:](UAFAutoAssetManager, "spaceNeededForAssetSetUsages:key:configurationManager:error:", v19, CFSTR("_UnarchivedSize"), v15, a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (void)updateAssets:(id)a3 policies:(id)a4 queue:(id)a5 progress:(id)a6 completion:(id)a7
{
  +[UAFAssetSetManager updateAssets:subscription:policies:queue:progress:completion:storeManager:configurationManager:](UAFAssetSetManager, "updateAssets:subscription:policies:queue:progress:completion:storeManager:configurationManager:", a3, 0, a4, a5, a6, a7, 0, 0);
}

+ (void)updateAssets:(id)a3 policies:(id)a4 queue:(id)a5 progress:(id)a6 completion:(id)a7 storeManager:(id)a8 configurationManager:(id)a9
{
  +[UAFAssetSetManager updateAssets:subscription:policies:queue:progress:completion:storeManager:configurationManager:](UAFAssetSetManager, "updateAssets:subscription:policies:queue:progress:completion:storeManager:configurationManager:", a3, 0, a4, a5, a6, a7, a8, a9);
}

+ (void)updateAssets:(id)a3 subscription:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v13 = a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  +[UAFAssetSetManager sharedManager](UAFAssetSetManager, "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __83__UAFAssetSetManager_updateAssets_subscription_policies_queue_progress_completion___block_invoke;
  v21[3] = &unk_24F1F8280;
  v22 = v13;
  v20 = v13;
  objc_msgSend(v19, "updateAssetsForSubscriber:subscriptionName:policies:queue:progress:completion:", v18, v17, v16, v15, v21, v14);

}

uint64_t __83__UAFAssetSetManager_updateAssets_subscription_policies_queue_progress_completion___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, unint64_t))(result + 16))(result, (unint64_t)a2);
  return result;
}

+ (void)updateAssets:(id)a3 subscription:(id)a4 policies:(id)a5 queue:(id)a6 progressWithStatus:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v13 = a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  +[UAFAssetSetManager sharedManager](UAFAssetSetManager, "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __93__UAFAssetSetManager_updateAssets_subscription_policies_queue_progressWithStatus_completion___block_invoke;
  v21[3] = &unk_24F1F8280;
  v22 = v13;
  v20 = v13;
  objc_msgSend(v19, "updateAssetsForSubscriber:subscriptionName:policies:queue:progress:completion:", v18, v17, v16, v15, v21, v14);

}

uint64_t __93__UAFAssetSetManager_updateAssets_subscription_policies_queue_progressWithStatus_completion___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(result + 16))(result, (unint64_t)a3, a2);
  return result;
}

+ (void)updateAssets:(id)a3 subscription:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8 storeManager:(id)a9 configurationManager:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v15 = a7;
  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  +[UAFAssetSetManager sharedManager](UAFAssetSetManager, "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __117__UAFAssetSetManager_updateAssets_subscription_policies_queue_progress_completion_storeManager_configurationManager___block_invoke;
  v23[3] = &unk_24F1F8280;
  v24 = v15;
  v22 = v15;
  objc_msgSend(v21, "updateAssetsForSubscriber:subscriptionName:policies:queue:progress:completion:", v20, v19, v18, v17, v23, v16);

}

uint64_t __117__UAFAssetSetManager_updateAssets_subscription_policies_queue_progress_completion_storeManager_configurationManager___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, unint64_t))(result + 16))(result, (unint64_t)a2);
  return result;
}

- (void)updateAssetsForSubscriber:(id)a3 subscriptionName:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 detailedProgress:(id)a8 completion:(id)a9 storeManager:(id)a10 configurationManager:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  UAFAssetSetProgress *v43;
  UAFAssetSetProgress *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  UAFAssetSetProgress *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id obj;
  _QWORD block[4];
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  NSObject *v72;
  _QWORD v73[4];
  NSObject *v74;
  _QWORD v75[4];
  UAFAssetSetProgress *v76;
  _QWORD v77[4];
  UAFAssetSetProgress *v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t v87[128];
  uint8_t buf[4];
  const char *v89;
  __int16 v90;
  id v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v62 = (unint64_t)a7;
  v61 = a8;
  v59 = a9;
  v20 = a10;
  v21 = a11;
  v22 = (uint64_t)v21;
  v65 = v20;
  if (v20)
  {
    if (v21)
      goto LABEL_3;
  }
  else
  {
    +[UAFSubscriptionStoreManager defaultManager](UAFSubscriptionStoreManager, "defaultManager");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      goto LABEL_3;
  }
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v22 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v23 = objc_alloc_init(MEMORY[0x24BDD1880]);
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v89 = "-[UAFAssetSetManager updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:compl"
          "etion:storeManager:configurationManager:]";
    v90 = 2114;
    v91 = v23;
    v92 = 2114;
    v93 = (uint64_t)v16;
    v94 = 2114;
    v95 = v17;
    _os_log_impl(&dword_229282000, v24, OS_LOG_TYPE_DEFAULT, "%s %{public}@: updateAssets for subscriber '%{public}@' with subscription '%{public}@'", buf, 0x2Au);
  }
  v57 = v23;
  v60 = (void *)v22;
  v63 = v17;
  v64 = v16;

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v18;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
  if (v25)
  {
    v26 = v25;
    v27 = 0;
    v28 = 0;
    v29 = *(_QWORD *)v84;
    v30 = 100;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v84 != v29)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        if (objc_msgSend(v32, "isEqualToString:", CFSTR("UpdateNamespaces")))
        {
          v30 -= 2;
          v28 = 1;
        }
        if (objc_msgSend(v32, "isEqualToString:", CFSTR("ForceUpdateNamespaces")))
        {
          v30 -= 2;
          v28 = 2;
        }
        v27 |= objc_msgSend(v32, "isEqualToString:", CFSTR("UseCellular"));
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    }
    while (v26);
  }
  else
  {
    LOBYTE(v27) = 0;
    v28 = 0;
    v30 = 100;
  }

  if (v17)
  {
    v33 = v16;
    objc_msgSend(v65, "getSubscription:subscriber:", v17, v16);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (unint64_t)v61;
    if (v34)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v34);
      v36 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = 0;
    }

  }
  else
  {
    v33 = v16;
    objc_msgSend(v65, "getSubscriptions:", v16);
    v36 = objc_claimAutoreleasedReturnValue();
    v35 = (unint64_t)v61;
  }
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v89 = "-[UAFAssetSetManager updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:compl"
          "etion:storeManager:configurationManager:]";
    v90 = 2114;
    v91 = v33;
    v92 = 2114;
    v93 = v36;
    _os_log_debug_impl(&dword_229282000, v37, OS_LOG_TYPE_DEBUG, "%s Subscriptions for %{public}@: %{public}@", buf, 0x20u);
  }

  objc_msgSend(v60, "applySubscriptions:", v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v89 = "-[UAFAssetSetManager updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:compl"
          "etion:storeManager:configurationManager:]";
    v90 = 2114;
    v91 = v38;
    _os_log_debug_impl(&dword_229282000, v39, OS_LOG_TYPE_DEBUG, "%s All asset set usages now %{public}@", buf, 0x16u);
  }

  if (!v19)
  {
    +[UAFAssetSetManager getConcurrentQueue](UAFAssetSetManager, "getConcurrentQueue");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v36;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), v33, v36);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = MEMORY[0x24BDAC760];
  v54 = (void *)v40;
  if (v62 | v35)
  {
    v42 = v40;
    v43 = [UAFAssetSetProgress alloc];
    v79[0] = v41;
    v79[1] = 3221225472;
    v79[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke;
    v79[3] = &unk_24F1F82D0;
    v80 = v19;
    v81 = (id)v62;
    v82 = (id)v35;
    v77[0] = v41;
    v77[1] = 3221225472;
    v77[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_3;
    v77[3] = &unk_24F1F82F8;
    v44 = -[UAFAssetSetProgress initWithName:maxProgressBeforeComplete:progressWithStatus:](v43, "initWithName:maxProgressBeforeComplete:progressWithStatus:", v42, v30, v79);
    v78 = v44;
    v45 = (void *)MEMORY[0x22E2C6D60](v77);
    v75[0] = v41;
    v75[1] = 3221225472;
    v75[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_4;
    v75[3] = &unk_24F1F82F8;
    v56 = v44;
    v76 = v56;
    v55 = (void *)MEMORY[0x22E2C6D60](v75);

  }
  else
  {
    v55 = 0;
    v56 = 0;
    v45 = 0;
  }
  v46 = dispatch_group_create();
  dispatch_group_enter(v46);
  v73[0] = v41;
  v73[1] = 3221225472;
  v73[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_5;
  v73[3] = &unk_24F1F6F88;
  v47 = v46;
  v74 = v47;
  v48 = v27 & 1;
  +[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:requestId:completion:](UAFAutoAssetManager, "updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:requestId:completion:", v38, v60, v48, v45, v57, v73);
  dispatch_group_enter(v47);
  v71[0] = v41;
  v71[1] = 3221225472;
  v71[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_6;
  v71[3] = &unk_24F1F6F88;
  v72 = v47;
  v49 = v47;
  +[UAFTrialUpdateManager updateTrialFromAssetSetUsages:rolloutUpdateMode:expensiveNetworking:storeManager:configurationManager:progress:completion:](UAFTrialUpdateManager, "updateTrialFromAssetSetUsages:rolloutUpdateMode:expensiveNetworking:storeManager:configurationManager:progress:completion:", v38, v28, v48, v65, v60, v55, v71);
  +[UAFAssetSetManager getConcurrentQueue](UAFAssetSetManager, "getConcurrentQueue");
  v50 = objc_claimAutoreleasedReturnValue();
  block[0] = v41;
  block[1] = 3221225472;
  block[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_7;
  block[3] = &unk_24F1F8320;
  v69 = v19;
  v70 = v59;
  v68 = v57;
  v51 = v19;
  v52 = v57;
  v53 = v59;
  dispatch_group_notify(v49, v50, block);

}

void __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_2;
  v11[3] = &unk_24F1F82A8;
  v10 = *(NSObject **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v14 = a5;
  v15 = a4;
  v13 = *(id *)(a1 + 48);
  v16 = a2;
  v17 = a3;
  dispatch_async(v10, v11);

}

void __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  UAFAssetSetStatus *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, double))(v2 + 16))(v2, *(_QWORD *)(a1 + 56), *(double *)(a1 + 48));
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = -[UAFAssetSetStatus initWithStatus:percent:completedBytes:totalBytes:]([UAFAssetSetStatus alloc], "initWithStatus:percent:completedBytes:totalBytes:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(double *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "progress:completed:total:status:", CFSTR("AutoAsset"), a2, a3, a4);
}

uint64_t __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "progress:completed:total:status:", CFSTR("Trial"), a2, a3, a4);
}

void __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 48))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = 136315394;
      v5 = "-[UAFAssetSetManager updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:comp"
           "letion:storeManager:configurationManager:]_block_invoke_7";
      v6 = 2114;
      v7 = v3;
      _os_log_debug_impl(&dword_229282000, v2, OS_LOG_TYPE_DEBUG, "%s Dispatching completion method for Request ID %{public}@", (uint8_t *)&v4, 0x16u);
    }

    dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
  }
}

+ (id)sysdiagnoseInformationWithError:(id *)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__6;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v4 = dispatch_group_create();
  v5 = (void *)objc_opt_new();
  dispatch_group_enter(v4);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__UAFAssetSetManager_sysdiagnoseInformationWithError___block_invoke;
  v13[3] = &unk_24F1F8348;
  v6 = v5;
  v14 = v6;
  v16 = &v24;
  v17 = &v18;
  v7 = v4;
  v15 = v7;
  objc_msgSend(v6, "diagnosticInformation:", v13);
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v19[5]);
  v8 = (void *)v25[5];
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No output found: %@"), v19[5]);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v25[5];
    v25[5] = v9;

    v8 = (void *)v25[5];
  }
  v11 = v8;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __54__UAFAssetSetManager_sysdiagnoseInformationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)getSystemUsageAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = (id)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke;
  v9[3] = &unk_24F1F8398;
  v9[4] = &v10;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke_4;
  v7[3] = &unk_24F1F83C0;
  v4 = (id)MEMORY[0x22E2C6D60](v9);
  v8 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  UAFAssetSet *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  UAFAssetSet *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v15 = a2;
  v5 = a3;
  v6 = -[UAFAssetSet initWithAssetSet:usages:]([UAFAssetSet alloc], "initWithAssetSet:usages:", v15, v5);
  -[UAFAssetSet assets](v6, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke_2;
  v17[3] = &unk_24F1F8370;
  v17[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v17);
  -[UAFAssetSet experimentId](v6, "experimentId");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[UAFAssetSet experimentId](v6, "experimentId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", &stru_24F1F9848);

    if ((v12 & 1) == 0)
    {
      v13 = -[UAFAssetSet initWithAssetSet:usages:disableExperimentation:]([UAFAssetSet alloc], "initWithAssetSet:usages:disableExperimentation:", v15, v5, 1);
      -[UAFAssetSet assets](v13, "assets");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke_3;
      v16[3] = &unk_24F1F8370;
      v16[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v16);

    }
  }

}

uint64_t __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:");
}

void __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

}

void __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (id)generateInformationWithError:(id *)a3
{
  uint64_t k;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  UAFAssetSet *v35;
  UAFAssetSet *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t m;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  id v71;
  id obj;
  id v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[3];
  _QWORD v104[3];
  void *v105;
  void *v106;
  _BYTE v107[128];
  _BYTE v108[128];
  uint8_t v109[128];
  uint8_t buf[4];
  const char *v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  id v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = objc_claimAutoreleasedReturnValue();
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    _os_log_impl(&dword_229282000, v5, OS_LOG_TYPE_DEFAULT, "%s Generating subscription log", buf, 0xCu);
  }

  +[UAFSubscriptionStoreManager defaultManager](UAFSubscriptionStoreManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v70 = (void *)v4;
  v8 = (void *)v4;
  v9 = v6;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("Subscriptions"));

  objc_msgSend(v6, "getSubscribers");
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
  v69 = v6;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v100;
    v79 = *(_QWORD *)v100;
    do
    {
      v13 = 0;
      v81 = v11;
      do
      {
        if (*(_QWORD *)v100 != v12)
          objc_enumerationMutation(obj);
        k = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v13);
        objc_msgSend(v9, "getSubscriptions:", k);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14 && objc_msgSend(v14, "count"))
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          v18 = v15;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v96;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v96 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "propertiesAsDictionary");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "addObject:", v23);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
            }
            while (v20);
          }

          objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, k);
          objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("Subscriptions"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v16);

          UAFGetLogCategory((id *)&UAFLogContextClient);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v111 = "+[UAFAssetSetManager generateInformationWithError:]";
            v112 = 2114;
            v113 = k;
            v114 = 2114;
            v115 = v18;
            _os_log_impl(&dword_229282000, v25, OS_LOG_TYPE_DEFAULT, "%s Subscriptions for subscriber: %{public}@: %{public}@", buf, 0x20u);
          }

          v9 = v69;
          v12 = v79;
          v11 = v81;
        }

        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
    }
    while (v11);
  }
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    _os_log_impl(&dword_229282000, v26, OS_LOG_TYPE_DEFAULT, "%s Generating asset usages log", buf, 0xCu);
  }

  objc_msgSend(v9, "getAllSystemAssetSetUsages");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v27, CFSTR("SystemAssetSetUsages"));
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    v112 = 2114;
    v113 = (uint64_t)v27;
    _os_log_impl(&dword_229282000, v28, OS_LOG_TYPE_DEFAULT, "%s System AssetSetUsages: %{public}@", buf, 0x16u);
  }

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    _os_log_impl(&dword_229282000, v29, OS_LOG_TYPE_DEFAULT, "%s Generating system asset log", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v74 = v27;
  v30 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v91, v109, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v92;
    k = (uint64_t)&UAFLogContextClient;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v92 != v32)
          objc_enumerationMutation(v74);
        v34 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
        v35 = -[UAFAssetSet initWithAssetSet:usages:]([UAFAssetSet alloc], "initWithAssetSet:usages:", v34, 0);
        v36 = v35;
        if (v35)
        {
          -[UAFAssetSet assetSetId](v35, "assetSetId");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            -[UAFAssetSet assetSetId](v36, "assetSetId");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "setObject:forKeyedSubscript:", v38, v34);

          }
          else
          {
            objc_msgSend(v76, "setObject:forKeyedSubscript:", CFSTR("none"), v34);
          }

          UAFGetLogCategory((id *)&UAFLogContextClient);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            -[UAFAssetSet assetSetId](v36, "assetSetId");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v111 = "+[UAFAssetSetManager generateInformationWithError:]";
            v112 = 2114;
            v113 = (uint64_t)v34;
            v114 = 2114;
            v115 = v40;
            _os_log_impl(&dword_229282000, v39, OS_LOG_TYPE_DEFAULT, "%s AssetSet Identifier: %{public}@: %{public}@", buf, 0x20u);

          }
        }

      }
      v31 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v91, v109, 16);
    }
    while (v31);
  }

  objc_msgSend(v70, "setObject:forKeyedSubscript:", v76, CFSTR("AssetSetIdentifiers"));
  +[UAFAssetSetManager getSystemUsageAssets:](UAFAssetSetManager, "getSystemUsageAssets:", v74);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v73 = v41;
  v42 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v87, v108, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v88;
    do
    {
      for (k = 0; k != v43; ++k)
      {
        if (*(_QWORD *)v88 != v44)
          objc_enumerationMutation(v73);
        objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * k), "propertiesAsDictionary");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "addObject:", v45);

      }
      v43 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v87, v108, 16);
    }
    while (v43);
  }

  objc_msgSend(v70, "setObject:forKeyedSubscript:", v80, CFSTR("SystemAssets"));
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    _os_log_impl(&dword_229282000, v46, OS_LOG_TYPE_DEFAULT, "%s Generating system configuration log", buf, 0xCu);
  }

  objc_msgSend(v69, "getAllSystemConfiguration");
  v47 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v47, CFSTR("SystemConfigKey"));
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    v112 = 2114;
    v113 = v47;
    _os_log_impl(&dword_229282000, v48, OS_LOG_TYPE_DEFAULT, "%s System Configuration: %{public}@", buf, 0x16u);
  }
  v67 = (void *)v47;

  v75 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "getAllAssetSets");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v83, v107, 16);
  if (v82)
  {
    v78 = *(_QWORD *)v84;
    do
    {
      for (m = 0; m != v82; ++m)
      {
        if (*(_QWORD *)v84 != v78)
          objc_enumerationMutation(v71);
        v50 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * m);
        objc_msgSend(v50, "name");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          objc_msgSend(v50, "name");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v52;
          v103[0] = CFSTR("FileURL");
          objc_msgSend(v50, "originatingURL");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (v53)
          {
            objc_msgSend(v50, "originatingURL");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "path");
            k = objc_claimAutoreleasedReturnValue();
            v54 = (const __CFString *)k;
          }
          else
          {
            v54 = &stru_24F1F9848;
          }
          v104[0] = v54;
          v103[1] = CFSTR("PallasURL");
          objc_msgSend(v50, "name");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          +[UAFCommonUtilities getUAFPallasURLForAssetSet:](UAFCommonUtilities, "getUAFPallasURLForAssetSet:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v104[1] = v56;
          v103[2] = CFSTR("Population");
          objc_msgSend(v50, "name");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          +[UAFCommonUtilities getUAFPopulationForAssetSet:](UAFCommonUtilities, "getUAFPopulationForAssetSet:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v104[2] = v58;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v104, v103, 3);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = v59;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "addObject:", v60);

          if (v53)
          {

          }
        }
      }
      v82 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v83, v107, 16);
    }
    while (v82);
  }

  objc_msgSend(v70, "setObject:forKeyedSubscript:", v75, CFSTR("AssetSetConfiguration"));
  +[UAFAutoAssetHistory getPersistedAssetInfo](UAFAutoAssetHistory, "getPersistedAssetInfo");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v61) & 1) != 0)
  {
    objc_msgSend(v70, "setObject:forKeyedSubscript:", v61, CFSTR("PersistedAssetInfo"));
    v62 = v67;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v63 = objc_claimAutoreleasedReturnValue();
    v62 = v67;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v111 = "+[UAFAssetSetManager generateInformationWithError:]";
      _os_log_impl(&dword_229282000, v63, OS_LOG_TYPE_DEFAULT, "%s could not serialize persisted asset info array to json, not including in output", buf, 0xCu);
    }

  }
  +[UAFCommonUtilities serializeDictToJSONStr:error:](UAFCommonUtilities, "serializeDictToJSONStr:error:", v70, a3);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

+ (void)configureAssetDelivery:(id)a3 configurationManager:(id)a4 lockIfUnchanged:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "+[UAFAssetSetManager configureAssetDelivery:configurationManager:lockIfUnchanged:]";
    _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s Configuring asset delivery systems", buf, 0xCu);
  }

  if (!v7)
  {
    +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[UAFAssetSetManager getSerialQueue](UAFAssetSetManager, "getSerialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__UAFAssetSetManager_configureAssetDelivery_configurationManager_lockIfUnchanged___block_invoke;
  block[3] = &unk_24F1F7078;
  v14 = v7;
  v15 = v8;
  v16 = a5;
  v11 = v8;
  v12 = v7;
  dispatch_sync(v10, block);

}

void __82__UAFAssetSetManager_configureAssetDelivery_configurationManager_lockIfUnchanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = 0;
  objc_msgSend(v2, "updateSystemAssetSetUsages:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  +[UAFAutoAssetManager configureAutoAssetsFromAssetSetUsages:subscriptions:configurationManager:lockIfUnchanged:](UAFAutoAssetManager, "configureAutoAssetsFromAssetSetUsages:subscriptions:configurationManager:lockIfUnchanged:", v3, v4, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  +[UAFTrialUpdateManager updateTrialFromAssetSetUsages:storeManager:configurationManager:](UAFTrialUpdateManager, "updateTrialFromAssetSetUsages:storeManager:configurationManager:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (void)configureAssetDelivery:(id)a3 configurationManager:(id)a4
{
  +[UAFAssetSetManager configureAssetDelivery:configurationManager:lockIfUnchanged:](UAFAssetSetManager, "configureAssetDelivery:configurationManager:lockIfUnchanged:", a3, a4, 1);
}

+ (unint64_t)coalesceDownloadStatus:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 4;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntValue");

        switch(v11)
        {
          case 0:
            v7 = 0;
            break;
          case 1:
            v7 = v7 != 0;
            break;
          case 2:
            v12 = (v7 & 0xFFFFFFFFFFFFFFFELL) == 4;
            v13 = 2;
            goto LABEL_20;
          case 3:
            v12 = (v7 & 0xFFFFFFFFFFFFFFFELL) == 4 || v7 == 2;
            v13 = 3;
            goto LABEL_20;
          case 4:
            ++v6;
            break;
          case 5:
            v12 = (v7 & 0xFFFFFFFFFFFFFFFDLL) == 4 || v7 == 7;
            v13 = 5;
            goto LABEL_20;
          case 6:
            v12 = v7 == 4;
            v13 = 6;
LABEL_20:
            if (v12)
              v7 = v13;
            break;
          case 7:
            if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 4)
              v7 = 7;
            break;
          default:
            break;
        }
        ++v9;
      }
      while (v5 != v9);
      v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v5 = v14;
    }
    while (v14);
  }
  else
  {
    v6 = 0;
    v7 = 4;
  }
  if (objc_msgSend(v3, "count") == v6)
    v15 = 4;
  else
    v15 = v7;

  return v15;
}

void __35__UAFAssetSetManager_sharedManager__block_invoke()
{
  UAFAssetSetManager *v0;
  void *v1;

  v0 = objc_alloc_init(UAFAssetSetManager);
  v1 = (void *)qword_2540B1D90;
  qword_2540B1D90 = (uint64_t)v0;

}

- (UAFAssetSetManager)init
{
  UAFAssetSetManager *v2;
  uint64_t v3;
  NSMutableSet *assetSetObservers;
  UAFAssetSetManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UAFAssetSetManager;
  v2 = -[UAFAssetSetManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    assetSetObservers = v2->_assetSetObservers;
    v2->_assetSetObservers = (NSMutableSet *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)retrieveAssetSet:(id)a3 usages:(id)a4
{
  id v5;
  id v6;
  UAFAssetSet *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[UAFAssetSet initWithAssetSet:usages:disableExperimentation:]([UAFAssetSet alloc], "initWithAssetSet:usages:disableExperimentation:", v6, v5, 0);

  return v7;
}

- (void)retrieveAssetSet:(id)a3 usages:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    +[UAFAssetSetManager getConcurrentQueue](UAFAssetSetManager, "getConcurrentQueue");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__UAFAssetSetManager_retrieveAssetSet_usages_queue_completion___block_invoke;
  v17[3] = &unk_24F1F8430;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  dispatch_async(v14, v17);

}

void __63__UAFAssetSetManager_retrieveAssetSet_usages_queue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  UAFAssetSet *v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = -[UAFAssetSet initWithAssetSet:usages:disableExperimentation:]([UAFAssetSet alloc], "initWithAssetSet:usages:disableExperimentation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  objc_msgSend((id)v12[5], "autoAssetSetError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[UAFAutoAssetManager shouldWaitForMobileAssetStart:](UAFAutoAssetManager, "shouldWaitForMobileAssetStart:", v2);

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 48);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __63__UAFAssetSetManager_retrieveAssetSet_usages_queue_completion___block_invoke_2;
    v6[3] = &unk_24F1F8408;
    v10 = &v11;
    v7 = v4;
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 56);
    +[UAFAutoAssetManager waitForMobileAssetStart:queue:completion:](UAFAutoAssetManager, "waitForMobileAssetStart:queue:completion:", v7, v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  _Block_object_dispose(&v11, 8);

}

uint64_t __63__UAFAssetSetManager_retrieveAssetSet_usages_queue_completion___block_invoke_2(_QWORD *a1)
{
  UAFAssetSet *v2;
  uint64_t v3;
  void *v4;

  v2 = -[UAFAssetSet initWithAssetSet:usages:disableExperimentation:]([UAFAssetSet alloc], "initWithAssetSet:usages:disableExperimentation:", a1[4], a1[5], 0);
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)retrieveAssetSet:(id)a3 usages:(id)a4 disableExperimentation:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  UAFAssetSet *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[UAFAssetSet initWithAssetSet:usages:disableExperimentation:]([UAFAssetSet alloc], "initWithAssetSet:usages:disableExperimentation:", v8, v7, v5);

  return v9;
}

- (id)observeAssetSet:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  UAFAssetSetObserver *v11;
  NSMutableSet *v12;
  UAFAssetSetObserver *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[UAFAssetSetObserver initWithAssetSet:queue:updateHandler:]([UAFAssetSetObserver alloc], "initWithAssetSet:queue:updateHandler:", v8, v9, v10);
  if (v11)
  {
    v12 = self->_assetSetObservers;
    objc_sync_enter(v12);
    -[NSMutableSet addObject:](self->_assetSetObservers, "addObject:", v11);
    objc_sync_exit(v12);

    v13 = v11;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[UAFAssetSetManager observeAssetSet:queue:handler:]";
      v18 = 2114;
      v19 = v8;
      _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, "%s Failed to create UAFAssetSetObserver for %{public}@'", (uint8_t *)&v16, 0x16u);
    }

  }
  return v11;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  NSMutableSet *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = self->_assetSetObservers;
    objc_sync_enter(v6);
    -[NSMutableSet removeObject:](self->_assetSetObservers, "removeObject:", v5);
    objc_sync_exit(v6);

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[UAFAssetSetManager removeObserver:]";
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s Unexpected token is not of kind UAFAssetSetObserver'", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)subscribe:(id)a3 subscriptions:(id)a4 queue:(id)a5 completion:(id)a6
{
  +[UAFAssetSetManager subscribe:subscriptions:queue:completion:](UAFAssetSetManager, "subscribe:subscriptions:queue:completion:", a3, a4, a5, a6);
}

- (void)unsubscribe:(id)a3 subscriptionNames:(id)a4 queue:(id)a5 completion:(id)a6
{
  +[UAFAssetSetManager unsubscribe:subscriptions:queue:completion:](UAFAssetSetManager, "unsubscribe:subscriptions:queue:completion:", a3, a4, a5, a6);
}

- (id)subscriptionsForSubscriber:(id)a3
{
  return +[UAFAssetSetManager getSubscriptions:storeManager:](UAFAssetSetManager, "getSubscriptions:storeManager:", a3, 0);
}

- (id)subscribedUsagesForAssetSet:(id)a3
{
  return +[UAFAssetSetManager getAssetSetUsages:storeManager:](UAFAssetSetManager, "getAssetSetUsages:storeManager:", a3, 0);
}

- (id)knownUsagesForAssetSet:(id)a3 usageType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAssetSet:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "usageValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315394;
      v15 = "-[UAFAssetSetManager knownUsagesForAssetSet:usageType:]";
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, "%s Unable to get assetset for '%{public}@'", (uint8_t *)&v14, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)updateAssetsForSubscriber:(id)a3 subscriptionName:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8
{
  -[UAFAssetSetManager updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:completion:storeManager:configurationManager:](self, "updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:completion:storeManager:configurationManager:", a3, a4, a5, a6, a7, 0, a8, 0, 0);
}

- (void)updateAssetsForSubscriber:(id)a3 subscriptionName:(id)a4 policies:(id)a5 queue:(id)a6 detailedProgress:(id)a7 completion:(id)a8
{
  -[UAFAssetSetManager updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:completion:storeManager:configurationManager:](self, "updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:completion:storeManager:configurationManager:", a3, a4, a5, a6, 0, a7, a8, 0, 0);
}

- (id)assetSetUsagesForStatusForSubscriber:(id)a3 subscriptionName:(id)a4 status:(unint64_t *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  *a5 = 4;
  +[UAFSubscriptionStoreManager defaultManager](UAFSubscriptionStoreManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getSubscription:subscriber:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v19 = 136315906;
      v20 = "-[UAFAssetSetManager assetSetUsagesForStatusForSubscriber:subscriptionName:status:]";
      v21 = 2114;
      v22 = v7;
      v23 = 2114;
      v24 = v8;
      v25 = 2114;
      v26 = v10;
      _os_log_debug_impl(&dword_229282000, v12, OS_LOG_TYPE_DEBUG, "%s Subscriptions for %{public}@ %{public}@: %{public}@", (uint8_t *)&v19, 0x2Au);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "applySubscriptions:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      UAFGetLogCategory((id *)&UAFLogContextClient);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v19 = 136315394;
        v20 = "-[UAFAssetSetManager assetSetUsagesForStatusForSubscriber:subscriptionName:status:]";
        v21 = 2114;
        v22 = v15;
        _os_log_debug_impl(&dword_229282000, v16, OS_LOG_TYPE_DEBUG, "%s All asset set usages now %{public}@", (uint8_t *)&v19, 0x16u);
      }

    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = 136315394;
        v20 = "-[UAFAssetSetManager assetSetUsagesForStatusForSubscriber:subscriptionName:status:]";
        v21 = 2114;
        v22 = v10;
        _os_log_error_impl(&dword_229282000, v17, OS_LOG_TYPE_ERROR, "%s Could not create array from '%{public}@'", (uint8_t *)&v19, 0x16u);
      }

      v15 = 0;
      *a5 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315906;
      v20 = "-[UAFAssetSetManager assetSetUsagesForStatusForSubscriber:subscriptionName:status:]";
      v21 = 2114;
      v22 = v7;
      v23 = 2114;
      v24 = v8;
      v25 = 2114;
      v26 = 0;
      _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, "%s No subscriptions for %{public}@ %{public}@: %{public}@", (uint8_t *)&v19, 0x2Au);
    }

    v15 = 0;
    *a5 = 0;
  }

  return v15;
}

- (void)downloadStatusForSubscriber:(id)a3 subscriptionName:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  id *v18;
  _QWORD v19[4];
  _QWORD v20[3];
  _QWORD block[4];
  _QWORD v22[2];
  _QWORD v23[3];
  uint64_t v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    +[UAFAssetSetManager getConcurrentQueue](UAFAssetSetManager, "getConcurrentQueue");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  -[UAFAssetSetManager assetSetUsagesForStatusForSubscriber:subscriptionName:status:](self, "assetSetUsagesForStatusForSubscriber:subscriptionName:status:", v10, v11, &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[UAFTrialUpdateManager getTrialDownloadStatusForUsages:configurationManager:](UAFTrialUpdateManager, "getTrialDownloadStatusForUsages:configurationManager:", v14, v15);

    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __84__UAFAssetSetManager_downloadStatusForSubscriber_subscriptionName_queue_completion___block_invoke_2;
    v19[3] = &unk_24F1F8480;
    v20[1] = v23;
    v20[2] = v16;
    v20[0] = v13;
    +[UAFAutoAssetManager getDownloadStatusFromAssetSetUsages:configurationManager:queue:completion:](UAFAutoAssetManager, "getDownloadStatusFromAssetSetUsages:configurationManager:queue:completion:", v14, v17, v12, v19);
    v18 = (id *)v20;

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__UAFAssetSetManager_downloadStatusForSubscriber_subscriptionName_queue_completion___block_invoke;
    block[3] = &unk_24F1F8458;
    v18 = (id *)v22;
    v22[0] = v13;
    v22[1] = v23;
    dispatch_async(v12, block);
  }

  _Block_object_dispose(v23, 8);
}

uint64_t __84__UAFAssetSetManager_downloadStatusForSubscriber_subscriptionName_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __84__UAFAssetSetManager_downloadStatusForSubscriber_subscriptionName_queue_completion___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("autoasset");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("trial");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = +[UAFAssetSetManager coalesceDownloadStatus:](UAFAssetSetManager, "coalesceDownloadStatus:", v5);
  (*(void (**)(void))(a1[4] + 16))();

}

- (unint64_t)downloadStatusForSubscriber:(id)a3 subscriptionName:(id)a4
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  -[UAFAssetSetManager assetSetUsagesForStatusForSubscriber:subscriptionName:status:](self, "assetSetUsagesForStatusForSubscriber:subscriptionName:status:", a3, a4, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[UAFTrialUpdateManager getTrialDownloadStatusForUsages:configurationManager:](UAFTrialUpdateManager, "getTrialDownloadStatusForUsages:configurationManager:", v4, v5);

    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[UAFAutoAssetManager getDownloadStatusFromAssetSetUsages:configurationManager:](UAFAutoAssetManager, "getDownloadStatusFromAssetSetUsages:configurationManager:", v4, v7);

    v15[0] = CFSTR("autoasset");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("trial");
    v16[0] = v9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = +[UAFAssetSetManager coalesceDownloadStatus:](UAFAssetSetManager, "coalesceDownloadStatus:", v11);
    v14 = v12;

  }
  else
  {
    v12 = v14;
  }

  return v12;
}

+ (id)defaults
{
  if (qword_2540B1D98 != -1)
    dispatch_once(&qword_2540B1D98, &__block_literal_global_257);
  return (id)qword_2540B1DA0;
}

void __30__UAFAssetSetManager_defaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.UnifiedAssetFramework"));
  v1 = (void *)qword_2540B1DA0;
  qword_2540B1DA0 = v0;

}

+ (id)cacheDeleteDefaultsKeyForAutoAssetType:(id)a3 autoAssetSpecifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@-%@"), CFSTR("DisableCacheDelete"), a3, a4);
}

+ (void)disableCacheDelete:(BOOL)a3 forAutoAssetType:(id)a4 autoAssetSpecifier:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  BOOL v17;

  v7 = a4;
  v8 = a5;
  +[UAFAssetSetManager getSerialQueue](UAFAssetSetManager, "getSerialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__UAFAssetSetManager_disableCacheDelete_forAutoAssetType_autoAssetSpecifier___block_invoke;
  block[3] = &unk_24F1F7078;
  v15 = v7;
  v16 = v8;
  v17 = a3;
  v10 = v8;
  v13 = v7;
  dispatch_sync(v9, block);

  +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAssetSetManager configureAssetDelivery:configurationManager:lockIfUnchanged:](UAFAssetSetManager, "configureAssetDelivery:configurationManager:lockIfUnchanged:", v11, v12, 0);

}

void __77__UAFAssetSetManager_disableCacheDelete_forAutoAssetType_autoAssetSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[UAFAssetSetManager cacheDeleteDefaultsKeyForAutoAssetType:autoAssetSpecifier:](UAFAssetSetManager, "cacheDeleteDefaultsKeyForAutoAssetType:autoAssetSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 136315650;
      v12 = "+[UAFAssetSetManager disableCacheDelete:forAutoAssetType:autoAssetSpecifier:]_block_invoke";
      v13 = 2114;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s Cache delete disabled for type %{public}@ specifier %{public}@", (uint8_t *)&v11, 0x20u);
    }

    +[UAFAssetSetManager defaults](UAFAssetSetManager, "defaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBool:forKey:", *(unsigned __int8 *)(a1 + 48), v2);
  }
  else
  {
    if (v5)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 136315650;
      v12 = "+[UAFAssetSetManager disableCacheDelete:forAutoAssetType:autoAssetSpecifier:]_block_invoke";
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s Cache delete enabled for type %{public}@ specifier %{public}@", (uint8_t *)&v11, 0x20u);
    }

    +[UAFAssetSetManager defaults](UAFAssetSetManager, "defaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v2);
  }

}

+ (void)autoAssetDetailsForAssetNamed:(id)a3 assetSet:(id)a4 usages:(id)a5 autoAssetType:(id *)a6 autoAssetSpecifier:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id *v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getAssetSet:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 136315394;
    v30 = "+[UAFAssetSetManager autoAssetDetailsForAssetNamed:assetSet:usages:autoAssetType:autoAssetSpecifier:]";
    v31 = 2114;
    v32 = v12;
    v26 = "%s Failed to find configuration for asset set %{public}@'";
LABEL_15:
    _os_log_error_impl(&dword_229282000, v18, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
    goto LABEL_13;
  }
  objc_msgSend(v15, "autoAssetType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 136315394;
    v30 = "+[UAFAssetSetManager autoAssetDetailsForAssetNamed:assetSet:usages:autoAssetType:autoAssetSpecifier:]";
    v31 = 2114;
    v32 = v12;
    v26 = "%s Failed to find auto asset type for asset set %{public}@'";
    goto LABEL_15;
  }
  v28 = v13;
  objc_msgSend(v16, "getAutoAssets:", v13);
  v18 = objc_claimAutoreleasedReturnValue();
  -[NSObject objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v11);
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_8;
  v20 = (void *)v19;
  -[NSObject objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v11);
  v21 = a6;
  v22 = a7;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v16, "autoAssetType");
    *v21 = (id)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AssetSpecifier"));
    *v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "+[UAFAssetSetManager autoAssetDetailsForAssetNamed:assetSet:usages:autoAssetType:autoAssetSpecifier:]";
      v31 = 2114;
      v32 = v11;
      v33 = 2114;
      v34 = v12;
      _os_log_error_impl(&dword_229282000, v27, OS_LOG_TYPE_ERROR, "%s Failed to find auto asset specifier for asset %{public}@ in asset set %{public}@'", buf, 0x20u);
    }

  }
  v13 = v28;
LABEL_13:

}

+ (BOOL)cacheDeleteDisabledForAutoAssetType:(id)a3 autoAssetSpecifier:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  +[UAFAssetSetManager cacheDeleteDefaultsKeyForAutoAssetType:autoAssetSpecifier:](UAFAssetSetManager, "cacheDeleteDefaultsKeyForAutoAssetType:autoAssetSpecifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAssetSetManager defaults](UAFAssetSetManager, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", v4);

  return v6;
}

- (void)disableCacheDelete:(BOOL)a3 forAssetNamed:(id)a4 assetSet:(id)a5 usages:(id)a6 queue:(id)a7 completion:(id)a8
{
  _BOOL8 v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  _QWORD v45[4];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  const __CFString *v53;
  uint64_t v54;

  v12 = a3;
  v54 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (!v16)
  {
    +[UAFAssetSetManager getConcurrentQueue](UAFAssetSetManager, "getConcurrentQueue");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v42 = 0;
  v43 = 0;
  +[UAFAssetSetManager autoAssetDetailsForAssetNamed:assetSet:usages:autoAssetType:autoAssetSpecifier:](UAFAssetSetManager, "autoAssetDetailsForAssetNamed:assetSet:usages:autoAssetType:autoAssetSpecifier:", v13, v14, v15, &v43, &v42);
  v18 = v43;
  v19 = v42;
  v20 = v19;
  if (v18 && v19)
  {
    if (+[UAFAssetSetManager cacheDeleteDisabledForAutoAssetType:autoAssetSpecifier:](UAFAssetSetManager, "cacheDeleteDisabledForAutoAssetType:autoAssetSpecifier:", v18, v19) == v12)
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = CFSTR("NO");
        *(_DWORD *)buf = 136315906;
        v47 = "-[UAFAssetSetManager disableCacheDelete:forAssetNamed:assetSet:usages:queue:completion:]";
        v48 = 2114;
        v49 = v13;
        if (v12)
          v27 = CFSTR("YES");
        v50 = 2114;
        v51 = v14;
        v52 = 2114;
        v53 = v27;
        _os_log_impl(&dword_229282000, v26, OS_LOG_TYPE_DEFAULT, "%s Not changing cache delete disabled for asset %{public}@ in asset set %{public}@ as it is already %{public}@", buf, 0x2Au);
      }

      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_268;
      v35[3] = &unk_24F1F7D48;
      v36 = v17;
      dispatch_async(v16, v35);
      v22 = v36;
    }
    else
    {
      v45[0] = CFSTR("ConfigureCacheDelete");
      v44[0] = CFSTR("Operation");
      v44[1] = CFSTR("CacheDeleteDisabled");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v21;
      v45[2] = v18;
      v44[2] = CFSTR("AutoAssetType");
      v44[3] = CFSTR("AssetSpecifier");
      v45[3] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)objc_opt_new();
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_2;
      v31 = &unk_24F1F8208;
      v32 = v23;
      v34 = v17;
      v33 = v16;
      v24 = v23;
      v25 = (void *)MEMORY[0x22E2C6D60](&v28);
      objc_msgSend(v24, "operationWithConfig:completion:", v22, v25, v28, v29, v30, v31);

    }
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke;
    block[3] = &unk_24F1F8430;
    v38 = v13;
    v39 = v14;
    v40 = v15;
    v41 = v17;
    dispatch_async(v16, block);

    v22 = v38;
  }

}

void __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get auto asset configuration for asset %@ in asset set %@ with usages %@"), a1[4], a1[5], a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BDD0FD8];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[7] + 16))();
}

uint64_t __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_268(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_3;
    v6[3] = &unk_24F1F7A40;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)cacheDeleteDisabledForAssetNamed:(id)a3 assetSet:(id)a4 usages:(id)a5
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  +[UAFAssetSetManager autoAssetDetailsForAssetNamed:assetSet:usages:autoAssetType:autoAssetSpecifier:](UAFAssetSetManager, "autoAssetDetailsForAssetNamed:assetSet:usages:autoAssetType:autoAssetSpecifier:", a3, a4, a5, &v12, &v11);
  v5 = v12;
  v6 = v11;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = v8
    || +[UAFAssetSetManager cacheDeleteDisabledForAutoAssetType:autoAssetSpecifier:](UAFAssetSetManager, "cacheDeleteDisabledForAutoAssetType:autoAssetSpecifier:", v5, v6);

  return v9;
}

- (BOOL)assetDeliveryReady
{
  return objc_msgSend(MEMORY[0x24BE66BB8], "hasStartupActivatedCompletedOnce");
}

- (NSMutableSet)assetSetObservers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAssetSetObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetObservers, 0);
}

@end
