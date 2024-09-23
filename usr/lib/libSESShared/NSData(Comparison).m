@implementation NSData(Comparison)

- (BOOL)isAllZero
{
  id v1;
  _BYTE *v2;
  unint64_t v3;
  uint64_t v5;
  unint64_t v6;

  v1 = objc_retainAutorelease(a1);
  v2 = (_BYTE *)objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");
  if (!v3)
    return 1;
  if (*v2)
    return 0;
  v5 = 1;
  do
  {
    v6 = v5;
    if (v3 == v5)
      break;
    ++v5;
  }
  while (!v2[v6]);
  return v6 >= v3;
}

- (BOOL)isEqualToBytes:()Comparison length:
{
  id v6;

  if (objc_msgSend(a1, "length") != a4)
    return 0;
  v6 = objc_retainAutorelease(a1);
  return memcmp((const void *)objc_msgSend(v6, "bytes"), a3, objc_msgSend(v6, "length")) == 0;
}

- (uint64_t)isEqualToHexCString:()Comparison
{
  uint64_t v5;
  size_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  int v12;
  char __str[2];
  char v14;

  if (!a3)
    return 0;
  v5 = objc_msgSend(a1, "length");
  v6 = strlen(a3);
  result = 0;
  if ((v6 & 1) == 0 && v6 == 2 * v5)
  {
    v14 = 0;
    v8 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
    if (v6)
    {
      v9 = v8;
      v10 = 0;
      v11 = MEMORY[0x24BDAC740];
      while (1)
      {
        *(_WORD *)__str = *(_WORD *)&a3[v10];
        if (__str[0] < 0)
          break;
        result = 0;
        if ((*(_DWORD *)(v11 + 4 * __str[0] + 60) & 0x10000) == 0 || *(__int16 *)__str < 0)
          return result;
        if ((*(_DWORD *)(v11 + ((4 * __str[1]) & 0x3FFFFFFFCLL) + 60) & 0x10000) == 0)
          break;
        v12 = *(unsigned __int8 *)(v9 + (v10 >> 1));
        if (v12 != strtoul(__str, 0, 16))
          break;
        v10 += 2;
        if (v10 >= v6)
          return 1;
      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

@end
