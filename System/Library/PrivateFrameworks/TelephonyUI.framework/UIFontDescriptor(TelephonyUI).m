@implementation UIFontDescriptor(TelephonyUI)

+ (uint64_t)telephonyUISubheadlineShortEmphasizedFontDescriptor
{
  return objc_msgSend(a1, "telephonyUIPreferredFontDescriptorWithTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4B10], 32770);
}

+ (uint64_t)telephonyUISubheadlineShortSemiboldFontDescriptor
{
  return objc_msgSend(a1, "telephonyUIPreferredFontDescriptorWithTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4B10], 0x8000);
}

+ (uint64_t)telephonyUIPreferredFontDescriptorWithTextStyle:()TelephonyUI addingSymbolicTraits:
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, a4, 0);
}

+ (uint64_t)telephonyUISubheadlineShortFontDescriptor
{
  return objc_msgSend(a1, "telephonyUIPreferredFontDescriptorWithTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4B10], 0x8000);
}

+ (uint64_t)telephonyUIBodyShortEmphasizedFontDescriptor
{
  return objc_msgSend(a1, "telephonyUIPreferredFontDescriptorWithTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4A88], 32770);
}

+ (uint64_t)telephonyUIBodyShortFontDescriptor
{
  return objc_msgSend(a1, "telephonyUIPreferredFontDescriptorWithTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4A88], 0x8000);
}

+ (uint64_t)telephonyUIBodyShortItalicFontDescriptor
{
  return objc_msgSend(a1, "telephonyUIPreferredFontDescriptorWithTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4A88], 32769);
}

+ (uint64_t)telephonyUIFootnoteShortFontDescriptor
{
  return objc_msgSend(a1, "telephonyUIPreferredFontDescriptorWithTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4AB8], 0x8000);
}

@end
