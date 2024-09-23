@implementation SASTimeIntervalTransport

- (SASTimeIntervalTransport)initWithTimeInterval:(double)a3
{
  SASTimeIntervalTransport *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SASTimeIntervalTransport;
  v4 = -[SASTimeIntervalTransport init](&v7, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASTimeIntervalTransport setTransport:](v4, "setTransport:", v5);

  }
  return v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SASTimeIntervalTransport transport](self, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SASTimeIntervalTransport:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)timeInterval
{
  void *v2;
  double v3;
  double v4;

  -[SASTimeIntervalTransport transport](self, "transport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SASTimeIntervalTransport timeInterval](self, "timeInterval");
  return (id)objc_msgSend(v4, "initWithTimeInterval:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASTimeIntervalTransport)initWithCoder:(id)a3
{
  id v4;
  SASTimeIntervalTransport *v5;
  uint64_t v6;
  NSNumber *transport;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASTimeIntervalTransport;
  v5 = -[SASTimeIntervalTransport init](&v9, sel_init);
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
  -[SASTimeIntervalTransport transport](self, "transport");
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
