@implementation PKAuxiliaryCapabilityRequirementKeyMaterialContent

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("publicKey: '%@'; "), self->_publicKey);
  objc_msgSend(v6, "appendFormat:", CFSTR("publicKeyIdentifier: '%@'; "), self->_publicKeyIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("attestation: '%@'; "), self->_attestation);
  objc_msgSend(v6, "appendFormat:", CFSTR("secondaryAttestation: '%@'; "), self->_secondaryAttestation);
  objc_msgSend(v6, "appendFormat:", CFSTR("authorization: '%@'; "), self->_authorization);
  objc_msgSend(v6, "appendFormat:", CFSTR("signature: '%@'; "), self->_signature);
  objc_msgSend(v6, "appendFormat:", CFSTR("certificateChain: '%@'; "), self->_certificateChain);
  objc_msgSend(v6, "appendFormat:", CFSTR("keyReferenceIdentifier: '%@; "), self->_keyReferenceIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("applicationIdentifier: '%@; "), self->_applicationIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("securityAccessControl: '%@'; "), self->_securityAccessControl);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_publicKey)
    objc_msgSend(v3, "addObject:");
  if (self->_publicKeyIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_attestation)
    objc_msgSend(v4, "addObject:");
  if (self->_secondaryAttestation)
    objc_msgSend(v4, "addObject:");
  if (self->_authorization)
    objc_msgSend(v4, "addObject:");
  if (self->_signature)
    objc_msgSend(v4, "addObject:");
  if (self->_certificateChain)
    objc_msgSend(v4, "addObject:");
  if (self->_keyReferenceIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_applicationIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_securityAccessControl)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKAuxiliaryCapabilityRequirementKeyMaterialContent *v4;
  PKAuxiliaryCapabilityRequirementKeyMaterialContent *v5;
  BOOL v6;

  v4 = (PKAuxiliaryCapabilityRequirementKeyMaterialContent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAuxiliaryCapabilityRequirementKeyMaterialContent isEqualToAuxiliaryCapabilityRequirementKey:](self, "isEqualToAuxiliaryCapabilityRequirementKey:", v5);

  return v6;
}

