@implementation TrustedPeersHelperTLKRecoveryResult

- (TrustedPeersHelperTLKRecoveryResult)initWithSuccessfulKeyUUIDs:(id)a3 totalTLKSharesRecovered:(int64_t)a4 tlkRecoveryErrors:(id)a5
{
  id v9;
  id v10;
  TrustedPeersHelperTLKRecoveryResult *v11;
  TrustedPeersHelperTLKRecoveryResult *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TrustedPeersHelperTLKRecoveryResult;
  v11 = -[TrustedPeersHelperTLKRecoveryResult init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_successfulKeysRecovered, a3);
    v12->_totalTLKSharesRecovered = a4;
    objc_storeStrong((id *)&v12->_tlkRecoveryErrors, a5);
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperTLKRecoveryResult successfulKeysRecovered](self, "successfulKeysRecovered"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<TLKRecoveryResult: %@ totalTLKSharesRecovered:%d>"), v3, -[TrustedPeersHelperTLKRecoveryResult totalTLKSharesRecovered](self, "totalTLKSharesRecovered")));

  return v4;
}

- (TrustedPeersHelperTLKRecoveryResult)initWithCoder:(id)a3
{
  id v4;
  TrustedPeersHelperTLKRecoveryResult *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSSet *successfulKeysRecovered;
  void *v10;
  uint64_t v11;
  NSDictionary *tlkRecoveryErrors;
  objc_super v14;
  _QWORD v15[2];

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TrustedPeersHelperTLKRecoveryResult;
  v5 = -[TrustedPeersHelperTLKRecoveryResult init](&v14, "init");
  if (v5)
  {
    v15[0] = objc_opt_class(NSSet);
    v15[1] = objc_opt_class(NSString);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("keys")));
    successfulKeysRecovered = v5->_successfulKeysRecovered;
    v5->_successfulKeysRecovered = (NSSet *)v8;

    v5->_totalTLKSharesRecovered = (int64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalShares"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper safeErrorClasses](SecXPCHelper, "safeErrorClasses"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("errors")));
    tlkRecoveryErrors = v5->_tlkRecoveryErrors;
    v5->_tlkRecoveryErrors = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperTLKRecoveryResult successfulKeysRecovered](self, "successfulKeysRecovered"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keys"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[TrustedPeersHelperTLKRecoveryResult totalTLKSharesRecovered](self, "totalTLKSharesRecovered"), CFSTR("totalShares"));
  v6 = (id)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperTLKRecoveryResult tlkRecoveryErrors](self, "tlkRecoveryErrors"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("errors"));

}

- (NSSet)successfulKeysRecovered
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSuccessfulKeysRecovered:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)totalTLKSharesRecovered
{
  return self->_totalTLKSharesRecovered;
}

- (void)setTotalTLKSharesRecovered:(int64_t)a3
{
  self->_totalTLKSharesRecovered = a3;
}

- (NSDictionary)tlkRecoveryErrors
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTlkRecoveryErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlkRecoveryErrors, 0);
  objc_storeStrong((id *)&self->_successfulKeysRecovered, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
