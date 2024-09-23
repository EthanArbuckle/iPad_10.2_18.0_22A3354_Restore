@implementation NSIndexPath

void __57__NSIndexPath_PhotosUI__pu_indexPathsForItems_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
