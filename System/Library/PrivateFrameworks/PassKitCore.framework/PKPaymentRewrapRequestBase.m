@implementation PKPaymentRewrapRequestBase

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 rewrapData:(id)a5 appleAccountInformation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int64_t type;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[PKPaymentRewrapRequestBase pass](self, "pass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "passTypeIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serialNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("devices"), v12, 0);

  type = self->_type;
  if ((unint64_t)(type - 2) < 4 || type == 0)
  {
    objc_msgSend(v17, "addObject:", CFSTR("passes"));
    objc_msgSend(v17, "addObject:", v15);
    objc_msgSend(v17, "addObject:", v16);
  }
  -[PKPaymentRewrapRequestBase endpointComponents](self, "endpointComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
    objc_msgSend(v17, "addObjectsFromArray:", v20);
  v34 = (void *)v15;
  v21 = self->_type;
  if (v21 > 5)
    v22 = 0;
  else
    v22 = off_1E2AD46A8[v21];
  v23 = (void *)objc_msgSend(v17, "copy");
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", v13, v22, v23, 0, v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setHTTPMethod:", CFSTR("POST"));
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v10)
  {
    objc_msgSend(v10, "platformData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hexEncoding");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:forKey:", v27, CFSTR("pairedSEP"));

    objc_msgSend(v10, "platformDataSignature");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hexEncoding");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:forKey:", v29, CFSTR("pairedSEPSignature"));

  }
  -[PKPaymentRewrapRequestBase bodyDictionary](self, "bodyDictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addEntriesFromDictionary:", v30);

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHTTPBody:", v31);

  v32 = (void *)objc_msgSend(v24, "copy");
  return v32;
}

- (NSArray)endpointComponents
{
  return 0;
}

- (id)bodyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSDictionary *serviceProviderData;
  NSString *paymentHash;
  NSDictionary *fundingSourceDetails;
  NSString *initiative;
  NSString *initiativeContext;
  NSString *merchantTokenManagementURL;
  NSString *remoteDeviceModel;
  NSString *userAgent;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t type;
  void *v36;
  void *v37;
  PKPaymentPass *pass;
  void *v39;
  void *v40;
  NSString *shippingAddressHash;
  NSString *deviceAssessments;
  void *v43;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD aBlock[5];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKWrappedPayment transactionData](self->_wrappedPayment, "transactionData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "hexEncoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("paymentData"));

  }
  -[PKWrappedPayment certificates](self->_wrappedPayment, "certificates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionary");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("casdCertificate"));
  v49 = (void *)v8;
  -[PKWrappedPayment transactionInstructionsSignature](self->_wrappedPayment, "transactionInstructionsSignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "hexEncoding");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("transactionInstructionsSignature"));

  }
  v48 = v10;
  -[PKPaymentRewrapRequestBase applicationData](self, "applicationData");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PKPaymentRewrapRequestBase applicationData](self, "applicationData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "SHA256Hash");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hexEncoding");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("applicationData"));

    }
  }
  -[PKWrappedPayment kextBlacklistVersion](self->_wrappedPayment, "kextBlacklistVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "length"))
    objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("kextBlacklistVersion"));
  -[PKWrappedPayment merchantCountryCode](self->_wrappedPayment, "merchantCountryCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v3, "setValue:forKey:", v18, CFSTR("merchantCountryCode"));
  -[PKSecureElementPass issuerCountryCode](self->_pass, "issuerCountryCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("issuerCountryCode"));
  -[PKSecureElementPass primaryAccountIdentifier](self->_pass, "primaryAccountIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v3, "setValue:forKey:", v20, CFSTR("primaryAccountIdentifier"));
  v46 = v5;
  v47 = v17;
  -[PKPaymentApplication dpanIdentifier](self->_paymentApplication, "dpanIdentifier", 112);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v3, "setValue:forKey:", v21, CFSTR("devicePrimaryAccountIdentifier"));
  PKPaymentCryptogramTypeToString(self->_cryptogramType);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v22, CFSTR("cryptogramType"));

  serviceProviderData = self->_serviceProviderData;
  if (serviceProviderData)
    objc_msgSend(v3, "setObject:forKey:", serviceProviderData, CFSTR("serviceProviderData"));
  paymentHash = self->_paymentHash;
  if (paymentHash)
    objc_msgSend(v3, "setObject:forKey:", paymentHash, CFSTR("paymentHash"));
  fundingSourceDetails = self->_fundingSourceDetails;
  if (fundingSourceDetails)
    objc_msgSend(v3, "setObject:forKey:", fundingSourceDetails, CFSTR("fundingSourceMetadata"));
  initiative = self->_initiative;
  if (initiative)
  {
    objc_msgSend(v3, "setObject:forKey:", initiative, CFSTR("initiative"));
    if (-[NSString isEqualToString:](self->_initiative, "isEqualToString:", CFSTR("merchant_token")))
      objc_msgSend(v3, "setObject:forKey:", self->_merchantTokenUseCase, CFSTR("merchantTokenUseCase"));
  }
  initiativeContext = self->_initiativeContext;
  if (initiativeContext)
    objc_msgSend(v3, "setObject:forKey:", initiativeContext, CFSTR("initiativeContext"));
  merchantTokenManagementURL = self->_merchantTokenManagementURL;
  if (merchantTokenManagementURL)
    objc_msgSend(v3, "setObject:forKey:", merchantTokenManagementURL, CFSTR("merchantTokenManagementURL"));
  remoteDeviceModel = self->_remoteDeviceModel;
  if (remoteDeviceModel)
    objc_msgSend(v3, "setObject:forKey:", remoteDeviceModel, CFSTR("remoteDeviceModel"));
  if (self->_isDeferredPayment)
    objc_msgSend(v3, "setObject:forKey:", &unk_1E2C40C38, CFSTR("tokenRequestAttributes"));
  userAgent = self->_userAgent;
  if (userAgent)
    objc_msgSend(v3, "setObject:forKey:", userAgent, CFSTR("webViewUserAgent"));
  if (-[NSString length](self->_remoteNetworkRequestPaymentTopicID, "length")
    || -[NSString length](self->_remoteNetworkRequestInitiatingUserAgent, "length"))
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (-[NSString length](self->_remoteNetworkRequestPaymentTopicID, "length"))
      objc_msgSend(v31, "setObject:forKeyedSubscript:", self->_remoteNetworkRequestPaymentTopicID, CFSTR("paymentTopicId"));
    if (-[NSString length](self->_remoteNetworkRequestInitiatingUserAgent, "length"))
      objc_msgSend(v31, "setObject:forKeyedSubscript:", self->_remoteNetworkRequestInitiatingUserAgent, CFSTR("userAgent"));
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("remoteRequestData"));

  }
  if (-[NSArray count](self->_multiTokenContexts, "count"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PKPaymentRewrapRequestBase_bodyDictionary__block_invoke;
    aBlock[3] = &unk_1E2AD45D0;
    aBlock[4] = self;
    v33 = _Block_copy(aBlock);
    -[NSArray pk_arrayByApplyingBlock:](self->_multiTokenContexts, "pk_arrayByApplyingBlock:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("paymentDataContext"));

  }
  type = self->_type;
  if (type == 1)
  {
    pass = self->_pass;
    v36 = v46;
    if (pass)
    {
      -[PKPass serialNumber](pass, "serialNumber");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("passSerialNumber"));

      -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("passTypeIdentifier"));

    }
  }
  else
  {
    v36 = v46;
    if (type == 3)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v45), "virtualCardIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("virtualCardNumberIdentifier"));

      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("virtual_card_refresh"), CFSTR("initiative"));
    }
  }
  shippingAddressHash = self->_shippingAddressHash;
  if (shippingAddressHash)
    objc_msgSend(v3, "setObject:forKey:", shippingAddressHash, CFSTR("shippingAddressHash"));
  deviceAssessments = self->_deviceAssessments;
  if (deviceAssessments)
    objc_msgSend(v3, "setObject:forKey:", deviceAssessments, CFSTR("deviceAssessments"));
  v43 = (void *)objc_msgSend(v3, "copy");

  return v43;
}

