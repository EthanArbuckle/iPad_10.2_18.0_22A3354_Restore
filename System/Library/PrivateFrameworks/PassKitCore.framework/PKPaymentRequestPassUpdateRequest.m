@implementation PKPaymentRequestPassUpdateRequest

- (PKPaymentRequestPassUpdateRequest)initWithPaymentPass:(id)a3 updateRequest:(id)a4
{
  id v7;
  id v8;
  PKPaymentRequestPassUpdateRequest *v9;
  PKPaymentRequestPassUpdateRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentRequestPassUpdateRequest;
  v9 = -[PKOverlayableWebServiceRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    objc_storeStrong((id *)&v10->_request, a4);
  }

  return v10;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[6];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9
    && (-[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier"), (v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v12 = (void *)v11,
        -[PKPass serialNumber](self->_pass, "serialNumber"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier", CFSTR("devices"), v9, CFSTR("passes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v14;
    -[PKPass serialNumber](self->_pass, "serialNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v15;
    v25[5] = CFSTR("passUpgrade");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v8, v16, 0, v10);
    v17 = objc_claimAutoreleasedReturnValue();

    -[NSObject setHTTPMethod:](v17, "setHTTPMethod:", CFSTR("POST"));
    v18 = (void *)objc_opt_class();
    -[PKPassUpgradeRequest fields](self->_request, "fields");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_HTTPBodyWithDictionary:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v17, "setHTTPBody:", v20);

    v21 = -[NSObject copy](v17, "copy");
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPass serialNumber](self->_pass, "serialNumber");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v9;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKPaymentRequestPassUpdateRequest: endpoint component was nil, exiting early. deviceIdentifier: %@, passTypeIdentifier: %@, serialNumber: %@", buf, 0x20u);

    }
    v21 = 0;
  }

  return v21;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (PKPassUpgradeRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
