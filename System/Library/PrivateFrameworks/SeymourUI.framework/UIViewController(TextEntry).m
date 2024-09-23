@implementation UIViewController(TextEntry)

+ (SMUTextEntryController)textEntryController
{
  return objc_alloc_init(SMUTextEntryController);
}

@end
