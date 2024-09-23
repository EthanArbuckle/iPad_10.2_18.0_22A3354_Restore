@implementation PKPaymentContactlessProductCredential

- (PKPaymentContactlessProductCredential)init
{
  return -[PKPaymentContactlessProductCredential initWithPaymentSetupProduct:](self, "initWithPaymentSetupProduct:", 0);
}

- (PKPaymentContactlessProductCredential)initWithPaymentSetupProduct:(id)a3
{
  id v5;
  PKPaymentContactlessProductCredential *v6;
  PKPaymentContactlessProductCredential *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentContactlessProductCredential;
  v6 = -[PKPaymentCredential init](&v17, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_11;
  objc_storeStrong((id *)&v6->_product, a3);
  objc_msgSend(v5, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "productIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentContactlessProductCredential setProductIdentifier:](v7, "setProductIdentifier:", v9);

  if (!PKPaymentSetupMergeProductsPartnersAPIEnabled())
  {
    if ((objc_msgSend(v5, "supportedProvisioningMethods") & 1) == 0)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(v5, "provisioningMethodMetadataForType:", CFSTR("readerMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "readerModeMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentContactlessProductCredential setReaderModeMetadata:](v7, "setReaderModeMetadata:", v12);

    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "supportsProvisioningMethodForType:", 1) & 1) != 0)
    goto LABEL_7;
LABEL_4:
  objc_msgSend(v5, "readerModeMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_9;
  objc_msgSend(v5, "readerModeMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentContactlessProductCredential setReaderModeMetadata:](v7, "setReaderModeMetadata:", v11);
LABEL_8:

LABEL_9:
  objc_msgSend(v5, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCredential setCardType:](v7, "setCardType:", -[PKPaymentContactlessProductCredential _cardTypeFromSetupProductType:](v7, "_cardTypeFromSetupProductType:", objc_msgSend(v13, "type")));

  objc_msgSend(v5, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "featureIdentifier");

  if (v15)
    -[PKPaymentCredential setCredentialType:](v7, "setCredentialType:", PKAccountCredentialType(v15, 0));
LABEL_11:

  return v7;
}

- (PKPaymentContactlessProductCredential)initWithPaymentSetupProduct:(id)a3 cardSessionToken:(id)a4
{
  id v7;
  PKPaymentContactlessProductCredential *v8;
  PKPaymentContactlessProductCredential *v9;

  v7 = a4;
  v8 = -[PKPaymentContactlessProductCredential initWithPaymentSetupProduct:](self, "initWithPaymentSetupProduct:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_cardSessionToken, a4);

  return v9;
}

- (int64_t)_cardTypeFromSetupProductType:(unint64_t)a3
{
  if (a3 - 1 > 0xA)
    return 0;
  else
    return qword_190454FB8[a3 - 1];
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

- (NSDictionary)readerModeMetadata
{
  return self->_readerModeMetadata;
}

- (void)setReaderModeMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)cardSessionToken
{
  return self->_cardSessionToken;
}

- (void)setCardSessionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSessionToken, 0);
  objc_storeStrong((id *)&self->_readerModeMetadata, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
