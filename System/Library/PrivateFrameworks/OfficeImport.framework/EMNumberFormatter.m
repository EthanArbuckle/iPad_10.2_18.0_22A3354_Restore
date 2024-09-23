@implementation EMNumberFormatter

+ (id)formatterForFormat:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  id v7;
  void *v8;
  EMNumberFormatter *v9;

  v3 = (__CFString *)a3;
  v4 = v3;
  v5 = CFSTR("General");
  if (v3)
    v5 = v3;
  v6 = v5;
  if (qword_255AFDB38 != -1)
    dispatch_once(&qword_255AFDB38, &__block_literal_global_4_0);
  v7 = (id)_MergedGlobals_55;
  objc_sync_enter(v7);
  objc_msgSend((id)_MergedGlobals_55, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (v4 && (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("@")) & 1) == 0)
      v9 = -[EMNumberFormatter initWithExcelFormatString:]([EMNumberFormatter alloc], "initWithExcelFormatString:", v4);
    else
      v9 = -[EMNumberFormatter initForGeneralFormatting]([EMNumberFormatter alloc], "initForGeneralFormatting");
    v8 = v9;
    objc_msgSend((id)_MergedGlobals_55, "setObject:forKey:", v9, v6);
  }
  objc_sync_exit(v7);

  return v8;
}

- (EMNumberFormatter)initWithExcelFormatString:(id)a3
{
  id v4;
  EMNumberFormatter *v5;
  EMNumberFormatter *v6;
  uint64_t v7;
  NSString *excelFormatString;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EMNumberFormatter;
  v5 = -[EMNumberFormatter init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_formatType = 0;
    v5->_isNegativeRed = 0;
    v7 = objc_msgSend(v4, "copy");
    excelFormatString = v6->_excelFormatString;
    v6->_excelFormatString = (NSString *)v7;

    -[EMNumberFormatter _parseExcelFormatString:](v6, "_parseExcelFormatString:", v4);
  }

  return v6;
}

- (int)formatType
{
  return self->_formatType;
}

- (BOOL)isNegativeRed
{
  return self->_isNegativeRed;
}

- (id)formatCurrency:(double)a3
{
  __CFNumberFormatter *v4;
  EMNumberFormatter *v5;
  __CFString *v6;
  double valuePtr;

  valuePtr = a3;
  v4 = -[EMNumberFormatter _currencyFormatter](self, "_currencyFormatter");
  v5 = self;
  objc_sync_enter(v5);
  v6 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, kCFNumberDoubleType, &valuePtr);
  objc_sync_exit(v5);

  return v6;
}

- (__CFNumberFormatter)_currencyFormatter
{
  __CFNumberFormatter *result;
  EMNumberFormatter *v4;
  const __CFAllocator *v5;
  __CFNumberFormatter *v6;
  __CFString *v7;

  result = self->_currencyFormatter;
  if (!result)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (qword_255AFDB30 != -1)
      dispatch_once(&qword_255AFDB30, &__block_literal_global_109);
    v6 = CFNumberFormatterCreate(v5, (CFLocaleRef)qword_255AFDB28, kCFNumberFormatterCurrencyStyle);
    self->_currencyFormatter = v6;
    CFNumberFormatterSetProperty(v6, (CFNumberFormatterKey)*MEMORY[0x24BDBD540], &unk_24F46A9C0);
    -[EMNumberFormatter _icuFormatStringForCurrencyFormat](v4, "_icuFormatStringForCurrencyFormat");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v7)
      CFNumberFormatterSetFormat(self->_currencyFormatter, v7);

    objc_sync_exit(v4);
    return self->_currencyFormatter;
  }
  return result;
}

- (id)formatPercent:(double)a3
{
  __CFNumberFormatter *v4;
  EMNumberFormatter *v5;
  __CFString *v6;
  double valuePtr;

  valuePtr = a3;
  v4 = -[EMNumberFormatter _percentFormatter](self, "_percentFormatter");
  v5 = self;
  objc_sync_enter(v5);
  v6 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, kCFNumberDoubleType, &valuePtr);
  objc_sync_exit(v5);

  return v6;
}

