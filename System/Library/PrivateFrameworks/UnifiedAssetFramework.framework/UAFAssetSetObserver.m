@implementation UAFAssetSetObserver

+ (id)getConcurrentQueue
{
  if (_MergedGlobals_2 != -1)
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_4);
  return (id)qword_2540B1C58;
}

void __41__UAFAssetSetObserver_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFAssetSetObserver.Concurrent", MEMORY[0x24BDAC9C0]);
  v1 = (void *)qword_2540B1C58;
  qword_2540B1C58 = (uint64_t)v0;

}

+ (id)getSerialQueue
{
  if (qword_2540B1C60 != -1)
    dispatch_once(&qword_2540B1C60, &__block_literal_global_183);
  return (id)qword_2540B1C68;
}

void __37__UAFAssetSetObserver_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFAssetSetObserver.Serial", 0);
  v1 = (void *)qword_2540B1C68;
  qword_2540B1C68 = (uint64_t)v0;

}

+ (id)notificationForAssetSet:(id)a3 forRoot:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.siri.uaf"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v5, CFSTR("root"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

+ (BOOL)sendUAFNotificationForAssetSet:(id)a3 forRoot:(BOOL)a4
{
  void *v4;
  NSObject *v5;
  id v6;
  uint32_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[UAFAssetSetObserver notificationForAssetSet:forRoot:](UAFAssetSetObserver, "notificationForAssetSet:forRoot:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "+[UAFAssetSetObserver sendUAFNotificationForAssetSet:forRoot:]";
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_229282000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending notification %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v6 = objc_retainAutorelease(v4);
  v7 = notify_post((const char *)objc_msgSend(v6, "UTF8String"));
  if (v7)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315650;
      v11 = "+[UAFAssetSetObserver sendUAFNotificationForAssetSet:forRoot:]";
      v12 = 2112;
      v13 = v6;
      v14 = 2048;
      v15 = v7;
      _os_log_error_impl(&dword_229282000, v8, OS_LOG_TYPE_ERROR, "%s notify_post to %@ failed: %lu", (uint8_t *)&v10, 0x20u);
    }

  }
  return v7 == 0;
}

+ (int)listenForNotification:(id)a3 queue:(id)a4 updateHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  id v12;
  id v13;
  uint32_t v14;
  NSObject *v15;
  int v16;
  _QWORD handler[4];
  id v19;
  id v20;
  int out_token;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  out_token = -1;
  v9 = objc_retainAutorelease(v7);
  v10 = a4;
  v11 = (const char *)objc_msgSend(v9, "UTF8String");
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __65__UAFAssetSetObserver_listenForNotification_queue_updateHandler___block_invoke;
  handler[3] = &unk_24F1F7AB8;
  v12 = v9;
  v19 = v12;
  v20 = v8;
  v13 = v8;
  v14 = notify_register_dispatch(v11, &out_token, v10, handler);

  if (v14)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "+[UAFAssetSetObserver listenForNotification:queue:updateHandler:]";
      v24 = 2112;
      v25 = v12;
      v26 = 2048;
      v27 = v14;
      _os_log_error_impl(&dword_229282000, v15, OS_LOG_TYPE_ERROR, "%s notify_register_dispatch for %@ failed: %lu", buf, 0x20u);
    }

  }
  v16 = out_token;

  return v16;
}

uint64_t __65__UAFAssetSetObserver_listenForNotification_queue_updateHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "+[UAFAssetSetObserver listenForNotification:queue:updateHandler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s notification \"%@\" received", (uint8_t *)&v5, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (int)listenForUAFNotificationsForAssetSet:(id)a3 forRoot:(BOOL)a4 queue:(id)a5 updateHandler:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  +[UAFAssetSetObserver notificationForAssetSet:forRoot:](UAFAssetSetObserver, "notificationForAssetSet:forRoot:", a3, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = +[UAFAssetSetObserver listenForNotification:queue:updateHandler:](UAFAssetSetObserver, "listenForNotification:queue:updateHandler:", v11, v10, v9);

  return (int)a3;
}

