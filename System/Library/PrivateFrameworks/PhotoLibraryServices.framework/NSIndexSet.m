@implementation NSIndexSet

uint64_t __78__NSIndexSet_PLAdditions___pl_indexSetByUpdatingWithChangedIndexes_asInserts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "shiftIndexesStartingAtIndex:by:", a2, a3);
}

uint64_t __78__NSIndexSet_PLAdditions___pl_indexSetByUpdatingWithChangedIndexes_asInserts___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = a2 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", v5, a3);
  result = objc_msgSend(*(id *)(a1 + 32), "shiftIndexesStartingAtIndex:by:", v5 + a3, -a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a3;
  return result;
}

void __46__NSIndexSet_PLAdditions__pl_shortDescription__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  if (a3 < 2)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a2, v4);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu"), a2, a3 + a2 - 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

}

@end
