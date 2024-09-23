@implementation TFBetaLaunchHandle

- (TFBetaLaunchHandle)initWithProcessHandle:(id)a3
{
  id v5;
  TFBetaLaunchHandle *v6;
  TFBetaLaunchHandle *v7;
  uint64_t v8;
  NSString *logKey;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFBetaLaunchHandle;
  v6 = -[TFBetaLaunchHandle init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processHandle, a3);
    AMSGenerateLogCorrelationKey();
    v8 = objc_claimAutoreleasedReturnValue();
    logKey = v7->_logKey;
    v7->_logKey = (NSString *)v8;

  }
  return v7;
}

- (void)activateIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[TFBetaLaunchHandle logKey](self, "logKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaLaunchHandle processHandle](self, "processHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v5;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_2174E1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: activateIfNeeded bundleId = %@", (uint8_t *)&v18, 0x20u);

  }
  -[TFBetaLaunchHandle processHandle](self, "processHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getLaunchInfoForBundleID:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[TFBetaLaunchHandle _remoteAlertShouldActivateForLaunchInfo:](self, "_remoteAlertShouldActivateForLaunchInfo:", v13))
    {
      -[TFBetaLaunchHandle _activateRemoteAlertWithLaunchInfo:](self, "_activateRemoteAlertWithLaunchInfo:", v13);
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  -[TFBetaLaunchHandle activationDelegate](self, "activationDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[TFBetaLaunchHandle activationDelegate](self, "activationDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "betaLaunchHandle:activateIfNeededEndedWithResult:", self, v14);

  }
}

- (BOOL)_remoteAlertShouldActivateForLaunchInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[TFBetaLaunchHandle logKey](self, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v7;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: _remoteAlertShouldActivateForLaunchInfo launchInfo=%@", (uint8_t *)&v25, 0x20u);

  }
  if (!v4)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "generatedLogger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class();
      v15 = v18;
      -[TFBetaLaunchHandle logKey](self, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v18;
      v27 = 2112;
      v28 = v16;
      v17 = "%{public}@ [%@]: _remoteAlertShouldActivateForLaunchInfo: Not activating - Unconfigured launch info";
      goto LABEL_12;
    }
LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend(v4, "isLaunchScreenEnabled") & 1) == 0)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "generatedLogger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_opt_class();
      v15 = v19;
      -[TFBetaLaunchHandle logKey](self, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = v16;
      v17 = "%{public}@ [%@]: _remoteAlertShouldActivateForLaunchInfo: Not activating - Launch screen disabled";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v4, "lastWelcomeScreenViewDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generatedLogger");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      -[TFBetaLaunchHandle logKey](self, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v14;
      v27 = 2112;
      v28 = v16;
      v17 = "%{public}@ [%@]: _remoteAlertShouldActivateForLaunchInfo: Not activating - Launch screen seen";
LABEL_12:
      _os_log_impl(&dword_2174E1000, v12, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v25, 0x16u);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v13)
  {
    v22 = (void *)objc_opt_class();
    v23 = v22;
    -[TFBetaLaunchHandle logKey](self, "logKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v22;
    v27 = 2112;
    v28 = v24;
    _os_log_impl(&dword_2174E1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: _remoteAlertShouldActivateForLaunchInfo: Activating", (uint8_t *)&v25, 0x16u);

  }
  v20 = 1;
LABEL_14:

  return v20;
}

- (void)_activateRemoteAlertWithLaunchInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  TFBetaLaunchHandleConfiguration *v12;
  void *v13;
  void *v14;
  TFBetaLaunchHandleConfiguration *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[TFBetaLaunchHandle logKey](self, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v7;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: _activateRemoteAlertWithLaunchInfo launchInfo = %@", (uint8_t *)&v22, 0x20u);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0AE8]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.ios.StoreKitUIService"), CFSTR("ServiceTFBetaLaunchHostViewController"));
  v11 = objc_alloc_init(MEMORY[0x24BEB0AD0]);
  v12 = [TFBetaLaunchHandleConfiguration alloc];
  -[TFBetaLaunchHandle processHandle](self, "processHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TFBetaLaunchHandleConfiguration initWithBundleIdentifier:preloadingLaunchInfo:](v12, "initWithBundleIdentifier:preloadingLaunchInfo:", v14, v4);

  -[TFBetaLaunchHandleConfiguration encodedAsUserInfo](v15, "encodedAsUserInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInfo:", v16);

  v17 = (void *)objc_msgSend(MEMORY[0x24BEB0AF8], "newHandleWithDefinition:configurationContext:", v10, v11);
  objc_msgSend(v17, "addObserver:", self);
  v18 = objc_alloc_init(MEMORY[0x24BEB0AC8]);
  v19 = objc_alloc(MEMORY[0x24BEB0B08]);
  -[TFBetaLaunchHandle processHandle](self, "processHandle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithTargetProcess:", v20);
  objc_msgSend(v18, "setPresentationTarget:", v21);

  objc_msgSend(v17, "activateWithContext:", v18);
  -[TFBetaLaunchHandle _updatedLaunchInfoForActivation:](self, "_updatedLaunchInfoForActivation:", v4);

}

- (void)_updatedLaunchInfoForActivation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[TFBetaLaunchHandle logKey](self, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: _updatedLaunchInfoForActivation launchInfo = %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastWelcomeScreenViewDate:", v10);

  objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__TFBetaLaunchHandle__updatedLaunchInfoForActivation___block_invoke;
  v13[3] = &unk_24D794500;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v11, "setLaunchInfo:withCompletionHandler:", v12, v13);

}

void __54__TFBetaLaunchHandle__updatedLaunchInfoForActivation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generatedLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_opt_class();
      v7 = *(void **)(a1 + 40);
      v8 = v6;
      objc_msgSend(v7, "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v6;
      v14 = 2114;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_2174E1000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update launch info after activation. error = %@", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[TFBetaLaunchHandle logKey](self, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: remoteAlertHandleDidDeactivate", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generatedLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    -[TFBetaLaunchHandle logKey](self, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v10;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_2174E1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: remoteAlertHandle:didInvalidateWithError error=%@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(v7, "removeObserver:", self);

}

- (TFBetaLaunchHandleActivationDelegate)activationDelegate
{
  return (TFBetaLaunchHandleActivationDelegate *)objc_loadWeakRetained((id *)&self->_activationDelegate);
}

- (void)setActivationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_activationDelegate, a3);
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_destroyWeak((id *)&self->_activationDelegate);
}

@end
