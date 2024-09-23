@implementation SESTapToRadar

+ (void)requestTapToRadar:(id)a3 client:(id)a4 fullArchive:(BOOL)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  _QWORD *v13;
  id v14;
  id v15;
  BOOL v16;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    +[SESTapToRadar getInstance](SESTapToRadar, "getInstance");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9[1];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __54__SESTapToRadar_requestTapToRadar_client_fullArchive___block_invoke;
      v12[3] = &unk_251CC61E0;
      v13 = v9;
      v14 = v7;
      v15 = v8;
      v16 = a5;
      dispatch_async(v11, v12);

    }
  }

}

uint64_t __54__SESTapToRadar_requestTapToRadar_client_fullArchive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestTapToRadarSync:client:fullArchive:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

+ (void)requestTapToRadar:(id)a3 client:(id)a4
{
  +[SESTapToRadar requestTapToRadar:client:fullArchive:](SESTapToRadar, "requestTapToRadar:client:fullArchive:", a3, a4, 0);
}

+ (id)getInstance
{
  if (getInstance_onceToken != -1)
    dispatch_once(&getInstance_onceToken, &__block_literal_global_0);
  return (id)getInstance_instance;
}

void __28__SESTapToRadar_getInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)getInstance_instance;
  getInstance_instance = v0;

}

- (SESTapToRadar)init
{
  SESTapToRadar *v2;
  Class v3;
  NSString *pendingRequestReason;
  NSString *pendingRequestClient;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSUserDefaults *userDefaults;
  SESTapToRadar *v12;
  NSObject *v13;
  const char *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)SESTapToRadar;
  v2 = -[SESTapToRadar init](&v16, sel_init);
  if (!v2)
    goto LABEL_5;
  if (!dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2))
  {
    SESDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v18 = "/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices";
      v14 = "Failed to dlopen %{public}s";
LABEL_10:
      _os_log_impl(&dword_24B9C8000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
    }
LABEL_11:

    v12 = 0;
    goto LABEL_12;
  }
  v3 = NSClassFromString(CFSTR("LSApplicationWorkspace"));
  v2->_lsApplicationWorkspace = v3;
  if (!v3)
  {
    SESDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = CFSTR("LSApplicationWorkspace");
      v14 = "Failed to get class %{public}@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  pendingRequestReason = v2->_pendingRequestReason;
  v2->_pendingRequestReason = 0;

  pendingRequestClient = v2->_pendingRequestClient;
  v2->_pendingRequestClient = 0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_DEFAULT, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create("com.apple.sesd.TTR", v7);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v8;

  v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.seserviced"));
  userDefaults = v2->_userDefaults;
  v2->_userDefaults = (NSUserDefaults *)v10;

LABEL_5:
  v12 = v2;
LABEL_12:

  return v12;
}

