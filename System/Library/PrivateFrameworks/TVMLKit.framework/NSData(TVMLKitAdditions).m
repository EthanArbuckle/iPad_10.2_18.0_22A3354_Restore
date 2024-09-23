@implementation NSData(TVMLKitAdditions)

- (uint64_t)tv_lowercaseHexString
{
  void *v1;
  id v2;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = objc_retainAutorelease(a1);
  return objc_msgSend(v1, "tv_lowercaseHexStringWithBytes:length:", objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"));
}

- (id)tv_SHA256Digest
{
  uint64_t v2;
  void *v3;
  unsigned __int8 md[32];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "length");
  if (v2 < 1)
  {
    v3 = 0;
  }
  else
  {
    CC_SHA256((const void *)objc_msgSend(objc_retainAutorelease(a1), "bytes"), v2, md);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)tv_MD5Digest
{
  uint64_t v2;
  void *v3;
  unsigned __int8 md[16];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "length");
  if (v2 < 1)
  {
    v3 = 0;
  }
  else
  {
    CC_MD5((const void *)objc_msgSend(objc_retainAutorelease(a1), "bytes"), v2, md);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 16);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)tv_SHA1Digest
{
  uint64_t v2;
  void *v3;
  _OWORD v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "length");
  if (v2 < 1)
  {
    v3 = 0;
  }
  else
  {
    memset(v5, 0, sizeof(v5));
    CC_SHA1((const void *)objc_msgSend(objc_retainAutorelease(a1), "bytes", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                      0,
                      0,
                      0,
                      0),
      v2,
      (unsigned __int8 *)v5);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, 20);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