- (id)formatDefault:(double)a3
{
  return -[EMNumberFormatter formatDefault:showingNumberOfDigits:](self, "formatDefault:showingNumberOfDigits:", -[EMNumberFormatter optimalNumberOfDigitsForValue:](self, "optimalNumberOfDigitsForValue:"), a3);
}

- (void)dealloc
{
  __CFDateFormatter *dateFormatter;
  __CFNumberFormatter *genericFormatter;
  __CFNumberFormatter *currencyFormatter;
  __CFNumberFormatter *bigNumberFormatter;
  __CFNumberFormatter *percentFormatter;
  __CFNumberFormatter *doubleFormatter;
  objc_super v9;

  dateFormatter = self->_dateFormatter;
  if (dateFormatter)
    CFRelease(dateFormatter);
  genericFormatter = self->_genericFormatter;
  if (genericFormatter)
    CFRelease(genericFormatter);
  currencyFormatter = self->_currencyFormatter;
  if (currencyFormatter)
    CFRelease(currencyFormatter);
  bigNumberFormatter = self->_bigNumberFormatter;
  if (bigNumberFormatter)
    CFRelease(bigNumberFormatter);
  percentFormatter = self->_percentFormatter;
  if (percentFormatter)
    CFRelease(percentFormatter);
  doubleFormatter = self->_doubleFormatter;
  if (doubleFormatter)
    CFRelease(doubleFormatter);
  v9.receiver = self;
  v9.super_class = (Class)EMNumberFormatter;
  -[EMNumberFormatter dealloc](&v9, sel_dealloc);
}

- (id)formatDate:(id)a3
{
  const __CFDate *v4;
  __CFDateFormatter *v5;
  EMNumberFormatter *v6;
  __CFString *StringWithDate;

  v4 = (const __CFDate *)a3;
  v5 = -[EMNumberFormatter _dateFormatter](self, "_dateFormatter");
  v6 = self;
  objc_sync_enter(v6);
  StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, v4);
  objc_sync_exit(v6);

  return StringWithDate;
}

- (__CFDateFormatter)_dateFormatter
{
  __CFDateFormatter *result;
  EMNumberFormatter *v4;
  const __CFAllocator *v5;
  CFTimeZoneRef v6;
  __CFString *v7;

  result = self->_dateFormatter;
  if (!result)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (qword_255AFDB30 != -1)
      dispatch_once(&qword_255AFDB30, &__block_literal_global_109);
    self->_dateFormatter = CFDateFormatterCreate(v5, (CFLocaleRef)qword_255AFDB28, kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
    v6 = CFTimeZoneCreateWithTimeIntervalFromGMT(v5, 0.0);
    CFDateFormatterSetProperty(self->_dateFormatter, (CFStringRef)*MEMORY[0x24BDBD340], v6);
    CFRelease(v6);
    -[EMNumberFormatter _icuFormatStringForDateFormat](v4, "_icuFormatStringForDateFormat");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v7)
      CFDateFormatterSetFormat(self->_dateFormatter, v7);

    objc_sync_exit(v4);
    return self->_dateFormatter;
  }
  return result;
}

- (id)formatDoubleValue:(double)a3
{
  __CFNumberFormatter *v4;
  EMNumberFormatter *v5;
  __CFString *v6;
  double valuePtr;

  valuePtr = a3;
  v4 = -[EMNumberFormatter _doubleFormatter](self, "_doubleFormatter");
  v5 = self;
  objc_sync_enter(v5);
  v6 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, kCFNumberDoubleType, &valuePtr);
  objc_sync_exit(v5);

  return v6;
}

- (__CFNumberFormatter)_bigNumberFormatter
{
  __CFNumberFormatter *result;
  EMNumberFormatter *v4;
  const __CFAllocator *v5;
  __CFNumberFormatter *v6;

  result = self->_bigNumberFormatter;
  if (!result)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (qword_255AFDB30 != -1)
      dispatch_once(&qword_255AFDB30, &__block_literal_global_109);
    v6 = CFNumberFormatterCreate(v5, (CFLocaleRef)qword_255AFDB28, kCFNumberFormatterScientificStyle);
    self->_bigNumberFormatter = v6;
    CFNumberFormatterSetFormat(v6, CFSTR("0.0####E+00"));
    objc_sync_exit(v4);

    return self->_bigNumberFormatter;
  }
  return result;
}

