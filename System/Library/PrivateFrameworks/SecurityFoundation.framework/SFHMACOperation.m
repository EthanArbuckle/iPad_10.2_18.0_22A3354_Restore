@implementation SFHMACOperation

- (SFHMACOperation)init
{
  void *v3;
  SFHMACOperation *v4;

  _defaultDigestOperation();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFHMACOperation initWithDigestOperation:](self, "initWithDigestOperation:", v3);

  return v4;
}

- (SFHMACOperation)initWithDigestOperation:(id)a3
{
  id v5;
  SFHMACOperation *v6;
  SFHMACOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFHMACOperation;
  v6 = -[SFMessageAuthenticationCodeOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)v6->_hmacOperationInternal + 1, a3);

  return v7;
}

- (SFHMACOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFHMACOperation;
  return -[SFMessageAuthenticationCodeOperation initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)(id)objc_msgSend(*((id *)self->_hmacOperationInternal + 1), "copyWithZone:", 0);
}

- (void)setDigestOperation:(id)a3
{
  uint64_t v4;
  _QWORD *hmacOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copyWithZone:", 0);
  hmacOperationInternal = self->_hmacOperationInternal;
  v6 = (void *)hmacOperationInternal[1];
  hmacOperationInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hmacOperationInternal, 0);
}

@end
