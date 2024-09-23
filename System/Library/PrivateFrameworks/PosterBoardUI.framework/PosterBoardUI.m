uint64_t NSStringFromPRUISwitcherLayoutMode()
{
  modeFromPRUISwitcherLayoutMode();
  return NSStringFromPRUISSwitcherLayoutMode();
}

uint64_t NSStringFromPRUISSwitcherLayoutMode()
{
  return MEMORY[0x1E0D7F7C0]();
}

uint64_t PRUISSwitcherLayoutBouncingAnimationSettings()
{
  return MEMORY[0x1E0D7F888]();
}

uint64_t PRUISSwitcherLayoutDeflationAnimationSettings()
{
  return MEMORY[0x1E0D7F890]();
}

uint64_t PRUISSwitcherLayoutTransitionAnimationSettings()
{
  return MEMORY[0x1E0D7F898]();
}

uint64_t modeFromPRUISSwitcherLayoutMode()
{
  return MEMORY[0x1E0D7F8A0]();
}

uint64_t modeFromPRUISwitcherLayoutMode()
{
  return MEMORY[0x1E0D7F8A8]();
}

