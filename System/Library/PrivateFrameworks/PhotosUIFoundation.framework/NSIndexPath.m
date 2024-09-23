@implementation NSIndexPath

void __67__NSIndexPath_PhotosUIFoundation__px_indexPathsForItems_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD15D8], "px_indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
