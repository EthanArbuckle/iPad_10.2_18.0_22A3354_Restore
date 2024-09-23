@implementation TPSCloudCallingEmergencyAddressURLController

- (TPSCloudCallingEmergencyAddressURLController)initWithSubscriptionContext:(id)a3
{
  TPSCloudCallingEmergencyAddressURLController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCloudCallingEmergencyAddressURLController;
  v3 = -[TPSCloudCallingURLController initWithSubscriptionContext:](&v5, sel_initWithSubscriptionContext_, a3);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DBD1B8], "addDelegate:queue:", v3, MEMORY[0x1E0C80D38]);
  return v3;
}

- (void)enableCapability
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  TPSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4B7000, v3, OS_LOG_TYPE_DEFAULT, "Enabling Wi-Fi calling", v5, 2u);
  }

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWiFiCallingEnabled:", 1);

}

- (void)webSheetCompletion
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  TPSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4B7000, v3, OS_LOG_TYPE_DEFAULT, "webSheetCompletion - Enabling Wi-Fi and VoLTE Calling", v5, 2u);
  }

  -[TPSCloudCallingEmergencyAddressURLController enableCapability](self, "enableCapability");
  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateAndRefreshWiFiCallingProvisioningURL");

}

- (BOOL)isCapabilityEnabled
{
  void *v2;
  char v3;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiCallingEnabled");

  return v3;
}

- (int)capabilityProvisioningStatus
{
  void *v2;
  int v3;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wiFiCallingProvisioningStatus");

  return v3;
}

- (id)capabilityProvisioningURL
{
  void *v2;
  void *v3;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiCallingProvisioningURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isCapabilityProvisioningURLInvalid
{
  void *v2;
  char v3;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiCallingProvisioningURLInvalid");

  return v3;
}

- (id)capabilityProvisioningPostData
{
  void *v2;
  void *v3;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiCallingProvisioningPostData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didChangeWiFiCallingProvisionalURLForSenderIdentityWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSCloudCallingURLController subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    TPSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "WiFi calling provisioning URL changed for sender identity with UUID %@.", (uint8_t *)&v9, 0xCu);
    }

    -[TPSCloudCallingURLController reloadWebViewController](self, "reloadWebViewController");
  }

}

@end
