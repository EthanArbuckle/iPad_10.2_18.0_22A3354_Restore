@implementation SFCMACOperation

- (SFCMACOperation)init
{
  void *v3;
  SFCMACOperation *v4;

  +[SFSymmetricEncryptionOperation _defaultEncryptionOperation](SFSymmetricEncryptionOperation, "_defaultEncryptionOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFCMACOperation initWithEncryptionOperation:](self, "initWithEncryptionOperation:", v3);

  return v4;
}

- (SFCMACOperation)initWithEncryptionOperation:(id)a3
{
  id v5;
  SFCMACOperation *v6;
  SFCMACOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCMACOperation;
  v6 = -[SFMessageAuthenticationCodeOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)v6->_cmacOperationInternal + 1, a3);

  return v7;
}

- (SFCMACOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFCMACOperation;
  return -[SFMessageAuthenticationCodeOperation initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (SFSymmetricEncryptionOperation)encryptionOperation
{
  return (SFSymmetricEncryptionOperation *)(id)objc_msgSend(*((id *)self->_cmacOperationInternal + 1), "copy");
}

- (void)setEncryptionOperation:(id)a3
{
  uint64_t v4;
  _QWORD *cmacOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  cmacOperationInternal = self->_cmacOperationInternal;
  v6 = (void *)cmacOperationInternal[1];
  cmacOperationInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cmacOperationInternal, 0);
}

@end
