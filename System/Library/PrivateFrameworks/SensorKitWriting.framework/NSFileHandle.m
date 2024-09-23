@implementation NSFileHandle

- (void)pathname
{
  int v1;
  _BYTE v2[1024];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = objc_msgSend(result, "fileDescriptor");
    if (v1 < 0 || fcntl(v1, 50, v2) < 0)
      return 0;
    else
      return (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v2);
  }
  return result;
}

@end
