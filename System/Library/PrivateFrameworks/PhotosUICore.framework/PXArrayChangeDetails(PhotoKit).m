@implementation PXArrayChangeDetails(PhotoKit)

+ (uint64_t)changeDetailsFromFetchResultChangeDetails:()PhotoKit
{
  return objc_msgSend(a1, "changeDetailsFromFetchResultChangeDetails:originatingChange:", a3, 0);
}

+ (id)changeDetailsFromFetchResultChangeDetails:()PhotoKit originatingChange:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(id *, uint64_t);
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(a1, "changeDetailsWithNoChanges");
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v18 = (void *)v17;
    goto LABEL_13;
  }
  if ((objc_msgSend(v6, "hasIncrementalChanges") & 1) == 0)
  {
    objc_msgSend(a1, "changeDetailsWithNoIncrementalChanges");
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v6, "changedIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = 0;
  if (v7 && v9)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    objc_msgSend(v6, "fetchResultAfterChanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changedIndexes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __94__PXArrayChangeDetails_PhotoKit__changeDetailsFromFetchResultChangeDetails_originatingChange___block_invoke;
    v29 = &unk_1E51489A0;
    v14 = v12;
    v30 = v14;
    v31 = v7;
    v15 = v11;
    v32 = v15;
    objc_msgSend(v13, "enumerateIndexesUsingBlock:", &v26);

    if (objc_msgSend(v15, "count", v26, v27, v28, v29))
    {
      v33 = *(_QWORD *)off_1E50B7F40;
      v16 = (void *)objc_msgSend(v15, "copy");
      v34[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  v19 = objc_alloc((Class)a1);
  objc_msgSend(v6, "removedIndexes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertedIndexes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "movedIndexes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v6, "movedFromIndexes");
  objc_msgSend(v6, "changedIndexes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v19, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:indexesWithChangesByProperty:", v20, v21, v22, v23, v24, v10);

LABEL_13:
  return v18;
}

@end
