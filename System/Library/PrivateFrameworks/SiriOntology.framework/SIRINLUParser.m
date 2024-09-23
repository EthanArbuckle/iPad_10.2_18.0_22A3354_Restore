@implementation SIRINLUParser

- (SIRINLUParser)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SIRINLUParser;
  return -[SIRINLUParser init](&v3, sel_init);
}

- (SIRINLUParser)initWithAlgorithmType:(int)a3 parserIdentifier:(int)a4
{
  SIRINLUParser *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SIRINLUParser;
  result = -[SIRINLUParser init](&v7, sel_init);
  if (result)
  {
    result->_algorithmType = a3;
    result->_parserIdentifier = a4;
  }
  return result;
}

- (SIRINLUParser)initWithCoder:(id)a3
{
  id v4;
  SIRINLUParser *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SIRINLUParser;
  v5 = -[SIRINLUParser init](&v7, sel_init);
  if (v5)
  {
    v5->_algorithmType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("algorithmType"));
    v5->_parserIdentifier = objc_msgSend(v4, "decodeIntForKey:", CFSTR("parserIdentifier"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[SIRINLUParser algorithmType](self, "algorithmType"), CFSTR("algorithmType"));
  objc_msgSend(v4, "encodeInt:forKey:", -[SIRINLUParser parserIdentifier](self, "parserIdentifier"), CFSTR("parserIdentifier"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{Parser\n  algorithmType: %d\n  parserIdentifier: %d\n}"), self->_algorithmType, self->_parserIdentifier);
}

- (int)algorithmType
{
  return self->_algorithmType;
}

- (void)setAlgorithmType:(int)a3
{
  self->_algorithmType = a3;
}

- (int)parserIdentifier
{
  return self->_parserIdentifier;
}

- (void)setParserIdentifier:(int)a3
{
  self->_parserIdentifier = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
