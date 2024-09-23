@implementation OSASafeMoveItem

uint64_t __OSASafeMoveItem_block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  _QWORD v4[5];
  __int128 v5;
  int v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __OSASafeMoveItem_block_invoke_2;
  v4[3] = &unk_1E4DEE618;
  v2 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v5 = *(_OWORD *)(a1 + 48);
  return OSASafeOpen(v2, 0, 0, v4);
}

uint64_t __OSASafeMoveItem_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;

  result = renameatx_np(*(_DWORD *)(a1 + 56), *(const char **)(a1 + 40), a2, *(const char **)(a1 + 48), 4u);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result == 0;
  return result;
}

@end
