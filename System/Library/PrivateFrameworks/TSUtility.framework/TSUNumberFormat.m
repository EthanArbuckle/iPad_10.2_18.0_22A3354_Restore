@implementation TSUNumberFormat

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10
{
  uint64_t v11;

  HIDWORD(v11) = a10;
  LOBYTE(v11) = a9;
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, v11);
}

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(id)a11
{
  uint64_t v12;

  HIDWORD(v12) = a10;
  LOBYTE(v12) = a9;
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:suffixString:", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, v12, a11);
}

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 base:(unsigned __int8)a11 basePlaces:(unsigned __int16)a12 baseUseMinusSign:(BOOL)a13
{
  uint64_t v14;
  uint64_t v15;

  BYTE4(v15) = a13;
  WORD1(v15) = a12;
  LOBYTE(v15) = a11;
  HIDWORD(v14) = a10;
  LOBYTE(v14) = a9;
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:", *(_QWORD *)&a3, a4, a5, a6, a7, a8, v14, v15);
}

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 scaleFactor:(double)a11 isCustom:(BOOL)a12 formatName:(id)a13
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  BYTE6(v16) = 0;
  *(_DWORD *)((char *)&v16 + 2) = 0;
  LOWORD(v16) = 0;
  BYTE5(v15) = a12;
  BYTE4(v15) = 1;
  WORD1(v15) = 0;
  LOBYTE(v15) = 10;
  HIDWORD(v14) = a10;
  LOBYTE(v14) = a9;
  return objc_autorelease((id)objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, a11, v14, 0, 0, v15, 0, 0,
                                v16,
                                a13));
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
  return objc_autorelease((id)objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", *(_QWORD *)&a3, a4, a5, a6, a7, a8, a13, v19, a11, a12, v20, 0, 0,
                                v21,
                                a18));
}

- (TSUNumberFormat)init
{
  uint64_t v3;

  HIDWORD(v3) = -1;
  LOBYTE(v3) = 1;
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", 0, 0, 2, 0, 0, 0, v3);
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
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", 0, a3, 0, a4, 0, 0, a7, v17, 0, 0, v18, a8, a9, v19,
           a16);
}

- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10
{
  uint64_t v11;
  uint64_t v12;

  BYTE4(v12) = 1;
  WORD1(v12) = 0;
  LOBYTE(v12) = 10;
  HIDWORD(v11) = a10;
  LOBYTE(v11) = a9;
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, v11, v12);
}

- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 base:(unsigned __int8)a11 basePlaces:(unsigned __int16)a12 baseUseMinusSign:(BOOL)a13
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
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, 1.0, v14, 0, 0, v15, 0, 0, v16,
           0);
}

- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(id)a11
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  BYTE6(v14) = 0;
  *(_DWORD *)((char *)&v14 + 2) = 0;
  LOWORD(v14) = 0;
  *(_DWORD *)((char *)&v13 + 2) = 0x10000;
  LOBYTE(v13) = 10;
  HIDWORD(v12) = a10;
  LOBYTE(v12) = a9;
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, 1.0, v12, 0, a11, v13, 0, 0, v14,
           0);
}

- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 scaleFactor:(double)a13 base:(unsigned __int8)a14 basePlaces:(unsigned __int16)a15 baseUseMinusSign:(BOOL)a16 isCustom:(BOOL)a17 interstitialStrings:(id)a18 interstitialStringInsertionIndexes:(id)a19 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a20 minimumIntegerWidth:(unsigned __int8)a21 decimalWidth:(unsigned __int8)a22 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a23 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a24 isTextFormat:(BOOL)a25 formatName:(id)a26
{
  _BOOL4 v28;
  uint64_t v31;
  TSUNumberFormat *v32;
  TSUNumberFormat *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  int v39;
  BOOL *p_mFormatStringContainsTabCharacter;
  unsigned int v41;
  uint64_t v42;
  id v43;
  NSString *v44;
  BOOL v46;
  objc_super v48;

  v28 = a7;
  v48.receiver = self;
  v31 = *(_QWORD *)&a3;
  v48.super_class = (Class)TSUNumberFormat;
  v32 = -[TSUNumberFormat init](&v48, sel_init);
  v33 = v32;
  if (v32)
  {
    v32->mFormatStringContainsTabCharacter = 0;
    v46 = v28;
    if (a17)
    {
      if (!a4)
      {
        v34 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v35 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:]");
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 376, CFSTR("Passed a nil format string while creating a custom format!"));
      }
      v33->mFormatString = (NSString *)a4;
      v33->mFormatStringRequiresSuppressionOfMinusSign = 0;
      v36 = objc_msgSend(a4, "length");
      if (v36)
      {
        v37 = v36;
        for (i = 0; i != v37; ++i)
        {
          v39 = objc_msgSend(a4, "characterAtIndex:", i);
          p_mFormatStringContainsTabCharacter = &v33->mFormatStringContainsTabCharacter;
          if (v39 != 9)
          {
            p_mFormatStringContainsTabCharacter = &v33->mRequiresFractionReplacement;
            if (v39 != (unsigned __int16)TSUCustomNumberFormatFractionReplacementCharacter)
              continue;
          }
          *p_mFormatStringContainsTabCharacter = 1;
        }
      }
    }
    else
    {
      if (v28)
        v41 = 2;
      else
        v41 = a8;
      if ((_DWORD)v31 != 1)
        v41 = a8;
      if ((_DWORD)v31 == 3)
        v42 = 0;
      else
        v42 = v41;
      if (a4)
        v43 = +[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", a4, v42);
      else
        v43 = +[TSUNumberFormatter defaultFormatStringForValueType:negativeStyle:](TSUNumberFormatter, "defaultFormatStringForValueType:negativeStyle:", v31, v42);
      v33->mFormatString = (NSString *)v43;
      v33->mFormatStringRequiresSuppressionOfMinusSign = a8 == 1;
    }
    if (a6)
      v44 = (NSString *)a6;
    else
      v44 = (NSString *)+[TSUNumberFormatter currentLocaleCurrencyCode](TSUNumberFormatter, "currentLocaleCurrencyCode");
    v33->mCurrencyCode = v44;
    v33->mValueType = v31;
    v33->mDecimalPlaces = a5;
    v33->mNegativeStyle = a8;
    v33->mShowThousandsSeparator = a9;
    v33->mUseAccountingStyle = v46;
    v33->mFractionAccuracy = a10;
    v33->mScaleFactor = a13;
    v33->mIsCustom = a17;
    v33->mInterstitialStrings = (NSArray *)a18;
    v33->mInterstitialStringInsertionIndexes = (NSIndexSet *)a19;
    v33->mIsTextFormat = a25;
    v33->mIndexFromRightOfLastDigitPlaceholder = a20;
    v33->mMinimumIntegerWidth = a21;
    v33->mDecimalWidth = a22;
    v33->mNumberOfNonSpaceIntegerPlaceholderDigits = a23;
    v33->mNumberOfNonSpaceDecimalPlaceholderDigits = a24;
    v33->mFormatName = (NSString *)a26;
    v33->mBase = a14;
    v33->mBasePlaces = a15;
    v33->mBaseUseMinusSign = a16;
    v33->mSuffixString = (NSString *)objc_msgSend(a12, "copy");
    v33->mPrefixString = (NSString *)objc_msgSend(a11, "copy");
    if (a17)
      v33->mFormatContainsSpecialTokens = 0;
  }
  return v33;
}

- (id)numberFormatBySettingValueType:(int)a3
{
  uint64_t v3;
  int v5;
  uint64_t v7;
  id v8;
  id v9;
  BOOL v10;
  char v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v5 = -[TSUNumberFormat valueType](self, "valueType");
  if ((v3 - 1) <= 1 && v5 == (_DWORD)v3)
    return (id)-[TSUNumberFormat copy](self, "copy");
  v7 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v8 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  if ((_DWORD)v3 == 1)
  {
    v7 = +[TSUNumberFormatter defaultDecimalPlacesForCurrencyCode:](TSUNumberFormatter, "defaultDecimalPlacesForCurrencyCode:", +[TSUNumberFormatter currentLocaleCurrencyCode](TSUNumberFormatter, "currentLocaleCurrencyCode"));
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }
  v10 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v11 = (v3 - 1) < 2 || v10;
  v12 = (void *)objc_opt_class();
  v13 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v14 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v15 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  BYTE5(v17) = 0;
  BYTE4(v17) = self->mBaseUseMinusSign;
  WORD1(v17) = self->mBasePlaces;
  LOBYTE(v17) = self->mBase;
  HIDWORD(v16) = v15;
  LOBYTE(v16) = v11;
  return (id)objc_msgSend(v12, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v3, 0, v7, v9, v13, v14, 1.0, v16, self->mPrefixString, self->mSuffixString, v17, 0);
}

