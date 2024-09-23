@implementation NSString(NSURLAdditionsAdditions)

- (BOOL)containsPercentEscapes
{
  unint64_t v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  BOOL i;
  uint64_t v7;
  unint64_t v8;

  v2 = objc_msgSend(a1, "length");
  if ((v3 & 1) == 0
  {
    -[NSString(NSURLAdditionsAdditions) containsPercentEscapes]::hexSet = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789abcdefABCDEF"));
  }
  v4 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("%"), 0, 0, v2);
  for (i = v4 != 0x7FFFFFFFFFFFFFFFLL; v4 != 0x7FFFFFFFFFFFFFFFLL; i = v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v4 + v5;
    v8 = v4 + v5 + 1;
    if (v8 < v2
      && objc_msgSend((id)-[NSString(NSURLAdditionsAdditions) containsPercentEscapes]::hexSet, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v7))&& (objc_msgSend((id)-[NSString(NSURLAdditionsAdditions) containsPercentEscapes]::hexSet, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v8)) & 1) != 0)
    {
      break;
    }
    v4 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("%"), 0, v7, v2 - v7);
  }
  return i;
}

@end
