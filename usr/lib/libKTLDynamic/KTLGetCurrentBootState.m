@implementation KTLGetCurrentBootState

uint64_t __KTLGetCurrentBootState_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  _DWORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = operator new(0x30uLL);
  v7 = operator new[](a3);
  v6[2] = a3;
  *((_QWORD *)v6 + 2) = v7;
  *(_QWORD *)v6 = &unk_24CC19598;
  v6[6] = a3;
  *((_QWORD *)v6 + 4) = v7;
  *((_QWORD *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = KTLGetCurrentBootStateParseAndRelease((uint64_t)v6, *(_QWORD *)(a1 + 40), *(_DWORD **)(a1 + 48), v8, v9, v10, v11, v12);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return 0;
}

@end
