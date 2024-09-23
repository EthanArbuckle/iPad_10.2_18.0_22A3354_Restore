@implementation UICollectionViewOrthogonalScrollerSectionController

void __88___UICollectionViewOrthogonalScrollerSectionController_reconfigureScrollViewsForUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(v14, "integerValue");
  if (v6)
    v7 = objc_msgSend(v6, "finalSectionIndexForInitialSectionIndex:", v7);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || !objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v7))
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 56) + 32);
    if (v10)
    {
      objc_msgSend(v10, "addObject:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v5);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(void **)(v12 + 32);
      *(_QWORD *)(v12 + 32) = v11;

    }
  }
  else
  {
    if (v5)
      v5[261] = v7;
    v8 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, v9);

  }
}

@end
