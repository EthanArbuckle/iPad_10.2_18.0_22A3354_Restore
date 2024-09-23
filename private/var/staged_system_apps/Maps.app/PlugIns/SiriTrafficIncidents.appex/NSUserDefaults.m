@implementation NSUserDefaults

+ (id)__maps_groupUserDefaults
{
  return objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("group.com.apple.Maps"));
}

@end
