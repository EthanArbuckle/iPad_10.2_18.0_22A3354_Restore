@implementation LoadSharing

void __LoadSharing_block_invoke()
{
  LoadSharing_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  if (!LoadSharing_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/Sharing.framework/Sharing"));
}

void __LoadSharing_block_invoke_0()
{
  LoadSharing_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  if (!LoadSharing_frameworkLibrary_0)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/Sharing.framework/Sharing"));
}

@end
