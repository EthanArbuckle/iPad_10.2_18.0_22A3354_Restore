@implementation NSDictionary

uint64_t __78__NSDictionary_SafariCoreExtras__safari_arrayContainingObjectsOfClass_forKey___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __78__NSDictionary_SafariCoreExtras__safari_mapAndFilterKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);

}

void __68__NSDictionary_SafariCoreExtras__safari_mapAndFilterKeysUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

void __72__NSDictionary_SafariCoreExtras__safari_dictionaryByRemovingNullObjects__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((id)*MEMORY[0x1E0C9B0D0] == v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v6, "removeObjectForKey:", v10);
  }

}

uint64_t __56__NSDictionary_SafariCoreExtras__safari_containsObject___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

uint64_t __66__NSDictionary_SafariCoreExtras__safari_containsEntryPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

id __56__NSDictionary_SafariCoreExtras__safari_mutableDeepCopy__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return (id)objc_msgSend(a3, "copy");
}

uint64_t __65__NSDictionary_SafariCoreExtras__safari_valueOfEntryPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

void __68__NSDictionary_SafariCoreExtras__safari_valuesOfEntriesPassingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

@end
