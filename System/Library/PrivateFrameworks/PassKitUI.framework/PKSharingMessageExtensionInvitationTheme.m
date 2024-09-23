@implementation PKSharingMessageExtensionInvitationTheme

+ (id)primaryTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
}

+ (id)captionTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (id)subcaptionTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (id)carKeyImageBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.603921569, 0.603921569, 0.658823529, 1.0);
}

+ (id)messageBubbleBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
}

+ (id)messageTitleFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A98], (NSString *)*MEMORY[0x1E0DC48D0], *MEMORY[0x1E0DC1448]);
}

+ (id)messageDefaultFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

@end
