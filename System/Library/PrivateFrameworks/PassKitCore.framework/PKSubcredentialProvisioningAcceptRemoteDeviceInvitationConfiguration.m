@implementation PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration

- (PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration)initWithInvitation:(id)a3 canRequestInvitation:(BOOL)a4 declineRelatedInvitations:(BOOL)a5 localDeviceWebService:(id)a6 remoteDeviceWebService:(id)a7
{
  return -[PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration initWithInvitation:canRequestInvitation:declineRelatedInvitations:localDeviceWebService:remoteDeviceWebService:configurationType:](self, "initWithInvitation:canRequestInvitation:declineRelatedInvitations:localDeviceWebService:remoteDeviceWebService:configurationType:", a3, a4, a5, a6, a7, 3);
}

- (PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration)initWithInvitation:(id)a3 canRequestInvitation:(BOOL)a4 declineRelatedInvitations:(BOOL)a5 localDeviceWebService:(id)a6 remoteDeviceWebService:(id)a7 configurationType:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration *v18;
  PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration *v19;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = -[PKSubcredentialProvisioningConfiguration initWithConfigurationType:](self, "initWithConfigurationType:", a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_invitation, a3);
    v19->_canRequestInvitation = a4;
    v19->_declineRelatedInvitations = a5;
    objc_storeStrong((id *)&v19->_remoteDeviceWebService, a7);
    objc_storeStrong((id *)&v19->_localDeviceWebService, a6);
  }

  return v19;
}

- (id)transitionTable
{
  return objc_alloc_init(PKSubcredentialProvisioningRemoteDeviceProvisioningTransitionTable);
}

- (int64_t)startingState
{
  if (self->_canRequestInvitation)
    return 14;
  else
    return 15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_canRequestInvitation)
    v5 = "yes";
  else
    v5 = "no";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; invitation: %@; is requesting: %s >"),
               v4,
               self,
               self->_invitation,
               v5);
}

- (PKAppletSubcredentialSharingInvitation)invitation
{
  return self->_invitation;
}

- (BOOL)canRequestInvitation
{
  return self->_canRequestInvitation;
}

- (BOOL)declineRelatedInvitations
{
  return self->_declineRelatedInvitations;
}

- (PKPaymentWebService)remoteDeviceWebService
{
  return self->_remoteDeviceWebService;
}

- (PKPaymentWebService)localDeviceWebService
{
  return self->_localDeviceWebService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceWebService, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end
