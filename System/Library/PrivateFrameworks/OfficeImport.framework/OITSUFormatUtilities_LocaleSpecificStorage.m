@implementation OITSUFormatUtilities_LocaleSpecificStorage

- (OITSUFormatUtilities_LocaleSpecificStorage)initWithLocale:(id)a3
{
  id v4;
  OITSUFormatUtilities_LocaleSpecificStorage *v5;
  void *v6;
  __CFNumberFormatter *v7;
  uint64_t v8;
  NSString *formatCurrencyString;
  void *v10;
  uint64_t v11;
  NSString *formatCurrencyStringMinus;
  void *v13;
  uint64_t v14;
  NSString *formatCurrencyStringRedOnly;
  void *v16;
  uint64_t v17;
  NSString *formatCurrencyStringWithParens;
  void *v19;
  __CFNumberFormatter *v20;
  uint64_t v21;
  NSString *formatPercentageString;
  void *v23;
  uint64_t v24;
  NSString *formatPercentageStringMinus;
  void *v26;
  uint64_t v27;
  NSString *formatPercentageStringRedOnly;
  void *v29;
  uint64_t v30;
  NSString *formatPercentageStringWithParens;
  void *v32;
  __CFNumberFormatter *v33;
  uint64_t v34;
  NSString *formatScientificString;
  void *v36;
  uint64_t v37;
  NSString *formatScientificStringMinus;
  void *v39;
  uint64_t v40;
  NSString *formatScientificStringRedOnly;
  void *v42;
  uint64_t v43;
  NSString *formatScientificStringWithParens;
  void *v45;
  __CFNumberFormatter *v46;
  uint64_t v47;
  NSString *formatDecimalString;
  void *v49;
  uint64_t v50;
  NSString *formatDecimalStringMinus;
  void *v52;
  uint64_t v53;
  NSString *formatDecimalStringRedOnly;
  void *v55;
  uint64_t v56;
  NSString *formatDecimalStringWithParens;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)OITSUFormatUtilities_LocaleSpecificStorage;
  v5 = -[OITSUFormatUtilities_LocaleSpecificStorage init](&v59, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)v6, 2);

    v8 = -[__CFString copy]((id)CFNumberFormatterGetFormat(v7), "copy");
    formatCurrencyString = v5->_formatCurrencyString;
    v5->_formatCurrencyString = (NSString *)v8;

    CFRelease(v7);
    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatCurrencyString, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    formatCurrencyStringMinus = v5->_formatCurrencyStringMinus;
    v5->_formatCurrencyStringMinus = (NSString *)v11;

    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatCurrencyString, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    formatCurrencyStringRedOnly = v5->_formatCurrencyStringRedOnly;
    v5->_formatCurrencyStringRedOnly = (NSString *)v14;

    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatCurrencyString, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    formatCurrencyStringWithParens = v5->_formatCurrencyStringWithParens;
    v5->_formatCurrencyStringWithParens = (NSString *)v17;

    objc_msgSend(v4, "locale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)v19, 3);

    v21 = -[__CFString copy]((id)CFNumberFormatterGetFormat(v20), "copy");
    formatPercentageString = v5->_formatPercentageString;
    v5->_formatPercentageString = (NSString *)v21;

    CFRelease(v20);
    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatPercentageString, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    formatPercentageStringMinus = v5->_formatPercentageStringMinus;
    v5->_formatPercentageStringMinus = (NSString *)v24;

    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatPercentageString, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    formatPercentageStringRedOnly = v5->_formatPercentageStringRedOnly;
    v5->_formatPercentageStringRedOnly = (NSString *)v27;

    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatPercentageString, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    formatPercentageStringWithParens = v5->_formatPercentageStringWithParens;
    v5->_formatPercentageStringWithParens = (NSString *)v30;

    objc_msgSend(v4, "locale");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)v32, 0);

    CFNumberFormatterSetFormat(v33, CFSTR("#.##E+00"));
    v34 = -[__CFString copy]((id)CFNumberFormatterGetFormat(v33), "copy");
    formatScientificString = v5->_formatScientificString;
    v5->_formatScientificString = (NSString *)v34;

    CFRelease(v33);
    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatScientificString, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    formatScientificStringMinus = v5->_formatScientificStringMinus;
    v5->_formatScientificStringMinus = (NSString *)v37;

    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatScientificString, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    formatScientificStringRedOnly = v5->_formatScientificStringRedOnly;
    v5->_formatScientificStringRedOnly = (NSString *)v40;

    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatScientificString, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    formatScientificStringWithParens = v5->_formatScientificStringWithParens;
    v5->_formatScientificStringWithParens = (NSString *)v43;

    objc_msgSend(v4, "locale");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)v45, 1);

    v47 = -[__CFString copy]((id)CFNumberFormatterGetFormat(v46), "copy");
    formatDecimalString = v5->_formatDecimalString;
    v5->_formatDecimalString = (NSString *)v47;

    CFRelease(v46);
    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatDecimalString, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "copy");
    formatDecimalStringMinus = v5->_formatDecimalStringMinus;
    v5->_formatDecimalStringMinus = (NSString *)v50;

    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatDecimalString, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "copy");
    formatDecimalStringRedOnly = v5->_formatDecimalStringRedOnly;
    v5->_formatDecimalStringRedOnly = (NSString *)v53;

    +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_formatDecimalString, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "copy");
    formatDecimalStringWithParens = v5->_formatDecimalStringWithParens;
    v5->_formatDecimalStringWithParens = (NSString *)v56;

  }
  return v5;
}

