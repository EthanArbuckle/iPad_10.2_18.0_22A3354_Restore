@implementation NSError(SXAdditions)

+ (id)unreachableNetworkError
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0FC8];
  v5[0] = CFSTR("Network Unreachable");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("SXWebContentErrorDomain"), -2, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)unknownError
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0FC8];
  v5[0] = CFSTR("Unknown Error");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("SXWebContentErrorDomain"), -1, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
