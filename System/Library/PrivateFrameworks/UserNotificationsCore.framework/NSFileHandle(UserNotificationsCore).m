@implementation NSFileHandle(UserNotificationsCore)

- (id)unc_secureFileURL
{
  void *v2;
  void *v3;
  _BYTE v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (fcntl(objc_msgSend(a1, "fileDescriptor"), 50, v4))
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
