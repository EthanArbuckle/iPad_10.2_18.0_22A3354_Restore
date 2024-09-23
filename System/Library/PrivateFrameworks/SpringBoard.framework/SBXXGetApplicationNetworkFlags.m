@implementation SBXXGetApplicationNetworkFlags

uint64_t ___SBXXGetApplicationNetworkFlags_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dataUsage");
  **(_BYTE **)(a1 + 40) = result & 1;
  **(_BYTE **)(a1 + 48) = result & 2;
  return result;
}

@end
