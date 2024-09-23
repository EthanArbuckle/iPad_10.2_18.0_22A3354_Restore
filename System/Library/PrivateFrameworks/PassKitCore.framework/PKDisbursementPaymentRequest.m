@implementation PKDisbursementPaymentRequest

- (PKDisbursementPaymentRequest)initWithDisbursementRequest:(id)a3
{
  id v4;
  PKDisbursementPaymentRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKDisbursementPaymentRequest;
  v5 = -[PKPaymentRequest init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "merchantIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setMerchantIdentifier:](v5, "setMerchantIdentifier:", v6);

    objc_msgSend(v4, "regionCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setCountryCode:](v5, "setCountryCode:", v7);

    objc_msgSend(v4, "supportedNetworks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setSupportedNetworks:](v5, "setSupportedNetworks:", v8);

    -[PKPaymentRequest setMerchantCapabilities:](v5, "setMerchantCapabilities:", objc_msgSend(v4, "merchantCapabilities"));
    objc_msgSend(v4, "summaryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setPaymentSummaryItems:](v5, "setPaymentSummaryItems:", v9);

    objc_msgSend(v4, "currencyCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setCurrencyCode:](v5, "setCurrencyCode:", v10);

    objc_msgSend(v4, "recipientContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setBillingContact:](v5, "setBillingContact:", v11);

    objc_msgSend(v4, "recipientContact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setShippingContact:](v5, "setShippingContact:", v12);

    objc_msgSend(v4, "applicationData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setApplicationData:](v5, "setApplicationData:", v13);

    objc_msgSend(v4, "supportedRegions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v4, "supportedRegions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest setSupportedCountries:](v5, "setSupportedCountries:", v17);

    }
    -[PKPaymentRequest setRequestType:](v5, "setRequestType:", 10);
    -[PKPaymentRequest setConfirmationStyle:](v5, "setConfirmationStyle:", 1);
    v18 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "requiredRecipientContactFields");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = v19;
    else
      v21 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v18, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v22);
    objc_msgSend(v23, "removeObject:", CFSTR("post"));
    if (objc_msgSend(v22, "containsObject:", CFSTR("post")))
    {
      objc_msgSend(v23, "removeObject:", CFSTR("name"));
      objc_msgSend(v23, "removeObject:", CFSTR("phoneticName"));
    }
    v24 = (void *)objc_msgSend(v22, "copy");
    -[PKPaymentRequest setRequiredBillingContactFields:](v5, "setRequiredBillingContactFields:", v24);

    v25 = (void *)objc_msgSend(v23, "copy");
    -[PKPaymentRequest setRequiredShippingContactFields:](v5, "setRequiredShippingContactFields:", v25);

  }
  return v5;
}

@end
