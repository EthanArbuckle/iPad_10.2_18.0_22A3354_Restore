@implementation OITSUNumberFormat

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10
{
  uint64_t v11;

  HIDWORD(v11) = a10;
  LOBYTE(v11) = a9;
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, v11);
}

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 scaleFactor:(double)a13 base:(unsigned __int8)a14 basePlaces:(unsigned __int16)a15 baseUseMinusSign:(BOOL)a16 isCustom:(BOOL)a17 formatName:(id)a18
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  BYTE6(v21) = 0;
  *(_DWORD *)((char *)&v21 + 2) = 0;
  LOWORD(v21) = 0;
  BYTE5(v20) = a17;
  BYTE4(v20) = a16;
  WORD1(v20) = a15;
  LOBYTE(v20) = a14;
  HIDWORD(v19) = a10;
  LOBYTE(v19) = a9;
  return objc_autorelease((id)objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", *(_QWORD *)&a3, a4, a5, a6, a7, a8, a13, v19, a11, a12, v20, 0,
                                0,
                                v21,
                                a18,
                                0));
}

- (OITSUNumberFormat)init
{
  uint64_t v3;

  HIDWORD(v3) = -1;
  LOBYTE(v3) = 1;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", 0, 0, 2, +[OITSUNumberFormatter currentLocaleCurrencyCode](OITSUNumberFormatter, "currentLocaleCurrencyCode"), 0, 0, v3);
}

- (id)initCustomFormatWithFormatString:(id)a3 currencyCode:(id)a4 showThousandsSeparator:(BOOL)a5 fractionAccuracy:(int)a6 scaleFactor:(double)a7 interstitialStrings:(id)a8 interstitialStringInsertionIndexes:(id)a9 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a10 minimumIntegerWidth:(unsigned __int8)a11 decimalWidth:(unsigned __int8)a12 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a13 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a14 isTextFormat:(BOOL)a15 formatName:(id)a16
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *(_WORD *)((char *)&v19 + 5) = __PAIR16__(a15, a14);
  *(_WORD *)((char *)&v19 + 3) = __PAIR16__(a13, a12);
  BYTE2(v19) = a11;
  LOWORD(v19) = a10;
  *(_DWORD *)((char *)&v18 + 2) = 16842752;
  LOBYTE(v18) = 10;
  HIDWORD(v17) = a6;
  LOBYTE(v17) = a5;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", 0, a3, 0, a4, 0, 0, a7, v17, 0, 0, v18, a8, a9,
           v19,
           a16,
           0);
}

- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10
{
  uint64_t v11;
  uint64_t v12;

  BYTE4(v12) = 1;
  WORD1(v12) = 0;
  LOBYTE(v12) = 10;
  HIDWORD(v11) = a10;
  LOBYTE(v11) = a9;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, v11, v12);
}

- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 base:(unsigned __int8)a11 basePlaces:(unsigned __int16)a12 baseUseMinusSign:(BOOL)a13
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  BYTE6(v16) = 0;
  *(_DWORD *)((char *)&v16 + 2) = 0;
  LOWORD(v16) = 0;
  BYTE5(v15) = 0;
  BYTE4(v15) = a13;
  WORD1(v15) = a12;
  LOBYTE(v15) = a11;
  HIDWORD(v14) = a10;
  LOBYTE(v14) = a9;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, 1.0, v14, 0, 0, v15, 0, 0,
           v16,
           0,
           0);
}

- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 isCustom:(BOOL)a13
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  BYTE6(v16) = 0;
  *(_DWORD *)((char *)&v16 + 2) = 0;
  LOWORD(v16) = 0;
  BYTE5(v15) = a13;
  BYTE4(v15) = 1;
  WORD1(v15) = 0;
  LOBYTE(v15) = 10;
  HIDWORD(v14) = a10;
  LOBYTE(v14) = a9;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, 1.0, v14, a11, a12, v15, 0, 0,
           v16,
           0,
           0);
}

- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(id)a11
{
  uint64_t v12;
  uint64_t v13;

  LOBYTE(v13) = 0;
  HIDWORD(v12) = a10;
  LOBYTE(v12) = a9;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:isCustom:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:isCustom:", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, v12, 0, a11, v13);
}

- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 scaleFactor:(double)a13 base:(unsigned __int8)a14 basePlaces:(unsigned __int16)a15 baseUseMinusSign:(BOOL)a16 isCustom:(BOOL)a17 interstitialStrings:(id)a18 interstitialStringInsertionIndexes:(id)a19 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a20 minimumIntegerWidth:(unsigned __int8)a21 decimalWidth:(unsigned __int8)a22 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a23 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a24 isTextFormat:(BOOL)a25 formatName:(id)a26 customFormatKey:(id)a27
{
  _BOOL4 v29;
  uint64_t v33;
  OITSUNumberFormat *v34;
  OITSUNumberFormat *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  int v40;
  BOOL *p_mFormatStringContainsTabCharacter;
  unsigned int v42;
  uint64_t v43;
  id v44;
  NSString *v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v49;
  objc_super v50;

  v29 = a7;
  v33 = *(_QWORD *)&a3;
  v50.receiver = self;
  v50.super_class = (Class)OITSUNumberFormat;
  v34 = -[OITSUNumberFormat init](&v50, sel_init);
  v35 = v34;
  if (v34)
  {
    v34->mFormatStringContainsTabCharacter = 0;
    v49 = v29;
    if (a17)
    {
      if (!a4)
      {
        v36 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:]");
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"), 310, 0, "Passed a nil format string while creating a custom format!");
        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      v35->mFormatString = (NSString *)a4;
      v35->mFormatStringRequiresSuppressionOfMinusSign = 0;
      v37 = objc_msgSend(a4, "length");
      if (v37)
      {
        v38 = v37;
        for (i = 0; i != v38; ++i)
        {
          v40 = objc_msgSend(a4, "characterAtIndex:", i);
          p_mFormatStringContainsTabCharacter = &v35->mFormatStringContainsTabCharacter;
          if (v40 != 9)
          {
            p_mFormatStringContainsTabCharacter = &v35->mRequiresFractionReplacement;
            if (v40 != (unsigned __int16)TSUCustomNumberFormatFractionReplacementCharacter)
              continue;
          }
          *p_mFormatStringContainsTabCharacter = 1;
        }
      }
    }
    else
    {
      if (v29)
        v42 = 2;
      else
        v42 = a8;
      if ((_DWORD)v33 != 1)
        v42 = a8;
      if ((_DWORD)v33 == 3)
        v43 = 0;
      else
        v43 = v42;
      if (a4)
        v44 = +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", a4, v43);
      else
        v44 = +[OITSUNumberFormatter defaultFormatStringForValueType:negativeStyle:](OITSUNumberFormatter, "defaultFormatStringForValueType:negativeStyle:", v33, v43);
      v35->mFormatString = (NSString *)v44;
      v35->mFormatStringRequiresSuppressionOfMinusSign = a8 == 1;
    }
    if (a6)
    {
      v45 = (NSString *)a6;
    }
    else
    {
      v46 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v46, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"), 352, 0, "We require the currencyCode from the locale you are using, don't pass in nil.");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      v47 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"), 353, 0, "No locale passed in, falling to back current locale.");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      v45 = (NSString *)(id)objc_msgSend(+[OITSULocale currentLocale](OITSULocale, "currentLocale"), "currencyCode");
    }
    v35->mCurrencyCode = v45;
    v35->mValueType = v33;
    v35->mDecimalPlaces = a5;
    v35->mNegativeStyle = a8;
    v35->mShowThousandsSeparator = a9;
    v35->mUseAccountingStyle = v49;
    v35->mFractionAccuracy = a10;
    v35->mScaleFactor = a13;
    v35->mIsCustom = a17;
    v35->mCustomFormatKey = (NSUUID *)a27;
    v35->mInterstitialStrings = (NSArray *)a18;
    v35->mInterstitialStringInsertionIndexes = (NSIndexSet *)a19;
    v35->mIsTextFormat = a25;
    v35->mIndexFromRightOfLastDigitPlaceholder = a20;
    v35->mMinimumIntegerWidth = a21;
    v35->mDecimalWidth = a22;
    v35->mNumberOfNonSpaceIntegerPlaceholderDigits = a23;
    v35->mNumberOfNonSpaceDecimalPlaceholderDigits = a24;
    v35->mFormatName = (NSString *)a26;
    v35->mBase = a14;
    v35->mBasePlaces = a15;
    v35->mBaseUseMinusSign = a16;
    v35->mSuffixString = (NSString *)objc_msgSend(a12, "copy");
    v35->mPrefixString = (NSString *)objc_msgSend(a11, "copy");
    if (a17)
      v35->mFormatContainsSpecialTokens = 0;
  }
  return v35;
}

