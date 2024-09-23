@implementation PKStatefulTransferCredential

- (PKStatefulTransferCredential)initWithSharingChannelHandle:(id)a3 invitation:(id)a4 share:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKStatefulTransferCredential *v12;
  PKStatefulTransferCredential *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKStatefulTransferCredential;
  v12 = -[PKPaymentCredential init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_handle, a3);
    objc_storeStrong((id *)&v13->_invitation, a4);
    objc_storeStrong((id *)&v13->_share, a5);
  }

  return v13;
}

- (PKSharingChannelHandle)handle
{
  return self->_handle;
}

- (PKSharingMessage)invitation
{
  return self->_invitation;
}

- (PKPassShare)share
{
  return self->_share;
}

- (NSString)originalShareURL
{
  return self->_originalShareURL;
}

- (void)setOriginalShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_originalShareURL, a3);
}

- (NSString)accountAttestationAnonymizationSalt
{
  return self->_accountAttestationAnonymizationSalt;
}

- (void)setAccountAttestationAnonymizationSalt:(id)a3
{
  objc_storeStrong((id *)&self->_accountAttestationAnonymizationSalt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountAttestationAnonymizationSalt, 0);
  objc_storeStrong((id *)&self->_originalShareURL, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
