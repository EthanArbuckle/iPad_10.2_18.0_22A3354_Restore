@implementation SFRSAEncryptionOperation

+ (id)_defaultEncryptionOperation
{
  SFRSA_PKCS1EncryptionOperation *v2;
  _SFRSAKeySpecifier *v3;
  SFRSA_PKCS1EncryptionOperation *v4;

  v2 = [SFRSA_PKCS1EncryptionOperation alloc];
  v3 = -[_SFRSAKeySpecifier initWithBitSize:]([_SFRSAKeySpecifier alloc], "initWithBitSize:", 4096);
  v4 = -[SFRSAEncryptionOperation initWithKeySpecifier:](v2, "initWithKeySpecifier:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRSAEncryptionOperation)init
{
  _SFRSAKeySpecifier *v3;
  SFRSAEncryptionOperation *v4;

  v3 = -[_SFRSAKeySpecifier initWithBitSize:]([_SFRSAKeySpecifier alloc], "initWithBitSize:", 4096);
  v4 = -[SFRSAEncryptionOperation initWithKeySpecifier:](self, "initWithKeySpecifier:", v3);

  return v4;
}

- (SFRSAEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v6;
  SFRSAEncryptionOperation *v7;
  SFRSAEncryptionOperation *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 831, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keySpecifier"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SFRSAEncryptionOperation;
  v7 = -[SFRSAEncryptionOperation init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)v7->_rsaEncryptionOperationInternal + 1, a3);

  return v8;
}

- (SFRSAEncryptionOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFRSAEncryptionOperation;
  return -[SFRSAEncryptionOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithKeySpecifier:", *((_QWORD *)self->_rsaEncryptionOperationInternal + 1));
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (_SFRSAKeySpecifier)encryptionKeySpecifier
{
  return (_SFRSAKeySpecifier *)(id)objc_msgSend(*((id *)self->_rsaEncryptionOperationInternal + 1), "copy");
}

- (void)setEncryptionKeySpecifier:(id)a3
{
  uint64_t v4;
  _QWORD *rsaEncryptionOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  rsaEncryptionOperationInternal = self->_rsaEncryptionOperationInternal;
  v6 = (void *)rsaEncryptionOperationInternal[1];
  rsaEncryptionOperationInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rsaEncryptionOperationInternal, 0);
}

@end
