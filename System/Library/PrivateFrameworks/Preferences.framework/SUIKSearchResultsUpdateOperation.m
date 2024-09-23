@implementation SUIKSearchResultsUpdateOperation

__CFString *__41___SUIKSearchResultsUpdateOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
  {
    v4 = &stru_1E4A69238;
  }
  else
  {
    SUIKCategoryFromSearchableItem(v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t __41___SUIKSearchResultsUpdateOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "searchResultsCollectionViewController:sortCategory1:sortCategory2:", 0, v5, v6);

  }
  return v7;
}

uint64_t __41___SUIKSearchResultsUpdateOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v3, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rankingHint");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  v8 = (void *)v7;
  objc_msgSend(v3, "attributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v12 = 0;
    goto LABEL_8;
  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v5);
  v12 = 1;
LABEL_7:

LABEL_8:
  return v12;
}

uint64_t __41___SUIKSearchResultsUpdateOperation_main__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(v6, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rankingHint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rankingHint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "compare:", v11);

    if (v7)
      goto LABEL_6;
    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    {
      objc_msgSend(v5, "attributeSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attributeSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "subject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v13, "compare:", v15);

      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:

  return v7;
}

void __41___SUIKSearchResultsUpdateOperation_main__block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "diffableDataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applySnapshot:animatingDifferences:", *(_QWORD *)(a1 + 40), 1);

}

@end
