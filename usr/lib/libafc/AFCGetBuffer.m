@implementation AFCGetBuffer

void __AFCGetBuffer_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  size_t *v5;
  malloc_type_id_t v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1[5] + 16);
  if (v2)
  {
    v3 = a1 + 4;
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v2;
    *(_QWORD *)(a1[5] + 16) = **(_QWORD **)(a1[5] + 16);
    v4 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    v5 = a1 + 6;
    if (*(_QWORD *)(v4 + 24) >= a1[6])
      goto LABEL_6;
    free(*(void **)(v4 + 16));
    v6 = 3803305363;
  }
  else
  {
    v3 = a1 + 4;
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = malloc_type_malloc(0x20uLL, 0x10A0040D083E0E9uLL);
    v7 = *(_OWORD **)(*(_QWORD *)(a1[4] + 8) + 24);
    *v7 = 0u;
    v7[1] = 0u;
    v5 = a1 + 6;
    v6 = 1903766733;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*v3 + 8) + 24) + 16) = malloc_type_valloc(*v5, v6);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*v3 + 8) + 24) + 24) = malloc_size(*(const void **)(*(_QWORD *)(*(_QWORD *)(*v3 + 8) + 24)
                                                                                              + 16));
LABEL_6:
  v8 = a1[5];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 8) = 1;
  v9 = *(_QWORD *)(v8 + 40);
  if (!v9)
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(v8 + 32), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v8 = a1[5];
    v9 = *(_QWORD *)(v8 + 40);
  }
  *(_QWORD *)(v8 + 40) = v9 + 1;
}

@end
