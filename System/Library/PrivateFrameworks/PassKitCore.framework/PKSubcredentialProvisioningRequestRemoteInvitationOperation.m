@implementation PKSubcredentialProvisioningRequestRemoteInvitationOperation

+ (BOOL)canRequestInvitation:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (PKSubcredentialProvisioningRequestRemoteInvitationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v8;
  PKSubcredentialProvisioningRequestRemoteInvitationOperation *v9;
  void *v10;
  uint64_t v11;
  PKPaymentWebService *remoteDeviceWebService;
  uint64_t v13;
  PKPaymentWebServiceTargetDeviceProtocol *remoteTargetDevice;
  uint64_t v15;
  PKAppletSubcredentialSharingInvitation *invitation;
  PKSubcredentialProvisioningRequestRemoteInvitationOperation *v17;
  NSObject *v18;
  const char *v19;
  uint8_t v21[16];
  objc_super v22;

  v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKSubcredentialProvisioningRequestRemoteInvitationOperation;
  v9 = -[PKSubcredentialProvisioningOperation initWithConfiguration:context:delegate:](&v22, sel_initWithConfiguration_context_delegate_, v8, a4, a5);
  if (!v9)
    goto LABEL_5;
  objc_msgSend(v8, "remoteDeviceInvitation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteDeviceWebService");
  v11 = objc_claimAutoreleasedReturnValue();
  remoteDeviceWebService = v9->_remoteDeviceWebService;
  v9->_remoteDeviceWebService = (PKPaymentWebService *)v11;

  -[PKPaymentWebService targetDevice](v9->_remoteDeviceWebService, "targetDevice");
  v13 = objc_claimAutoreleasedReturnValue();
  remoteTargetDevice = v9->_remoteTargetDevice;
  v9->_remoteTargetDevice = (PKPaymentWebServiceTargetDeviceProtocol *)v13;

  objc_msgSend(v10, "invitation");
  v15 = objc_claimAutoreleasedReturnValue();
  invitation = v9->_invitation;
  v9->_invitation = (PKAppletSubcredentialSharingInvitation *)v15;

  if (!v9->_invitation)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      v19 = "No invitation to request";
LABEL_10:
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, v19, v21, 2u);
    }
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }
  if (!v9->_remoteTargetDevice)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      v19 = "No remote target device to accept invitation on";
      goto LABEL_10;
    }
    goto LABEL_11;
  }

LABEL_5:
  v17 = v9;
LABEL_12:

  return v17;
}

- (void)performOperation
{
  NSObject *v3;
  PKAppletSubcredentialSharingInvitation *invitation;
  PKPaymentWebServiceTargetDeviceProtocol *remoteTargetDevice;
  PKPaymentWebService *remoteDeviceWebService;
  PKAppletSubcredentialSharingInvitation *v7;
  _QWORD v8[4];
  id v9;
  objc_super v10;
  uint8_t buf[4];
  PKAppletSubcredentialSharingInvitation *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKSubcredentialProvisioningRequestRemoteInvitationOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v10, sel_performOperation);
  if ((objc_msgSend((id)objc_opt_class(), "canRequestInvitation:", self->_remoteTargetDevice) & 1) != 0)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      invitation = self->_invitation;
      *(_DWORD *)buf = 138412290;
      v12 = invitation;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Requesting invitation similar to: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    remoteTargetDevice = self->_remoteTargetDevice;
    remoteDeviceWebService = self->_remoteDeviceWebService;
    v7 = self->_invitation;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__PKSubcredentialProvisioningRequestRemoteInvitationOperation_performOperation__block_invoke;
    v8[3] = &unk_1E2AC7848;
    objc_copyWeak(&v9, (id *)buf);
    -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:requestSubcredentialInvitation:completion:](remoteTargetDevice, "paymentWebService:requestSubcredentialInvitation:completion:", remoteDeviceWebService, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 21, CFSTR("Remote device not supported"));
  }
}

void __79__PKSubcredentialProvisioningRequestRemoteInvitationOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v3)
    {
      PKPairedOrPairingDevice();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("54EDC00B-9FDF-442B-93A8-0562A7EBCCE0"));
      v7 = objc_msgSend(v5, "supportsCapability:", v6);

      if (v7)
      {
        v8 = CFSTR("Failed to request invite");
        v9 = WeakRetained;
        v10 = 13;
      }
      else
      {
        v8 = CFSTR("Failed to request invite, feature not supported on watch");
        v9 = WeakRetained;
        v10 = 21;
      }
      objc_msgSend(v9, "failWithErrorCode:description:underlyingError:", v10, v8, v3);
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Invitation requested successfully", v12, 2u);
      }

      objc_msgSend(WeakRetained, "advanceToState:", 15);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_remoteTargetDevice, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);
}

@end
