@implementation StringFromPreferencesStackSignals

uint64_t ___StringFromPreferencesStackSignals_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("|"));
  return result;
}

@end
