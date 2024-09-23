@implementation UICollectionView

uint64_t __136__UICollectionView_VideosUI___vui_applyChangeSet_inSection_updateDataSourceBlock_applyChangeBlock_shouldWrapInUpdate_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t result;

  if (!*(_BYTE *)(a1 + 80))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "updateChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_vui_applyUpdateChanges:inSection:applyChangeBlock:updateDataSourceBlock:", v5, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __136__UICollectionView_VideosUI___vui_applyChangeSet_inSection_updateDataSourceBlock_applyChangeBlock_shouldWrapInUpdate_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0DC6990]);
    objc_msgSend(*(id *)(a1 + 32), "insertChange");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setInsertChange:", v3);

    objc_msgSend(*(id *)(a1 + 32), "deleteChange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDeleteChange:", v4);

    objc_msgSend(*(id *)(a1 + 32), "moveChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMoveChanges:", v5);

    if (*(_BYTE *)(a1 + 72))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DC6990]);
      v7 = objc_alloc(MEMORY[0x1E0DC6988]);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", *(_QWORD *)(a1 + 64));
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", *(_QWORD *)(a1 + 64));
      v10 = (void *)objc_msgSend(v7, "initWithChangeKind:sourceIndexes:destinationIndexes:", 4, v8, v9);

      v18[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUpdateChanges:", v11);

      objc_msgSend(v10, "setUpdateChangeSet:", v2);
      v2 = v6;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  v12 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "deleteChange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_vui_applyDeleteChange:inSection:applyChangeBlock:", v13, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

  v14 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "insertChange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_vui_applyInsertChange:inSection:applyChangeBlock:", v15, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

  v16 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "moveChanges");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_vui_applyMoveChanges:inSection:applyChangeBlock:", v17, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

uint64_t __68__UICollectionView_VideosUICore___preciseIndexPathsForVisibleItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __69__UICollectionView_VideosUI___vui_indexPathsWithIndexSet_andSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
