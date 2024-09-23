@implementation PKAccountWebServiceFinancingOptionsRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSURL *baseURL;
  NSString *accountIdentifier;
  void *v8;
  NSObject *v9;
  NSString *referrerIdentifier;
  id v11;
  void *v12;
  NSString *originURL;
  NSString *webMerchantIdentifier;
  NSString *webMerchantName;
  NSString *merchantName;
  NSNumber *adamIdentifier;
  void *v18;
  void *v19;
  NSString *sessionIdentifier;
  void *v21;
  NSArray *supportedNetworks;
  unint64_t channel;
  const __CFString *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  objc_class *v28;
  objc_class *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  objc_class *v34;
  _QWORD v36[3];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v26;
    v39 = 2082;
    v40 = "_baseURL";
LABEL_48:
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_49;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v26;
    v39 = 2082;
    v40 = "_accountIdentifier";
    goto LABEL_48;
  }
  if (!self->_amount)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v26;
    v39 = 2082;
    v40 = "_amount";
    goto LABEL_48;
  }
  if (!self->_currencyCode)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v26;
    v39 = 2082;
    v40 = "_currencyCode";
    goto LABEL_48;
  }
  if (self->_channel == 1 && !self->_merchantIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v26;
      v39 = 2082;
      v40 = "_merchantIdentifier";
      goto LABEL_48;
    }
    goto LABEL_49;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v26;
      v39 = 2082;
      v40 = "appleAccountInformation";
      goto LABEL_48;
    }
LABEL_49:
    v33 = 0;
    goto LABEL_50;
  }
  v36[0] = CFSTR("accounts");
  v36[1] = accountIdentifier;
  v36[2] = CFSTR("financingOptions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v5);
  v9 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  referrerIdentifier = self->_referrerIdentifier;
  if (referrerIdentifier)
    -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", referrerIdentifier, CFSTR("x-apple-referrer-identifier"));
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSDecimalNumber stringValue](self->_amount, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("amount"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_merchantIdentifier, CFSTR("merchantIdentifier"));
  originURL = self->_originURL;
  if (originURL)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", originURL, CFSTR("originURL"));
  webMerchantIdentifier = self->_webMerchantIdentifier;
  if (webMerchantIdentifier)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", webMerchantIdentifier, CFSTR("webMerchantIdentifier"));
  webMerchantName = self->_webMerchantName;
  if (webMerchantName)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", webMerchantName, CFSTR("webMerchantName"));
  merchantName = self->_merchantName;
  if (merchantName)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", merchantName, CFSTR("merchantName"));
  adamIdentifier = self->_adamIdentifier;
  if (adamIdentifier)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", adamIdentifier, CFSTR("adamIdentifier"));
  if (self->_isMerchantTokenRequest)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("isMerchantTokenRequest"));

  }
  if (self->_isMultiTokenRequest)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("isMultiTokenRequest"));

  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", sessionIdentifier, CFSTR("sessionIdentifier"));
  if (self->_dueNext30Days)
  {
    +[PKAccountWebServiceRequest currencyAmountFormattedDictionary:](PKAccountWebServiceRequest, "currencyAmountFormattedDictionary:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("dueNext30Days"));

  }
  supportedNetworks = self->_supportedNetworks;
  if (supportedNetworks)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", supportedNetworks, CFSTR("supportedNetworks"));
  channel = self->_channel;
  if (channel > 3)
    v24 = CFSTR("unknown");
  else
    v24 = off_1E2AD8F00[channel];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("channel"));
  PKApplePayLaterAvailabilityToString(self->_suppressionMode);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, CFSTR("suppressionMode"));

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v9, "setHTTPBody:", v32);

  }
  v33 = -[NSObject copy](v9, "copy");

LABEL_50:
  return v33;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
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

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)originURL
{
  return self->_originURL;
}

- (void)setOriginURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)webMerchantIdentifier
{
  return self->_webMerchantIdentifier;
}

- (void)setWebMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)webMerchantName
{
  return self->_webMerchantName;
}

- (void)setWebMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)isMerchantTokenRequest
{
  return self->_isMerchantTokenRequest;
}

- (void)setIsMerchantTokenRequest:(BOOL)a3
{
  self->_isMerchantTokenRequest = a3;
}

- (BOOL)isMultiTokenRequest
{
  return self->_isMultiTokenRequest;
}

- (void)setIsMultiTokenRequest:(BOOL)a3
{
  self->_isMultiTokenRequest = a3;
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (PKCurrencyAmount)dueNext30Days
{
  return self->_dueNext30Days;
}

- (void)setDueNext30Days:(id)a3
{
  objc_storeStrong((id *)&self->_dueNext30Days, a3);
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (int64_t)suppressionMode
{
  return self->_suppressionMode;
}

- (void)setSuppressionMode:(int64_t)a3
{
  self->_suppressionMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_dueNext30Days, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
