@implementation SFPBKDF2Operation

+ (int64_t)keySource
{
  return 0;
}

+ (id)_randomSalt
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPBKDF2Operation)init
{
  void *v3;
  void *v4;
  SFPBKDF2Operation *v5;

  _defaultPseudoRandomFunction();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_randomSalt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SFPBKDF2Operation initWithPseudoRandomFunction:iterationCount:salt:](self, "initWithPseudoRandomFunction:iterationCount:salt:", v3, 20, v4);

  return v5;
}

- (SFPBKDF2Operation)initWithPseudoRandomFunction:(id)a3 iterationCount:(int64_t)a4 salt:(id)a5
{
  id v9;
  id v10;
  SFPBKDF2Operation *v11;
  SFPBKDF2Operation *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SFPBKDF2Operation;
  v11 = -[SFPBKDF2Operation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)v11->_pbkdf2OperationInternal + 2, a3);
    *((_QWORD *)v12->_pbkdf2OperationInternal + 1) = a4;
    objc_storeStrong((id *)v12->_pbkdf2OperationInternal + 3, a5);
  }

  return v12;
}

- (SFPBKDF2Operation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFPBKDF2Operation;
  return -[SFPBKDF2Operation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPseudoRandomFunction:iterationCount:salt:", *((_QWORD *)self->_pbkdf2OperationInternal + 2), *((_QWORD *)self->_pbkdf2OperationInternal + 1), *((_QWORD *)self->_pbkdf2OperationInternal + 3));
}

- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5
{
  return 0;
}

- (int64_t)iterationCount
{
  return *((_QWORD *)self->_pbkdf2OperationInternal + 1);
}

- (void)setIterationCount:(int64_t)a3
{
  *((_QWORD *)self->_pbkdf2OperationInternal + 1) = a3;
}

- (SFPseudoRandomFunction)pseudoRandomFunction
{
  return (SFPseudoRandomFunction *)(id)objc_msgSend(*((id *)self->_pbkdf2OperationInternal + 2), "copyWithZone:", 0);
}

- (void)setPseudoRandomFunction:(id)a3
{
  uint64_t v4;
  _QWORD *pbkdf2OperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copyWithZone:", 0);
  pbkdf2OperationInternal = self->_pbkdf2OperationInternal;
  v6 = (void *)pbkdf2OperationInternal[2];
  pbkdf2OperationInternal[2] = v4;

}

- (NSData)salt
{
  return (NSData *)(id)objc_msgSend(*((id *)self->_pbkdf2OperationInternal + 3), "copy");
}

- (void)setSalt:(id)a3
{
  uint64_t v4;
  _QWORD *pbkdf2OperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  pbkdf2OperationInternal = self->_pbkdf2OperationInternal;
  v6 = (void *)pbkdf2OperationInternal[3];
  pbkdf2OperationInternal[3] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pbkdf2OperationInternal, 0);
}

@end
