@implementation NSAttributedString(TIExtras)

- (id)_UIKBStringWideAttributeValueForKey:()TIExtras
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  if (objc_msgSend(a1, "length"))
  {
    v5 = objc_msgSend(a1, "length");
    v12 = 0;
    v13 = 0;
    objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v4, 0, &v12);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5 == v13 && v12 == 0)
      v9 = (void *)v6;
    else
      v9 = 0;
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
