@implementation PKWrappedPayment

- (PKWrappedPayment)initWithCoder:(id)a3
{
  id v4;
  PKWrappedPayment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKWrappedPayment;
  v5 = -[PKWrappedPayment init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setTransactionIdentifier:](v5, "setTransactionIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setTransactionData:](v5, "setTransactionData:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionInstructionsSignature"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setTransactionInstructionsSignature:](v5, "setTransactionInstructionsSignature:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("certificates"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setCertificates:](v5, "setCertificates:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantCountryCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setMerchantCountryCode:](v5, "setMerchantCountryCode:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kextBlacklistVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setKextBlacklistVersion:](v5, "setKextBlacklistVersion:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enrollmentSignature"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setEnrollmentSignature:](v5, "setEnrollmentSignature:", v12);

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("SEPCertificates"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setSEPCertificates:](v5, "setSEPCertificates:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmationBlobHash"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setConfirmationBlobHash:](v5, "setConfirmationBlobHash:", v17);

    -[PKWrappedPayment setConfirmationBlobVersion:](v5, "setConfirmationBlobVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("confirmationBlobVersion")));
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PKWrappedPayment transactionIdentifier](self, "transactionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("transactionIdentifier"));

  -[PKWrappedPayment transactionData](self, "transactionData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("transactionData"));

  -[PKWrappedPayment transactionInstructionsSignature](self, "transactionInstructionsSignature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("transactionInstructionsSignature"));

  -[PKWrappedPayment certificates](self, "certificates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("certificates"));

  -[PKWrappedPayment merchantCountryCode](self, "merchantCountryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("merchantCountryCode"));

  -[PKWrappedPayment kextBlacklistVersion](self, "kextBlacklistVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("kextBlacklistVersion"));

  -[PKWrappedPayment enrollmentSignature](self, "enrollmentSignature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("enrollmentSignature"));

  -[PKWrappedPayment SEPCertificates](self, "SEPCertificates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("SEPCertificates"));

  -[PKWrappedPayment confirmationBlobHash](self, "confirmationBlobHash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("confirmationBlobHash"));

  objc_msgSend(v13, "encodeInteger:forKey:", -[PKWrappedPayment confirmationBlobVersion](self, "confirmationBlobVersion"), CFSTR("confirmationBlobVersion"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  -[PKWrappedPayment transactionIdentifier](self, "transactionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKWrappedPayment transactionData](self, "transactionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  -[PKWrappedPayment certificates](self, "certificates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; transactionId = %@; transactionData = %tu bytes; certificates = %@;"),
    v4,
    self,
    v5,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKWrappedPayment SEPCertificates](self, "SEPCertificates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" SEPCertificates = %@;"), v10);

  -[PKWrappedPayment confirmationBlobHash](self, "confirmationBlobHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" confirmationBlobHash = %@;"), v11);

  objc_msgSend(v9, "appendFormat:", CFSTR(" confirmationBlobVersion: %d"), -[PKWrappedPayment confirmationBlobVersion](self, "confirmationBlobVersion"));
  -[PKWrappedPayment transactionInstructionsSignature](self, "transactionInstructionsSignature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PKWrappedPayment transactionInstructionsSignature](self, "transactionInstructionsSignature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" transactionInstructionsSignature = %tu bytes;"),
      objc_msgSend(v13, "length"));

  }
  -[PKWrappedPayment enrollmentSignature](self, "enrollmentSignature");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PKWrappedPayment enrollmentSignature](self, "enrollmentSignature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" enrollmentSignature: %@;"), v15);

  }
  objc_msgSend(v9, "appendString:", CFSTR(">"));
  v16 = (void *)objc_msgSend(v9, "copy");

  return v16;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (void)setTransactionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)transactionInstructionsSignature
{
  return self->_transactionInstructionsSignature;
}

- (void)setTransactionInstructionsSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PKSecureElementCertificateSet)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (void)setMerchantCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)kextBlacklistVersion
{
  return self->_kextBlacklistVersion;
}

- (void)setKextBlacklistVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)enrollmentSignature
{
  return self->_enrollmentSignature;
}

- (void)setEnrollmentSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)SEPCertificates
{
  return self->_SEPCertificates;
}

- (void)setSEPCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)confirmationBlobHash
{
  return self->_confirmationBlobHash;
}

- (void)setConfirmationBlobHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)confirmationBlobVersion
{
  return self->_confirmationBlobVersion;
}

- (void)setConfirmationBlobVersion:(int64_t)a3
{
  self->_confirmationBlobVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationBlobHash, 0);
  objc_storeStrong((id *)&self->_SEPCertificates, 0);
  objc_storeStrong((id *)&self->_enrollmentSignature, 0);
  objc_storeStrong((id *)&self->_kextBlacklistVersion, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_transactionInstructionsSignature, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end
