@implementation NSString(VisionCore)

- (id)VisionCore_stringAppendedWithPaddingCharacter:()VisionCore toMinimumLength:
{
  unint64_t v7;
  void *v8;
  id v9;

  v7 = objc_msgSend(a1, "length");
  if (a4 <= v7)
  {
    v9 = a1;
  }
  else
  {
    _repeatedCharacterString(a3, a4 - v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringByAppendingString:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)VisionCore_stringPrependedWithPaddingCharacter:()VisionCore toMinimumLength:
{
  unint64_t v7;
  void *v8;
  id v9;

  v7 = objc_msgSend(a1, "length");
  if (a4 <= v7)
  {
    v9 = a1;
  }
  else
  {
    _repeatedCharacterString(a3, a4 - v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", a1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

@end
