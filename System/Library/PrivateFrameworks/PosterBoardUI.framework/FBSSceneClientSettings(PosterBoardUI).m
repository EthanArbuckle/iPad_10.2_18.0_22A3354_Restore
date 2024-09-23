@implementation FBSSceneClientSettings(PosterBoardUI)

- (uint64_t)prui_switcherLayoutMode
{
  objc_msgSend(a1, "pruis_switcherLayoutMode");
  return modeFromPRUISSwitcherLayoutMode();
}

@end
