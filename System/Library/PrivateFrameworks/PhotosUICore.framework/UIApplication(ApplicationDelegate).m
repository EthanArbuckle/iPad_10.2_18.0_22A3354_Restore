@implementation UIApplication(ApplicationDelegate)

+ (uint64_t)px_sharedApplication
{
  return objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
}

@end
