@implementation NSData(PosterUIFoundation)

+ (id)pui_loadImageDataFromFileURL:()PosterUIFoundation error:
{
  uint64_t MappedDataFromPath;
  void *v6;

  if (a3)
  {
    objc_msgSend(a3, "path");
    MappedDataFromPath = CPBitmapCreateMappedDataFromPath();
    v6 = (void *)MappedDataFromPath;
    if (a4 && !MappedDataFromPath)
      *a4 = objc_retainAutorelease(0);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
