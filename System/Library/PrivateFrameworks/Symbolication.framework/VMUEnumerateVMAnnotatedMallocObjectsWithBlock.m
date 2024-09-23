@implementation VMUEnumerateVMAnnotatedMallocObjectsWithBlock

void __VMUEnumerateVMAnnotatedMallocObjectsWithBlock_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, __int128 *);
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(v6 + 8);
  v7 = v6 + 8;
  if (*(_DWORD *)(v8 + 24) < *(_DWORD *)(a1 + 56))
  {
    do
    {
      v18 = 0uLL;
      v19 = 0;
      v9 = *(void **)(a1 + 32);
      if (v9)
      {
        objc_msgSend(v9, "nodeDetails:", *(unsigned int *)(*(_QWORD *)v7 + 24));
        if (((*((_QWORD *)&v18 + 1) >> 60) | 4) == 5 && *((_QWORD *)&v18 + 1) != 0x1000000000000000)
        {
          if ((_QWORD)v18 - v5[1] >= v5[2])
            break;
          v11 = *(_QWORD *)(a1 + 40);
          v12 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          v13 = *(void (**)(uint64_t, uint64_t, __int128 *))(v11 + 16);
          v16 = v18;
          v17 = v19;
          v13(v11, v12, &v16);
          if (*a3)
            break;
        }
      }
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(v14 + 8);
      v7 = v14 + 8;
    }
    while (*(_DWORD *)(v15 + 24) < *(_DWORD *)(a1 + 56));
  }

}

@end
