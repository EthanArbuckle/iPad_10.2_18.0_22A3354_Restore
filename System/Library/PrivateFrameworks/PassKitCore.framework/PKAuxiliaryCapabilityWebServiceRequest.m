@implementation PKAuxiliaryCapabilityWebServiceRequest

- (PKAuxiliaryCapabilityWebServiceRequest)init
{
  return -[PKAuxiliaryCapabilityWebServiceRequest initWithPass:](self, "initWithPass:", 0);
}

- (PKAuxiliaryCapabilityWebServiceRequest)initWithPass:(id)a3
{
  id v5;
  PKAuxiliaryCapabilityWebServiceRequest *v6;
  PKAuxiliaryCapabilityWebServiceRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAuxiliaryCapabilityWebServiceRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pass, a3);

  return v7;
}

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  return -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", a3, CFSTR("4"), a4, a5, a6);
}

- (PKSecureElementPass)pass
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
