@implementation NSData(TransparencyData)

+ (id)kt_dataWithHexString:()TransparencyData
{
  size_t v4;
  void *v5;
  void *v6;
  size_t v7;
  _BYTE *v8;
  void *v9;
  char *v11;
  char __str[2];
  char v13;

  if (!__s)
    return 0;
  v13 = 0;
  *(_WORD *)__str = 0;
  v4 = strlen(__s);
  v5 = malloc_type_malloc(v4 >> 1, 0xB89A162EuLL);
  v6 = v5;
  if (v4)
  {
    v7 = 0;
    v8 = v5;
    do
    {
      *(_WORD *)__str = *(_WORD *)&__s[v7];
      v11 = 0;
      *v8++ = strtol(__str, &v11, 16);
      v7 += 2;
    }
    while (v7 < v4);
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v6, v4 >> 1);
  free(v6);
  return v9;
}

- (__CFString)kt_hexString
{
  __CFString *v2;
  unint64_t v3;
  id v4;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "length"))
    {
      v3 = 0;
      do
      {
        v4 = objc_retainAutorelease(a1);
        -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%02X"), *(unsigned __int8 *)(objc_msgSend(v4, "bytes") + v3++));
      }
      while (v3 < objc_msgSend(v4, "length"));
    }
  }
  else
  {
    v2 = &stru_24DC90470;
  }
  return v2;
}

- (id)kt_sha256
{
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  ccsha256_di();
  objc_msgSend(a1, "length", (unsigned __int128)0, (unsigned __int128)0);
  objc_msgSend(objc_retainAutorelease(a1), "bytes");
  ccdigest();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v3, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)kt_sha256WithSalt:()TransparencyData
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "kt_dataWithUint64:length:", objc_msgSend(v4, "length"), 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v6);

    objc_msgSend(v5, "appendData:", v4);
    objc_msgSend(MEMORY[0x24BDBCE50], "kt_dataWithUint64:length:", objc_msgSend(a1, "length"), 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v7);

    objc_msgSend(v5, "appendData:", a1);
    objc_msgSend(v5, "kt_sha256");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "kt_sha256");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)kt_random
{
  _OWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  memset(v1, 0, sizeof(v1));
  SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], 0x20uLL, v1);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v1, 32);
}

+ (id)kt_dataWithUint64:()TransparencyData length:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v12;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 8;
  if (a4 < 8)
    v7 = a4;
  if (v7)
  {
    v8 = 0;
    v9 = 8 * v7;
    v10 = a4 - 1;
    do
    {
      v12 = a3 >> v8;
      objc_msgSend(v6, "replaceBytesInRange:withBytes:", v10, 1, &v12);
      v8 += 8;
      --v10;
    }
    while (v9 != v8);
  }
  return v6;
}

@end
