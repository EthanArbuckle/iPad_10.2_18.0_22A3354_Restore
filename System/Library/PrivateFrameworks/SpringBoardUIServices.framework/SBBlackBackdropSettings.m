@implementation SBBlackBackdropSettings

- (id)combinedTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
}

- (double)blurRadius
{
  return 5.0;
}

@end
