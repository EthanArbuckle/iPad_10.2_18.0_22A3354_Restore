@implementation FBSSceneSettings(PosterBoardUI)

- (uint64_t)prui_preferredSwitcherLayoutMode
{
  objc_msgSend(a1, "pruis_preferredSwitcherLayoutMode");
  return modeFromPRUISSwitcherLayoutMode();
}

@end