+ (id)localeSpecificStorageForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OITSUFormatUtilities_LocaleSpecificStorage *v7;
  id v8;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OITSUFormatUtilities_LocaleSpecificStorage localeSpecificStorageForLocale:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFormatUtilities.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 133, 0, "Need a locale here");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  objc_msgSend(v4, "localeSpecificStorageForKey:", CFSTR("TSUFormatUtilities_LocaleSpecificStorage"));
  v7 = (OITSUFormatUtilities_LocaleSpecificStorage *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = a1;
    objc_sync_enter(v8);
    objc_msgSend(v4, "localeSpecificStorageForKey:", CFSTR("TSUFormatUtilities_LocaleSpecificStorage"));
    v7 = (OITSUFormatUtilities_LocaleSpecificStorage *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = -[OITSUFormatUtilities_LocaleSpecificStorage initWithLocale:]([OITSUFormatUtilities_LocaleSpecificStorage alloc], "initWithLocale:", v4);
      objc_msgSend(v4, "setLocaleSpecificStorage:forKey:", v7, CFSTR("TSUFormatUtilities_LocaleSpecificStorage"));
    }
    objc_sync_exit(v8);

  }
  return v7;
}

- (NSString)formatDecimalString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)formatDecimalStringMinus
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)formatDecimalStringRedOnly
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)formatCurrencyString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)formatCurrencyStringMinus
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)formatCurrencyStringRedOnly
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)formatPercentageString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)formatPercentageStringMinus
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)formatPercentageStringRedOnly
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)formatScientificString
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)formatScientificStringMinus
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)formatScientificStringRedOnly
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)formatDateTimeString
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)formatDecimalStringWithParens
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)formatScientificStringWithParens
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)formatCurrencyStringWithParens
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)formatPercentageStringWithParens
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatPercentageStringWithParens, 0);
  objc_storeStrong((id *)&self->_formatCurrencyStringWithParens, 0);
  objc_storeStrong((id *)&self->_formatScientificStringWithParens, 0);
  objc_storeStrong((id *)&self->_formatDecimalStringWithParens, 0);
  objc_storeStrong((id *)&self->_formatDateTimeString, 0);
  objc_storeStrong((id *)&self->_formatScientificStringRedOnly, 0);
  objc_storeStrong((id *)&self->_formatScientificStringMinus, 0);
  objc_storeStrong((id *)&self->_formatScientificString, 0);
  objc_storeStrong((id *)&self->_formatPercentageStringRedOnly, 0);
  objc_storeStrong((id *)&self->_formatPercentageStringMinus, 0);
  objc_storeStrong((id *)&self->_formatPercentageString, 0);
  objc_storeStrong((id *)&self->_formatCurrencyStringRedOnly, 0);
  objc_storeStrong((id *)&self->_formatCurrencyStringMinus, 0);
  objc_storeStrong((id *)&self->_formatCurrencyString, 0);
  objc_storeStrong((id *)&self->_formatDecimalStringRedOnly, 0);
  objc_storeStrong((id *)&self->_formatDecimalStringMinus, 0);
  objc_storeStrong((id *)&self->_formatDecimalString, 0);
}

@end