- (id)numberFormatBySettingDecimalPlaces:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v5 = (void *)objc_opt_class();
  v6 = -[TSUNumberFormat valueType](self, "valueType");
  v7 = -[TSUNumberFormat formatString](self, "formatString");
  v8 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v9 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v10 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v11 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v12 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v3, v8, v9, v10, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingPrefixString:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  uint64_t v15;
  uint64_t v16;

  v5 = (void *)objc_opt_class();
  v6 = -[TSUNumberFormat valueType](self, "valueType");
  v7 = -[TSUNumberFormat formatString](self, "formatString");
  v8 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v10 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v11 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v12 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v13 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  *(_DWORD *)((char *)&v16 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v16) = self->mBase;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v15, a3, self->mSuffixString, v16, self->mFormatName);
}

- (id)numberFormatBySettingSuffixString:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  uint64_t v15;
  uint64_t v16;

  v5 = (void *)objc_opt_class();
  v6 = -[TSUNumberFormat valueType](self, "valueType");
  v7 = -[TSUNumberFormat formatString](self, "formatString");
  v8 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v10 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v11 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v12 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v13 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  *(_DWORD *)((char *)&v16 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v16) = self->mBase;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v15, self->mPrefixString, a3, v16, self->mFormatName);
}

- (id)numberFormatByIncrementingDecimalPlaces:(signed __int16)a3
{
  int v3;
  unsigned int v5;
  unsigned __int16 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v5 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  if ((v3 & 0x80000000) == 0 || (v6 = 0, -v3 <= v5))
    v6 = v5 + v3;
  if (v6 >= (unsigned __int16)kTSUNumberFormatUserMaxNumberOfDecimalPlaces)
    v7 = (unsigned __int16)kTSUNumberFormatUserMaxNumberOfDecimalPlaces;
  else
    v7 = v6;
  v8 = (void *)objc_opt_class();
  v9 = -[TSUNumberFormat valueType](self, "valueType");
  v10 = -[TSUNumberFormat formatString](self, "formatString");
  v11 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v12 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v13 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v14 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v15 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  BYTE4(v18) = self->mBaseUseMinusSign;
  WORD1(v18) = self->mBasePlaces;
  LOBYTE(v18) = self->mBase;
  HIDWORD(v17) = v15;
  LOBYTE(v17) = v14;
  return (id)objc_msgSend(v8, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:", v9, v10, v7, v11, v12, v13, v17, v18);
}

- (id)numberFormatBySettingCurrencyCode:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  uint64_t v14;
  uint64_t v15;

  v5 = (void *)objc_opt_class();
  v6 = -[TSUNumberFormat valueType](self, "valueType");
  v7 = -[TSUNumberFormat formatString](self, "formatString");
  v8 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v10 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v11 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v12 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, a3, v9, v10, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
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
  v6 = -[TSUNumberFormat valueType](self, "valueType");
  v7 = -[TSUNumberFormat formatString](self, "formatString");
  v8 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v10 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v11 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v12 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v3, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingDecimalPlaces:(unsigned __int16)a3 andNegativeStyle:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _BOOL8 v11;
  BOOL v12;
  int v13;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v7 = (void *)objc_opt_class();
  v8 = -[TSUNumberFormat valueType](self, "valueType");
  v9 = -[TSUNumberFormat formatString](self, "formatString");
  v10 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v11 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v12 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v13 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  *(_DWORD *)((char *)&v16 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v16) = self->mBase;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v7, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v8, v9, v5, v10, v11, v4, self->mScaleFactor, v15, self->mPrefixString, self->mSuffixString, v16, self->mFormatName);
}

