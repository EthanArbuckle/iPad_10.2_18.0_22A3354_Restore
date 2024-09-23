@implementation TrustedPeersHelperCustodianRecoveryKey

- (TrustedPeersHelperCustodianRecoveryKey)initWithUUID:(id)a3 encryptionKey:(id)a4 signingKey:(id)a5 recoveryString:(id)a6 salt:(id)a7 kind:(int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  TrustedPeersHelperCustodianRecoveryKey *v18;
  TrustedPeersHelperCustodianRecoveryKey *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)TrustedPeersHelperCustodianRecoveryKey;
  v18 = -[TrustedPeersHelperCustodianRecoveryKey init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeStrong((id *)&v19->_encryptionKey, a4);
    objc_storeStrong((id *)&v19->_signingKey, a5);
    objc_storeStrong((id *)&v19->_recoveryString, a6);
    objc_storeStrong((id *)&v19->_salt, a7);
    v19->_kind = a8;
  }

  return v19;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey uuid](self, "uuid"));
  v4 = -[TrustedPeersHelperCustodianRecoveryKey kind](self, "kind");
  if (v4 >= 3)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v4));
  else
    v5 = off_1002EAC10[v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CustodianRecoveryKey: %@, (%@)>"), v3, v5));

  return v6;
}

- (TrustedPeersHelperCustodianRecoveryKey)initWithCoder:(id)a3
{
  id v4;
  TrustedPeersHelperCustodianRecoveryKey *v5;
  id v6;
  uint64_t v7;
  NSString *uuid;
  id v9;
  uint64_t v10;
  NSData *encryptionKey;
  id v12;
  uint64_t v13;
  NSData *signingKey;
  id v15;
  uint64_t v16;
  NSString *recoveryString;
  id v18;
  uint64_t v19;
  NSString *salt;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TrustedPeersHelperCustodianRecoveryKey;
  v5 = -[TrustedPeersHelperCustodianRecoveryKey init](&v22, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("uuid"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("encryptionKey"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    encryptionKey = v5->_encryptionKey;
    v5->_encryptionKey = (NSData *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("signingKey"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    signingKey = v5->_signingKey;
    v5->_signingKey = (NSData *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("recoveryString"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    recoveryString = v5->_recoveryString;
    v5->_recoveryString = (NSString *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("salt"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    salt = v5->_salt;
    v5->_salt = (NSString *)v19;

    v5->_kind = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("kind"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey uuid](self, "uuid"));
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("uuid"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey encryptionKey](self, "encryptionKey"));
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("encryptionKey"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey signingKey](self, "signingKey"));
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("signingKey"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey recoveryString](self, "recoveryString"));
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("recoveryString"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey salt](self, "salt"));
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("salt"));

  objc_msgSend(v9, "encodeInt32:forKey:", -[TrustedPeersHelperCustodianRecoveryKey kind](self, "kind"), CFSTR("kind"));
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)encryptionKey
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEncryptionKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)signingKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSigningKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)recoveryString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRecoveryString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSalt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int)kind
{
  return self->_kind;
}

- (void)setKind:(int)a3
{
  self->_kind = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_recoveryString, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
