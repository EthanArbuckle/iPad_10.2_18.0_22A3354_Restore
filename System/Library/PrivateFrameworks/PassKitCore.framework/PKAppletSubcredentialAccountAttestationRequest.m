@implementation PKAppletSubcredentialAccountAttestationRequest

- (PKAppletSubcredentialAccountAttestationRequest)initWithRequestData:(id)a3
{
  id v4;
  PKAppletSubcredentialAccountAttestationRequest *v5;
  uint64_t v6;
  NSData *subCASEResidencyAttestation;
  void *v8;
  void *v9;
  uint64_t v10;
  NSData *sharingTokenHash;
  PKSecureElementCertificateSet *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKSecureElementCertificateSet *v17;
  PKAppletSubcredentialAccountAttestationRequest *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[PKAppletSubcredentialAccountAttestationRequest init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "subCaAttestation");
      v6 = objc_claimAutoreleasedReturnValue();
      subCASEResidencyAttestation = v5->_subCASEResidencyAttestation;
      v5->_subCASEResidencyAttestation = (NSData *)v6;

      v20[0] = 0;
      v20[1] = 0;
      objc_msgSend(v4, "sharingSessionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getUUIDBytes:", v20);

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, 16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "SHA256Hash");
      v10 = objc_claimAutoreleasedReturnValue();
      sharingTokenHash = v5->_sharingTokenHash;
      v5->_sharingTokenHash = (NSData *)v10;

      v12 = [PKSecureElementCertificateSet alloc];
      objc_msgSend(v4, "rsaCertData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hexEncoding");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "casd");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hexEncoding");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PKSecureElementCertificateSet initWithRSACertificate:ECDSACertificate:](v12, "initWithRSACertificate:ECDSACertificate:", v14, v16);
      -[PKAccountAttestationRequest setCasdCertificate:](v5, "setCasdCertificate:", v17);

    }
    self = v5;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppletSubcredentialAccountAttestationRequest)initWithCoder:(id)a3
{
  id v4;
  PKAppletSubcredentialAccountAttestationRequest *v5;
  uint64_t v6;
  NSData *subCASEResidencyAttestation;
  uint64_t v8;
  NSData *sharingTokenHash;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAppletSubcredentialAccountAttestationRequest;
  v5 = -[PKAccountAttestationRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subCASEResidencyAttestation"));
    v6 = objc_claimAutoreleasedReturnValue();
    subCASEResidencyAttestation = v5->_subCASEResidencyAttestation;
    v5->_subCASEResidencyAttestation = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingTokenHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    sharingTokenHash = v5->_sharingTokenHash;
    v5->_sharingTokenHash = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAppletSubcredentialAccountAttestationRequest;
  v4 = a3;
  -[PKAccountAttestationRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_subCASEResidencyAttestation, CFSTR("subCASEResidencyAttestation"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingTokenHash, CFSTR("sharingTokenHash"));

}

- (NSData)subCASEResidencyAttestation
{
  return self->_subCASEResidencyAttestation;
}

- (void)setSubCASEResidencyAttestation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)sharingTokenHash
{
  return self->_sharingTokenHash;
}

- (void)setSharingTokenHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingTokenHash, 0);
  objc_storeStrong((id *)&self->_subCASEResidencyAttestation, 0);
}

@end
