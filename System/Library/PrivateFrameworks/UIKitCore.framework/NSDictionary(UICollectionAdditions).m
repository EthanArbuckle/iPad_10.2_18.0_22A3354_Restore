@implementation NSDictionary(UICollectionAdditions)

- (uint64_t)_BOOLForKey:()UICollectionAdditions
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v5;

  v1 = objc_msgSend(a1, "objectForKey:");
  if (v1)
  {
    v2 = (void *)v1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v2, "isEqual:", CFSTR("YES")) & 1) != 0)
        return 1;
      v5 = objc_msgSend(v2, "length");
      v3 = 1;
      if (objc_msgSend(v2, "compare:options:range:", CFSTR("YES"), 1, 0, v5))
      {
        v3 = 1;
        if (objc_msgSend(v2, "compare:options:range:", CFSTR("Y"), 1, 0, v5))
          return objc_msgSend(v2, "intValue") != 0;
      }
      return v3;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return objc_msgSend(v2, "BOOLValue");
  }
  return 0;
}

@end
