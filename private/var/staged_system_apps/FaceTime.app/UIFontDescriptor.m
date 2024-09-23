@implementation UIFontDescriptor

+ (id)phPreferredFontDescriptorForTextStyle:(id)a3
{
  return objc_msgSend(a1, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:", a3, 0);
}

+ (id)phPreferredFontDescriptorForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4
{
  return +[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, *(_QWORD *)&a4, 1);
}

@end
