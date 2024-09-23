@implementation NSCharacterSet(Cursive)

+ (uint64_t)cyrillicCharacters
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithRange:", 1024, 256);
}

+ (uint64_t)cyrillicCharactersWithUniqueWritingRule
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("йёєб"));
}

+ (uint64_t)arabicCharactersWithUniqueWritingRule
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ﺐﺒﺑﺖﺘﺗﺚﺜﺛﺞﺠﺟﺦﺨﺧﺬﺰﺶﺸﺷﺾﻀﺿﻆﻈﻇﻎﻐﻏﻒﻔﻓﻖﻘﻗﻚﻦﻨﻧﻲﻴﻳﺂﺔﺆﺓﷲﻹﻼ"));
}

+ (uint64_t)arabicIsolatedCharacters
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ﺍﺏﺕﺙﺝﺡﺥﺩﺫﺭﺯﺱﺵﺹﺽﻁﻅﻉﻍﻑﻕﻙﻝﻡﻥﻩﻭﻱﺁﺓﻯﺀﻹﷲ"));
}

+ (uint64_t)arabicGenericCharacters
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithRange:", 1536, 256);
}

+ (uint64_t)arabicPresentationFormCharacters
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithRange:", 65136, 144);
}

@end
