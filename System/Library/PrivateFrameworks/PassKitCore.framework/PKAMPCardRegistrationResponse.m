@implementation PKAMPCardRegistrationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAMPCardRegistrationResponse)initWithCardData:(id)a3 brokerURL:(id)a4 paymentServicesURL:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKAMPCardRegistrationResponse *v15;
  PKAMPCardRegistrationResponse *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKAMPCardRegistrationResponse;
  v15 = -[PKAMPCardRegistrationResponse init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_cardData, a3);
    objc_storeStrong((id *)&v16->_brokerURL, a4);
    objc_storeStrong((id *)&v16->_paymentServicesURL, a5);
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (PKAMPCardRegistrationResponse)initWithCoder:(id)a3
{
  id v4;
  PKAMPCardRegistrationResponse *v5;
  uint64_t v6;
  NSData *cardData;
  uint64_t v8;
  NSURL *brokerURL;
  uint64_t v10;
  NSURL *paymentServicesURL;
  uint64_t v12;
  NSError *error;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAMPCardRegistrationResponse;
  v5 = -[PKAMPCardRegistrationResponse init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardDataKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    cardData = v5->_cardData;
    v5->_cardData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brokerURLKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    brokerURL = v5->_brokerURL;
    v5->_brokerURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentServicesURLKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    paymentServicesURL = v5->_paymentServicesURL;
    v5->_paymentServicesURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *cardData;
  id v5;

  cardData = self->_cardData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cardData, CFSTR("cardDataKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_brokerURL, CFSTR("brokerURLKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentServicesURL, CFSTR("paymentServicesURLKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("errorKey"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; cardData: %d bytes; brokerURL: %@; paymentServicesURL: %@; error: %@>"),
               objc_opt_class(),
               self,
               -[NSData length](self->_cardData, "length"),
               self->_brokerURL,
               self->_paymentServicesURL,
               self->_error);
}

- (NSData)cardData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCardData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSURL)brokerURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBrokerURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURL)paymentServicesURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPaymentServicesURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_paymentServicesURL, 0);
  objc_storeStrong((id *)&self->_brokerURL, 0);
  objc_storeStrong((id *)&self->_cardData, 0);
}

@end
