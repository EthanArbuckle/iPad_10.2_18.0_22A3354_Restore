@implementation XBStatusBarStateMaskMatchesSettings

uint64_t __XBStatusBarStateMaskMatchesSettings_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = XBStatusBarStateMatchesSettings(a2, *(void **)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

@end
