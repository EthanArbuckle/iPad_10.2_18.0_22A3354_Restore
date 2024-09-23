@implementation PKPassTileValueNumber

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  NSNumber *v5;
  NSNumber *content;
  NSString *v7;
  NSString *currencyCode;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPassTileValueNumber;
  if (-[PKPassTileValue _setUpWithDictionary:](&v16, sel__setUpWithDictionary_, v4)
    && (objc_msgSend(v4, "PKNumberForKey:", CFSTR("content")),
        v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(),
        content = self->_content,
        self->_content = v5,
        content,
        self->_content))
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    currencyCode = self->_currencyCode;
    self->_currencyCode = v7;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("numberStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    self->_numberStyle = (int)_PKEnumValueFromString(v9, 0, (uint64_t)CFSTR("PKNumberStyle"), CFSTR("PKNumberStyleDecimal, WLNumberStyleDecimal, PKNumberStylePercent, WLNumberStylePercent, PKNumberStyleScientific, WLNumberStyleScientific, PKNumberStyleSpellOut, WLNumberStyleSpellOut"), v11, v12, v13, v14, 1u);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)createWithContent:(id)a3 currencyCode:(id)a4 numberStyle:(int64_t)a5
{
  id v8;
  id v9;
  id *v10;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = +[PKPassTileValue _createForType:resolved:](PKPassTileValue, "_createForType:resolved:", 2, 1);
    objc_storeStrong(v10 + 3, a3);
    objc_storeStrong(v10 + 4, a4);
    v10[5] = (id)a5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4
{
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassTileValueNumber;
  v5 = -[PKPassTileValue createResolvedValueWithBundle:privateBundle:](&v7, sel_createResolvedValueWithBundle_privateBundle_, a3, a4);
  objc_storeStrong(v5 + 3, self->_content);
  objc_storeStrong(v5 + 4, self->_currencyCode);
  v5[5] = (id)self->_numberStyle;
  return v5;
}

- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4
{
  id v5;
  void *v6;
  int64_t numberStyle;
  void *v8;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v6 = v5;
  if (self->_currencyCode)
  {
    objc_msgSend(v5, "setCurrencyCode:");
    numberStyle = 2;
  }
  else
  {
    numberStyle = self->_numberStyle;
  }
  objc_msgSend(v6, "setNumberStyle:", numberStyle);
  objc_msgSend(v6, "stringFromNumber:", self->_content);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileValueNumber)initWithCoder:(id)a3
{
  id v4;
  PKPassTileValueNumber *v5;
  uint64_t v6;
  NSNumber *content;
  uint64_t v8;
  NSString *currencyCode;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPassTileValueNumber;
  v5 = -[PKPassTileValue initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
    v6 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberStyle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numberStyle = (int)_PKEnumValueFromString(v10, 0, (uint64_t)CFSTR("PKNumberStyle"), CFSTR("PKNumberStyleDecimal, WLNumberStyleDecimal, PKNumberStylePercent, WLNumberStylePercent, PKNumberStyleScientific, WLNumberStyleScientific, PKNumberStyleSpellOut, WLNumberStyleSpellOut"), v11, v12, v13, v14, 1u);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPassTileValueNumber;
  v4 = a3;
  -[PKPassTileValue encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_content, CFSTR("content"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  _PKEnumValueToString(self->_numberStyle, CFSTR("PKNumberStyle"), CFSTR("PKNumberStyleDecimal, WLNumberStyleDecimal, PKNumberStylePercent, WLNumberStylePercent, PKNumberStyleScientific, WLNumberStyleScientific, PKNumberStyleSpellOut, WLNumberStyleSpellOut"), v5, v6, v7, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("numberStyle"));

}

- (unint64_t)hash
{
  NSUInteger v3;
  int64_t numberStyle;
  objc_super v6;
  id v7;
  uint64_t v8;
  NSUInteger v9;
  int64_t v10;

  v6.receiver = self;
  v6.super_class = (Class)PKPassTileValueNumber;
  v7 = -[PKPassTileValue hash](&v6, sel_hash);
  v8 = -[NSNumber hash](self->_content, "hash");
  v3 = -[NSString hash](self->_currencyCode, "hash");
  numberStyle = self->_numberStyle;
  v9 = v3;
  v10 = numberStyle;
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  id v4;
  id *v5;
  NSString *currencyCode;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  BOOL v11;
  _BOOL4 v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassTileValueNumber;
  if (-[PKPassTileValue _isEqual:](&v14, sel__isEqual_, v4))
  {
    v5 = (id *)v4;
    if (objc_msgSend(v5[3], "isEqualToNumber:", self->_content))
    {
      currencyCode = self->_currencyCode;
      v7 = (NSString *)v5[4];
      v8 = currencyCode;
      if (v7 == v8)
      {

LABEL_13:
        v11 = v5[5] == (id)self->_numberStyle;
LABEL_15:

        goto LABEL_16;
      }
      v9 = v8;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
      {

      }
      else
      {
        v12 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

        if (v12)
          goto LABEL_13;
      }
    }
    v11 = 0;
    goto LABEL_15;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (NSNumber)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)numberStyle
{
  return self->_numberStyle;
}

- (void)setNumberStyle:(int64_t)a3
{
  self->_numberStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
