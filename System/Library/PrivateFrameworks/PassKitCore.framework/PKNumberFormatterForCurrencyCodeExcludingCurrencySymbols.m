@implementation PKNumberFormatterForCurrencyCodeExcludingCurrencySymbols

void ___PKNumberFormatterForCurrencyCodeExcludingCurrencySymbols_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.PassKit.currencyformatterExcludingCurrencySymbols", 0);
  v1 = (void *)qword_1ECF21FD0;
  qword_1ECF21FD0 = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)qword_1ECF21FC0;
  qword_1ECF21FC0 = (uint64_t)v2;

}

void ___PKNumberFormatterForCurrencyCodeExcludingCurrencySymbols_block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v3;
  objc_msgSend((id)qword_1ECF21FC0, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCurrencyCode:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setNumberStyle:", 2);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCurrencySymbol:", &stru_1E2ADF4C0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setInternationalCurrencySymbol:", &stru_1E2ADF4C0);
    objc_msgSend((id)qword_1ECF21FC0, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);
  }

}

@end
