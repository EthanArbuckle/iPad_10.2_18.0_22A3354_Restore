@implementation UIDiffableDataSourceSectionSnapshotRebaser

id __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIDiffableDataSourceSectionSnapshotRebaser _rebaseForInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:shouldPerformChildSnapshotMoves:]_block_invoke");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentier"));

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "copy");

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, v3);
  }

  return v4;
}

void __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if ((unint64_t)(a2 + a3) > *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSMaxRange(deleteRange) <= beforeIdentifiersCount"));

  }
  objc_msgSend(*(id *)(a1 + 40), "sectionIndexesForItemIndexRange:", a2, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_3;
  v10[3] = &unk_1E16B19C0;
  v6 = *(id *)(a1 + 40);
  v15 = a2;
  v16 = a3;
  v17 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v14 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v10);

}

void __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_3(uint64_t a1, unint64_t a2)
{
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSRange v16;

  objc_msgSend(*(id *)(a1 + 32), "dataSourceSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeForSection:", a2);
  v7 = v6;

  v16.location = v5;
  v16.length = v7;
  v8 = NSIntersectionRange(*(NSRange *)(a1 + 64), v16);
  if (v8.length)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "numberOfSections") <= a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndex < beforeState.numberOfSections"));

    }
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a2);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (v5 == v8.location && v7 == v8.length)
      {
        objc_msgSend(v10, "deleteAllItems");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "subarrayWithRange:", v8.location, v8.length);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "deleteItems:orphanDisposition:", v13, 1);
      }
    }

  }
}

void __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)(a2 + a3) > *(_QWORD *)(a1 + 72))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSMaxRange(insertRange) <= afterIdentifiersCount"));

  }
  objc_msgSend(*(id *)(a1 + 40), "sectionIndexesForItemIndexRange:", a2, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_5;
  v10[3] = &unk_1E16B1A10;
  v6 = *(id *)(a1 + 40);
  v16 = a2;
  v17 = a3;
  v18 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v15 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v10);

}

void __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_5(uint64_t a1, unint64_t a2)
{
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSRange v18;

  objc_msgSend(*(id *)(a1 + 32), "dataSourceSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeForSection:", a2);
  v7 = v6;

  v18.location = v5;
  v18.length = v7;
  v8 = NSIntersectionRange(*(NSRange *)(a1 + 72), v18);
  if (v8.length)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "numberOfSections") <= a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndex < afterState.numberOfSections"));

    }
    objc_msgSend(*(id *)(a1 + 32), "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a2);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_16;
    objc_msgSend(*(id *)(a1 + 48), "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subarrayWithRange:", v8.location, v8.length);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "_identifierBeforeIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "containsItem:", v14) & 1) == 0)
    {

      v14 = 0;
    }
    objc_msgSend(*(id *)(a1 + 56), "_identifierAfterIdentifier:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "containsItem:", v15) & 1) != 0)
    {
      if (v15)
      {
        objc_msgSend(v10, "insertItems:beforeItem:", v12, v15);

LABEL_15:
LABEL_16:

        return;
      }
    }
    else
    {

    }
    if (v14)
      objc_msgSend(v10, "insertItems:afterItem:insertionMode:", v12, v14, 1);
    else
      objc_msgSend(v10, "appendItems:", v12);
    goto LABEL_15;
  }
}

@end