- (id)numberFormatBySettingShowThousandsSeparator:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  int v12;
  uint64_t v14;
  uint64_t v15;

  v5 = (void *)objc_opt_class();
  v6 = -[TSUNumberFormat valueType](self, "valueType");
  v7 = -[TSUNumberFormat formatString](self, "formatString");
  v8 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v10 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v11 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v12 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = a3;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingFractionAccuracy:(int)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;

  v5 = (void *)objc_opt_class();
  v6 = -[TSUNumberFormat valueType](self, "valueType");
  v7 = -[TSUNumberFormat formatString](self, "formatString");
  v8 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v10 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v11 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v12 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = a3;
  LOBYTE(v14) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
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
  v6 = -[TSUNumberFormat valueType](self, "valueType");
  v7 = -[TSUNumberFormat formatString](self, "formatString");
  v8 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v10 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v11 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v12 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v3, v10, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingBase:(unsigned __int8)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  uint64_t v15;
  uint64_t v16;

  v5 = (void *)objc_opt_class();
  v6 = -[TSUNumberFormat valueType](self, "valueType");
  v7 = -[TSUNumberFormat formatString](self, "formatString");
  v8 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v10 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v11 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v12 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v13 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  *(_DWORD *)((char *)&v16 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v16) = a3;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v15, self->mPrefixString, self->mSuffixString, v16, self->mFormatName);
}

- (id)numberFormatBySettingBasePlaces:(unsigned __int16)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  uint64_t v15;
  uint64_t v16;

  v5 = (void *)objc_opt_class();
  v6 = -[TSUNumberFormat valueType](self, "valueType");
  v7 = -[TSUNumberFormat formatString](self, "formatString");
  v8 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v10 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v11 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v12 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v13 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  WORD2(v16) = *(_WORD *)&self->mBaseUseMinusSign;
  WORD1(v16) = a3;
  LOBYTE(v16) = self->mBase;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v15, self->mPrefixString, self->mSuffixString, v16, self->mFormatName);
}

- (id)numberFormatBySettingBaseRepresentNegativeWithMinus:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  uint64_t v15;
  uint64_t v16;

  v5 = (void *)objc_opt_class();
  v6 = -[TSUNumberFormat valueType](self, "valueType");
  v7 = -[TSUNumberFormat formatString](self, "formatString");
  v8 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  v9 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v10 = -[TSUNumberFormat usesAccountingStyle](self, "usesAccountingStyle");
  v11 = -[TSUNumberFormat negativeStyle](self, "negativeStyle");
  v12 = -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator");
  v13 = -[TSUNumberFormat fractionAccuracy](self, "fractionAccuracy");
  BYTE5(v16) = self->mIsCustom;
  BYTE4(v16) = a3;
  WORD1(v16) = self->mBasePlaces;
  LOBYTE(v16) = self->mBase;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v15, self->mPrefixString, self->mSuffixString, v16, self->mFormatName);
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
  v3.receiver = self;
  v3.super_class = (Class)TSUNumberFormat;
  -[TSUNumberFormat dealloc](&v3, sel_dealloc);
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

- (int)valueType
{
  return self->mValueType;
}

- (unsigned)decimalPlaces
{
  if (self->mDecimalPlaces == kTSUNumberFormatInvalidDecimalPlaces)
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
  return self->mDecimalPlaces != kTSUNumberFormatInvalidDecimalPlaces;
}

- (BOOL)customFormatShouldAutoInsertPercentSymbol
{
  id v3;
  uint64_t v4;
  double v5;

  if (!self->mIsCustom)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUNumberFormat customFormatShouldAutoInsertPercentSymbol]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 908, CFSTR("not a custom format!"));
  }
  -[TSUNumberFormat scaleFactor](self, "scaleFactor");
  return v5 == 100.0;
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

