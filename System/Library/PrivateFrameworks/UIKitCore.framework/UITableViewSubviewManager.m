@implementation UITableViewSubviewManager

uint64_t __52___UITableViewSubviewManager_filterPrefetchedCells___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    return objc_msgSend(v7, "setObject:forKey:", a3, a2);
  }
  return result;
}

void __72___UITableViewSubviewManager_rebasePrefetchedCellIndexPathsWithMapping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  id v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", a3, v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v7, a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_reusePrefetchedCell:withIndexPath:", a3, a2);
  }

}

uint64_t __54___UITableViewSubviewManager_removeAllPrefetchedCells__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reusePrefetchedCell:withIndexPath:", a3, a2);
}

uint64_t __52___UITableViewSubviewManager_filterPrefetchedCells___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", a3);
  return objc_msgSend(*(id *)(a1 + 40), "_reusePrefetchedCell:withIndexPath:", a3, a2);
}

@end
