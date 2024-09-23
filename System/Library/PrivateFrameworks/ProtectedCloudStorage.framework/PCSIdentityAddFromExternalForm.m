@implementation PCSIdentityAddFromExternalForm

uint64_t ___PCSIdentityAddFromExternalForm_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (!*(_QWORD *)(v3 + 24))
  {
    v4 = *(_QWORD *)(a3 + 16);
    if (v4)
    {
      v5 = *(_DWORD **)(v4 + 16);
      if (v5)
      {
        if (*v5 == **(_DWORD **)(result + 40))
          *(_QWORD *)(v3 + 24) = a3;
      }
    }
  }
  return result;
}

@end
