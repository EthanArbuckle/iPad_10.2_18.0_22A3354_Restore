@implementation PhotosUIPrivateLibrary

void *__PhotosUIPrivateLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/PhotosUIPrivate.framework/PhotosUIPrivate", 2);
  PhotosUIPrivateLibrary_sLib = (uint64_t)result;
  return result;
}

@end
