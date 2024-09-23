@implementation SIRINLURRAnnotation

- (SIRINLURRAnnotation)initWithKey:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  SIRINLURRAnnotation *v9;
  SIRINLURRAnnotation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLURRAnnotation;
  v9 = -[SIRINLURRAnnotation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (SIRINLURRAnnotation)initWithCoder:(id)a3
{
  id v4;
  SIRINLURRAnnotation *v5;
  uint64_t v6;
  NSString *key;
  uint64_t v8;
  NSString *value;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLURRAnnotation;
  v5 = -[SIRINLURRAnnotation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v6 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{RRAnnotation\n  key: %@\n  value: %@\n}"), self->_key, self->_value);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
