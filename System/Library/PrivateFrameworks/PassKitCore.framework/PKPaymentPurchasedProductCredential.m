@implementation PKPaymentPurchasedProductCredential

- (PKPaymentPurchasedProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4
{
  id v7;
  id v8;
  PKPaymentPurchasedProductCredential *v9;
  PKPaymentPurchasedProductCredential *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *productIdentifier;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = -[PKPaymentCredential init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_product, a3);
    objc_msgSend(v7, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "productIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    productIdentifier = v10->_productIdentifier;
    v10->_productIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v10->_purchase, a4);
    objc_msgSend(v7, "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    -[PKPaymentCredential setLongDescription:](v10, "setLongDescription:", v16);

  }
  return v10;
}

- (id)metadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKServiceProviderPurchase visibleTransactionIdentifier](self->_purchase, "visibleTransactionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (-[PKServiceProviderPurchase identifier](self->_purchase, "identifier"),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18[0] = CFSTR("valueType");
    v18[1] = CFSTR("value");
    v19[0] = CFSTR("text");
    v19[1] = v4;
    v18[2] = CFSTR("localizedDisplayName");
    PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_TRANSACTION_ID_METADATA_NAME"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:](PKPaymentCredentialMetadata, "paymentCredentialMetadataWithConfiguration:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[PKServiceProviderPurchase purchaseDate](self->_purchase, "purchaseDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB36A8];
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate:timeZone:formatOptions:", v8, v10, 1907);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = CFSTR("valueType");
    v16[1] = CFSTR("value");
    v17[0] = CFSTR("date");
    v17[1] = v11;
    v17[2] = CFSTR("EdMMMyyyy");
    v16[2] = CFSTR("displayFormat");
    v16[3] = CFSTR("localizedDisplayName");
    PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_DATE_METADATA_NAME"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:](PKPaymentCredentialMetadata, "paymentCredentialMetadataWithConfiguration:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  return v3;
}

- (NSString)summaryMetadataDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKServiceProviderPurchase purchaseDate](self->_purchase, "purchaseDate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    PKShortDateString(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_STATUS_TEXT_DATE_PURCHASED"), CFSTR("%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKPaymentPurchasedProductCredential statusDescription](self, "statusDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v6;
}

- (NSString)statusDescription
{
  void *v2;
  NSObject *v3;
  __CFString *v5;
  uint8_t v6[16];

  v2 = -[PKServiceProviderPurchase state](self->_purchase, "state");
  switch((unint64_t)v2)
  {
    case 0uLL:
      PKLogFacilityTypeGetObject(6uLL);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Invalid purchase state: Unknown", v6, 2u);
      }

      return (NSString *)&stru_1E2ADF4C0;
    case 1uLL:
      v5 = CFSTR("SETUP_PURCHASE_STATE_METADATA_PENDING");
      goto LABEL_8;
    case 2uLL:
      v5 = CFSTR("SETUP_PURCHASE_STATE_METADATA_COMPLETE");
      goto LABEL_8;
    case 3uLL:
      v5 = CFSTR("SETUP_PURCHASE_STATE_METADATA_REFUNDED");
LABEL_8:
      PKLocalizedPaymentString(&v5->isa, 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return (NSString *)v2;
  }
  return (NSString *)v2;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPurchasedProductCredential statusDescription](self, "statusDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  -[PKPaymentPurchasedProductCredential metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v5);

  objc_msgSend(v3, "safelyAddObject:", self->_productIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_purchase);
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPurchasedProductCredential;
  v6 = -[PKPaymentCredential hash](&v9, sel_hash);
  v7 = PKCombinedHash((uint64_t)v6, v3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[PKPaymentPurchasedProductCredential isEqualToPaymentPurchasedProductCredential:](self, "isEqualToPaymentPurchasedProductCredential:", v4);

  return v5;
}

- (BOOL)isEqualToPaymentPurchasedProductCredential:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  _BOOL4 v19;
  PKServiceProviderPurchase *purchase;
  PKServiceProviderPurchase *v21;

  v4 = a3;
  -[PKPaymentPurchasedProductCredential statusDescription](self, "statusDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  v10 = 0;
  v11 = v8;
  v12 = v7;
  if (!v7 || !v8)
    goto LABEL_23;
  v13 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v13)
  {
LABEL_7:
    -[PKPaymentPurchasedProductCredential metadata](self, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v14 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v14;
    if (v12 && v14)
    {
      if ((objc_msgSend(v12, "isEqual:", v14) & 1) == 0)
        goto LABEL_22;
    }
    else if (v12 != (void *)v14)
    {
      goto LABEL_22;
    }
    v15 = (void *)v4[14];
    v16 = self->_productIdentifier;
    v17 = v15;
    if (v16 == v17)
    {

      goto LABEL_18;
    }
    v18 = v17;
    if (v16 && v17)
    {
      v19 = -[NSString isEqualToString:](v16, "isEqualToString:", v17);

      if (!v19)
        goto LABEL_22;
LABEL_18:
      purchase = self->_purchase;
      v21 = (PKServiceProviderPurchase *)v4[15];
      if (purchase && v21)
        v10 = -[PKServiceProviderPurchase isEqual:](purchase, "isEqual:");
      else
        v10 = purchase == v21;
      goto LABEL_23;
    }

LABEL_22:
    v10 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v10 = 0;
LABEL_24:

  return v10;
}

- (id)setupProductIdentifier
{
  return self->_productIdentifier;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_storeStrong((id *)&self->_product, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
