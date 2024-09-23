@implementation UIApplication(RPTCatalystAdditions)

+ (uint64_t)nsApplication
{
  return -[objc_class sharedApplication](NSClassFromString(CFSTR("NSApplication")), "sharedApplication");
}

@end
