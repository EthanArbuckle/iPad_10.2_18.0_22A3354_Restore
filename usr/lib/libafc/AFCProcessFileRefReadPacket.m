@implementation AFCProcessFileRefReadPacket

uint64_t __AFCProcessFileRefReadPacket_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  size_t i;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  result = AFCGetBuffer(*(_QWORD *)(a1 + 88), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(v3 + 16);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    for (i = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) < i;
          i = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v5 = *(_DWORD *)(a1 + 96);
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (*(_BYTE *)(a1 + 104))
      {
        result = pread(v5, v6, i, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = result;
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        if (v7 < 1)
          return result;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += v7;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                 + 24);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) -= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                 + 24);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v9 = *(_QWORD *)(v8 + 24) + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      }
      else
      {
        result = read(v5, v6, i);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = result;
        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        if (v10 < 1)
          return result;
        v11 = *(_QWORD *)(a1 + 88) + 40 * *(unsigned int *)(a1 + 100);
        *(_QWORD *)(v11 + 88) += v10;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                 + 24);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                 + 24);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = *(_QWORD *)(v8 + 24) - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      }
      *(_QWORD *)(v8 + 24) = v9;
    }
  }
  else
  {
    v12 = __error();
    result = __AFCSetErrorResult_4(1, *v12, 3892330499, v13, 2269, "AFCGetBuffer failed", v14, v15, v16);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

@end
