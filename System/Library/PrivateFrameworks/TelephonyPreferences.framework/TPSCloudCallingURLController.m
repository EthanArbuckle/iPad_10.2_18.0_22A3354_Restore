@implementation TPSCloudCallingURLController

- (TPSCloudCallingURLController)init
{
  -[TPSCloudCallingURLController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSCloudCallingURLController)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSCloudCallingURLController *v6;
  TPSCloudCallingURLController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCloudCallingURLController;
  v6 = -[TPSCloudCallingURLController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);

  return v7;
}

- (TPSCarrierBundleController)carrierBundleController
{
  TPSCarrierBundleController *carrierBundleController;
  TPSCarrierBundleController *v4;
  TPSCarrierBundleController *v5;

  carrierBundleController = self->_carrierBundleController;
  if (!carrierBundleController)
  {
    v4 = objc_alloc_init(TPSCarrierBundleController);
    v5 = self->_carrierBundleController;
    self->_carrierBundleController = v4;

    carrierBundleController = self->_carrierBundleController;
  }
  return carrierBundleController;
}

- (TUSenderIdentityCapabilities)subscriptionCapabilities
{
  void *v3;
  void *v4;
  void *v5;

  -[TPSCloudCallingURLController subscriptionContext](self, "subscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCloudCallingURLController subscriptionCapabilitiesForSubscriptionContextUUID:](self, "subscriptionCapabilitiesForSubscriptionContextUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUSenderIdentityCapabilities *)v5;
}

- (id)subscriptionCapabilitiesForSubscriptionContextUUID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DBD1B8], "senderIdentityCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "senderIdentityUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v3);

        if (v12)
        {
          v13 = v10;

          v7 = v13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)genericErrorAlertController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[TPSCloudCallingURLController subscriptionContext](self, "subscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCloudCallingURLController carrierBundleController](self, "carrierBundleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:subscriptionContext:", CFSTR("CarrierName"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSCloudCallingURLController carrierBundleController](self, "carrierBundleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:subscriptionContext:", CFSTR("VoWiFiCustomerCareWebsite"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v8 = v7;
  }
  else
  {
    -[TPSCloudCallingURLController carrierBundleController](self, "carrierBundleController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:subscriptionContext:", CFSTR("VoLTECustomerCareWebsite"), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    TPSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v8;
      _os_log_impl(&dword_1DB4B7000, v10, OS_LOG_TYPE_DEFAULT, "No VoWiFiCustomerCareWebsite URL specified so looking up VoLTECustomerCareWebsite URL (%@)", buf, 0xCu);
    }

  }
  TUStringKeyForNetwork();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    TUStringKeyForNetwork();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v15, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    TUStringKeyForNetwork();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v12, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v8, "length");
  v19 = (void *)MEMORY[0x1E0CEA2E0];
  if (v18)
  {
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("CLOUD_CALLING_SHOW_CARRIER_WEB_VIEW_ERROR_VISIT_WEBSITE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __59__TPSCloudCallingURLController_genericErrorAlertController__block_invoke;
    v28[3] = &unk_1EA2CD808;
    v29 = v8;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v21);

    v22 = (void *)MEMORY[0x1E0CEA2E0];
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("CLOUD_CALLING_ALERT_ACTION_TITLE_CANCEL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v24);

    v25 = v29;
  }
  else
  {
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("CLOUD_CALLING_ALERT_ACTION_TITLE_CONFIRM"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "actionWithTitle:style:handler:", v25, 1, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v26);

  }
  return v17;
}

void __59__TPSCloudCallingURLController_genericErrorAlertController__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", v2, MEMORY[0x1E0C9AA70], 0);

}

- (void)reloadWebViewController
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webViewController);

  if (WeakRetained)
    -[TPSCloudCallingURLController loadWebViewController](self, "loadWebViewController");
}

