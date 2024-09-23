@implementation PKPaymentOrderDetails

- (PKPaymentOrderDetails)initWithOrderTypeIdentifier:(NSString *)orderTypeIdentifier orderIdentifier:(NSString *)orderIdentifier webServiceURL:(NSURL *)webServiceURL authenticationToken:(NSString *)authenticationToken
{
  NSString *v10;
  NSString *v11;
  NSURL *v12;
  NSString *v13;
  PKPaymentOrderDetails *v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  objc_super v22;

  v10 = orderTypeIdentifier;
  v11 = orderIdentifier;
  v12 = webServiceURL;
  v13 = authenticationToken;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentOrderDetails;
  v14 = -[PKPaymentOrderDetails init](&v22, sel_init);
  if (v14)
  {
    v15 = -[NSString copy](v10, "copy");
    v16 = v14->_orderTypeIdentifier;
    v14->_orderTypeIdentifier = (NSString *)v15;

    v17 = -[NSString copy](v11, "copy");
    v18 = v14->_orderIdentifier;
    v14->_orderIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v14->_webServiceURL, webServiceURL);
    v19 = -[NSString copy](v13, "copy");
    v20 = v14->_authenticationToken;
    v14->_authenticationToken = (NSString *)v19;

  }
  return v14;
}

- (PKPaymentOrderDetails)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOrderDetails *v5;
  uint64_t v6;
  NSString *orderTypeIdentifier;
  uint64_t v8;
  NSString *orderIdentifier;
  uint64_t v10;
  NSURL *webServiceURL;
  uint64_t v12;
  NSString *authenticationToken;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentOrderDetails;
  v5 = -[PKPaymentOrderDetails init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orderTypeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    orderTypeIdentifier = v5->_orderTypeIdentifier;
    v5->_orderTypeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orderIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    orderIdentifier = v5->_orderIdentifier;
    v5->_orderIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webServiceURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    webServiceURL = v5->_webServiceURL;
    v5->_webServiceURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationToken"));
    v12 = objc_claimAutoreleasedReturnValue();
    authenticationToken = v5->_authenticationToken;
    v5->_authenticationToken = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *orderTypeIdentifier;
  id v5;

  orderTypeIdentifier = self->_orderTypeIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", orderTypeIdentifier, CFSTR("orderTypeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orderIdentifier, CFSTR("orderIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webServiceURL, CFSTR("webServiceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authenticationToken, CFSTR("authenticationToken"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)orderTypeIdentifier
{
  return self->_orderTypeIdentifier;
}

- (void)setOrderTypeIdentifier:(NSString *)orderTypeIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, orderTypeIdentifier, 8);
}

- (NSString)orderIdentifier
{
  return self->_orderIdentifier;
}

- (void)setOrderIdentifier:(NSString *)orderIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, orderIdentifier, 16);
}

- (NSURL)webServiceURL
{
  return self->_webServiceURL;
}

- (void)setWebServiceURL:(NSURL *)webServiceURL
{
  objc_setProperty_nonatomic_copy(self, a2, webServiceURL, 24);
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(NSString *)authenticationToken
{
  objc_setProperty_nonatomic_copy(self, a2, authenticationToken, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_webServiceURL, 0);
  objc_storeStrong((id *)&self->_orderIdentifier, 0);
  objc_storeStrong((id *)&self->_orderTypeIdentifier, 0);
}

@end
