@implementation PIRGB10PortraitVideoProcessor

+ (int)formatForInputAtIndex:(int)a3
{
  objc_super v4;

  if (!a3)
    return *MEMORY[0x1E0C9DFE8];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PIRGB10PortraitVideoProcessor;
  return objc_msgSendSuper2(&v4, sel_formatForInputAtIndex_);
}

+ (int)outputFormat
{
  return *MEMORY[0x1E0C9DFE8];
}

@end
