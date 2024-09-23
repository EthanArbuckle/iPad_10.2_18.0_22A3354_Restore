@implementation PKPeerPaymentRequest

- (PKPeerPaymentRequest)initWithPeerPaymentQuote:(id)a3
{
  id v5;
  PKPeerPaymentRequest *v6;
  PKPeerPaymentRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKPeerPaymentRequest;
  v6 = -[PKPaymentRequest init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peerPaymentQuote, a3);
    -[PKPaymentRequest setRequestType:](v7, "setRequestType:", 9);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setRequiredShippingContactFields:](v7, "setRequiredShippingContactFields:", v8);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setRequiredBillingContactFields:](v7, "setRequiredBillingContactFields:", v9);

    objc_msgSend(v5, "totalReceiveAmountCurrency");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setCurrencyCode:](v7, "setCurrencyCode:", v10);

    objc_msgSend(v5, "firstQuoteItemOfType:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "merchantIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest setMerchantIdentifier:](v7, "setMerchantIdentifier:", v13);

      objc_msgSend(v12, "supportedNetworks");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest setSupportedNetworks:](v7, "setSupportedNetworks:", v14);

      -[PKPaymentRequest setMerchantCapabilities:](v7, "setMerchantCapabilities:", objc_msgSend(v12, "merchantCapabilities"));
      objc_msgSend(v12, "countryCode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest setCountryCode:](v7, "setCountryCode:", v15);

      v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v12, "countryCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pk_safelyAddObject:", v17);

      objc_msgSend(v12, "supportedFundingSourceCountryCodes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19)
      {
        objc_msgSend(v12, "supportedFundingSourceCountryCodes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "unionSet:", v20);

      }
      v21 = (void *)objc_msgSend(v16, "copy");
      -[PKPaymentRequest setSupportedCountries:](v7, "setSupportedCountries:", v21);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("post"), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest setRequiredBillingContactFields:](v7, "setRequiredBillingContactFields:", v22);

    }
    objc_msgSend(v5, "firstQuoteItemOfType:", 3);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstQuoteItemOfType:", 4);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v23 | v24)
    {
      -[PKPaymentRequest setConfirmationStyle:](v7, "setConfirmationStyle:", 1);
      if (v24)
      {
        -[PKPaymentRequest setSupportsInstantFundsIn:](v7, "setSupportsInstantFundsIn:", 1);
        objc_msgSend((id)v24, "supportedNetworks");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentRequest setSupportedNetworks:](v7, "setSupportedNetworks:", v25);

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("post"), 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentRequest setRequiredBillingContactFields:](v7, "setRequiredBillingContactFields:", v26);

      }
    }
    -[PKPaymentRequest setClientCallbackTimeout:](v7, "setClientCallbackTimeout:", 65.0);

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  PKPeerPaymentQuote *peerPaymentQuote;
  PKPeerPaymentQuote *v7;
  PKPeerPaymentQuote *v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)PKPeerPaymentRequest;
    if (-[PKPaymentRequest isEqual:](&v13, sel_isEqual_, v4))
    {
      v5 = (unsigned __int8 *)v4;
      peerPaymentQuote = self->_peerPaymentQuote;
      objc_msgSend(v5, "peerPaymentQuote");
      v7 = (PKPeerPaymentQuote *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (peerPaymentQuote)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (v9)
      {

        if (peerPaymentQuote == v8)
        {
LABEL_12:
          v10 = self->_hasUndeterminedRecipient == v5[544];
          goto LABEL_13;
        }
      }
      else
      {
        v11 = -[PKPeerPaymentQuote isEqual:](peerPaymentQuote, "isEqual:", v7);

        if (v11)
          goto LABEL_12;
      }
      v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_peerPaymentQuote);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRequest)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentRequest *v5;
  uint64_t v6;
  PKPeerPaymentQuote *peerPaymentQuote;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentRequest;
  v5 = -[PKPaymentRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentQuote"));
    v6 = objc_claimAutoreleasedReturnValue();
    peerPaymentQuote = v5->_peerPaymentQuote;
    v5->_peerPaymentQuote = (PKPeerPaymentQuote *)v6;

    v5->_hasUndeterminedRecipient = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasUndeterminedRecipient"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentRequest;
  v4 = a3;
  -[PKPaymentRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_peerPaymentQuote, CFSTR("peerPaymentQuote"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasUndeterminedRecipient, CFSTR("hasUndeterminedRecipient"));

}

- (PKPeerPaymentQuote)peerPaymentQuote
{
  return self->_peerPaymentQuote;
}

- (BOOL)hasUndeterminedRecipient
{
  return self->_hasUndeterminedRecipient;
}

- (void)setHasUndeterminedRecipient:(BOOL)a3
{
  self->_hasUndeterminedRecipient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentQuote, 0);
}

@end
