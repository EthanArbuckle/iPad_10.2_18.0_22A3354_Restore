@implementation WBSCreditCardSecurityCodeFormatter

- (id)stringForObjectValue:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    +[WBSCreditCardSecurityCodeFormatter _normalizedSecurityCode:](WBSCreditCardSecurityCodeFormatter, "_normalizedSecurityCode:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v7 != 0;
    if (a3 && v7)
      *a3 = objc_retainAutorelease(v7);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    +[WBSCreditCardSecurityCodeFormatter _normalizedSecurityCode:](WBSCreditCardSecurityCodeFormatter, "_normalizedSecurityCode:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v7 != 0;
    if (v7)
    {
      if (a4)
      {
        v10 = objc_retainAutorelease(v7);
LABEL_8:
        *a4 = v10;
      }
    }
    else if (a4)
    {
      v10 = 0;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  v9 = 1;
LABEL_10:

  return v9;
}

+ (id)_normalizedSecurityCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  if (objc_msgSend(v3, "length")
    && (objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        !v6))
  {
    v7 = v3;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
