@implementation PUIStyleCustom

- (PUIStyleCustom)initWithIdentifier:(id)a3 localizedName:(id)a4
{
  id v6;
  id v7;
  PUIStyleCustom *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *localizedName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUIStyleCustom;
  v8 = -[PUIStyleCustom init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    localizedName = v8->_localizedName;
    v8->_localizedName = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  return -[PUIStyleCustom isEqual:ignoringVariation:](self, "isEqual:ignoringVariation:", a3, 1);
}

- (BOOL)isEqualToStyle:(id)a3
{
  return -[PUIStyleCustom isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", a3, 1);
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL8 v4;
  PUIStyleCustom *v6;
  BOOL v7;

  v4 = a4;
  v6 = (PUIStyleCustom *)a3;
  if (v6 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PUIStyleCustom isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", v6, v4);
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL4 v4;
  PUIStyleCustom *v6;
  PUIStyleCustom *v7;
  BOOL v8;

  v4 = a4;
  v6 = (PUIStyleCustom *)a3;
  v7 = v6;
  if (v6 == self)
    v8 = 1;
  else
    v8 = v6
      && _PUIStyleCompareUsingIdentifiers(self, v6, v4)
      && -[NSString isEqualToString:](self->_localizedName, "isEqualToString:", v7->_localizedName)
      && -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v7->_identifier);

  return v8;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  id v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE28]);
  v4 = (id)objc_msgSend(v3, "appendString:", self->_identifier);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_localizedName);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (NSString)nonVariatedIdentifier
{
  return self->_identifier;
}

- (NSArray)colors
{
  return 0;
}

- (unint64_t)type
{
  return 999;
}

- (BOOL)allowsVariation
{
  return 0;
}

- (BOOL)isSupportedSystemStyle
{
  return 0;
}

- (BOOL)isSupportedBackgroundStyle
{
  return 1;
}

- (BOOL)desiresVibrancyEffectView
{
  return 0;
}

- (int64_t)vibrancyEffectType
{
  return 0;
}

- (UIColor)vibrancyEffectColor
{
  return 0;
}

- (NSString)lutIdentifier
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStyleCustom)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PUIStyleCustom *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PUIStyleCustom initWithIdentifier:localizedName:](self, "initWithIdentifier:localizedName:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedName, CFSTR("localizedName"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUIStyleCustom initWithIdentifier:localizedName:](+[PUIStyleCustom allocWithZone:](PUIStyleCustom, "allocWithZone:", a3), "initWithIdentifier:localizedName:", self->_identifier, self->_localizedName);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
