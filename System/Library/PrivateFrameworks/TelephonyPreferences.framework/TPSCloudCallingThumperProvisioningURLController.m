@implementation TPSCloudCallingThumperProvisioningURLController

- (TPSCloudCallingThumperProvisioningURLController)initWithSubscriptionContext:(id)a3
{
  TPSCloudCallingThumperProvisioningURLController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCloudCallingThumperProvisioningURLController;
  v3 = -[TPSCloudCallingURLController initWithSubscriptionContext:](&v5, sel_initWithSubscriptionContext_, a3);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DBD1B8], "addDelegate:queue:", v3, MEMORY[0x1E0C80D38]);
  return v3;
}

- (id)requestTimeoutController
{
  return 0;
}

- (BOOL)shouldShowEmergencyAddress
{
  BOOL v3;
  void *v5;

  if (!-[TPSCloudCallingThumperProvisioningURLController isCapabilityEnabled](self, "isCapabilityEnabled")
    || -[TPSCloudCallingThumperProvisioningURLController capabilityProvisioningStatus](self, "capabilityProvisioningStatus") != 3)
  {
    return 0;
  }
  if (-[TPSCloudCallingThumperProvisioningURLController isCapabilityProvisioningURLInvalid](self, "isCapabilityProvisioningURLInvalid"))
  {
    return 1;
  }
  -[TPSCloudCallingThumperProvisioningURLController capabilityProvisioningURL](self, "capabilityProvisioningURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (void)webSheetCompletion
{
  id v3;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSCloudCallingThumperProvisioningURLController enableCapability](self, "enableCapability");
  objc_msgSend(v3, "invalidateAndRefreshThumperCallingProvisioningURL");

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
    _os_log_impl(&dword_1DB4B7000, v3, OS_LOG_TYPE_DEFAULT, "Enabling Thumper calling", v5, 2u);
  }

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThumperCallingEnabled:", 1);

}

- (BOOL)shouldShowUpgradeToThumperButton
{
  void *v3;
  _BOOL4 v4;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(MEMORY[0x1E0DBD1B8], "isRelayCallingEnabled")
    || !objc_msgSend(v3, "supportsThumperCalling")
    || (objc_msgSend(v3, "isThumperCallingEnabled") & 1) != 0)
  {
LABEL_7:
    LOBYTE(v4) = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(MEMORY[0x1E0DBD1B8], "supportsPrimaryCalling") & 1) == 0)
  {
    if ((objc_msgSend(MEMORY[0x1E0DBD1B8], "supportsPrimaryCalling") & 1) == 0)
    {
      v4 = !-[TPSCloudCallingThumperProvisioningURLController isThumperProvisioningInProcess](self, "isThumperProvisioningInProcess");
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  LOBYTE(v4) = 1;
LABEL_8:

  return v4;
}

- (BOOL)isThumperProvisioningInProcess
{
  return -[TPSCloudCallingThumperProvisioningURLController capabilityProvisioningStatus](self, "capabilityProvisioningStatus") == 1;
}

- (BOOL)isCapabilityEnabled
{
  void *v2;
  char v3;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isThumperCallingEnabled");

  return v3;
}

- (int)capabilityProvisioningStatus
{
  void *v2;
  int v3;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "thumperCallingProvisioningStatus");

  return v3;
}

- (id)capabilityProvisioningURL
{
  void *v2;
  void *v3;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumperCallingProvisioningURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isCapabilityProvisioningURLInvalid
{
  void *v2;
  char v3;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isThumperCallingProvisioningURLInvalid");

  return v3;
}

- (id)capabilityProvisioningPostData
{
  void *v2;
  void *v3;

  -[TPSCloudCallingURLController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumperCallingProvisioningPostData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didChangeThumperCallingProvisionalURLForSenderIdentityWithUUID:(id)a3
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
      _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "Thumper calling provisioning URL changed for sender identity with UUID %@.", (uint8_t *)&v9, 0xCu);
    }

    -[TPSCloudCallingURLController reloadWebViewController](self, "reloadWebViewController");
  }

}

@end
