@implementation TSUDateFormatter_NSFormatter

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUDateFormatter_NSFormatter;
  -[TSUDateFormatter_NSFormatter dealloc](&v3, sel_dealloc);
}

- (void)setPreferredFormat:(id)a3
{
  NSString *mPreferredFormat;
  id v6;
  NSString *v7;

  mPreferredFormat = self->mPreferredFormat;
  if (-[TSUDateFormatter_NSFormatter isDateOnly](self, "isDateOnly"))
  {
    v6 = +[TSUDateFormatter datePortionOfDateTimeFormatString:](TSUDateFormatter, "datePortionOfDateTimeFormatString:", a3);
LABEL_5:
    a3 = v6;
    goto LABEL_6;
  }
  if (-[TSUDateFormatter_NSFormatter isTimeOnly](self, "isTimeOnly"))
  {
    v6 = +[TSUDateFormatter timePortionOfDateTimeFormatString:](TSUDateFormatter, "timePortionOfDateTimeFormatString:", a3);
    goto LABEL_5;
  }
LABEL_6:
  self->mPreferredFormat = (NSString *)a3;

  v7 = self->mPreferredFormat;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v12;

  v12 = 0;
  v9 = (void *)objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "checkoutDateParser");
  v10 = (void *)objc_msgSend(v9, "newDateFromString:preferredFormatString:successfulFormatString:tryAggressiveFormats:", a4, 0, &v12, 0);
  objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "returnDateParser:", v9);
  if (v12)
    -[TSUDateFormatter_NSFormatter setPreferredFormat:](self, "setPreferredFormat:");
  if (v10)
  {
    *a3 = v10;
  }
  else
  {
    *a3 = 0;
    if (a5)
      *a5 = (id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("The date is invalid."), &stru_24D61C228, CFSTR("TSUtility"));
  }
  return v10 != 0;
}

- (id)stringForObjectValue:(id)a3
{
  uint64_t v5;
  id result;

  if (!-[TSUDateFormatter_NSFormatter preferredFormat](self, "preferredFormat"))
  {
    if (!TSUShortestCompleteDateOnlyFormat_sFormat)
      TSUShortestCompleteDateOnlyFormat_sFormat = (uint64_t)CFDateFormatterCreateDateFormatFromTemplate(0, CFSTR("yMd"), 0, (CFLocaleRef)sDateFormatterLocale);
    -[TSUDateFormatter_NSFormatter setPreferredFormat:](self, "setPreferredFormat:");
  }
  v5 = objc_opt_class();
  result = (id)TSUDynamicCast(v5, (uint64_t)a3);
  if (result)
    return (id)TSUDateFormatterStringFromDateWithFormat((const __CFDate *)result, (const __CFString *)-[TSUDateFormatter_NSFormatter preferredFormat](self, "preferredFormat"));
  return result;
}

- (NSString)preferredFormat
{
  return self->mPreferredFormat;
}

- (BOOL)isDateOnly
{
  return self->isDateOnly;
}

- (void)setIsDateOnly:(BOOL)a3
{
  self->isDateOnly = a3;
}

- (BOOL)isTimeOnly
{
  return self->isTimeOnly;
}

- (void)setIsTimeOnly:(BOOL)a3
{
  self->isTimeOnly = a3;
}

@end
