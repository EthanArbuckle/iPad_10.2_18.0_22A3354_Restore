@implementation PKTransactionReceiptAuthorizationRequest

- (PKTransactionReceiptAuthorizationRequest)initWithReceiptServiceIdentifier:(id)a3 receiptIdentifier:(id)a4 cardNumberSuffix:(id)a5 featureIdentifier:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  PKTransactionReceiptAuthorizationRequest *v13;
  uint64_t v14;
  NSString *receiptServiceIdentifier;
  uint64_t v16;
  NSString *receiptIdentifier;
  uint64_t v18;
  NSString *cardNumberSuffix;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKTransactionReceiptAuthorizationRequest;
  v13 = -[PKOverlayableWebServiceRequest init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    receiptServiceIdentifier = v13->_receiptServiceIdentifier;
    v13->_receiptServiceIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    receiptIdentifier = v13->_receiptIdentifier;
    v13->_receiptIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    cardNumberSuffix = v13->_cardNumberSuffix;
    v13->_cardNumberSuffix = (NSString *)v18;

    v13->_featureIdentifier = a6;
  }

  return v13;
}

- (PKTransactionReceiptAuthorizationRequest)initWithReceiptServiceIdentifier:(id)a3 receiptIdentifier:(id)a4 altDSID:(id)a5 featureIdentifier:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  PKTransactionReceiptAuthorizationRequest *v13;
  uint64_t v14;
  NSString *receiptServiceIdentifier;
  uint64_t v16;
  NSString *receiptIdentifier;
  uint64_t v18;
  NSString *altDSID;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKTransactionReceiptAuthorizationRequest;
  v13 = -[PKOverlayableWebServiceRequest init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    receiptServiceIdentifier = v13->_receiptServiceIdentifier;
    v13->_receiptServiceIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    receiptIdentifier = v13->_receiptIdentifier;
    v13->_receiptIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    altDSID = v13->_altDSID;
    v13->_altDSID = (NSString *)v18;

    v13->_featureIdentifier = a6;
  }

  return v13;
}

- (void)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 webService:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  unint64_t featureIdentifier;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v11 = a5;
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", a3, &unk_1E2C3E320, 0, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_receiptServiceIdentifier, CFSTR("receiptServiceIdentifier"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_receiptIdentifier, CFSTR("receiptIdentifier"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_cardNumberSuffix, CFSTR("paymentMethodIdentifier"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_altDSID, CFSTR("altDSID"));
  featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier)
  {
    PKFeatureIdentifierToString(featureIdentifier);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("featureIdentifier"));

  }
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPBody:", v16);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __116__PKTransactionReceiptAuthorizationRequest__urlRequestWithServiceURL_appleAccountInformation_webService_completion___block_invoke;
  v18[3] = &unk_1E2AD44F0;
  v19 = v10;
  v17 = v10;
  -[PKPaymentWebServiceRequest _signRequest:webService:completion:](self, "_signRequest:webService:completion:", v12, v11, v18);

}

void __116__PKTransactionReceiptAuthorizationRequest__urlRequestWithServiceURL_appleAccountInformation_webService_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (id)objc_msgSend(a2, "copy");
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (NSString)receiptServiceIdentifier
{
  return self->_receiptServiceIdentifier;
}

- (NSString)receiptIdentifier
{
  return self->_receiptIdentifier;
}

- (NSString)cardNumberSuffix
{
  return self->_cardNumberSuffix;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_cardNumberSuffix, 0);
  objc_storeStrong((id *)&self->_receiptIdentifier, 0);
  objc_storeStrong((id *)&self->_receiptServiceIdentifier, 0);
}

@end
