@implementation PUIStyleLUT

- (PUIStyleLUT)initWithLUTIdentifier:(id)a3
{
  id v5;
  PUIStyleLUT *v6;
  PUIStyleLUT *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUIStyleLUT;
  v6 = -[PUIStyleLUT init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lutIdentifier, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  return -[PUIStyleLUT isEqual:ignoringVariation:](self, "isEqual:ignoringVariation:", a3, 1);
}

- (BOOL)isEqualToStyle:(id)a3
{
  return -[PUIStyleLUT isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", a3, 1);
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL8 v4;
  PUIStyleLUT *v6;
  BOOL v7;

  v4 = a4;
  v6 = (PUIStyleLUT *)a3;
  if (v6 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PUIStyleLUT isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", v6, v4);
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL4 v4;
  PUIStyleLUT *v6;
  PUIStyleLUT *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a4;
  v6 = (PUIStyleLUT *)a3;
  v7 = v6;
  if (v6 == self)
  {
    v10 = 1;
  }
  else if (v6 && _PUIStyleCompareUsingIdentifiers(self, v6, v4))
  {
    -[PUIStyleLUT lutIdentifier](v7, "lutIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleLUT lutIdentifier](self, "lutIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE28]);
  v4 = (id)objc_msgSend(v3, "appendString:", self->_lutIdentifier);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (NSString)nonVariatedIdentifier
{
  void *v3;
  void *v4;

  NSStringFromPUIStyleType(-[PUIStyleLUT type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("-%@"), self->_lutIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  return 0;
}

- (unint64_t)type
{
  return 4;
}

- (BOOL)allowsVariation
{
  return 0;
}

- (BOOL)isSupportedSystemStyle
{
  return 1;
}

- (BOOL)isSupportedBackgroundStyle
{
  return 0;
}

- (BOOL)desiresVibrancyEffectView
{
  return 1;
}

- (int64_t)vibrancyEffectType
{
  return 3;
}

- (UIColor)vibrancyEffectColor
{
  return 0;
}

- (NSString)lutIdentifier
{
  return self->_lutIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStyleLUT)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PUIStyleLUT *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lutIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PUIStyleLUT initWithLUTIdentifier:](self, "initWithLUTIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_lutIdentifier, CFSTR("lutIdentifier"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUIStyleLUT initWithLUTIdentifier:]([PUIStyleLUT alloc], "initWithLUTIdentifier:", self->_lutIdentifier);
}

- (NSString)LUTIdentifier
{
  return self->_LUTIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_LUTIdentifier, 0);
  objc_storeStrong((id *)&self->_lutIdentifier, 0);
}

@end
