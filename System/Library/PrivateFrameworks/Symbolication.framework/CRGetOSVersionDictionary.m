@implementation CRGetOSVersionDictionary

uint64_t ___CRGetOSVersionDictionary_block_invoke()
{
  uint64_t result;

  result = _CFCopyServerVersionDictionary();
  if (!result)
    result = _CFCopySystemVersionDictionary();
  _CRGetOSVersionDictionary__osVersionDict = result;
  return result;
}

@end
