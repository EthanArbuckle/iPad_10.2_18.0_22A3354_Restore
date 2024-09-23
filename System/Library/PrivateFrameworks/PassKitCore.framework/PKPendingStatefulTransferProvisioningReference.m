@implementation PKPendingStatefulTransferProvisioningReference

- (PKPendingStatefulTransferProvisioningReference)init
{

  return 0;
}

- (PKPendingStatefulTransferProvisioningReference)initWithInvitationURL:(id)a3 share:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PKPendingStatefulTransferProvisioningReference *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)PKPendingStatefulTransferProvisioningReference;
  v10 = -[PKPendingProvisioning initWithUniqueIdentifier:status:](&v12, sel_initWithUniqueIdentifier_status_, v9, 1);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_invitationURL, a3);
    objc_storeStrong((id *)&v10->_share, a4);
  }

  return v10;
}

- (id)type
{
  return CFSTR("StatefulTransferReference");
}

- (BOOL)representsCredential:(id)a3
{
  return 0;
}

- (BOOL)representsPass:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingStatefulTransferProvisioningReference)initWithCoder:(id)a3
{
  id v4;
  PKPendingStatefulTransferProvisioningReference *v5;
  uint64_t v6;
  NSString *invitationURL;
  uint64_t v8;
  PKPassShare *share;
  uint64_t v10;
  NSString *accountAttestationAnonymizationSalt;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPendingStatefulTransferProvisioningReference;
  v5 = -[PKPendingProvisioning initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    invitationURL = v5->_invitationURL;
    v5->_invitationURL = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("share"));
    v8 = objc_claimAutoreleasedReturnValue();
    share = v5->_share;
    v5->_share = (PKPassShare *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountAttestationAnonymizationSalt"));
    v10 = objc_claimAutoreleasedReturnValue();
    accountAttestationAnonymizationSalt = v5->_accountAttestationAnonymizationSalt;
    v5->_accountAttestationAnonymizationSalt = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPendingStatefulTransferProvisioningReference;
  v4 = a3;
  -[PKPendingProvisioning encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_invitationURL, CFSTR("invitationURL"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_share, CFSTR("share"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountAttestationAnonymizationSalt, CFSTR("accountAttestationAnonymizationSalt"));

}

- (void)_copyIntoPendingProvision:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPendingStatefulTransferProvisioningReference;
  v4 = a3;
  -[PKPendingProvisioning _copyIntoPendingProvision:](&v11, sel__copyIntoPendingProvision_, v4);
  v5 = -[NSString copy](self->_invitationURL, "copy", v11.receiver, v11.super_class);
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = -[PKPassShare copy](self->_share, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  v9 = -[NSString copy](self->_accountAttestationAnonymizationSalt, "copy");
  v10 = (void *)v4[9];
  v4[9] = v9;

}

- (NSString)invitationURL
{
  return self->_invitationURL;
}

- (PKPassShare)share
{
  return self->_share;
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
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_invitationURL, 0);
}

@end
