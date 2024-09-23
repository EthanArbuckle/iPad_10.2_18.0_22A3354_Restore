@implementation WebPreferences(WebPrivateTesting)

+ (uint64_t)_clearNetworkLoaderSession:()WebPrivateTesting
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

@end
