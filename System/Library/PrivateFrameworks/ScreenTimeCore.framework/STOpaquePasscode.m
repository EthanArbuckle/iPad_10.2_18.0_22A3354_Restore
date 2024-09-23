@implementation STOpaquePasscode

- (STOpaquePasscode)initWithPasscode:(id)a3
{
  id v3;
  STOpaquePasscode *v4;
  uint64_t v5;
  NSString *passcode;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STOpaquePasscode;
  v3 = a3;
  v4 = -[STOpaquePasscode init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  passcode = v4->_passcode;
  v4->_passcode = (NSString *)v5;

  return v4;
}

- (STOpaquePasscode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  STOpaquePasscode *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passcode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[STOpaquePasscode initWithPasscode:](self, "initWithPasscode:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_passcode, CFSTR("passcode"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPasscode:", self->_passcode);
}

- (BOOL)isEqual:(id)a3
{
  STOpaquePasscode *v4;
  BOOL v5;

  v4 = (STOpaquePasscode *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[STOpaquePasscode isEqualToOpaquePasscode:](self, "isEqualToOpaquePasscode:", v4);
  }

  return v5;
}

- (BOOL)isEqualToOpaquePasscode:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  if (a3 == self)
    return 1;
  objc_msgSend(a3, "passcode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STOpaquePasscode passcode](self, "passcode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[STOpaquePasscode passcode](self, "passcode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)passcode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
