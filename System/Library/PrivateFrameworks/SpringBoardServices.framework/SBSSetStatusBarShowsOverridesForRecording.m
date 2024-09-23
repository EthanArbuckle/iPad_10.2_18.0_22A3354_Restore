@implementation SBSSetStatusBarShowsOverridesForRecording

uint64_t __SBSSetStatusBarShowsOverridesForRecording_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort();
  return SBSetShowsOverridesForRecording(v2, *(unsigned __int8 *)(a1 + 32));
}

@end
