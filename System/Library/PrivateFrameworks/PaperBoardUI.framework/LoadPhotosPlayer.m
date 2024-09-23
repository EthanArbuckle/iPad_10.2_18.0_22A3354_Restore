@implementation LoadPhotosPlayer

void __LoadPhotosPlayer_block_invoke()
{
  LoadPhotosPlayer_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PhotosPlayer.framework/PhotosPlayer", 2);
  if (!LoadPhotosPlayer_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/PhotosPlayer.framework/PhotosPlayer"));
}

@end
