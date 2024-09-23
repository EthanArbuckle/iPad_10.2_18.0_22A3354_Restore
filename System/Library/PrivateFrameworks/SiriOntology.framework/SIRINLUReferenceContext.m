@implementation SIRINLUReferenceContext

- (SIRINLUReferenceContext)initWithContextualReference:(BOOL)a3 DisambiguationNeeded:(BOOL)a4
{
  SIRINLUReferenceContext *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SIRINLUReferenceContext;
  result = -[SIRINLUReferenceContext init](&v7, sel_init);
  if (result)
  {
    result->_contextualReference = a3;
    result->_disambiguationNeeded = a4;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 contextualReference;
  id v5;

  contextualReference = self->_contextualReference;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", contextualReference, CFSTR("contextualReference"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_disambiguationNeeded, CFSTR("disambiguationNeeded"));

}

- (SIRINLUReferenceContext)initWithCoder:(id)a3
{
  id v4;
  SIRINLUReferenceContext *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SIRINLUReferenceContext;
  v5 = -[SIRINLUReferenceContext init](&v7, sel_init);
  if (v5)
  {
    v5->_contextualReference = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("contextualReference"));
    v5->_disambiguationNeeded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disambiguationNeeded"));
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ReferenceContext:\n  contextualReference: %d\n  disambiguationNeeded: %d\n}"), self->_contextualReference, self->_disambiguationNeeded);
}

- (BOOL)contextualReference
{
  return self->_contextualReference;
}

- (void)setContextualReference:(BOOL)a3
{
  self->_contextualReference = a3;
}

- (BOOL)disambiguationNeeded
{
  return self->_disambiguationNeeded;
}

- (void)setDisambiguationNeeded:(BOOL)a3
{
  self->_disambiguationNeeded = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
