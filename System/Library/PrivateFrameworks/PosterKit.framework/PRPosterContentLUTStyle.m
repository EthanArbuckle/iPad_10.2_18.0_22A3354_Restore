@implementation PRPosterContentLUTStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterContentLUTStyle)initWithLUTIdentifier:(id)a3
{
  id v5;
  PRPosterContentLUTStyle *v6;
  PRPosterContentLUTStyle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterContentLUTStyle;
  v6 = -[PRPosterContentLUTStyle init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lutIdentifier, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterContentLUTStyle *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PRPosterContentLUTStyle *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PRPosterContentLUTStyle lutIdentifier](v4, "lutIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterContentLUTStyle lutIdentifier](self, "lutIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D01788]);
  v4 = (id)objc_msgSend(v3, "appendString:", self->_lutIdentifier);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (NSString)nonVariatedIdentifier
{
  void *v3;
  void *v4;

  _PRPosterContentStyleStringForType(-[PRPosterContentLUTStyle type](self, "type"));
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

- (void)applyStyleWithRenderer:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "renderLUTStyle:", self);

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

- (PRPosterContentLUTStyle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PRPosterContentLUTStyle *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lutIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PRPosterContentLUTStyle initWithLUTIdentifier:](self, "initWithLUTIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_lutIdentifier, CFSTR("lutIdentifier"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PRPosterContentLUTStyle initWithLUTIdentifier:]([PRPosterContentLUTStyle alloc], "initWithLUTIdentifier:", self->_lutIdentifier);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lutIdentifier, 0);
}

@end
