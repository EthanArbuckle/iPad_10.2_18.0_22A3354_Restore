@implementation PHFetchResult

void __81__PHFetchResult_PhotosUICore__px_subfetchResultWithObjectsAtIndexes_objectClass___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

uint64_t __64__PHFetchResult_PhotosUICore__px_fetchedObjectIDsSortedByUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __75__PHFetchResult_PhotosUICore__px_fetchedObjectIDsSortedByLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

unint64_t __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  unint64_t result;

  if (a2 == 0x7FFFFFFFFFFFFFFFLL || a3 == 0)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = a2 + (a3 >> 1);
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", v7);
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result >= 0x3E8)
    *a4 = 1;
  return result;
}

void __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_137(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

void __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_2_140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;

  v6 = a2 + a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2 - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (!v12 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
    objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", a2, a3);

}

uint64_t __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "creationDate");
}

uint64_t __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addedDate");
}

uint64_t __67__PHFetchResult_PhotosUICore__px_indexOfSortedAssetNearestToAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_isBetweenDate:andDate:", a2, a3) ^ 1;
}

uint64_t __67__PHFetchResult_PhotosUICore__px_indexOfSortedAssetNearestToAsset___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t result;
  double v6;
  double v7;

  result = objc_msgSend(a3, "timeIntervalSinceDate:", a1[4]);
  v7 = fabs(v6);
  if (v7 < *(double *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
    *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v7;
  }
  return result;
}

@end
