@implementation SFHMACPseudoRandomFunction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFHMACPseudoRandomFunction)init
{
  _SFSHA256DigestOperation *v3;
  SFHMACPseudoRandomFunction *v4;

  v3 = objc_alloc_init(_SFSHA256DigestOperation);
  v4 = -[SFHMACPseudoRandomFunction initWithDigestOperation:](self, "initWithDigestOperation:", v3);

  return v4;
}

- (SFHMACPseudoRandomFunction)initWithDigestOperation:(id)a3
{
  id v5;
  SFHMACPseudoRandomFunction *v6;
  SFHMACPseudoRandomFunction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFHMACPseudoRandomFunction;
  v6 = -[SFHMACPseudoRandomFunction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)v6->_hmacPseudoRandomFunctionInternal + 1, a3);

  return v7;
}

- (SFHMACPseudoRandomFunction)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFHMACPseudoRandomFunction;
  return -[SFHMACPseudoRandomFunction init](&v4, sel_init, a3);
}

- (id)generateBytesWithLength:(int64_t)a3 key:(id)a4 error:(id)a5
{
  return 0;
}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)(id)objc_msgSend(*((id *)self->_hmacPseudoRandomFunctionInternal + 1), "copyWithZone:", 0);
}

- (void)setDigestOperation:(id)a3
{
  uint64_t v4;
  _QWORD *hmacPseudoRandomFunctionInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copyWithZone:", 0);
  hmacPseudoRandomFunctionInternal = self->_hmacPseudoRandomFunctionInternal;
  v6 = (void *)hmacPseudoRandomFunctionInternal[1];
  hmacPseudoRandomFunctionInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hmacPseudoRandomFunctionInternal, 0);
}

@end
