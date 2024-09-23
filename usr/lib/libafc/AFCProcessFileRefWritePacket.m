@implementation AFCProcessFileRefWritePacket

intptr_t __AFCProcessFileRefWritePacket_block_invoke(uint64_t a1)
{
  int64_t v2;
  char *v3;
  int v4;
  ssize_t v5;
  _QWORD *v6;
  BOOL v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v15;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 < 1)
  {
LABEL_11:
    v9 = __error();
    v13 = __AFCSetErrorResult_4(0, *v9, 0xFFFFFFFFLL, v10, 2422, "file write failure", v11, v12, v15);
    v8 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)(v8 + 80 + 40 * *(unsigned int *)(a1 + 72) + 16) = v13;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_DWORD *)(v8
                                                                            + 80
                                                                            + 40 * *(unsigned int *)(a1 + 72)
                                                                            + 16);
  }
  else
  {
    v3 = *(char **)(*(_QWORD *)(a1 + 48) + 16);
    do
    {
      v4 = *(_DWORD *)(*(_QWORD *)(a1 + 64) + 40 * *(unsigned int *)(a1 + 72) + 80);
      if (*(_BYTE *)(a1 + 76))
      {
        v5 = pwrite(v4, v3, v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        if (v5 < 1)
          goto LABEL_11;
        v6 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      }
      else
      {
        v5 = write(v4, v3, v2);
        if (v5 < 1)
          goto LABEL_11;
        v6 = (_QWORD *)(*(_QWORD *)(a1 + 64) + 40 * *(unsigned int *)(a1 + 72) + 88);
      }
      *v6 += v5;
      v3 += v5;
      v7 = v2 <= v5;
      v2 -= v5;
    }
    while (!v7);
    v8 = *(_QWORD *)(a1 + 64);
  }
  AFCReleaseBuffer(v8, *(_QWORD *)(a1 + 48));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 64) + 48));
}

@end
