@implementation PKPayLaterMerchandisingConfiguration

- (PKPayLaterMerchandisingConfiguration)initWithAmount:(id)a3 currency:(id)a4 displayStyle:(int64_t)a5 action:(int64_t)a6 theme:(unint64_t)a7 environmentType:(unint64_t)a8
{
  id v15;
  id v16;
  PKPayLaterMerchandisingConfiguration *v17;
  PKPayLaterMerchandisingConfiguration *v18;

  v15 = a3;
  v16 = a4;
  v17 = -[PKPayLaterMerchandisingConfiguration init](self, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_amount, a3);
    objc_storeStrong((id *)&v18->_currency, a4);
    v18->_displayStyle = a5;
    v18->_action = a6;
    v18->_environmentType = a8;
    v18->_theme = a7;
  }

  return v18;
}

- (id)amountString
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_numberFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", self->_amount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localeString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)region
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regionCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)stringValueForProperty:(unint64_t)a3
{
  void *v4;
  id result;

  v4 = 0;
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 63)
    {
      if (a3 == 64)
      {
        PKPayLaterActionToString((const __CFString *)self->_action);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (a3 == 128)
      {
        PKPayLaterEnvironmentTypeToString((__CFString *)self->_environmentType);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a3 == 16)
    {
      PKPayLaterDisplayStyleToString((__CFString *)self->_displayStyle);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 32)
    {
      PKPayLaterThemeToString((__CFString *)self->_theme);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return v4;
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        result = &stru_1E2ADF4C0;
        break;
      case 1uLL:
        -[PKPayLaterMerchandisingConfiguration amountString](self, "amountString");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      case 2uLL:
        result = self->_currency;
        break;
      case 4uLL:
        -[PKPayLaterMerchandisingConfiguration region](self, "region");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      case 8uLL:
        -[PKPayLaterMerchandisingConfiguration localeString](self, "localeString");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      default:
        return v4;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterMerchandisingConfiguration *v4;
  PKPayLaterMerchandisingConfiguration *v5;
  BOOL v6;

  v4 = (PKPayLaterMerchandisingConfiguration *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterMerchandisingConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v5);

  return v6;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *amount;
  NSDecimalNumber *v6;
  BOOL v7;
  char v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  _BOOL4 v13;
  BOOL v14;

  v4 = a3;
  if (!v4)
    goto LABEL_21;
  amount = self->_amount;
  v6 = (NSDecimalNumber *)v4[1];
  if (amount)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (amount != v6)
    {
LABEL_21:
      v14 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    v8 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_21;
  }
  v9 = (void *)v4[2];
  v10 = self->_currency;
  v11 = v9;
  if (v10 == v11)
  {

    goto LABEL_16;
  }
  v12 = v11;
  if (!v10 || !v11)
  {

    goto LABEL_21;
  }
  v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

  if (!v13)
    goto LABEL_21;
LABEL_16:
  if (self->_displayStyle != v4[3] || self->_theme != v4[6] || self->_action != v4[4])
    goto LABEL_21;
  v14 = self->_environmentType == v4[5];
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_currency);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_displayStyle - v4 + 32 * v4;
  v6 = self->_theme - v5 + 32 * v5;
  v7 = self->_action - v6 + 32 * v6;
  v8 = self->_environmentType - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  -[PKPayLaterMerchandisingConfiguration amount](self, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("currency: '%@'; "), self->_currency);
  -[PKPayLaterMerchandisingConfiguration region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("region: '%@'; "), v5);

  -[PKPayLaterMerchandisingConfiguration localeString](self, "localeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("locale: '%@'; "), v6);

  PKPayLaterDisplayStyleToString((__CFString *)self->_displayStyle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("displayStyle: '%@'; "), v7);

  PKPayLaterThemeToString((__CFString *)self->_theme);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("theme: '%@'; "), v8);

  PKPayLaterActionToString((const __CFString *)self->_action);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("secondaryAction: '%@'; "), v9);

  PKPayLaterEnvironmentTypeToString((__CFString *)self->_environmentType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("environmentType: '%@'; "), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterMerchandisingConfiguration *v5;
  uint64_t v6;
  NSDecimalNumber *amount;
  uint64_t v8;
  NSString *currency;

  v5 = -[PKPayLaterMerchandisingConfiguration init](+[PKPayLaterMerchandisingConfiguration allocWithZone:](PKPayLaterMerchandisingConfiguration, "allocWithZone:"), "init");
  v6 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  amount = v5->_amount;
  v5->_amount = (NSDecimalNumber *)v6;

  v8 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  currency = v5->_currency;
  v5->_currency = (NSString *)v8;

  v5->_displayStyle = self->_displayStyle;
  v5->_theme = self->_theme;
  v5->_action = self->_action;
  v5->_environmentType = self->_environmentType;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterMerchandisingConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterMerchandisingConfiguration *v5;
  uint64_t v6;
  NSDecimalNumber *amount;
  uint64_t v8;
  NSString *currency;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterMerchandisingConfiguration;
  v5 = -[PKPayLaterMerchandisingConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v8 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    v5->_displayStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayStyle"));
    v5->_theme = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("theme"));
    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action"));
    v5->_environmentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("environmentType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_displayStyle, CFSTR("displayStyle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_theme, CFSTR("theme"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_environmentType, CFSTR("environmentType"));

}

+ (id)_numberFormatter
{
  if (qword_1ECF22B08 != -1)
    dispatch_once(&qword_1ECF22B08, &__block_literal_global_196);
  return (id)_MergedGlobals_276;
}

uint64_t __56__PKPayLaterMerchandisingConfiguration__numberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_MergedGlobals_276;
  _MergedGlobals_276 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_276, "setNumberStyle:", 0);
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(int64_t)a3
{
  self->_displayStyle = a3;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (unint64_t)environmentType
{
  return self->_environmentType;
}

- (void)setEnvironmentType:(unint64_t)a3
{
  self->_environmentType = a3;
}

- (unint64_t)theme
{
  return self->_theme;
}

- (void)setTheme:(unint64_t)a3
{
  self->_theme = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
