@implementation NSData(TRAdditions)

- (id)TR_compressedGzipData
{
  return (id)TRCopyGzippedDataForData(a1);
}

- (id)TR_decompressedGzipData
{
  return TRCopyDecompressedGZipDataForData();
}

@end
