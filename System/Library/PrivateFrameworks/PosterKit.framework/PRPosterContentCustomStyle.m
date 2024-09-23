@implementation PRPosterContentCustomStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterContentCustomStyle)initWithIdentifier:(id)a3 localizedName:(id)a4
{
  id v6;
  id v7;
  PRPosterContentCustomStyle *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *localizedName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRPosterContentCustomStyle;
  v8 = -[PRPosterContentCustomStyle init](&v14, sel_init);
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
  PRPosterContentCustomStyle *v4;
  PRPosterContentCustomStyle *v5;
  char v6;

  v4 = (PRPosterContentCustomStyle *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSString isEqual:](self->_localizedName, "isEqual:", v5->_localizedName))
        v6 = -[NSString isEqual:](self->_identifier, "isEqual:", v5->_identifier);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  id v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0D01788]);
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

- (void)applyStyleWithRenderer:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "renderCustomStyle:", self);

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

- (PRPosterContentCustomStyle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PRPosterContentCustomStyle *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PRPosterContentCustomStyle initWithIdentifier:localizedName:](self, "initWithIdentifier:localizedName:", v5, v6);
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
  return -[PRPosterContentCustomStyle initWithIdentifier:localizedName:](+[PRPosterContentCustomStyle allocWithZone:](PRPosterContentCustomStyle, "allocWithZone:", a3), "initWithIdentifier:localizedName:", self->_identifier, self->_localizedName);
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
