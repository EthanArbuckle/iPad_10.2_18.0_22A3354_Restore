@implementation PKPeerPaymentTermsAcceptanceResponse

- (PKPeerPaymentTermsAcceptanceResponse)initWithData:(id)a3
{
  PKPeerPaymentTermsAcceptanceResponse *v3;
  PKPeerPaymentTermsAcceptanceResponse *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSString *termsIdentifier;
  uint64_t v9;
  NSURL *termsURL;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentTermsAcceptanceResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v12, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v6, "PKStringForKey:", CFSTR("termsIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      termsIdentifier = v4->_termsIdentifier;
      v4->_termsIdentifier = (NSString *)v7;

      objc_msgSend(v6, "PKURLForKey:", CFSTR("termsURL"));
      v9 = objc_claimAutoreleasedReturnValue();

      termsURL = v4->_termsURL;
      v4->_termsURL = (NSURL *)v9;

    }
  }
  return v4;
}

- (BOOL)hasTermsData
{
  NSUInteger v3;

  v3 = -[NSString length](self->_termsIdentifier, "length");
  if (v3)
    LOBYTE(v3) = self->_termsURL != 0;
  return v3;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
}

@end