- (void)_requestTapToRadarSync:(id)a3 client:(id)a4 fullArchive:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFUserNotification *v23;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  NSObject *v26;
  NSDictionary *ttrOptions;
  NSDictionary *v28;
  NSObject *v29;
  __CFUserNotification *userNotification;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  SInt32 error;
  _QWORD v35[7];
  _QWORD v36[7];
  uint8_t buf[16];
  uint64_t v38;
  uint64_t v39;

  v5 = a5;
  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pendingRequestReason)
  {
    SESDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Discarding TTR request, already in flight";
LABEL_14:
      _os_log_impl(&dword_24B9C8000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    }
  }
  else
  {
    if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_251CC6200;
      v38 = 0;
      SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (SpringBoardServicesLibraryCore_frameworkLibrary
      && (getSBUserNotificationDismissOnLock(), v13 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v13,
                                                v13))
    {
      v32 = v5;
      -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("TTR-Prohibit-Until-ByClient"));
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14
        && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v14, "compare:", v15),
            v15,
            v16 == 1))
      {
        SESDefaultLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v18 = v14;
          *(_QWORD *)&buf[4] = v14;
          _os_log_impl(&dword_24B9C8000, v17, OS_LOG_TYPE_INFO, "TTR is prohibited until %{public}@", buf, 0xCu);
        }
        else
        {
          v18 = v14;
        }
      }
      else
      {
        v33 = v14;
        v19 = *MEMORY[0x24BDBD6E0];
        v35[0] = *MEMORY[0x24BDBD6D8];
        v35[1] = v19;
        v36[0] = CFSTR("SecureElementService Error Detected!");
        v36[1] = CFSTR("Please file a Radar");
        v20 = *MEMORY[0x24BDBD6F0];
        v35[2] = *MEMORY[0x24BDBD6F8];
        v35[3] = v20;
        v36[2] = CFSTR("File Radar");
        v36[3] = CFSTR("Not Now");
        v21 = *MEMORY[0x24BDBD6E8];
        v35[4] = *MEMORY[0x24BDBD718];
        v35[5] = v21;
        v36[4] = CFSTR("Never bother me again");
        v36[5] = MEMORY[0x24BDBD1C8];
        getSBUserNotificationDismissOnLock();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v35[6] = v22;
        v36[6] = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 7);
        v17 = objc_claimAutoreleasedReturnValue();

        error = 0;
        v23 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, (CFDictionaryRef)v17);
        self->_userNotification = v23;
        if (!v23 || error)
        {
          SESDefaultLogObject();
          v29 = objc_claimAutoreleasedReturnValue();
          v18 = v33;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = error;
            _os_log_impl(&dword_24B9C8000, v29, OS_LOG_TYPE_ERROR, "Couldn't create notification! %d", buf, 8u);
          }

          userNotification = self->_userNotification;
          if (userNotification)
            CFRelease(userNotification);
          self->_userNotification = 0;
        }
        else
        {
          RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v23, (CFUserNotificationCallBack)NFTTRUserNotificationCallback, 0);
          self->_runLoopSource = RunLoopSource;
          if (RunLoopSource)
          {
            Main = CFRunLoopGetMain();
            CFRunLoopAddSource(Main, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
            SESDefaultLogObject();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v10;
              _os_log_impl(&dword_24B9C8000, v26, OS_LOG_TYPE_INFO, "TTR prompt created for %@", buf, 0xCu);
            }

            objc_storeStrong((id *)&self->_pendingRequestClient, a4);
            objc_storeStrong((id *)&self->_pendingRequestReason, a3);
            ttrOptions = self->_ttrOptions;
            if (v32)
              v28 = (NSDictionary *)&unk_251CC8BE0;
            else
              v28 = (NSDictionary *)MEMORY[0x24BDBD1B8];
            self->_ttrOptions = v28;

          }
          else
          {
            SESDefaultLogObject();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_24B9C8000, v31, OS_LOG_TYPE_ERROR, "Couldn't create runloop source", buf, 2u);
            }

            CFRelease(self->_userNotification);
            self->_userNotification = 0;
          }
          v18 = v14;
        }
      }

    }
    else
    {
      SESDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v12 = "Missing SB notif key SBUserNotificationDismissOnLock";
        goto LABEL_14;
      }
    }
  }

}

