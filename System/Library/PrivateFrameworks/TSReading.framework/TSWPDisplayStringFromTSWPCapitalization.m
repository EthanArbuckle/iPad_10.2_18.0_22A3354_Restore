@implementation TSWPDisplayStringFromTSWPCapitalization

id __TSWPDisplayStringFromTSWPCapitalization_block_invoke()
{
  id result;

  result = (id)(*((uint64_t (__cdecl **)())s_TSWPCapitalizationStringsInitBlock + 2))();
  s_TSWPCapitalizationStrings = (uint64_t)result;
  return result;
}

@end
