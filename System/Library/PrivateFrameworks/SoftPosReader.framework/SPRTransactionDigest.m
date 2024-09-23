@implementation SPRTransactionDigest

- (SPRTransactionDigest)initWithTransactionId:(id)a3 transactionDataDigest:(id)a4
{
  NSString *v6;
  NSData *v7;
  NSString *transactionId;
  NSString *v9;
  NSData *transactionDataDigest;

  v6 = (NSString *)a3;
  v7 = (NSData *)a4;
  transactionId = self->_transactionId;
  self->_transactionId = v6;
  v9 = v6;

  transactionDataDigest = self->_transactionDataDigest;
  self->_transactionDataDigest = v7;

  return self;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSString *transactionId;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = (void *)MEMORY[0x24BDD17C8];
  transactionId = self->_transactionId;
  objc_msgSend_asHexString(self->_transactionDataDigest, a2, v2, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v9, (uint64_t)CFSTR("{transactionId=%@, transactionDataDigest=%@}"), v10, v11, v12, transactionId, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRTransactionDigest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  NSString *transactionId;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSData *v15;
  NSData *transactionDataDigest;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("transactionId"), v7, v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  transactionId = self->_transactionId;
  self->_transactionId = v9;

  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("transactionDataDigest"), v13, v14);
  v15 = (NSData *)objc_claimAutoreleasedReturnValue();

  transactionDataDigest = self->_transactionDataDigest;
  self->_transactionDataDigest = v15;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *transactionId;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  transactionId = self->_transactionId;
  v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)transactionId, (uint64_t)CFSTR("transactionId"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v11, v8, (uint64_t)self->_transactionDataDigest, (uint64_t)CFSTR("transactionDataDigest"), v9, v10);

}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (NSData)transactionDataDigest
{
  return self->_transactionDataDigest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDataDigest, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
}

@end
