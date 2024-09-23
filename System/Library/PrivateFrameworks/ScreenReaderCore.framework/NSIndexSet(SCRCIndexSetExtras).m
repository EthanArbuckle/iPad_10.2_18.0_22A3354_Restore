@implementation NSIndexSet(SCRCIndexSetExtras)

- (uint64_t)firstIndexCommonWithIndexSet:()SCRCIndexSetExtras
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  v6 = objc_msgSend(v4, "count");
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 && v6)
  {
    if (v5 >= v6)
      v8 = a1;
    else
      v8 = v4;
    if (v5 >= v6)
      v9 = v4;
    else
      v9 = a1;
    v10 = v8;
    v11 = v9;
    v12 = objc_msgSend(v11, "firstIndex");
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v12;
      while ((objc_msgSend(v10, "containsIndex:", v7) & 1) == 0)
      {
        v7 = objc_msgSend(v11, "indexGreaterThanIndex:", v7);
        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v7 = 0x7FFFFFFFFFFFFFFFLL;
          break;
        }
      }
    }

  }
  return v7;
}

@end
