@implementation NSIndexSet

uint64_t __60__NSIndexSet_TSUAdditions__tsu_intersectsIndexesInIndexSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", a2, a3);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __64__NSIndexSet_TSUAdditions__tsu_indexSetByIntersectingWithRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addIndexesInRange:", a2, a3);
}

uint64_t __66__NSIndexSet_TSUAdditions__tsu_indexSetByIntersectingWithIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addIndex:", a2);
  return result;
}

uint64_t __59__NSIndexSet_TSUAdditions__tsu_indexSetByExcludingIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addIndex:", a2);
  return result;
}

_QWORD *__48__NSIndexSet_TSUAdditions__tsu_indexAtPosition___block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(result[4] + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  if (v4 == result[6])
  {
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

uint64_t __48__NSIndexSet_TSUAdditions__tsu_positionOfIndex___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(result + 40) == a2)
    *a3 = 1;
  else
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

NSUInteger __52__NSIndexSet_TSUAdditions__tsu_leadingRangeInRange___block_invoke(uint64_t a1, NSRange range2, _BYTE *a3)
{
  NSUInteger length;
  NSRange v4;
  NSRange v6;

  length = range2.length;
  v4.location = range2.location;
  v6 = *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  if (v6.length + v6.location == v4.location || v4.location + length == v6.location)
  {
    v4.length = length;
    v6 = NSUnionRange(v6, v4);
    *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v6;
  }
  else
  {
    *a3 = 1;
  }
  return v6.location;
}

NSUInteger __53__NSIndexSet_TSUAdditions__tsu_trailingRangeInRange___block_invoke(uint64_t a1, NSRange range2, _BYTE *a3)
{
  NSUInteger length;
  NSRange v4;
  NSRange v6;

  length = range2.length;
  v4.location = range2.location;
  v6 = *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  if (v6.length + v6.location == v4.location || v4.location + length == v6.location)
  {
    v4.length = length;
    v6 = NSUnionRange(v6, v4);
    *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v6;
  }
  else
  {
    *a3 = 1;
  }
  return v6.location;
}

uint64_t __52__NSIndexSet_TSUAdditions__tsu_localizedDescription__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  void *v11;

  if (a3 < 3)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%lu"), a2 + 1));
    if (a3 != 2)
      return result;
    v11 = *(void **)(a1 + 32);
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%lu"), a2 + 2);
    v9 = v11;
  }
  else
  {
    v6 = objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("TSU_UNSIGNED_INTEGER_RANGE"), CFSTR("%1$lu to %2$lu"), CFSTR("TSUtility"));
    v7 = *(void **)(a1 + 32);
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v6, a2 + 1, a2 + a3);
    v9 = v7;
  }
  return objc_msgSend(v9, "addObject:", v8);
}

@end
