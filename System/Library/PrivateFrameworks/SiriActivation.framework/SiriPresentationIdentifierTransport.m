@implementation SiriPresentationIdentifierTransport

- (SiriPresentationIdentifierTransport)initWithSiriPresentationIdentifier:(int64_t)a3
{
  SiriPresentationIdentifierTransport *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriPresentationIdentifierTransport;
  v4 = -[SiriPresentationIdentifierTransport init](&v7, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriPresentationIdentifierTransport setIdentifier:](v4, "setIdentifier:", v5);

  }
  return v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SiriPresentationIdentifierTransport identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SiriPresentationIdentifierTransport:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)siriPresentationIdentifier
{
  void *v2;
  int64_t v3;

  -[SiriPresentationIdentifierTransport identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longValue");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSiriPresentationIdentifier:", -[SiriPresentationIdentifierTransport siriPresentationIdentifier](self, "siriPresentationIdentifier"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriPresentationIdentifierTransport)initWithCoder:(id)a3
{
  id v4;
  SiriPresentationIdentifierTransport *v5;
  uint64_t v6;
  NSNumber *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriPresentationIdentifierTransport;
  v5 = -[SiriPresentationIdentifierTransport init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSNumber *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriPresentationIdentifierTransport identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
