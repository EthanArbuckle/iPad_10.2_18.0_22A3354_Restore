@implementation UIScreen(SBSnapshotExtensions)

- (id)sb_snapshotViewImmediatelyFramedForPortrait
{
  void *v2;

  objc_msgSend((id)SBApp, "pushTransientActiveInterfaceOrientation:forReason:", 1, CFSTR("SBPortraitFramedSnapshot"));
  objc_msgSend(a1, "snapshotViewAfterScreenUpdates:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "popTransientActiveInterfaceOrientationForReason:", CFSTR("SBPortraitFramedSnapshot"));
  return v2;
}

@end
