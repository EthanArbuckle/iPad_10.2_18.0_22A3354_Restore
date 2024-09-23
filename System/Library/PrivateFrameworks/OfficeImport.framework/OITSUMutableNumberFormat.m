@implementation OITSUMutableNumberFormat

- (void)p_copyIVarsFromNumberFormat:(id)a3
{
  uint64_t v5;

  if (a3 == self)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUMutableNumberFormat p_copyIVarsFromNumberFormat:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"), 1133, 0, "It's not safe to copy an object onto itself");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  self->super.mValueType = *((_DWORD *)a3 + 2);

  self->super.mFormatString = (NSString *)*((id *)a3 + 2);
  self->super.mDecimalPlaces = *((_WORD *)a3 + 12);

  self->super.mCurrencyCode = (NSString *)*((id *)a3 + 4);
  self->super.mUseAccountingStyle = *((_BYTE *)a3 + 40);
  self->super.mNegativeStyle = *((_DWORD *)a3 + 11);
  self->super.mShowThousandsSeparator = *((_BYTE *)a3 + 48);
  self->super.mFractionAccuracy = *((_DWORD *)a3 + 13);
  self->super.mFormatStringRequiresSuppressionOfMinusSign = *((_BYTE *)a3 + 56);
  self->super.mUseScientificFormattingAutomatically = *((_BYTE *)a3 + 57);
  self->super.mIgnoreDecimalPlacesForZeroValue = *((_BYTE *)a3 + 58);

  self->super.mPrefixString = (NSString *)*((id *)a3 + 8);
  self->super.mSuffixString = (NSString *)*((id *)a3 + 9);
  self->super.mBase = *((_BYTE *)a3 + 80);
  self->super.mBasePlaces = *((_WORD *)a3 + 41);
  self->super.mBaseUseMinusSign = *((_BYTE *)a3 + 84);
  self->super.mIsCustom = *((_BYTE *)a3 + 85);
  self->super.mCustomFormatKey = (NSUUID *)*((id *)a3 + 17);
  self->super.mScaleFactor = *((double *)a3 + 11);
  self->super.mFormatStringContainsTabCharacter = *((_BYTE *)a3 + 96);
  self->super.mFormatContainsSpecialTokens = *((_BYTE *)a3 + 97);
  self->super.mFormatContainsIntegerToken = *((_BYTE *)a3 + 98);
  self->super.mNumberOfHashDecimalPlaceholders = *((_BYTE *)a3 + 99);
  self->super.mTotalNumberOfDecimalPlaceholdersInFormat = *((_BYTE *)a3 + 100);
  self->super.mRequiresFractionReplacement = *((_BYTE *)a3 + 101);

  self->super.mInterstitialStrings = (NSArray *)*((id *)a3 + 13);
  self->super.mInterstitialStringInsertionIndexes = (NSIndexSet *)*((id *)a3 + 14);
  self->super.mIndexFromRightOfLastDigitPlaceholder = *((_WORD *)a3 + 60);
  self->super.mIsTextFormat = *((_BYTE *)a3 + 122);
  self->super.mMinimumIntegerWidth = *((_BYTE *)a3 + 123);
  self->super.mDecimalWidth = *((_BYTE *)a3 + 124);
  self->super.mNumberOfNonSpaceIntegerPlaceholderDigits = *((_BYTE *)a3 + 125);
  self->super.mNumberOfNonSpaceDecimalPlaceholderDigits = *((_BYTE *)a3 + 126);

  self->super.mFormatName = (NSString *)*((id *)a3 + 16);
}

- (void)setDecimalPlaces:(unsigned __int16)a3
{
  self->super.mDecimalPlaces = a3;
}

- (void)setPrefixString:(id)a3
{
  NSString *mPrefixString;

  mPrefixString = self->super.mPrefixString;
  if (mPrefixString != a3)
  {

    self->super.mPrefixString = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setSuffixString:(id)a3
{
  NSString *mSuffixString;

  mSuffixString = self->super.mSuffixString;
  if (mSuffixString != a3)
  {

    self->super.mSuffixString = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setCurrencyCode:(id)a3
{
  NSString *mCurrencyCode;

  mCurrencyCode = self->super.mCurrencyCode;
  if (mCurrencyCode != a3)
  {

    self->super.mCurrencyCode = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setNegativeStyle:(int)a3
{
  -[OITSUMutableNumberFormat p_copyIVarsFromNumberFormat:](self, "p_copyIVarsFromNumberFormat:", -[OITSUNumberFormat numberFormatBySettingNegativeStyle:](self, "numberFormatBySettingNegativeStyle:", *(_QWORD *)&a3));
}

- (void)setShowThousandsSeparator:(BOOL)a3
{
  self->super.mShowThousandsSeparator = a3;
}

- (void)setFractionAccuracy:(int)a3
{
  self->super.mFractionAccuracy = a3;
}

- (void)setUseAccountingStyle:(BOOL)a3
{
  -[OITSUMutableNumberFormat p_copyIVarsFromNumberFormat:](self, "p_copyIVarsFromNumberFormat:", -[OITSUNumberFormat numberFormatBySettingUseAccountingStyle:](self, "numberFormatBySettingUseAccountingStyle:", a3));
}

- (void)setBase:(unsigned __int8)a3
{
  self->super.mBase = a3;
}

- (void)setBasePlaces:(unsigned __int16)a3
{
  self->super.mBasePlaces = a3;
}

- (void)setNilValueForKey:(id)a3
{
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  objc_super v8;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("currencyCode")))
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUMutableNumberFormat setNilValueForKey:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"), 1230, 0, "We require a locale to set the currencyCode properly, don't set it to nil.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v6 = (const __CFString *)objc_msgSend(+[OITSULocale currentLocale](OITSULocale, "currentLocale"), "currencyCode");
    v7 = CFSTR("currencyCode");
LABEL_7:
    -[OITSUMutableNumberFormat setValue:forKey:](self, "setValue:forKey:", v6, v7);
    return;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("prefixString")))
  {
    v6 = &stru_24F3BFFF8;
    v7 = CFSTR("prefixString");
    goto LABEL_7;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("suffixString")))
  {
    v6 = &stru_24F3BFFF8;
    v7 = CFSTR("suffixString");
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)OITSUMutableNumberFormat;
  -[OITSUMutableNumberFormat setNilValueForKey:](&v8, sel_setNilValueForKey_, a3);
}

- (void)setCustomFormatKey:(id)a3
{
  NSUUID *mCustomFormatKey;

  mCustomFormatKey = self->super.mCustomFormatKey;
  if (mCustomFormatKey != a3)
  {

    self->super.mCustomFormatKey = (NSUUID *)a3;
  }
}

@end
