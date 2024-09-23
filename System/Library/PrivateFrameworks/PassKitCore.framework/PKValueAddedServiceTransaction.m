@implementation PKValueAddedServiceTransaction

- (PKValueAddedServiceTransaction)init
{
  PKValueAddedServiceTransaction *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKValueAddedServiceTransaction;
  v2 = -[PKValueAddedServiceTransaction init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

  }
  return v2;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *identifier;
  PKValueAddedMerchant *merchant;
  NSString *merchantURL;
  NSNumber *terminalApplicationVersion;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  merchant = self->_merchant;
  identifier = self->_identifier;
  merchantURL = self->_merchantURL;
  terminalApplicationVersion = self->_terminalApplicationVersion;
  _PKEnumValueToString(self->_terminalMode, CFSTR("PKValueAddedServiceTerminalMode"), CFSTR("PKValueAddedServiceTerminalModeUnknown, PKValueAddedServiceTerminalModeSignupOnly, PKValueAddedServiceTerminalModeVASOnly, PKValueAddedServiceTerminalModeVASAndPayment, PKValueAddedServiceTerminalModeVASOrPayment"), v9, v10, v11, v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@; merchant: %@; merchantURL: %@; terminalApplicationVersion: %@; terminalMode: %@; didSucceed: %d; >"),
    v4,
    self,
    identifier,
    merchant,
    merchantURL,
    terminalApplicationVersion,
    v14,
    self->_didSucceed);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (PKValueAddedServiceTransaction)initWithCoder:(id)a3
{
  id v4;
  PKValueAddedServiceTransaction *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  PKValueAddedMerchant *merchant;
  uint64_t v10;
  NSString *merchantURL;
  uint64_t v12;
  NSNumber *terminalApplicationVersion;
  void *v14;
  uint64_t v15;
  NSDate *transactionDate;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKValueAddedServiceTransaction;
  v5 = -[PKValueAddedServiceTransaction init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PKValueAddedServiceTransactionIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PKValueAddedServiceTransactionMerchantKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    merchant = v5->_merchant;
    v5->_merchant = (PKValueAddedMerchant *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PKValueAddedServiceTransactionMerchantURLKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    merchantURL = v5->_merchantURL;
    v5->_merchantURL = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PKValueAddedServiceTransactionTerminalApplicationVersionKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    terminalApplicationVersion = v5->_terminalApplicationVersion;
    v5->_terminalApplicationVersion = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PKValueAddedServiceTransactionTerminalModeKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_terminalMode = objc_msgSend(v14, "integerValue");

    v5->_didSucceed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PKValueAddedServiceTransactionDidSucceedKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PKValueAddedServiceTransactionDateKey"));
    v15 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PKValueAddedServiceTransactionErrorKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_error = objc_msgSend(v17, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  void *v6;
  id v7;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("PKValueAddedServiceTransactionIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchant, CFSTR("PKValueAddedServiceTransactionMerchantKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantURL, CFSTR("PKValueAddedServiceTransactionMerchantURLKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_terminalApplicationVersion, CFSTR("PKValueAddedServiceTransactionTerminalApplicationVersionKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_terminalMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("PKValueAddedServiceTransactionTerminalModeKey"));

  objc_msgSend(v5, "encodeBool:forKey:", self->_didSucceed, CFSTR("PKValueAddedServiceTransactionDidSucceedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionDate, CFSTR("PKValueAddedServiceTransactionDateKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_error);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("PKValueAddedServiceTransactionErrorKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKValueAddedMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)merchantURL
{
  return self->_merchantURL;
}

- (void)setMerchantURL:(id)a3
{
  objc_storeStrong((id *)&self->_merchantURL, a3);
}

- (NSNumber)terminalApplicationVersion
{
  return self->_terminalApplicationVersion;
}

- (void)setTerminalApplicationVersion:(id)a3
{
  objc_storeStrong((id *)&self->_terminalApplicationVersion, a3);
}

- (int64_t)terminalMode
{
  return self->_terminalMode;
}

- (void)setTerminalMode:(int64_t)a3
{
  self->_terminalMode = a3;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_storeStrong((id *)&self->_transactionDate, a3);
}

- (int64_t)error
{
  return self->_error;
}

- (void)setError:(int64_t)a3
{
  self->_error = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_terminalApplicationVersion, 0);
  objc_storeStrong((id *)&self->_merchantURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
}

@end