- (id)formatFraction:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%1.2f"), *(_QWORD *)&a3);
}

- (id)formatPhoneNumber:(double)a3
{
  uint64_t v4;

  if (a3 >= 9999999.0)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%.3d) %.3d-%.4d"), (int)(a3 / 10000000.0), ((int)(a3 - (double)(int)(a3 / 10000000.0) * 10000000.0) / 10000), ((int)(a3 - (double)(int)(a3 / 10000000.0) * 10000000.0) % 10000));
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.3d-%.4d"), ((int)a3 / 10000), ((int)a3 % 10000), v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __40__EMNumberFormatter_formatterForFormat___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)_MergedGlobals_55;
  _MergedGlobals_55 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_55, "setName:", CFSTR("Excel Formatters cache"));
}

- (id)initForGeneralFormatting
{
  EMNumberFormatter *v2;
  EMNumberFormatter *v3;
  NSString *excelFormatString;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EMNumberFormatter;
  v2 = -[EMNumberFormatter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_formatType = 1;
    v2->_isNegativeRed = 0;
    excelFormatString = v2->_excelFormatString;
    v2->_excelFormatString = 0;

  }
  return v3;
}

- (__CFNumberFormatter)_genericFormatterForNumberOfSignificantDigits:(unint64_t)a3
{
  __CFNumberFormatter *result;
  EMNumberFormatter *v6;
  const __CFAllocator *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  __CFNumberFormatter *v12;
  const __CFAllocator *v13;
  __CFString *v14;
  unint64_t v15;
  void *v16;
  void *v17;

  if (qword_255AFDB48 != -1)
    dispatch_once(&qword_255AFDB48, &__block_literal_global_12_0);
  if (self->_baseICUFormatString)
  {
    result = self->_genericFormatter;
    if (!result)
    {
      v6 = self;
      objc_sync_enter(v6);
      v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      if (qword_255AFDB30 != -1)
        dispatch_once(&qword_255AFDB30, &__block_literal_global_109);
      self->_genericFormatter = CFNumberFormatterCreate(v7, (CFLocaleRef)qword_255AFDB28, kCFNumberFormatterDecimalStyle);
      -[EMNumberFormatter convertedGenericNumberFormatWithFormat:](v6, "convertedGenericNumberFormatWithFormat:", self->_baseICUFormatString);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNumberFormatterSetFormat(self->_genericFormatter, v8);
      CFNumberFormatterSetProperty(self->_genericFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD540], &unk_24F46A9C0);

      objc_sync_exit(v6);
      return self->_genericFormatter;
    }
  }
  else
  {
    v9 = (id)qword_255AFDB40;
    objc_sync_enter(v9);
    v10 = (void *)qword_255AFDB40;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (__CFNumberFormatter *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      if (qword_255AFDB30 != -1)
        dispatch_once(&qword_255AFDB30, &__block_literal_global_109);
      v12 = CFNumberFormatterCreate(v13, (CFLocaleRef)qword_255AFDB28, kCFNumberFormatterDecimalStyle);
      objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", a3);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendString:](v14, "appendString:", CFSTR("@"));
      v15 = a3 - 1;
      if (a3 != 1)
      {
        do
        {
          -[__CFString appendString:](v14, "appendString:", CFSTR("#"));
          --v15;
        }
        while (v15);
      }
      CFNumberFormatterSetFormat(v12, v14);
      v16 = (void *)qword_255AFDB40;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v12, v17);

    }
    objc_sync_exit(v9);

    return (__CFNumberFormatter *)CFAutorelease(v12);
  }
  return result;
}

uint64_t __67__EMNumberFormatter__genericFormatterForNumberOfSignificantDigits___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)qword_255AFDB40;
  qword_255AFDB40 = (uint64_t)v0;

  return objc_msgSend((id)qword_255AFDB40, "setName:", CFSTR("Excel Generic Formatters cache"));
}

