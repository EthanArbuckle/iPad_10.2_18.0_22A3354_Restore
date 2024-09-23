@implementation PKPaymentProvisionPrecursorPassRequest

- (PKPaymentProvisionPrecursorPassRequest)initWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4 actions:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPaymentProvisionPrecursorPassRequest *v12;
  PKPaymentProvisionPrecursorPassRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentProvisionPrecursorPassRequest;
  v12 = -[PKOverlayableWebServiceRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_passTypeIdentifier, a3);
    objc_storeStrong((id *)&v13->_passSerialNumber, a4);
    objc_storeStrong((id *)&v13->_actions, a5);
  }

  return v13;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
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
  v21 = CFSTR("getPrecursorPass");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", v11, CFSTR("1"), v12, 0, v9, v19, v20, v21, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", self->_passTypeIdentifier, CFSTR("passTypeIdentifier"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", self->_passSerialNumber, CFSTR("serialNumber"));
  -[NSArray pk_arrayByApplyingBlock:](self->_actions, "pk_arrayByApplyingBlock:", &__block_literal_global_1971);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("actions"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPBody:", v16);

  v17 = (void *)objc_msgSend(v13, "copy");
  return v17;
}

uint64_t __109__PKPaymentProvisionPrecursorPassRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asDictionary");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end
