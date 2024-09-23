@implementation SBHomeScreenEntity

- (BOOL)isHomeScreenEntity
{
  return 1;
}

- (SBHomeScreenEntity)init
{
  return -[SBWorkspaceEntity initWithIdentifier:displayChangeSettings:](self, "initWithIdentifier:displayChangeSettings:", CFSTR("com.apple.SpringBoard.workspace-entity.builtin.home-screen"), 0);
}

- (int64_t)layoutRole
{
  return 1;
}

- (int64_t)_mainDisplayPreferredInterfaceOrientation
{
  return objc_msgSend((id)SBApp, "interfaceOrientationForCurrentDeviceOrientation:", 0);
}

@end
