@implementation _UISnapshotWindow

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)_isSettingFirstResponder
{
  return 0;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (BOOL)_canActAsKeyWindowForScreen:(id)a3
{
  return 0;
}

- (BOOL)_canDisableMirroring
{
  return 0;
}

- (BOOL)_alwaysGetsContexts
{
  return 1;
}

- (BOOL)_shouldAdjustSizeClassesAndResizeWindow
{
  return 1;
}

- (BOOL)_extendsScreenSceneLifetime
{
  return self->__extendsScreenSceneLifetime;
}

- (void)set_extendsScreenSceneLifetime:(BOOL)a3
{
  self->__extendsScreenSceneLifetime = a3;
}

@end
