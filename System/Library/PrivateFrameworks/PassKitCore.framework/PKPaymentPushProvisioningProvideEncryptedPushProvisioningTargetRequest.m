@implementation PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest

- (PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest)initWithEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4
{
  id v7;
  id v8;
  PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest *v9;
  PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest;
  v9 = -[PKOverlayableWebServiceRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptedPushProvisioningTarget, a3);
    objc_storeStrong((id *)&v10->_sharingInstanceIdentifier, a4);
  }

  return v10;
}

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
  const __CFString *v19;
  id v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = CFSTR("devices");
  v20 = a4;
  v21 = CFSTR("pushProvisioningTarget");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v9, v19, v20, v21, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  v14 = (void *)objc_opt_class();
  -[PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest requestBody](self, "requestBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_HTTPBodyWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPBody:", v16);

  v17 = (void *)objc_msgSend(v13, "copy");
  return v17;
}

- (id)requestBody
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[PKEncryptedPushProvisioningTarget asWebServiceDictionary](self->_encryptedPushProvisioningTarget, "asWebServiceDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifier"));
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (PKEncryptedPushProvisioningTarget)encryptedPushProvisioningTarget
{
  return self->_encryptedPushProvisioningTarget;
}

- (void)setEncryptedPushProvisioningTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_encryptedPushProvisioningTarget, 0);
}

@end
