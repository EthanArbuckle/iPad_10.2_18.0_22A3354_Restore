@implementation UITableView

void __107__UITableView_VideosUI__vui_applyChangeSet_inSection_rowAnimation_updateDataSourceBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "deleteChange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_vui_applyDeleteChange:inSection:rowAnimation:", v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "insertChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_vui_applyInsertChange:inSection:rowAnimation:", v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "moveChanges");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_vui_applyMoveChanges:inSection:rowAnimation:", v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __107__UITableView_VideosUI__vui_applyChangeSet_inSection_rowAnimation_updateDataSourceBlock_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t result;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "updateChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_vui_applyUpdateChanges:inSection:rowAnimation:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __64__UITableView_VideosUI___vui_indexPathsWithIndexSet_andSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
