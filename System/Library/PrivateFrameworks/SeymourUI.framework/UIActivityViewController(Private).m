@implementation UIActivityViewController(Private)

- (uint64_t)smu_setSharingAsCollapsed
{
  return objc_msgSend(a1, "setSharingStyle:", 1);
}

@end
