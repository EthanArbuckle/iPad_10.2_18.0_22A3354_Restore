@implementation AFCProcessFileRefTellPacket

uint64_t __AFCProcessFileRefTellPacket_block_invoke(uint64_t a1)
{
  uint64_t result;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = lseek(*(_DWORD *)(*(_QWORD *)(a1 + 48)+ 40 * *(unsigned int *)(a1 + 56)+ 80), 0, 1);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == -1)
  {
    v3 = __error();
    result = __AFCSetErrorResult_4(0, *v3, 3892330497, v4, 2548, "lseek", v5, v6, v7);
  }
  else
  {
    result = 0;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
