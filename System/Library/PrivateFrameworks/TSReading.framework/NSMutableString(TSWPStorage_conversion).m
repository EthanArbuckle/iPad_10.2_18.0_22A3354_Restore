@implementation NSMutableString(TSWPStorage_conversion)

- (uint64_t)replaceBreaksWithPlainTextVersions
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  int v5;
  __int16 v6;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    v3 = 0;
    v6 = 8233;
    v5 = 720906;
    do
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", (char *)&v5 + v3, 1, 0);
      objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", v4, CFSTR("\n"), 2, 0, objc_msgSend(a1, "length"));

      v3 += 2;
    }
    while (v3 != 6);
    objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\x04"), CFSTR("\f"), 2, 0, objc_msgSend(a1, "length"));
    return objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\x05"), CFSTR("\f"), 2, 0, objc_msgSend(a1, "length"));
  }
  return result;
}

@end