+ (int)listenForMAStartupNotification:(id)a3 updateHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;

  v5 = (void *)MEMORY[0x24BE66BC0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "notifyRegistrationName:forAssetType:", CFSTR("STARTUP_ACTIVATED"), CFSTR("com.apple.MobileAsset.MAAutoAsset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[UAFAssetSetObserver listenForNotification:queue:updateHandler:](UAFAssetSetObserver, "listenForNotification:queue:updateHandler:", v8, v7, v6);

  return v9;
}

- (UAFAssetSetObserver)initWithAssetSet:(id)a3 queue:(id)a4 updateHandler:(id)a5
{
  return -[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:](self, "initWithAssetSet:configurationDirURLs:queue:updateHandler:", a3, 0, a4, a5);
}

- (UAFAssetSetObserver)initWithAssetSet:(id)a3 configurationDirURLs:(id)a4 queue:(id)a5 updateHandler:(id)a6
{
  UAFAssetSetObserver *v11;
  UAFConfigurationManager *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id updateHandler;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSDate *namespaceUpdateDate;
  uint64_t v33;
  NSMutableSet *namespacesToIgnore;
  uint64_t v35;
  NSMutableArray *namespaceTokens;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  int v48;
  int v49;
  UAFAssetSetObserver *v50;
  NSObject *v51;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  NSSet *obj;
  id v63;
  void *v64;
  UAFAssetSetObserver *val;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  id location;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  _BYTE v85[128];
  uint8_t v86[128];
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v60 = a3;
  v59 = a4;
  v61 = a5;
  v57 = a6;
  v84.receiver = self;
  v84.super_class = (Class)UAFAssetSetObserver;
  v11 = -[UAFAssetSetObserver init](&v84, sel_init);
  val = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetSetName, a3);
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      v12 = -[UAFConfigurationManager initWithURLs:]([UAFConfigurationManager alloc], "initWithURLs:", v59);

      v58 = v12;
    }
    v13 = (void *)MEMORY[0x22E2C6BC8]();
    objc_msgSend(v58, "getAssetSet:", v60);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]";
        v89 = 2114;
        v90 = v60;
        _os_log_error_impl(&dword_229282000, v51, OS_LOG_TYPE_ERROR, "%s Could not init asset set %{public}@ for observer", buf, 0x16u);
      }

      objc_autoreleasePoolPop(v13);
      v50 = 0;
      goto LABEL_44;
    }
    objc_msgSend(v14, "getTrialAssets:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16 || !objc_msgSend(v16, "count"))
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]";
        v89 = 2114;
        v90 = v60;
        _os_log_impl(&dword_229282000, v18, OS_LOG_TYPE_DEFAULT, "%s No trial assets for asset set %{public}@ for observer", buf, 0x16u);
      }

    }
    objc_autoreleasePoolPop(v13);
    if (!v61)
    {
      +[UAFAssetSetObserver getConcurrentQueue](UAFAssetSetObserver, "getConcurrentQueue");
      v61 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = MEMORY[0x22E2C6D60](v57);
    updateHandler = val->_updateHandler;
    val->_updateHandler = (id)v19;

    v21 = (void *)objc_opt_new();
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v22 = v17;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v81 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
          objc_msgSend(v22, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("TrialNamespace"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", v26);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("TrialNamespace"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v30);

          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
      }
      while (v23);
    }

    objc_storeStrong((id *)&val->_namespaces, v21);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v31 = objc_claimAutoreleasedReturnValue();
    namespaceUpdateDate = val->_namespaceUpdateDate;
    val->_namespaceUpdateDate = (NSDate *)v31;

    v33 = objc_opt_new();
    namespacesToIgnore = val->_namespacesToIgnore;
    val->_namespacesToIgnore = (NSMutableSet *)v33;

    v35 = objc_opt_new();
    namespaceTokens = val->_namespaceTokens;
    val->_namespaceTokens = (NSMutableArray *)v35;

    objc_initWeak(&location, val);
    v75[0] = MEMORY[0x24BDAC760];
    v75[1] = 3221225472;
    v75[2] = __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke;
    v75[3] = &unk_24F1F7AE0;
    v61 = v61;
    v76 = v61;
    objc_copyWeak(&v78, &location);
    v63 = v60;
    v77 = v63;
    v64 = (void *)MEMORY[0x22E2C6D60](v75);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = val->_namespaces;
    v37 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v72;
      while (2)
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v72 != v38)
            objc_enumerationMutation(obj);
          v40 = *(id *)(*((_QWORD *)&v71 + 1) + 8 * j);
          v66[0] = MEMORY[0x24BDAC760];
          v66[1] = 3221225472;
          v66[2] = __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke_199;
          v66[3] = &unk_24F1F7B08;
          objc_copyWeak(&v70, &location);
          v41 = v40;
          v67 = v41;
          v68 = v63;
          v69 = v64;
          v42 = (void *)MEMORY[0x22E2C6D60](v66);
          v43 = (void *)MEMORY[0x24BEBA938];
          +[UAFAssetSetObserver getSerialQueue](UAFAssetSetObserver, "getSerialQueue");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "registerUpdateForNamespaceName:queue:usingBlock:", v41, v44, v42);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            -[NSMutableArray addObject:](val->_namespaceTokens, "addObject:", v45);
          }
          else
          {
            UAFGetLogCategory((id *)&UAFLogContextClient);
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v88 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]";
              v89 = 2114;
              v90 = v41;
              _os_log_fault_impl(&dword_229282000, v46, OS_LOG_TYPE_FAULT, "%s Error registering update handler for %{public}@", buf, 0x16u);
            }

            UAFGetLogCategory((id *)&UAFLogContextClient);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            UAFFaultCapture((uint64_t)v47, (uint64_t)kUAFABCNotifyRegisterFailure, (uint64_t)CFSTR("trial"), 0);

          }
          objc_destroyWeak(&v70);

          if (!v45)
          {

            goto LABEL_39;
          }
        }
        v37 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
        if (v37)
          continue;
        break;
      }
    }

    v48 = +[UAFAssetSetObserver listenForUAFNotificationsForAssetSet:forRoot:queue:updateHandler:](UAFAssetSetObserver, "listenForUAFNotificationsForAssetSet:forRoot:queue:updateHandler:", v63, 0, v61, v64);
    val->_uafNotifyToken = v48;
    if (v48 == -1)
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]";
        v89 = 2114;
        v90 = v63;
        _os_log_fault_impl(&dword_229282000, v53, OS_LOG_TYPE_FAULT, "%s Error registering update handler for %{public}@", buf, 0x16u);
      }

      UAFGetLogCategory((id *)&UAFLogContextClient);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      UAFFaultCapture((uint64_t)v54, (uint64_t)kUAFABCNotifyRegisterFailure, (uint64_t)CFSTR("dtma"), 0);

    }
    else
    {
      v49 = +[UAFAssetSetObserver listenForMAStartupNotification:updateHandler:](UAFAssetSetObserver, "listenForMAStartupNotification:updateHandler:", v61, v64);
      val->_maStartupNotifyToken = v49;
      if (v49 != -1)
      {
        v50 = val;
LABEL_40:

        objc_destroyWeak(&v78);
        objc_destroyWeak(&location);

LABEL_44:
        goto LABEL_45;
      }
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]";
        v89 = 2114;
        v90 = v63;
        _os_log_fault_impl(&dword_229282000, v55, OS_LOG_TYPE_FAULT, "%s Error registering MA update handler for %{public}@", buf, 0x16u);
      }

      UAFGetLogCategory((id *)&UAFLogContextClient);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      UAFFaultCapture((uint64_t)v56, (uint64_t)kUAFABCNotifyRegisterFailure, (uint64_t)CFSTR("maStartup"), 0);

    }
