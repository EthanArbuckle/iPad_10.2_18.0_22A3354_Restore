@implementation SFX963KeyDerivationOperation

+ (int64_t)keySource
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFX963KeyDerivationOperation)init
{
  void *v3;
  SFX963KeyDerivationOperation *v4;

  +[_SFECDHOperation _defaultOperation](_SFECDHOperation, "_defaultOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFX963KeyDerivationOperation initWithSharedSecretOperation:](self, "initWithSharedSecretOperation:", v3);

  return v4;
}

- (SFX963KeyDerivationOperation)initWithSharedSecretOperation:(id)a3
{
  id v4;
  void *v5;
  SFX963KeyDerivationOperation *v6;

  v4 = a3;
  _defaultDigestOperation();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFX963KeyDerivationOperation initWithSharedSecretOperation:digestOperation:](self, "initWithSharedSecretOperation:digestOperation:", v4, v5);

  return v6;
}

- (SFX963KeyDerivationOperation)initWithSharedSecretOperation:(id)a3 digestOperation:(id)a4
{
  id v7;
  id v8;
  SFX963KeyDerivationOperation *v9;
  SFX963KeyDerivationOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFX963KeyDerivationOperation;
  v9 = -[SFX963KeyDerivationOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9->_x963KeyDerivationOperationInternal + 1, a3);
    objc_storeStrong((id *)v10->_x963KeyDerivationOperationInternal + 2, a4);
  }

  return v10;
}

- (SFX963KeyDerivationOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFX963KeyDerivationOperation;
  return -[SFX963KeyDerivationOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SFX963KeyDerivationOperation *v3;

  v3 = self;
  return -[SFX963KeyDerivationOperation initWithSharedSecretOperation:digestOperation:](v3, "initWithSharedSecretOperation:digestOperation:", *((_QWORD *)v3->_x963KeyDerivationOperationInternal + 1), *((_QWORD *)v3->_x963KeyDerivationOperationInternal + 2));
}

- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5
{
  return 0;
}

- (SFKeyDerivingOperation)sharedSecretOperation
{
  return (SFKeyDerivingOperation *)(id)objc_msgSend(*((id *)self->_x963KeyDerivationOperationInternal+ 1), "copyWithZone:", 0);
}

- (void)setSharedSecretOperation:(id)a3
{
  uint64_t v4;
  _QWORD *x963KeyDerivationOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copyWithZone:", 0);
  x963KeyDerivationOperationInternal = self->_x963KeyDerivationOperationInternal;
  v6 = (void *)x963KeyDerivationOperationInternal[1];
  x963KeyDerivationOperationInternal[1] = v4;

}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)(id)objc_msgSend(*((id *)self->_x963KeyDerivationOperationInternal + 2), "copyWithZone:", 0);
}

- (void)setDigestOperation:(id)a3
{
  uint64_t v4;
  _QWORD *x963KeyDerivationOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copyWithZone:", 0);
  x963KeyDerivationOperationInternal = self->_x963KeyDerivationOperationInternal;
  v6 = (void *)x963KeyDerivationOperationInternal[2];
  x963KeyDerivationOperationInternal[2] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_x963KeyDerivationOperationInternal, 0);
}

@end
