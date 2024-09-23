@implementation PKSecureElementSignatureInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSecureElementSignatureInfo)initWithSecureElementCertificateSet:(id)a3 sequenceCounter:(id)a4 platformIdentifier:(id)a5 certificateVersion:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  PKSecureElementSignatureInfo *v14;
  PKSecureElementSignatureInfo *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKSecureElementSignatureInfo;
  v14 = -[PKSecureElementSignatureInfo init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_certificates, a3);
    objc_storeStrong((id *)&v15->_sequenceCounter, a4);
    objc_storeStrong((id *)&v15->_platformIdentifier, a5);
    v15->_certificateVersion = a6;
  }

  return v15;
}

- (PKSecureElementSignatureInfo)initWithCoder:(id)a3
{
  id v4;
  PKSecureElementSignatureInfo *v5;
  uint64_t v6;
  PKSecureElementCertificateSet *certificates;
  uint64_t v8;
  NSString *sequenceCounter;
  uint64_t v10;
  NSString *platformIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSecureElementSignatureInfo;
  v5 = -[PKSecureElementSignatureInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("certificates"));
    v6 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (PKSecureElementCertificateSet *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sequenceCounter"));
    v8 = objc_claimAutoreleasedReturnValue();
    sequenceCounter = v5->_sequenceCounter;
    v5->_sequenceCounter = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    platformIdentifier = v5->_platformIdentifier;
    v5->_platformIdentifier = (NSString *)v10;

    v5->_certificateVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("certificateVersion"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[PKSecureElementCertificateSet copyWithZone:](self->_certificates, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_sequenceCounter, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_platformIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v5[4] = self->_certificateVersion;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKSecureElementCertificateSet *certificates;
  id v5;

  certificates = self->_certificates;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", certificates, CFSTR("certificates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sequenceCounter, CFSTR("sequenceCounter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_platformIdentifier, CFSTR("platformIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_certificateVersion, CFSTR("certificateVersion"));

}

- (NSString)sequenceCounter
{
  return self->_sequenceCounter;
}

- (NSString)platformIdentifier
{
  return self->_platformIdentifier;
}

- (PKSecureElementCertificateSet)certificates
{
  return self->_certificates;
}

- (unint64_t)certificateVersion
{
  return self->_certificateVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_platformIdentifier, 0);
  objc_storeStrong((id *)&self->_sequenceCounter, 0);
}

@end
