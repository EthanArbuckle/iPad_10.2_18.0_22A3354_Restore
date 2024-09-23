@implementation NSData(DERItem)

+ (uint64_t)dataWithDERItem:()DERItem
{
  return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *a3, a3[1]);
}

- (uint64_t)DERItem
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  return v2;
}

- (uint64_t)isEqualToDERItem:()DERItem
{
  return objc_msgSend(a1, "isEqualToBytes:length:", *a3, a3[1]);
}

@end
