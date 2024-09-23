@implementation PKSubcredentialProvisioningRemoteDeviceSharingConfiguration

- (PKSubcredentialProvisioningRemoteDeviceSharingConfiguration)initWithSharingRequest:(id)a3 sharingSession:(id)a4 localDeviceWebService:(id)a5 remoteDeviceWebService:(id)a6 userAuthDelegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  PKSubcredentialProvisioningRemoteDeviceSharingConfiguration *v19;
  id v21;

  v13 = a3;
  v21 = a4;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  objc_msgSend(v13, "invitations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration initWithInvitation:canRequestInvitation:declineRelatedInvitations:localDeviceWebService:remoteDeviceWebService:configurationType:](self, "initWithInvitation:canRequestInvitation:declineRelatedInvitations:localDeviceWebService:remoteDeviceWebService:configurationType:", v18, 0, 0, v16, v15, 2);

  if (v19)
  {
    objc_storeStrong((id *)&v19->_sharingRequest, a3);
    objc_storeStrong((id *)&v19->_sharingSession, a4);
    objc_storeWeak((id *)&v19->_userAuthDelegate, v14);
  }

  return v19;
}

- (id)transitionTable
{
  return objc_alloc_init(PKSubcredentialProvisioningRemoteDeviceSharingTransitionTable);
}

- (int64_t)startingState
{
  return 13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration invitation](self, "invitation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppletSubcredentialSharingRequest credential](self->_sharingRequest, "credential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; invitation: %@; credential: %@ >"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PKAppletSubcredentialSharingRequest)sharingRequest
{
  return self->_sharingRequest;
}

- (PKAppletSubcredentialSharingSession)sharingSession
{
  return self->_sharingSession;
}

- (PKSubcredentialProvisioningUserAuthDelegate)userAuthDelegate
{
  return (PKSubcredentialProvisioningUserAuthDelegate *)objc_loadWeakRetained((id *)&self->_userAuthDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userAuthDelegate);
  objc_storeStrong((id *)&self->_sharingSession, 0);
  objc_storeStrong((id *)&self->_sharingRequest, 0);
}

@end
