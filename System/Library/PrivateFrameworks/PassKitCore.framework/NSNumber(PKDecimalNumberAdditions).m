@implementation NSNumber(PKDecimalNumberAdditions)

- (BOOL)pk_isIntegralNumber
{
  _BOOL8 result;
  NSDecimal v2;
  NSDecimal number;

  memset(&number, 0, sizeof(number));
  objc_msgSend(a1, "decimalValue");
  result = 0;
  if ((*(_WORD *)&number & 0x1F00) != 0x1000)
  {
    memset(&v2, 0, sizeof(v2));
    NSDecimalRound(&v2, &number, 0, NSRoundPlain);
    return NSDecimalCompare(&v2, &number) == NSOrderedSame;
  }
  return result;
}

- (BOOL)pk_isNegativeNumber
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "pk_isNotANumber") & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(a1, "compare:", v3) == -1;

  return v2;
}

- (BOOL)pk_isPositiveNumber
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "pk_isNotANumber") & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(a1, "compare:", v3) == 1;

  return v2;
}

- (BOOL)pk_isZeroNumber
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "pk_isNotANumber") & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(a1, "compare:", v3) == 0;

  return v2;
}

- (BOOL)pk_isNotANumber
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compare:", v2) == 0;

  return v3;
}

@end
