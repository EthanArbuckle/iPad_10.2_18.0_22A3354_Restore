@implementation REMSecondaryGroceryLocale

- (REMSecondaryGroceryLocale)initWithLocale:(id)a3 isAutomatic:(BOOL)a4
{
  id v7;
  REMSecondaryGroceryLocale *v8;
  REMSecondaryGroceryLocale *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMSecondaryGroceryLocale;
  v8 = -[REMSecondaryGroceryLocale init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a3);
    v9->_isAutomatic = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  _BOOL4 v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  -[REMSecondaryGroceryLocale locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

    goto LABEL_6;
  }
  v7 = (void *)v6;
  -[REMSecondaryGroceryLocale locale](self, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
LABEL_6:
    v12 = -[REMSecondaryGroceryLocale isAutomatic](self, "isAutomatic");
    v11 = v12 ^ objc_msgSend(v4, "isAutomatic") ^ 1;
    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v11) = 0;
LABEL_7:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[REMSecondaryGroceryLocale locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithLocale:isAutomatic:", v5, -[REMSecondaryGroceryLocale isAutomatic](self, "isAutomatic"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSLocale *locale;
  id v5;

  locale = self->_locale;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", locale, CFSTR("locale"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAutomatic, CFSTR("isAutomatic"));

}

- (REMSecondaryGroceryLocale)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  REMSecondaryGroceryLocale *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutomatic"));

  v7 = -[REMSecondaryGroceryLocale initWithLocale:isAutomatic:](self, "initWithLocale:isAutomatic:", v5, v6);
  return v7;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (BOOL)isAutomatic
{
  return self->_isAutomatic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
