@implementation UIFontDescriptor(SafariSharedExtras)

+ (uint64_t)safari_preferredFontDescriptorWithTextStyle:()SafariSharedExtras
{
  return objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:");
}

@end