- (__CFNumberFormatter)_doubleFormatter
{
  __CFNumberFormatter *result;
  EMNumberFormatter *v4;
  const __CFAllocator *v5;
  __CFString *v6;

  result = self->_doubleFormatter;
  if (!result)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (qword_255AFDB30 != -1)
      dispatch_once(&qword_255AFDB30, &__block_literal_global_109);
    self->_doubleFormatter = CFNumberFormatterCreate(v5, (CFLocaleRef)qword_255AFDB28, kCFNumberFormatterDecimalStyle);
    if (v4->_baseICUFormatString)
    {
      -[EMNumberFormatter convertedGenericNumberFormatWithFormat:](v4, "convertedGenericNumberFormatWithFormat:");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNumberFormatterSetFormat(self->_doubleFormatter, v6);

    }
    objc_sync_exit(v4);

    return self->_doubleFormatter;
  }
  return result;
}

- (__CFNumberFormatter)_percentFormatter
{
  __CFNumberFormatter *result;
  EMNumberFormatter *v4;
  const __CFAllocator *v5;
  __CFString *v6;

  result = self->_percentFormatter;
  if (!result)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (qword_255AFDB30 != -1)
      dispatch_once(&qword_255AFDB30, &__block_literal_global_109);
    self->_percentFormatter = CFNumberFormatterCreate(v5, (CFLocaleRef)qword_255AFDB28, kCFNumberFormatterPercentStyle);
    if (v4->_baseICUFormatString)
    {
      -[EMNumberFormatter convertedGenericNumberFormatWithFormat:](v4, "convertedGenericNumberFormatWithFormat:");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNumberFormatterSetFormat(self->_percentFormatter, v6);

    }
    objc_sync_exit(v4);

    return self->_percentFormatter;
  }
  return result;
}

- (id)_icuFormatStringForDateFormat
{
  NSString *excelFormatString;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  excelFormatString = self->_excelFormatString;
  if (!excelFormatString || -[NSString isEqualToString:](excelFormatString, "isEqualToString:", CFSTR("GenericDate")))
    return 0;
  v5 = -[NSString rangeOfString:](self->_excelFormatString, "rangeOfString:", CFSTR(";"));
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD16A8];
    -[NSString substringToIndex:](self->_excelFormatString, "substringToIndex:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", self->_excelFormatString);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("dddd"), CFSTR("EEEE"), 2, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("ddd"), CFSTR("EEE"), 2, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("aaaa"), CFSTR("EEEE"), 2, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("aaa"), CFSTR("EEE"), 2, 0, objc_msgSend(v9, "length"));
  v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("AM/PM"));
  v12 = v11;
  v13 = objc_msgSend(v9, "rangeOfString:", CFSTR("a/p"));
  v15 = v14;
  if (v12)
  {
    objc_msgSend(v9, "deleteCharactersInRange:", v10, v12);
    objc_msgSend(v9, "insertString:atIndex:", CFSTR("a"), v10);
  }
  if (v15)
  {
    objc_msgSend(v9, "deleteCharactersInRange:", v13, v15);
    objc_msgSend(v9, "insertString:atIndex:", CFSTR("a"), v13);
  }
  if (qword_255AFDB60 != -1)
    dispatch_once(&qword_255AFDB60, &__block_literal_global_44);
  if (qword_255AFDB50)
    objc_msgSend((id)qword_255AFDB50, "replaceMatchesInString:options:range:withTemplate:", v9, 0, 0, objc_msgSend(v9, "length"), CFSTR("$1"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("m"), CFSTR("M"), 2, 0, objc_msgSend(v9, "length"));
  if (qword_255AFDB58)
  {
    objc_msgSend((id)qword_255AFDB58, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v16);
          v20 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "range");
          objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("M"), CFSTR("m"), 2, v20, v21);
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v17);
    }

  }
  if (!(v15 | v12))
    objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("h"), CFSTR("H"), 2, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), &stru_24F3BFFF8, 2, 0, objc_msgSend(v9, "length"));
  v22 = (void *)MEMORY[0x24BDD1500];
  if (qword_255AFDB30 != -1)
    dispatch_once(&qword_255AFDB30, &__block_literal_global_109);
  objc_msgSend(v22, "dateFormatFromTemplate:options:locale:", CFSTR("yMd"), 0, qword_255AFDB28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "rangeOfString:", CFSTR("d"));
  v25 = objc_msgSend(v23, "rangeOfString:", CFSTR("M"));
  v26 = objc_msgSend(v23, "rangeOfString:", CFSTR("y"));
  if (objc_msgSend(v9, "rangeOfString:", CFSTR("MM")) == 0x7FFFFFFFFFFFFFFFLL
    && v24 != 0x7FFFFFFFFFFFFFFFLL
    && v25 != 0x7FFFFFFFFFFFFFFFLL
    && v24 < v25
    && (v26 == 0x7FFFFFFFFFFFFFFFLL || v26 > v25))
  {
    objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("M/d"), CFSTR("d/M"), 2, 0, objc_msgSend(v9, "length"));
  }
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("ggge"), CFSTR("Gy"), 2, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("gge"), CFSTR("Gy"), 2, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("ge"), CFSTR("Gy"), 2, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\\"), CFSTR("===////"), 2, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), &stru_24F3BFFF8, 2, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("===////"), CFSTR("\\\"), 2, 0, objc_msgSend(v9, "length"));
  v29 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\[\\$\\-.*\\]"), 1, &v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v29;
  if (v27)
    objc_msgSend(v27, "replaceMatchesInString:options:range:withTemplate:", v9, 0, 0, objc_msgSend(v9, "length"), &stru_24F3BFFF8);

  return v9;
}

