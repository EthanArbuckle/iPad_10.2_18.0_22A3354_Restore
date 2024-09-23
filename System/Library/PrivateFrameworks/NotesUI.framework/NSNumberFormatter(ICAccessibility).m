@implementation NSNumberFormatter(ICAccessibility)

+ (id)icaxLocalizedUnsignedInteger:()ICAccessibility
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "icaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)icaxLocalizedDouble:()ICAccessibility
{
  return objc_msgSend(a1, "icaxLocalizedDouble:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)icaxLocalizedDouble:()ICAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "icaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)icaxLocalizedPercentage:()ICAccessibility
{
  return objc_msgSend(a1, "icaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)icaxLocalizedPercentage:()ICAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "icaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", v5, 3, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)icaxLocalizedNumber:()ICAccessibility
{
  return objc_msgSend(a1, "icaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1);
}

+ (uint64_t)icaxLocalizedNumber:()ICAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  return objc_msgSend(a1, "icaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1, a4);
}

+ (uint64_t)icaxLocalizedNumber:()ICAccessibility numberStyle:
{
  return objc_msgSend(a1, "icaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, a4, 1);
}

+ (id)icaxLocalizedNumber:()ICAccessibility numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setNumberStyle:", a4);
  objc_msgSend(v8, "setMaximumFractionDigits:", a5);
  objc_msgSend(v8, "stringFromNumber:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
