@implementation SFRSA_PSSSigningOperation

- (SFRSA_PSSSigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SFRSA_PSSSigningOperation *v9;

  v6 = a4;
  v7 = a3;
  _defaultMaskGenerationFunction();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SFRSA_PSSSigningOperation initWithKeySpecifier:digestOperation:maskGenerationFunction:](self, "initWithKeySpecifier:digestOperation:maskGenerationFunction:", v7, v6, v8);

  return v9;
}

- (SFRSA_PSSSigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4 maskGenerationFunction:(id)a5
{
  id v9;
  SFRSA_PSSSigningOperation *v10;
  SFRSA_PSSSigningOperation *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SFRSA_PSSSigningOperation;
  v10 = -[SFRSASigningOperation initWithKeySpecifier:digestOperation:](&v13, sel_initWithKeySpecifier_digestOperation_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)v10->_pssSigningOperationInternal + 1, a5);

  return v11;
}

- (SFRSA_PSSSigningOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFRSA_PSSSigningOperation;
  return -[SFRSASigningOperation initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (SFMaskGenerationFunction)maskGenerationFunction
{
  return (SFMaskGenerationFunction *)(id)objc_msgSend(*((id *)self->_pssSigningOperationInternal + 1), "copyWithZone:", 0);
}

- (void)setMaskGenerationFunction:(id)a3
{
  uint64_t v4;
  _QWORD *pssSigningOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copyWithZone:", 0);
  pssSigningOperationInternal = self->_pssSigningOperationInternal;
  v6 = (void *)pssSigningOperationInternal[1];
  pssSigningOperationInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pssSigningOperationInternal, 0);
}

@end
