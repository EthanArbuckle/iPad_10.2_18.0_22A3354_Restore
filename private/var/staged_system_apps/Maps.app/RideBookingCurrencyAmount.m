@implementation RideBookingCurrencyAmount

- (RideBookingCurrencyAmount)initWithAmount:(id)a3 currencyCode:(id)a4
{
  id v6;
  id v7;
  RideBookingCurrencyAmount *v8;
  NSDecimalNumber *v9;
  NSDecimalNumber *amount;
  NSString *v11;
  NSString *currencyCode;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RideBookingCurrencyAmount;
  v8 = -[RideBookingCurrencyAmount init](&v14, "init");
  if (v8)
  {
    v9 = (NSDecimalNumber *)objc_msgSend(v6, "copy");
    amount = v8->_amount;
    v8->_amount = v9;

    v11 = (NSString *)objc_msgSend(v7, "copy");
    currencyCode = v8->_currencyCode;
    v8->_currencyCode = v11;

  }
  return v8;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

- (NSString)formattedString
{
  return (NSString *)-[RideBookingCurrencyAmount formattedStringIncludeSymbol:](self, "formattedStringIncludeSymbol:", 1);
}

- (id)formattedStringIncludeSymbol:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RideBookingCurrencyAmount amount](self, "amount"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingCurrencyAmount currencyCode](self, "currencyCode")),
        v7,
        v6,
        v7))
  {
    if (qword_1014D3618 != -1)
      dispatch_once(&qword_1014D3618, &stru_1011D9010);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingCurrencyAmount currencyCode](self, "currencyCode"));
    objc_msgSend((id)qword_1014D3610, "setCurrencyCode:", v8);

    if (v3)
      v9 = 0;
    else
      v9 = &stru_1011EB268;
    objc_msgSend((id)qword_1014D3610, "setCurrencySymbol:", v9);
    v11 = (void *)qword_1014D3610;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingCurrencyAmount amount](self, "amount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringFromNumber:", v12));

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (NSString)currencySymbol
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingCurrencyAmount currencyCode](self, "currencyCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingCurrencyAmount _currencySymbolForCode:](RideBookingCurrencyAmount, "_currencySymbolForCode:", v2));

  return (NSString *)v3;
}

+ (id)_localeForCode:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale availableLocaleIdentifiers](NSLocale, "availableLocaleIdentifiers"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        v10 = objc_alloc((Class)NSLocale);
        v11 = objc_msgSend(v10, "initWithLocaleIdentifier:", v9, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", NSLocaleCurrencyCode));
        if (objc_msgSend(v12, "isEqualToString:", v3))
        {

          goto LABEL_11;
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (id)_currencySymbolForCode:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSNumberFormatter);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_localeForCode:", v4));

  if (v6)
  {
    objc_msgSend(v5, "setLocale:", v6);
    objc_msgSend(v5, "setNumberStyle:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currencySymbol"));
    if ((unint64_t)objc_msgSend(v7, "length") >= 2)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringToIndex:", 1));

      v7 = (void *)v8;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
