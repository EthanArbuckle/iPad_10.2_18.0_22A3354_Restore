@implementation GrayPlaceholderColor

void ___GrayPlaceholderColor_block_invoke()
{
  CGColorSpace *DeviceGray;
  __int128 v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v1 = xmmword_190455D40;
  qword_1ECF22AB0 = (uint64_t)CGColorCreate(DeviceGray, (const CGFloat *)&v1);
  CGColorSpaceRelease(DeviceGray);
}

@end
