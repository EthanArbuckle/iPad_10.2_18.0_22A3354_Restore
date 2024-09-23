@implementation PFUserRelease

void __PFUserRelease_block_invoke(uint64_t a1)
{
  const void *v2;
  void *v3;
  uint64_t *v4;
  char v5;
  const void *v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v2 = *(const void **)(a1 + 32);
    if (v2)
    {
      v3 = _Block_copy(v2);
      v4 = *(uint64_t **)(a1 + 48);
      v4[7] = (uint64_t)v3;
    }
    else
    {
      v4 = *(uint64_t **)(a1 + 48);
    }
    v5 = PFManagerReleaseUser(v4[2], v4);
    v6 = *(const void **)(a1 + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
    CFRelease(v6);
  }
  else
  {
    PFManagerErrorLog();
  }
}

uint64_t ____PFUserRelease_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
}

@end
