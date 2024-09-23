@implementation PKPaymentUnregisterRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 companionSerialNumber:(id)a5 appleAccountInformation:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v19[0] = CFSTR("devices");
  v19[1] = a4;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "arrayWithObjects:count:", v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v14, v15, 0, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setHTTPMethod:", CFSTR("DELETE"));
  objc_msgSend(v16, "setCachePolicy:", 1);
  if (v10)
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Companion-Serial-Number"));
  v17 = (void *)objc_msgSend(v16, "copy");

  return v17;
}

@end
