@implementation STSVASTransaction

+ (id)vasTransactionForCredential:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[STSVASTransaction initForCredential:withDictionary:]([STSVASTransaction alloc], "initForCredential:withDictionary:", v6, v5);

  return v7;
}

- (id)initForCredential:(id)a3 withDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  STSVASTransaction *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int64_t v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", 0x24D3A84C0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v9 = v8;
  else
    v9 = 0;
  v17.receiver = self;
  v17.super_class = (Class)STSVASTransaction;
  v10 = -[STSAuxiliaryTransaction initWithCredential:error:](&v17, sel_initWithCredential_error_, v6, v9);
  if (v10)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("STSVASTransactionKeyMerchantId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v10->_merchantId, v11);
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("STSVASTransactionKeySignupUrl"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v10->_signupUrl, v12);
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("STSVASTransactionKeyTerminalAppVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v10->_terminalAppVersion, v13);
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("STSVASTransactionKeyTerminalMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_msgSend(v8, "unsignedShortValue") - 2;
        if (v14 > 6)
          v15 = 0;
        else
          v15 = qword_2158DB978[(__int16)v14];
        v10->_terminalMode = v15;
      }
    }
  }

  return v10;
}

- (id)vasCredential
{
  return (id)MEMORY[0x24BEDD108](self, sel_credential);
}

- (STSVASTransaction)initWithCoder:(id)a3
{
  id v4;
  STSVASTransaction *v5;
  uint64_t v6;
  NSData *merchantId;
  uint64_t v8;
  NSString *signupUrl;
  uint64_t v10;
  NSNumber *terminalAppVersion;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSVASTransaction;
  v5 = -[STSAuxiliaryTransaction initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSVASTransactionKeyMerchantId"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSVASTransactionKeySignupUrl"));
    v8 = objc_claimAutoreleasedReturnValue();
    signupUrl = v5->_signupUrl;
    v5->_signupUrl = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSVASTransactionKeyTerminalAppVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    terminalAppVersion = v5->_terminalAppVersion;
    v5->_terminalAppVersion = (NSNumber *)v10;

    v5->_terminalMode = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("STSVASTransactionKeyTerminalMode"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSVASTransaction;
  v4 = a3;
  -[STSAuxiliaryTransaction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_merchantId, CFSTR("STSVASTransactionKeyMerchantId"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_signupUrl, CFSTR("STSVASTransactionKeySignupUrl"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_terminalAppVersion, CFSTR("STSVASTransactionKeyTerminalAppVersion"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_terminalMode, CFSTR("STSVASTransactionKeyTerminalMode"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)merchantId
{
  return self->_merchantId;
}

- (NSString)signupUrl
{
  return self->_signupUrl;
}

- (NSNumber)terminalAppVersion
{
  return self->_terminalAppVersion;
}

- (int64_t)terminalMode
{
  return self->_terminalMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminalAppVersion, 0);
  objc_storeStrong((id *)&self->_signupUrl, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
}

@end
