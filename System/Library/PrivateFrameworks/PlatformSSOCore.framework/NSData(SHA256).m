@implementation NSData(SHA256)

- (id)psso_sha256HashString
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "psso_sha256Hash");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)psso_sha256Hash
{
  void *v2;
  id v3;
  unsigned __int8 md[32];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(a1, "length");
  if (v2)
  {
    v3 = objc_retainAutorelease(a1);
    CC_SHA256((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 32);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
