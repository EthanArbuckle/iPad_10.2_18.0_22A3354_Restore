@implementation CRLDecimalFormatter

- (CRLDecimalFormatter)initWithLocale:(id)a3 style:(int64_t)a4
{
  CRLDecimalFormatter *v4;
  CRLDecimalFormatter *v5;
  NSString *format;
  NSString *currencyCode;
  NSString *currencySymbol;
  NSString *exponentSymbol;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLDecimalFormatter;
  v4 = -[CRLDecimalFormatter init](&v11, "init", a3, a4);
  v5 = v4;
  if (v4)
  {
    format = v4->_format;
    v4->_format = (NSString *)CFSTR("#.##");

    v5->_useGroupingSeparator = 1;
    *(_OWORD *)&v5->_minIntegerDigits = xmmword_100EEECB0;
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)CFSTR("USD");

    currencySymbol = v5->_currencySymbol;
    v5->_currencySymbol = (NSString *)CFSTR("$");

    exponentSymbol = v5->_exponentSymbol;
    v5->_exponentSymbol = (NSString *)CFSTR("E");

  }
  return v5;
}

- (CRLLocale)locale
{
  return +[CRLLocale preferredLocale](CRLLocale, "preferredLocale");
}

- (id)createStringWithValue:(double)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a3);
}

- (BOOL)getValueFromString:(id)a3 rangePtr:(_NSRange *)a4 valuePtr:(double *)a5
{
  id v7;
  void *v8;
  BOOL v9;
  id v10;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLLocale preferredLocale](CRLLocale, "preferredLocale"));
  v9 = +[CRLNumberParser numberValueFromString:locale:outDoubleValue:](CRLNumberParser, "numberValueFromString:locale:outDoubleValue:", v7, v8, a5);

  if (a4)
  {
    v10 = objc_msgSend(v7, "length");
    a4->location = 0;
    a4->length = (NSUInteger)v10;
  }

  return v9;
}

- (id)copyFormatterPropertyForKey:(__CFString *)a3
{
  return 0;
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (BOOL)useGroupingSeparator
{
  return self->_useGroupingSeparator;
}

- (void)setUseGroupingSeparator:(BOOL)a3
{
  self->_useGroupingSeparator = a3;
}

- (int)minIntegerDigits
{
  return self->_minIntegerDigits;
}

- (void)setMinIntegerDigits:(int)a3
{
  self->_minIntegerDigits = a3;
}

- (int)maxIntegerDigits
{
  return self->_maxIntegerDigits;
}

- (void)setMaxIntegerDigits:(int)a3
{
  self->_maxIntegerDigits = a3;
}

- (int)minFractionDigits
{
  return self->_minFractionDigits;
}

- (void)setMinFractionDigits:(int)a3
{
  self->_minFractionDigits = a3;
}

- (int)maxFractionDigits
{
  return self->_maxFractionDigits;
}

- (void)setMaxFractionDigits:(int)a3
{
  self->_maxFractionDigits = a3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSString)currencySymbol
{
  return self->_currencySymbol;
}

- (NSString)exponentSymbol
{
  return self->_exponentSymbol;
}

- (void)setExponentSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_exponentSymbol, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exponentSymbol, 0);
  objc_storeStrong((id *)&self->_currencySymbol, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

- (_NSRange)crl_rangeOfNumericValueInString:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = sub_100D3020C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_100D2F83C);
  result.length = v4;
  result.location = v3;
  return result;
}

@end
