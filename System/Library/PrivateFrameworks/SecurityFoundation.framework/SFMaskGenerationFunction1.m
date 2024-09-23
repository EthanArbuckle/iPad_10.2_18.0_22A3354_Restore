@implementation SFMaskGenerationFunction1

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMaskGenerationFunction1)init
{
  _SFSHA256DigestOperation *v3;
  SFMaskGenerationFunction1 *v4;

  v3 = objc_alloc_init(_SFSHA256DigestOperation);
  v4 = -[SFMaskGenerationFunction1 initWithDigestOperation:](self, "initWithDigestOperation:", v3);

  return v4;
}

- (SFMaskGenerationFunction1)initWithDigestOperation:(id)a3
{
  id v5;
  SFMaskGenerationFunction1 *v6;
  SFMaskGenerationFunction1 *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFMaskGenerationFunction1;
  v6 = -[SFMaskGenerationFunction1 init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)v6->_mgf1OperationInternal + 1, a3);

  return v7;
}

- (SFMaskGenerationFunction1)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFMaskGenerationFunction1;
  return -[SFMaskGenerationFunction1 init](&v4, sel_init, a3);
}

- (id)generateMaskWithLength:(int64_t)a3 data:(id)a4 error:(id)a5
{
  return 0;
}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)(id)objc_msgSend(*((id *)self->_mgf1OperationInternal + 1), "copyWithZone:", 0);
}

- (void)setDigestOperation:(id)a3
{
  uint64_t v4;
  _QWORD *mgf1OperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copyWithZone:", 0);
  mgf1OperationInternal = self->_mgf1OperationInternal;
  v6 = (void *)mgf1OperationInternal[1];
  mgf1OperationInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mgf1OperationInternal, 0);
}

@end
