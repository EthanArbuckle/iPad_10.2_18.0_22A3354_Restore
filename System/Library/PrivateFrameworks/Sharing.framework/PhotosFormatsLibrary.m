@implementation PhotosFormatsLibrary

void *__PhotosFormatsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/PhotosFormats.framework/PhotosFormats", 2);
  PhotosFormatsLibrary_sLib = (uint64_t)result;
  return result;
}

@end
