@implementation TSUNumberOrDateOrDurationFormatter

- (TSUNumberOrDateOrDurationFormatter)init
{
  TSUNumberOrDateOrDurationFormatter *v2;
  NSNumberFormatter *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUNumberOrDateOrDurationFormatter;
  v2 = -[TSUNumberOrDateOrDurationFormatter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    v2->mNumberFormatter = v3;
    -[NSNumberFormatter setFormatterBehavior:](v3, "setFormatterBehavior:", 1040);
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    -[NSNumberFormatter setDecimalSeparator:](v2->mNumberFormatter, "setDecimalSeparator:", objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCB00]));
    -[NSNumberFormatter setGroupingSeparator:](v2->mNumberFormatter, "setGroupingSeparator:", objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCB10]));
    -[NSNumberFormatter setPositiveFormat:](v2->mNumberFormatter, "setPositiveFormat:", CFSTR("#.#########"));
    -[NSNumberFormatter setZeroSymbol:](v2->mNumberFormatter, "setZeroSymbol:", CFSTR("0"));
    -[NSNumberFormatter setNegativeFormat:](v2->mNumberFormatter, "setNegativeFormat:", CFSTR("-#.#########"));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->mNumberFormatter = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUNumberOrDateOrDurationFormatter;
  -[TSUNumberOrDateOrDurationFormatter dealloc](&v3, sel_dealloc);
}

- (id)stringForObjectValue:(id)a3
{
  CFAbsoluteTime v6;
  const __CFTimeZone *v7;
  CFGregorianDate GregorianDate;
  __CFString *v9;
  const __CFString *v10;
  double v11;
  double v12;
  unsigned int v13;
  void *v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)-[NSNumberFormatter stringForObjectValue:](self->mNumberFormatter, "stringForObjectValue:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = MEMORY[0x219A015DC](a3);
    v7 = TSUGetGMTTimeZone();
    GregorianDate = CFAbsoluteTimeGetGregorianDate(v6, v7);
    v9 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterShortStyle, (CFDateFormatterStyle)(2* ((*(_QWORD *)&GregorianDate.second & 0x7FFFFFFFFFFFFFFFLL | HIWORD(*(_QWORD *)&GregorianDate.year)) != 0)));
    v10 = TSUDateFormatterStringFromDateWithFormat((const __CFDate *)a3, v9);

    return (id)v10;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "timeInterval");
      v12 = v11;
      v13 = TSUDurationFormatterDurationUnitsNecessaryToFullyDisplayDuration(2, 1, v11);
      v14 = TSUDurationFormatterFormatFromDurationUnits(v13, 1u, 0);
      return (id)TSUDurationFormatterStringFromTimeIntervalWithFormat(v14, v12);
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8;
  int v9;
  double v11;
  double v12;

  v8 = (id)TSUCreateDateFromString((uint64_t)a4, 0, 0);
  if (v8)
  {
    if (!a3)
      goto LABEL_8;
    goto LABEL_7;
  }
  v12 = 0.0;
  if (TSUGetNumberValueAndTypeFromString((const __CFString *)a4, 0, (uint64_t)&v12, 0, 0, 0))
  {
    if (!a3)
    {
LABEL_8:
      LOBYTE(v9) = 1;
      return v9;
    }
    v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
LABEL_7:
    *a3 = v8;
    goto LABEL_8;
  }
  v11 = 0.0;
  v9 = TSUDurationFormatterTimeIntervalFromString(a4, &v11, 0, 0);
  if (v9)
  {
    if (a3)
      *a3 = +[TSUDuration durationWithTimeInterval:](TSUDuration, "durationWithTimeInterval:", v11);
  }
  else if (a5)
  {
    *a5 = CFSTR("Failed to parse a number, date, or duration!");
  }
  return v9;
}

@end