id __44__PKPaymentRewrapRequestBase_bodyDictionary__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDecimalNumber *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "merchantIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "SHA256Hash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hexEncoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("merchantIdentifier"));
  objc_msgSend(v4, "externalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("externalMerchantIdentifier"));

  objc_msgSend(v4, "merchantDomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("merchantDomain"));

  objc_msgSend(v4, "merchantName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("merchantName"));

  objc_msgSend(v4, "amount");
  v13 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

  PKCurrencyAmountCreate(v13, *(NSString **)(*(_QWORD *)(a1 + 32) + 160), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "amountByConvertingToSmallestCommonCurrencyUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("transactionAmount"));

  v17 = (void *)objc_msgSend(v5, "copy");
  return v17;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void)setPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplication, a3);
}

- (PKWrappedPayment)wrappedPayment
{
  return self->_wrappedPayment;
}

- (void)setWrappedPayment:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedPayment, a3);
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)cryptogramType
{
  return self->_cryptogramType;
}

- (void)setCryptogramType:(int64_t)a3
{
  self->_cryptogramType = a3;
}

- (NSDictionary)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void)setServiceProviderData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (void)setPaymentHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)initiative
{
  return self->_initiative;
}

- (void)setInitiative:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)merchantTokenUseCase
{
  return self->_merchantTokenUseCase;
}

- (void)setMerchantTokenUseCase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)initiativeContext
{
  return self->_initiativeContext;
}

- (void)setInitiativeContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)merchantTokenManagementURL
{
  return self->_merchantTokenManagementURL;
}

- (void)setMerchantTokenManagementURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)isDeferredPayment
{
  return self->_isDeferredPayment;
}

- (void)setIsDeferredPayment:(BOOL)a3
{
  self->_isDeferredPayment = a3;
}

- (NSArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (void)setMultiTokenContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSDictionary)fundingSourceDetails
{
  return self->_fundingSourceDetails;
}

- (void)setFundingSourceDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)shippingAddressHash
{
  return self->_shippingAddressHash;
}

- (void)setShippingAddressHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)deviceAssessments
{
  return self->_deviceAssessments;
}

- (void)setDeviceAssessments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)remoteDeviceModel
{
  return self->_remoteDeviceModel;
}

- (void)setRemoteDeviceModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)remoteNetworkRequestPaymentTopicID
{
  return self->_remoteNetworkRequestPaymentTopicID;
}

- (void)setRemoteNetworkRequestPaymentTopicID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)remoteNetworkRequestInitiatingUserAgent
{
  return self->_remoteNetworkRequestInitiatingUserAgent;
}

- (void)setRemoteNetworkRequestInitiatingUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteNetworkRequestInitiatingUserAgent, 0);
  objc_storeStrong((id *)&self->_remoteNetworkRequestPaymentTopicID, 0);
  objc_storeStrong((id *)&self->_remoteDeviceModel, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_deviceAssessments, 0);
  objc_storeStrong((id *)&self->_shippingAddressHash, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_fundingSourceDetails, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_merchantTokenManagementURL, 0);
  objc_storeStrong((id *)&self->_initiativeContext, 0);
  objc_storeStrong((id *)&self->_merchantTokenUseCase, 0);
  objc_storeStrong((id *)&self->_initiative, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_paymentHash, 0);
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_wrappedPayment, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
