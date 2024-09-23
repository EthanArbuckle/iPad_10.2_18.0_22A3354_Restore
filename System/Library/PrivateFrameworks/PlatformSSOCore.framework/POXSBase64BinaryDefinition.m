@implementation POXSBase64BinaryDefinition

- (id)valueFromString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDBCE50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 1);

  return v5;
}

- (id)stringFromValue:(id)a3
{
  return (id)objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
}

@end
