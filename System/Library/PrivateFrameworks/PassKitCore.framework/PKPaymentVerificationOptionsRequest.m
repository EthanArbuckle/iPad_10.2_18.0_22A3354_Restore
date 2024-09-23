@implementation PKPaymentVerificationOptionsRequest

+ (id)requestWithPass:(id)a3
{
  id v3;
  PKPaymentVerificationOptionsRequest *v4;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentVerificationOptionsRequest);
  -[PKPaymentVerificationOptionsRequest setPass:](v4, "setPass:", v3);

  return v4;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSString *stepIdentifier;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  stepIdentifier = self->_stepIdentifier;
  if (stepIdentifier)
    objc_msgSend(v12, "setObject:forKey:", stepIdentifier, CFSTR("stepIdentifier"));
  v20[0] = CFSTR("devices");
  v20[1] = v8;
  v20[2] = CFSTR("passes");
  -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v15;
  -[PKPass serialNumber](self->_pass, "serialNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v16;
  v20[5] = CFSTR("activation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v17, v13, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setHTTPMethod:", CFSTR("GET"));
  return v18;
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
}

@end
