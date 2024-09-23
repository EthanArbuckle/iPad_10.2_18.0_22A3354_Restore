@implementation PKPendingAccountCredential

- (PKPendingAccountCredential)init
{

  return 0;
}

- (id)initForDatabase
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPendingAccountCredential;
  return -[PKPendingAccountCredential init](&v3, sel_init);
}

- (PKPendingAccountCredential)initWithAccountCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKPendingAccountCredential *v7;
  uint64_t v8;
  NSString *accountIdentifier;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)PKPendingAccountCredential;
  v7 = -[PKPendingProvisioning initWithUniqueIdentifier:status:](&v12, sel_initWithUniqueIdentifier_status_, v6, 1);

  if (v7)
  {
    objc_msgSend(v5, "accountIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v7->_accountIdentifier;
    v7->_accountIdentifier = (NSString *)v8;

    v7->_feature = objc_msgSend(v5, "feature");
    objc_msgSend(v4, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPendingProvisioning setProvisioningState:](v7, "setProvisioningState:", v10);

  }
  return v7;
}

- (PKPendingAccountCredential)initWithAccountReferenceCredential:(id)a3
{
  id v4;
  void *v5;
  PKPendingAccountCredential *v6;
  uint64_t v7;
  NSString *accountIdentifier;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PKPendingAccountCredential;
  v6 = -[PKPendingProvisioning initWithUniqueIdentifier:status:](&v11, sel_initWithUniqueIdentifier_status_, v5, 1);

  if (v6)
  {
    objc_msgSend(v4, "accountIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = (NSString *)v7;

    v6->_feature = objc_msgSend(v4, "feature");
    objc_msgSend(v4, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPendingProvisioning setProvisioningState:](v6, "setProvisioningState:", v9);

  }
  return v6;
}

- (PKPendingAccountCredential)initWithAccountIdentifier:(id)a3 feature:(unint64_t)a4 sharingInstanceIdentifier:(id)a5
{
  id v9;
  id v10;
  PKPendingAccountCredential *v11;
  PKPendingAccountCredential *v12;
  PKSecureElementProvisioningState *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPendingAccountCredential;
  v11 = -[PKPendingProvisioning initWithUniqueIdentifier:status:](&v15, sel_initWithUniqueIdentifier_status_, v9, 1);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountIdentifier, a3);
    v12->_feature = a4;
    objc_storeStrong((id *)&v12->_sharingInstanceIdentifier, a5);
    v13 = objc_alloc_init(PKSecureElementProvisioningState);
    -[PKPendingProvisioning setProvisioningState:](v12, "setProvisioningState:", v13);

  }
  return v12;
}

- (id)type
{
  return CFSTR("AccountCredential");
}

- (BOOL)representsCredential:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  NSString *accountIdentifier;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  _BOOL4 v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  _BOOL4 v17;
  BOOL v18;

  v4 = a3;
  if (objc_msgSend(v4, "isAccountCredential"))
  {
    objc_msgSend(v4, "accountCredential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[NSString accountIdentifier](v6, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    accountIdentifier = self->_accountIdentifier;
    v9 = v7;
    v10 = accountIdentifier;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      if (!v9 || !v10)
      {

LABEL_17:
        v18 = 0;
        goto LABEL_18;
      }
      v12 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_17;
    }
    v18 = -[NSString feature](v6, "feature") == self->_feature;
LABEL_18:

LABEL_23:
    goto LABEL_24;
  }
  if (objc_msgSend(v4, "isAccountReferenceCredential"))
  {
    objc_msgSend(v4, "accountReferenceCredential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_accountIdentifier;
    v6 = v13;
    v15 = v14;
    if (v6 == v15)
    {

    }
    else
    {
      v16 = v15;
      if (!v6 || !v15)
      {

LABEL_22:
        v18 = 0;
        goto LABEL_23;
      }
      v17 = -[NSString isEqualToString:](v6, "isEqualToString:", v15);

      if (!v17)
        goto LABEL_22;
    }
    v18 = objc_msgSend(v5, "feature") == self->_feature;
    goto LABEL_23;
  }
  v18 = 0;
LABEL_24:

  return v18;
}

- (BOOL)representsPass:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  NSString *accountIdentifier;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "associatedAccountFeatureIdentifier") == self->_feature)
  {
    objc_msgSend(v4, "associatedAccountServiceAccountIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    accountIdentifier = self->_accountIdentifier;
    if (v5 && accountIdentifier)
      v8 = -[NSString isEqual:](v5, "isEqual:");
    else
      v8 = v5 == accountIdentifier;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)credential
{
  PKAccountReferenceCredential *v3;
  void *v4;
  void *v5;

  v3 = -[PKAccountReferenceCredential initWithAccountIdentifier:feature:]([PKAccountReferenceCredential alloc], "initWithAccountIdentifier:feature:", self->_accountIdentifier, self->_feature);
  -[PKAccountReferenceCredential setSharingInstanceIdentifier:](v3, "setSharingInstanceIdentifier:", self->_sharingInstanceIdentifier);
  -[PKPendingProvisioning provisioningState](self, "provisioningState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPendingProvisioning provisioningState](self, "provisioningState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentCredential setState:](v3, "setState:", v5);

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingAccountCredential)initWithCoder:(id)a3
{
  id v4;
  PKPendingAccountCredential *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  void *v8;
  uint64_t v9;
  NSString *sharingInstanceIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPendingAccountCredential;
  v5 = -[PKPendingProvisioning initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feature"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_feature = PKFeatureIdentifierFromString(v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingInstanceIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPendingAccountCredential;
  v4 = a3;
  -[PKPendingProvisioning encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"), v6.receiver, v6.super_class);
  PKFeatureIdentifierToString(self->_feature);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("feature"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifier"));
}

- (void)_copyIntoPendingProvision:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPendingAccountCredential;
  v4 = a3;
  -[PKPendingProvisioning _copyIntoPendingProvision:](&v9, sel__copyIntoPendingProvision_, v4);
  v5 = -[NSString copy](self->_accountIdentifier, "copy", v9.receiver, v9.super_class);
  v6 = (void *)v4[7];
  v4[7] = v5;

  v4[8] = self->_feature;
  v7 = -[NSString copy](self->_sharingInstanceIdentifier, "copy");
  v8 = (void *)v4[9];
  v4[9] = v7;

}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (unint64_t)feature
{
  return self->_feature;
}

- (void)setFeature:(unint64_t)a3
{
  self->_feature = a3;
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
