@implementation PKPaymentPrepareToProvisionRequest

- (PKPaymentPrepareToProvisionRequest)initWithCredentials:(id)a3
{
  id v5;
  PKPaymentPrepareToProvisionRequest *v6;
  PKPaymentPrepareToProvisionRequest *v7;
  PKPaymentPrepareToProvisionRequest *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentPrepareToProvisionRequest;
    v6 = -[PKOverlayableWebServiceRequest init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_credentials, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  id v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v19 = CFSTR("devices");
  v20 = v8;
  v21 = CFSTR("prepareForProvisionings");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v10, v19, v20, v21, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_credentials, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_1960);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("cards"));
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHTTPBody:", v16);

    v17 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id __105__PKPaymentPrepareToProvisionRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = a2;
  if (objc_msgSend(v2, "isRemoteCredential"))
  {
    objc_msgSend(v2, "remoteCredential");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serialNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    if (v4 && v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v3, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("identifier"));

      objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("passSerialNumber"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("passTypeIdentifier"));
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end
