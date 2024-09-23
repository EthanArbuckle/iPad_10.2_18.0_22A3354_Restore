@implementation PKPaymentPrepareTransactionDetailsRequest

- (PKPaymentPrepareTransactionDetailsRequest)initWithMerchantSession:(id)a3 secureElementIdentifier:(id)a4 amount:(id)a5 currencyCode:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKPaymentPrepareTransactionDetailsRequest *v15;
  PKPaymentPrepareTransactionDetailsRequest *v16;
  uint64_t v17;
  NSString *secureElementIdentifier;
  uint64_t v19;
  NSString *currencyCode;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentPrepareTransactionDetailsRequest;
  v15 = -[PKOverlayableWebServiceRequest init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_merchantSession, a3);
    v17 = objc_msgSend(v12, "copy");
    secureElementIdentifier = v16->_secureElementIdentifier;
    v16->_secureElementIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v16->_amount, a5);
    v19 = objc_msgSend(v14, "copy");
    currencyCode = v16->_currencyCode;
    v16->_currencyCode = (NSString *)v19;

  }
  return v16;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber stringValue](self->_amount, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safelySetObject:forKey:", v10, CFSTR("amount"));

  objc_msgSend(v9, "safelySetObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  -[PKPaymentMerchantSession merchantIdentifier](self->_merchantSession, "merchantIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safelySetObject:forKey:", v11, CFSTR("merchantIdentifier"));

  -[PKPaymentMerchantSession merchantSessionIdentifier](self->_merchantSession, "merchantSessionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safelySetObject:forKey:", v12, CFSTR("merchantSessionIdentifier"));

  objc_msgSend(v9, "safelySetObject:forKey:", self->_secureElementIdentifier, CFSTR("seId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("version"));

  -[PKPaymentMerchantSession initiative](self->_merchantSession, "initiative");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("virtual_card"));

  if (v15)
    v16 = &unk_1E2C3E290;
  else
    v16 = &unk_1E2C3E278;
  objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("imageSegments"));
  objc_msgSend((id)objc_opt_class(), "serverSupportedLanguages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preferredLocalizations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safelySetObject:forKey:", v20, CFSTR("preferredLanguages"));
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v8, &unk_1E2C3E2A8, 0, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHTTPBody:", v22);

  v23 = (void *)objc_msgSend(v21, "copy");
  return v23;
}

+ (id)serverSupportedLanguages
{
  if (qword_1EE1DB660 != -1)
    dispatch_once(&qword_1EE1DB660, &__block_literal_global_1446);
  return (id)objc_msgSend((id)_MergedGlobals_9, "copy");
}

void __69__PKPaymentPrepareTransactionDetailsRequest_serverSupportedLanguages__block_invoke()
{
  void *v0;

  v0 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = (uint64_t)&unk_1E2C3E2C0;

}

- (PKPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
  objc_storeStrong((id *)&self->_merchantSession, a3);
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
}

@end
