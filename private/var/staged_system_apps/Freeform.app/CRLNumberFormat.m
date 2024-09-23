@implementation CRLNumberFormat

- (id)decimalFormatterForLocale:(id)a3
{
  id v3;
  CRLDecimalFormatter *v4;

  v3 = a3;
  v4 = -[CRLDecimalFormatter initWithLocale:style:]([CRLDecimalFormatter alloc], "initWithLocale:style:", v3, 1);

  return v4;
}

@end
