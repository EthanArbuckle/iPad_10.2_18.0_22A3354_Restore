@implementation SBXXSetInterceptsMenuButton

uint64_t ___SBXXSetInterceptsMenuButton_block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 40))
    v1 = *(_QWORD *)(a1 + 32);
  else
    v1 = 0;
  return objc_msgSend((id)SBApp, "setMenuButtonInterceptApp:forever:", v1, *(unsigned __int8 *)(a1 + 41) != 0);
}

@end
