@implementation PFSConstants

+ (unint64_t)colorForName:(const char *)a3
{
  unint64_t result;

  result = (unint64_t)objc_msgSend(a1, "findcolorInfo:", a3);
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

+ (id)languageForString:(id)a3
{
  uint64_t v4;
  const __CFString *v5;

  v4 = 0;
  v5 = CFSTR("en_US");
  while (!objc_msgSend(a3, "startsWithString:", *(__CFString **)((char *)&off_42BF58 + v4 + 8)))
  {
    v4 += 16;
    if (v4 == 240)
      return (id)v5;
  }
  return *(__CFString **)((char *)&off_42BF58 + v4);
}

+ (_colorInfo)findcolorInfo:(const char *)a3
{
  uint64_t v4;

  v4 = 0;
  while (xmlStrcmp((const xmlChar *)a3, (const xmlChar *)(&off_540D28)[v4]))
  {
    v4 += 2;
    if (v4 == 280)
      return 0;
  }
  return (_colorInfo *)&(&off_540D28)[v4];
}

@end
