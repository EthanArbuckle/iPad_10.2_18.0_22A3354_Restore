@implementation PKPaymentDeleteRequest

- (PKPaymentDeleteRequest)initWithPaymentPass:(id)a3
{
  id v5;
  PKPaymentDeleteRequest *v6;
  PKPaymentDeleteRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentDeleteRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pass, a3);

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[3];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[PKPass serialNumber](self->_pass, "serialNumber"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v19[0] = CFSTR("passes");
    -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v11;
    -[PKPass serialNumber](self->_pass, "serialNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, v13, 0, v7);
    v14 = objc_claimAutoreleasedReturnValue();

    -[NSObject setHTTPMethod:](v14, "setHTTPMethod:", CFSTR("DELETE"));
    v15 = -[NSObject copy](v14, "copy");
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPass serialNumber](self->_pass, "serialNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "PKPaymentDeleteRequest: endpoint component was nil. exiting early. passTypeIdentifier: %@, serialNumber: %@", buf, 0x16u);

    }
    v15 = 0;
  }

  return v15;
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
