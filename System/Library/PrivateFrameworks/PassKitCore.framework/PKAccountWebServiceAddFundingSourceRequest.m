@implementation PKAccountWebServiceAddFundingSourceRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSURL *baseURL;
  NSString *accountIdentifier;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  PKPaymentDeviceMetadata *deviceMetadata;
  void *v13;
  NSString *odiAssessment;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  _QWORD v24[3];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    v27 = 2082;
    v28 = "_baseURL";
LABEL_24:
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_25;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    v27 = 2082;
    v28 = "appleAccountInformation";
    goto LABEL_24;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    v27 = 2082;
    v28 = "_accountIdentifier";
    goto LABEL_24;
  }
  if (!self->_fundingSource)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    v27 = 2082;
    v28 = "_fundingSource";
    goto LABEL_24;
  }
  if (!self->_certificatesResponse)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    v27 = 2082;
    v28 = "_certificatesResponse";
    goto LABEL_24;
  }
  if (!self->_fundingSourceTermsIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 2082;
      v28 = "_fundingSourceTermsIdentifier";
      goto LABEL_24;
    }
LABEL_25:
    v9 = 0;
    goto LABEL_26;
  }
  v24[0] = CFSTR("accounts");
  v24[1] = accountIdentifier;
  v24[2] = CFSTR("fundingSources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[PKAccountPaymentFundingSource jsonDictionaryRepresentationWithCertificatesResponse:](self->_fundingSource, "jsonDictionaryRepresentationWithCertificatesResponse:", self->_certificatesResponse);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("fundingSource"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_fundingSourceTermsIdentifier, CFSTR("fundingSourceTermsIdentifier"));
  deviceMetadata = self->_deviceMetadata;
  if (deviceMetadata)
  {
    -[PKPaymentDeviceMetadata dictionaryRepresentation](deviceMetadata, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("deviceMetadata"));

  }
  odiAssessment = self->_odiAssessment;
  if (odiAssessment)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", odiAssessment, CFSTR("odiAssessment"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPBody:", v15);

LABEL_26:
  return v9;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSource, a3);
}

- (NSString)fundingSourceTermsIdentifier
{
  return self->_fundingSourceTermsIdentifier;
}

- (void)setFundingSourceTermsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSourceTermsIdentifier, a3);
}

- (PKAccountWebServiceCertificatesResponse)certificatesResponse
{
  return self->_certificatesResponse;
}

- (void)setCertificatesResponse:(id)a3
{
  objc_storeStrong((id *)&self->_certificatesResponse, a3);
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMetadata, a3);
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_certificatesResponse, 0);
  objc_storeStrong((id *)&self->_fundingSourceTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
