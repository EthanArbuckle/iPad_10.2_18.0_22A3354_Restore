@implementation PKPaymentEligibilityFIDOProfile

- (PKPaymentEligibilityFIDOProfile)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentEligibilityFIDOProfile *v5;
  void *v6;
  uint64_t v7;
  NSString *relyingPartyIdentifier;
  void *v9;
  uint64_t v10;
  NSString *accountHash;
  void *v12;
  void *v13;
  uint64_t v14;
  NSData *keyHash;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentEligibilityFIDOProfile;
  v5 = -[PKPaymentEligibilityFIDOProfile init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relyingPartyIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    relyingPartyIdentifier = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accountHash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    accountHash = v5->_accountHash;
    v5->_accountHash = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyHash"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataWithHexEncodedString:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    keyHash = v5->_keyHash;
    v5->_keyHash = (NSData *)v14;

  }
  return v5;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSString)accountHash
{
  return self->_accountHash;
}

- (NSData)keyHash
{
  return self->_keyHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyHash, 0);
  objc_storeStrong((id *)&self->_accountHash, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end
