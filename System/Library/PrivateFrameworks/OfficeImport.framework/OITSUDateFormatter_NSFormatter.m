@implementation OITSUDateFormatter_NSFormatter

- (OITSUDateFormatter_NSFormatter)init
{
  OITSUDateFormatter_NSFormatter *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OITSUDateFormatter_NSFormatter;
  v2 = -[OITSUDateFormatter_NSFormatter init](&v5, sel_init);
  if (v2)
  {
    +[OITSULocale currentLocale](OITSULocale, "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUDateFormatter_NSFormatter setLocale:](v2, "setLocale:", v3);

  }
  return v2;
}

- (void)setPreferredFormat:(id)a3
{
  NSString *v4;
  NSString *preferredFormat;
  NSString *v6;
  id v7;

  v7 = a3;
  if (-[OITSUDateFormatter_NSFormatter isDateOnly](self, "isDateOnly"))
  {
    +[OITSUDateFormatter datePortionOfDateTimeFormatString:](OITSUDateFormatter, "datePortionOfDateTimeFormatString:", v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[OITSUDateFormatter_NSFormatter isTimeOnly](self, "isTimeOnly"))
    {
      v6 = (NSString *)v7;
      preferredFormat = self->_preferredFormat;
      self->_preferredFormat = v6;
      goto LABEL_7;
    }
    +[OITSUDateFormatter timePortionOfDateTimeFormatString:](OITSUDateFormatter, "timePortionOfDateTimeFormatString:", v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  preferredFormat = self->_preferredFormat;
  self->_preferredFormat = v4;
LABEL_7:

}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v14;

  v8 = a4;
  -[OITSUDateFormatter_NSFormatter locale](self, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = (void *)TSUCreateDateFromStringWithPreferredFormat(v8, v9, 0, (uint64_t)&v14, 0);

  v11 = v14;
  if (v11)
    -[OITSUDateFormatter_NSFormatter setPreferredFormat:](self, "setPreferredFormat:", v11);
  if (v10)
  {
    *a3 = objc_retainAutorelease(v10);
  }
  else
  {
    *a3 = 0;
    if (a5)
    {
      SFUBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("The date is invalid."), &stru_24F3BFFF8, CFSTR("TSUtility"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10 != 0;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[OITSUDateFormatter_NSFormatter locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUDateFormatter_NSFormatter stringForObjectValue:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateFormatter.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1127, 0, "Locale property has been inappropriately cleared.");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    +[OITSULocale currentLocale](OITSULocale, "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUDateFormatter_NSFormatter setLocale:](self, "setLocale:", v8);

  }
  -[OITSUDateFormatter_NSFormatter preferredFormat](self, "preferredFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[OITSUDateFormatter_NSFormatter locale](self, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    TSUShortestCompleteDateOnlyFormat(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUDateFormatter_NSFormatter setPreferredFormat:](self, "setPreferredFormat:", v11);

  }
  v12 = objc_opt_class();
  TSUDynamicCast(v12, (uint64_t)v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[OITSUDateFormatter_NSFormatter preferredFormat](self, "preferredFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUDateFormatter_NSFormatter locale](self, "locale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDateFormatterStringFromDateWithFormat(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)preferredFormat
{
  return self->_preferredFormat;
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

- (OITSULocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
}

@end
