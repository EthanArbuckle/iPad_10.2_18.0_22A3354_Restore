@implementation PKPaymentDigitalIssuanceProductCredential

- (PKPaymentDigitalIssuanceProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4 balance:(id)a5
{
  return -[PKPaymentDigitalIssuanceProductCredential initWithPaymentSetupProduct:purchase:balance:serviceProviderProduct:item:currency:](self, "initWithPaymentSetupProduct:purchase:balance:serviceProviderProduct:item:currency:", a3, a4, a5, 0, 0, 0);
}

- (PKPaymentDigitalIssuanceProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4 serviceProviderProduct:(id)a5 item:(id)a6 currency:(id)a7
{
  return -[PKPaymentDigitalIssuanceProductCredential initWithPaymentSetupProduct:purchase:balance:serviceProviderProduct:item:currency:](self, "initWithPaymentSetupProduct:purchase:balance:serviceProviderProduct:item:currency:", a3, a4, 0, a5, a6, a7);
}

- (PKPaymentDigitalIssuanceProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4 balance:(id)a5 serviceProviderProduct:(id)a6 item:(id)a7 currency:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PKPaymentDigitalIssuanceProductCredential *v21;
  PKPaymentDigitalIssuanceProductCredential *v22;
  void *v23;
  void *v24;
  PKCurrencyAmount *v25;
  void *v26;
  PKCurrencyAmount *v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = -[PKPaymentCredential init](self, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_product, a3);
    objc_msgSend(v15, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "productIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDigitalIssuanceProductCredential setProductIdentifier:](v22, "setProductIdentifier:", v24);

    -[PKPaymentDigitalIssuanceProductCredential setPurchase:](v22, "setPurchase:", v16);
    -[PKPaymentDigitalIssuanceProductCredential setBalance:](v22, "setBalance:", v17);
    -[PKPaymentDigitalIssuanceProductCredential setServiceProviderProduct:](v22, "setServiceProviderProduct:", v18);
    -[PKPaymentDigitalIssuanceProductCredential setServiceProviderItem:](v22, "setServiceProviderItem:", v19);
    -[PKPaymentDigitalIssuanceProductCredential setCurrency:](v22, "setCurrency:", v20);
    if (v19)
    {
      v25 = [PKCurrencyAmount alloc];
      objc_msgSend(v19, "amount");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[PKCurrencyAmount initWithAmount:currency:exponent:](v25, "initWithAmount:currency:exponent:", v26, v20, 0);

      -[PKPaymentDigitalIssuanceProductCredential setPrice:](v22, "setPrice:", v27);
    }
  }

  return v22;
}

- (id)metadata
{
  PKCurrencyAmount *balance;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  balance = self->_balance;
  if (balance)
  {
    -[PKCurrencyAmount currency](balance, "currency");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[PKCurrencyAmount amount](self->_balance, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_BALANCE_METADATA_NAME"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_currency;
    -[PKCurrencyAmount amount](self->_price, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3940];
    -[PKDigitalIssuanceServiceProviderItem localizedDisplayName](self->_serviceProviderItem, "localizedDisplayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6)
    v11 = v4 == 0;
  else
    v11 = 1;
  if (v11 || v7 == 0)
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v18[0] = CFSTR("valueType");
    v18[1] = CFSTR("value");
    v19[0] = CFSTR("currency");
    v19[1] = v6;
    v18[2] = CFSTR("currencyCode");
    v18[3] = CFSTR("localizedDisplayName");
    v19[2] = v4;
    v19[3] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:](PKPaymentCredentialMetadata, "paymentCredentialMetadataWithConfiguration:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)setupProductIdentifier
{
  return self->_productIdentifier;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PKServiceProviderPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_purchase, a3);
}

- (PKCurrencyAmount)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (PKCurrencyAmount)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (PKDigitalIssuanceServiceProviderProduct)serviceProviderProduct
{
  return self->_serviceProviderProduct;
}

- (void)setServiceProviderProduct:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderProduct, a3);
}

- (PKDigitalIssuanceServiceProviderItem)serviceProviderItem
{
  return self->_serviceProviderItem;
}

- (void)setServiceProviderItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderItem, a3);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_storeStrong((id *)&self->_currency, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_serviceProviderItem, 0);
  objc_storeStrong((id *)&self->_serviceProviderProduct, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
