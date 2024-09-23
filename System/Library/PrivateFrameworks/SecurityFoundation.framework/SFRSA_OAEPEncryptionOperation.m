@implementation SFRSA_OAEPEncryptionOperation

- (SFRSA_OAEPEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v4;
  void *v5;
  SFRSA_OAEPEncryptionOperation *v6;

  v4 = a3;
  _defaultMaskGenerationFunction();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFRSA_OAEPEncryptionOperation initWithKeySpecifier:maskGenerationFunction:](self, "initWithKeySpecifier:maskGenerationFunction:", v4, v5);

  return v6;
}

- (SFRSA_OAEPEncryptionOperation)initWithKeySpecifier:(id)a3 maskGenerationFunction:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SFRSA_OAEPEncryptionOperation *v10;
  SFRSA_OAEPEncryptionOperation *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 893, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keySpecifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 894, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maskGenerationFunction"));

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)SFRSA_OAEPEncryptionOperation;
  v10 = -[SFRSAEncryptionOperation initWithKeySpecifier:](&v15, sel_initWithKeySpecifier_, v7);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)v10->_oaepEncryptionOperationInternal + 1, a4);

  return v11;
}

- (SFRSA_OAEPEncryptionOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFRSA_OAEPEncryptionOperation;
  return -[SFRSAEncryptionOperation initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (SFMaskGenerationFunction)maskGenerationFunction
{
  return (SFMaskGenerationFunction *)(id)objc_msgSend(*((id *)self->_oaepEncryptionOperationInternal + 1), "copyWithZone:", 0);
}

- (void)setMaskGenerationFunction:(id)a3
{
  uint64_t v4;
  _QWORD *oaepEncryptionOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copyWithZone:", 0);
  oaepEncryptionOperationInternal = self->_oaepEncryptionOperationInternal;
  v6 = (void *)oaepEncryptionOperationInternal[1];
  oaepEncryptionOperationInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_oaepEncryptionOperationInternal, 0);
}

@end
