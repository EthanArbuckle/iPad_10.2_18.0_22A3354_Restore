@implementation PFUserCreate

void __PFUserCreate_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  const void *v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = PFManagerCreate();
  v2 = *(_QWORD **)(a1 + 40);
  v3 = v2[2];
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PFManagerAddUser(v3, v2);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      PFManagerDebugLog();
      return;
    }
    PFManagerErrorLog();
    v4 = *(const void **)(a1 + 40);
  }
  else
  {
    PFManagerErrorLog();
    v4 = *(const void **)(a1 + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  CFRelease(v4);
}

@end
