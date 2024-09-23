@implementation PKNumberFormatterWithMinimalFractionDigits

void ___PKNumberFormatterWithMinimalFractionDigits_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.PassKit.currencyformatterWithMinimalFractionDigits", 0);
  v1 = (void *)qword_1ECF21FA0;
  qword_1ECF21FA0 = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)qword_1ECF21F90;
  qword_1ECF21F90 = (uint64_t)v2;

}

void ___PKNumberFormatterWithMinimalFractionDigits_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECF21F90, "objectForKeyedSubscript:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setNumberStyle:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setMinimumFractionDigits:", *(_QWORD *)(a1 + 40) & ~(*(uint64_t *)(a1 + 40) >> 63));
    objc_msgSend((id)qword_1ECF21F90, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v8);
  }

}

@end
