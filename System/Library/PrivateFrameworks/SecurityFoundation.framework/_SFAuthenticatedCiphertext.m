@implementation _SFAuthenticatedCiphertext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authenticatedCiphertextInternal, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFAuthenticatedCiphertext;
  v4 = a3;
  -[_SFCiphertext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", *((_QWORD *)self->_authenticatedCiphertextInternal + 1), CFSTR("SFAuthenticationCode"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", *((_QWORD *)self->_authenticatedCiphertextInternal + 2), CFSTR("SFInitializationVector"));

}

- (_SFAuthenticatedCiphertext)initWithCiphertext:(id)a3 authenticationCode:(id)a4 initializationVector:(id)a5
{
  id v9;
  id v10;
  id v11;
  _SFAuthenticatedCiphertext *v12;
  SFAuthenticatedCiphertext_Ivars *v13;
  id authenticatedCiphertextInternal;
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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authenticationCode"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ciphertext"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 271, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initializationVector"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)_SFAuthenticatedCiphertext;
  v12 = -[_SFCiphertext initWithCiphertext:](&v19, sel_initWithCiphertext_, v9);
  if (v12)
  {
    v13 = objc_alloc_init(SFAuthenticatedCiphertext_Ivars);
    authenticatedCiphertextInternal = v12->_authenticatedCiphertextInternal;
    v12->_authenticatedCiphertextInternal = v13;

    objc_storeStrong((id *)v12->_authenticatedCiphertextInternal + 1, a4);
    objc_storeStrong((id *)v12->_authenticatedCiphertextInternal + 2, a5);
  }

  return v12;
}

- (_SFAuthenticatedCiphertext)initWithCoder:(id)a3
{
  id v4;
  _SFAuthenticatedCiphertext *v5;
  SFAuthenticatedCiphertext_Ivars *v6;
  id authenticatedCiphertextInternal;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SFAuthenticatedCiphertext;
  v5 = -[_SFCiphertext initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(SFAuthenticatedCiphertext_Ivars);
    authenticatedCiphertextInternal = v5->_authenticatedCiphertextInternal;
    v5->_authenticatedCiphertextInternal = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFAuthenticationCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5->_authenticatedCiphertextInternal;
    v10 = (void *)v9[1];
    v9[1] = v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFInitializationVector"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v5->_authenticatedCiphertextInternal;
    v13 = (void *)v12[2];
    v12[2] = v11;

    v14 = v5->_authenticatedCiphertextInternal;
    if (!v14[1] || !v14[2])
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to deserialize object of type %@"), objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 8, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "failWithError:", v18);
    }
  }

  return v5;
}

- (NSData)authenticationCode
{
  return (NSData *)*((id *)self->_authenticatedCiphertextInternal + 1);
}

- (NSData)initializationVector
{
  return (NSData *)*((id *)self->_authenticatedCiphertextInternal + 2);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  _QWORD *authenticatedCiphertextInternal;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)_SFAuthenticatedCiphertext;
  -[_SFAuthenticatedCiphertext debugDescription](&v11, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  authenticatedCiphertextInternal = self->_authenticatedCiphertextInternal;
  v6 = authenticatedCiphertextInternal[1];
  v7 = authenticatedCiphertextInternal[2];
  -[_SFCiphertext ciphertext](self, "ciphertext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nAuth Code: %@\nIV: %@\ndata: %@"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _SFAuthenticatedCiphertext *v4;
  _SFAuthenticatedCiphertext *v5;
  _SFAuthenticatedCiphertext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (_SFAuthenticatedCiphertext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)_SFAuthenticatedCiphertext;
    if (-[_SFCiphertext isEqual:](&v13, sel_isEqual_, v6))
    {
      v7 = (void *)*((_QWORD *)self->_authenticatedCiphertextInternal + 1);
      -[_SFAuthenticatedCiphertext authenticationCode](v6, "authenticationCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        v9 = (void *)*((_QWORD *)self->_authenticatedCiphertextInternal + 2);
        -[_SFAuthenticatedCiphertext initializationVector](v6, "initializationVector");
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

@end
