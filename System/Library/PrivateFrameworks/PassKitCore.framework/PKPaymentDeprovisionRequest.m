@implementation PKPaymentDeprovisionRequest

- (PKPaymentDeprovisionRequest)initWithPaymentPass:(id)a3
{
  id v5;
  PKPaymentDeprovisionRequest *v6;
  PKPaymentDeprovisionRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentDeprovisionRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pass, a3);

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  PKPaymentPass *pass;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("passes");
  pass = self->_pass;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[PKPass passTypeIdentifier](pass, "passTypeIdentifier", CFSTR("passes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  -[PKPass serialNumber](self->_pass, "serialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v18[3] = CFSTR("devices");
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v14, 0, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("DELETE"));
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
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
}

@end
