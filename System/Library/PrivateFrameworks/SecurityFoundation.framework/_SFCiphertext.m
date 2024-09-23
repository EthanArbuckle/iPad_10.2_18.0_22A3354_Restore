@implementation _SFCiphertext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ciphertextInternal, 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)self->_ciphertextInternal + 1), CFSTR("SFCiphertext"));
}

- (_SFCiphertext)initWithCiphertext:(id)a3
{
  id v6;
  _SFCiphertext *v7;
  SFCiphertext_Ivars *v8;
  id ciphertextInternal;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ciphertext"));

  }
  v12.receiver = self;
  v12.super_class = (Class)_SFCiphertext;
  v7 = -[_SFCiphertext init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(SFCiphertext_Ivars);
    ciphertextInternal = v7->_ciphertextInternal;
    v7->_ciphertextInternal = v8;

    objc_storeStrong((id *)v7->_ciphertextInternal + 1, a3);
  }

  return v7;
}

- (_SFCiphertext)initWithCoder:(id)a3
{
  id v4;
  _SFCiphertext *v5;
  SFCiphertext_Ivars *v6;
  id ciphertextInternal;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFCiphertext;
  v5 = -[_SFCiphertext init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(SFCiphertext_Ivars);
    ciphertextInternal = v5->_ciphertextInternal;
    v5->_ciphertextInternal = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFCiphertext"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5->_ciphertextInternal;
    v10 = (void *)v9[1];
    v9[1] = v8;

    if (!*((_QWORD *)v5->_ciphertextInternal + 1))
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to deserialize object of type %@"), objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 8, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "failWithError:", v14);
    }
  }

  return v5;
}

- (NSData)ciphertext
{
  return (NSData *)*((id *)self->_ciphertextInternal + 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = objc_msgSend(*((id *)self->_ciphertextInternal + 1), "copy");
  v6 = v4[1];
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _SFCiphertext *v4;
  _SFCiphertext *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (_SFCiphertext *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = (void *)*((_QWORD *)self->_ciphertextInternal + 1);
    -[_SFCiphertext ciphertext](v5, "ciphertext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
