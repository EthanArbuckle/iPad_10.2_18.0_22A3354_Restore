@implementation SIRINLUResponseStatus

- (id)initStatusCode:(int)a3 statusDescription:(id)a4
{
  id v7;
  SIRINLUResponseStatus *v8;
  SIRINLUResponseStatus *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUResponseStatus;
  v8 = -[SIRINLUResponseStatus init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_statusCode = a3;
    objc_storeStrong((id *)&v8->_statusDescription, a4);
  }

  return v9;
}

- (SIRINLUResponseStatus)initWithCoder:(id)a3
{
  id v4;
  SIRINLUResponseStatus *v5;
  uint64_t v6;
  NSString *statusDescription;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUResponseStatus;
  v5 = -[SIRINLUResponseStatus init](&v9, sel_init);
  if (v5)
  {
    v5->_statusCode = objc_msgSend(v4, "decodeIntForKey:", CFSTR("statusCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    statusDescription = v5->_statusDescription;
    v5->_statusDescription = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[SIRINLUResponseStatus statusCode](self, "statusCode"), CFSTR("statusCode"));
  -[SIRINLUResponseStatus statusDescription](self, "statusDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("statusDescription"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ResponseStatus\n  statusCode: %d\n  statusDescription: %@\n}"), self->_statusCode, self->_statusDescription);
}

- (int)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int)a3
{
  self->_statusCode = a3;
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusDescription:(id)a3
{
  objc_storeStrong((id *)&self->_statusDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDescription, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
