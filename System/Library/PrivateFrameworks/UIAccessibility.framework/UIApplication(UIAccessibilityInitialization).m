@implementation UIApplication(UIAccessibilityInitialization)

- (uint64_t)_accessibilityIsSystemAppServer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__UIApplication_UIAccessibilityInitialization___accessibilityIsSystemAppServer__block_invoke;
  block[3] = &unk_1E3DFE9F8;
  block[4] = a1;
  if (_accessibilityIsSystemAppServer_onceToken != -1)
    dispatch_once(&_accessibilityIsSystemAppServer_onceToken, block);
  return IsSystemAppServer;
}

- (uint64_t)_accessibilityUpdateIsSystemAppServer
{
  uint64_t result;

  result = AXProcessIsSystemApplication();
  IsSystemAppServer = result;
  return result;
}

- (uint64_t)_accessibilitySystemAppServerIsReady
{
  return 1;
}

@end
