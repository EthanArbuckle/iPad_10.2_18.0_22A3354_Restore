@implementation UIColor(WiFiKitUI)

+ (uint64_t)defaultTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

+ (uint64_t)altTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
}

+ (uint64_t)defaultBgColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
}

+ (uint64_t)listPlatterBgColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
}

+ (uint64_t)defaultButtonColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
}

+ (uint64_t)defaultHyperLinkColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
}

@end
