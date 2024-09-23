@implementation PKPaymentNotifyIssuerAppletDirtyRequest

- (PKPaymentNotifyIssuerAppletDirtyRequest)initWithPassSerialNumber:(id)a3 deviceAccountIdentifier:(id)a4
{
  id v7;
  id v8;
  PKPaymentNotifyIssuerAppletDirtyRequest *v9;
  PKPaymentNotifyIssuerAppletDirtyRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentNotifyIssuerAppletDirtyRequest;
  v9 = -[PKOverlayableWebServiceRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passSerialNumber, a3);
    objc_storeStrong((id *)&v10->_deviceAccountIdentifier, a4);
  }

  return v10;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  NSString *passSerialNumber;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *deviceAccountIdentifier;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v21;
  NSString *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("devices");
  v23[1] = a4;
  passSerialNumber = self->_passSerialNumber;
  v23[2] = CFSTR("passes");
  v23[3] = passSerialNumber;
  v23[4] = CFSTR("notifyIssuerAppletStateDirty");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", v23, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v12, v13, 0, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v14, "setCachePolicy:", 1);
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v15 = (void *)objc_opt_class();
  deviceAccountIdentifier = self->_deviceAccountIdentifier;
  v21 = CFSTR("dpanIdentifier");
  v22 = deviceAccountIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "_HTTPBodyWithDictionary:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHTTPBody:", v18);

  v19 = (void *)objc_msgSend(v14, "copy");
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
}

@end
