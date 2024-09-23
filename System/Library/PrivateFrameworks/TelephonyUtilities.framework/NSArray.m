@implementation NSArray

void __73__NSArray_TelephonyUtilitiesAdditions__tu_mapAndFilterObjectsUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

uint64_t __69__NSArray_TelephonyUtilitiesAdditions__tu_containsObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__NSArray_TelephonyUtilitiesAdditions__tu_firstObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
