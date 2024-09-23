@implementation PASPosixDataCollector

void __36___PASPosixDataCollector_handleData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = v3;
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v5;

    v3 = v8;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_msgSend(v4, "addObject:", v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) += objc_msgSend(v8, "length");

}

@end
