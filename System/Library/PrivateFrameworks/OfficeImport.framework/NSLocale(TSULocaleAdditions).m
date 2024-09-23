@implementation NSLocale(TSULocaleAdditions)

+ (const)tsu_firstPreferredLocalization
{
  void *v0;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "preferredLocalizations");
  if (objc_msgSend(v0, "count"))
    return (const __CFString *)objc_msgSend(v0, "objectAtIndexedSubscript:", 0);
  else
    return CFSTR("en_US");
}

@end
