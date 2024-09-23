@implementation NSFileHandle(FTABWrite)

- (uint64_t)writeBytes:()FTABWrite length:
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "uarpWriteData:error:", v2, 0);

  return v3;
}

@end
