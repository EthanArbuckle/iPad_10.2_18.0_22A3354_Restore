@implementation NSData(Random)

+ (id)randomData:()Random
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  arc4random_buf((void *)objc_msgSend(v0, "mutableBytes"), objc_msgSend(v0, "length"));
  return v0;
}

@end
