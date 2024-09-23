@implementation PKSubcredentialProvisioningAcceptInvitationConfiguration

- (PKSubcredentialProvisioningAcceptInvitationConfiguration)initWithSession:(id)a3 invitation:(id)a4 metadata:(id)a5 webService:(id)a6
{
  return -[PKSubcredentialProvisioningAcceptInvitationConfiguration initWithSession:invitation:metadata:declineRelatedInvitations:localDeviceWebService:remoteDeviceWebService:](self, "initWithSession:invitation:metadata:declineRelatedInvitations:localDeviceWebService:remoteDeviceWebService:", a3, a4, a5, 0, a6, 0);
}

- (PKSubcredentialProvisioningAcceptInvitationConfiguration)initWithSession:(id)a3 invitation:(id)a4 metadata:(id)a5 declineRelatedInvitations:(BOOL)a6 localDeviceWebService:(id)a7 remoteDeviceWebService:(id)a8
{
  id v13;
  id v14;
  id v15;
  PKCarKeyCredentialRegistrationMetadata *v16;
  void *v17;
  void *v18;
  PKCarKeyCredentialRegistrationMetadata *v19;
  PKSubcredentialProvisioningAcceptInvitationConfiguration *v20;
  id obj;
  id v24;
  id v25;

  v13 = a3;
  v14 = a4;
  v25 = a5;
  obj = a8;
  v24 = a8;
  v15 = a7;
  v16 = [PKCarKeyCredentialRegistrationMetadata alloc];
  objc_msgSend(v14, "issuer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deviceModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PKCarKeyCredentialRegistrationMetadata initWithMake:model:keyType:](v16, "initWithMake:model:keyType:", v17, v18, 1);

  v20 = -[PKSubcredentialProvisioningLocalDeviceConfiguration initWithWebService:registrationMetadata:configurationType:](self, "initWithWebService:registrationMetadata:configurationType:", v15, v19, 1);
  if (v20)
  {
    objc_storeWeak((id *)&v20->_session, v13);
    objc_storeStrong((id *)&v20->_metadata, a5);
    objc_storeStrong((id *)&v20->_invitation, a4);
    v20->_declineRelatedInvitations = a6;
    objc_storeStrong((id *)&v20->_remoteDeviceWebService, obj);
  }

  return v20;
}

- (id)transitionTable
{
  return objc_alloc_init(PKSubcredentialProvisioningFriendPairingTransitionTable);
}

- (int64_t)startingState
{
  return 2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; invitation: %@ >"),
               objc_opt_class(),
               self,
               self->_invitation);
}

- (PKAppletSubcredentialSharingSession)session
{
  return (PKAppletSubcredentialSharingSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (PKAppletSubcredentialSharingInvitation)invitation
{
  return self->_invitation;
}

- (PKAppletSubcredentialSharingInvitationMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)declineRelatedInvitations
{
  return self->_declineRelatedInvitations;
}

- (PKPaymentWebService)remoteDeviceWebService
{
  return self->_remoteDeviceWebService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->_session);
}

@end
