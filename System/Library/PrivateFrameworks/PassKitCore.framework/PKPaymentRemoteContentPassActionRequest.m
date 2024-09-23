@implementation PKPaymentRemoteContentPassActionRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 passTypeIdentifier:(id)a5 passSerialNumber:(id)a6 appleAccountInformation:(id)a7
{
  id v12;
  id v13;
  id v14;
  PKPaymentPassAction *action;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[8];

  v28[7] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  action = self->_action;
  v16 = a7;
  v17 = a3;
  -[PKPaymentPassAction appletData](action, "appletData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = v19;
  if (v18)
    objc_msgSend(v19, "setObject:forKey:", v18, CFSTR("appletData"));
  v28[0] = CFSTR("devices");
  v28[1] = v12;
  v28[2] = CFSTR("passes");
  v28[3] = v13;
  v28[4] = v14;
  v28[5] = CFSTR("actions");
  -[PKPaymentPassAction identifier](self->_action, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 7);
  v27 = v12;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v17, v22, 0, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHTTPBody:", v24);

  objc_msgSend(v23, "setHTTPMethod:", CFSTR("POST"));
  v25 = (void *)objc_msgSend(v23, "copy");

  return v25;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
}

@end
