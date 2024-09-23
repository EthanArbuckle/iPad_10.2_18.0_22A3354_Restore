@implementation NSMutableString(VisionCore)

- (void)VisionCore_appendPaddingCharacter:()VisionCore toMinimumLength:
{
  unint64_t v7;
  id v8;

  v7 = objc_msgSend(a1, "length");
  if (a4 > v7)
  {
    _repeatedCharacterString(a3, a4 - v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "appendString:", v8);

  }
}

- (void)VisionCore_prependPaddingCharacter:()VisionCore toMinimumLength:
{
  unint64_t v7;
  id v8;

  v7 = objc_msgSend(a1, "length");
  if (a4 > v7)
  {
    _repeatedCharacterString(a3, a4 - v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "insertString:atIndex:", v8, 0);

  }
}

@end
