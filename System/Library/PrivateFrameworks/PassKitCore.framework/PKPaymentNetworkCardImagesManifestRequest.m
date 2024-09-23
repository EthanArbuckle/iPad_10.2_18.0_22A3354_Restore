@implementation PKPaymentNetworkCardImagesManifestRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  void *v4;
  void *v5;

  -[PKWebServiceRequest _murlRequestWithURL:appleAccountInformation:](self, "_murlRequestWithURL:appleAccountInformation:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeoutInterval:", 10.0);
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

@end
