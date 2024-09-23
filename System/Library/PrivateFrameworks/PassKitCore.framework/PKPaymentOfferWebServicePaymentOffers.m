@implementation PKPaymentOfferWebServicePaymentOffers

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSURL *baseURL;
  NSString *criteriaIdentifier;
  void *v8;
  NSObject *v9;
  id v10;
  NSString *passSerialNumber;
  NSString *passTypeIdentifier;
  NSString *dpanIdentifier;
  NSString *fpanIdentifier;
  NSDecimalNumber *amount;
  void *v16;
  NSString *currencyCode;
  NSString *countryCode;
  NSArray *supportedNetworks;
  void *v20;
  NSString *merchantIdentifier;
  NSString *originURL;
  NSString *webMerchantIdentifier;
  NSString *webMerchantName;
  NSString *merchantName;
  NSNumber *adamIdentifier;
  NSString *fraudAssessment;
  NSString *challenge;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  objc_class *v36;
  objc_class *v37;
  _QWORD v39[2];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v34;
    v42 = 2082;
    v43 = "_baseURL";
LABEL_50:
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_51;
  }
  criteriaIdentifier = self->_criteriaIdentifier;
  if (!criteriaIdentifier)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v34;
    v42 = 2082;
    v43 = "_criteriaIdentifier";
    goto LABEL_50;
  }
  if (!self->_sessionIdentifier)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v34;
    v42 = 2082;
    v43 = "_sessionIdentifier";
    goto LABEL_50;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v34;
      v42 = 2082;
      v43 = "appleAccountInformation";
      goto LABEL_50;
    }
LABEL_51:
    v32 = 0;
    goto LABEL_52;
  }
  v39[0] = CFSTR("paymentOffers");
  v39[1] = criteriaIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOfferWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v5);
  v9 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));
  passSerialNumber = self->_passSerialNumber;
  if (passSerialNumber)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", passSerialNumber, CFSTR("passSerialNumber"));
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", passTypeIdentifier, CFSTR("passTypeIdentifier"));
  dpanIdentifier = self->_dpanIdentifier;
  if (dpanIdentifier)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", dpanIdentifier, CFSTR("dpanIdentifier"));
  fpanIdentifier = self->_fpanIdentifier;
  if (fpanIdentifier)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", fpanIdentifier, CFSTR("fpanIdentifier"));
  amount = self->_amount;
  if (amount)
  {
    -[NSDecimalNumber stringValue](amount, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("amount"));

  }
  currencyCode = self->_currencyCode;
  if (currencyCode)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", currencyCode, CFSTR("currencyCode"));
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", countryCode, CFSTR("countryCode"));
  supportedNetworks = self->_supportedNetworks;
  if (supportedNetworks)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", supportedNetworks, CFSTR("supportedNetworks"));
  PKApplePayLaterAvailabilityToString(self->_payLaterSuppressionMode);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("payLaterSuppressionMode"));

  merchantIdentifier = self->_merchantIdentifier;
  if (merchantIdentifier)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", merchantIdentifier, CFSTR("merchantIdentifier"));
  originURL = self->_originURL;
  if (originURL)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", originURL, CFSTR("originURL"));
  webMerchantIdentifier = self->_webMerchantIdentifier;
  if (webMerchantIdentifier)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", webMerchantIdentifier, CFSTR("webMerchantIdentifier"));
  webMerchantName = self->_webMerchantName;
  if (webMerchantName)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", webMerchantName, CFSTR("webMerchantName"));
  merchantName = self->_merchantName;
  if (merchantName)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", merchantName, CFSTR("merchantName"));
  adamIdentifier = self->_adamIdentifier;
  if (adamIdentifier)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", adamIdentifier, CFSTR("adamIdentifier"));
  fraudAssessment = self->_fraudAssessment;
  if (fraudAssessment)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", fraudAssessment, CFSTR("fraudAssessment"));
  challenge = self->_challenge;
  if (challenge)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", challenge, CFSTR("challenge"));
  -[PKPaymentDeviceMetadata dictionaryRepresentation](self->_deviceMetadata, "dictionaryRepresentation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safelySetObject:forKey:", v29, CFSTR("deviceMetadata"));

  if (self->_handoff)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, CFSTR("handoff"));

  }
  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v9, "setHTTPBody:", v31);

  }
  v32 = -[NSObject copy](v9, "copy");

LABEL_52:
  return v32;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (void)setCriteriaIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
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

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int64_t)payLaterSuppressionMode
{
  return self->_payLaterSuppressionMode;
}

- (void)setPayLaterSuppressionMode:(int64_t)a3
{
  self->_payLaterSuppressionMode = a3;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)originURL
{
  return self->_originURL;
}

- (void)setOriginURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)webMerchantIdentifier
{
  return self->_webMerchantIdentifier;
}

- (void)setWebMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)webMerchantName
{
  return self->_webMerchantName;
}

- (void)setWebMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)fraudAssessment
{
  return self->_fraudAssessment;
}

- (void)setFraudAssessment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMetadata, a3);
}

- (NSString)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (BOOL)handoff
{
  return self->_handoff;
}

- (void)setHandoff:(BOOL)a3
{
  self->_handoff = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_fraudAssessment, 0);
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
