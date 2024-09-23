@implementation SBXXSetIdleText

void ___SBXXSetIdleText_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdleModeText:", *(_QWORD *)(a1 + 32));

}

@end
