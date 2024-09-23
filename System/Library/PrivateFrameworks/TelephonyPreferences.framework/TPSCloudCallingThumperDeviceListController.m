@implementation TPSCloudCallingThumperDeviceListController

- (TPSCloudCallingThumperDeviceListController)init
{
  TPSCloudCallingThumperDeviceListController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSCloudCallingThumperDeviceListController;
  v2 = -[TPSCloudCallingDeviceListController init](&v4, sel_init);
  if (v2)
    objc_msgSend(MEMORY[0x1E0DBD1B8], "addDelegate:queue:", v2, MEMORY[0x1E0C80D38]);
  return v2;
}

- (TPSCloudCallingThumperProvisioningURLController)provisioningURLController
{
  TPSCloudCallingThumperProvisioningURLController *provisioningURLController;
  TPSCloudCallingThumperProvisioningURLController *v4;
  void *v5;
  TPSCloudCallingThumperProvisioningURLController *v6;
  TPSCloudCallingThumperProvisioningURLController *v7;

  provisioningURLController = self->_provisioningURLController;
  if (!provisioningURLController)
  {
    v4 = [TPSCloudCallingThumperProvisioningURLController alloc];
    -[TPSListController subscriptionContext](self, "subscriptionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TPSCloudCallingThumperProvisioningURLController initWithSubscriptionContext:](v4, "initWithSubscriptionContext:", v5);
    v7 = self->_provisioningURLController;
    self->_provisioningURLController = v6;

    -[TPSCloudCallingURLController setDelegate:](self->_provisioningURLController, "setDelegate:", self);
    provisioningURLController = self->_provisioningURLController;
  }
  return provisioningURLController;
}

- (TPSCloudCallingThumperController)thumperController
{
  TPSCloudCallingThumperController *thumperController;
  TPSCloudCallingThumperController *v4;
  void *v5;
  TPSCloudCallingThumperController *v6;
  TPSCloudCallingThumperController *v7;

  thumperController = self->_thumperController;
  if (!thumperController)
  {
    v4 = [TPSCloudCallingThumperController alloc];
    -[TPSListController subscriptionContext](self, "subscriptionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TPSCloudCallingThumperController initWithSubscriptionContext:](v4, "initWithSubscriptionContext:", v5);
    v7 = self->_thumperController;
    self->_thumperController = v6;

    thumperController = self->_thumperController;
  }
  return thumperController;
}

- (id)isDeviceSwitchOn:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  -[TPSCloudCallingThumperDeviceListController thumperController](self, "thumperController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscriptionCapabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v7, "isThumperCallingAllowedOnSecondaryDeviceWithID:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setDeviceSwitchOn:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)TPSCloudCallingThumperDeviceListController;
  v6 = a4;
  v7 = a3;
  -[TPSCloudCallingDeviceListController setDeviceSwitchOn:specifier:](&v14, sel_setDeviceSwitchOn_specifier_, v7, v6);
  objc_msgSend(v6, "identifier", v14.receiver, v14.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "BOOLValue");
  TPSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("Deactivating");
    if (v9)
      v11 = CFSTR("Activating");
    *(_DWORD *)buf = 138412546;
    v16 = v11;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1DB4B7000, v10, OS_LOG_TYPE_DEFAULT, "%@ Thumper for secondary device with identifier %@", buf, 0x16u);
  }

  if ((v9 & 1) == 0)
  {
    -[TPSCloudCallingThumperDeviceListController thumperController](self, "thumperController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subscriptionCapabilities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setThumperCallingAllowed:onSecondaryDeviceWithID:", 0, v8);

  }
}

- (id)isMainSwitchOn:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[TPSCloudCallingThumperDeviceListController thumperController](self, "thumperController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "isThumperCallingEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)TPSCloudCallingThumperDeviceListController;
  v6 = a3;
  -[TPSCloudCallingDeviceListController setMainSwitchOn:specifier:](&v17, sel_setMainSwitchOn_specifier_, v6, a4);
  v7 = objc_msgSend(v6, "BOOLValue", v17.receiver, v17.super_class);

  TPSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v9 = CFSTR("Enabling");
    else
      v9 = CFSTR("Disabling");
    -[TPSListController subscriptionContext](self, "subscriptionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "%@ Thumper for subscription context %@", buf, 0x16u);

  }
  if (v7)
  {
    -[TPSCloudCallingThumperDeviceListController provisioningURLController](self, "provisioningURLController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldEnableCapability");

    if (v12)
    {
      TPSLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB4B7000, v13, OS_LOG_TYPE_DEFAULT, "Thumper capability should be enabled, so enabling it directly now", buf, 2u);
      }

      -[TPSCloudCallingThumperDeviceListController provisioningURLController](self, "provisioningURLController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enableCapability");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBD1B8], "invalidateAndRefreshThumperCallingProvisioningURL");
      -[TPSCloudCallingThumperDeviceListController provisioningURLController](self, "provisioningURLController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "provisionCapabilityController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSCloudCallingListController presentOrUpdateViewController:](self, "presentOrUpdateViewController:", v16);

    }
  }
  else
  {
    -[TPSCloudCallingThumperDeviceListController thumperController](self, "thumperController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subscriptionCapabilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setThumperCallingEnabled:", 0);

  }
}

- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSListController subscriptionContext](self, "subscriptionContext");
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
      v10 = v5;
      _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "Thumper calling cabilities changed for subscription context %@.", (uint8_t *)&v9, 0xCu);
    }

    -[TPSCloudCallingThumperDeviceListController reloadSpecifiers](self, "reloadSpecifiers");
  }

}

- (void)didChangeThumperCallingProvisionalURLForSenderIdentityWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSListController subscriptionContext](self, "subscriptionContext");
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
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "Thumper calling provisioning URL changed for subscription context %@.", (uint8_t *)&v15, 0xCu);
    }

    -[TPSCloudCallingThumperDeviceListController presentedViewController](self, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[TPSCloudCallingThumperDeviceListController thumperController](self, "thumperController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subscriptionCapabilities");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v11, "thumperCallingProvisioningStatus"))
      {
        TPSLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_1DB4B7000, v12, OS_LOG_TYPE_DEFAULT, "We have a presented view controller and Thumper provisioning status is not-allowed, updating the presented controller", (uint8_t *)&v15, 2u);
        }

        -[TPSCloudCallingThumperDeviceListController provisioningURLController](self, "provisioningURLController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "provisionCapabilityController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSCloudCallingListController presentOrUpdateViewController:](self, "presentOrUpdateViewController:", v14);

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumperController, 0);
  objc_storeStrong((id *)&self->_provisioningURLController, 0);
}

@end
