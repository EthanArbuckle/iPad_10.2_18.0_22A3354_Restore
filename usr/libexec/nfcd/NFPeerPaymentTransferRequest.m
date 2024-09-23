@implementation NFPeerPaymentTransferRequest

- (NFPeerPaymentTransferRequest)initWithDictionary:(id)a3
{
  id v4;
  NFPeerPaymentTransferRequest *v5;
  uint64_t v6;
  NSDecimalNumber *transactionAmount;
  uint64_t v8;
  NSString *appleTransactionHash;
  uint64_t v10;
  NSString *publicTransactionHash;
  uint64_t v12;
  NSDate *transactionDate;
  uint64_t v14;
  NSString *transactionCurrency;
  uint64_t v16;
  NSString *transactionCountry;
  uint64_t v18;
  NSData *nonce;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NFPeerPaymentTransferRequest;
  v5 = -[NFPeerPaymentTransferRequest init](&v21, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferAmount")));
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferAppleTransactionHash")));
    appleTransactionHash = v5->_appleTransactionHash;
    v5->_appleTransactionHash = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferPublicTransactionHash")));
    publicTransactionHash = v5->_publicTransactionHash;
    v5->_publicTransactionHash = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferDate")));
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferCurrency")));
    transactionCurrency = v5->_transactionCurrency;
    v5->_transactionCurrency = (NSString *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferCountry")));
    transactionCountry = v5->_transactionCountry;
    v5->_transactionCountry = (NSString *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferNonce")));
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v18;

  }
  return v5;
}

- (NFPeerPaymentTransferRequest)initWithCoder:(id)a3
{
  id v4;
  NFPeerPaymentTransferRequest *v5;
  id v6;
  uint64_t v7;
  NSDecimalNumber *transactionAmount;
  id v9;
  uint64_t v10;
  NSString *appleTransactionHash;
  id v12;
  uint64_t v13;
  NSString *publicTransactionHash;
  id v15;
  uint64_t v16;
  NSDate *transactionDate;
  id v18;
  uint64_t v19;
  NSString *transactionCurrency;
  id v21;
  uint64_t v22;
  NSString *transactionCountry;
  id v24;
  uint64_t v25;
  NSData *nonce;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NFPeerPaymentTransferRequest;
  v5 = -[NFPeerPaymentTransferRequest init](&v28, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDecimalNumber), CFSTR("transferAmount"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("transferAppleTransactionHash"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    appleTransactionHash = v5->_appleTransactionHash;
    v5->_appleTransactionHash = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("transferPublicTransactionHash"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    publicTransactionHash = v5->_publicTransactionHash;
    v5->_publicTransactionHash = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("transferDate"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("transferCurrency"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    transactionCurrency = v5->_transactionCurrency;
    v5->_transactionCurrency = (NSString *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("transferCountry"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    transactionCountry = v5->_transactionCountry;
    v5->_transactionCountry = (NSString *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("transferNonce"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *transactionAmount;
  id v5;

  transactionAmount = self->_transactionAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transactionAmount, CFSTR("transferAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleTransactionHash, CFSTR("transferAppleTransactionHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publicTransactionHash, CFSTR("transferPublicTransactionHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionDate, CFSTR("transferDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionCurrency, CFSTR("transferCurrency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionCountry, CFSTR("transferCountry"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nonce, CFSTR("transferNonce"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)appleTransactionHash
{
  return self->_appleTransactionHash;
}

- (void)setAppleTransactionHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)publicTransactionHash
{
  return self->_publicTransactionHash;
}

- (void)setPublicTransactionHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)transactionCurrency
{
  return self->_transactionCurrency;
}

- (void)setTransactionCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)transactionCountry
{
  return self->_transactionCountry;
}

- (void)setTransactionCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_transactionCountry, 0);
  objc_storeStrong((id *)&self->_transactionCurrency, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_publicTransactionHash, 0);
  objc_storeStrong((id *)&self->_appleTransactionHash, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
}

@end
