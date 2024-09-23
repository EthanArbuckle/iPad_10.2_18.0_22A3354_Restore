@implementation PXNumberFormatter

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6
{
  _BOOL4 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXNumberFormatter;
  v7 = -[PXNumberFormatter getObjectValue:forString:range:error:](&v9, sel_getObjectValue_forString_range_error_, a3, a4, a5, a6);
  if (a3 && v7 && !*a3)
    *a3 = &unk_1E53EC510;
  return v7;
}

@end
