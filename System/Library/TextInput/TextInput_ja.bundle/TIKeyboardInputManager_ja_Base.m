@implementation TIKeyboardInputManager_ja_Base

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DC0]);
}

@end
