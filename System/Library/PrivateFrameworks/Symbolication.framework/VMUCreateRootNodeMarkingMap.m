@implementation VMUCreateRootNodeMarkingMap

BOOL __VMUCreateRootNodeMarkingMap_block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  _BOOL8 result;
  unsigned int *v6;

  result = VMUGraphNodeType_IsRoot(*(_QWORD *)(a3 + 8) >> 60);
  if (result)
  {
    v6 = *(unsigned int **)(a1 + 32);
    if (*v6 > a2)
      *((_BYTE *)v6 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
  }
  return result;
}

@end
