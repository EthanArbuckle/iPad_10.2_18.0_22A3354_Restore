@implementation UIBarButtonItem(TelephonyUI)

+ (id)telephonyUI_fixedSpaceBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
}

+ (id)telephonyUI_flexibleSpaceBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
}

@end
