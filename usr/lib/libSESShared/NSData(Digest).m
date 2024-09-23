@implementation NSData(Digest)

- (id)sha1
{
  void *v2;
  id v3;
  const void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  LODWORD(v3) = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v2);
  CC_SHA1(v4, (CC_LONG)v3, (unsigned __int8 *)objc_msgSend(v5, "mutableBytes"));
  return v5;
}

- (id)sha256
{
  void *v2;
  id v3;
  const void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  LODWORD(v3) = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v2);
  CC_SHA256(v4, (CC_LONG)v3, (unsigned __int8 *)objc_msgSend(v5, "mutableBytes"));
  return v5;
}

- (id)sha384
{
  void *v2;
  id v3;
  const void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 48);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  LODWORD(v3) = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v2);
  CC_SHA384(v4, (CC_LONG)v3, (unsigned __int8 *)objc_msgSend(v5, "mutableBytes"));
  return v5;
}

@end