- (void)loadWebViewController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB4B7000, v0, v1, "Did not receive a non-nil provisioning URL after refreshing CT settings. Presenting generic error alert controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __53__TPSCloudCallingURLController_loadWebViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  void *v5;

  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    TPSLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__TPSCloudCallingURLController_loadWebViewController__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "genericErrorAlertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentOrUpdateViewController:", v5);

  }
}

void __53__TPSCloudCallingURLController_loadWebViewController__block_invoke_30(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  if ((unint64_t)(a2 - 2) >= 2)
  {
    if (!a2)
    {
      TPSLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1DB4B7000, v6, OS_LOG_TYPE_DEFAULT, "Successfully loaded web view URL", v7, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "webSheetCompletion");
    }
  }
  else
  {
    TPSLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__TPSCloudCallingURLController_loadWebViewController__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "genericErrorAlertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentOrUpdateViewController:", v5);

  }
}

- (id)_webViewControllerWithType:(int64_t)a3
{
  NSObject *v5;
  TPSCloudCallingWebViewController *v6;
  void *v7;
  NSObject *v8;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  TPSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "_webViewControllerWithType: %ld", (uint8_t *)&v10, 0xCu);
  }

  if (-[TPSCloudCallingURLController capabilityProvisioningStatus](self, "capabilityProvisioningStatus") < 1)
  {
    TPSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TPSCloudCallingURLController _webViewControllerWithType:].cold.1();

    -[TPSCloudCallingURLController genericErrorAlertController](self, "genericErrorAlertController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = -[TPSCloudCallingWebViewController initWithType:]([TPSCloudCallingWebViewController alloc], "initWithType:", a3);
    -[TPSCloudCallingURLController setWebViewController:](self, "setWebViewController:", v6);
    -[TPSCloudCallingURLController loadWebViewController](self, "loadWebViewController");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v6);

  }
  return v7;
}

- (id)provisionCapabilityController
{
  return -[TPSCloudCallingURLController _webViewControllerWithType:](self, "_webViewControllerWithType:", 1);
}

- (id)updateEmergencyAddressController
{
  return -[TPSCloudCallingURLController _webViewControllerWithType:](self, "_webViewControllerWithType:", 2);
}

- (BOOL)shouldEnableCapability
{
  return -[TPSCloudCallingURLController capabilityProvisioningStatus](self, "capabilityProvisioningStatus") == 3
      || -[TPSCloudCallingURLController capabilityProvisioningStatus](self, "capabilityProvisioningStatus") == 1;
}

- (TPSCloudCallingURLControllerDelegate)delegate
{
  return (TPSCloudCallingURLControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (BOOL)isCapabilityEnabled
{
  return self->_capabilityEnabled;
}

- (int)capabilityProvisioningStatus
{
  return self->_capabilityProvisioningStatus;
}

- (NSURL)capabilityProvisioningURL
{
  return self->_capabilityProvisioningURL;
}

- (BOOL)isCapabilityProvisioningURLInvalid
{
  return self->_capabilityProvisioningURLInvalid;
}

- (NSData)capabilityProvisioningPostData
{
  return self->_capabilityProvisioningPostData;
}

- (void)setCarrierBundleController:(id)a3
{
  objc_storeStrong((id *)&self->_carrierBundleController, a3);
}

- (TPSCloudCallingWebViewController)webViewController
{
  return (TPSCloudCallingWebViewController *)objc_loadWeakRetained((id *)&self->_webViewController);
}

- (void)setWebViewController:(id)a3
{
  objc_storeWeak((id *)&self->_webViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webViewController);
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_storeStrong((id *)&self->_capabilityProvisioningPostData, 0);
  objc_storeStrong((id *)&self->_capabilityProvisioningURL, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__TPSCloudCallingURLController_loadWebViewController__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB4B7000, v0, v1, "Error loading web view. Presenting generic error alert controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_webViewControllerWithType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB4B7000, v0, v1, "Asked for requestCarrierController when provisioning status is not-allowed. Returning generic error alert controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
