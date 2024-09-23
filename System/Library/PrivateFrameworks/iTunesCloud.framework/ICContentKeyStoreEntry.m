@implementation ICContentKeyStoreEntry

- (ICContentKeyStoreEntry)initWithIdentifier:(id)a3
{
  id v5;
  ICContentKeyStoreEntry *v6;
  ICContentKeyStoreEntry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICContentKeyStoreEntry;
  v6 = -[ICContentKeyStoreEntry init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (ICContentKeyStoreEntry)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  ICContentKeyStoreEntry *v6;
  uint64_t v7;
  NSData *keyData;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDate *renewalDate;
  void *v13;
  uint64_t v14;
  NSNumber *accountDSID;
  uint64_t v16;
  NSNumber *adamID;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICContentKeyStoreEntry initWithIdentifier:](self, "initWithIdentifier:", v5);

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
    v7 = objc_claimAutoreleasedReturnValue();
    keyData = v6->_keyData;
    v6->_keyData = (NSData *)v7;

    v9 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("renewalDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    v11 = objc_claimAutoreleasedReturnValue();
    renewalDate = v6->_renewalDate;
    v6->_renewalDate = (NSDate *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_failureCount = objc_msgSend(v13, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dsid"));
    v14 = objc_claimAutoreleasedReturnValue();
    accountDSID = v6->_accountDSID;
    v6->_accountDSID = (NSNumber *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adamID"));
    v16 = objc_claimAutoreleasedReturnValue();
    adamID = v6->_adamID;
    v6->_adamID = (NSNumber *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyServerProtocolType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_keyServerProtocolType = objc_msgSend(v18, "integerValue");

  }
  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSData *keyData;
  NSDate *renewalDate;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  keyData = self->_keyData;
  if (keyData)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", keyData, CFSTR("key"));
  renewalDate = self->_renewalDate;
  if (renewalDate)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceReferenceDate](renewalDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("renewalDate"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_failureCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("failureCount"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountDSID, CFSTR("dsid"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_adamID, CFSTR("adamID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_keyServerProtocolType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("keyServerProtocolType"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)renewalDate
{
  return self->_renewalDate;
}

- (void)setRenewalDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(unint64_t)a3
{
  self->_failureCount = a3;
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (void)setAccountDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)keyServerProtocolType
{
  return self->_keyServerProtocolType;
}

- (void)setKeyServerProtocolType:(int64_t)a3
{
  self->_keyServerProtocolType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