- (id)numberFormatBySettingNegativeStyle:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  BOOL v11;
  int v12;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_opt_class();
  v6 = -[OITSUNumberFormat valueType](self, "valueType");
  v7 = -[OITSUNumberFormat formatString](self, "formatString");
  v8 = -[OITSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[OITSUNumberFormat currencyCode](self, "currencyCode");
  v10 = -[OITSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v11 = -[OITSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v12 = -[OITSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v3, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingUseAccountingStyle:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v5 = (void *)objc_opt_class();
  v6 = -[OITSUNumberFormat valueType](self, "valueType");
  v7 = -[OITSUNumberFormat formatString](self, "formatString");
  v8 = -[OITSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[OITSUNumberFormat currencyCode](self, "currencyCode");
  v10 = -[OITSUNumberFormat negativeStyle](self, "negativeStyle");
  v11 = -[OITSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v12 = -[OITSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v3, v10, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (void)dealloc
{
  objc_super v3;

  self->mFormatString = 0;
  self->mCurrencyCode = 0;

  self->mInterstitialStrings = 0;
  self->mInterstitialStringInsertionIndexes = 0;

  self->mFormatName = 0;
  self->mPrefixString = 0;

  self->mSuffixString = 0;
  self->mCustomFormatKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)OITSUNumberFormat;
  -[OITSUNumberFormat dealloc](&v3, sel_dealloc);
}

- (void)setFormatName:(id)a3
{
  id v5;

  v5 = a3;

  self->mFormatName = (NSString *)a3;
}

- (id)formatName
{
  return self->mFormatName;
}

- (BOOL)isCustom
{
  return self->mIsCustom;
}

- (id)customFormatKey
{
  return self->mCustomFormatKey;
}

- (int)valueType
{
  return self->mValueType;
}

- (unsigned)decimalPlaces
{
  if (self->mDecimalPlaces == 0xFFFF)
    return 0;
  else
    return self->mDecimalPlaces;
}

- (id)prefixString
{
  return self->mPrefixString;
}

- (id)suffixString
{
  return self->mSuffixString;
}

- (id)formatString
{
  return self->mFormatString;
}

- (id)currencyCode
{
  return self->mCurrencyCode;
}

- (int)negativeStyle
{
  return self->mNegativeStyle;
}

- (BOOL)showThousandsSeparator
{
  return self->mShowThousandsSeparator;
}

- (int)fractionAccuracy
{
  return self->mFractionAccuracy;
}

- (BOOL)usesAccountingStyle
{
  return self->mUseAccountingStyle;
}

- (double)scaleFactor
{
  return self->mScaleFactor;
}

- (BOOL)isTextFormat
{
  return self->mIsTextFormat;
}

- (BOOL)canFormatText
{
  return self->mIsTextFormat;
}

- (BOOL)usesTextFormatForValue:(double)a3
{
  return self->mIsTextFormat;
}

- (unsigned)base
{
  return self->mBase;
}

- (unsigned)basePlaces
{
  return self->mBasePlaces;
}

- (BOOL)baseUseMinusSign
{
  return self->mBaseUseMinusSign;
}

- (BOOL)hasValidDecimalPlaces
{
  return (__int16)self->mDecimalPlaces != -1;
}

- (BOOL)customFormatShouldAutoInsertPercentSymbol
{
  uint64_t v3;
  double v4;

  if (!self->mIsCustom)
  {
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNumberFormat customFormatShouldAutoInsertPercentSymbol]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"), 567, 0, "not a custom format!");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  -[OITSUNumberFormat scaleFactor](self, "scaleFactor");
  return v4 == 100.0;
}

- (BOOL)useScientificFormattingAutomatically
{
  return self->mUseScientificFormattingAutomatically;
}

- (void)setUseScientificFormattingAutomatically:(BOOL)a3
{
  self->mUseScientificFormattingAutomatically = a3;
}

- (BOOL)ignoreDecimalPlacesForZeroValue
{
  return self->mIgnoreDecimalPlacesForZeroValue;
}

- (void)setIgnoreDecimalPlacesForZeroValue:(BOOL)a3
{
  self->mIgnoreDecimalPlacesForZeroValue = a3;
}

- (BOOL)usesTabs
{
  if (self->mFormatStringContainsTabCharacter)
    return 1;
  if (self->mValueType == 1)
    return self->mUseAccountingStyle;
  return 0;
}

- (BOOL)requiresParensToBeReplacedWithSpacesForDouble:(double)a3
{
  return a3 >= 0.0 && (self->mNegativeStyle & 0xFFFFFFFE) == 2;
}

- (id)stringFromDouble:(double)a3 locale:(id)a4 forceSuppressMinusSign:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v9;

  v5 = a5;
  v9 = -[OITSUNumberFormat decimalPlaces](self, "decimalPlaces");
  return -[OITSUNumberFormat stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", a4, v9, v9, v5, a3);
}

- (id)stringFromDouble:(double)a3 locale:(id)a4
{
  uint64_t v7;

  v7 = -[OITSUNumberFormat decimalPlaces](self, "decimalPlaces");
  return -[OITSUNumberFormat stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", a4, v7, v7, 0, a3);
}

- (id)stringFromDouble:(double)a3 locale:(id)a4 minimumDecimalPlaces:(unsigned __int16)a5 forceSuppressMinusSign:(BOOL)a6
{
  return -[OITSUNumberFormat stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", a4, -[OITSUNumberFormat decimalPlaces](self, "decimalPlaces"), a5, a6, a3);
}

- (id)stringFromDouble:(double)a3 locale:(id)a4 minimumDecimalPlaces:(unsigned __int16)a5
{
  return -[OITSUNumberFormat stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", a4, -[OITSUNumberFormat decimalPlaces](self, "decimalPlaces"), a5, 0, a3);
}

- (id)stringFromDouble:(double)a3 locale:(id)a4 decimalPlaces:(unsigned __int16)a5 minimumDecimalPlaces:(unsigned __int16)a6
{
  return -[OITSUNumberFormat stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", a4, a5, a6, 0, a3);
}

- (id)stringFromDouble:(double)a3 locale:(id)a4 decimalPlaces:(unsigned __int16)a5 minimumDecimalPlaces:(unsigned __int16)a6 forceSuppressMinusSign:(BOOL)a7
{
  uint64_t v10;
  int v11;
  _BOOL4 v13;
  id v14;
  __CFString *v15;
  int mValueType;

  mValueType = self->mValueType;
  v15 = -[OITSUNumberFormat formatString](self, "formatString");
  v14 = -[OITSUNumberFormat currencyCode](self, "currencyCode");
  v13 = -[OITSUNumberFormat hasValidDecimalPlaces](self, "hasValidDecimalPlaces");
  HIBYTE(v11) = self->mRequiresFractionReplacement;
  *(_WORD *)((char *)&v11 + 1) = *(_WORD *)&self->mFormatContainsSpecialTokens;
  LOBYTE(v11) = self->mIsCustom;
  HIWORD(v10) = self->mIndexFromRightOfLastDigitPlaceholder;
  WORD2(v10) = *(_WORD *)&self->mNumberOfHashDecimalPlaceholders;
  LODWORD(v10) = *(_DWORD *)&self->mMinimumIntegerWidth;
  return TSUNumberFormatStringFromDouble(mValueType, a5, a6, a7, v15, (uint64_t)v14, v13, self->mInterstitialStrings, a3, self->mScaleFactor, self->mInterstitialStringInsertionIndexes, v10, self->mFormatStringRequiresSuppressionOfMinusSign, self->mIsTextFormat, v11, HIWORD(v11), -[OITSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator"), self->mUseAccountingStyle, *(_WORD *)&self->mUseScientificFormattingAutomatically,
           self->mBase,
           self->mBasePlaces,
           self->mBaseUseMinusSign,
           self->mFractionAccuracy,
           a4);
}

- (id)stringFromString:(id)a3
{
  uint64_t v5;
  void *v6;

  if (!self->mIsTextFormat)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNumberFormat stringFromString:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"), 655, 0, "Attempt to generate a string from a string with a non-text number format!");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", self->mFormatString);
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), (unsigned __int16)TSUCustomNumberFormatTextReplacementCharacter), a3, 0, 0, objc_msgSend(v6, "length"));
  return v6;
}

- (BOOL)isEquivalent:(id)a3
{
  int mValueType;
  int mShowThousandsSeparator;
  int v7;
  _BOOL4 v8;
  NSString *mCurrencyCode;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (mValueType = self->mValueType, mValueType == *((_DWORD *)a3 + 2)))
  {
    switch(mValueType)
    {
      case 0:
      case 2:
        if (self->mDecimalPlaces != *((unsigned __int16 *)a3 + 12) || self->mNegativeStyle != *((_DWORD *)a3 + 11))
          goto LABEL_20;
        mShowThousandsSeparator = self->mShowThousandsSeparator;
        v7 = *((unsigned __int8 *)a3 + 48);
        goto LABEL_16;
      case 1:
        if (self->mDecimalPlaces != *((unsigned __int16 *)a3 + 12))
          goto LABEL_20;
        mCurrencyCode = self->mCurrencyCode;
        if ((unint64_t)mCurrencyCode | *((_QWORD *)a3 + 4))
        {
          v8 = -[NSString isEqualToString:](mCurrencyCode, "isEqualToString:");
          if (!v8)
            return v8;
        }
        if (self->mNegativeStyle != *((_DWORD *)a3 + 11)
          || self->mShowThousandsSeparator != *((unsigned __int8 *)a3 + 48))
        {
          goto LABEL_20;
        }
        mShowThousandsSeparator = self->mUseAccountingStyle;
        v7 = *((unsigned __int8 *)a3 + 40);
LABEL_16:
        LOBYTE(v8) = mShowThousandsSeparator == v7;
        break;
      case 3:
        mShowThousandsSeparator = self->mDecimalPlaces;
        v7 = *((unsigned __int16 *)a3 + 12);
        goto LABEL_16;
      case 4:
        mShowThousandsSeparator = self->mFractionAccuracy;
        v7 = *((_DWORD *)a3 + 13);
        goto LABEL_16;
      case 5:
        if (self->mBase != *((unsigned __int8 *)a3 + 80) || self->mBasePlaces != *((unsigned __int16 *)a3 + 41))
          goto LABEL_20;
        mShowThousandsSeparator = self->mBaseUseMinusSign;
        v7 = *((unsigned __int8 *)a3 + 84);
        goto LABEL_16;
      default:
        LOBYTE(v8) = -[OITSUNumberFormat isEqual:](self, "isEqual:", a3);
        return v8;
    }
  }
  else
  {
LABEL_20:
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)customNumberFormatTokens
{
  -[OITSUNumberFormat isCustom](self, "isCustom");
  return 0;
}

- (unint64_t)hash
{
  int v3;
  uint64_t v4;
  uint64_t mIndexFromRightOfLastDigitPlaceholder;
  _BOOL8 mIsTextFormat;
  uint64_t mMinimumIntegerWidth;
  uint64_t mDecimalWidth;
  uint64_t mNumberOfNonSpaceIntegerPlaceholderDigits;
  uint64_t mNumberOfNonSpaceDecimalPlaceholderDigits;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v14;
  _BOOL8 mRequiresFractionReplacement;
  _BOOL8 mFormatStringContainsTabCharacter;
  int mScaleFactor;
  uint64_t v18;
  _BOOL8 mIsCustom;
  _BOOL8 mFormatStringRequiresSuppressionOfMinusSign;
  uint64_t mFractionAccuracy;
  _BOOL8 mShowThousandsSeparator;
  uint64_t mNegativeStyle;
  NSUInteger v24;
  _BOOL8 mUseAccountingStyle;
  int v26;
  NSUInteger v27;

  v3 = self->mValueType << 24;
  v27 = -[NSString hash](self->mFormatString, "hash") + v3;
  v26 = self->mDecimalPlaces << 16;
  v24 = -[NSString hash](self->mCurrencyCode, "hash");
  mUseAccountingStyle = self->mUseAccountingStyle;
  mNegativeStyle = self->mNegativeStyle;
  mShowThousandsSeparator = self->mShowThousandsSeparator;
  mFormatStringRequiresSuppressionOfMinusSign = self->mFormatStringRequiresSuppressionOfMinusSign;
  mFractionAccuracy = self->mFractionAccuracy;
  mIsCustom = self->mIsCustom;
  v18 = -[NSUUID hash](self->mCustomFormatKey, "hash");
  mScaleFactor = (int)self->mScaleFactor;
  mFormatStringContainsTabCharacter = self->mFormatStringContainsTabCharacter;
  mRequiresFractionReplacement = self->mRequiresFractionReplacement;
  v14 = -[NSArray hash](self->mInterstitialStrings, "hash");
  v4 = -[NSIndexSet hash](self->mInterstitialStringInsertionIndexes, "hash");
  mIndexFromRightOfLastDigitPlaceholder = self->mIndexFromRightOfLastDigitPlaceholder;
  mIsTextFormat = self->mIsTextFormat;
  mMinimumIntegerWidth = self->mMinimumIntegerWidth;
  mDecimalWidth = self->mDecimalWidth;
  mNumberOfNonSpaceIntegerPlaceholderDigits = self->mNumberOfNonSpaceIntegerPlaceholderDigits;
  mNumberOfNonSpaceDecimalPlaceholderDigits = self->mNumberOfNonSpaceDecimalPlaceholderDigits;
  v11 = -[NSString hash](self->mFormatName, "hash");
  v12 = -[NSString hash](self->mSuffixString, "hash");
  return v27
       + v24
       + v26
       + mUseAccountingStyle
       + mNegativeStyle
       + mShowThousandsSeparator
       + mFractionAccuracy
       + mFormatStringRequiresSuppressionOfMinusSign
       + mIsCustom
       + v18
       + mScaleFactor
       + mFormatStringContainsTabCharacter
       + mRequiresFractionReplacement
       + v14
       + v4
       + mIndexFromRightOfLastDigitPlaceholder
       + mIsTextFormat
       + mMinimumIntegerWidth
       + mDecimalWidth
       + mNumberOfNonSpaceIntegerPlaceholderDigits
       + mNumberOfNonSpaceDecimalPlaceholderDigits
       + v11
       + v12
       + -[NSString hash](self->mPrefixString, "hash");
}

- (BOOL)isEqual:(id)a3
{
  NSString *mFormatString;
  int v6;
  NSString *mCurrencyCode;
  NSUUID *mCustomFormatKey;
  NSArray *mInterstitialStrings;
  NSIndexSet *mInterstitialStringInsertionIndexes;
  NSString *mFormatName;
  NSString *mSuffixString;
  NSString *mPrefixString;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->mValueType != *((_DWORD *)a3 + 2))
    goto LABEL_38;
  mFormatString = self->mFormatString;
  if ((unint64_t)mFormatString | *((_QWORD *)a3 + 2))
  {
    v6 = -[NSString isEqualToString:](mFormatString, "isEqualToString:");
    if (!v6)
      return v6;
  }
  if (self->mDecimalPlaces != *((unsigned __int16 *)a3 + 12))
    goto LABEL_38;
  mCurrencyCode = self->mCurrencyCode;
  if ((unint64_t)mCurrencyCode | *((_QWORD *)a3 + 4))
  {
    v6 = -[NSString isEqualToString:](mCurrencyCode, "isEqualToString:");
    if (!v6)
      return v6;
  }
  if (self->mUseAccountingStyle != *((unsigned __int8 *)a3 + 40)
    || self->mNegativeStyle != *((_DWORD *)a3 + 11)
    || self->mShowThousandsSeparator != *((unsigned __int8 *)a3 + 48)
    || self->mFractionAccuracy != *((_DWORD *)a3 + 13)
    || self->mFormatStringRequiresSuppressionOfMinusSign != *((unsigned __int8 *)a3 + 56)
    || self->mIsCustom != *((unsigned __int8 *)a3 + 85))
  {
    goto LABEL_38;
  }
  mCustomFormatKey = self->mCustomFormatKey;
  if ((unint64_t)mCustomFormatKey | *((_QWORD *)a3 + 17))
  {
    v6 = -[NSUUID isEqual:](mCustomFormatKey, "isEqual:");
    if (!v6)
      return v6;
  }
  if (self->mScaleFactor != *((double *)a3 + 11)
    || self->mFormatStringContainsTabCharacter != *((unsigned __int8 *)a3 + 96)
    || self->mRequiresFractionReplacement != *((unsigned __int8 *)a3 + 101))
  {
    goto LABEL_38;
  }
  mInterstitialStrings = self->mInterstitialStrings;
  if (!((unint64_t)mInterstitialStrings | *((_QWORD *)a3 + 13))
    || (v6 = -[NSArray isEqual:](mInterstitialStrings, "isEqual:")) != 0)
  {
    mInterstitialStringInsertionIndexes = self->mInterstitialStringInsertionIndexes;
    if (!((unint64_t)mInterstitialStringInsertionIndexes | *((_QWORD *)a3 + 14))
      || (v6 = -[NSIndexSet isEqual:](mInterstitialStringInsertionIndexes, "isEqual:")) != 0)
    {
      if (self->mIndexFromRightOfLastDigitPlaceholder == *((unsigned __int16 *)a3 + 60)
        && self->mIsTextFormat == *((unsigned __int8 *)a3 + 122)
        && self->mMinimumIntegerWidth == *((unsigned __int8 *)a3 + 123)
        && self->mDecimalWidth == *((unsigned __int8 *)a3 + 124)
        && self->mNumberOfNonSpaceIntegerPlaceholderDigits == *((unsigned __int8 *)a3 + 125)
        && self->mNumberOfNonSpaceDecimalPlaceholderDigits == *((unsigned __int8 *)a3 + 126))
      {
        mFormatName = self->mFormatName;
        if ((unint64_t)mFormatName | *((_QWORD *)a3 + 16))
        {
          v6 = -[NSString isEqual:](mFormatName, "isEqual:");
          if (!v6)
            return v6;
        }
        if (self->mBase == *((unsigned __int8 *)a3 + 80)
          && self->mBasePlaces == *((unsigned __int16 *)a3 + 41)
          && self->mBaseUseMinusSign == *((unsigned __int8 *)a3 + 84))
        {
          mSuffixString = self->mSuffixString;
          if (!((unint64_t)mSuffixString | *((_QWORD *)a3 + 9))
            || (v6 = -[NSString isEqual:](mSuffixString, "isEqual:")) != 0)
          {
            mPrefixString = self->mPrefixString;
            if ((unint64_t)mPrefixString | *((_QWORD *)a3 + 8))
              LOBYTE(v6) = -[NSString isEqual:](mPrefixString, "isEqual:");
            else
              LOBYTE(v6) = 1;
          }
          return v6;
        }
      }
LABEL_38:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (NSString)description
{
  NSString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = (NSString *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 200);
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("TSUNumberFormat[%p]\n"), self);
  if (self->mIsCustom)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("Custom Format: %@\n"), v4);
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("Name: %@\n"), self->mFormatName);
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("Value Type: %@\n"), TSUNumberFormatterStringFromValueType(self->mValueType));
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("Format String: %@\n"), self->mFormatString);
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("Decimal Places: %d\n"), self->mDecimalPlaces);
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("Currency Code: %@\n"), self->mCurrencyCode);
  if (self->mUseAccountingStyle)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("Use Accounting Style: %@\n"), v5);
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("Negative Style: %@\n"), TSUNumberFormatterStringFromNegativeStyle(self->mNegativeStyle));
  if (self->mShowThousandsSeparator)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("Show Thousands Separator: %@\n"), v6);
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("Fraction Accuracy: %@\n"), TSUNumberFormatterStringFromFractionAccuracy(self->mFractionAccuracy));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  BYTE6(v8) = self->mIsTextFormat;
  *(_DWORD *)((char *)&v8 + 2) = *(_DWORD *)&self->mMinimumIntegerWidth;
  LOWORD(v8) = self->mIndexFromRightOfLastDigitPlaceholder;
  *(_DWORD *)((char *)&v7 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v7) = self->mBase;
  HIDWORD(v6) = self->mFractionAccuracy;
  LOBYTE(v6) = self->mShowThousandsSeparator;
  return (id)objc_msgSend(v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", self->mValueType, self->mFormatString, self->mDecimalPlaces, self->mCurrencyCode, self->mUseAccountingStyle, self->mNegativeStyle, self->mScaleFactor, v6, self->mPrefixString, self->mSuffixString, v7, self->mInterstitialStrings, self->mInterstitialStringInsertionIndexes,
               v8,
               self->mFormatName,
               self->mCustomFormatKey);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  OITSUMutableNumberFormat *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = +[OITSUMutableNumberFormat allocWithZone:](OITSUMutableNumberFormat, "allocWithZone:", a3);
  BYTE6(v8) = self->mIsTextFormat;
  *(_DWORD *)((char *)&v8 + 2) = *(_DWORD *)&self->mMinimumIntegerWidth;
  LOWORD(v8) = self->mIndexFromRightOfLastDigitPlaceholder;
  *(_DWORD *)((char *)&v7 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v7) = self->mBase;
  HIDWORD(v6) = self->mFractionAccuracy;
  LOBYTE(v6) = self->mShowThousandsSeparator;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:](v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", self->mValueType, self->mFormatString, self->mDecimalPlaces, self->mCurrencyCode, self->mUseAccountingStyle, self->mNegativeStyle, self->mScaleFactor, v6, self->mPrefixString, self->mSuffixString, v7, self->mInterstitialStrings, self->mInterstitialStringInsertionIndexes,
           v8,
           self->mFormatName,
           self->mCustomFormatKey);
}

- (id)baseStringFromDouble:(double)a3
{
  return TSUNumberFormatBaseStringFromDouble(self->mBase, self->mBasePlaces, self->mBaseUseMinusSign, a3);
}

@end
