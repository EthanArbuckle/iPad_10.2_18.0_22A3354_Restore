@implementation PKPeerPaymentEncryptionCertificatesVersions

- (PKPeerPaymentEncryptionCertificatesVersions)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentEncryptionCertificatesVersions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentEncryptionCertificatesVersions;
  v5 = -[PKPeerPaymentEncryptionCertificatesVersions init](&v7, sel_init);
  if (v5)
    v5->_recipientData = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("recipientData"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentEncryptionCertificatesVersions)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentEncryptionCertificatesVersions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentEncryptionCertificatesVersions;
  v5 = -[PKPeerPaymentEncryptionCertificatesVersions init](&v7, sel_init);
  if (v5)
    v5->_recipientData = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("recipientData"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_recipientData, CFSTR("recipientData"));
}

- (unint64_t)hash
{
  return self->_recipientData + 527;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_recipientData == v4[1];

  return v5;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("recipientData: '%ld'; "), self->_recipientData);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[PKPeerPaymentEncryptionCertificatesVersions init](+[PKPeerPaymentEncryptionCertificatesVersions allocWithZone:](PKPeerPaymentEncryptionCertificatesVersions, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_recipientData;
  return result;
}

- (int64_t)certificatesVersionForDestination:(unint64_t)a3
{
  if (a3 == 1)
    return self->_recipientData;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)recipientData
{
  return self->_recipientData;
}

- (void)setRecipientData:(int64_t)a3
{
  self->_recipientData = a3;
}

@end
