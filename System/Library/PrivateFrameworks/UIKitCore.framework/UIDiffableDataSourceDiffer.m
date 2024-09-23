@implementation UIDiffableDataSourceDiffer

void __112___UIDiffableDataSourceDiffer__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  UICollectionViewUpdateItem *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "indexPathForGlobalIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("_UIDiffableDataSourceDiffer.m"), 182, CFSTR("Failed to convert global index to indexPath."));

    v3 = 0;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "containsIndex:", objc_msgSend(v3, "section")) & 1) == 0)
  {
    v4 = -[UICollectionViewUpdateItem initWithAction:forIndexPath:]([UICollectionViewUpdateItem alloc], "initWithAction:forIndexPath:", 0, v6);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v4);

  }
}

void __94___UIDiffableDataSourceDiffer__sectionUpdatesForDiffResults_deletedSections_insertedSections___block_invoke(uint64_t a1, uint64_t a2)
{
  UICollectionViewUpdateItem *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", 0, v5, 0);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);

}

void __112___UIDiffableDataSourceDiffer__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  UICollectionViewUpdateItem *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "indexPathForGlobalIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("_UIDiffableDataSourceDiffer.m"), 191, CFSTR("Failed to convert global index to indexPath."));

    v3 = 0;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "containsIndex:", objc_msgSend(v3, "section")) & 1) == 0)
  {
    v4 = -[UICollectionViewUpdateItem initWithAction:forIndexPath:]([UICollectionViewUpdateItem alloc], "initWithAction:forIndexPath:", 1, v6);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v4);

  }
}

void __94___UIDiffableDataSourceDiffer__sectionUpdatesForDiffResults_deletedSections_insertedSections___block_invoke_2(uint64_t a1, uint64_t a2)
{
  UICollectionViewUpdateItem *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v5, 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);

}

id __42___UIDiffableDataSourceDiffer_description__block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;

  v7 = a1;
  v8 = a2;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("section %@ contents:["), v9);
  v11 = objc_msgSend(v7, "rangeForSection:", a3);
  if (v11 < v11 + v12)
  {
    v13 = v11;
    v14 = v12;
    v15 = v11;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 > v13)
        objc_msgSend(v10, "appendString:", CFSTR(","));
      objc_msgSend(v10, "appendFormat:", CFSTR("%@"), v16);

      ++v15;
      --v14;
    }
    while (v14);
  }
  objc_msgSend(v10, "appendString:", CFSTR("]\n"));

  return v10;
}

uint64_t __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v7 = a2;
  v8 = a3;
  if ((a4 & 1) != 0)
  {
    objc_msgSend(v7, "indexPathBeforeUpdate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathBeforeUpdate");
  }
  else
  {
    objc_msgSend(v7, "indexPathAfterUpdate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathAfterUpdate");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "section");
  if (v11 == objc_msgSend(v10, "section"))
  {
    if (v7)
    {
      v12 = v7[6];
      if (v8 && v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v8[6] != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_11:
          v14 = -1;
          goto LABEL_15;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_UIDiffableDataSourceDiffer.m"), 384, CFSTR("Deleting the same section. Invalidate updates."));

        v12 = v7[6];
      }
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_11;
    }
    if (v8 && v8[6] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v7)
      {
        if (v7[6] == 0x7FFFFFFFFFFFFFFFLL)
          v14 = -1;
        else
          v14 = 1;
        goto LABEL_15;
      }
LABEL_23:
      v14 = 1;
      goto LABEL_15;
    }
    v17 = objc_msgSend(v9, "item");
    if (v17 > objc_msgSend(v10, "item"))
      goto LABEL_23;
    v18 = objc_msgSend(v9, "item");
    if (v18 >= objc_msgSend(v10, "item"))
      v14 = 0;
    else
      v14 = -1;
  }
  else
  {
    v15 = objc_msgSend(v9, "section");
    if (v15 > objc_msgSend(v10, "section"))
      v14 = 1;
    else
      v14 = -1;
  }
LABEL_15:

  return v14;
}

uint64_t __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_40(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (v3)
  {
    v4 = v3[6];
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v6 = v3[1];

    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      return objc_msgSend(v5, "_deleteSection:", v6);
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v6 = 0;
  }
  return objc_msgSend(v5, "_decrementSectionCount:", v6);
}

uint64_t __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_2_42(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;

  v3 = a2;
  if (!v3)
  {
    v4 = 0;
    goto LABEL_7;
  }
  v4 = v3[3];
  if (v3[6] != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

    return objc_msgSend(v10, "_incrementSectionCount:", v4);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(void **)(v5 + 24);
  else
    v6 = 0;
  objc_msgSend(v6, "dataSourceSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfItemsInSection:", v4);

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_insertSection:withInitialCount:", v4, v8);
}

@end
