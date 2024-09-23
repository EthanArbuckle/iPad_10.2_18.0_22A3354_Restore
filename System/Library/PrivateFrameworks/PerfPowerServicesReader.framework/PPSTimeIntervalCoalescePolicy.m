@implementation PPSTimeIntervalCoalescePolicy

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PPSTimeIntervalCoalescePolicy numberPolicy](self, "numberPolicy"), CFSTR("numberPolicy"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[PPSTimeIntervalCoalescePolicy stringPolicy](self, "stringPolicy"), CFSTR("stringPolicy"));

}

- (PPSTimeIntervalCoalescePolicy)initWithCoder:(id)a3
{
  id v4;
  PPSTimeIntervalCoalescePolicy *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PPSTimeIntervalCoalescePolicy;
  v5 = -[PPSTimeIntervalCoalescePolicy init](&v7, sel_init);
  if (v5)
  {
    v5->_numberPolicy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numberPolicy"));
    v5->_stringPolicy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stringPolicy"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)legacyPolicy
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberCoalescePolicy:stringCoalescePolicy:", 0, 0);
}

- (PPSTimeIntervalCoalescePolicy)initWithNumberCoalescePolicy:(signed __int16)a3 stringCoalescePolicy:(signed __int16)a4
{
  PPSTimeIntervalCoalescePolicy *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PPSTimeIntervalCoalescePolicy;
  result = -[PPSTimeIntervalCoalescePolicy init](&v7, sel_init);
  if (result)
  {
    result->_numberPolicy = a3;
    result->_stringPolicy = a4;
  }
  return result;
}

- (signed)numberPolicy
{
  return self->_numberPolicy;
}

- (signed)stringPolicy
{
  return self->_stringPolicy;
}

@end
