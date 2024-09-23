@implementation AFCReleaseBuffer

void __AFCReleaseBuffer_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(v1 + 8) = 0;
  *(_QWORD *)v1 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v3 + 40) - 1;
  *(_QWORD *)(v3 + 40) = v4;
  if (!v4)
  {
    v5 = *(NSObject **)(v3 + 32);
    v6 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
}

@end
