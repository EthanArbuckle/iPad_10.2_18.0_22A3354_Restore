@implementation PKPaymentOfferDynamicContentIcon

- (PKPaymentOfferDynamicContentIcon)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferDynamicContentIconVariant *v5;
  void *v6;
  void *v7;
  PKPaymentOfferDynamicContentIcon *v8;
  PKPaymentOfferDynamicContentIcon *v9;
  PKPaymentOfferDynamicContentIconVariant *v10;
  PKPaymentOfferDynamicContentIconVariant *darkVariant;
  PKPaymentOfferDynamicContentIconVariant *v12;
  PKPaymentOfferDynamicContentIconVariant *lightVariant;
  PKPaymentOfferDynamicContentIcon *v14;
  objc_super v16;

  v4 = a3;
  v5 = -[PKPaymentOfferDynamicContentIconVariant initWithDictionary:]([PKPaymentOfferDynamicContentIconVariant alloc], "initWithDictionary:", v4);
  if (v5)
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("darkVariant"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("lightVariant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16.receiver = self;
    v16.super_class = (Class)PKPaymentOfferDynamicContentIcon;
    v8 = -[PKPaymentOfferDynamicContentIcon init](&v16, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_defaultVariant, v5);
      if (v6)
      {
        v10 = -[PKPaymentOfferDynamicContentIconVariant initWithDictionary:]([PKPaymentOfferDynamicContentIconVariant alloc], "initWithDictionary:", v6);
        darkVariant = v9->_darkVariant;
        v9->_darkVariant = v10;

      }
      if (v7)
      {
        v12 = -[PKPaymentOfferDynamicContentIconVariant initWithDictionary:]([PKPaymentOfferDynamicContentIconVariant alloc], "initWithDictionary:", v7);
        lightVariant = v9->_lightVariant;
        v9->_lightVariant = v12;

      }
    }
    self = v9;

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  PKPaymentOfferDynamicContentIconVariant *darkVariant;
  void *v6;
  PKPaymentOfferDynamicContentIconVariant *lightVariant;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPaymentOfferDynamicContentIconVariant dictionaryRepresentation](self->_defaultVariant, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  darkVariant = self->_darkVariant;
  if (darkVariant)
  {
    -[PKPaymentOfferDynamicContentIconVariant dictionaryRepresentation](darkVariant, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("darkVariant"));

  }
  lightVariant = self->_lightVariant;
  if (lightVariant)
  {
    -[PKPaymentOfferDynamicContentIconVariant dictionaryRepresentation](lightVariant, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("lightVariant"));

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (id)urlForScreenScale:(double)a3 appearance:(int64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  PKPaymentOfferDynamicContentIconVariant *darkVariant;
  uint64_t v11;
  void *v12;
  void *v13;

  -[PKPaymentOfferDynamicContentIconVariant urlForScreenScale:](self->_defaultVariant, "urlForScreenScale:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 2)
  {
    darkVariant = self->_darkVariant;
  }
  else
  {
    if (a4 != 1)
    {
      v9 = v7;
      goto LABEL_10;
    }
    darkVariant = self->_lightVariant;
  }
  -[PKPaymentOfferDynamicContentIconVariant urlForScreenScale:](darkVariant, "urlForScreenScale:", a3);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v8;
  v9 = v13;

LABEL_10:
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferDynamicContentIcon *v4;
  PKPaymentOfferDynamicContentIcon *v5;
  PKPaymentOfferDynamicContentIcon *v6;
  PKPaymentOfferDynamicContentIconVariant *defaultVariant;
  PKPaymentOfferDynamicContentIconVariant *v8;
  char v9;
  PKPaymentOfferDynamicContentIconVariant *lightVariant;
  PKPaymentOfferDynamicContentIconVariant *v11;
  PKPaymentOfferDynamicContentIconVariant *darkVariant;
  PKPaymentOfferDynamicContentIconVariant *v13;

  v4 = (PKPaymentOfferDynamicContentIcon *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        defaultVariant = self->_defaultVariant;
        v8 = v6->_defaultVariant;
        if (defaultVariant && v8)
        {
          if (!-[PKPaymentOfferDynamicContentIconVariant isEqual:](defaultVariant, "isEqual:"))
            goto LABEL_18;
        }
        else if (defaultVariant != v8)
        {
          goto LABEL_18;
        }
        lightVariant = self->_lightVariant;
        v11 = v6->_lightVariant;
        if (lightVariant && v11)
        {
          if (-[PKPaymentOfferDynamicContentIconVariant isEqual:](lightVariant, "isEqual:"))
          {
LABEL_14:
            darkVariant = self->_darkVariant;
            v13 = v6->_darkVariant;
            if (darkVariant && v13)
              v9 = -[PKPaymentOfferDynamicContentIconVariant isEqual:](darkVariant, "isEqual:");
            else
              v9 = darkVariant == v13;
            goto LABEL_19;
          }
        }
        else if (lightVariant == v11)
        {
          goto LABEL_14;
        }
LABEL_18:
        v9 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v9 = 0;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_defaultVariant);
  objc_msgSend(v3, "safelyAddObject:", self->_lightVariant);
  objc_msgSend(v3, "safelyAddObject:", self->_darkVariant);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("defaultVariant: '%@'; "), self->_defaultVariant);
  objc_msgSend(v3, "appendFormat:", CFSTR("lightVariant: '%@'; "), self->_lightVariant);
  objc_msgSend(v3, "appendFormat:", CFSTR("darkVariant: '%@'; "), self->_darkVariant);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentIcon)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferDynamicContentIcon *v5;
  uint64_t v6;
  PKPaymentOfferDynamicContentIconVariant *defaultVariant;
  uint64_t v8;
  PKPaymentOfferDynamicContentIconVariant *lightVariant;
  uint64_t v10;
  PKPaymentOfferDynamicContentIconVariant *darkVariant;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferDynamicContentIcon;
  v5 = -[PKPaymentOfferDynamicContentIcon init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultVariant"));
    v6 = objc_claimAutoreleasedReturnValue();
    defaultVariant = v5->_defaultVariant;
    v5->_defaultVariant = (PKPaymentOfferDynamicContentIconVariant *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lightVariant"));
    v8 = objc_claimAutoreleasedReturnValue();
    lightVariant = v5->_lightVariant;
    v5->_lightVariant = (PKPaymentOfferDynamicContentIconVariant *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("darkVariant"));
    v10 = objc_claimAutoreleasedReturnValue();
    darkVariant = v5->_darkVariant;
    v5->_darkVariant = (PKPaymentOfferDynamicContentIconVariant *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPaymentOfferDynamicContentIconVariant *defaultVariant;
  id v5;

  defaultVariant = self->_defaultVariant;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", defaultVariant, CFSTR("defaultVariant"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lightVariant, CFSTR("lightVariant"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_darkVariant, CFSTR("darkVariant"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferDynamicContentIcon *v5;
  PKPaymentOfferDynamicContentIconVariant *v6;
  PKPaymentOfferDynamicContentIconVariant *defaultVariant;
  PKPaymentOfferDynamicContentIconVariant *v8;
  PKPaymentOfferDynamicContentIconVariant *lightVariant;
  PKPaymentOfferDynamicContentIconVariant *v10;
  PKPaymentOfferDynamicContentIconVariant *darkVariant;

  v5 = -[PKPaymentOfferDynamicContentIcon init](+[PKPaymentOfferDynamicContentIcon allocWithZone:](PKPaymentOfferDynamicContentIcon, "allocWithZone:"), "init");
  v6 = -[PKPaymentOfferDynamicContentIconVariant copyWithZone:](self->_defaultVariant, "copyWithZone:", a3);
  defaultVariant = v5->_defaultVariant;
  v5->_defaultVariant = v6;

  v8 = -[PKPaymentOfferDynamicContentIconVariant copyWithZone:](self->_lightVariant, "copyWithZone:", a3);
  lightVariant = v5->_lightVariant;
  v5->_lightVariant = v8;

  v10 = -[PKPaymentOfferDynamicContentIconVariant copyWithZone:](self->_darkVariant, "copyWithZone:", a3);
  darkVariant = v5->_darkVariant;
  v5->_darkVariant = v10;

  return v5;
}

- (PKPaymentOfferDynamicContentIconVariant)defaultVariant
{
  return self->_defaultVariant;
}

- (void)setDefaultVariant:(id)a3
{
  objc_storeStrong((id *)&self->_defaultVariant, a3);
}

- (PKPaymentOfferDynamicContentIconVariant)darkVariant
{
  return self->_darkVariant;
}

- (void)setDarkVariant:(id)a3
{
  objc_storeStrong((id *)&self->_darkVariant, a3);
}

- (PKPaymentOfferDynamicContentIconVariant)lightVariant
{
  return self->_lightVariant;
}

- (void)setLightVariant:(id)a3
{
  objc_storeStrong((id *)&self->_lightVariant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightVariant, 0);
  objc_storeStrong((id *)&self->_darkVariant, 0);
  objc_storeStrong((id *)&self->_defaultVariant, 0);
}

@end
