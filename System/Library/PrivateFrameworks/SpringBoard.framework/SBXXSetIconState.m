@implementation SBXXSetIconState

void ___SBXXSetIconState_block_invoke(uint64_t a1)
{
  int v2;
  id v3;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "importIconState:", *(_QWORD *)(a1 + 32)))
    v2 = 0;
  else
    v2 = 5;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

@end
