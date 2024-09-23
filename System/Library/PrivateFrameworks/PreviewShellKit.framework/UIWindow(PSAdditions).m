@implementation UIWindow(PSAdditions)

- (uint64_t)uv_createSnapshotImageFromIOSurface
{
  uint64_t result;

  result = objc_msgSend(a1, "createIOSurface");
  if (result)
    return UICreateCGImageFromIOSurface();
  return result;
}

@end
