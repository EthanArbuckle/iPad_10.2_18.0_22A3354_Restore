@implementation SEEndPointBindingAttestationRequestItems

+ (id)withSubCAAttestation:(id)a3 casdECDSACertificate:(id)a4 casdRSACertificate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setSubCAAttestation:", v9);

  objc_msgSend(v10, "setCasdECDSACertificate:", v8);
  objc_msgSend(v10, "setCasdRSACertificate:", v7);

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SEEndPointBindingAttestationRequestItems subCAAttestation](self, "subCAAttestation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asHexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointBindingAttestationRequestItems casdECDSACertificate](self, "casdECDSACertificate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asHexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointBindingAttestationRequestItems casdRSACertificate](self, "casdRSACertificate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\n\tsubCAAttestation : %@,\n\tcasdECDACertificate : %@\n,\n\tcasdRSACertificate : %@\n}"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SEEndPointBindingAttestationRequestItems subCAAttestation](self, "subCAAttestation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("subCAAttestation"));

  -[SEEndPointBindingAttestationRequestItems casdECDSACertificate](self, "casdECDSACertificate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("casdECDSACertificate"));

  -[SEEndPointBindingAttestationRequestItems casdRSACertificate](self, "casdRSACertificate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("casdRSACertificate"));

}

- (SEEndPointBindingAttestationRequestItems)initWithCoder:(id)a3
{
  id v4;
  SEEndPointBindingAttestationRequestItems *v5;
  SEEndPointBindingAttestationRequestItems *v6;
  void *v7;
  uint64_t v8;
  NSData *subCAAttestation;
  void *v10;
  uint64_t v11;
  NSData *casdECDSACertificate;
  void *v13;
  uint64_t v14;
  NSData *casdRSACertificate;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SEEndPointBindingAttestationRequestItems;
  v5 = -[SEEndPointBindingAttestationRequestItems init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SEEndPointBindingAttestationRequestItems subCAAttestation](v5, "subCAAttestation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subCAAttestation"));
    v8 = objc_claimAutoreleasedReturnValue();
    subCAAttestation = v6->_subCAAttestation;
    v6->_subCAAttestation = (NSData *)v8;

    -[SEEndPointBindingAttestationRequestItems casdECDSACertificate](v6, "casdECDSACertificate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("casdECDSACertificate"));
    v11 = objc_claimAutoreleasedReturnValue();
    casdECDSACertificate = v6->_casdECDSACertificate;
    v6->_casdECDSACertificate = (NSData *)v11;

    -[SEEndPointBindingAttestationRequestItems casdRSACertificate](v6, "casdRSACertificate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("casdRSACertificate"));
    v14 = objc_claimAutoreleasedReturnValue();
    casdRSACertificate = v6->_casdRSACertificate;
    v6->_casdRSACertificate = (NSData *)v14;

  }
  return v6;
}

- (NSData)subCAAttestation
{
  return self->_subCAAttestation;
}

- (void)setSubCAAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_subCAAttestation, a3);
}

- (NSData)casdECDSACertificate
{
  return self->_casdECDSACertificate;
}

- (void)setCasdECDSACertificate:(id)a3
{
  objc_storeStrong((id *)&self->_casdECDSACertificate, a3);
}

- (NSData)casdRSACertificate
{
  return self->_casdRSACertificate;
}

- (void)setCasdRSACertificate:(id)a3
{
  objc_storeStrong((id *)&self->_casdRSACertificate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_casdRSACertificate, 0);
  objc_storeStrong((id *)&self->_casdECDSACertificate, 0);
  objc_storeStrong((id *)&self->_subCAAttestation, 0);
}

@end
