@implementation NSData

- (NSData)bzip2CompressedData
{
  NSData *v2;
  void *v3;
  uint64_t v5;
  void *v6;

  v5 = 0;
  v6 = 0;
  v2 = objc_retainAutorelease(self);
  if (GEOBZ2Compress(-[NSData bytes](v2, "bytes"), -[NSData length](v2, "length"), &v6, &v5))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v6, v5, 1));
  }
  else
  {
    free(v6);
    v3 = 0;
  }
  return (NSData *)v3;
}

- (NSData)bzip2UncompressedData
{
  NSData *v2;
  int v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  v2 = objc_retainAutorelease(self);
  v3 = GEOBZ2Uncompress(-[NSData bytes](v2, "bytes"), -[NSData length](v2, "length"), &v7, &v6);
  v4 = 0;
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v7, v6, 1));
  return (NSData *)v4;
}

@end
