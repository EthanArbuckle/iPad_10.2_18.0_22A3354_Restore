@implementation SBXXFlashColor

void ___SBXXFlashColor_block_invoke(uint64_t a1)
{
  id v2;

  +[SBScreenFlash mainScreenFlasher](SBScreenFlash, "mainScreenFlasher");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flashColor:withCompletion:", *(_QWORD *)(a1 + 32), 0);

}

@end
