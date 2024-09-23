@implementation PKAccountCredential

- (PKAccountCredential)initWithAccount:(id)a3
{
  id v5;
  PKAccountCredential *v6;
  PKAccountCredential *v7;
  id *p_account;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKAccountCredential;
    v6 = -[PKPaymentCredential init](&v10, sel_init);
    v7 = v6;
    if (v6)
    {
      p_account = (id *)&v6->_account;
      objc_storeStrong((id *)&v6->_account, a3);
      -[PKPaymentCredential setCardType:](v7, "setCardType:", 1);
      -[PKPaymentCredential setCredentialType:](v7, "setCredentialType:", PKAccountCredentialType(objc_msgSend(*p_account, "feature"), *p_account));
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountCredential *v4;
  BOOL v5;

  v4 = (PKAccountCredential *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKAccountCredential _isEqualToCredential:](self, "_isEqualToCredential:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  PKAccount *account;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  char v12;

  account = self->_account;
  v4 = a3;
  -[PKAccount accountIdentifier](account, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {
    v12 = 1;
  }
  else
  {
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    if (v11)
      v12 = 0;
    else
      v12 = objc_msgSend(v8, "isEqualToString:", v9);
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  v5 = PKCombinedHash(17, v3);
  return v5;
}

- (id)longDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = -[PKAccount feature](self->_account, "feature");
  return PKLocalizedFeatureString(CFSTR("APPLY_FLOW_ACCOUNT_TITLE"), v2, 0, v3, v4, v5, v6, v7, v9);
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (-[PKAccount type](self->_account, "type", a3) == 1)
  {
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountSummary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "creditLimit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v4, "currencyCode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PKFormattedCurrencyStringFromNumber(v6, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedFeatureString(CFSTR("APPLY_ON_FILE_SUBTITLE"), 2, CFSTR("%@"), v12, v13, v14, v15, v16, (uint64_t)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSString)ownershipTokenIdentifier
{
  return -[PKAccountWebServicePassDetailsResponse ownershipTokenIdentifier](self->_passDetailsResponse, "ownershipTokenIdentifier");
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 1;
}

- (PKAccount)account
{
  return self->_account;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPass, a3);
}

- (PKAccountWebServicePassDetailsResponse)passDetailsResponse
{
  return self->_passDetailsResponse;
}

- (void)setPassDetailsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_passDetailsResponse, a3);
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
  objc_storeStrong((id *)&self->_passDetailsResponse, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
