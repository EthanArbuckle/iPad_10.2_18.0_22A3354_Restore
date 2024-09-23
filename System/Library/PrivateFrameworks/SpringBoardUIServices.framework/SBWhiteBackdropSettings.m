@implementation SBWhiteBackdropSettings

- (id)combinedTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
}

- (double)blurRadius
{
  return 5.0;
}

@end
