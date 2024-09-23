@implementation WGTodayViewArchiveMigrateArchiveFromLegacy

void __WGTodayViewArchiveMigrateArchiveFromLegacy_block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    BBRemoveSavedChronologicalSectionInfo();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", *(_QWORD *)(a1 + 40), 0);

  }
}

@end
