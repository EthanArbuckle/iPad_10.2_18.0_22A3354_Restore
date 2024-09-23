@implementation OITSUCustomFormatData

+ (id)customFormatData
{
  return objc_alloc_init(OITSUCustomFormatData);
}

- (OITSUCustomFormatData)initWithCustomFormatData:(id)a3
{
  id v4;
  OITSUCustomFormatData *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OITSUCustomFormatData;
  v5 = -[OITSUCustomFormatData init](&v7, sel_init);
  if (v5)
    objc_msgSend(v4, "p_copySelfTo:", v5);

  return v5;
}

- (OITSUCustomFormatData)init
{
  OITSUCustomFormatData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUCustomFormatData;
  result = -[OITSUCustomFormatData init](&v3, sel_init);
  if (result)
  {
    result->_scaleFactor = 1.0;
    result->_fractionAccuracy = -3;
    *(_WORD *)&result->_showThousandsSeparator = 0;
    result->_formatContainsIntegerToken = 1;
  }
  return result;
}

- (void)p_copySelfTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[OITSUCustomFormatData formatString](self, "formatString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFormatString:", v4);

  -[OITSUCustomFormatData interstitialStrings](self, "interstitialStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterstitialStrings:", v5);

  -[OITSUCustomFormatData interstitialStringInsertionIndexes](self, "interstitialStringInsertionIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterstitialStringInsertionIndexes:", v6);

  -[OITSUCustomFormatData scaleFactor](self, "scaleFactor");
  objc_msgSend(v7, "setScaleFactor:");
  objc_msgSend(v7, "setFractionAccuracy:", -[OITSUCustomFormatData fractionAccuracy](self, "fractionAccuracy"));
  objc_msgSend(v7, "setMinimumIntegerWidth:", -[OITSUCustomFormatData minimumIntegerWidth](self, "minimumIntegerWidth"));
  objc_msgSend(v7, "setDecimalWidth:", -[OITSUCustomFormatData decimalWidth](self, "decimalWidth"));
  objc_msgSend(v7, "setNumberOfNonSpaceIntegerPlaceholderDigits:", -[OITSUCustomFormatData numberOfNonSpaceIntegerPlaceholderDigits](self, "numberOfNonSpaceIntegerPlaceholderDigits"));
  objc_msgSend(v7, "setNumberOfNonSpaceDecimalPlaceholderDigits:", -[OITSUCustomFormatData numberOfNonSpaceDecimalPlaceholderDigits](self, "numberOfNonSpaceDecimalPlaceholderDigits"));
  objc_msgSend(v7, "setIndexFromRightOfLastDigitPlaceholder:", -[OITSUCustomFormatData indexFromRightOfLastDigitPlaceholder](self, "indexFromRightOfLastDigitPlaceholder"));
  objc_msgSend(v7, "setNumberOfHashDecimalPlaceholders:", -[OITSUCustomFormatData numberOfHashDecimalPlaceholders](self, "numberOfHashDecimalPlaceholders"));
  objc_msgSend(v7, "setTotalNumberOfDecimalPlaceholdersInFormat:", -[OITSUCustomFormatData totalNumberOfDecimalPlaceholdersInFormat](self, "totalNumberOfDecimalPlaceholdersInFormat"));
  objc_msgSend(v7, "setCurrencyCodeIndex:", -[OITSUCustomFormatData currencyCodeIndex](self, "currencyCodeIndex"));
  objc_msgSend(v7, "setShowThousandsSeparator:", -[OITSUCustomFormatData showThousandsSeparator](self, "showThousandsSeparator"));
  objc_msgSend(v7, "setUseAccountingStyle:", -[OITSUCustomFormatData useAccountingStyle](self, "useAccountingStyle"));
  objc_msgSend(v7, "setRequiresFractionReplacement:", -[OITSUCustomFormatData requiresFractionReplacement](self, "requiresFractionReplacement"));
  objc_msgSend(v7, "setIsConditional:", -[OITSUCustomFormatData isConditional](self, "isConditional"));
  objc_msgSend(v7, "setFormatContainsIntegerToken:", -[OITSUCustomFormatData formatContainsIntegerToken](self, "formatContainsIntegerToken"));
  objc_msgSend(v7, "setIsComplexFormat:", -[OITSUCustomFormatData isComplexFormat](self, "isComplexFormat"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  OITSUMutableCustomFormatData *v4;

  v4 = -[OITSUCustomFormatData init](+[OITSUMutableCustomFormatData allocWithZone:](OITSUMutableCustomFormatData, "allocWithZone:", a3), "init");
  -[OITSUCustomFormatData p_copySelfTo:](self, "p_copySelfTo:", v4);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  double v21;
  double v22;
  double v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  BOOL v39;
  void *v40;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_30;
  v7 = -[OITSUCustomFormatData showThousandsSeparator](self, "showThousandsSeparator");
  if (v7 != objc_msgSend(v6, "showThousandsSeparator"))
    goto LABEL_30;
  v8 = -[OITSUCustomFormatData useAccountingStyle](self, "useAccountingStyle");
  if (v8 != objc_msgSend(v6, "useAccountingStyle"))
    goto LABEL_30;
  v9 = -[OITSUCustomFormatData requiresFractionReplacement](self, "requiresFractionReplacement");
  if (v9 != objc_msgSend(v6, "requiresFractionReplacement"))
    goto LABEL_30;
  v10 = -[OITSUCustomFormatData isConditional](self, "isConditional");
  if (v10 != objc_msgSend(v6, "isConditional"))
    goto LABEL_30;
  v11 = -[OITSUCustomFormatData formatContainsIntegerToken](self, "formatContainsIntegerToken");
  if (v11 != objc_msgSend(v6, "formatContainsIntegerToken"))
    goto LABEL_30;
  v12 = -[OITSUCustomFormatData isComplexFormat](self, "isComplexFormat");
  if (v12 != objc_msgSend(v6, "isComplexFormat"))
    goto LABEL_30;
  v13 = -[OITSUCustomFormatData fractionAccuracy](self, "fractionAccuracy");
  if (v13 != objc_msgSend(v6, "fractionAccuracy"))
    goto LABEL_30;
  v14 = -[OITSUCustomFormatData minimumIntegerWidth](self, "minimumIntegerWidth");
  if (v14 != objc_msgSend(v6, "minimumIntegerWidth"))
    goto LABEL_30;
  v15 = -[OITSUCustomFormatData decimalWidth](self, "decimalWidth");
  if (v15 != objc_msgSend(v6, "decimalWidth"))
    goto LABEL_30;
  v16 = -[OITSUCustomFormatData numberOfNonSpaceIntegerPlaceholderDigits](self, "numberOfNonSpaceIntegerPlaceholderDigits");
  if (v16 != objc_msgSend(v6, "numberOfNonSpaceIntegerPlaceholderDigits"))
    goto LABEL_30;
  v17 = -[OITSUCustomFormatData numberOfNonSpaceDecimalPlaceholderDigits](self, "numberOfNonSpaceDecimalPlaceholderDigits");
  if (v17 != objc_msgSend(v6, "numberOfNonSpaceDecimalPlaceholderDigits"))
    goto LABEL_30;
  v18 = -[OITSUCustomFormatData indexFromRightOfLastDigitPlaceholder](self, "indexFromRightOfLastDigitPlaceholder");
  if (v18 != objc_msgSend(v6, "indexFromRightOfLastDigitPlaceholder"))
    goto LABEL_30;
  v19 = -[OITSUCustomFormatData numberOfHashDecimalPlaceholders](self, "numberOfHashDecimalPlaceholders");
  if (v19 != objc_msgSend(v6, "numberOfHashDecimalPlaceholders"))
    goto LABEL_30;
  v20 = -[OITSUCustomFormatData totalNumberOfDecimalPlaceholdersInFormat](self, "totalNumberOfDecimalPlaceholdersInFormat");
  if (v20 != objc_msgSend(v6, "totalNumberOfDecimalPlaceholdersInFormat"))
    goto LABEL_30;
  -[OITSUCustomFormatData scaleFactor](self, "scaleFactor");
  v22 = v21;
  objc_msgSend(v6, "scaleFactor");
  if (v22 != v23)
    goto LABEL_30;
  v24 = -[OITSUCustomFormatData currencyCodeIndex](self, "currencyCodeIndex");
  if (v24 != objc_msgSend(v6, "currencyCodeIndex"))
    goto LABEL_30;
  -[OITSUCustomFormatData formatString](self, "formatString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[OITSUCustomFormatData formatString](self, "formatString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formatString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqualToString:", v27);

    if ((v28 & 1) == 0)
      goto LABEL_30;
  }
  else
  {
    objc_msgSend(v6, "formatString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      goto LABEL_30;
  }
  -[OITSUCustomFormatData interstitialStrings](self, "interstitialStrings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[OITSUCustomFormatData interstitialStrings](self, "interstitialStrings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interstitialStrings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqualToArray:", v32);

    if ((v33 & 1) == 0)
      goto LABEL_30;
  }
  else
  {
    objc_msgSend(v6, "interstitialStrings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      goto LABEL_30;
  }
  -[OITSUCustomFormatData interstitialStringInsertionIndexes](self, "interstitialStringInsertionIndexes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    objc_msgSend(v6, "interstitialStringInsertionIndexes");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
      goto LABEL_28;
LABEL_30:
    v39 = 0;
    goto LABEL_31;
  }
  -[OITSUCustomFormatData interstitialStringInsertionIndexes](self, "interstitialStringInsertionIndexes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interstitialStringInsertionIndexes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v36, "isEqualToIndexSet:", v37);

  if ((v38 & 1) == 0)
    goto LABEL_30;
LABEL_28:
  v39 = 1;
LABEL_31:

  return v39;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[OITSUCustomFormatData formatString](self, "formatString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (void)setFormatString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)interstitialStrings
{
  return self->_interstitialStrings;
}

- (void)setInterstitialStrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSIndexSet)interstitialStringInsertionIndexes
{
  return self->_interstitialStringInsertionIndexes;
}

- (void)setInterstitialStringInsertionIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (int)fractionAccuracy
{
  return self->_fractionAccuracy;
}

- (void)setFractionAccuracy:(int)a3
{
  self->_fractionAccuracy = a3;
}

- (unsigned)minimumIntegerWidth
{
  return self->_minimumIntegerWidth;
}

- (void)setMinimumIntegerWidth:(unsigned __int8)a3
{
  self->_minimumIntegerWidth = a3;
}

- (unsigned)decimalWidth
{
  return self->_decimalWidth;
}

- (void)setDecimalWidth:(unsigned __int8)a3
{
  self->_decimalWidth = a3;
}

- (unsigned)numberOfNonSpaceIntegerPlaceholderDigits
{
  return self->_numberOfNonSpaceIntegerPlaceholderDigits;
}

- (void)setNumberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a3
{
  self->_numberOfNonSpaceIntegerPlaceholderDigits = a3;
}

- (unsigned)numberOfNonSpaceDecimalPlaceholderDigits
{
  return self->_numberOfNonSpaceDecimalPlaceholderDigits;
}

- (void)setNumberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a3
{
  self->_numberOfNonSpaceDecimalPlaceholderDigits = a3;
}

- (unsigned)indexFromRightOfLastDigitPlaceholder
{
  return self->_indexFromRightOfLastDigitPlaceholder;
}

- (void)setIndexFromRightOfLastDigitPlaceholder:(unsigned __int8)a3
{
  self->_indexFromRightOfLastDigitPlaceholder = a3;
}

- (unsigned)numberOfHashDecimalPlaceholders
{
  return self->_numberOfHashDecimalPlaceholders;
}

- (void)setNumberOfHashDecimalPlaceholders:(unsigned __int8)a3
{
  self->_numberOfHashDecimalPlaceholders = a3;
}

- (unsigned)totalNumberOfDecimalPlaceholdersInFormat
{
  return self->_totalNumberOfDecimalPlaceholdersInFormat;
}

- (void)setTotalNumberOfDecimalPlaceholdersInFormat:(unsigned __int8)a3
{
  self->_totalNumberOfDecimalPlaceholdersInFormat = a3;
}

- (unsigned)currencyCodeIndex
{
  return self->_currencyCodeIndex;
}

- (void)setCurrencyCodeIndex:(unsigned __int16)a3
{
  self->_currencyCodeIndex = a3;
}

- (BOOL)showThousandsSeparator
{
  return self->_showThousandsSeparator;
}

- (void)setShowThousandsSeparator:(BOOL)a3
{
  self->_showThousandsSeparator = a3;
}

- (BOOL)useAccountingStyle
{
  return self->_useAccountingStyle;
}

- (void)setUseAccountingStyle:(BOOL)a3
{
  self->_useAccountingStyle = a3;
}

- (BOOL)requiresFractionReplacement
{
  return self->_requiresFractionReplacement;
}

- (void)setRequiresFractionReplacement:(BOOL)a3
{
  self->_requiresFractionReplacement = a3;
}

- (BOOL)isConditional
{
  return self->_isConditional;
}

- (void)setIsConditional:(BOOL)a3
{
  self->_isConditional = a3;
}

- (BOOL)formatContainsIntegerToken
{
  return self->_formatContainsIntegerToken;
}

- (void)setFormatContainsIntegerToken:(BOOL)a3
{
  self->_formatContainsIntegerToken = a3;
}

- (BOOL)isComplexFormat
{
  return self->_isComplexFormat;
}

- (void)setIsComplexFormat:(BOOL)a3
{
  self->_isComplexFormat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interstitialStringInsertionIndexes, 0);
  objc_storeStrong((id *)&self->_interstitialStrings, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
}

@end
