@implementation PKAccountWebServiceScheduleTransferRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *odiAssessment;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  int v24;
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKAccountWebServiceScheduleTransferRequest baseURL](self, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v18;
    v26 = 2082;
    v27 = "baseURL";
LABEL_21:
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v24, 0x16u);

    goto LABEL_22;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v18;
    v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_21;
  }
  if (!self->_scheduledTransfers)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v18;
    v26 = 2082;
    v27 = "_scheduledTransfers";
    goto LABEL_21;
  }
  if (!self->_scheduleDetails)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v18;
    v26 = 2082;
    v27 = "_scheduleDetails";
    goto LABEL_21;
  }
  if (!self->_accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v18;
      v26 = 2082;
      v27 = "_accountIdentifier";
      goto LABEL_21;
    }
LABEL_22:

    v15 = 0;
    goto LABEL_23;
  }
  -[PKAccountWebServiceScheduleTransferRequest endpointComponents](self, "endpointComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v5, v6, 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountScheduledTransferList jsonArrayRepresentation](self->_scheduledTransfers, "jsonArrayRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("scheduledTransfers"));

  -[PKAccountTransferScheduleDetails jsonDictionaryRepresentation](self->_scheduleDetails, "jsonDictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("scheduleDetails"));

  -[NSData hexEncoding](self->_publicKeyHash, "hexEncoding");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("publicKeyHash"));

  -[PKPaymentDeviceMetadata dictionaryRepresentation](self->_deviceMetadata, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("deviceMetadata"));
  odiAssessment = self->_odiAssessment;
  if (odiAssessment)
    objc_msgSend(v8, "setObject:forKey:", odiAssessment, CFSTR("odiAssessment"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHTTPBody:", v14);

  v15 = (void *)objc_msgSend(v7, "copy");
LABEL_23:

  return v15;
}

- (Class)signatureResponseClass
{
  return (Class)objc_opt_class();
}

- (id)endpointComponents
{
  NSString *accountIdentifier;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    v5[0] = CFSTR("accounts");
    v5[1] = accountIdentifier;
    v5[2] = CFSTR("transfers");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)manifestHashWithReferenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[PKAccountScheduledTransferList scheduledTransferOfFundingSourceType:](self->_scheduledTransfers, "scheduledTransferOfFundingSourceType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountScheduledTransferList scheduledTransferOfFundingSourceType:](self->_scheduledTransfers, "scheduledTransferOfFundingSourceType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hashComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hashComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountTransferScheduleDetails hashString](self->_scheduleDetails, "hashString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v10, "appendString:", v7);
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v10, "appendString:", v8);
  if (v9)
    objc_msgSend(v10, "appendString:", v9);
  objc_msgSend(v10, "appendString:", v4);
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "SHA256Hash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSURL)baseURL
{
  return self->baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->baseURL, a3);
}

- (PKApplePayTrustHashResponse)hashResponse
{
  return self->hashResponse;
}

- (void)setHashResponse:(id)a3
{
  objc_storeStrong((id *)&self->hashResponse, a3);
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PKAccountScheduledTransferList)scheduledTransfers
{
  return self->_scheduledTransfers;
}

- (void)setScheduledTransfers:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledTransfers, a3);
}

- (PKAccountTransferScheduleDetails)scheduleDetails
{
  return self->_scheduleDetails;
}

- (void)setScheduleDetails:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleDetails, a3);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduleDetails, 0);
  objc_storeStrong((id *)&self->_scheduledTransfers, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->hashResponse, 0);
  objc_storeStrong((id *)&self->baseURL, 0);
}

@end
