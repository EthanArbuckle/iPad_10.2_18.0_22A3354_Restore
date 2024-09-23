@implementation NSDecimalNumber(PKDecimalNumberAdditions)

+ (id)pk_negativeOne
{
  if (qword_1ECF21CE8 != -1)
    dispatch_once(&qword_1ECF21CE8, &__block_literal_global_145);
  return (id)qword_1ECF21CE0;
}

- (id)pk_absoluteValue
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compare:", v2);

  if (v3 == -1)
  {
    objc_msgSend(a1, "pk_negativeValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = a1;
  }
  return v4;
}

- (id)pk_negativeValue
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isEqualToNumber:", v2))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(a1, "isEqualToNumber:", v3);

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "pk_negativeOne");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "decimalNumberByMultiplyingBy:", v6);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      return v5;
    }
  }
  v5 = a1;
  return v5;
}

- (BOOL)pk_isLessThanOrEqualToInteger:()PKDecimalNumberAdditions
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compare:", v2);

  return (unint64_t)(v3 + 1) < 2;
}

@end
