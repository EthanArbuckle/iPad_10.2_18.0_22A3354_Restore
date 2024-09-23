@implementation PKNumericSuggestion

+ (id)suggestionWithTitle:(id)a3 value:(id)a4 currencyCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:value:currencyCode:", v10, v9, v8);

  return v11;
}

+ (id)suggestionWithValue:(id)a3 currencyCode:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:value:currencyCode:", 0, v7, v6);

  return v8;
}

- (PKNumericSuggestion)initWithValue:(id)a3 currencyCode:(id)a4
{
  id v7;
  id v8;
  PKNumericSuggestion *v9;
  PKNumericSuggestion *v10;
  PKCurrencyAmount *v11;
  uint64_t v12;
  NSString *displayValue;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKNumericSuggestion;
  v9 = -[PKNumericSuggestion init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_value, a3);
    v10->_usedMaximumSuggestion = 0;
    v11 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v7, v8, 0);
    -[PKCurrencyAmount minimalFormattedStringValue](v11, "minimalFormattedStringValue");
    v12 = objc_claimAutoreleasedReturnValue();
    displayValue = v10->_displayValue;
    v10->_displayValue = (NSString *)v12;

    objc_storeStrong((id *)&v10->_currencyDisplayValue, v10->_displayValue);
  }

  return v10;
}

- (PKNumericSuggestion)initWithTitle:(id)a3 value:(id)a4 currencyCode:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKNumericSuggestion *v12;
  PKNumericSuggestion *v13;
  PKCurrencyAmount *v14;
  void *v15;
  NSString *v16;
  NSString *displayValue;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKNumericSuggestion;
  v12 = -[PKNumericSuggestion init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_value, a4);
    v13->_usedMaximumSuggestion = 0;
    v14 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v10, v11, 0);
    -[PKCurrencyAmount minimalFormattedStringValue](v14, "minimalFormattedStringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v13->_currencyDisplayValue, v15);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v9, v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = v15;
    }
    displayValue = v13->_displayValue;
    v13->_displayValue = v16;

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *value;
  NSDecimalNumber *v6;
  NSString *title;
  NSString *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  value = self->_value;
  v6 = (NSDecimalNumber *)v4[3];
  if (!value || !v6)
  {
    if (value == v6)
      goto LABEL_5;
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if ((-[NSDecimalNumber isEqual:](value, "isEqual:") & 1) == 0)
    goto LABEL_9;
LABEL_5:
  title = self->_title;
  v8 = (NSString *)v4[4];
  if (title && v8)
    v9 = -[NSString isEqual:](title, "isEqual:");
  else
    v9 = title == v8;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_value);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@'; "), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("value: '%@'; "), self->_value);
  objc_msgSend(v3, "appendFormat:", CFSTR("displayValue: '%@'; "), self->_displayValue);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSDecimalNumber)value
{
  return self->_value;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayValue
{
  return self->_displayValue;
}

- (void)setDisplayValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)currencyDisplayValue
{
  return self->_currencyDisplayValue;
}

- (BOOL)usedMaximumSuggestion
{
  return self->_usedMaximumSuggestion;
}

- (void)setUsedMaximumSuggestion:(BOOL)a3
{
  self->_usedMaximumSuggestion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayValue, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_currencyDisplayValue, 0);
}

@end
