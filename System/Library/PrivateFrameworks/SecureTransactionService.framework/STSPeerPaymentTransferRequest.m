@implementation STSPeerPaymentTransferRequest

- (STSPeerPaymentTransferRequest)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 countryCode:(id)a5 transactionDate:(id)a6 appleTransactionHash:(id)a7 publicTransactionHash:(id)a8 nonce:(id)a9
{
  id v16;
  id v17;
  STSPeerPaymentTransferRequest *v18;
  STSPeerPaymentTransferRequest *v19;
  id v21;
  objc_super v22;

  v21 = a7;
  v16 = a8;
  v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)STSPeerPaymentTransferRequest;
  v18 = -[STSPaymentRequestBase initWithTransactionAmount:currencyCode:countryCode:transactionDate:](&v22, sel_initWithTransactionAmount_currencyCode_countryCode_transactionDate_, a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_nonce, a9);
    objc_storeStrong((id *)&v19->_appleTransactionHash, a7);
    objc_storeStrong((id *)&v19->_publicTransactionHash, a8);
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *appleTransactionHash;
  NSString *publicTransactionHash;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[STSPaymentRequestBase transactionAmount](self, "transactionAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  appleTransactionHash = self->_appleTransactionHash;
  publicTransactionHash = self->_publicTransactionHash;
  -[STSPaymentRequestBase transactionDate](self, "transactionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSPaymentRequestBase currencyCode](self, "currencyCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSPaymentRequestBase countryCode](self, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("STSPeerPaymentTransferRequest { transactionAmount=%@ appleTransactionHash=%@ publicTransactionHash=%@ transactionDate=%@ transactionCurrency=%@ transactionCountry=%@ nonce=%@}"), v4, appleTransactionHash, publicTransactionHash, v7, v8, v9, self->_nonce);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSPeerPaymentTransferRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSPeerPaymentTransferRequest;
  return -[STSPeerPaymentTransferRequest init](&v3, sel_init);
}

- (STSPeerPaymentTransferRequest)initWithCoder:(id)a3
{
  id v4;
  STSPeerPaymentTransferRequest *v5;
  uint64_t v6;
  NSString *appleTransactionHash;
  uint64_t v8;
  NSString *publicTransactionHash;
  uint64_t v10;
  NSData *nonce;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSPeerPaymentTransferRequest;
  v5 = -[STSPaymentRequestBase initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferAppleTransactionHash"));
    v6 = objc_claimAutoreleasedReturnValue();
    appleTransactionHash = v5->_appleTransactionHash;
    v5->_appleTransactionHash = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferPublicTransactionHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    publicTransactionHash = v5->_publicTransactionHash;
    v5->_publicTransactionHash = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferNonce"));
    v10 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSPeerPaymentTransferRequest;
  v4 = a3;
  -[STSPaymentRequestBase encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_appleTransactionHash, CFSTR("transferAppleTransactionHash"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_publicTransactionHash, CFSTR("transferPublicTransactionHash"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_nonce, CFSTR("transferNonce"));

}

- (id)toNFPeerPaymentTransferRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BE6B5B0]);
  -[STSPaymentRequestBase transactionAmount](self, "transactionAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransactionAmount:", v4);

  -[STSPaymentRequestBase transactionDate](self, "transactionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransactionDate:", v5);

  -[STSPaymentRequestBase currencyCode](self, "currencyCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransactionCurrency:", v6);

  -[STSPaymentRequestBase countryCode](self, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransactionCountry:", v7);

  objc_msgSend(v3, "setAppleTransactionHash:", self->_appleTransactionHash);
  objc_msgSend(v3, "setPublicTransactionHash:", self->_publicTransactionHash);
  objc_msgSend(v3, "setNonce:", self->_nonce);
  return v3;
}

- (NSString)appleTransactionHash
{
  return self->_appleTransactionHash;
}

- (void)setAppleTransactionHash:(id)a3
{
  objc_storeStrong((id *)&self->_appleTransactionHash, a3);
}

- (NSString)publicTransactionHash
{
  return self->_publicTransactionHash;
}

- (void)setPublicTransactionHash:(id)a3
{
  objc_storeStrong((id *)&self->_publicTransactionHash, a3);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_publicTransactionHash, 0);
  objc_storeStrong((id *)&self->_appleTransactionHash, 0);
}

@end
