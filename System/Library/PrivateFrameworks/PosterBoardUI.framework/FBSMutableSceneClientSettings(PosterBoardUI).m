@implementation FBSMutableSceneClientSettings(PosterBoardUI)

- (uint64_t)prui_setSwitcherLayoutMode:()PosterBoardUI
{
  return objc_msgSend(a1, "pruis_setSwitcherLayoutMode:", modeFromPRUISwitcherLayoutMode());
}

@end
