@implementation PKSubcredentialProvisioningOperation

+ (id)operationForState:(int64_t)a3 configuration:(id)a4 context:(id)a5 delegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  __objc2_class *v12;
  void *v13;
  void *v14;
  __objc2_class *v15;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  switch(a3)
  {
    case 2:
      v12 = PKSubcredentialProvisioningConnectivityCheckOperation;
      goto LABEL_18;
    case 3:
      objc_msgSend(v9, "acceptInvitationConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = PKSubcredentialProvisioningAcceptInvitationOperation;
      goto LABEL_9;
    case 4:
      v12 = PKSubcredentialProvisioningAccountAttestationOperation;
      goto LABEL_18;
    case 5:
      objc_msgSend(v9, "ownerConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = PKSubcredentialProvisioningPrewarmSessionOperation;
      goto LABEL_9;
    case 6:
      objc_msgSend(v9, "ownerConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = PKSubcredentialProvisioningHoldNearReaderOperation;
      goto LABEL_9;
    case 7:
      objc_msgSend(v9, "ownerConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = PKSubcredentialProvisioningPairingOperation;
LABEL_9:
      v13 = (void *)objc_msgSend([v15 alloc], "initWithConfiguration:context:delegate:", v14, v10, v11);

      break;
    case 8:
      v12 = PKSubcredentialProvisioningDeviceRegistrationOperation;
      goto LABEL_18;
    case 9:
      v12 = PKSubcredentialProvisioningRegisteringCredentialOperation;
      goto LABEL_18;
    case 10:
      v12 = PKSubcredentialProvisioningDownloadPassOperation;
      goto LABEL_18;
    case 11:
      v12 = PKSubcredentialProvisioningDownloadAndTrackCredentialOperation;
      goto LABEL_18;
    case 12:
      v12 = PKSubcredentialProvisioningAddPassOperation;
      goto LABEL_18;
    case 13:
      v12 = PKSubcredentialProvisioningSendInvitationOperation;
      goto LABEL_18;
    case 14:
      v12 = PKSubcredentialProvisioningRequestRemoteInvitationOperation;
      goto LABEL_18;
    case 15:
      v12 = PKSubcredentialProvisioningAcceptRemoteInvitationOperation;
LABEL_18:
      v13 = (void *)objc_msgSend([v12 alloc], "initWithConfiguration:context:delegate:", v9, v10, v11);
      break;
    default:
      v13 = 0;
      break;
  }

  return v13;
}

- (PKSubcredentialProvisioningOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKSubcredentialProvisioningOperation *v12;
  PKSubcredentialProvisioningOperation *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[PKSubcredentialProvisioningOperation init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (void)performOperation
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_inProgress)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Perform operation invoked twice on %@", (uint8_t *)&v6, 0xCu);

    }
  }
  self->_inProgress = 1;
}

- (void)cancelOperation
{
  -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 0, CFSTR("Unimplemented method cancelOperation"));
}

- (BOOL)isInProgress
{
  return self->_inProgress;
}

- (void)advanceToState:(int64_t)a3
{
  void *v5;
  id v6;

  self->_inProgress = 0;
  -[PKSubcredentialProvisioningOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "operation:advanceToState:", self, a3);
    v5 = v6;
  }

}

- (void)failWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  self->_inProgress = 0;
  -[PKSubcredentialProvisioningOperation delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "operation:failWithError:", self, v6);

}

- (void)failWithErrorCode:(int64_t)a3 description:(id)a4
{
  -[PKSubcredentialProvisioningOperation failWithErrorCode:description:underlyingError:](self, "failWithErrorCode:description:underlyingError:", a3, a4, 0);
}

- (void)failWithErrorCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  if ((unint64_t)a4 | (unint64_t)a5)
  {
    v8 = (objc_class *)MEMORY[0x1E0C99E08];
    v9 = a5;
    v10 = a4;
    v12 = objc_alloc_init(v8);
    objc_msgSend(v12, "setValue:forKey:", v10, *MEMORY[0x1E0CB2938]);

    objc_msgSend(v12, "setValue:forKey:", v9, *MEMORY[0x1E0CB3388]);
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), a3, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningOperation failWithError:](self, "failWithError:", v11);

}

- (PKSubcredentialProvisioningOperationDelegate)delegate
{
  return (PKSubcredentialProvisioningOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PKSubcredentialProvisioningConfiguration)configuration
{
  return self->_configuration;
}

- (PKSubcredentialProvisioningOperationContext)context
{
  return self->_context;
}

- (BOOL)canCancelOperation
{
  return self->_canCancelOperation;
}

- (BOOL)canBeRestarted
{
  return self->_canBeRestarted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
