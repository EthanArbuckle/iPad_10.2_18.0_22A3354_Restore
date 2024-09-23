@implementation FBSMutableSceneSettings(PosterBoardUI)

- (uint64_t)prui_setPreferredSwitcherLayoutMode:()PosterBoardUI
{
  return objc_msgSend(a1, "pruis_setPreferredSwitcherLayoutMode:", modeFromPRUISwitcherLayoutMode());
}

@end
