@implementation NSData(Comparison)

- (BOOL)isEqualToBytes:()Comparison length:
{
  return objc_msgSend(a1, "length") == a4
      && memcmp((const void *)objc_msgSend(objc_retainAutorelease(a1), "bytes"), a3, a4) == 0;
}

- (uint64_t)compare:()Comparison
{
  id v4;
  id v5;
  const void *v6;
  id v7;
  const void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v4 = a3;
  v5 = objc_retainAutorelease(a1);
  v6 = (const void *)objc_msgSend(v5, "bytes");
  v7 = objc_retainAutorelease(v4);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v5, "length");
  if (v9 >= objc_msgSend(v7, "length"))
    v10 = v7;
  else
    v10 = v5;
  v11 = memcmp(v6, v8, objc_msgSend(v10, "length"));
  if (v11)
  {
    if (v11 > 0)
      v12 = 1;
    else
      v12 = -1;
  }
  else
  {
    v13 = objc_msgSend(v5, "length");
    if (v13 == objc_msgSend(v7, "length"))
    {
      v12 = 0;
    }
    else
    {
      v14 = objc_msgSend(v5, "length");
      if (v14 < objc_msgSend(v7, "length"))
        v12 = -1;
      else
        v12 = 1;
    }
  }

  return v12;
}

- (BOOL)isAlLFF
{
  id v1;
  unsigned __int8 *v2;
  unint64_t v3;
  uint64_t v5;
  unint64_t v6;
  int v7;

  v1 = objc_retainAutorelease(a1);
  v2 = (unsigned __int8 *)objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");
  if (!v3)
    return 1;
  if (*v2 != 255)
    return 0;
  v5 = 1;
  do
  {
    v6 = v5;
    if (v3 == v5)
      break;
    v7 = v2[v5++];
  }
  while (v7 == 255);
  return v6 >= v3;
}

- (BOOL)isAll00
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

@end
