@implementation SBXXSetApplicationNetworkFlags

uint64_t ___SBXXSetApplicationNetworkFlags_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUsesEdgeNetwork:", *(_BYTE *)(a1 + 40) != 0);
  return objc_msgSend(*(id *)(a1 + 32), "setUsesWiFiNetwork:", *(_BYTE *)(a1 + 41) != 0);
}

@end
