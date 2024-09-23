@implementation TIAnalyticsUtil

+ (id)bucketRatioWithValue:(double)a3 bucketCount:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a3 == -1.0)
  {
    *(_QWORD *)&a4 = 0xFFFFFFFFLL;
  }
  else
  {
    if (a3 < 0.0)
      a3 = 0.0;
    if (a3 > 1.0)
      a3 = 1.0;
    a4 = llround(a3 * (double)a4);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a4, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)bucketPercentageWithValue:(double)a3
{
  return +[TIAnalyticsUtil bucketRatioWithValue:bucketCount:](TIAnalyticsUtil, "bucketRatioWithValue:bucketCount:", 100, a3);
}

+ (BOOL)isString:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)isInteger:(id)a3
{
  id v3;
  CFTypeID v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v4 = CFGetTypeID(v3), v4 != CFBooleanGetTypeID())
    && memchr("BcsilqCSILQ", *(char *)objc_msgSend(objc_retainAutorelease(v3), "objCType"), 0xCuLL) != 0;

  return v5;
}

+ (BOOL)isFloat:(id)a3
{
  id v3;
  CFTypeID v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v4 = CFGetTypeID(v3), v4 != CFBooleanGetTypeID())
    && memchr("fd", *(char *)objc_msgSend(objc_retainAutorelease(v3), "objCType"), 3uLL) != 0;

  return v5;
}

+ (BOOL)isNumber:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[TIAnalyticsUtil isInteger:](TIAnalyticsUtil, "isInteger:", v3)
    || +[TIAnalyticsUtil isFloat:](TIAnalyticsUtil, "isFloat:", v3);

  return v4;
}

+ (BOOL)isBoolean:(id)a3
{
  id v3;
  CFTypeID v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFGetTypeID(v3);
    v5 = v4 == CFBooleanGetTypeID();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isArray:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)isDictionary:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)toInteger:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "intValue"));
}

+ (id)toFloat:(id)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "floatValue");
  return (id)objc_msgSend(v3, "numberWithFloat:");
}

+ (id)roundCount:(id)a3 toSignificantDigits:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIAnalyticsUtil roundNumber:toSignificantDigits:](TIAnalyticsUtil, "roundNumber:toSignificantDigits:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)roundNumber:(id)a3 toSignificantDigits:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = +[TIAnalyticsUtil isInteger:](TIAnalyticsUtil, "isInteger:", v5);
    objc_msgSend(v5, "doubleValue");
    if (v8 == 0.0)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      if (v7)
      {
        v10 = 0;
LABEL_8:
        objc_msgSend(v9, "numberWithInt:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v16 = 0.0;
    }
    else
    {
      v12 = v8;
      v13 = objc_msgSend(v6, "intValue");
      v14 = log10(fabs(v12));
      v15 = __exp10((double)(int)(v13 - vcvtpd_s64_f64(v14)));
      v16 = round(v12 * v15) / v15;
      v9 = (void *)MEMORY[0x1E0CB37E8];
      if (v7)
      {
        v10 = (int)v16;
        goto LABEL_8;
      }
    }
    objc_msgSend(v9, "numberWithDouble:", v16);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v11 = v5;
LABEL_11:
  v17 = v11;

  return v17;
}

+ (id)constrainInteger:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(a3, "intValue");
  if (v7)
  {
    v10 = objc_msgSend(v7, "intValue");
    if ((int)v9 <= v10)
      v9 = v10;
    else
      v9 = v9;
  }
  if (v8)
  {
    v11 = objc_msgSend(v8, "intValue");
    if ((int)v9 >= v11)
      v9 = v11;
    else
      v9 = v9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)bucketNumber:(id)a3 bucketThresholds:(id)a4 bucketValues:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    if (v9)
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    else
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v13 = 0;
      while (1)
      {
        objc_msgSend(v7, "doubleValue");
        v15 = v14;
        objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        if (v15 < v18)
          break;
        ++v13;
        if (v10)
          objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
        else
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        v12 = v11;
        if (objc_msgSend(v8, "count") == v13)
          goto LABEL_15;
      }
    }
    v11 = v12;
  }
  else
  {
    v11 = v7;
  }
LABEL_15:

  return v11;
}