- (id)chartLabelStringNofixFromDouble:(double)a3
{
  int v5;

  v5 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  if (v5 == (unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary)
    return -[TSUNumberFormat stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", 3, 0, 0, a3);
  else
    return -[TSUNumberFormat stringFromDouble:forceSuppressMinusSign:](self, "stringFromDouble:forceSuppressMinusSign:", 0, a3);
}

- (id)chartLabelStringFromDouble:(double)a3
{
  int v5;
  id v6;
  id v7;
  void *v8;
  id result;

  v5 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  if (v5 == (unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary)
    v6 = -[TSUNumberFormat stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", 3, 0, 0, a3);
  else
    v6 = -[TSUNumberFormat stringFromDouble:forceSuppressMinusSign:](self, "stringFromDouble:forceSuppressMinusSign:", 0, a3);
  v7 = v6;
  if (self->mPrefixString && (v8 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:")) != 0)
    result = (id)objc_msgSend(v8, "stringByAppendingString:", v7);
  else
    result = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
  if (self->mSuffixString)
    return (id)objc_msgSend(result, "stringByAppendingString:");
  return result;
}

- (id)chartLabelStringFromDouble:(double)a3 forceSuppressMinusSign:(BOOL)a4
{
  _BOOL8 v4;
  int v7;
  id v8;
  id v9;
  void *v10;
  id result;

  v4 = a4;
  v7 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  if (v7 == (unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary)
    v8 = -[TSUNumberFormat stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", 3, 0, v4, a3);
  else
    v8 = -[TSUNumberFormat stringFromDouble:forceSuppressMinusSign:](self, "stringFromDouble:forceSuppressMinusSign:", v4, a3);
  v9 = v8;
  if (self->mPrefixString && (v10 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:")) != 0)
    result = (id)objc_msgSend(v10, "stringByAppendingString:", v9);
  else
    result = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v9);
  if (self->mSuffixString)
    return (id)objc_msgSend(result, "stringByAppendingString:");
  return result;
}

- (id)stringFromDouble:(double)a3 forceSuppressMinusSign:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;

  v4 = a4;
  v7 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  return -[TSUNumberFormat stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", v7, v7, v4, a3);
}

- (id)stringFromDouble:(double)a3
{
  uint64_t v5;

  v5 = -[TSUNumberFormat decimalPlaces](self, "decimalPlaces");
  return -[TSUNumberFormat stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", v5, v5, 0, a3);
}

- (id)stringFromDouble:(double)a3 minimumDecimalPlaces:(unsigned __int16)a4 forceSuppressMinusSign:(BOOL)a5
{
  return -[TSUNumberFormat stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", -[TSUNumberFormat decimalPlaces](self, "decimalPlaces"), a4, a5, a3);
}

- (id)stringFromDouble:(double)a3 minimumDecimalPlaces:(unsigned __int16)a4
{
  return -[TSUNumberFormat stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", -[TSUNumberFormat decimalPlaces](self, "decimalPlaces"), a4, 0, a3);
}

- (id)stringFromDouble:(double)a3 decimalPlaces:(unsigned __int16)a4 minimumDecimalPlaces:(unsigned __int16)a5
{
  return -[TSUNumberFormat stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", a4, a5, 0, a3);
}

- (id)stringFromDouble:(double)a3 decimalPlaces:(unsigned __int16)a4 minimumDecimalPlaces:(unsigned __int16)a5 forceSuppressMinusSign:(BOOL)a6
{
  uint64_t v9;
  int v10;
  _BOOL4 v11;
  __CFString *v12;
  __CFString *v13;
  int mValueType;
  _BOOL4 v17;

  v17 = a6;
  mValueType = self->mValueType;
  v13 = -[TSUNumberFormat formatString](self, "formatString");
  v12 = -[TSUNumberFormat currencyCode](self, "currencyCode");
  v11 = -[TSUNumberFormat hasValidDecimalPlaces](self, "hasValidDecimalPlaces");
  HIBYTE(v10) = self->mRequiresFractionReplacement;
  *(_WORD *)((char *)&v10 + 1) = *(_WORD *)&self->mFormatContainsSpecialTokens;
  LOBYTE(v10) = self->mIsCustom;
  HIWORD(v9) = self->mIndexFromRightOfLastDigitPlaceholder;
  WORD2(v9) = *(_WORD *)&self->mNumberOfHashDecimalPlaceholders;
  LODWORD(v9) = *(_DWORD *)&self->mMinimumIntegerWidth;
  return TSUNumberFormatStringFromDouble(mValueType, a4, a5, v17, v13, v12, v11, self->mInterstitialStrings, a3, self->mScaleFactor, self->mInterstitialStringInsertionIndexes, v9, self->mFormatStringRequiresSuppressionOfMinusSign, self->mIsTextFormat, v10, HIWORD(v10), -[TSUNumberFormat showThousandsSeparator](self, "showThousandsSeparator"), self->mUseAccountingStyle, *(_WORD *)&self->mUseScientificFormattingAutomatically,
           self->mBase,
           self->mBasePlaces,
           self->mBaseUseMinusSign,
           self->mFractionAccuracy);
}

- (id)stringFromString:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  if (!self->mIsTextFormat)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUNumberFormat stringFromString:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 1076, CFSTR("Attempt to generate a string from a string with a non-text number format!"));
  }
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", self->mFormatString);
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), (unsigned __int16)TSUCustomNumberFormatTextReplacementCharacter), a3, 0, 0, objc_msgSend(v7, "length"));
  return v7;
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
        LOBYTE(v8) = -[TSUNumberFormat isEqual:](self, "isEqual:", a3);
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
  -[TSUNumberFormat isCustom](self, "isCustom");
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
  _BOOL8 mIsCustom;
  _BOOL8 mFormatStringRequiresSuppressionOfMinusSign;
  uint64_t mFractionAccuracy;
  _BOOL8 mShowThousandsSeparator;
  uint64_t mNegativeStyle;
  NSUInteger v23;
  _BOOL8 mUseAccountingStyle;
  int v25;
  NSUInteger v26;

  v3 = self->mValueType << 24;
  v26 = -[NSString hash](self->mFormatString, "hash") + v3;
  v25 = self->mDecimalPlaces << 16;
  v23 = -[NSString hash](self->mCurrencyCode, "hash");
  mUseAccountingStyle = self->mUseAccountingStyle;
  mNegativeStyle = self->mNegativeStyle;
  mShowThousandsSeparator = self->mShowThousandsSeparator;
  mFormatStringRequiresSuppressionOfMinusSign = self->mFormatStringRequiresSuppressionOfMinusSign;
  mFractionAccuracy = self->mFractionAccuracy;
  mIsCustom = self->mIsCustom;
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
  return v26
       + v23
       + v25
       + mUseAccountingStyle
       + mNegativeStyle
       + mShowThousandsSeparator
       + mFractionAccuracy
       + mFormatStringRequiresSuppressionOfMinusSign
       + mIsCustom
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
  NSArray *mInterstitialStrings;
  NSIndexSet *mInterstitialStringInsertionIndexes;
  NSString *mFormatName;
  NSString *mSuffixString;
  NSString *mPrefixString;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->mValueType != *((_DWORD *)a3 + 2))
    goto LABEL_36;
  mFormatString = self->mFormatString;
  if ((unint64_t)mFormatString | *((_QWORD *)a3 + 2))
  {
    v6 = -[NSString isEqualToString:](mFormatString, "isEqualToString:");
    if (!v6)
      return v6;
  }
  if (self->mDecimalPlaces != *((unsigned __int16 *)a3 + 12))
    goto LABEL_36;
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
    || self->mIsCustom != *((unsigned __int8 *)a3 + 85)
    || self->mScaleFactor != *((double *)a3 + 11)
    || self->mFormatStringContainsTabCharacter != *((unsigned __int8 *)a3 + 96)
    || self->mRequiresFractionReplacement != *((unsigned __int8 *)a3 + 101))
  {
    goto LABEL_36;
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
LABEL_36:
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
  return (id)objc_msgSend(v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", self->mValueType, self->mFormatString, self->mDecimalPlaces, self->mCurrencyCode, self->mUseAccountingStyle, self->mNegativeStyle, self->mScaleFactor, v6, self->mPrefixString, self->mSuffixString, v7, self->mInterstitialStrings, self->mInterstitialStringInsertionIndexes,
               v8,
               self->mFormatName);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSUMutableNumberFormat *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = +[TSUMutableNumberFormat allocWithZone:](TSUMutableNumberFormat, "allocWithZone:", a3);
  BYTE6(v8) = self->mIsTextFormat;
  *(_DWORD *)((char *)&v8 + 2) = *(_DWORD *)&self->mMinimumIntegerWidth;
  LOWORD(v8) = self->mIndexFromRightOfLastDigitPlaceholder;
  *(_DWORD *)((char *)&v7 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v7) = self->mBase;
  HIDWORD(v6) = self->mFractionAccuracy;
  LOBYTE(v6) = self->mShowThousandsSeparator;
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:](v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", self->mValueType, self->mFormatString, self->mDecimalPlaces, self->mCurrencyCode, self->mUseAccountingStyle, self->mNegativeStyle, self->mScaleFactor, v6, self->mPrefixString, self->mSuffixString, v7, self->mInterstitialStrings, self->mInterstitialStringInsertionIndexes, v8,
           self->mFormatName);
}

- (id)fractionStringFromDouble:(double)a3
{
  return (id)TSUNumberFormatFractionStringFromDouble(self->mFractionAccuracy, a3);
}

- (id)baseStringFromDouble:(double)a3
{
  return TSUNumberFormatBaseStringFromDouble(self->mBase, self->mBasePlaces, self->mBaseUseMinusSign, a3);
}

@end
