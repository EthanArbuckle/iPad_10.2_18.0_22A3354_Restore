@implementation SBXXOverrideDisplayedDate

void ___SBXXOverrideDisplayedDate_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOverrideDate:", *(_QWORD *)(a1 + 32));

}

@end