- (BOOL)isEqualToAuxiliaryCapabilityRequirementKey:(id)a3
{
  _QWORD *v4;
  NSData *publicKey;
  NSData *v6;
  BOOL v7;
  NSString *publicKeyIdentifier;
  NSString *v9;
  NSArray *attestation;
  NSArray *v11;
  NSArray *secondaryAttestation;
  NSArray *v13;
  NSData *authorization;
  NSData *v15;
  NSData *signature;
  NSData *v17;
  NSArray *certificateChain;
  NSArray *v19;
  NSString *keyReferenceIdentifier;
  NSString *v21;
  NSData *applicationIdentifier;
  NSData *v23;
  NSData *securityAccessControl;
  NSData *v25;
  char v26;

  v4 = a3;
  if (!v4)
    goto LABEL_52;
  publicKey = self->_publicKey;
  v6 = (NSData *)v4[1];
  if (publicKey)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (publicKey != v6)
      goto LABEL_52;
  }
  else if ((-[NSData isEqual:](publicKey, "isEqual:") & 1) == 0)
  {
    goto LABEL_52;
  }
  publicKeyIdentifier = self->_publicKeyIdentifier;
  v9 = (NSString *)v4[2];
  if (publicKeyIdentifier && v9)
  {
    if ((-[NSString isEqual:](publicKeyIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (publicKeyIdentifier != v9)
  {
    goto LABEL_52;
  }
  attestation = self->_attestation;
  v11 = (NSArray *)v4[3];
  if (attestation && v11)
  {
    if ((-[NSArray isEqual:](attestation, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (attestation != v11)
  {
    goto LABEL_52;
  }
  secondaryAttestation = self->_secondaryAttestation;
  v13 = (NSArray *)v4[4];
  if (secondaryAttestation && v13)
  {
    if ((-[NSArray isEqual:](secondaryAttestation, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (secondaryAttestation != v13)
  {
    goto LABEL_52;
  }
  authorization = self->_authorization;
  v15 = (NSData *)v4[5];
  if (authorization && v15)
  {
    if ((-[NSData isEqual:](authorization, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (authorization != v15)
  {
    goto LABEL_52;
  }
  signature = self->_signature;
  v17 = (NSData *)v4[6];
  if (signature && v17)
  {
    if ((-[NSData isEqual:](signature, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (signature != v17)
  {
    goto LABEL_52;
  }
  certificateChain = self->_certificateChain;
  v19 = (NSArray *)v4[7];
  if (certificateChain && v19)
  {
    if ((-[NSArray isEqual:](certificateChain, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (certificateChain != v19)
  {
    goto LABEL_52;
  }
  keyReferenceIdentifier = self->_keyReferenceIdentifier;
  v21 = (NSString *)v4[8];
  if (keyReferenceIdentifier && v21)
  {
    if ((-[NSString isEqual:](keyReferenceIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (keyReferenceIdentifier != v21)
  {
    goto LABEL_52;
  }
  applicationIdentifier = self->_applicationIdentifier;
  v23 = (NSData *)v4[9];
  if (!applicationIdentifier || !v23)
  {
    if (applicationIdentifier == v23)
      goto LABEL_48;
LABEL_52:
    v26 = 0;
    goto LABEL_53;
  }
  if ((-[NSData isEqual:](applicationIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_52;
LABEL_48:
  securityAccessControl = self->_securityAccessControl;
  v25 = (NSData *)v4[10];
  if (securityAccessControl && v25)
    v26 = -[NSData isEqual:](securityAccessControl, "isEqual:");
  else
    v26 = securityAccessControl == v25;
LABEL_53:

  return v26;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSData base64EncodedStringWithOptions:](self->_publicKey, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("publicKey"));

  v5 = (void *)-[NSString copy](self->_publicKeyIdentifier, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("publicKeyIdentifier"));

  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_attestation, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_198);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("attestation"));

  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_secondaryAttestation, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_56_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("secondaryAttestation"));

  -[NSData base64EncodedStringWithOptions:](self->_authorization, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("authorization"));

  -[NSData base64EncodedStringWithOptions:](self->_signature, "base64EncodedStringWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("signature"));

  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_certificateChain, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_57_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("certificateChain"));

  v11 = (void *)-[NSString copy](self->_keyReferenceIdentifier, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("keyReferenceIdentifier"));

  -[NSData hexEncoding](self->_applicationIdentifier, "hexEncoding");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uppercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("applicationIdentifier"));

  -[NSData base64EncodedStringWithOptions:](self->_securityAccessControl, "base64EncodedStringWithOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("securityAccessControl"));

  v15 = (void *)objc_msgSend(v3, "copy");
  return v15;
}

uint64_t __78__PKAuxiliaryCapabilityRequirementKeyMaterialContent_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
}

uint64_t __78__PKAuxiliaryCapabilityRequirementKeyMaterialContent_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
}

uint64_t __78__PKAuxiliaryCapabilityRequirementKeyMaterialContent_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *publicKey;
  id v5;

  publicKey = self->_publicKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", publicKey, CFSTR("publicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publicKeyIdentifier, CFSTR("publicKeyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attestation, CFSTR("attestation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryAttestation, CFSTR("secondaryAttestation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorization, CFSTR("authorization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificateChain, CFSTR("certificateChain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyReferenceIdentifier, CFSTR("keyReferenceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_securityAccessControl, CFSTR("securityAccessControl"));

}

- (PKAuxiliaryCapabilityRequirementKeyMaterialContent)initWithCoder:(id)a3
{
  id v4;
  PKAuxiliaryCapabilityRequirementKeyMaterialContent *v5;
  uint64_t v6;
  NSData *publicKey;
  uint64_t v8;
  NSString *publicKeyIdentifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *attestation;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *secondaryAttestation;
  uint64_t v20;
  NSData *authorization;
  uint64_t v22;
  NSData *signature;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *certificateChain;
  uint64_t v29;
  NSString *keyReferenceIdentifier;
  uint64_t v31;
  NSData *applicationIdentifier;
  uint64_t v33;
  NSData *securityAccessControl;
  objc_super v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKAuxiliaryCapabilityRequirementKeyMaterialContent;
  v5 = -[PKAuxiliaryCapabilityRequirementKeyMaterialContent init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    publicKeyIdentifier = v5->_publicKeyIdentifier;
    v5->_publicKeyIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("attestation"));
    v13 = objc_claimAutoreleasedReturnValue();
    attestation = v5->_attestation;
    v5->_attestation = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("secondaryAttestation"));
    v18 = objc_claimAutoreleasedReturnValue();
    secondaryAttestation = v5->_secondaryAttestation;
    v5->_secondaryAttestation = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorization"));
    v20 = objc_claimAutoreleasedReturnValue();
    authorization = v5->_authorization;
    v5->_authorization = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v22 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("certificateChain"));
    v27 = objc_claimAutoreleasedReturnValue();
    certificateChain = v5->_certificateChain;
    v5->_certificateChain = (NSArray *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyReferenceIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    keyReferenceIdentifier = v5->_keyReferenceIdentifier;
    v5->_keyReferenceIdentifier = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSData *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityAccessControl"));
    v33 = objc_claimAutoreleasedReturnValue();
    securityAccessControl = v5->_securityAccessControl;
    v5->_securityAccessControl = (NSData *)v33;

  }
  return v5;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (NSString)publicKeyIdentifier
{
  return self->_publicKeyIdentifier;
}

- (void)setPublicKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_publicKeyIdentifier, a3);
}

- (NSArray)attestation
{
  return self->_attestation;
}

- (void)setAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_attestation, a3);
}

- (NSArray)secondaryAttestation
{
  return self->_secondaryAttestation;
}

- (void)setSecondaryAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryAttestation, a3);
}

- (NSData)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_authorization, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (void)setCertificateChain:(id)a3
{
  objc_storeStrong((id *)&self->_certificateChain, a3);
}

- (NSString)keyReferenceIdentifier
{
  return self->_keyReferenceIdentifier;
}

- (void)setKeyReferenceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyReferenceIdentifier, a3);
}

- (NSData)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (NSData)securityAccessControl
{
  return self->_securityAccessControl;
}

- (void)setSecurityAccessControl:(id)a3
{
  objc_storeStrong((id *)&self->_securityAccessControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityAccessControl, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_keyReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_certificateChain, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_secondaryAttestation, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end
