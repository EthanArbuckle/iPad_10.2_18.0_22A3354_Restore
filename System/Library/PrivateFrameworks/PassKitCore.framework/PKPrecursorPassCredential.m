@implementation PKPrecursorPassCredential

- (PKPrecursorPassCredential)initWithRemoteCredential:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PKPrecursorPassCredential *v8;

  v5 = a3;
  objc_msgSend(v5, "passTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKPrecursorPassCredential initWithPassTypeIdentifier:passSerialNumber:](self, "initWithPassTypeIdentifier:passSerialNumber:", v6, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_remoteCredential, a3);

  return v8;
}

- (PKPrecursorPassCredential)initWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4
{
  id v7;
  id v8;
  PKPrecursorPassCredential *v9;
  PKPrecursorPassCredential *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPrecursorPassCredential;
  v9 = -[PKPaymentCredential init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passTypeIdentifier, a3);
    objc_storeStrong((id *)&v10->_serialNumber, a4);
  }

  return v10;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_passTypeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_serialNumber);
  v7.receiver = self;
  v7.super_class = (Class)PKPrecursorPassCredential;
  v4 = -[PKPaymentCredential hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: PasTypeIdentifier: %@; SerialNumber: %@;"),
    v5,
    self,
    self->_passTypeIdentifier,
    self->_serialNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PKPrecursorPassCredential)initWithCoder:(id)a3
{
  id v4;
  PKPrecursorPassCredential *v5;
  uint64_t v6;
  NSString *passTypeIdentifier;
  uint64_t v8;
  NSString *serialNumber;
  uint64_t v10;
  PKPaymentRemoteCredential *remoteCredential;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPrecursorPassCredential;
  v5 = -[PKPaymentCredential init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pasTypeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteCredential"));
    v10 = objc_claimAutoreleasedReturnValue();
    remoteCredential = v5->_remoteCredential;
    v5->_remoteCredential = (PKPaymentRemoteCredential *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *passTypeIdentifier;
  id v5;

  passTypeIdentifier = self->_passTypeIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passTypeIdentifier, CFSTR("pasTypeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remoteCredential, CFSTR("remoteCredential"));

}

- (PKPaymentPass)paymentPass
{
  return -[PKPaymentRemoteCredential paymentPass](self->_remoteCredential, "paymentPass");
}

- (void)setPaymentPass:(id)a3
{
  -[PKPaymentRemoteCredential setPaymentPass:](self->_remoteCredential, "setPaymentPass:", a3);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteCredential, 0);
}

@end
