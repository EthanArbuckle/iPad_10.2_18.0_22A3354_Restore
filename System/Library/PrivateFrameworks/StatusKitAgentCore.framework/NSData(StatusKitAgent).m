@implementation NSData(StatusKitAgent)

- (id)ska_hexString
{
  uint64_t v2;
  unsigned __int8 *v3;
  void *i;
  unsigned int v5;
  void *v6;

  v2 = objc_msgSend(a1, "length");
  v3 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 2 * v2); v2; --v2)
  {
    v5 = *v3++;
    objc_msgSend(i, "appendFormat:", CFSTR("%02lx"), v5);
  }
  v6 = (void *)objc_msgSend(i, "copy");

  return v6;
}

- (id)ska_sha256
{
  void *v1;
  void *v2;
  id v3;
  const void *v4;
  CC_LONG v5;
  id v6;
  void *v7;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithData:", a1);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(v1);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = objc_retainAutorelease(v2);
  CC_SHA256(v4, v5, (unsigned __int8 *)objc_msgSend(v6, "mutableBytes"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

@end
