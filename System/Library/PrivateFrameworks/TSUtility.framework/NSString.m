@implementation NSString

id __110__NSString_TSUNumberFormatStringUtilities__newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("−\uFE6E－﹢＋"));
  newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand_replacedCharacterSet = (uint64_t)result;
  return result;
}

void __55__NSString_SFUJsonAdditions__appendJsonStringToString___block_invoke()
{
  void *v0;
  int v1;

  appendJsonStringToString__escapeCharacters = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 0, 32);
  objc_msgSend((id)appendJsonStringToString__escapeCharacters, "addCharactersInString:", CFSTR("\"\\"));
  v1 = 539566120;
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &v1, 2);
  objc_msgSend((id)appendJsonStringToString__escapeCharacters, "addCharactersInString:", v0);

}

@end
