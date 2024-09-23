@implementation TVRViewServiceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_19);
  return (id)sharedInstance_sharedInstance;
}

void __39__TVRViewServiceManager_sharedInstance__block_invoke()
{
  TVRViewServiceManager *v0;
  void *v1;

  v0 = objc_alloc_init(TVRViewServiceManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (BOOL)canLaunchAsAnApp
{
  return GestaltGetDeviceClass() != 3;
}

- (void)presentWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  char *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  os_signpost_id_t v48;
  _QWORD v49[5];
  _QWORD v50[4];
  _QWORD v51[4];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIViewServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v53 = "-[TVRViewServiceManager presentWithContext:]";
    v54 = 2114;
    v55 = v6;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s: context=%{public}@", buf, 0x16u);

  }
  v7 = objc_msgSend(CFSTR("com.apple.TVRemoteUI.Instrumentation"), "hash");
  _TVRUISignpostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21B042000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TVRemoteUIAlertLaunch", "PresentWithContext", buf, 2u);
  }

  if (-[TVRViewServiceManager canLaunchAsAnApp](self, "canLaunchAsAnApp"))
  {
    _TVRUIViewServiceLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, "Launching TVRemote App", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("tvremote://"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BE38320];
    v50[0] = *MEMORY[0x24BE38310];
    v50[1] = v12;
    v51[0] = MEMORY[0x24BDBD1C8];
    v51[1] = MEMORY[0x24BDBD1C8];
    v13 = *MEMORY[0x24BE382F8];
    v51[2] = v11;
    v14 = *MEMORY[0x24BE382E8];
    v50[2] = v13;
    v50[3] = v14;
    objc_msgSend(v4, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x24BDC15A0]);
    objc_msgSend(v17, "setFrontBoardOptions:", v16);
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __44__TVRViewServiceManager_presentWithContext___block_invoke;
    v49[3] = &unk_24DE2D8A0;
    v49[4] = self;
    objc_msgSend(v18, "openApplicationWithBundleIdentifier:usingConfiguration:completionHandler:", CFSTR("com.apple.TVRemoteUIService"), v17, v49);

    _TVRUISignpostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21B042000, v20, OS_SIGNPOST_INTERVAL_END, v7, "TVRemoteUIAlertLaunch", "AnimationEnded", buf, 2u);
    }

  }
  else
  {
    if (GestaltGetDeviceClass() == 1)
    {
      _TVRUIViewServiceLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[TVRViewServiceManager presentWithContext:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0AE8]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.TVRemoteUIService"), CFSTR("TVRemoteAlertViewController"));
    v16 = objc_alloc_init(MEMORY[0x24BEB0AD0]);
    -[TVRViewServiceManager lastActiveEndpointIdentifier](self, "lastActiveEndpointIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[TVRViewServiceManager lastActiveEndpointIdentifier](self, "lastActiveEndpointIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLastActiveEndpointIdentifier:", v30);

    }
    objc_msgSend(v4, "userInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserInfo:", v31);

    _TVRUIViewServiceLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "userInfo");
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v33;
      _os_log_impl(&dword_21B042000, v32, OS_LOG_TYPE_DEFAULT, "View service manager set userInfo %{public}@", buf, 0xCu);

    }
    v17 = (id)objc_msgSend(MEMORY[0x24BEB0AF8], "newHandleWithDefinition:configurationContext:", v11, v16);
    objc_msgSend(v17, "registerObserver:", self);
    v34 = objc_alloc_init(MEMORY[0x24BEB0AC8]);
    if (objc_msgSend(v4, "launchContext") == 9 || objc_msgSend(v4, "launchContext") == 7)
    {
      objc_msgSend(v34, "setActivatingForSiri:", 1);
      _TVRUIViewControllerLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = objc_msgSend(v4, "launchContext");
        *(_DWORD *)buf = 134217984;
        v53 = (const char *)v36;
        _os_log_impl(&dword_21B042000, v35, OS_LOG_TYPE_DEFAULT, "Setting activatingForSiri flag to YES. Launch Context %ld", buf, 0xCu);
      }

    }
    v37 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    objc_msgSend(v4, "presentationAnimations");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      _TVRUIViewServiceLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v39, OS_LOG_TYPE_DEFAULT, "View service manager client set presentation animations", buf, 2u);
      }

      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __44__TVRViewServiceManager_presentWithContext___block_invoke_26;
      v46[3] = &unk_24DE2D2C0;
      v47 = v4;
      v48 = v7;
      -[TVRViewServiceManager _actionForSetting:animationBlock:](self, "_actionForSetting:animationBlock:", 1, v46);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
        objc_msgSend(v37, "addObject:", v40);

    }
    objc_msgSend(v4, "dismissalAnimations");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      _TVRUIViewServiceLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v42, OS_LOG_TYPE_DEFAULT, "View service manager client set dismissal animations", buf, 2u);
      }

      objc_msgSend(v4, "dismissalAnimations");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRViewServiceManager _actionForSetting:animationBlock:](self, "_actionForSetting:animationBlock:", 2, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
        objc_msgSend(v37, "addObject:", v44);

    }
    if (objc_msgSend(v37, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v37);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setActions:", v45);

    }
    objc_msgSend(v17, "activateWithContext:", v34);
    -[TVRViewServiceManager setAlertHandle:](self, "setAlertHandle:", v17);

  }
}

void __44__TVRViewServiceManager_presentWithContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _TVRUIViewServiceLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__TVRViewServiceManager_presentWithContext___block_invoke_cold_1(a1, (uint64_t)v4, v5);

  }
}

