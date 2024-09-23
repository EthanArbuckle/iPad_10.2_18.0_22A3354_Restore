@implementation NSString(ScribbleUtilities)

- (float)safari_similarityToString:()ScribbleUtilities
{
  id v4;
  float v5;
  float v6;

  v4 = a3;
  v5 = 0.0;
  if (objc_msgSend(a1, "length") && objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "_lp_similarityToString:", v4);
    v5 = v6;
  }

  return v5;
}

- (BOOL)safari_isLongEnoughToCheckSimilarity
{
  return (unint64_t)objc_msgSend(a1, "length") > 0x13;
}

@end
