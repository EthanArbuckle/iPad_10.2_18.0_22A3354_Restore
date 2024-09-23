@implementation NSData(BCD)

- (uint64_t)decodeBCDAtOffset:()BCD length:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned int v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v8 = 0;
  if (a4)
  {
    v9 = (unsigned __int8 *)(v7 + a3);
    do
    {
      v10 = *v9++;
      v8 = (v10 & 0xF) + 100 * v8 + 10 * (v10 >> 4);
      --a4;
    }
    while (a4);
  }
  return objc_msgSend(v6, "numberWithUnsignedLongLong:", v8);
}

- (uint64_t)decodeBCD
{
  void *v1;
  id v2;
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t i;
  unsigned int v6;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  v2 = objc_retainAutorelease(a1);
  v3 = (unsigned __int8 *)objc_msgSend(v2, "bytes");
  v4 = objc_msgSend(v2, "length");
  for (i = 0; v4; --v4)
  {
    v6 = *v3++;
    i = (v6 & 0xF) + 100 * i + 10 * (v6 >> 4);
  }
  return objc_msgSend(v1, "numberWithUnsignedLongLong:", i);
}

- (uint64_t)encodeBCDAtOffset:()BCD length:
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", EncodeBCD((unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(a1), "bytes") + a3), a4));
}

- (uint64_t)encodeBCD
{
  void *v1;
  id v2;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  v2 = objc_retainAutorelease(a1);
  return objc_msgSend(v1, "numberWithUnsignedLongLong:", EncodeBCD((unsigned __int8 *)objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length")));
}

@end
