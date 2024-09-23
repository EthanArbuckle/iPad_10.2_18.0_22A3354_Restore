@implementation PKPaymentLocalPassCredential

- (PKPaymentLocalPassCredential)init
{
  return -[PKPaymentLocalPassCredential initWithPaymentPass:](self, "initWithPaymentPass:", 0);
}

- (PKPaymentLocalPassCredential)initWithPaymentPass:(id)a3
{
  id v5;
  PKPaymentLocalPassCredential *v6;
  PKPaymentLocalPassCredential *v7;
  uint64_t v8;
  NSString *serialNumber;
  uint64_t v10;
  NSString *passTypeIdentifier;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKPaymentLocalPassCredential;
    v6 = -[PKPaymentCredential init](&v17, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_paymentPass, a3);
      objc_msgSend(v5, "serialNumber");
      v8 = objc_claimAutoreleasedReturnValue();
      serialNumber = v7->_serialNumber;
      v7->_serialNumber = (NSString *)v8;

      objc_msgSend(v5, "passTypeIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      passTypeIdentifier = v7->_passTypeIdentifier;
      v7->_passTypeIdentifier = (NSString *)v10;

      objc_msgSend(v5, "devicePrimaryPaymentApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentCredential setCredentialType:](v7, "setCredentialType:", objc_msgSend(v12, "paymentNetworkIdentifier"));

      objc_msgSend(v5, "primaryAccountNumberSuffix");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentCredential setSanitizedPrimaryAccountNumber:](v7, "setSanitizedPrimaryAccountNumber:", v13);

      objc_msgSend(v5, "sanitizedPrimaryAccountName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentCredential setSanitizedPrimaryAccountName:](v7, "setSanitizedPrimaryAccountName:", v14);

      -[PKPaymentCredential setExpiration:](v7, "setExpiration:", 0);
      objc_msgSend(v5, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentCredential setLongDescription:](v7, "setLongDescription:", v15);

      -[PKPaymentCredential setCardType:](v7, "setCardType:", objc_msgSend(v5, "cardType"));
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (NSString)summaryMetadataDescription
{
  void *v3;
  void *v4;

  if (-[PKPass passType](self->_paymentPass, "passType") == PKPassTypeSecureElement)
  {
    -[PKSecureElementPass primaryAccountNumberSuffix](self->_paymentPass, "primaryAccountNumberSuffix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      PKMaskedPaymentPAN((uint64_t)v3);
    else
      -[PKSecureElementPass sanitizedPrimaryAccountName](self->_paymentPass, "sanitizedPrimaryAccountName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentLocalPassCredential *v4;
  BOOL v5;

  v4 = (PKPaymentLocalPassCredential *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKPaymentLocalPassCredential _isEqualToCredential:](self, "_isEqualToCredential:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  char v10;

  v4 = a3;
  v5 = (void *)v4[13];
  v6 = self->_serialNumber;
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {
    v10 = 1;
  }
  else
  {
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      v10 = 0;
    else
      v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);
  }

  return v10;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 0;
}

- (BOOL)couldSupportSuperEasyProvisioning
{
  if (-[PKSecureElementPass isTransitPass](self->_paymentPass, "isTransitPass")
    || -[PKSecureElementPass isAccessPass](self->_paymentPass, "isAccessPass"))
  {
    return 0;
  }
  else
  {
    return !-[PKSecureElementPass isIdentityPass](self->_paymentPass, "isIdentityPass");
  }
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_serialNumber);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  __CFString *serialNumber;
  void *v4;
  __CFString *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  serialNumber = (__CFString *)self->_serialNumber;
  if (!serialNumber)
    serialNumber = CFSTR("n/a");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = serialNumber;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p>: Serial Number: %@"), v7, self, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
