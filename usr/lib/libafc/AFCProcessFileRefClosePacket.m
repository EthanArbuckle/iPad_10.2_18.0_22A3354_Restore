@implementation AFCProcessFileRefClosePacket

void __AFCProcessFileRefClosePacket_block_invoke(uint64_t a1)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  char v12;

  if (close(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 48) + 80)))
  {
    v2 = __error();
    v6 = __AFCSetErrorResult_4(0, *v2, 3892330497, v3, 2597, "close", v4, v5, v12);
  }
  else
  {
    v6 = 0;
  }
  v7 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  *(_DWORD *)(v7 + 80 + 40 * *(unsigned int *)(a1 + 48)) = -1;
  v8 = *(_QWORD *)(v7 + 80 + 40 * *(unsigned int *)(a1 + 48) + 32);
  if (v8)
  {
    (*(void (**)(_QWORD))(v8 + 16))(*(_QWORD *)(v7 + 80 + 40 * *(unsigned int *)(a1 + 48) + 32));
    _Block_release(*(const void **)(*(_QWORD *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 48) + 112));
    v7 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(v7 + 40 * *(unsigned int *)(a1 + 48) + 112) = 0;
  }
  if (!gAFCMaxOpenFileCount)
    goto LABEL_11;
  v9 = 0;
  v10 = 1;
  do
  {
    if (*(_DWORD *)(v7 + 40 * v9 + 80) != -1)
      break;
    v9 = v10;
  }
  while (gAFCMaxOpenFileCount > (unint64_t)v10++);
  if (gAFCMaxOpenFileCount == v9)
LABEL_11:
    AFCFlushServerContext(v7);
}

@end
