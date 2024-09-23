@implementation PKPaymentConfigurationRequest

- (id)_requestWithServiceURL:(id)a3
{
  void *v3;
  void *v4;

  -[PKPaymentWebServiceRequest _murlRequestWithURL:](self, "_murlRequestWithURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

@end
