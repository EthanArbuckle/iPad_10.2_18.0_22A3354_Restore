@implementation NSData(Hex)

- (id)asHexString
{
  void *v2;
  unint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "length"))
  {
    v3 = 0;
    do
    {
      v4 = objc_retainAutorelease(a1);
      objc_msgSend(v2, "appendFormat:", CFSTR("%02X"), *(unsigned __int8 *)(objc_msgSend(v4, "bytes") + v3++));
    }
    while (v3 < objc_msgSend(v4, "length"));
  }
  return v2;
}

+ (id)dataWithHexString:()Hex
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char __str[2];
  char v13;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "UTF8String");
  v5 = 0;
  if (v3)
  {
    v6 = v4;
    if (v4)
    {
      if ((objc_msgSend(v3, "length") & 1) != 0)
      {
LABEL_16:
        v5 = 0;
        goto LABEL_17;
      }
      if (objc_msgSend(v3, "length"))
      {
        v13 = 0;
        v7 = malloc_type_malloc((unint64_t)objc_msgSend(v3, "length") >> 1, 0x2FE6748EuLL);
        bzero(v7, (unint64_t)objc_msgSend(v3, "length") >> 1);
        if (objc_msgSend(v3, "length"))
        {
          v8 = 0;
          v9 = MEMORY[0x1E0C80978];
          while (1)
          {
            *(_WORD *)__str = *(_WORD *)(v6 + v8);
            if (__str[0] < 0
              || (*(_DWORD *)(v9 + 4 * __str[0] + 60) & 0x10000) == 0
              || *(__int16 *)__str < 0
              || (*(_DWORD *)(v9 + ((4 * __str[1]) & 0x3FFFFFFFCLL) + 60) & 0x10000) == 0)
            {
              break;
            }
            *((_BYTE *)v7 + (v8 >> 1)) = strtoul(__str, 0, 16);
            v8 += 2;
            if (v8 >= objc_msgSend(v3, "length"))
              goto LABEL_12;
          }
          free(v7);
          goto LABEL_16;
        }
LABEL_12:
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, (unint64_t)objc_msgSend(v3, "length") >> 1, 1);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v5 = (void *)v10;
    }
  }
LABEL_17:

  return v5;
}

@end
