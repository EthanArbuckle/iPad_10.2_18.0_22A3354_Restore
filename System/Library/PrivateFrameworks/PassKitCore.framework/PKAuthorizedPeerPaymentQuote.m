@implementation PKAuthorizedPeerPaymentQuote

- (PKAuthorizedPeerPaymentQuote)initWithQuote:(id)a3 transactionData:(id)a4 certificates:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKAuthorizedPeerPaymentQuote *v12;
  PKAuthorizedPeerPaymentQuote *v13;
  uint64_t v14;
  NSData *transactionData;
  uint64_t v16;
  NSDictionary *certificates;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKAuthorizedPeerPaymentQuote;
  v12 = -[PKAuthorizedPeerPaymentQuote init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_peerPaymentQuote, a3);
    v14 = objc_msgSend(v10, "copy");
    transactionData = v13->_transactionData;
    v13->_transactionData = (NSData *)v14;

    v16 = objc_msgSend(v11, "copy");
    certificates = v13->_certificates;
    v13->_certificates = (NSDictionary *)v16;

  }
  return v13;
}

- (PKAuthorizedPeerPaymentQuote)initWithCoder:(id)a3
{
  id v4;
  PKAuthorizedPeerPaymentQuote *v5;
  uint64_t v6;
  PKPeerPaymentQuote *peerPaymentQuote;
  uint64_t v8;
  NSData *transactionData;
  uint64_t v10;
  NSDictionary *certificates;
  uint64_t v12;
  PKContact *contact;
  uint64_t v14;
  NSString *senderAddress;
  uint64_t v16;
  NSString *encryptedRecipientData;
  uint64_t v18;
  NSString *publicKeyHash;
  uint64_t v20;
  NSString *ephemeralPublicKey;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKAuthorizedPeerPaymentQuote;
  v5 = -[PKAuthorizedPeerPaymentQuote init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentQuote"));
    v6 = objc_claimAutoreleasedReturnValue();
    peerPaymentQuote = v5->_peerPaymentQuote;
    v5->_peerPaymentQuote = (PKPeerPaymentQuote *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionData"));
    v8 = objc_claimAutoreleasedReturnValue();
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v8;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("certificates"));
    v10 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
    v12 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (PKContact *)v12;

    v5->_paymentMethodType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentMethodType"));
    v5->_senderAddressType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("senderAddressType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderAddress"));
    v14 = objc_claimAutoreleasedReturnValue();
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedRecipientData"));
    v16 = objc_claimAutoreleasedReturnValue();
    encryptedRecipientData = v5->_encryptedRecipientData;
    v5->_encryptedRecipientData = (NSString *)v16;

    v5->_encryptionScheme = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("encryptionScheme"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyHash"));
    v18 = objc_claimAutoreleasedReturnValue();
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ephemeralPublicKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSString *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPeerPaymentQuote *peerPaymentQuote;
  id v5;

  peerPaymentQuote = self->_peerPaymentQuote;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", peerPaymentQuote, CFSTR("peerPaymentQuote"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionData, CFSTR("transactionData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificates, CFSTR("certificates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contact, CFSTR("contact"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_paymentMethodType, CFSTR("paymentMethodType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_senderAddressType, CFSTR("senderAddressType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderAddress, CFSTR("senderAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptedRecipientData, CFSTR("encryptedRecipientData"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_encryptionScheme, CFSTR("encryptionScheme"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publicKeyHash, CFSTR("publicKeyHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ephemeralPublicKey, CFSTR("ephemeralPublicKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_peerPaymentQuote);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionData);
  objc_msgSend(v3, "safelyAddObject:", self->_certificates);
  objc_msgSend(v3, "safelyAddObject:", self->_contact);
  objc_msgSend(v3, "safelyAddObject:", self->_senderAddress);
  objc_msgSend(v3, "safelyAddObject:", self->_encryptedRecipientData);
  objc_msgSend(v3, "safelyAddObject:", self->_publicKeyHash);
  objc_msgSend(v3, "safelyAddObject:", self->_ephemeralPublicKey);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_paymentMethodType - v4 + 32 * v4;
  v6 = self->_senderAddressType - v5 + 32 * v5;
  v7 = self->_encryptionScheme - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("peerPaymentQuote: '%@'; "), self->_peerPaymentQuote);
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionData: '%@'; "), self->_transactionData);
  objc_msgSend(v3, "appendFormat:", CFSTR("certificates: '%@'; "), self->_certificates);
  objc_msgSend(v3, "appendFormat:", CFSTR("contact: '%@'; "), self->_contact);
  PKPaymentMethodTypeToString(self->_paymentMethodType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentMethodType: '%@'; "), v4);

  PKPeerPaymentContactAddressTypeToString(self->_senderAddressType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("senderAddressType: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("senderAddress: '%@'; "), self->_senderAddress);
  objc_msgSend(v3, "appendFormat:", CFSTR("encryptedRecipientData: '%@'; "), self->_encryptedRecipientData);
  PKPrivacyEncryptionSchemeToString(self->_encryptionScheme);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("encryptionScheme: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("publicKeyHash: '%@'; "), self->_publicKeyHash);
  objc_msgSend(v3, "appendFormat:", CFSTR("ephemeralPublicKey: '%@'; "), self->_ephemeralPublicKey);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (PKPeerPaymentQuote)peerPaymentQuote
{
  return self->_peerPaymentQuote;
}

- (PKContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (NSDictionary)certificates
{
  return self->_certificates;
}

- (unint64_t)paymentMethodType
{
  return self->_paymentMethodType;
}

- (void)setPaymentMethodType:(unint64_t)a3
{
  self->_paymentMethodType = a3;
}

- (unint64_t)senderAddressType
{
  return self->_senderAddressType;
}

- (void)setSenderAddressType:(unint64_t)a3
{
  self->_senderAddressType = a3;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)encryptedRecipientData
{
  return self->_encryptedRecipientData;
}

- (void)setEncryptedRecipientData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)encryptionScheme
{
  return self->_encryptionScheme;
}

- (void)setEncryptionScheme:(unint64_t)a3
{
  self->_encryptionScheme = a3;
}

- (NSString)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_encryptedRecipientData, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_peerPaymentQuote, 0);
}

@end
