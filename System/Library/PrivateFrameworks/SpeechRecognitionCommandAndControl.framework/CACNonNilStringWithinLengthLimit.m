@implementation CACNonNilStringWithinLengthLimit

void __CACNonNilStringWithinLengthLimit_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
      + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v12, a3 + a4 - v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:", v13);

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v14 + 32) = a3;
  *(_QWORD *)(v14 + 40) = a4;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == *(_QWORD *)(a1 + 64))
    *a7 = 1;
}

@end
