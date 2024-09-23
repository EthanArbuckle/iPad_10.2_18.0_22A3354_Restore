@implementation PSDisplay

+ (id)builtinDisplay
{
  if (builtinDisplay_onceToken != -1)
    dispatch_once(&builtinDisplay_onceToken, &__block_literal_global_4);
  return (id)builtinDisplay___builtin;
}

void __27__PSDisplay_builtinDisplay__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSDisplay _initWithHardwareIdentifier:]([PSDisplay alloc], "_initWithHardwareIdentifier:", 0);
  v1 = (void *)builtinDisplay___builtin;
  builtinDisplay___builtin = (uint64_t)v0;

  *(_BYTE *)(builtinDisplay___builtin + 8) = 1;
}

+ (id)displayWithHardwareIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    v4 = -[PSDisplay _initWithHardwareIdentifier:]([PSDisplay alloc], "_initWithHardwareIdentifier:", v3);
  }
  else
  {
    +[PSDisplay builtinDisplay](PSDisplay, "builtinDisplay");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)_initWithHardwareIdentifier:(id)a3
{
  id v4;
  PSDisplay *v5;
  uint64_t v6;
  NSString *hardwareIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSDisplay;
  v5 = -[PSDisplay init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    hardwareIdentifier = v5->_hardwareIdentifier;
    v5->_hardwareIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_hardwareIdentifier, CFSTR("hardwareIdentifier"));
}

- (PSDisplay)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PSDisplay *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hardwareIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSDisplay displayWithHardwareIdentifier:](PSDisplay, "displayWithHardwareIdentifier:", v5);
  v6 = (PSDisplay *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if (self->_builtin)
    v2 = 102301;
  else
    v2 = 96953;
  return v2 ^ -[NSString hash](self->_hardwareIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PSDisplay *v4;
  uint64_t v5;
  char v6;

  v4 = (PSDisplay *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() && self->_builtin == v4->_builtin)
      v6 = BSEqualStrings();
    else
      v6 = 0;
  }

  return v6;
}

- (id)description
{
  NSString *hardwareIdentifier;

  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
    return hardwareIdentifier;
  if (self->_builtin)
    return CFSTR("builtin");
  return CFSTR("unknown");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

@end
