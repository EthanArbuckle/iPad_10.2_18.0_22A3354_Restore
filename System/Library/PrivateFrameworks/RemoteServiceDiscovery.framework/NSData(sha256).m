@implementation NSData(sha256)

- (id)sha256
{
  id v1;
  void *v2;
  id v3;
  const void *v4;
  CC_LONG v5;
  id v6;

  v1 = objc_retainAutorelease(a1);
  if (objc_msgSend(v1, "bytes") && objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_retainAutorelease(v1);
    v4 = (const void *)objc_msgSend(v3, "bytes");
    v5 = objc_msgSend(v3, "length");
    v6 = objc_retainAutorelease(v2);
    CC_SHA256(v4, v5, (unsigned __int8 *)objc_msgSend(v6, "mutableBytes"));
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
