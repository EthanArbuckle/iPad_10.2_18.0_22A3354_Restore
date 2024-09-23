@implementation NSIndexPathsFromPXIndexPathSet

void __NSIndexPathsFromPXIndexPathSet_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD15D8], "px_indexPathForItem:inSection:", *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 8));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