void __50__EMNumberFormatter__icuFormatStringForDateFormat__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("\\[(h|m|s)\\]"), 0, &v7);
  v1 = v7;
  v2 = (void *)qword_255AFDB50;
  qword_255AFDB50 = v0;

  if (!qword_255AFDB50)
    NSLog((NSString *)CFSTR("Unable to compile hmsBrackets regex: %@"), v1);
  v6 = v1;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("([Hh][^MmHhs]*[M]{1,2})|([M]{1,2}[^MmHhs]*s)"), 0, &v6);
  v4 = v6;

  v5 = (void *)qword_255AFDB58;
  qword_255AFDB58 = v3;

  if (!qword_255AFDB58)
    NSLog((NSString *)CFSTR("Unable to compile mMinute regex: %@"), v4);

}

- (id)_icuFormatStringForCurrencyFormat
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v8;

  v3 = (void *)-[NSString mutableCopy](self->_baseICUFormatString, "mutableCopy");
  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\[\\$([^-;]+)-{0,1}[^\\];]*?\\]"),
      1,
      &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v4)
      objc_msgSend(v4, "replaceMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), CFSTR("\"$1\"));
    -[EMNumberFormatter convertGenericNumberFormat:](self, "convertGenericNumberFormat:", v3);
    v6 = v3;

  }
  return v3;
}

- (unint64_t)optimalNumberOfDigitsForValue:(double)a3
{
  if (round(a3) == a3)
    return 11;
  else
    return 10;
}

- (BOOL)useBigNumberFormatterForValue:(double)a3
{
  BOOL result;
  BOOL v4;

  if (round(a3) == a3)
    return a3 <= -1.0e11 || a3 >= 1.0e11;
  result = 1;
  if (a3 <= 1.0e10 && a3 >= -1.0e10)
  {
    v4 = a3 != 0.0;
    if (a3 >= 0.000000001)
      v4 = 0;
    return a3 > -0.000000001 && v4;
  }
  return result;
}

- (id)formatDefault:(double)a3 showingNumberOfDigits:(unint64_t)a4
{
  __CFNumberFormatter *v7;
  uint64_t v8;
  __CFNumberFormatter *v9;
  EMNumberFormatter *v10;
  __CFString *v11;
  double valuePtr;

  valuePtr = a3;
  if (-[EMNumberFormatter useBigNumberFormatterForValue:](self, "useBigNumberFormatterForValue:"))
  {
    v7 = -[EMNumberFormatter _bigNumberFormatter](self, "_bigNumberFormatter");
  }
  else
  {
    LODWORD(v8) = a3 > -1.0;
    if (a3 >= 1.0)
      LODWORD(v8) = 0;
    if (a4 > 1)
      v8 = v8;
    else
      v8 = 0;
    v7 = -[EMNumberFormatter _genericFormatterForNumberOfSignificantDigits:](self, "_genericFormatterForNumberOfSignificantDigits:", a4 - v8);
  }
  v9 = v7;
  v10 = self;
  objc_sync_enter(v10);
  v11 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, kCFNumberDoubleType, &valuePtr);
  objc_sync_exit(v10);

  return v11;
}

