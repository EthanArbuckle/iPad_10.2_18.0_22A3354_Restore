@implementation AFCProcessFileRefSeekPacket

uint64_t __AFCProcessFileRefSeekPacket_block_invoke(uint64_t a1)
{
  off_t v2;
  off_t v3;
  uint64_t result;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v2 = lseek(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 56) + 80), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56), *(_DWORD *)(a1 + 60));
  if (v2 < 0)
  {
    v5 = __error();
    result = __AFCSetErrorResult_4(0, *v5, 3892330497, v6, 2509, "lseek", v7, v8, v9);
  }
  else
  {
    v3 = v2;
    result = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 56) + 88) = v3;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