LABEL_39:
    v50 = 0;
    goto LABEL_40;
  }
  v50 = 0;
LABEL_45:

  return v50;
}

void __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke_2;
  v3[3] = &unk_24F1F7950;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t)v3;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315394;
      v9 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]_block_invoke_2";
      v10 = 2114;
      v11 = v7;
      _os_log_error_impl(&dword_229282000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "%s Self is nil while calling Update notification for %{public}@", (uint8_t *)&v8, 0x16u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]_block_invoke";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_229282000, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "%s Update notification for %{public}@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(WeakRetained, "updateHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "updateHandler");
    v4 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(v4 + 16))();
LABEL_8:

  }
}

void __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke_199(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_msgSend(WeakRetained, "namespaceHasChanged:", *(_QWORD *)(a1 + 32));

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v10 = 136315650;
      v11 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]_block_invoke";
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s Issuing %{public}@ update notification due to %{public}@ update", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v5)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 136315650;
      v11 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]_block_invoke";
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s Skipping %{public}@ update notification from %{public}@ due to no actual change", (uint8_t *)&v10, 0x20u);
    }

  }
}

- (void)resetNamespacesToIgnore:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *namespacesToIgnore;
  NSObject *v7;
  NSString *assetSetName;
  int v9;
  const char *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", self->_namespaces);
  v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  namespacesToIgnore = self->_namespacesToIgnore;
  self->_namespacesToIgnore = v5;

  -[NSMutableSet removeObject:](self->_namespacesToIgnore, "removeObject:", v4);
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    assetSetName = self->_assetSetName;
    v9 = 136315650;
    v10 = "-[UAFAssetSetObserver resetNamespacesToIgnore:]";
    v11 = 2112;
    v12 = assetSetName;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, "%s Possible beginning of sequence of notifications to ignore while observing asset set %@, starting with update to namespace %@", (uint8_t *)&v9, 0x20u);
  }

}

