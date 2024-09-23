@implementation PKPaymentRemotePassesRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  void *v4;
  void *v5;

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", a3, &unk_1E2C3E308, 0, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

@end
