@implementation NSArray

uint64_t __56__NSArray__PASAdditions___pas_mappedArrayWithTransform___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__NSArray__PASAdditions___pas_filteredArrayWithTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __49__NSArray__PASAdditions___pas_proxyArrayReversed__block_invoke(uint64_t a1, unint64_t a2)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(v4 + 8);
  if (v3 > a2)
    v5 = ~a2;
  else
    v5 = 0;
  objc_msgSend(v2, "objectAtIndexedSubscript:", v3 + v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __49__NSArray__PASAdditions___pas_proxyArrayReversed__block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

id __56__NSArray__PASAdditions___pas_proxyArrayRevivingStrings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EE5ADE50) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSArray+_PASAdditions.m"), 445, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[distilledString conformsToProtocol:@protocol(_PASDistilledString)]"));

  }
  objc_msgSend(v3, "_pas_revivedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __58__NSArray__PASAdditions___pas_proxyArrayDistillingStrings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSArray+_PASAdditions.m"), 437, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[string isKindOfClass:[NSString class]]"));

  }
  objc_msgSend(v3, "_pas_distilledString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __57__NSArray__PASAdditions___pas_proxyArrayWithRepetitions___block_invoke(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = a1[5];
  v3 = a1[6];
  v4 = (void *)a1[4];
  if (v3 * v2 <= a2)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = a2 % v2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __57__NSArray__PASAdditions___pas_proxyArrayWithRepetitions___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) * *(_QWORD *)(a1 + 32);
}

id __58__NSArray__PASAdditions___pas_proxyArrayByAppendingArray___block_invoke(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a1[6];
  v3 = a2 - v2;
  if (a2 >= v2)
  {
    v4 = (void *)a1[5];
  }
  else
  {
    v4 = (void *)a1[4];
    v3 = a2;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __58__NSArray__PASAdditions___pas_proxyArrayByAppendingArray___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 32);
}

id __53__NSArray__PASAdditions___pas_proxyArrayWithMapping___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__NSArray__PASAdditions___pas_proxyArrayWithMapping___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "count");
}

id __62__NSArray__PASAdditions___pas_proxyArrayWithObjectsAtIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)(a1 + 48) <= a2)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes") + 8 * a2);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __62__NSArray__PASAdditions___pas_proxyArrayWithObjectsAtIndexes___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

id __54__NSArray__PASAdditions___pas_proxySubarrayWithRange___block_invoke(_QWORD *a1, unint64_t a2)
{
  uint64_t v2;
  void *v3;

  if (a1[6] <= a2)
  {
    v3 = (void *)a1[4];
    v2 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v2 = a1[5] + a2;
    v3 = (void *)a1[4];
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __54__NSArray__PASAdditions___pas_proxySubarrayWithRange___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

id __61__NSArray__PASAdditions___pas_proxyComponentsJoinedByString___block_invoke(uint64_t a1, unint64_t a2)
{
  id v2;

  if (*(_QWORD *)(a1 + 48) <= a2)
    __assert_rtn("-[NSArray(_PASAdditions) _pas_proxyComponentsJoinedByString:]_block_invoke", "NSArray+_PASAdditions.m", 228, "index < countWithSeparators");
  if ((a2 & 1) != 0)
  {
    v2 = *(id *)(a1 + 40);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2 >> 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t __61__NSArray__PASAdditions___pas_proxyComponentsJoinedByString___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

unint64_t __53__NSArray__PASAdditions___pas_shuffledArrayUsingRng___block_invoke(uint64_t a1, unint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "next") % a2;
}

uint64_t __53__NSArray__PASAdditions___pas_shuffledArrayUsingRng___block_invoke_2(int a1, uint32_t __upper_bound)
{
  return arc4random_uniform(__upper_bound);
}

uint64_t __69__NSArray__PASAdditions___pas_rightFoldWithInitialObject_accumulate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__NSArray__PASAdditions___pas_leftFoldWithInitialObject_accumulate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __64__NSArray__PASAdditions___pas_proxyArrayWithObject_repetitions___block_invoke(uint64_t a1, unint64_t a2)
{
  id result;

  if (*(_QWORD *)(a1 + 40) > a2)
    return *(id *)(a1 + 32);
  result = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Index %tu out of range"), a2, 0);
  __break(1u);
  return result;
}

uint64_t __64__NSArray__PASAdditions___pas_proxyArrayWithObject_repetitions___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

@end
