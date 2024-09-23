@implementation PKEncryptedVPANPaymentCredentials

- (PKEncryptedVPANPaymentCredentials)initWithDictionary:(id)a3
{
  id v4;
  PKEncryptedVPANPaymentCredentials *v5;
  void *v6;
  uint64_t v7;
  NSData *ephemeralPublicKey;
  void *v9;
  uint64_t v10;
  NSData *encryptedCardData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKEncryptedVPANPaymentCredentials;
  v5 = -[PKEncryptedVPANPaymentCredentials init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("ephemeralPublicKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
      ephemeralPublicKey = v5->_ephemeralPublicKey;
      v5->_ephemeralPublicKey = (NSData *)v7;

    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("encryptedData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
      encryptedCardData = v5->_encryptedCardData;
      v5->_encryptedCardData = (NSData *)v10;

    }
  }

  return v5;
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (NSData)encryptedCardData
{
  return self->_encryptedCardData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedCardData, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
}

@end
