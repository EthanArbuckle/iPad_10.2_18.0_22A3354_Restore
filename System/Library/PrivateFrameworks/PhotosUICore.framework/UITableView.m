@implementation UITableView

uint64_t __80__UITableView_PhotosUICore__px_performUpdatesForChangeDetails_dataSourceUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "deletedSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "deletedSections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteSections:withRowAnimation:", v4, 100);

  }
  objc_msgSend(*(id *)(a1 + 32), "insertedSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "insertedSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSections:withRowAnimation:", v7, 100);

  }
  objc_msgSend(*(id *)(a1 + 32), "changedSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "changedSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadSections:withRowAnimation:", v10, 100);

  }
  objc_msgSend(*(id *)(a1 + 32), "deletedItemsIndexPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "deletedItemsIndexPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deleteRowsAtIndexPaths:withRowAnimation:", v13, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "insertedItemsIndexPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "insertedItemsIndexPaths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertRowsAtIndexPaths:withRowAnimation:", v16, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "changedItemsIndexPaths");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "changedItemsIndexPaths");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reloadRowsAtIndexPaths:withRowAnimation:", v19, 0);

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__UITableView_PhotosUICore__px_performUpdatesForChangeDetails_dataSourceUpdate___block_invoke_2;
  v22[3] = &unk_1E512EFA0;
  v20 = *(void **)(a1 + 32);
  v22[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v20, "enumerateMovedIndexPathsUsingBlock:", v22);
}

uint64_t __80__UITableView_PhotosUICore__px_performUpdatesForChangeDetails_dataSourceUpdate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveRowAtIndexPath:toIndexPath:", a2, a2);
}

@end
