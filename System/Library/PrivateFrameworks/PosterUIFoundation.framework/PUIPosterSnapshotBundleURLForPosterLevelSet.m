@implementation PUIPosterSnapshotBundleURLForPosterLevelSet

void __PUIPosterSnapshotBundleURLForPosterLevelSet_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Lvl%lld]"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
