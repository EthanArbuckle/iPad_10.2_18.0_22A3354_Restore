@implementation TSUMutableNumberFormat

- (void)p_copyIVarsFromNumberFormat:(id)a3
{
  id v5;
  uint64_t v6;

  if (a3 == self)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUMutableNumberFormat p_copyIVarsFromNumberFormat:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 1562, CFSTR("It's not safe to copy an object onto itself"));
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

- (void)setValueType:(int)a3
{
  uint64_t v3;
  int v5;

  if (self->super.mValueType == a3)
    return;
  v3 = *(_QWORD *)&a3;
  if (a3 == 1)
  {
    -[TSUMutableNumberFormat willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("decimalPlaces"));
    -[TSUMutableNumberFormat willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currencyCode"));
  }
  else if ((a3 - 1) > 1)
  {
    v5 = 0;
    goto LABEL_7;
  }
  -[TSUMutableNumberFormat willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("showThousandsSeparator"));
  v5 = 1;
LABEL_7:
  -[TSUMutableNumberFormat p_copyIVarsFromNumberFormat:](self, "p_copyIVarsFromNumberFormat:", -[TSUNumberFormat numberFormatBySettingValueType:](self, "numberFormatBySettingValueType:", v3));
  if ((_DWORD)v3 == 1)
  {
    -[TSUMutableNumberFormat didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("decimalPlaces"));
    -[TSUMutableNumberFormat didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currencyCode"));
  }
  if (v5)
    -[TSUMutableNumberFormat didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("showThousandsSeparator"));
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
  -[TSUMutableNumberFormat p_copyIVarsFromNumberFormat:](self, "p_copyIVarsFromNumberFormat:", -[TSUNumberFormat numberFormatBySettingNegativeStyle:](self, "numberFormatBySettingNegativeStyle:", *(_QWORD *)&a3));
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
  -[TSUMutableNumberFormat p_copyIVarsFromNumberFormat:](self, "p_copyIVarsFromNumberFormat:", -[TSUNumberFormat numberFormatBySettingUseAccountingStyle:](self, "numberFormatBySettingUseAccountingStyle:", a3));
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
  const __CFString *v5;
  const __CFString *v6;
  objc_super v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("currencyCode")))
  {
    v5 = +[TSUNumberFormatter currentLocaleCurrencyCode](TSUNumberFormatter, "currentLocaleCurrencyCode");
    v6 = CFSTR("currencyCode");
LABEL_7:
    -[TSUMutableNumberFormat setValue:forKey:](self, "setValue:forKey:", v5, v6);
    return;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("prefixString")))
  {
    v5 = &stru_24D61C228;
    v6 = CFSTR("prefixString");
    goto LABEL_7;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("suffixString")))
  {
    v5 = &stru_24D61C228;
    v6 = CFSTR("suffixString");
    goto LABEL_7;
  }
  v7.receiver = self;
  v7.super_class = (Class)TSUMutableNumberFormat;
  -[TSUMutableNumberFormat setNilValueForKey:](&v7, sel_setNilValueForKey_, a3);
}

@end
