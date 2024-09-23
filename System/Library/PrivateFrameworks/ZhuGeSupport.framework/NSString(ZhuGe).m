@implementation NSString(ZhuGe)

+ (uint64_t)isDataConvertibleToVisibleString:()ZhuGe
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v5, "bytes");
    v7 = objc_msgSend(v5, "length");
    while (v7)
    {
      v8 = v7 - 1;
      if (*(unsigned __int8 *)(v6 - 1 + v7--))
      {
        v10 = 0;
        v11 = v8 + 1;
        while (*(char *)(v6 + v10) >= 8)
        {
          v12 = *(unsigned __int8 *)(v6 + v10);
          if (v12 == 127 || (v12 - 14) <= 0x11)
            break;
          if (++v10 >= v11)
          {
            v14 = 1;
            goto LABEL_15;
          }
        }
        break;
      }
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

+ (__CFString)stringFromData:()ZhuGe
{
  id v4;
  void *v5;
  __CFString *v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "length"))
    {
      if (objc_msgSend(a1, "isDataConvertibleToVisibleString:", v5))
        objc_msgSend(a1, "visibleStringFromData:", v5);
      else
        objc_msgSend(a1, "hexStringFromData:", v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_251C3EC38;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (__CFString)visibleStringFromData:()ZhuGe
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  char v8;

  v3 = a3;
  v4 = v3;
  v8 = 0;
  if (v3)
  {
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(v4, "getBytes:range:", &v8, objc_msgSend(v4, "length") - 1, 1);
      if (v8)
      {
        v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v4), "bytes"));
        v5 = objc_claimAutoreleasedReturnValue();
      }
      v6 = (__CFString *)v5;
    }
    else
    {
      v6 = &stru_251C3EC38;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)hexStringFromData:()ZhuGe
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned int v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v5 = objc_msgSend(v3, "length");
    v6 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    if (v5)
    {
      v7 = (unsigned __int8 *)v6;
      do
      {
        v8 = *v7++;
        objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), v8);
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)macAddressStringFromData:()ZhuGe
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned int v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v5 = objc_msgSend(v3, "length");
    v6 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    if (v5)
    {
      v7 = (unsigned __int8 *)v6;
      do
      {
        v8 = *v7++;
        objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), v8);
        if (v5 != 1)
          objc_msgSend(v4, "appendFormat:", CFSTR(":"));
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)macAddressStringFromSysconfigDataSixByte:()ZhuGe
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned int v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if ((unint64_t)objc_msgSend(v3, "length") <= 6)
      v5 = objc_msgSend(v3, "length");
    else
      v5 = 6;
    v6 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    if (v5)
    {
      v7 = (unsigned __int8 *)v6;
      do
      {
        v8 = *v7++;
        objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), v8);
        if (v5 != 1)
          objc_msgSend(v4, "appendFormat:", CFSTR(":"));
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)stringByRemovingCharactersInString:()ZhuGe
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = a1;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v4, "substringWithRange:", v6, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_251C3EC38);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      ++v6;
      v5 = v8;
    }
    while (objc_msgSend(v4, "length") > v6);
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)stringByTrimmingCharactersInString:()ZhuGe
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a1;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  return v4;
}

- (id)stringByLeftTrimmingCharacter:()ZhuGe
{
  const char *v4;
  size_t v5;
  size_t v6;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v5 = strlen(v4);
  v6 = 0;
  if (v5)
  {
    while (v4[v6] == a3)
    {
      if (v5 == ++v6)
      {
        v6 = v5;
        return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v4[v6], v5 - v6, 4);
      }
    }
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v4[v6], v5 - v6, 4);
}

- (id)stringByRightTrimmingCharacter:()ZhuGe
{
  int v3;
  const char *v4;
  size_t v5;
  size_t v6;

  v3 = a3;
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v5 = strlen(v4);
  do
  {
    v6 = v5;
    if (!v5)
      break;
    --v5;
  }
  while (v4[v6 - 1] == v3);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v4, v6, 4);
}

- (id)ccccValue
{
  unsigned int *v2;
  void *v3;

  if (objc_msgSend(a1, "length") == 4)
  {
    v2 = (unsigned int *)objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*v2));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
