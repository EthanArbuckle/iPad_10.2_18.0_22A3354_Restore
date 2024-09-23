@implementation NSData(WBDataAdditions)

+ (uint64_t)tc_nsDataWithOcBinaryData:()WBDataAdditions
{
  return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(a3 + 24) + *(unsigned int *)(a3 + 8), *(unsigned int *)(a3 + 16));
}

@end
