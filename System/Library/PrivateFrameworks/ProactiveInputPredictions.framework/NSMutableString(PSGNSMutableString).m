@implementation NSMutableString(PSGNSMutableString)

- (void)psg_removeCharactersFromSet:()PSGNSMutableString
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v7, 2, 0, objc_msgSend(a1, "length"));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v4;
          i != 0x7FFFFFFFFFFFFFFFLL;
          i = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v7, 2, i, objc_msgSend(a1, "length") - i))
    {
      objc_msgSend(a1, "deleteCharactersInRange:", i, v5);
    }
  }

}

@end
