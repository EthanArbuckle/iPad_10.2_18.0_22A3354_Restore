@implementation PKPaymentToken

+ (PKPaymentToken)paymentTokenWithProtobuf:(id)a3
{
  id v3;
  PKPaymentToken *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentToken);
  objc_msgSend(v3, "instrumentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentToken setPaymentInstrumentName:](v4, "setPaymentInstrumentName:", v5);

  objc_msgSend(v3, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentToken setPaymentNetwork:](v4, "setPaymentNetwork:", v6);

  objc_msgSend(v3, "transactionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentToken setTransactionIdentifier:](v4, "setTransactionIdentifier:", v7);

  objc_msgSend(v3, "paymentData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentToken setPaymentData:](v4, "setPaymentData:", v8);

  objc_msgSend(v3, "paymentMethod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentMethod paymentMethodWithProtobuf:](PKPaymentMethod, "paymentMethodWithProtobuf:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentToken setPaymentMethod:](v4, "setPaymentMethod:", v10);

  v11 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "redeemURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentToken setRedeemURL:](v4, "setRedeemURL:", v13);

  objc_msgSend(v3, "retryNonce");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentToken setRetryNonce:](v4, "setRetryNonce:", v14);
  return v4;
}

- (id)protobuf
{
  PKProtobufPaymentToken *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(PKProtobufPaymentToken);
  -[PKPaymentToken paymentMethod](self, "paymentMethod");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentToken setInstrumentName:](v3, "setInstrumentName:", v5);

  -[PKPaymentToken paymentMethod](self, "paymentMethod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "network");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentToken setNetwork:](v3, "setNetwork:", v7);

  -[PKPaymentToken transactionIdentifier](self, "transactionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentToken setTransactionIdentifier:](v3, "setTransactionIdentifier:", v8);

  -[PKPaymentToken paymentData](self, "paymentData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentToken setPaymentData:](v3, "setPaymentData:", v9);

  -[PKPaymentToken paymentMethod](self, "paymentMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "protobuf");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentToken setPaymentMethod:](v3, "setPaymentMethod:", v11);

  -[PKPaymentToken redeemURL](self, "redeemURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentToken setRedeemURL:](v3, "setRedeemURL:", v13);

  -[PKPaymentToken retryNonce](self, "retryNonce");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentToken setRetryNonce:](v3, "setRetryNonce:", v14);

  return v3;
}

+ (int64_t)version
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentToken)initWithPaymentMethod:(id)a3 transactionIdentifier:(id)a4 paymentData:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPaymentToken *v12;
  PKPaymentToken *v13;
  uint64_t v14;
  NSString *transactionIdentifier;
  uint64_t v16;
  NSData *paymentData;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentToken;
  v12 = -[PKPaymentToken init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paymentMethod, a3);
    v14 = objc_msgSend(v10, "copy");
    transactionIdentifier = v13->_transactionIdentifier;
    v13->_transactionIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    paymentData = v13->_paymentData;
    v13->_paymentData = (NSData *)v16;

  }
  return v13;
}

- (PKPaymentToken)initWithCoder:(id)a3
{
  id v4;
  PKPaymentToken *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentToken;
  v5 = -[PKPaymentToken init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentInstrumentName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentToken setPaymentInstrumentName:](v5, "setPaymentInstrumentName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentNetwork"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentToken setPaymentNetwork:](v5, "setPaymentNetwork:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentToken setTransactionIdentifier:](v5, "setTransactionIdentifier:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentToken setPaymentData:](v5, "setPaymentData:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentMethod"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentToken setPaymentMethod:](v5, "setPaymentMethod:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("redeemURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentToken setRedeemURL:](v5, "setRedeemURL:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("retryNonce"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentToken setRetryNonce:](v5, "setRetryNonce:", v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[PKPaymentToken paymentInstrumentName](self, "paymentInstrumentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("paymentInstrumentName"));

  -[PKPaymentToken paymentNetwork](self, "paymentNetwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("paymentNetwork"));

  -[PKPaymentToken transactionIdentifier](self, "transactionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("transactionIdentifier"));

  -[PKPaymentToken paymentData](self, "paymentData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("paymentData"));

  -[PKPaymentToken paymentMethod](self, "paymentMethod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("paymentMethod"));

  -[PKPaymentToken redeemURL](self, "redeemURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("redeemURL"));

  -[PKPaymentToken retryNonce](self, "retryNonce");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("retryNonce"));

}

- (id)description
{
  void *v3;
  void *v4;
  NSData *paymentData;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_transactionIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("transactionIdentifier: %@; "), self->_transactionIdentifier);
  paymentData = self->_paymentData;
  if (paymentData)
    objc_msgSend(v4, "appendFormat:", CFSTR("paymentData: %tu bytes"), -[NSData length](paymentData, "length"));
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *transactionIdentifier;
  void *v6;
  PKPaymentMethod *paymentMethod;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", transactionIdentifier, CFSTR("transactionIdentifier"));
  if (self->_paymentData)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_paymentData, 4);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("paymentData"));

  }
  paymentMethod = self->_paymentMethod;
  if (paymentMethod)
  {
    -[PKPaymentMethod dictionaryRepresentation](paymentMethod, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("paymentMethod"));

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

+ (id)simulatedTokenForNetwork:(id)a3
{
  id v3;
  PKPaymentToken *v4;
  void *v5;
  PKPaymentMethod *v6;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentToken);
  -[PKPaymentToken setPaymentInstrumentName:](v4, "setPaymentInstrumentName:", CFSTR("Simulated Instrument"));
  -[PKPaymentToken setPaymentNetwork:](v4, "setPaymentNetwork:", v3);
  -[PKPaymentToken setTransactionIdentifier:](v4, "setTransactionIdentifier:", CFSTR("Simulated Identifier"));
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentToken setPaymentData:](v4, "setPaymentData:", v5);

  v6 = objc_alloc_init(PKPaymentMethod);
  -[PKPaymentMethod setDisplayName:](v6, "setDisplayName:", CFSTR("Simulated Instrument"));
  -[PKPaymentMethod setType:](v6, "setType:", 0);
  -[PKPaymentMethod setNetwork:](v6, "setNetwork:", v3);

  -[PKPaymentToken setPaymentMethod:](v4, "setPaymentMethod:", v6);
  return v4;
}

- (PKPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void)setPaymentMethod:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethod, a3);
}

- (NSString)paymentInstrumentName
{
  return self->_paymentInstrumentName;
}

- (void)setPaymentInstrumentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)paymentData
{
  return self->_paymentData;
}

- (void)setPaymentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)redeemURL
{
  return self->_redeemURL;
}

- (void)setRedeemURL:(id)a3
{
  objc_storeStrong((id *)&self->_redeemURL, a3);
}

- (NSString)retryNonce
{
  return self->_retryNonce;
}

- (void)setRetryNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryNonce, 0);
  objc_storeStrong((id *)&self->_redeemURL, 0);
  objc_storeStrong((id *)&self->_paymentData, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentNetwork, 0);
  objc_storeStrong((id *)&self->_paymentInstrumentName, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
}

@end
