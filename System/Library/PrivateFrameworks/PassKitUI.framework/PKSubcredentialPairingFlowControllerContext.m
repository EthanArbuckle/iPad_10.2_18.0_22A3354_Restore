@implementation PKSubcredentialPairingFlowControllerContext

- (PKSubcredentialPairingFlowControllerContext)initWithFlowType:(int64_t)a3 referralSource:(unint64_t)a4
{
  PKSubcredentialPairingFlowControllerContext *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  PKSubcredentialPairingFlowControllerContext *v8;
  PKSubcredentialPairingFlowControllerContext *v10;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = self;
  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == 5)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v14 = 5;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Invalid flow type (%ld) for class %@", buf, 0x16u);

    }
    v8 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PKSubcredentialPairingFlowControllerContext;
    v10 = -[PKSubcredentialProvisioningFlowControllerContext initWithFlowType:](&v12, sel_initWithFlowType_);
    if (v10)
      v10->_referralSource = a4;
    v4 = v10;
    v8 = v4;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSubcredentialPairingFlowControllerContext;
  v4 = -[PKSubcredentialProvisioningFlowControllerContext copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setConfiguration:", self->_configuration);
  objc_msgSend(v4, "setAppEntitlementWhitelist:", self->_appEntitlementWhitelist);
  objc_msgSend(v4, "setPasswordManuallyEntered:", self->_passwordManuallyEntered);
  objc_msgSend(v4, "setCredentialToShare:", self->_credentialToShare);
  objc_msgSend(v4, "setRemoteDeviceSharingRequest:", self->_remoteDeviceSharingRequest);
  objc_msgSend(v4, "setRemoteDeviceInvitation:", self->_remoteDeviceInvitation);
  objc_msgSend(v4, "setShouldRequestInvitation:", self->_shouldRequestInvitation);
  objc_msgSend(v4, "setDeclineRelatedInvitations:", self->_declineRelatedInvitations);
  objc_msgSend(v4, "setProvisioningController:", self->_provisioningController);
  return v4;
}

- (id)brandId
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[PKAddCarKeyPassConfiguration issuerIdentifier](self->_configuration, "issuerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self, "provisionedPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v5, "devicePaymentApplications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          objc_msgSend(v11, "subcredentials", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v20;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v20 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "brandIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17)
                {
                  v4 = v17;

                  goto LABEL_21;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
              if (v14)
                continue;
              break;
            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        v4 = 0;
      }
      while (v8);
    }
    else
    {
      v4 = 0;
    }
LABEL_21:

  }
  return v4;
}

- (unint64_t)referralSource
{
  return self->_referralSource;
}

- (PKAddCarKeyPassConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (PKEntitlementWhitelist)appEntitlementWhitelist
{
  return self->_appEntitlementWhitelist;
}

- (void)setAppEntitlementWhitelist:(id)a3
{
  objc_storeStrong((id *)&self->_appEntitlementWhitelist, a3);
}

- (BOOL)passwordManuallyEntered
{
  return self->_passwordManuallyEntered;
}

- (void)setPasswordManuallyEntered:(BOOL)a3
{
  self->_passwordManuallyEntered = a3;
}

- (PKAppletSubcredential)credentialToShare
{
  return self->_credentialToShare;
}

- (void)setCredentialToShare:(id)a3
{
  objc_storeStrong((id *)&self->_credentialToShare, a3);
}

- (PKAppletSubcredentialSharingRequest)remoteDeviceSharingRequest
{
  return self->_remoteDeviceSharingRequest;
}

- (void)setRemoteDeviceSharingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceSharingRequest, a3);
}

- (PKAppletSubcredentialSharingInvitation)remoteDeviceInvitation
{
  return self->_remoteDeviceInvitation;
}

- (void)setRemoteDeviceInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceInvitation, a3);
}

- (BOOL)shouldRequestInvitation
{
  return self->_shouldRequestInvitation;
}

- (void)setShouldRequestInvitation:(BOOL)a3
{
  self->_shouldRequestInvitation = a3;
}

- (BOOL)declineRelatedInvitations
{
  return self->_declineRelatedInvitations;
}

- (void)setDeclineRelatedInvitations:(BOOL)a3
{
  self->_declineRelatedInvitations = a3;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_remoteDeviceInvitation, 0);
  objc_storeStrong((id *)&self->_remoteDeviceSharingRequest, 0);
  objc_storeStrong((id *)&self->_credentialToShare, 0);
  objc_storeStrong((id *)&self->_appEntitlementWhitelist, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