+ (id)bucketRatioWithNumber:(id)a3 bucketCount:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a3, "doubleValue");
  return +[TIAnalyticsUtil bucketRatioWithValue:bucketCount:](TIAnalyticsUtil, "bucketRatioWithValue:bucketCount:", v4);
}

+ (id)bucketRatioWithNumerator:(id)a3 andDenominator:(id)a4 bucketCount:(int)a5
{
  uint64_t v5;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v5 = *(_QWORD *)&a5;
  v7 = a4;
  objc_msgSend(a3, "doubleValue");
  v9 = v8;
  objc_msgSend(v7, "doubleValue");
  v11 = v10;

  if (v9 < 0.0 || v11 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[TIAnalyticsUtil bucketRatioWithValue:bucketCount:](TIAnalyticsUtil, "bucketRatioWithValue:bucketCount:", v5, v9 / v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

+ (id)bucketPercentageWithNumber:(id)a3
{
  return +[TIAnalyticsUtil bucketRatioWithNumber:bucketCount:](TIAnalyticsUtil, "bucketRatioWithNumber:bucketCount:", a3, 100);
}

+ (id)bucketPercentageWithNumerator:(id)a3 andDenominator:(id)a4
{
  return +[TIAnalyticsUtil bucketRatioWithNumerator:andDenominator:bucketCount:](TIAnalyticsUtil, "bucketRatioWithNumerator:andDenominator:bucketCount:", a3, a4, 100);
}

+ (int)computeCommonExtentForArrays:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  id *v11;
  id v12;
  int v13;
  id *v15;
  uint64_t v16;

  v15 = (id *)&v16;
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = -1;
    v6 = -1;
    v7 = v3;
    do
    {
      v8 = objc_msgSend(v7, "count");
      if (v5 >= v8)
        v9 = v8;
      else
        v9 = v5;
      if (v6 <= v8)
        v10 = v8;
      else
        v10 = v6;
      if (v5 == -1)
        v6 = v8;
      else
        v6 = v10;
      if (v5 == -1)
        v5 = v8;
      else
        v5 = v9;
      v11 = v15++;
      v12 = *v11;

      v7 = v12;
    }
    while (v12);
  }
  else
  {
    v6 = -1;
    v5 = -1;
  }
  if (v5 == v6)
    v13 = v5;
  else
    v13 = -1;

  return v13;
}

+ (id)indexesForValidRatiosInArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__TIAnalyticsUtil_indexesForValidRatiosInArray___block_invoke;
  v7[3] = &unk_1E243B358;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

+ (id)createStringByReplacingStylizedQuotesToStraightQuotes:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
}

+ (BOOL)isStylizedString:(id)a3 equalToString:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "createStringByReplacingStylizedQuotesToStraightQuotes:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v7, "isEqualToString:", v6);

  return (char)a1;
}

+ (BOOL)hasNonWhitespaceNonPunctuationText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "length") != 0;
  return (char)v7;
}

+ (BOOL)isReportableClientId:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (isReportableClientId__onceToken != -1)
      dispatch_once(&isReportableClientId__onceToken, &__block_literal_global_10591);
    v5 = (void *)isReportableClientId__topThirdPartyBundleIds;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v3, "hash"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v6);

  }
  return v4;
}

void __40__TIAnalyticsUtil_isReportableClientId___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E24C0CD0, &unk_1E24C0CE8, &unk_1E24C0D00, &unk_1E24C0D18, &unk_1E24C0D30, &unk_1E24C0D48, &unk_1E24C0D60, &unk_1E24C0D78, &unk_1E24C0D90, &unk_1E24C0DA8, &unk_1E24C0DC0, &unk_1E24C0DD8, &unk_1E24C0DF0, &unk_1E24C0E08, &unk_1E24C0E20, &unk_1E24C0E38, &unk_1E24C0E50,
    &unk_1E24C0E68,
    &unk_1E24C0E80,
    &unk_1E24C0E98,
    &unk_1E24C0EB0,
    &unk_1E24C0EC8,
    &unk_1E24C0EE0,
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isReportableClientId__topThirdPartyBundleIds;
  isReportableClientId__topThirdPartyBundleIds = v0;

}

uint64_t __48__TIAnalyticsUtil_indexesForValidRatiosInArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  double v6;

  result = objc_msgSend(a2, "doubleValue");
  if (v6 >= 0.0)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  return result;
}

@end
