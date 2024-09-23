@implementation PKPaymentOfferActionResult

- (PKPaymentOfferActionResult)initWithSessionIdentifier:(id)a3 provisioningCredentialIdentifier:(id)a4 provisioningCardIconURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPaymentOfferActionResult *v11;
  uint64_t v12;
  NSString *sessionIdentifier;
  uint64_t v14;
  NSString *provisioningCredentialIdentifier;
  uint64_t v16;
  NSURL *provisioningCardIconURL;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentOfferActionResult;
  v11 = -[PKPaymentOfferActionResult init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    sessionIdentifier = v11->_sessionIdentifier;
    v11->_sessionIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    provisioningCredentialIdentifier = v11->_provisioningCredentialIdentifier;
    v11->_provisioningCredentialIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    provisioningCardIconURL = v11->_provisioningCardIconURL;
    v11->_provisioningCardIconURL = (NSURL *)v16;

  }
  return v11;
}

+ (id)paymentOfferActionResultFromQueryItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_80);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_15_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
LABEL_3:
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSessionIdentifier:provisioningCredentialIdentifier:provisioningCardIconURL:", v6, v8, v11);
LABEL_6:

  return v12;
}

uint64_t __69__PKPaymentOfferActionResult_paymentOfferActionResultFromQueryItems___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == CFSTR("sessionIdentifier"))
  {
    v4 = 1;
  }
  else if (v2)
  {
    v4 = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("sessionIdentifier"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __69__PKPaymentOfferActionResult_paymentOfferActionResultFromQueryItems___block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == CFSTR("provisioningCredentialIdentifier"))
  {
    v4 = 1;
  }
  else if (v2)
  {
    v4 = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("provisioningCredentialIdentifier"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __69__PKPaymentOfferActionResult_paymentOfferActionResultFromQueryItems___block_invoke_3(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == CFSTR("provisioningCardIconURL"))
  {
    v4 = 1;
  }
  else if (v2)
  {
    v4 = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("provisioningCardIconURL"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferActionResult)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferActionResult *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  uint64_t v8;
  NSString *provisioningCredentialIdentifier;
  uint64_t v10;
  NSURL *provisioningCardIconURL;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferActionResult;
  v5 = -[PKPaymentOfferActionResult init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningCredentialIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    provisioningCredentialIdentifier = v5->_provisioningCredentialIdentifier;
    v5->_provisioningCredentialIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningCardIconURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    provisioningCardIconURL = v5->_provisioningCardIconURL;
    v5->_provisioningCardIconURL = (NSURL *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sessionIdentifier;
  id v5;

  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provisioningCredentialIdentifier, CFSTR("provisioningCredentialIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provisioningCardIconURL, CFSTR("provisioningCardIconURL"));

}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)provisioningCredentialIdentifier
{
  return self->_provisioningCredentialIdentifier;
}

- (NSURL)provisioningCardIconURL
{
  return self->_provisioningCardIconURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningCardIconURL, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
