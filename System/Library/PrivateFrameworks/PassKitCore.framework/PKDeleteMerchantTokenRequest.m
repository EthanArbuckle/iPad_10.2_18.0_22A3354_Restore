@implementation PKDeleteMerchantTokenRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  NSString *merchantTokenId;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  merchantTokenId = self->_merchantTokenId;
  v13[0] = CFSTR("merchantTokens");
  v13[1] = merchantTokenId;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", v9, CFSTR("1"), v10, 0, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("DELETE"));
  return v11;
}

- (NSString)merchantTokenId
{
  return self->_merchantTokenId;
}

- (void)setMerchantTokenId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantTokenId, 0);
}

@end
