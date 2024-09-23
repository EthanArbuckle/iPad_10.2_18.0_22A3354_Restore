@implementation PKPaymentPushProvisioningSharingStatusRequest

- (PKPaymentPushProvisioningSharingStatusRequest)initWithProvisioningSharingIdentifier:(id)a3 cardCardConfigurationIdentifer:(id)a4
{
  id v7;
  id v8;
  PKPaymentPushProvisioningSharingStatusRequest *v9;
  PKPaymentPushProvisioningSharingStatusRequest *v10;
  PKEncryptedPushProvisioningTarget *encryptedProvisioningTarget;

  v7 = a3;
  v8 = a4;
  v9 = -[PKOverlayableWebServiceRequest init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharingIdentifier, a3);
    objc_storeStrong((id *)&v10->_cardConfigurationIdentifer, a4);
    encryptedProvisioningTarget = v10->_encryptedProvisioningTarget;
    v10->_encryptedProvisioningTarget = 0;

  }
  return v10;
}

- (PKPaymentPushProvisioningSharingStatusRequest)initWithEncryptedProvisioningTarget:(id)a3
{
  id v5;
  PKPaymentPushProvisioningSharingStatusRequest *v6;
  PKPaymentPushProvisioningSharingStatusRequest *v7;
  NSString *sharingIdentifier;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPushProvisioningSharingStatusRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_encryptedProvisioningTarget, a3);
    sharingIdentifier = v7->_sharingIdentifier;
    v7->_sharingIdentifier = 0;

  }
  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t v19[16];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "length");
  if (v8 && v11)
  {
    v20[0] = CFSTR("devices");
    v20[1] = v9;
    v20[2] = CFSTR("provisioningSharingStatus");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v8, v12, 0, v10);
    v13 = objc_claimAutoreleasedReturnValue();

    -[NSObject setHTTPMethod:](v13, "setHTTPMethod:", CFSTR("POST"));
    v14 = (void *)objc_opt_class();
    -[PKPaymentPushProvisioningSharingStatusRequest requestBody](self, "requestBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_HTTPBodyWithDictionary:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v13, "setHTTPBody:", v16);

    v17 = -[NSObject copy](v13, "copy");
  }
  else
  {
    PKLogFacilityTypeGetObject(0x1BuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Error: No device identifier or URL for request", v19, 2u);
    }
    v17 = 0;
  }

  return v17;
}

- (id)requestBody
{
  id v3;
  PKEncryptedPushProvisioningTarget *encryptedProvisioningTarget;
  void *v5;
  NSString *sharingIdentifier;
  NSString *cardConfigurationIdentifer;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  encryptedProvisioningTarget = self->_encryptedProvisioningTarget;
  if (encryptedProvisioningTarget)
  {
    -[PKEncryptedPushProvisioningTarget asWebServiceDictionary](encryptedProvisioningTarget, "asWebServiceDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  }
  sharingIdentifier = self->_sharingIdentifier;
  if (sharingIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", sharingIdentifier, CFSTR("sharingInstanceIdentifier"));
  cardConfigurationIdentifer = self->_cardConfigurationIdentifer;
  if (cardConfigurationIdentifer)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", cardConfigurationIdentifer, CFSTR("cardConfigurationIdentifier"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (NSString)sharingIdentifier
{
  return self->_sharingIdentifier;
}

- (void)setSharingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)cardConfigurationIdentifer
{
  return self->_cardConfigurationIdentifer;
}

- (void)setCardConfigurationIdentifer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (PKEncryptedPushProvisioningTarget)encryptedProvisioningTarget
{
  return self->_encryptedProvisioningTarget;
}

- (void)setEncryptedProvisioningTarget:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedProvisioningTarget, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedProvisioningTarget, 0);
  objc_storeStrong((id *)&self->_cardConfigurationIdentifer, 0);
  objc_storeStrong((id *)&self->_sharingIdentifier, 0);
}

@end
