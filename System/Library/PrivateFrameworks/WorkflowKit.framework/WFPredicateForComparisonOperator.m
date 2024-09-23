@implementation WFPredicateForComparisonOperator

id __WFPredicateForComparisonOperator_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (v3
    && (v4 = *(_QWORD *)(a1 + 40)) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "components:fromDate:", v4, v3), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    objc_msgSend(*(id *)(a1 + 32), "dateFromComponents:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __WFPredicateForComparisonOperator_block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(&unk_1E7B8D9E8, "mutableCopy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_msgSend(v2, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "unsignedIntegerValue") & a1) == 0)
          objc_msgSend(v2, "removeObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

uint64_t __WFPredicateForComparisonOperator_block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", v2))
    v3 = objc_msgSend(*(id *)(a1 + 40), "evaluateWithObject:", v2);
  else
    v3 = 0;

  return v3;
}

uint64_t __WFPredicateForComparisonOperator_block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isDateInToday:", v2);

  return v3;
}

uint64_t __WFPredicateForComparisonOperator_block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "evaluateWithObject:", v2);

  return v3;
}

id __WFPredicateForComparisonOperator_block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

@end
