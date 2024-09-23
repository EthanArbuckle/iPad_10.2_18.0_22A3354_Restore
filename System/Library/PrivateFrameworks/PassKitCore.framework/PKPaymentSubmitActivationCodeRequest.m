@implementation PKPaymentSubmitActivationCodeRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  PKPaymentPass *pass;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *verificationCode;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  NSString *v27;
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v28[0] = CFSTR("devices");
  v28[1] = v8;
  v28[2] = CFSTR("passes");
  pass = self->_pass;
  v10 = a5;
  v11 = a3;
  -[PKPass passTypeIdentifier](pass, "passTypeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v12;
  -[PKPass serialNumber](self->_pass, "serialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v13;
  v28[5] = CFSTR("activationCode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v14, 0, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  if (self->_verificationCode)
  {
    v16 = (void *)objc_opt_class();
    verificationCode = self->_verificationCode;
    v26 = CFSTR("activationCode");
    v27 = verificationCode;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_HTTPBodyWithDictionary:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHTTPBody:", v19);
  }
  else
  {
    -[NSData base64EncodedStringWithOptions:](self->_verificationData, "base64EncodedStringWithOptions:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_class();
    v24 = CFSTR("activationData");
    v25 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_HTTPBodyWithDictionary:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHTTPBody:", v21);

  }
  v22 = (void *)objc_msgSend(v15, "copy");

  return v22;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)verificationData
{
  return self->_verificationData;
}

- (void)setVerificationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationData, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
