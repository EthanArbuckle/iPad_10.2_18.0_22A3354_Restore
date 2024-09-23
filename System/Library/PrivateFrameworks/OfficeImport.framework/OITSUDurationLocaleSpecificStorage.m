@implementation OITSUDurationLocaleSpecificStorage

- (OITSUDurationLocaleSpecificStorage)initWithLocale:(id)a3
{
  OITSUDurationLocaleSpecificStorage *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OITSUDurationLocaleSpecificStorage;
  v4 = -[OITSUDurationLocaleSpecificStorage init](&v8, sel_init);
  if (v4)
  {
    v4->_emptyCharacterSet = (NSCharacterSet *)(id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", &stru_24F3BFFF8);
    v4->_minusSignCharacterSet = (NSCharacterSet *)(id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-"));
    v4->_alphabeticCharacterSet = (NSCharacterSet *)(id)objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
    v4->_decimalDigitCharacterSet = (NSCharacterSet *)(id)objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v4->_whitespaceCharacterSet = (NSCharacterSet *)(id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v4->_whitespaceAndNewlineCharacterSet = (NSCharacterSet *)(id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v4->_specialDurationFormatCharacters = (NSCharacterSet *)(id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("wdhmsf"));
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithCharactersInString:", CFSTR(":."));
    objc_msgSend(v5, "addCharactersInString:", objc_msgSend(a3, "decimalSeparator"));
    v4->_separatorPunctuationCharacterSet = (NSCharacterSet *)objc_msgSend(v5, "copy");
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD1690], "decimalDigitCharacterSet");
    objc_msgSend(v6, "addCharactersInString:", objc_msgSend(a3, "decimalSeparator"));
    objc_msgSend(v6, "addCharactersInString:", objc_msgSend(a3, "groupingSeparator"));
    v4->_decimalDigitAndSeperatorsCharacterSet = (NSCharacterSet *)objc_msgSend(v6, "copy");
    v4->_weekLongSingularString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("week"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_weekLongPluralString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("weeks"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_weekMediumSingularString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("wk"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_weekMediumPluralString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("wks"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_weekShortString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("w"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_dayLongSingularString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("day"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_dayLongPluralString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("days"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_dayMediumSingularString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("day"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_dayMediumPluralString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("days"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_dayShortString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("d"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_hourLongSingularString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("hour"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_hourLongPluralString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("hours"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_hourMediumSingularString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("hr"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_hourMediumPluralString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("hrs"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_hourShortString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("h"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_minuteLongSingularString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("minute"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_minuteLongPluralString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("minutes"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_minuteMediumSingularString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("min"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_minuteMediumPluralString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("mins"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_minuteShortString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("m"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_secondLongSingularString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("second"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_secondLongPluralString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("seconds"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_secondMediumSingularString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("sec"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_secondMediumPluralString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("secs"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_secondShortString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("s"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_millisecondLongSingularString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("millisecond"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_millisecondLongPluralString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("milliseconds"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v4->_millisecondShortString = (NSString *)(id)objc_msgSend(a3, "localizedStringForKey:value:table:", CFSTR("ms"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_weekLongSingularString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_weekLongPluralString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_weekMediumSingularString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_weekMediumPluralString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_weekShortString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_dayLongSingularString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_dayLongPluralString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_dayMediumSingularString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_dayMediumPluralString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_dayShortString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_hourLongSingularString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_hourLongPluralString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_hourMediumSingularString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_hourMediumPluralString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_hourShortString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_minuteLongSingularString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_minuteLongPluralString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_minuteMediumSingularString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_minuteMediumPluralString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_minuteShortString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_secondLongSingularString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_secondLongPluralString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_secondMediumSingularString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_secondMediumPluralString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_secondShortString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_millisecondLongSingularString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_millisecondLongPluralString);
    -[OITSUDurationLocaleSpecificStorage addDurationUnit:](v4, "addDurationUnit:", v4->_millisecondShortString);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUDurationLocaleSpecificStorage;
  -[OITSUDurationLocaleSpecificStorage dealloc](&v3, sel_dealloc);
}

- (void)addDurationUnit:(id)a3
{
  void *v4;
  NSMutableArray *multiWordDurationUnitStrings;
  NSMutableArray *fullStopDurationUnitStrings;

  v4 = (void *)objc_msgSend(a3, "stringByTrimmingCharactersInSet:", self->_whitespaceCharacterSet);
  if (objc_msgSend(v4, "rangeOfString:", CFSTR(" ")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    multiWordDurationUnitStrings = self->_multiWordDurationUnitStrings;
    if (!multiWordDurationUnitStrings)
    {
      multiWordDurationUnitStrings = (NSMutableArray *)objc_opt_new();
      self->_multiWordDurationUnitStrings = multiWordDurationUnitStrings;
    }
    -[NSMutableArray addObject:](multiWordDurationUnitStrings, "addObject:", v4);
  }
  if (objc_msgSend(v4, "rangeOfString:", CFSTR(".")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    fullStopDurationUnitStrings = self->_fullStopDurationUnitStrings;
    if (!fullStopDurationUnitStrings)
    {
      fullStopDurationUnitStrings = (NSMutableArray *)objc_opt_new();
      self->_fullStopDurationUnitStrings = fullStopDurationUnitStrings;
    }
    -[NSMutableArray addObject:](fullStopDurationUnitStrings, "addObject:", v4);
  }
}

+ (id)localeSpecificStorageForLocale:(id)a3
{
  id v3;
  uint64_t v5;
  OITSUDurationLocaleSpecificStorage *v6;

  v3 = a3;
  if (!a3)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OITSUDurationLocaleSpecificStorage localeSpecificStorageForLocale:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDurationFormatter.m"), 347, 0, "No locale passed in, falling to back current locale.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v3 = +[OITSULocale currentLocale](OITSULocale, "currentLocale");
  }
  v6 = (OITSUDurationLocaleSpecificStorage *)objc_msgSend(v3, "localeSpecificStorageForKey:", CFSTR("durationFormatterLocaleStorageKey"));
  if (!v6)
  {
    objc_sync_enter(a1);
    v6 = -[OITSUDurationLocaleSpecificStorage initWithLocale:]([OITSUDurationLocaleSpecificStorage alloc], "initWithLocale:", v3);
    objc_msgSend(v3, "setLocaleSpecificStorage:forKey:", v6, CFSTR("durationFormatterLocaleStorageKey"));
    objc_sync_exit(a1);
  }
  return v6;
}

- (NSString)weekLongSingularString
{
  return self->_weekLongSingularString;
}

- (NSString)weekLongPluralString
{
  return self->_weekLongPluralString;
}

- (NSString)weekMediumSingularString
{
  return self->_weekMediumSingularString;
}

- (NSString)weekMediumPluralString
{
  return self->_weekMediumPluralString;
}

- (NSString)weekShortString
{
  return self->_weekShortString;
}

- (NSString)dayLongSingularString
{
  return self->_dayLongSingularString;
}

- (NSString)dayLongPluralString
{
  return self->_dayLongPluralString;
}

- (NSString)dayMediumSingularString
{
  return self->_dayMediumSingularString;
}

- (NSString)dayMediumPluralString
{
  return self->_dayMediumPluralString;
}

- (NSString)dayShortString
{
  return self->_dayShortString;
}

- (NSString)hourLongSingularString
{
  return self->_hourLongSingularString;
}

- (NSString)hourLongPluralString
{
  return self->_hourLongPluralString;
}

- (NSString)hourMediumSingularString
{
  return self->_hourMediumSingularString;
}

- (NSString)hourMediumPluralString
{
  return self->_hourMediumPluralString;
}

- (NSString)hourShortString
{
  return self->_hourShortString;
}

- (NSString)minuteLongSingularString
{
  return self->_minuteLongSingularString;
}

- (NSString)minuteLongPluralString
{
  return self->_minuteLongPluralString;
}

- (NSString)minuteMediumSingularString
{
  return self->_minuteMediumSingularString;
}

- (NSString)minuteMediumPluralString
{
  return self->_minuteMediumPluralString;
}

- (NSString)minuteShortString
{
  return self->_minuteShortString;
}

- (NSString)secondLongSingularString
{
  return self->_secondLongSingularString;
}

- (NSString)secondLongPluralString
{
  return self->_secondLongPluralString;
}

- (NSString)secondMediumSingularString
{
  return self->_secondMediumSingularString;
}

- (NSString)secondMediumPluralString
{
  return self->_secondMediumPluralString;
}

- (NSString)secondShortString
{
  return self->_secondShortString;
}

- (NSString)millisecondLongSingularString
{
  return self->_millisecondLongSingularString;
}

- (NSString)millisecondLongPluralString
{
  return self->_millisecondLongPluralString;
}

- (NSString)millisecondShortString
{
  return self->_millisecondShortString;
}

- (NSArray)multiWordDurationUnitStrings
{
  return &self->_multiWordDurationUnitStrings->super;
}

- (NSArray)fullStopDurationUnitStrings
{
  return &self->_fullStopDurationUnitStrings->super;
}

- (NSCharacterSet)alphabeticCharacterSet
{
  return self->_alphabeticCharacterSet;
}

- (NSCharacterSet)decimalDigitCharacterSet
{
  return self->_decimalDigitCharacterSet;
}

- (NSCharacterSet)decimalDigitAndSeperatorsCharacterSet
{
  return self->_decimalDigitAndSeperatorsCharacterSet;
}

- (NSCharacterSet)whitespaceCharacterSet
{
  return self->_whitespaceCharacterSet;
}

- (NSCharacterSet)emptyCharacterSet
{
  return self->_emptyCharacterSet;
}

- (NSCharacterSet)separatorPunctuationCharacterSet
{
  return self->_separatorPunctuationCharacterSet;
}

- (NSCharacterSet)minusSignCharacterSet
{
  return self->_minusSignCharacterSet;
}

- (NSCharacterSet)whitespaceAndNewlineCharacterSet
{
  return self->_whitespaceAndNewlineCharacterSet;
}

- (NSCharacterSet)specialDurationFormatCharacters
{
  return self->_specialDurationFormatCharacters;
}

@end
