@implementation PKApplePayTrustRegistrationRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v22;
  id v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = CFSTR("devices");
  v23 = a4;
  v24 = CFSTR("submitEnrollmentData");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v22, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v9, v22, v23, v24, v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplePayTrustKey signedEnrollmentData](self->_applePayTrustKey, "signedEnrollmentData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hexEncoding");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("signedEnrollmentData"));

  -[PKApplePayTrustKey certificate](self->_applePayTrustKey, "certificate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "hexEncoding");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("casdCertificate"));

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPBody:", v19);

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  v20 = (void *)objc_msgSend(v13, "copy");

  return v20;
}

- (PKApplePayTrustKey)applePayTrustKey
{
  return self->_applePayTrustKey;
}

- (void)setApplePayTrustKey:(id)a3
{
  objc_storeStrong((id *)&self->_applePayTrustKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applePayTrustKey, 0);
}

@end
