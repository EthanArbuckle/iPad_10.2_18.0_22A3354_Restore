@implementation TPSCloudCallingThumperController

- (TPSCloudCallingThumperController)init
{
  -[TPSCloudCallingThumperController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSCloudCallingThumperController)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSCloudCallingThumperController *v6;
  TPSCloudCallingThumperController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCloudCallingThumperController;
  v6 = -[TPSCloudCallingThumperController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);

  return v7;
}

- (TUSenderIdentityCapabilities)subscriptionCapabilities
{
  TUSenderIdentityCapabilities *subscriptionCapabilities;
  TUSenderIdentityCapabilities **p_subscriptionCapabilities;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_subscriptionCapabilities = &self->_subscriptionCapabilities;
  subscriptionCapabilities = self->_subscriptionCapabilities;
  if (!subscriptionCapabilities)
  {
    objc_msgSend(MEMORY[0x1E0DBD1B8], "senderIdentityCapabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSCloudCallingThumperController subscriptionContext](self, "subscriptionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "senderIdentityUUID", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v7);

          if (v15)
            objc_storeStrong((id *)p_subscriptionCapabilities, v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    subscriptionCapabilities = *p_subscriptionCapabilities;
  }
  return subscriptionCapabilities;
}

- (void)setThumperCallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TPSCloudCallingThumperController subscriptionCapabilities](self, "subscriptionCapabilities");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThumperCallingEnabled:", v3);

}

- (BOOL)isThumperCallingEnabled
{
  void *v2;
  char v3;

  -[TPSCloudCallingThumperController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isThumperCallingEnabled");

  return v3;
}

- (BOOL)supportsThumperCalling
{
  void *v2;
  char v3;

  -[TPSCloudCallingThumperController subscriptionCapabilities](self, "subscriptionCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsThumperCalling");

  return v3;
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

- (NSString)localizedCarrierName
{
  void *v3;
  void *v4;
  void *v5;

  -[TPSCloudCallingThumperController carrierBundleController](self, "carrierBundleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCloudCallingThumperController subscriptionContext](self, "subscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedCarrierNameForSubscriptionContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (TPSCloudCallingThumperControllerDelegate)delegate
{
  return (TPSCloudCallingThumperControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSubscriptionCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionCapabilities, a3);
}

- (void)setCarrierBundleController:(id)a3
{
  objc_storeStrong((id *)&self->_carrierBundleController, a3);
}

- (NSDictionary)encryptedIdentityInfo
{
  return self->_encryptedIdentityInfo;
}

- (void)setEncryptedIdentityInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_encryptedIdentityInfo, 0);
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_storeStrong((id *)&self->_subscriptionCapabilities, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
