@implementation PKPeerPaymentEncryptionCertificate

- (PKPeerPaymentEncryptionCertificate)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentEncryptionCertificate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSArray *encryptionCertificates;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentEncryptionCertificate;
  v5 = -[PKPeerPaymentEncryptionCertificate init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("destination"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_destination = PKPeerPaymentEncryptionCertificateDestinationFromString(v6);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("encryptionVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_encryptionScheme = PKPrivacyEncryptionSchemeFromString(v7);

    objc_msgSend(v4, "PKNumberForKey:", CFSTR("certificatesVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_certificatesVersion = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("encryptionCertificates"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__PKPeerPaymentEncryptionCertificate_initWithDictionary___block_invoke;
    v15[3] = &unk_1E2AC6190;
    v16 = v10;
    v11 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);
    v12 = objc_msgSend(v11, "copy");
    encryptionCertificates = v5->_encryptionCertificates;
    v5->_encryptionCertificates = (NSArray *)v12;

  }
  return v5;
}

void __57__PKPeerPaymentEncryptionCertificate_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 0);

  objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentEncryptionCertificate)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentEncryptionCertificate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *encryptionCertificates;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentEncryptionCertificate;
  v5 = -[PKPeerPaymentEncryptionCertificate init](&v12, sel_init);
  if (v5)
  {
    v5->_destination = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("destination"));
    v5->_encryptionScheme = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("encryptionVersion"));
    v5->_certificatesVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("certificatesVersion"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("encryptionCertificates"));
    v9 = objc_claimAutoreleasedReturnValue();
    encryptionCertificates = v5->_encryptionCertificates;
    v5->_encryptionCertificates = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t destination;
  id v5;

  destination = self->_destination;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", destination, CFSTR("destination"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_encryptionScheme, CFSTR("encryptionVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_certificatesVersion, CFSTR("certificatesVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptionCertificates, CFSTR("encryptionCertificates"));

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
  objc_msgSend(v3, "safelyAddObject:", self->_encryptionCertificates);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_destination - v4 + 32 * v4;
  v6 = self->_encryptionScheme - v5 + 32 * v5;
  v7 = self->_certificatesVersion - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *encryptionCertificates;
  NSArray *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  encryptionCertificates = self->_encryptionCertificates;
  v6 = (NSArray *)v4[4];
  if (encryptionCertificates && v6)
  {
    if ((-[NSArray isEqual:](encryptionCertificates, "isEqual:") & 1) == 0)
      goto LABEL_10;
  }
  else if (encryptionCertificates != v6)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  if (self->_destination != v4[1] || self->_encryptionScheme != v4[2])
    goto LABEL_10;
  v7 = self->_certificatesVersion == v4[3];
LABEL_11:

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_destination == 1)
    v5 = CFSTR("recipientData");
  else
    v5 = CFSTR("unknown");
  objc_msgSend(v3, "appendFormat:", CFSTR("destination: '%@'; "), v5);
  PKPrivacyEncryptionSchemeToString(self->_encryptionScheme);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("encryptionScheme: '%@'; "), v6);

  objc_msgSend(v4, "appendFormat:", CFSTR("certificatesVersion: '%ld'; "), self->_certificatesVersion);
  objc_msgSend(v4, "appendFormat:", CFSTR("encryptionCertificates: '%@'; "), self->_encryptionCertificates);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_destination == 1)
    v5 = CFSTR("recipientData");
  else
    v5 = CFSTR("unknown");
  objc_msgSend(v3, "appendFormat:", CFSTR("destination: '%@'; "), v5);
  PKPrivacyEncryptionSchemeToString(self->_encryptionScheme);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("encryptionScheme: '%@'; "), v6);

  objc_msgSend(v4, "appendFormat:", CFSTR("certificatesVersion: '%ld'; "), self->_certificatesVersion);
  objc_msgSend(v4, "appendFormat:", CFSTR("encryptionCertificates: [\n"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_encryptionCertificates;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "base64EncodedStringWithOptions:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%@, \n"), v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "appendFormat:", CFSTR("];>"));
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPeerPaymentEncryptionCertificate *v5;
  uint64_t v6;
  NSArray *encryptionCertificates;

  v5 = -[PKPeerPaymentEncryptionCertificate init](+[PKPeerPaymentEncryptionCertificate allocWithZone:](PKPeerPaymentEncryptionCertificate, "allocWithZone:"), "init");
  v5->_destination = self->_destination;
  v5->_encryptionScheme = self->_encryptionScheme;
  v5->_certificatesVersion = self->_certificatesVersion;
  v6 = -[NSArray copyWithZone:](self->_encryptionCertificates, "copyWithZone:", a3);
  encryptionCertificates = v5->_encryptionCertificates;
  v5->_encryptionCertificates = (NSArray *)v6;

  return v5;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (unint64_t)encryptionScheme
{
  return self->_encryptionScheme;
}

- (void)setEncryptionScheme:(unint64_t)a3
{
  self->_encryptionScheme = a3;
}

- (int64_t)certificatesVersion
{
  return self->_certificatesVersion;
}

- (void)setCertificatesVersion:(int64_t)a3
{
  self->_certificatesVersion = a3;
}

- (NSArray)encryptionCertificates
{
  return self->_encryptionCertificates;
}

- (void)setEncryptionCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionCertificates, 0);
}

@end