- (BOOL)namespaceHasChanged:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *v6;
  NSDate *namespaceUpdateDate;
  double v8;
  NSObject *v9;
  NSString *assetSetName;
  BOOL v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_namespaceUpdateDate;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  namespaceUpdateDate = self->_namespaceUpdateDate;
  self->_namespaceUpdateDate = v6;

  -[NSDate timeIntervalSinceDate:](self->_namespaceUpdateDate, "timeIntervalSinceDate:", v5);
  if (v8 <= 5.0 && (-[NSMutableSet containsObject:](self->_namespacesToIgnore, "containsObject:", v4) & 1) != 0)
  {
    -[NSMutableSet removeObject:](self->_namespacesToIgnore, "removeObject:", v4);
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      assetSetName = self->_assetSetName;
      v13 = 136315650;
      v14 = "-[UAFAssetSetObserver namespaceHasChanged:]";
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = assetSetName;
      _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s Ignoring update to namespace %@ while observing asset set %@", (uint8_t *)&v13, 0x20u);
    }

    v11 = 0;
  }
  else
  {
    -[UAFAssetSetObserver resetNamespacesToIgnore:](self, "resetNamespacesToIgnore:", v4);
    v11 = 1;
  }

  return v11;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  notify_cancel(self->_uafNotifyToken);
  notify_cancel(self->_maStartupNotifyToken);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_namespaceTokens;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x24BEBA938], "deregisterUpdateWithToken:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)UAFAssetSetObserver;
  -[UAFAssetSetObserver dealloc](&v8, sel_dealloc);
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (void)setAssetSetName:(id)a3
{
  objc_storeStrong((id *)&self->_assetSetName, a3);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TRIClient)trial
{
  return self->_trial;
}

- (void)setTrial:(id)a3
{
  objc_storeStrong((id *)&self->_trial, a3);
}

- (NSSet)namespaces
{
  return self->_namespaces;
}

- (void)setNamespaces:(id)a3
{
  objc_storeStrong((id *)&self->_namespaces, a3);
}

- (NSDate)namespaceUpdateDate
{
  return self->_namespaceUpdateDate;
}

- (void)setNamespaceUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_namespaceUpdateDate, a3);
}

- (NSMutableSet)namespacesToIgnore
{
  return self->_namespacesToIgnore;
}

- (void)setNamespacesToIgnore:(id)a3
{
  objc_storeStrong((id *)&self->_namespacesToIgnore, a3);
}

- (int)uafNotifyToken
{
  return self->_uafNotifyToken;
}

- (void)setUafNotifyToken:(int)a3
{
  self->_uafNotifyToken = a3;
}

- (int)maStartupNotifyToken
{
  return self->_maStartupNotifyToken;
}

- (void)setMaStartupNotifyToken:(int)a3
{
  self->_maStartupNotifyToken = a3;
}

- (NSMutableArray)namespaceTokens
{
  return self->_namespaceTokens;
}

- (void)setNamespaceTokens:(id)a3
{
  objc_storeStrong((id *)&self->_namespaceTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceTokens, 0);
  objc_storeStrong((id *)&self->_namespacesToIgnore, 0);
  objc_storeStrong((id *)&self->_namespaceUpdateDate, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_trial, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
}

@end
