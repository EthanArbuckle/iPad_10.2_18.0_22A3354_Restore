@implementation NSCharacterSet(SFWPAdditions)

+ (uint64_t)breakingSpaceCharacterSet
{
  uint64_t result;
  void *v1;
  id v2;

  result = +[NSCharacterSet(SFWPAdditions) breakingSpaceCharacterSet]::sBreakingSpaceCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) breakingSpaceCharacterSet]::sBreakingSpaceCharacterSet)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &sBreakingSpaceCharacterArray, 15);
    +[NSCharacterSet(SFWPAdditions) breakingSpaceCharacterSet]::sBreakingSpaceCharacterSet = objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v1);
    v2 = (id)+[NSCharacterSet(SFWPAdditions) breakingSpaceCharacterSet]::sBreakingSpaceCharacterSet;

    return +[NSCharacterSet(SFWPAdditions) breakingSpaceCharacterSet]::sBreakingSpaceCharacterSet;
  }
  return result;
}

+ (uint64_t)invisibleCharacterSet
{
  uint64_t result;
  void *v1;
  id v2;

  result = +[NSCharacterSet(SFWPAdditions) invisibleCharacterSet]::sInvisibleCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) invisibleCharacterSet]::sInvisibleCharacterSet)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &sInvisibleCharacterArray, 31);
    +[NSCharacterSet(SFWPAdditions) invisibleCharacterSet]::sInvisibleCharacterSet = objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v1);
    v2 = (id)+[NSCharacterSet(SFWPAdditions) invisibleCharacterSet]::sInvisibleCharacterSet;

    return +[NSCharacterSet(SFWPAdditions) invisibleCharacterSet]::sInvisibleCharacterSet;
  }
  return result;
}

+ (uint64_t)spaceCharacterSet
{
  uint64_t result;
  void *v1;
  id v2;

  result = +[NSCharacterSet(SFWPAdditions) spaceCharacterSet]::sSpaceCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) spaceCharacterSet]::sSpaceCharacterSet)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &sSpaceCharacterArray, 19);
    +[NSCharacterSet(SFWPAdditions) spaceCharacterSet]::sSpaceCharacterSet = objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v1);
    v2 = (id)+[NSCharacterSet(SFWPAdditions) spaceCharacterSet]::sSpaceCharacterSet;

    return +[NSCharacterSet(SFWPAdditions) spaceCharacterSet]::sSpaceCharacterSet;
  }
  return result;
}

+ (uint64_t)normalQuotesCharacterSet
{
  uint64_t result;
  int v1;

  result = +[NSCharacterSet(SFWPAdditions) normalQuotesCharacterSet]::sNormalQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) normalQuotesCharacterSet]::sNormalQuotesCharacterSet)
  {
    v1 = 2555938;
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD1690]), "initWithCharacters:length:", &v1, 2);
    +[NSCharacterSet(SFWPAdditions) normalQuotesCharacterSet]::sNormalQuotesCharacterSet = result;
  }
  return result;
}

+ (uint64_t)smartSingleQuotesCharacterSet
{
  uint64_t result;
  int v1;

  result = +[NSCharacterSet(SFWPAdditions) smartSingleQuotesCharacterSet]::sSmartSingleQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) smartSingleQuotesCharacterSet]::sSmartSingleQuotesCharacterSet)
  {
    v1 = 538517528;
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD1690]), "initWithCharacters:length:", &v1, 2);
    +[NSCharacterSet(SFWPAdditions) smartSingleQuotesCharacterSet]::sSmartSingleQuotesCharacterSet = result;
  }
  return result;
}

+ (uint64_t)smartDoubleQuotesCharacterSet
{
  uint64_t result;
  int v1;

  result = +[NSCharacterSet(SFWPAdditions) smartDoubleQuotesCharacterSet]::sSmartDoubleQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) smartDoubleQuotesCharacterSet]::sSmartDoubleQuotesCharacterSet)
  {
    v1 = 538779676;
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD1690]), "initWithCharacters:length:", &v1, 2);
    +[NSCharacterSet(SFWPAdditions) smartDoubleQuotesCharacterSet]::sSmartDoubleQuotesCharacterSet = result;
  }
  return result;
}

+ (uint64_t)smartQuotesCharacterSet
{
  uint64_t result;
  _QWORD v1[2];

  v1[1] = *MEMORY[0x24BDAC8D0];
  result = +[NSCharacterSet(SFWPAdditions) smartQuotesCharacterSet]::sSmartQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) smartQuotesCharacterSet]::sSmartQuotesCharacterSet)
  {
    v1[0] = 0x201D201C20192018;
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD1690]), "initWithCharacters:length:", v1, 4);
    +[NSCharacterSet(SFWPAdditions) smartQuotesCharacterSet]::sSmartQuotesCharacterSet = result;
  }
  return result;
}

+ (uint64_t)allQuotesCharacterSetExcludingLeft
{
  uint64_t result;
  _QWORD v1[2];

  v1[1] = *MEMORY[0x24BDAC8D0];
  result = +[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingLeft]::sAllQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingLeft]::sAllQuotesCharacterSet)
  {
    v1[0] = 0x270022201D2019;
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD1690]), "initWithCharacters:length:", v1, 6);
    +[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingLeft]::sAllQuotesCharacterSet = result;
  }
  return result;
}

+ (uint64_t)allQuotesCharacterSetExcludingRight
{
  uint64_t result;
  _QWORD v1[2];

  v1[1] = *MEMORY[0x24BDAC8D0];
  result = +[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingRight]::sAllQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingRight]::sAllQuotesCharacterSet)
  {
    v1[0] = 0x270022201C2018;
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD1690]), "initWithCharacters:length:", v1, 4);
    +[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingRight]::sAllQuotesCharacterSet = result;
  }
  return result;
}

+ (void)preSmartSet
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 0xEFFFC00050004;
  v5 = 6;
  v0 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v4, 5);
  v1 = objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithCharactersInString:", v0);
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"));
  objc_msgSend(v2, "formUnionWithCharacterSet:", v1);
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x24BDD14A8], "allQuotesCharacterSetExcludingRight"));
  return v2;
}

+ (void)postSmartSet
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 0xEFFFC00050004;
  v5 = 6;
  v0 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v4, 5);
  v1 = objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithCharactersInString:", v0);
  v2 = (void *)objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithCharactersInString:", CFSTR(")].,;:?'!\"%*-/}"));
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"));
  objc_msgSend(v2, "formUnionWithCharacterSet:", v1);
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x24BDD14A8], "allQuotesCharacterSetExcludingLeft"));
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet"));
  return v2;
}

+ (uint64_t)lineBreakingCharacterSet
{
  uint64_t v0;
  __int128 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = xmmword_217C2AC9A;
  v3 = 539492356;
  v0 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v2, 10);
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v0);
}

@end
