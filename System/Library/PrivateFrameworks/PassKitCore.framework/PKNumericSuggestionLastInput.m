@implementation PKNumericSuggestionLastInput

- (PKNumericSuggestionLastInput)initWithPassSerialNumber:(id)a3
{
  id v5;
  PKNumericSuggestionLastInput *v6;
  PKNumericSuggestionLastInput *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *passLastInputDictionary;
  uint64_t v11;
  NSMutableDictionary *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKNumericSuggestionLastInput;
  v6 = -[PKNumericSuggestionLastInput init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serialNumber, a3);
    PKNumericSuggestionLastInputForPassSerialNumber(v7->_serialNumber);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    passLastInputDictionary = v7->_passLastInputDictionary;
    v7->_passLastInputDictionary = (NSMutableDictionary *)v9;

    if (!v7->_passLastInputDictionary)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v7->_passLastInputDictionary;
      v7->_passLastInputDictionary = (NSMutableDictionary *)v11;

    }
  }

  return v7;
}

- (PKNumericSuggestionLastInput)init
{
  return -[PKNumericSuggestionLastInput initWithPassSerialNumber:](self, "initWithPassSerialNumber:", 0);
}

- (void)save
{
  PKSetNumericSuggestionLastInputWithPassSerialNumber(self->_passLastInputDictionary, self->_serialNumber);
}

- (NSDecimalNumber)value
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_passLastInputDictionary, "objectForKey:", CFSTR("value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    PKCurrencyStorageNumberToCurrencyDecimal(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSDecimalNumber *)v3;
}

- (BOOL)wentToMax
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKey:](self->_passLastInputDictionary, "objectForKey:", CFSTR("wentToMax"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (void)setValue:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a3)
  {
    PKCurrencyDecimalToStorageNumber(a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v7 = v4;
      v6 = objc_msgSend(v4, "longLongValue");
      v5 = v7;
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSMutableDictionary setObject:forKey:](self->_passLastInputDictionary, "setObject:forKey:", v7, CFSTR("value"));
        v5 = v7;
      }
    }

  }
}

- (void)setWentToMax:(BOOL)a3
{
  NSMutableDictionary *passLastInputDictionary;
  id v4;

  passLastInputDictionary = self->_passLastInputDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](passLastInputDictionary, "setObject:forKey:", v4, CFSTR("wentToMax"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passLastInputDictionary, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
