@implementation SiriPresentationActivationCancelReasonTransport

- (SiriPresentationActivationCancelReasonTransport)initWithSiriPresentationActivationCancelReason:(unint64_t)a3
{
  SiriPresentationActivationCancelReasonTransport *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriPresentationActivationCancelReasonTransport;
  v4 = -[SiriPresentationActivationCancelReasonTransport init](&v7, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriPresentationActivationCancelReasonTransport setTransport:](v4, "setTransport:", v5);

  }
  return v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SiriPresentationActivationCancelReasonTransport transport](self, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SiriPresentationActivationCancelReason:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)cancelReason
{
  void *v2;
  unint64_t v3;

  -[SiriPresentationActivationCancelReasonTransport transport](self, "transport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSiriPresentationActivationCancelReason:", -[SiriPresentationActivationCancelReasonTransport cancelReason](self, "cancelReason"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriPresentationActivationCancelReasonTransport)initWithCoder:(id)a3
{
  id v4;
  SiriPresentationActivationCancelReasonTransport *v5;
  uint64_t v6;
  NSNumber *transport;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriPresentationActivationCancelReasonTransport;
  v5 = -[SiriPresentationActivationCancelReasonTransport init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transport"));
    v6 = objc_claimAutoreleasedReturnValue();
    transport = v5->_transport;
    v5->_transport = (NSNumber *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriPresentationActivationCancelReasonTransport transport](self, "transport");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("transport"));

}

- (NSNumber)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
}

@end
