@implementation SFRSASigningOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRSASigningOperation)init
{
  _SFRSAKeySpecifier *v3;
  SFRSASigningOperation *v4;

  v3 = -[_SFRSAKeySpecifier initWithBitSize:]([_SFRSAKeySpecifier alloc], "initWithBitSize:", 2048);
  v4 = -[SFRSASigningOperation initWithKeySpecifier:](self, "initWithKeySpecifier:", v3);

  return v4;
}

- (SFRSASigningOperation)initWithKeySpecifier:(id)a3
{
  id v4;
  void *v5;
  SFRSASigningOperation *v6;

  v4 = a3;
  _defaultDigestOperation();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFRSASigningOperation initWithKeySpecifier:digestOperation:](self, "initWithKeySpecifier:digestOperation:", v4, v5);

  return v6;
}

- (SFRSASigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4
{
  id v7;
  id v8;
  SFRSASigningOperation *v9;
  SFRSASigningOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFRSASigningOperation;
  v9 = -[SFRSASigningOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9->_rsaSigningOperationInternal + 1, a3);
    objc_storeStrong((id *)v10->_rsaSigningOperationInternal + 2, a4);
  }

  return v10;
}

- (SFRSASigningOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFRSASigningOperation;
  return -[SFRSASigningOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKeySpecifier:digestOperation:", *((_QWORD *)self->_rsaSigningOperationInternal + 1), *((_QWORD *)self->_rsaSigningOperationInternal + 2));
}

- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (_SFRSAKeySpecifier)signingKeySpecifier
{
  return (_SFRSAKeySpecifier *)(id)objc_msgSend(*((id *)self->_rsaSigningOperationInternal + 1), "copy");
}

- (void)setSigningKeySpecifier:(id)a3
{
  uint64_t v4;
  _QWORD *rsaSigningOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  rsaSigningOperationInternal = self->_rsaSigningOperationInternal;
  v6 = (void *)rsaSigningOperationInternal[1];
  rsaSigningOperationInternal[1] = v4;

}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)(id)objc_msgSend(*((id *)self->_rsaSigningOperationInternal + 2), "copyWithZone:", 0);
}

- (void)setDigestOperation:(id)a3
{
  uint64_t v4;
  _QWORD *rsaSigningOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copyWithZone:", 0);
  rsaSigningOperationInternal = self->_rsaSigningOperationInternal;
  v6 = (void *)rsaSigningOperationInternal[2];
  rsaSigningOperationInternal[2] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rsaSigningOperationInternal, 0);
}

@end
