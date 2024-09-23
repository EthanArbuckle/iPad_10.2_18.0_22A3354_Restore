@implementation AMSBag(VUIAdditions)

+ (uint64_t)vui_defaultBag
{
  return objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("TVApp"), CFSTR("1"));
}

@end
