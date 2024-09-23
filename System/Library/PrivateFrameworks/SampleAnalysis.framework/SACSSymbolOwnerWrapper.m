@implementation SACSSymbolOwnerWrapper

- (void)dealloc
{
  objc_super v3;

  CSRelease();
  v3.receiver = self;
  v3.super_class = (Class)SACSSymbolOwnerWrapper;
  -[SACSSymbolOwnerWrapper dealloc](&v3, sel_dealloc);
}

- (uint64_t)symbolOwner
{
  uint64_t v1;

  if (result)
  {
    objc_copyStruct(&v1, (const void *)(result + 16), 16, 1, 0);
    return v1;
  }
  return result;
}

@end
