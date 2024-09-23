@implementation CRLNumberParser

+ (BOOL)numberValueFromString:(id)a3 locale:(id)a4 outDoubleValue:(double *)a5
{
  uint64_t v6;

  if (a5)
  {
    objc_msgSend(a3, "doubleValue");
    *(_QWORD *)a5 = v6;
  }
  return a5 != 0;
}

@end
