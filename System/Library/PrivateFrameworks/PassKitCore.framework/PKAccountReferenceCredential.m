@implementation PKAccountReferenceCredential

- (PKAccountReferenceCredential)initWithAccountIdentifier:(id)a3 feature:(unint64_t)a4
{
  id v7;
  PKAccountReferenceCredential *v8;
  PKAccountReferenceCredential *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountReferenceCredential;
  v8 = -[PKPaymentCredential init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountIdentifier, a3);
    v9->_feature = a4;
    -[PKPaymentCredential setCardType:](v9, "setCardType:", 1);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountReferenceCredential *v4;
  BOOL v5;

  v4 = (PKAccountReferenceCredential *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKAccountReferenceCredential _isEqualToCredential:](self, "_isEqualToCredential:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  _QWORD *v4;
  NSString *accountIdentifier;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  _BOOL4 v11;
  BOOL v12;

  v4 = a3;
  accountIdentifier = self->_accountIdentifier;
  objc_msgSend(v4, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = accountIdentifier;
  v8 = v6;
  v9 = v8;
  if (v7 != v8)
  {
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (v10)
    {

    }
    else
    {
      v11 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (v11)
        goto LABEL_10;
    }
    v12 = 0;
    goto LABEL_12;
  }

LABEL_10:
  v12 = self->_feature == v4[14];
LABEL_12:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 1;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)feature
{
  return self->_feature;
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
