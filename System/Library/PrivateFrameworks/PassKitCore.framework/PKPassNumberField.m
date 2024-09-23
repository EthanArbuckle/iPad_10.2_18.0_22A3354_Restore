@implementation PKPassNumberField

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassNumberField;
  v4 = a3;
  -[PKPassField encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"), v6.receiver, v6.super_class);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("numberStyle"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassNumberField)initWithCoder:(id)a3
{
  id v4;
  PKPassNumberField *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassNumberField;
  v5 = -[PKPassField initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassNumberField setCurrencyCode:](v5, "setCurrencyCode:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassNumberField setNumberStyle:](v5, "setNumberStyle:", objc_msgSend(v7, "integerValue"));

  }
  return v5;
}

- (id)value
{
  NSString *value;
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  value = self->super._value;
  if (!value)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = self->_currencyCode;
    if (v5)
    {
      objc_msgSend(v4, "setNumberStyle:", 2);
      objc_msgSend(v4, "setCurrencyCode:", v5);
    }
    else
    {
      objc_msgSend(v4, "setNumberStyle:", self->_numberStyle);
    }
    -[PKPassField unformattedValue](self, "unformattedValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->super._value;
    self->super._value = v7;

    value = self->super._value;
  }
  return value;
}

- (void)setNumberStyle:(int64_t)a3
{
  self->_numberStyle = a3;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

- (id)asDictionary
{
  void *v2;
  void *v3;

  -[PKPassNumberField asMutableDictionary](self, "asMutableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)asMutableDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSString *currencyCode;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPassNumberField;
  -[PKPassField asMutableDictionary](&v13, sel_asMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  currencyCode = self->_currencyCode;
  if (currencyCode)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", currencyCode, CFSTR("currencyCode"));
  _PKEnumValueToString(self->_numberStyle, CFSTR("PKNumberStyle"), CFSTR("PKNumberStyleDecimal, WLNumberStyleDecimal, PKNumberStylePercent, WLNumberStylePercent, PKNumberStyleScientific, WLNumberStyleScientific, PKNumberStyleSpellOut, WLNumberStyleSpellOut"), v4, v5, v6, v7, v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("numberStyle"));

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassNumberField;
  v4 = -[PKPassField copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setNumberStyle:", self->_numberStyle);
  v5 = (void *)-[NSString copy](self->_currencyCode, "copy");
  objc_msgSend(v4, "setCurrencyCode:", v5);

  return v4;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (int64_t)numberStyle
{
  return self->_numberStyle;
}

@end
