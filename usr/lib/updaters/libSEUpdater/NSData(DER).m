@implementation NSData(DER)

+ (uint64_t)dataWithDERItem:()DER
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

@end
