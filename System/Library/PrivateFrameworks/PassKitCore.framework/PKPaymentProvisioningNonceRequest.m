@implementation PKPaymentProvisioningNonceRequest

- (PKPaymentProvisioningNonceRequest)initWithNonceType:(unint64_t)a3
{
  PKPaymentProvisioningNonceRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningNonceRequest;
  result = -[PKOverlayableWebServiceRequest init](&v5, sel_init);
  if (result)
    result->_nonceType = a3;
  return result;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (self->_nonceType == 1)
    v8 = CFSTR("extended");
  else
    v8 = CFSTR("standard");
  v19 = CFSTR("nonceType");
  v20[0] = v8;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("devices");
  v18[1] = v11;
  v18[2] = CFSTR("provisioningNonce");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v12, v14, v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v15, "setCachePolicy:", 1);
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

- (unint64_t)nonceType
{
  return self->_nonceType;
}

- (void)setNonceType:(unint64_t)a3
{
  self->_nonceType = a3;
}

@end
