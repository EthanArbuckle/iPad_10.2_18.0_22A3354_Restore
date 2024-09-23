@implementation PKSubcredentialProvisioningOperationContext

- (PKSubcredentialProvisioningOperationContext)initWithQueue:(id)a3
{
  id v5;
  PKSubcredentialProvisioningOperationContext *v6;
  PKSubcredentialProvisioningOperationContext *v7;

  v5 = a3;
  v6 = -[PKSubcredentialProvisioningOperationContext init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_operationQueue, a3);

  return v7;
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

- (PKAppletSubcredential)addedCredential
{
  return self->_addedCredential;
}

- (void)setAddedCredential:(id)a3
{
  objc_storeStrong((id *)&self->_addedCredential, a3);
}

- (PKSubcredentialEncryptedContainer)registrationData
{
  return self->_registrationData;
}

- (void)setRegistrationData:(id)a3
{
  objc_storeStrong((id *)&self->_registrationData, a3);
}

- (NSData)trackingAttestation
{
  return self->_trackingAttestation;
}

- (void)setTrackingAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_trackingAttestation, a3);
}

- (PKSubcredentialEncryptedContainer)vehicleMobilizationEncryptedContainer
{
  return self->_vehicleMobilizationEncryptedContainer;
}

- (void)setVehicleMobilizationEncryptedContainer:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleMobilizationEncryptedContainer, a3);
}

- (PKAppletSubcredentialSharingInvitation)sentInvitation
{
  return self->_sentInvitation;
}

- (void)setSentInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_sentInvitation, a3);
}

- (BOOL)hasAcceptedInvitation
{
  return self->_hasAcceptedInvitation;
}

- (void)setHasAcceptedInvitation:(BOOL)a3
{
  self->_hasAcceptedInvitation = a3;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (PKPaymentPass)downloadedPass
{
  return self->_downloadedPass;
}

- (void)setDownloadedPass:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedPass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedPass, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_sentInvitation, 0);
  objc_storeStrong((id *)&self->_vehicleMobilizationEncryptedContainer, 0);
  objc_storeStrong((id *)&self->_trackingAttestation, 0);
  objc_storeStrong((id *)&self->_registrationData, 0);
  objc_storeStrong((id *)&self->_addedCredential, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
