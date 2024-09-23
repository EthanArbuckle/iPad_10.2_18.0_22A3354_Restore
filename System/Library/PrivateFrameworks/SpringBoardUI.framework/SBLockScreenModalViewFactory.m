@implementation SBLockScreenModalViewFactory

+ (id)newLockScreenModalView
{
  return (id)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("CSModalView"))), "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

@end
