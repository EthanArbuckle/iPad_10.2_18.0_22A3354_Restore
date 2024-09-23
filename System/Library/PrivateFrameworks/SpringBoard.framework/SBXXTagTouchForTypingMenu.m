@implementation SBXXTagTouchForTypingMenu

void ___SBXXTagTouchForTypingMenu_block_invoke(uint64_t a1)
{
  id v2;

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ignoreScreenEdgeTouchWithIdentifier:", *(unsigned int *)(a1 + 32));

}

@end
