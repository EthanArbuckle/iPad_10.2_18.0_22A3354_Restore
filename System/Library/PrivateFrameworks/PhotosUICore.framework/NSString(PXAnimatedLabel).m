@implementation NSString(PXAnimatedLabel)

- (uint64_t)rangeOfDigits
{
  return objc_msgSend(a1, "rangeOfString:options:", CFSTR("\\d+"), 1024);
}

- (BOOL)containsDigits
{
  return objc_msgSend(a1, "rangeOfDigits") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)stringByRemovingDigits
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  if (objc_msgSend(v1, "containsDigits"))
  {
    v2 = objc_msgSend(v1, "rangeOfDigits");
    objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", v2, v3, &stru_1E5149688);
    v4 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v4;
  }
  return v1;
}

- (uint64_t)digits
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (!objc_msgSend(a1, "containsDigits"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v2 = objc_msgSend(a1, "rangeOfDigits");
  objc_msgSend(a1, "substringWithRange:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

@end
