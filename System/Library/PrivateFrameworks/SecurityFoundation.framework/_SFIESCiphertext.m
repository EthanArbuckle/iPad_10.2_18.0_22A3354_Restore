@implementation _SFIESCiphertext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFIESCiphertext)initWithCiphertext:(id)a3 ephemeralSenderPublicKey:(id)a4 authenticationCode:(id)a5
{
  id v9;
  id v10;
  id v11;
  _SFIESCiphertext *v12;
  SFIESCiphertext_Ivars *v13;
  id iesCiphertextInternal;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 365, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ephemeralSenderPublicKey"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ciphertext"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 366, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authenticationCode"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)_SFIESCiphertext;
  v12 = -[_SFCiphertext initWithCiphertext:](&v19, sel_initWithCiphertext_, v9);
  if (v12)
  {
    v13 = objc_alloc_init(SFIESCiphertext_Ivars);
    iesCiphertextInternal = v12->_iesCiphertextInternal;
    v12->_iesCiphertextInternal = v13;

    objc_storeStrong((id *)v12->_iesCiphertextInternal + 1, a4);
    objc_storeStrong((id *)v12->_iesCiphertextInternal + 2, a5);
  }

  return v12;
}

- (_SFIESCiphertext)initWithCoder:(id)a3
{
  id v4;
  _SFIESCiphertext *v5;
  SFIESCiphertext_Ivars *v6;
  id iesCiphertextInternal;
  const __CFData *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  SecKeyRef v12;
  SecKeyRef v13;
  _SFECPublicKey *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_SFIESCiphertext;
  v5 = -[_SFCiphertext initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(SFIESCiphertext_Ivars);
    iesCiphertextInternal = v5->_iesCiphertextInternal;
    v5->_iesCiphertextInternal = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFEphemeralSenderPublicKeyExternaRepresentation"));
    v8 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CD69F8];
    v29[0] = *MEMORY[0x1E0CD6A38];
    v29[1] = v9;
    v10 = *MEMORY[0x1E0CD6A10];
    v30[0] = *MEMORY[0x1E0CD6A40];
    v30[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = SecKeyCreateWithData(v8, v11, 0);
    if (v12)
    {
      v13 = v12;
      v14 = -[_SFPublicKey initWithSecKey:]([_SFECPublicKey alloc], "initWithSecKey:", v12);
      v15 = v5->_iesCiphertextInternal;
      v16 = (void *)v15[1];
      v15[1] = v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFIESAuthenticationCode"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v5->_iesCiphertextInternal;
      v19 = (void *)v18[2];
      v18[2] = v17;

      CFRelease(v13);
    }
    v20 = v5->_iesCiphertextInternal;
    if (!v20[1] || !v20[2])
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to deserialize object of type %@"), objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 8, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "failWithError:", v24);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CFDataRef v5;
  BOOL v6;
  CFErrorRef error;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SFIESCiphertext;
  -[_SFCiphertext encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  error = 0;
  v5 = SecKeyCopyExternalRepresentation((SecKeyRef)objc_msgSend(*((id *)self->_iesCiphertextInternal + 1), "_secKey"), &error);
  if (v5)
    v6 = error == 0;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SFEphemeralSenderPublicKeyExternaRepresentation"));
    objc_msgSend(v4, "encodeObject:forKey:", *((_QWORD *)self->_iesCiphertextInternal + 2), CFSTR("SFIESAuthenticationCode"));
  }

}

- (BOOL)isEqual:(id)a3
{
  _SFIESCiphertext *v4;
  _SFIESCiphertext *v5;
  _SFIESCiphertext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (_SFIESCiphertext *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)_SFIESCiphertext;
    if (-[_SFCiphertext isEqual:](&v13, sel_isEqual_, v6))
    {
      v7 = (void *)*((_QWORD *)self->_iesCiphertextInternal + 1);
      -[_SFIESCiphertext ephemeralSenderPublicKey](v6, "ephemeralSenderPublicKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        v9 = (void *)*((_QWORD *)self->_iesCiphertextInternal + 2);
        -[_SFIESCiphertext authenticationCode](v6, "authenticationCode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (_SFECPublicKey)ephemeralSenderPublicKey
{
  return (_SFECPublicKey *)*((id *)self->_iesCiphertextInternal + 1);
}

- (NSData)authenticationCode
{
  return (NSData *)*((id *)self->_iesCiphertextInternal + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_iesCiphertextInternal, 0);
}

@end
