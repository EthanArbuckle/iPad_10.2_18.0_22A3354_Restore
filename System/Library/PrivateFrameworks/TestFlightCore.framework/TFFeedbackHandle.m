@implementation TFFeedbackHandle

- (TFFeedbackHandle)initWithConfiguration:(id)a3
{
  id v4;
  TFFeedbackHandle *v5;
  uint64_t v6;
  TFFeedbackHandleConfiguration *configuration;
  uint64_t v8;
  NSString *logKey;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFFeedbackHandle;
  v5 = -[TFFeedbackHandle init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (TFFeedbackHandleConfiguration *)v6;

    AMSGenerateLogCorrelationKey();
    v8 = objc_claimAutoreleasedReturnValue();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v8;

  }
  return v5;
}

- (void)presentFeedbackViewController
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
    -[TFFeedbackHandle logKey](self, "logKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackHandle configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v5;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_2174E1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: presentFeedbackViewController bundleIdentifier=%@", (uint8_t *)&v18, 0x20u);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0AE8]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.ios.StoreKitUIService"), CFSTR("ServiceTFFeedbackFormHostViewController"));
  v11 = objc_alloc_init(MEMORY[0x24BEB0AD0]);
  -[TFFeedbackHandle configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodedAsUserInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInfo:", v13);

  v14 = (void *)objc_msgSend(MEMORY[0x24BEB0AF8], "newHandleWithDefinition:configurationContext:", v10, v11);
  -[TFFeedbackHandle setInternalHandle:](self, "setInternalHandle:", v14);

  -[TFFeedbackHandle internalHandle](self, "internalHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:", self);

  v16 = objc_alloc_init(MEMORY[0x24BEB0AC8]);
  -[TFFeedbackHandle internalHandle](self, "internalHandle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateWithContext:", v16);

}

- (void)invalidateFeedbackViewController
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[TFFeedbackHandle logKey](self, "logKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackHandle configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2174E1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: invalidateFeedbackViewController bundleIdentifier=%@", (uint8_t *)&v11, 0x20u);

  }
  -[TFFeedbackHandle internalHandle](self, "internalHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

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
    -[TFFeedbackHandle logKey](self, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: remoteAlertHandleDidDeactivate", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(v4, "removeObserver:", self);

  -[TFFeedbackHandle setInternalHandle:](self, "setInternalHandle:", 0);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generatedLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    -[TFFeedbackHandle logKey](self, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_2174E1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: remoteAlertHandle:didInvalidateWithError:", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v5, "removeObserver:", self);

  -[TFFeedbackHandle setInternalHandle:](self, "setInternalHandle:", 0);
}

- (TFFeedbackHandleConfiguration)configuration
{
  return self->_configuration;
}

- (SBSRemoteAlertHandle)internalHandle
{
  return self->_internalHandle;
}

- (void)setInternalHandle:(id)a3
{
  objc_storeStrong((id *)&self->_internalHandle, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_internalHandle, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
