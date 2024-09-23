@implementation ParseBracesWithDelimiter

CFCharacterSetRef __ParseBracesWithDelimiter_block_invoke()
{
  CFCharacterSetRef result;

  result = CFCharacterSetCreateWithCharactersInString(0, CFSTR("{[]}"));
  _MergedGlobals_1085 = (uint64_t)result;
  return result;
}

@end
