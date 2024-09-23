@implementation TPSWiFiCallingController

- (TPSWiFiCallingController)init
{
  -[TPSWiFiCallingController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSWiFiCallingController)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSWiFiCallingController *v6;
  TPSWiFiCallingController *v7;
  void *v8;
  uint64_t v9;
  TUSenderIdentityCapabilities *subscriptionCapabilities;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSWiFiCallingController;
  v6 = -[TPSWiFiCallingController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    objc_msgSend(v5, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSWiFiCallingController subscriptionCapabilitiesForSubscriptionContextUUID:](v7, "subscriptionCapabilitiesForSubscriptionContextUUID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    subscriptionCapabilities = v7->_subscriptionCapabilities;
    v7->_subscriptionCapabilities = (TUSenderIdentityCapabilities *)v9;

    objc_msgSend(MEMORY[0x1E0DBD1B8], "addDelegate:queue:", v7, MEMORY[0x1E0C80D38]);
  }

  return v7;
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

- (TUSenderIdentityCapabilities)subscriptionCapabilities
{
  void *v3;
  void *v4;
  void *v5;

  -[TPSWiFiCallingController subscriptionContext](self, "subscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSWiFiCallingController subscriptionCapabilitiesForSubscriptionContextUUID:](self, "subscriptionCapabilitiesForSubscriptionContextUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUSenderIdentityCapabilities *)v5;
}

- (BOOL)isThumperCallingEnabled
{
  void *v2;
  char v3;

  -[TPSWiFiCallingController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isThumperCallingEnabled") & 1) != 0
    || objc_msgSend(v2, "thumperCallingProvisioningStatus") == 1)
  {
    v3 = objc_msgSend(MEMORY[0x1E0DBD1B8], "isRelayCallingEnabled");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setThumperCallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TPSWiFiCallingController subscriptionCapabilities](self, "subscriptionCapabilities");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThumperCallingEnabled:", v3);

}

- (BOOL)isWiFiCallingEnabled
{
  void *v2;
  BOOL v3;

  -[TPSWiFiCallingController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "isWiFiCallingEnabled") & 1) != 0
    || objc_msgSend(v2, "wiFiCallingProvisioningStatus") == 1;

  return v3;
}

- (void)setWiFiCallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TPSWiFiCallingController subscriptionCapabilities](self, "subscriptionCapabilities");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWiFiCallingEnabled:", v3);

}

- (BOOL)isWiFiCallingRoamingEnabled
{
  void *v2;
  char v3;

  -[TPSWiFiCallingController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiCallingRoamingEnabled");

  return v3;
}

- (void)setWiFiCallingRoamingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TPSWiFiCallingController subscriptionCapabilities](self, "subscriptionCapabilities");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWiFiCallingRoamingEnabled:", v3);

}

- (BOOL)supportsThumperCalling
{
  void *v2;
  char v3;

  -[TPSWiFiCallingController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsThumperCalling");

  return v3;
}

- (BOOL)supportsWiFiCalling
{
  void *v2;
  char v3;

  -[TPSWiFiCallingController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsWiFiCalling");

  return v3;
}

- (BOOL)supportsWiFiEmergencyCalling
{
  void *v2;
  char v3;

  -[TPSWiFiCallingController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsEmergencyWiFiCalling");

  return v3;
}

- (BOOL)isWiFiCallingCertified
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[TPSWiFiCallingController carrierBundleController](self, "carrierBundleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSWiFiCallingController subscriptionContext](self, "subscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyHierarchy:subscriptionContext:", &unk_1EA2D7CE0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "BOOLValue") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
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

- (TPSEncryptedIdentityClient)encryptedIdentityClient
{
  TPSEncryptedIdentityClient *encryptedIdentityClient;
  TPSEncryptedIdentityClient *v4;
  TPSEncryptedIdentityClient *v5;

  encryptedIdentityClient = self->_encryptedIdentityClient;
  if (!encryptedIdentityClient)
  {
    v4 = objc_alloc_init(TPSEncryptedIdentityClient);
    v5 = self->_encryptedIdentityClient;
    self->_encryptedIdentityClient = v4;

    encryptedIdentityClient = self->_encryptedIdentityClient;
  }
  return encryptedIdentityClient;
}

- (NSDictionary)encryptedIdentityInfo
{
  NSDictionary *encryptedIdentityInfo;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;

  encryptedIdentityInfo = self->_encryptedIdentityInfo;
  if (!encryptedIdentityInfo)
  {
    -[TPSWiFiCallingController encryptedIdentityClient](self, "encryptedIdentityClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSWiFiCallingController subscriptionContext](self, "subscriptionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encryptedIdentityInfoForSubscriptionContext:type:", v5, 1);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_encryptedIdentityInfo;
    self->_encryptedIdentityInfo = v6;

    encryptedIdentityInfo = self->_encryptedIdentityInfo;
  }
  return encryptedIdentityInfo;
}

- (BOOL)supportsEncryptedIdentity
{
  void *v2;
  BOOL v3;

  -[TPSWiFiCallingController encryptedIdentityInfo](self, "encryptedIdentityInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)localizedCarrierName
{
  void *v3;
  void *v4;
  void *v5;

  -[TPSWiFiCallingController carrierBundleController](self, "carrierBundleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSWiFiCallingController subscriptionContext](self, "subscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedCarrierNameForSubscriptionContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSWiFiCallingController subscriptionContext](self, "subscriptionContext");
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
      -[TPSWiFiCallingController subscriptionContext](self, "subscriptionContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "Thumper calling capabilities changed for subscription context %@.", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("TPSWiFiCallingControllerSubscriptionCapabilitiesChangedNotification"), self);

  }
}

- (void)didChangeWiFiCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSWiFiCallingController subscriptionContext](self, "subscriptionContext");
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
      -[TPSWiFiCallingController subscriptionContext](self, "subscriptionContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "WiFi calling capabilities changed for subscription context %@.", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("TPSWiFiCallingControllerSubscriptionCapabilitiesChangedNotification"), self);

  }
}

- (void)setSubscriptionCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionCapabilities, a3);
}

- (TPSCloudCallingEmergencyAddressURLController)emergencyAddressURLController
{
  return self->_emergencyAddressURLController;
}

- (void)setEmergencyAddressURLController:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyAddressURLController, a3);
}

- (TPSCloudCallingThumperProvisioningURLController)thumperProvisioningURLController
{
  return self->_thumperProvisioningURLController;
}

- (void)setThumperProvisioningURLController:(id)a3
{
  objc_storeStrong((id *)&self->_thumperProvisioningURLController, a3);
}

- (void)setCarrierBundleController:(id)a3
{
  objc_storeStrong((id *)&self->_carrierBundleController, a3);
}

- (void)setEncryptedIdentityClient:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedIdentityClient, a3);
}

- (void)setEncryptedIdentityInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_encryptedIdentityInfo, 0);
  objc_storeStrong((id *)&self->_encryptedIdentityClient, 0);
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_storeStrong((id *)&self->_thumperProvisioningURLController, 0);
  objc_storeStrong((id *)&self->_emergencyAddressURLController, 0);
  objc_storeStrong((id *)&self->_subscriptionCapabilities, 0);
}

@end
