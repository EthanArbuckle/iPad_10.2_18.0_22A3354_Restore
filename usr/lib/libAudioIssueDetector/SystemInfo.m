@implementation SystemInfo

+ (id)buildString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operatingSystemVersionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringToIndex:", objc_msgSend(v6, "length") - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)deviceName
{
  utsname v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  memset(&v3, 0, 512);
  uname(&v3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v3.machine, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
