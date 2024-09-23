@implementation UIDataSourceUpdateMap

uint64_t __67___UIDataSourceUpdateMap_updateMapByRevertingUpdateWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  if (a2)
    v3 = *(void **)(a2 + 88);
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __51___UIDataSourceUpdateMap__oldSectionMapDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalSectionIndexForInitialSectionIndex:", a2);
}

uint64_t __51___UIDataSourceUpdateMap__newSectionMapDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "initialSectionIndexForFinalSectionIndex:", a2);
}

uint64_t __54___UIDataSourceUpdateMap__oldGlobalItemMapDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "finalSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "initialSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForGlobalIndex:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finalIndexPathForInitialIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "globalIndexForIndexPath:", v8);

  return v9;
}

uint64_t __54___UIDataSourceUpdateMap__newGlobalItemMapDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "initialSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "finalSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForGlobalIndex:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialIndexPathForFinalIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "globalIndexForIndexPath:", v8);

  return v9;
}

void __51___UIDataSourceUpdateMap__findUpdateForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  int v10;
  id v11;

  v7 = a2;
  v11 = v7;
  if (v7)
    v8 = (void *)*((_QWORD *)v7 + 11);
  else
    v8 = 0;
  v9 = v8;
  v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __45___UIDataSourceUpdateMap_submapBeforeUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;

  if (a2)
    v3 = *(void **)(a2 + 88);
  else
    v3 = 0;
  v4 = v3;
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[11];
  v6 = v5;
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

uint64_t __44___UIDataSourceUpdateMap_submapAfterUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;

  if (a2)
    v3 = *(void **)(a2 + 88);
  else
    v3 = 0;
  v4 = v3;
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[11];
  v6 = v5;
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

@end
