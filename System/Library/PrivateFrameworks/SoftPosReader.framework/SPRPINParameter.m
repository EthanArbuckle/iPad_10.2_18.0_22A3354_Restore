@implementation SPRPINParameter

+ (double)defaultTransactionDataLifetime
{
  return 60.0;
}

- (SPRPINParameter)init
{
  NSData *digest;
  NSString *pinToken;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  digest = self->_digest;
  self->_digest = 0;

  pinToken = self->_pinToken;
  self->_pinToken = 0;

  objc_msgSend_defaultTransactionDataLifetime(SPRPINParameter, v5, v6, v7, v8, v9);
  self->_transactionDataLifetime = v10;
  return self;
}

- (SPRPINParameter)initWithDigest:(id)a3 pinToken:(id)a4
{
  NSData *v6;
  NSString *v7;
  NSData *digest;
  NSData *v9;
  NSString *pinToken;
  NSString *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;

  v6 = (NSData *)a3;
  v7 = (NSString *)a4;
  digest = self->_digest;
  self->_digest = v6;
  v9 = v6;

  pinToken = self->_pinToken;
  self->_pinToken = v7;
  v11 = v7;

  objc_msgSend_defaultTransactionDataLifetime(SPRPINParameter, v12, v13, v14, v15, v16);
  v18 = v17;

  self->_transactionDataLifetime = v18;
  return self;
}

- (SPRPINParameter)initWithDigest:(id)a3 pinToken:(id)a4 transactionDataLifetime:(double)a5
{
  NSData *v8;
  NSString *v9;
  NSData *digest;
  NSData *v11;
  NSString *pinToken;

  v8 = (NSData *)a3;
  v9 = (NSString *)a4;
  digest = self->_digest;
  self->_digest = v8;
  v11 = v8;

  pinToken = self->_pinToken;
  self->_pinToken = v9;

  self->_transactionDataLifetime = a5;
  return self;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_asHexString(self->_digest, a2, v2, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v7, v9, (uint64_t)CFSTR("{digest: %@, pin token: %@, transaction data lifetime: %f}"), v10, v11, v12, v8, self->_pinToken, *(_QWORD *)&self->_transactionDataLifetime);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRPINParameter)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSData *v9;
  NSData *digest;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  NSString *pinToken;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("digest"), v7, v8);
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  digest = self->_digest;
  self->_digest = v9;

  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("pinToken"), v13, v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  pinToken = self->_pinToken;
  self->_pinToken = v15;

  objc_msgSend_decodeDoubleForKey_(v4, v17, (uint64_t)CFSTR("transactionDataLifetime"), v18, v19, v20);
  v22 = v21;

  self->_transactionDataLifetime = v22;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *digest;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  digest = self->_digest;
  v15 = a3;
  objc_msgSend_encodeObject_forKey_(v15, v5, (uint64_t)digest, (uint64_t)CFSTR("digest"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v15, v8, (uint64_t)self->_pinToken, (uint64_t)CFSTR("pinToken"), v9, v10);
  objc_msgSend_encodeDouble_forKey_(v15, v11, (uint64_t)CFSTR("transactionDataLifetime"), v12, v13, v14, self->_transactionDataLifetime);

}

- (NSData)digest
{
  return self->_digest;
}

- (NSString)pinToken
{
  return self->_pinToken;
}

- (double)transactionDataLifetime
{
  return self->_transactionDataLifetime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinToken, 0);
  objc_storeStrong((id *)&self->_digest, 0);
}

@end
