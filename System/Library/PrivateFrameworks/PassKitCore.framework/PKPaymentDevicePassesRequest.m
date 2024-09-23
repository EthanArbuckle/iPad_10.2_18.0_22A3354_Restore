@implementation PKPaymentDevicePassesRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSString *updatedSince;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  NSString *v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19[0] = CFSTR("passes");
  v19[1] = CFSTR("devices");
  v19[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  updatedSince = self->_updatedSince;
  if (updatedSince)
  {
    v17 = CFSTR("passesUpdatedSince");
    v18 = updatedSince;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v8, v11, v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v8, v11, 0, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v14, "setHTTPMethod:", CFSTR("GET"));
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

- (NSString)updatedSince
{
  return self->_updatedSince;
}

- (void)setUpdatedSince:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedSince, 0);
}

@end
