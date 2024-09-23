@implementation PhotosLibrary

void *__PhotosLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/Photos.framework/Photos", 2);
  PhotosLibrary_sLib = (uint64_t)result;
  return result;
}

@end
