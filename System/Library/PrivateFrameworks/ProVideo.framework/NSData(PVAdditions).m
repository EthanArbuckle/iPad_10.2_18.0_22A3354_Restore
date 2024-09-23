@implementation NSData(PVAdditions)

- (BOOL)pv_writeToPixelBuffer:()PVAdditions
{
  size_t v5;

  if (!a3)
    return 0;
  v5 = objc_msgSend(a1, "length");
  if (v5 > CVPixelBufferGetDataSize(a3) || CVPixelBufferLockBaseAddress(a3, 0))
    return 0;
  objc_msgSend(a1, "getBytes:length:", CVPixelBufferGetBaseAddress(a3), v5);
  return CVPixelBufferUnlockBaseAddress(a3, 0) == 0;
}

+ (__CVBuffer)pv_dataWithPixelBuffer:()PVAdditions
{
  __CVBuffer *v3;
  size_t DataSize;
  size_t v5;
  void *v6;

  v3 = a3;
  if (a3)
  {
    DataSize = CVPixelBufferGetDataSize(a3);
    if (DataSize && (v5 = DataSize, !CVPixelBufferLockBaseAddress(v3, 1uLL)))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", CVPixelBufferGetBaseAddress(v3), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (CVPixelBufferUnlockBaseAddress(v3, 1uLL))
        v3 = 0;
      else
        v3 = v6;

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

@end
