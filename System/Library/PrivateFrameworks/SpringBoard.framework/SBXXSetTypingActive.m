@implementation SBXXSetTypingActive

uint64_t ___SBXXSetTypingActive_block_invoke(uint64_t a1)
{
  _BOOL8 v1;
  __int128 v2;
  _OWORD v4[2];

  v1 = *(_BYTE *)(a1 + 64) != 0;
  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend((id)SBApp, "setTypingActive:auditToken:", v1, v4);
}

@end