- (void)convertGenericNumberFormat:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (qword_255AFDB80 != -1)
  {
    dispatch_once(&qword_255AFDB80, &__block_literal_global_108);
    v4 = v7;
  }
  objc_msgSend((id)qword_255AFDB68, "replaceMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v4, "length"), CFSTR(" "));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\%"), CFSTR("'%'"), 2, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), &stru_24F3BFFF8, 2, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), &stru_24F3BFFF8, 2, 0, objc_msgSend(v7, "length"));
  objc_msgSend((id)qword_255AFDB78, "replaceMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), CFSTR("$1 -"));
  if (self->_hasLocales)
    objc_msgSend((id)qword_255AFDB70, "replaceMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), &stru_24F3BFFF8);
  v5 = objc_msgSend(v7, "rangeOfString:", CFSTR(";"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = objc_msgSend(v7, "rangeOfString:options:range:", CFSTR(";"), 0, v5 + 1, objc_msgSend(v7, "length") + ~v5);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v7, "deleteCharactersInRange:", v6, objc_msgSend(v7, "length") - v6);
  }

}

void __48__EMNumberFormatter_convertGenericNumberFormat___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("_."), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_255AFDB68;
  qword_255AFDB68 = v0;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\[\\$.*?\\]"), 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_255AFDB70;
  qword_255AFDB70 = v2;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([^;])\\* -"), 0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_255AFDB78;
  qword_255AFDB78 = v4;

}

- (id)convertedGenericNumberFormatWithFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    -[EMNumberFormatter convertGenericNumberFormat:](self, "convertGenericNumberFormat:", v6);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_parseExcelFormatString:(id)a3
{
  NSString *baseICUFormatString;
  XlFormatInfo *FormatInfo;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  int v11;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSString *v16;
  NSString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int **v23;
  int **v24;
  int v25;
  id obj;
  XlFormatInfo *v27;
  OcText v28;

  obj = a3;
  if (objc_msgSend(obj, "isEqualToString:", CFSTR("GenericDate")))
  {
    self->_formatType = 8;
    baseICUFormatString = self->_baseICUFormatString;
    self->_baseICUFormatString = 0;

    return;
  }
  self->_formatType = 0;
  if (!obj)
  {
    v12 = self->_baseICUFormatString;
    self->_baseICUFormatString = 0;

    return;
  }
  if (qword_255AFDB90 != -1)
    dispatch_once(&qword_255AFDB90, &__block_literal_global_123_1);
  OcText::OcText(&v28);
  objc_msgSend(obj, "copyToOcText:", &v28);
  FormatInfo = (XlFormatInfo *)XlFormatProcessor::getFormatInfo((XlFormatProcessor *)qword_255AFDB88, &v28);
  v27 = FormatInfo;
  if (FormatInfo)
  {
    v6 = *((_QWORD *)FormatInfo + 1);
    v7 = *((_QWORD *)FormatInfo + 2) - v6;
    v8 = (unsigned __int16)(v7 >> 3);
    if ((unsigned __int16)(v7 >> 3))
    {
      v9 = v7 >> 3;
      if (!(v7 >> 3))
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      v10 = *(_BYTE **)v6;
      if ((unsigned __int16)(v7 >> 3) == 1)
      {
        if (*v10 && ((*((_QWORD *)v10 + 10) - *((_QWORD *)v10 + 9)) & 0x7FFFFFFF8) == 8)
        {
          v11 = 1;
LABEL_49:
          self->_formatType = v11;
          goto LABEL_50;
        }
      }
      else
      {
        if (v9 <= 1)
          std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
        v13 = *(_QWORD *)(v6 + 8);
        if (*(_BYTE *)(v13 + 10) && *(_WORD *)(v13 + 42) == 2)
        {
          objc_msgSend(obj, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[Red]"), &stru_24F3BFFF8, 2, 0, objc_msgSend(obj, "length"));
          v14 = objc_claimAutoreleasedReturnValue();

          self->_isNegativeRed = 1;
          v6 = *((_QWORD *)v27 + 1);
          v15 = (unint64_t)(*((_QWORD *)v27 + 2) - v6) >> 3;
          obj = (id)v14;
          goto LABEL_19;
        }
      }
      v15 = v7 >> 3;
LABEL_19:
      v15 = v15;
      do
      {
        if (!v15)
          std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
        if (**(_BYTE **)v6)
        {
          self->_formatType = 1;
          objc_msgSend(obj, "stringByReplacingOccurrencesOfString:withString:", CFSTR("General"), CFSTR("@#########"));
          v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          v17 = self->_baseICUFormatString;
          self->_baseICUFormatString = v16;

          goto LABEL_50;
        }
        v6 += 8;
        --v15;
        --v8;
      }
      while (v8);
      if ((unsigned __int16)(v7 >> 3) == 2
        && v10[11]
        && *((double *)v10 + 2) == 9999999.0
        && *((_DWORD *)v10 + 11) == 3
        && *((_WORD *)v10 + 18) == 7)
      {
        v11 = 3;
      }
      else
      {
        objc_storeStrong((id *)&self->_baseICUFormatString, obj);
        v18 = 0;
        self->_formatType = 10;
        v19 = *((_QWORD *)v27 + 1);
        v20 = ((unint64_t)(*((_QWORD *)v27 + 2) - v19) >> 3);
        if ((v9 & 0xFFFE) != 0)
          v21 = (unsigned __int16)(v7 >> 3);
        else
          v21 = 1;
        while (1)
        {
          if (v18 == v20)
            std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
          v22 = *(_QWORD *)(v19 + 8 * v18);
          if (*(_BYTE *)(v22 + 2))
          {
            v11 = 8;
            goto LABEL_49;
          }
          if (*(_BYTE *)(v22 + 4))
          {
            v11 = 9;
            goto LABEL_49;
          }
          if (*(_BYTE *)(v22 + 5))
            break;
          v23 = *(int ***)(v22 + 72);
          v24 = *(int ***)(v22 + 80);
          while (v23 != v24)
          {
            v25 = **v23;
            if (v25 == 78)
            {
              self->_hasLocales = 1;
            }
            else if (v25 == 51)
            {
              self->_formatType = 4;
            }
            ++v23;
          }
          if (++v18 == v21)
            goto LABEL_50;
        }
        v11 = 5;
      }
      goto LABEL_49;
    }
  }
LABEL_50:
  ChAutoPtr<XlFormatInfo>::~ChAutoPtr(&v27);
  OcText::~OcText(&v28);

}

void __45__EMNumberFormatter__parseExcelFormatString___block_invoke()
{
  XlFormatProcessor *v0;

  v0 = (XlFormatProcessor *)operator new();
  XlFormatProcessor::XlFormatProcessor(v0);
  qword_255AFDB88 = (uint64_t)v0;
}

- (id)formatValue:(double)a3 inWorkbook:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = 0;
  switch(self->_formatType)
  {
    case 0:
      goto LABEL_10;
    case 1:
    case 0xA:
      -[EMNumberFormatter formatDefault:](self, "formatDefault:", a3);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      -[EMNumberFormatter formatPhoneNumber:](self, "formatPhoneNumber:", a3);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      -[EMNumberFormatter formatCurrency:](self, "formatCurrency:", a3);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      -[EMNumberFormatter formatPercent:](self, "formatPercent:", a3);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 8:
      +[ECUtils dateFromXlDateTimeNumber:edWorkbook:](ECUtils, "dateFromXlDateTimeNumber:edWorkbook:", v6, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMNumberFormatter formatDate:](self, "formatDate:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 9:
      -[EMNumberFormatter formatFraction:](self, "formatFraction:", a3);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
      -[EMNumberFormatter formatDoubleValue:](self, "formatDoubleValue:", a3);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = (void *)v8;
LABEL_10:

      return v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseICUFormatString, 0);
  objc_storeStrong((id *)&self->_excelFormatString, 0);
}

@end
