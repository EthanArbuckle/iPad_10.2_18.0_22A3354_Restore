@implementation PKSubcredentialInvitationFlowControllerContext

- (PKSubcredentialInvitationFlowControllerContext)initWithInvitation:(id)a3 localDeviceWebService:(id)a4 remoteDeviceWebService:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKSubcredentialInvitationFlowControllerContext *v12;
  PKSubcredentialInvitationFlowControllerContext *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[PKSubcredentialProvisioningFlowControllerContext initWithFlowType:](self, "initWithFlowType:", 5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localDeviceInvitation, a3);
    -[PKSubcredentialProvisioningFlowControllerContext setLocalDeviceWebService:](v13, "setLocalDeviceWebService:", v10);
    -[PKSubcredentialProvisioningFlowControllerContext setRemoteDeviceWebService:](v13, "setRemoteDeviceWebService:", v11);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSubcredentialInvitationFlowControllerContext;
  v4 = -[PKSubcredentialProvisioningFlowControllerContext copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setLocalDeviceInvitation:", self->_localDeviceInvitation);
  objc_msgSend(v4, "setRemoteDeviceInvitation:", self->_remoteDeviceInvitation);
  objc_msgSend(v4, "setAcceptLocalDeviceInvitation:", self->_acceptLocalDeviceInvitation);
  objc_msgSend(v4, "setAcceptLocalDeviceInvitationDisplayableError:", self->_acceptLocalDeviceInvitationDisplayableError);
  objc_msgSend(v4, "setAcceptRemoteDeviceInvitation:", self->_acceptRemoteDeviceInvitation);
  objc_msgSend(v4, "setAcceptRemoteDeviceInvitationDisplayableError:", self->_acceptRemoteDeviceInvitationDisplayableError);
  return v4;
}

- (PKAppletSubcredentialSharingInvitation)localDeviceInvitation
{
  return self->_localDeviceInvitation;
}

- (void)setLocalDeviceInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceInvitation, a3);
}

- (PKAppletSubcredentialSharingInvitation)remoteDeviceInvitation
{
  return self->_remoteDeviceInvitation;
}

- (void)setRemoteDeviceInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceInvitation, a3);
}

- (BOOL)acceptLocalDeviceInvitation
{
  return self->_acceptLocalDeviceInvitation;
}

- (void)setAcceptLocalDeviceInvitation:(BOOL)a3
{
  self->_acceptLocalDeviceInvitation = a3;
}

- (NSError)acceptLocalDeviceInvitationDisplayableError
{
  return self->_acceptLocalDeviceInvitationDisplayableError;
}

- (void)setAcceptLocalDeviceInvitationDisplayableError:(id)a3
{
  objc_storeStrong((id *)&self->_acceptLocalDeviceInvitationDisplayableError, a3);
}

- (BOOL)acceptRemoteDeviceInvitation
{
  return self->_acceptRemoteDeviceInvitation;
}

- (void)setAcceptRemoteDeviceInvitation:(BOOL)a3
{
  self->_acceptRemoteDeviceInvitation = a3;
}

- (NSError)acceptRemoteDeviceInvitationDisplayableError
{
  return self->_acceptRemoteDeviceInvitationDisplayableError;
}

- (void)setAcceptRemoteDeviceInvitationDisplayableError:(id)a3
{
  objc_storeStrong((id *)&self->_acceptRemoteDeviceInvitationDisplayableError, a3);
}

- (BOOL)isShareActivation
{
  return self->_isShareActivation;
}

- (void)setIsShareActivation:(BOOL)a3
{
  self->_isShareActivation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptRemoteDeviceInvitationDisplayableError, 0);
  objc_storeStrong((id *)&self->_acceptLocalDeviceInvitationDisplayableError, 0);
  objc_storeStrong((id *)&self->_remoteDeviceInvitation, 0);
  objc_storeStrong((id *)&self->_localDeviceInvitation, 0);
}

@end
