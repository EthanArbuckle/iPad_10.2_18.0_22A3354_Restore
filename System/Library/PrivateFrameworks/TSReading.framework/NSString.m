@implementation NSString

uint64_t __38__NSString_TSDAdditions__tsdWordCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __81__NSString_TSWPAdditions__stringForValue_withListNumberFormat_includeFormatting___block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend(v0, "addCharactersInRange:", 46, 1);
  objc_msgSend(v0, "addCharactersInRange:", 40, 1);
  result = objc_msgSend(v0, "addCharactersInRange:", 41, 1);
  +[NSString(TSWPAdditions) stringForValue:withListNumberFormat:includeFormatting:]::_formattingCharacterSet = (uint64_t)v0;
  return result;
}

@end
