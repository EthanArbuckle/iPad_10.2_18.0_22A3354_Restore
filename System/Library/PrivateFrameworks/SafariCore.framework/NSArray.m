@implementation NSArray

uint64_t __60__NSArray_SafariCoreExtras__safari_filterObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__NSArray_SafariCoreExtras__safari_mapAndFilterObjectsWithOptions_usingBlock___block_invoke(uint64_t a1)
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

uint64_t __66__NSArray_SafariCoreExtras__safari_mapAndFilterObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__NSArray_SafariCoreExtras__safari_firstObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__NSArray_SafariCoreExtras__safari_arrayFromDictionaryOfObjectsByIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

void __85__NSArray_SafariCoreExtras__safari_enumerateZippedValuesWithArray_options_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t, uint64_t))(v6 + 16))(v6, v8, v9, a3, a4);

}

void __62__NSArray_SafariCoreExtras__safari_orderedSetByApplyingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = a2;
  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v9, a3, objc_msgSend(v8, "count"), a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    v10 = v11;
  }

}

_QWORD *__59__NSArray_SafariCoreExtras__safari_maximumUsingComparator___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (!v6)
    goto LABEL_5;
  v8 = (*(uint64_t (**)(void))(a1[4] + 16))();
  v7 = v6;
  if ((unint64_t)(v8 + 1) < 2)
    goto LABEL_5;
  if (v8 == 1)
  {
    v7 = v5;
LABEL_5:
    a1 = v7;
  }

  return a1;
}

uint64_t __59__NSArray_SafariCoreExtras__safari_minimumUsingComparator___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__NSArray_SafariCoreExtras__safari_lastObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__NSArray_SafariCoreExtras__safari_containsObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__NSArray_SafariCoreExtras__safari_flattenedArray__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  if ((isKindOfClass & 1) != 0)
  {
    if (!v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "mutableCopy");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v13, "safari_flattenedArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v12);

  }
  else
  {
    objc_msgSend(*(id *)(v6 + 40), "addObject:", v13);
  }

}

void __61__NSArray_SafariCoreExtras__safari_splitArrayUsingCondition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, id);
  int v5;
  uint64_t v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(uint64_t (**)(uint64_t, id))(v3 + 16);
  v7 = a2;
  v5 = v4(v3, v7);
  v6 = 40;
  if (v5)
    v6 = 32;
  objc_msgSend(*(id *)(a1 + v6), "addObject:", v7);

}

uint64_t __76__NSArray_SafariCoreExtras__safari_longestIncreasingSubsequenceUsingValues___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "containsObject:", v2);

  return v3;
}

void __79__NSArray_SafariCoreExtras__safari_dictionaryByMappingObjectsToKeysUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

}

void __88__NSArray_SafariCoreExtras__safari_dictionaryByMappingObjectsAsKeysToObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);

}

void __87__NSArray_SafariCoreExtras__safari_dictionaryOfArraysByMappingObjectsToKeysUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
    }
    objc_msgSend(v4, "addObject:", v5);

  }
}

uint64_t __51__NSArray_SafariCoreExtras__safari_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
