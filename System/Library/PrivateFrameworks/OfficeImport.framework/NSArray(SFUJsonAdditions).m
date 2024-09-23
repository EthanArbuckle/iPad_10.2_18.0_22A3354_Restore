@implementation NSArray(SFUJsonAdditions)

- (uint64_t)sfu_appendJsonStringToString:()SFUJsonAdditions
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(a3, "appendString:", CFSTR("["));
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", v7++), "sfu_appendJsonStringToString:", a3);
      if (v7 < v6)
        objc_msgSend(a3, "appendString:", CFSTR(","));
    }
    while (v6 != v7);
  }
  return objc_msgSend(a3, "appendString:", CFSTR("]"));
}

@end
