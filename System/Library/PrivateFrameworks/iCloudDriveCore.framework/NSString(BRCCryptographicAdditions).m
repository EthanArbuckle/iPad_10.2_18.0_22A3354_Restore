@implementation NSString(BRCCryptographicAdditions)

+ (__CFString)brc_hexadecimalStringWithBytes:()BRCCryptographicAdditions length:
{
  unint64_t v4;
  __CFString *v6;
  uint64_t v7;
  _BYTE *v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unsigned int v11;
  __CFString *v12;
  char cStr[1025];
  _QWORD v15[129];

  v4 = a4;
  v15[128] = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 2 * a4);
  if (v6)
  {
    for (; v4; v4 -= v7)
    {
      if (v4 >= 0x200)
        v7 = 512;
      else
        v7 = v4;
      v8 = v15;
      v9 = a3;
      v10 = v7;
      do
      {
        v11 = *v9++;
        *(v8 - 1) = a0123456789abcd[(unint64_t)v11 >> 4];
        *v8 = a0123456789abcd[v11 & 0xF];
        v8 += 2;
        --v10;
      }
      while (v10);
      cStr[2 * v7] = 0;
      CFStringAppendCString(v6, cStr, 0x600u);
      a3 += v7;
    }
    v12 = v6;
  }

  return v6;
}

- (id)brc_SHA256
{
  const char *v1;
  CC_LONG v2;
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  memset(v4, 0, sizeof(v4));
  v2 = strlen(v1);
  CC_SHA256(v1, v2, (unsigned __int8 *)v4);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v4, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)brc_SHA1WithSalt:()BRCCryptographicAdditions
{
  id v4;
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  size_t v9;
  size_t v10;
  _BYTE macOut[20];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a1);
  v5 = a3;
  v6 = (const char *)objc_msgSend(v4, "UTF8String");
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  v9 = strlen(v6);
  v10 = strlen(v8);
  CCHmac(0, v6, v9, v8, v10, macOut);
  objc_msgSend(MEMORY[0x24BDD17C8], "brc_hexadecimalStringWithBytes:length:", macOut, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)brc_SHA256WithSalt:()BRCCryptographicAdditions
{
  id v4;
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  size_t v9;
  size_t v10;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a1);
  v5 = a3;
  v6 = (const char *)objc_msgSend(v4, "UTF8String");
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "bytes");

  memset(v12, 0, sizeof(v12));
  v9 = strlen(v6);
  v10 = strlen(v8);
  CCHmac(2u, v6, v9, v8, v10, v12);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)brc_dataFromHexidecimalString
{
  id v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  unint64_t i;
  char v7;
  char __str[2];
  char v9;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "UTF8String");
  v3 = objc_msgSend(v1, "length");
  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v3 >> 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v7 = 0;
    if (v3)
    {
      for (i = 0; i < v3; i += 2)
      {
        *(_WORD *)__str = *(_WORD *)(v2 + i);
        v7 = strtoul(__str, 0, 16);
        objc_msgSend(v4, "appendBytes:length:", &v7, 1);
      }
    }
  }
  return v4;
}

@end
