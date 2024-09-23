@implementation SOSInCallUILauncher

+ (SOSInCallUILauncher)sharedInCallUILauncher
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SOSInCallUILauncher_sharedInCallUILauncher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInCallUILauncher_onceToken != -1)
    dispatch_once(&sharedInCallUILauncher_onceToken, block);
  return (SOSInCallUILauncher *)(id)sharedInCallUILauncher_sInCallUILauncher;
}

void __45__SOSInCallUILauncher_sharedInCallUILauncher__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInCallUILauncher_sInCallUILauncher;
  sharedInCallUILauncher_sInCallUILauncher = (uint64_t)v1;

}

- (void)launchInCallUIForReason:(int64_t)a3 withRequestURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SOSProcessObserver *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, void *);
  void *v30;
  id v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  int64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  sos_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v36 = a3;
    _os_log_impl(&dword_1AF4DC000, v10, OS_LOG_TYPE_DEFAULT, "launched for reason: %ld", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "SOSRemoteAlertActivationReasonForSOSInCallUILaunchReason:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 1:
    case 2:
    case 4:
      v12 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      -[NSObject setScheme:](v12, "setScheme:", CFSTR("telSOS"));
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("reason"), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setQueryItems:](v12, "setQueryItems:", v14);

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject URL](v12, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __73__SOSInCallUILauncher_launchInCallUIForReason_withRequestURL_completion___block_invoke;
      v30 = &unk_1E5F76970;
      v31 = v9;
      objc_msgSend(v15, "openURL:configuration:completionHandler:", v16, 0, &v27);

      -[SOSInCallUILauncher processObserver](self, "processObserver", v27, v28, v29, v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18 = -[SOSProcessObserver initWithBundleIdentifier:]([SOSProcessObserver alloc], "initWithBundleIdentifier:", CFSTR("com.apple.InCallService"));
        -[SOSInCallUILauncher setProcessObserver:](self, "setProcessObserver:", v18);

      }
      -[SOSInCallUILauncher processObserver](self, "processObserver");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDelegate:", self);

      goto LABEL_14;
    case 3:
      v20 = objc_alloc(MEMORY[0x1E0DAAF78]);
      TUInCallRemoteAlertViewControllerClassName();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v20, "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.InCallService"), v21);

      objc_msgSend(MEMORY[0x1E0DAAF88], "lookupHandlesForDefinition:creatingIfNone:", v12, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "addObserver:", self);
      v24 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
      objc_msgSend(v24, "setReason:", v11);
      if (v8)
      {
        objc_msgSend(v8, "absoluteString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "length"))
        {
          v32 = CFSTR("SOSRemoteAlertActivationContextUserInfoRequestURLString");
          v33 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setUserInfo:", v26);

        }
      }
      objc_msgSend(v23, "activateWithContext:", v24);

      goto LABEL_14;
    case 5:
      sos_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SOSInCallUILauncher launchInCallUIForReason:withRequestURL:completion:].cold.1(v12);
LABEL_14:

      break;
    default:
      break;
  }

}

void __73__SOSInCallUILauncher_launchInCallUIForReason_withRequestURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__SOSInCallUILauncher_launchInCallUIForReason_withRequestURL_completion___block_invoke_2;
  v6[3] = &unk_1E5F761B8;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __73__SOSInCallUILauncher_launchInCallUIForReason_withRequestURL_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "Launched SOS URL with error: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

+ (id)SOSRemoteAlertActivationReasonForSOSInCallUILaunchReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("SOSRemoteAlertAcivationReasonNone");
  else
    return off_1E5F76E90[a3 - 1];
}

- (void)processObserver:(id)a3 bundleIdentifier:(id)a4 didUpdateApplicationRunning:(BOOL)a5
{
  void *v5;

  if (!a5)
  {
    -[SOSInCallUILauncher processObserver](self, "processObserver", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_9);
  }
}

void __84__SOSInCallUILauncher_processObserver_bundleIdentifier_didUpdateApplicationRunning___block_invoke()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  sos_default_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1AF4DC000, v0, OS_LOG_TYPE_DEFAULT, "InCallService process has stopped running, setting current sos initiation state to idle", v2, 2u);
  }

  +[SOSManager sharedInstance](SOSManager, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCurrentSOSInitiationState:", 0);

}

- (SOSProcessObserver)processObserver
{
  return self->_processObserver;
}

- (void)setProcessObserver:(id)a3
{
  objc_storeStrong((id *)&self->_processObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processObserver, 0);
}

- (void)launchInCallUIForReason:(os_log_t)log withRequestURL:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF4DC000, log, OS_LOG_TYPE_ERROR, "Unexpected attempt to launch in-call UI with SOSInCallUILaunchReasonSOSAlertRestingScreen", v1, 2u);
}

@end