- (void)_handleCallbackSync:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  NSString *pendingRequestClient;
  NSString *pendingRequestReason;
  NSObject *v10;
  NSObject *p_super;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  __CFRunLoop *Main;
  __CFRunLoopSource *runLoopSource;
  __CFUserNotification *userNotification;
  NSString *v36;
  NSString *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  NSString *v45;
  __int16 v46;
  NSString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pendingRequestClient)
  {
    if (a3 == 2)
    {
      SESDefaultLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        pendingRequestReason = self->_pendingRequestReason;
        pendingRequestClient = self->_pendingRequestClient;
        *(_DWORD *)buf = 138412546;
        v45 = pendingRequestClient;
        v46 = 2112;
        v47 = pendingRequestReason;
        _os_log_impl(&dword_24B9C8000, v7, OS_LOG_TYPE_INFO, "User canceled response for %@/%@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v10 = objc_claimAutoreleasedReturnValue();
      -[SESTapToRadar setProhibitUntil:forClient:](self, "setProhibitUntil:forClient:", v10, self->_pendingRequestClient);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 86400.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SESTapToRadar setProhibitUntil:forClient:](self, "setProhibitUntil:forClient:", v12, self->_pendingRequestClient);

      if (a3 == 1)
      {
        SESDefaultLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24B9C8000, v10, OS_LOG_TYPE_INFO, "NotNow response", buf, 2u);
        }
      }
      else
      {
        v38 = v6;
        objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("997328"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("SecureElementService"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

        objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("1.0"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

        objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Crash/Hang/Data Loss"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v16);

        objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v17);

        v18 = (void *)MEMORY[0x24BDD1838];
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SecureElementService TTR - %@"), self->_pendingRequestReason);
        objc_msgSend(v18, "queryItemWithName:value:", CFSTR("Title"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v20);

        objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Description"), self->_pendingRequestReason);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v21);

        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v22 = self->_ttrOptions;
        v23 = -[NSDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v40 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
              v28 = (void *)MEMORY[0x24BDD1838];
              -[NSDictionary objectForKeyedSubscript:](self->_ttrOptions, "objectForKeyedSubscript:", v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "queryItemWithName:value:", v27, v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v30);

            }
            v24 = -[NSDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          }
          while (v24);
        }

        v6 = v38;
        objc_msgSend(v38, "setScheme:", CFSTR("tap-to-radar"));
        objc_msgSend(v38, "setHost:", CFSTR("new"));
        objc_msgSend(v38, "setQueryItems:", v5);
        SESDefaultLogObject();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v45 = (NSString *)v38;
          _os_log_impl(&dword_24B9C8000, v31, OS_LOG_TYPE_INFO, "URL: %{public}@", buf, 0xCu);
        }

        -[objc_class defaultWorkspace](self->_lsApplicationWorkspace, "defaultWorkspace");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "URL");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject openURL:configuration:completionHandler:](v10, "openURL:configuration:completionHandler:", v32, 0, 0);

      }
    }

    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    runLoopSource = self->_runLoopSource;
    if (runLoopSource)
      CFRelease(runLoopSource);
    self->_runLoopSource = 0;
    userNotification = self->_userNotification;
    if (userNotification)
      CFRelease(userNotification);
    self->_userNotification = 0;
    v36 = self->_pendingRequestClient;
    self->_pendingRequestClient = 0;

    v37 = self->_pendingRequestReason;
    self->_pendingRequestReason = 0;

    p_super = &self->_ttrOptions->super;
    self->_ttrOptions = 0;
  }
  else
  {
    SESDefaultLogObject();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B9C8000, p_super, OS_LOG_TYPE_ERROR, "Ignoring TTR callback with no pending request", buf, 2u);
    }
  }

}

- (void)setProhibitUntil:(id)a3 forClient:(id)a4
{
  NSUserDefaults *userDefaults;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  userDefaults = self->_userDefaults;
  v7 = a4;
  v8 = a3;
  -[NSUserDefaults objectForKey:](userDefaults, "objectForKey:", CFSTR("TTR-Prohibit-Until-ByClient"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_opt_new();
  v13 = v12;

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v7);
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v13, CFSTR("TTR-Prohibit-Until-ByClient"));
  -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");

}

+ (void)handleCallback:(unint64_t)a3
{
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  unint64_t v9;

  +[SESTapToRadar getInstance](SESTapToRadar, "getInstance");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4[1];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __32__SESTapToRadar_handleCallback___block_invoke;
    v7[3] = &unk_251CC6190;
    v8 = v4;
    v9 = a3;
    dispatch_async(v6, v7);

  }
}

uint64_t __32__SESTapToRadar_handleCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCallbackSync:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_ttrOptions, 0);
  objc_storeStrong((id *)&self->_pendingRequestClient, 0);
  objc_storeStrong((id *)&self->_pendingRequestReason, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
