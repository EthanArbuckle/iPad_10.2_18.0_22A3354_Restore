@implementation NSData(DERItem)

+ (uint64_t)dataWithDERItem:()DERItem
{
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *a3, a3[1]);
}

@end
