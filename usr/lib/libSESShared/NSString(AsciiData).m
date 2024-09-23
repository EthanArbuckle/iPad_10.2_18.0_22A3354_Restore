@implementation NSString(AsciiData)

- (uint64_t)asAsciiData
{
  return objc_msgSend(a1, "dataUsingEncoding:", 1);
}

+ (id)stringWithAsciiData:()AsciiData
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 1);

  return v5;
}

@end
