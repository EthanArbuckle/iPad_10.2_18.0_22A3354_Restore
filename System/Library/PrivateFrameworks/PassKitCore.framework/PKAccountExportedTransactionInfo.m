@implementation PKAccountExportedTransactionInfo

- (void)encodeWithCoder:(id)a3
{
  NSData *transactionData;
  id v5;

  transactionData = self->_transactionData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transactionData, CFSTR("transactionData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionDataFilename, CFSTR("transactionDataFilename"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionDataHash, CFSTR("transactionDataHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statementMetadata, CFSTR("statementMetadata"));

}

- (PKAccountExportedTransactionInfo)initWithCoder:(id)a3
{
  id v4;
  PKAccountExportedTransactionInfo *v5;
  uint64_t v6;
  NSData *transactionData;
  uint64_t v8;
  NSString *transactionDataFilename;
  uint64_t v10;
  NSString *transactionDataHash;
  uint64_t v12;
  PKAccountStatementMetadata *statementMetadata;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountExportedTransactionInfo;
  v5 = -[PKAccountExportedTransactionInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionData"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDataFilename"));
    v8 = objc_claimAutoreleasedReturnValue();
    transactionDataFilename = v5->_transactionDataFilename;
    v5->_transactionDataFilename = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDataHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    transactionDataHash = v5->_transactionDataHash;
    v5->_transactionDataHash = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statementMetadata"));
    v12 = objc_claimAutoreleasedReturnValue();
    statementMetadata = v5->_statementMetadata;
    v5->_statementMetadata = (PKAccountStatementMetadata *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (void)setTransactionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)transactionDataFilename
{
  return self->_transactionDataFilename;
}

- (void)setTransactionDataFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)transactionDataHash
{
  return self->_transactionDataHash;
}

- (void)setTransactionDataHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PKAccountStatementMetadata)statementMetadata
{
  return self->_statementMetadata;
}

- (void)setStatementMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_statementMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementMetadata, 0);
  objc_storeStrong((id *)&self->_transactionDataHash, 0);
  objc_storeStrong((id *)&self->_transactionDataFilename, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
}

@end
