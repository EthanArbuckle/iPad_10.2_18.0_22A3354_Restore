@implementation PKPendingPrecursorPassCredential

- (PKPendingPrecursorPassCredential)init
{

  return 0;
}

- (id)initForDatabase
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPendingPrecursorPassCredential;
  return -[PKPendingPrecursorPassCredential init](&v3, sel_init);
}

- (PKPendingPrecursorPassCredential)initWithPrecursorCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKPendingPrecursorPassCredential *v7;

  v4 = a3;
  objc_msgSend(v4, "passTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PKPendingPrecursorPassCredential initWithPassTypeIdentifier:passSerialNumber:](self, "initWithPassTypeIdentifier:passSerialNumber:", v5, v6);
  return v7;
}

- (PKPendingPrecursorPassCredential)initWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PKPendingPrecursorPassCredential *v11;
  PKPendingPrecursorPassCredential *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  PKGeneratePassUniqueID(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Precursor-"), "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)PKPendingPrecursorPassCredential;
  v11 = -[PKPendingProvisioning initWithUniqueIdentifier:status:](&v14, sel_initWithUniqueIdentifier_status_, v10, 1);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_passTypeIdentifier, a3);
    objc_storeStrong((id *)&v12->_passSerialNumber, a4);
  }

  return v12;
}

- (id)type
{
  return CFSTR("PrecursorPassCredential");
}

- (BOOL)representsCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *passTypeIdentifier;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  _BOOL4 v12;
  void *v13;
  NSString *passSerialNumber;
  NSString *v15;
  NSString *v16;
  NSString *v17;

  v4 = a3;
  if (objc_msgSend(v4, "isPrecursorCredential"))
  {
    objc_msgSend(v4, "precursorCredential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isRemoteCredential"))
  {
    objc_msgSend(v4, "remoteCredential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v5;
    objc_msgSend(v5, "passTypeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = self->_passTypeIdentifier;
    v9 = v7;
    v10 = passTypeIdentifier;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      LOBYTE(v12) = 0;
      if (!v9 || !v10)
      {
        v17 = v9;
LABEL_19:

        v9 = v17;
LABEL_20:

        goto LABEL_21;
      }
      v12 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_20;
    }
    objc_msgSend(v6, "serialNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    passSerialNumber = self->_passSerialNumber;
    v11 = v13;
    v15 = passSerialNumber;
    if (v11 == v15)
    {
      LOBYTE(v12) = 1;
      v16 = v11;
    }
    else
    {
      v16 = v15;
      LOBYTE(v12) = 0;
      if (v11 && v15)
        LOBYTE(v12) = -[NSString isEqualToString:](v11, "isEqualToString:", v15);
    }
    v17 = v9;

    v9 = v11;
    goto LABEL_19;
  }
  LOBYTE(v12) = 0;
LABEL_21:

  return v12;
}

- (BOOL)representsPass:(id)a3
{
  id v4;
  void *v5;
  NSString *passTypeIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *passSerialNumber;
  NSString *v13;
  NSString *v14;
  NSString *v15;

  v4 = a3;
  objc_msgSend(v4, "passTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  passTypeIdentifier = self->_passTypeIdentifier;
  v7 = v5;
  v8 = passTypeIdentifier;
  if (v7 == v8)
  {

LABEL_7:
    objc_msgSend(v4, "serialNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    passSerialNumber = self->_passSerialNumber;
    v9 = v11;
    v13 = passSerialNumber;
    v14 = v13;
    if (v9 == v13)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = 0;
      if (v9 && v13)
        LOBYTE(v10) = -[NSString isEqualToString:](v9, "isEqualToString:", v13);
    }

    v15 = v9;
    goto LABEL_14;
  }
  v9 = v8;
  LOBYTE(v10) = 0;
  if (v7 && v8)
  {
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_15;
    goto LABEL_7;
  }
  v15 = v7;
LABEL_14:

LABEL_15:
  return v10;
}

- (id)credential
{
  return -[PKPrecursorPassCredential initWithPassTypeIdentifier:passSerialNumber:]([PKPrecursorPassCredential alloc], "initWithPassTypeIdentifier:passSerialNumber:", self->_passTypeIdentifier, self->_passSerialNumber);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingPrecursorPassCredential)initWithCoder:(id)a3
{
  id v4;
  PKPendingPrecursorPassCredential *v5;
  uint64_t v6;
  NSString *passTypeIdentifier;
  uint64_t v8;
  NSString *passSerialNumber;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPendingPrecursorPassCredential;
  v5 = -[PKPendingProvisioning initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passSerialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPendingPrecursorPassCredential;
  v4 = a3;
  -[PKPendingProvisioning encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passTypeIdentifier, CFSTR("passTypeIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passSerialNumber, CFSTR("passSerialNumber"));

}

- (void)_copyIntoPendingProvision:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPendingPrecursorPassCredential;
  v4 = a3;
  -[PKPendingProvisioning _copyIntoPendingProvision:](&v9, sel__copyIntoPendingProvision_, v4);
  v5 = -[NSString copy](self->_passTypeIdentifier, "copy", v9.receiver, v9.super_class);
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = -[NSString copy](self->_passSerialNumber, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_passSerialNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end
