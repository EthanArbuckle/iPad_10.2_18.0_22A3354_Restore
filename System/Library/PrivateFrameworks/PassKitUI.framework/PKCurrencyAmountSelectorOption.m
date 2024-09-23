@implementation PKCurrencyAmountSelectorOption

- (PKCurrencyAmountSelectorOption)initWithCurrencyAmount:(id)a3 displayValue:(id)a4 customOption:(BOOL)a5 selected:(BOOL)a6
{
  id v11;
  id v12;
  PKCurrencyAmountSelectorOption *v13;
  PKCurrencyAmountSelectorOption *v14;
  uint64_t v15;
  NSString *displayValue;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKCurrencyAmountSelectorOption;
  v13 = -[PKCurrencyAmountSelectorOption init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_currencyAmount, a3);
    v15 = objc_msgSend(v12, "copy");
    displayValue = v14->_displayValue;
    v14->_displayValue = (NSString *)v15;

    v14->_isCustomOption = a5;
    v14->_selected = a6;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  PKCurrencyAmountSelectorOption *v4;
  PKCurrencyAmountSelectorOption *v5;
  PKCurrencyAmountSelectorOption *v6;
  NSString *displayValue;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;

  v4 = (PKCurrencyAmountSelectorOption *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if (PKEqualObjects())
        {
          displayValue = v6->_displayValue;
          v8 = self->_displayValue;
          v9 = displayValue;
          if (v8 == v9)
          {

          }
          else
          {
            v10 = v9;
            if (!v8 || !v9)
            {

              goto LABEL_16;
            }
            v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

            if (!v11)
              goto LABEL_16;
          }
          if (self->_isCustomOption == v6->_isCustomOption)
          {
            v12 = self->_selected == v6->_selected;
LABEL_17:

            goto LABEL_18;
          }
        }
LABEL_16:
        v12 = 0;
        goto LABEL_17;
      }
    }
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_displayValue);
  PKCombinedHash();
  PKIntegerHash();
  v4 = PKIntegerHash();

  return v4;
}

- (int64_t)compare:(id)a3
{
  PKCurrencyAmount *currencyAmount;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  currencyAmount = self->_currencyAmount;
  v4 = a3;
  -[PKCurrencyAmount amount](currencyAmount, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    v8 = 0;
  }
  else if (v5)
  {
    if (v7)
      v8 = objc_msgSend(v5, "compare:", v7);
    else
      v8 = 1;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

+ (id)cellReuseIdentifier
{
  return CFSTR("SpendLimitOptionCellReuseIdentifier");
}

- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "cellReuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "defaultContentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmountSelectorOption displayValue](self, "displayValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  objc_msgSend(v9, "setContentConfiguration:", v10);
  if (self->_selected)
    v12 = 3;
  else
    v12 = 0;
  objc_msgSend(v9, "setAccessoryType:", v12);
  objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678A8]);

  return v9;
}

- (BOOL)shouldHighlight
{
  return 1;
}

- (int64_t)editingStyle
{
  return self->_isCustomOption;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (NSString)displayValue
{
  return self->_displayValue;
}

- (BOOL)isCustomOption
{
  return self->_isCustomOption;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayValue, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

@end
