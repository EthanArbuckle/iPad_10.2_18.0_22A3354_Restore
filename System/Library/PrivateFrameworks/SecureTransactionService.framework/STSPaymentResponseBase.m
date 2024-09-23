@implementation STSPaymentResponseBase

- (id)initFromNFECommercePaymentResponse:(id)a3
{
  id v4;
  STSPaymentResponseBase *v5;
  uint64_t v6;
  NSString *transactionIdentifier;
  uint64_t v8;
  NSData *transactionData;
  uint64_t v10;
  NSDictionary *certificates;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSPaymentResponseBase;
  v5 = -[STSPaymentResponseBase init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "transactionIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "transactionData");
    v8 = objc_claimAutoreleasedReturnValue();
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v8;

    objc_msgSend(v4, "certs");
    v10 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v10;

  }
  return v5;
}

- (id)initFromNFPeerPaymentResponse:(id)a3
{
  id v4;
  STSPaymentResponseBase *v5;
  uint64_t v6;
  NSData *transactionData;
  uint64_t v8;
  NSString *transactionIdentifier;
  uint64_t v10;
  NSDictionary *certificates;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSPaymentResponseBase;
  v5 = -[STSPaymentResponseBase init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "transactionData");
    v6 = objc_claimAutoreleasedReturnValue();
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v6;

    objc_msgSend(v4, "transactionIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v8;

    objc_msgSend(v4, "certificates");
    v10 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSPaymentResponseBase)initWithCoder:(id)a3
{
  id v4;
  STSPaymentResponseBase *v5;
  uint64_t v6;
  NSString *transactionIdentifier;
  uint64_t v8;
  NSData *transactionData;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *certificates;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STSPaymentResponseBase;
  v5 = -[STSPaymentResponseBase init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionData"));
    v8 = objc_claimAutoreleasedReturnValue();
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v8;

    v10 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v10, objc_opt_class(), CFSTR("certs"));
    v11 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *transactionIdentifier;
  id v5;

  transactionIdentifier = self->_transactionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transactionIdentifier, CFSTR("transactionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionData, CFSTR("transactionData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificates, CFSTR("certs"));

}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (NSDictionary)certificates
{
  return self->_certificates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end