void __44__TVRViewServiceManager_presentWithContext___block_invoke_26(uint64_t a1)
{
  void (**v2)(void);
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "presentationAnimations");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

  _TVRUISignpostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_21B042000, v4, OS_SIGNPOST_INTERVAL_END, v5, "TVRemoteUIAlertLaunch", "AnimationEnded", v6, 2u);
  }

}

- (void)dismiss
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewServiceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[TVRViewServiceManager dismiss]";
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[TVRViewServiceManager alertHandle](self, "alertHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVRViewServiceManager alertHandle](self, "alertHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterObserver:", self);

    -[TVRViewServiceManager alertHandle](self, "alertHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[TVRViewServiceManager setAlertHandle:](self, "setAlertHandle:", 0);
  }
}

- (void)prewarm
{
  -[TVRViewServiceManager _prewarmWithLaunchViewService:fetchActiveEndpoint:](self, "_prewarmWithLaunchViewService:fetchActiveEndpoint:", 0, 1);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIViewServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[TVRViewServiceManager remoteAlertHandleDidDeactivate:]";
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[TVRViewServiceManager alertHandle](self, "alertHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    -[TVRViewServiceManager alertHandle](self, "alertHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unregisterObserver:", self);

    -[TVRViewServiceManager setAlertHandle:](self, "setAlertHandle:", 0);
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a4;
  _TVRUIViewServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[TVRViewServiceManager remoteAlertHandle:didInvalidateWithError:].cold.1((uint64_t)v5, v6, v7);

  -[TVRViewServiceManager setAlertHandle:](self, "setAlertHandle:", 0);
}

- (id)_actionForSetting:(unint64_t)a3 animationBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v6, "setObject:forSetting:", &unk_24DE4DE58, a3);
  v7 = (void *)MEMORY[0x24BE0BD88];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__TVRViewServiceManager__actionForSetting_animationBlock___block_invoke;
  v12[3] = &unk_24DE2D8C8;
  v13 = v5;
  v8 = v5;
  objc_msgSend(v7, "responderWithHandler:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BD80]), "initWithInfo:responder:", v6, v9);

  return v10;
}

uint64_t __58__TVRViewServiceManager__actionForSetting_animationBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  _TVRUIViewServiceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21B042000, v2, OS_LOG_TYPE_DEFAULT, "View service manager executing client animations", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_settingNameForValue:(unint64_t)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("Presentation");
  if (a3 == 2)
  {
    v3 = CFSTR("Dismissal");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%ld)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_prewarmWithLaunchViewService:(BOOL)a3 fetchActiveEndpoint:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a4;
  v5 = a3;
  _TVRUIPrewarmLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "TVRViewServiceManager", v8, 2u);
  }

  if (v5 && !-[TVRViewServiceManager canLaunchAsAnApp](self, "canLaunchAsAnApp"))
    -[TVRViewServiceManager _launchViewServiceSuspended](self, "_launchViewServiceSuspended");
  if (v4)
    -[TVRViewServiceManager _fetchActiveEndpointUID](self, "_fetchActiveEndpointUID");
}

- (void)_fetchActiveEndpointUID
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[4];
  id v8;
  id buf[2];

  _TVRUIPrewarmLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Fetching active endpoint", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4 = (void *)MEMORY[0x24BEB4080];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__TVRViewServiceManager__fetchActiveEndpointUID__block_invoke;
  v7[3] = &unk_24DE2D8F0;
  objc_copyWeak(&v8, buf);
  objc_msgSend(v4, "fetchActiveEndpointUIDWithCompletion:", v7);
  _TVRUIPrewarmLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Cache last active endpoint", v6, 2u);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __48__TVRViewServiceManager__fetchActiveEndpointUID__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *WeakRetained;
  id *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 3, a2);
    _TVRUIPrewarmLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Last active endpoint %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)_launchViewServiceSuspended
{
  OUTLINED_FUNCTION_0_2(&dword_21B042000, a1, a3, "Launching TVRemote app in susupended mode unsupported", a5, a6, a7, a8, 0);
}

void __52__TVRViewServiceManager__launchViewServiceSuspended__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    _TVRUIPrewarmLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__TVRViewServiceManager__launchViewServiceSuspended__block_invoke_cold_1((uint64_t)v3, v4);

  }
}

- (TVRViewServiceConfigContext)viewServiceContext
{
  return self->_viewServiceContext;
}

- (void)setViewServiceContext:(id)a3
{
  objc_storeStrong((id *)&self->_viewServiceContext, a3);
}

- (SBSRemoteAlertHandle)alertHandle
{
  return self->_alertHandle;
}

- (void)setAlertHandle:(id)a3
{
  objc_storeStrong((id *)&self->_alertHandle, a3);
}

- (NSString)lastActiveEndpointIdentifier
{
  return self->_lastActiveEndpointIdentifier;
}

- (void)setLastActiveEndpointIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveEndpointIdentifier, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_viewServiceContext, 0);
}

- (void)presentWithContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21B042000, a1, a3, "Unsupported! - Launching as a view service", a5, a6, a7, a8, 0);
}

void __44__TVRViewServiceManager_presentWithContext___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7 = 138543618;
  v8 = (id)objc_opt_class();
  v9 = 2114;
  v10 = a2;
  v5 = v8;
  OUTLINED_FUNCTION_1_2(&dword_21B042000, a3, v6, "%{public}@: Error opening TV Remote: %{public}@", (uint8_t *)&v7);

}

- (void)remoteAlertHandle:(uint64_t)a3 didInvalidateWithError:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[TVRViewServiceManager remoteAlertHandle:didInvalidateWithError:]";
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_1_2(&dword_21B042000, a2, a3, "%s error=%{public}@", (uint8_t *)&v3);
}

void __52__TVRViewServiceManager__launchViewServiceSuspended__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21B042000, a2, OS_LOG_TYPE_ERROR, "View service error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
