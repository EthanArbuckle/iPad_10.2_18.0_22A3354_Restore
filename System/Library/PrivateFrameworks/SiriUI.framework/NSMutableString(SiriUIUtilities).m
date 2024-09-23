@implementation NSMutableString(SiriUIUtilities)

- (void)siriUIAppendStringWithCommaSeparation:()SiriUIUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "length");
    v5 = v7;
    if (v6)
    {
      if (objc_msgSend(a1, "length"))
        objc_msgSend(a1, "appendString:", CFSTR(", "));
      objc_msgSend(a1, "appendString:", v7);
      v5 = v7;
    }
  }

}

@end
