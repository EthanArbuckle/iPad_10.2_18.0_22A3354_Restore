@implementation SBRecordingOverridesTestRecipe

- (id)title
{
  return CFSTR("Status Bar Recording Overrides");
}

- (void)handleVolumeIncrease
{
  SBSSetStatusBarShowsOverridesForRecording();
}

- (void)handleVolumeDecrease
{
  SBSSetStatusBarShowsOverridesForRecording();
}

@end
