@implementation UIImage(SBFWallpapers)

- (CGImage)sbf_imageHashData
{
  CGImage *DataProvider;
  const __CFData *v2;
  const UInt8 *BytePtr;
  CC_LONG Length;
  unsigned __int8 md[20];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  DataProvider = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  if (DataProvider)
  {
    DataProvider = CGImageGetDataProvider(DataProvider);
    if (DataProvider)
    {
      DataProvider = CGDataProviderCopyData(DataProvider);
      if (DataProvider)
      {
        v2 = DataProvider;
        BytePtr = CFDataGetBytePtr(DataProvider);
        Length = CFDataGetLength(v2);
        CC_SHA1(BytePtr, Length, md);
        CFRelease(v2);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
        DataProvider = (CGImage *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return DataProvider;
}

@end
