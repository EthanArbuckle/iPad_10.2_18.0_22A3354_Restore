@implementation SFSymmetricEncryptionOperation

+ (int64_t)_defaultEncryptionMode
{
  return 0;
}

+ (id)_defaultEncryptionOperation
{
  return objc_alloc_init((Class)a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSymmetricEncryptionOperation)init
{
  _SFAESKeySpecifier *v3;
  SFSymmetricEncryptionOperation *v4;

  v3 = -[_SFAESKeySpecifier initWithBitSize:]([_SFAESKeySpecifier alloc], "initWithBitSize:", 0);
  v4 = -[SFSymmetricEncryptionOperation initWithKeySpecifier:](self, "initWithKeySpecifier:", v3);

  return v4;
}

- (SFSymmetricEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v4;
  SFSymmetricEncryptionOperation *v5;

  v4 = a3;
  v5 = -[SFSymmetricEncryptionOperation initWithKeySpecifier:mode:](self, "initWithKeySpecifier:mode:", v4, objc_msgSend((id)objc_opt_class(), "_defaultEncryptionMode"));

  return v5;
}

- (SFSymmetricEncryptionOperation)initWithKeySpecifier:(id)a3 mode:(int64_t)a4
{
  id v8;
  SFSymmetricEncryptionOperation *v9;
  SFSymmetricEncryptionOperation *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 469, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keySpecifier"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SFSymmetricEncryptionOperation;
  v9 = -[SFSymmetricEncryptionOperation init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9->_symmetricEncryptionOperationInternal + 2, a3);
    *((_QWORD *)v10->_symmetricEncryptionOperationInternal + 1) = a4;
  }

  return v10;
}

- (SFSymmetricEncryptionOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSymmetricEncryptionOperation;
  return -[SFSymmetricEncryptionOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithKeySpecifier:mode:", *((_QWORD *)self->_symmetricEncryptionOperationInternal + 2), *((_QWORD *)self->_symmetricEncryptionOperationInternal + 1));
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)encrypt:(id)a3 withKey:(id)a4 ivGenerator:(id)a5 error:(id *)a6
{
  return 0;
}

- (int64_t)mode
{
  return *((_QWORD *)self->_symmetricEncryptionOperationInternal + 1);
}

- (void)setMode:(int64_t)a3
{
  *((_QWORD *)self->_symmetricEncryptionOperationInternal + 1) = a3;
}

- (_SFSymmetricKeySpecifier)encryptionKeySpecifier
{
  return (_SFSymmetricKeySpecifier *)(id)objc_msgSend(*((id *)self->_symmetricEncryptionOperationInternal+ 2), "copy");
}

- (void)setEncryptionKeySpecifier:(id)a3
{
  uint64_t v4;
  _QWORD *symmetricEncryptionOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  symmetricEncryptionOperationInternal = self->_symmetricEncryptionOperationInternal;
  v6 = (void *)symmetricEncryptionOperationInternal[2];
  symmetricEncryptionOperationInternal[2] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_symmetricEncryptionOperationInternal, 0);
}

@end
