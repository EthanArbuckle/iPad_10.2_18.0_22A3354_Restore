@implementation NSData(HexString)

+ (id)dataWithHexString:()HexString
{
  void *v3;
  _BYTE *v4;
  unint64_t v5;
  _BYTE *v6;
  void *v7;
  char *v9;
  char __str[3];

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24D815B48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __str[2] = 0;
  v4 = malloc_type_malloc((unint64_t)objc_msgSend(v3, "length") >> 1, 0xC66B897uLL);
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    v6 = v4;
    do
    {
      __str[0] = objc_msgSend(v3, "characterAtIndex:", v5);
      __str[1] = objc_msgSend(v3, "characterAtIndex:", v5 + 1);
      v9 = 0;
      *v6++ = strtol(__str, &v9, 16);
      v5 += 2;
    }
    while (v5 < objc_msgSend(v3, "length"));
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v4, (unint64_t)objc_msgSend(v3, "length") >> 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (__CFString)hexString
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  __CFString *v12;

  v2 = objc_msgSend(a1, "length");
  if (v2 && (v3 = v2, v4 = objc_retainAutorelease(a1), objc_msgSend(v4, "bytes")))
  {
    v5 = 2 * objc_msgSend(v4, "length");
    v6 = 2 * v3;
    v7 = (char *)malloc_type_malloc((2 * v3) | 1, 0xC667C41CuLL);
    v7[v5] = 0;
    v8 = objc_retainAutorelease(v4);
    v9 = objc_msgSend(v8, "bytes");
    if (objc_msgSend(v8, "length"))
    {
      v10 = 0;
      v11 = v7;
      do
      {
        sprintf(v11, "%02X", *(unsigned __int8 *)(v9 + v10++));
        v11 += 2;
      }
      while (objc_msgSend(v8, "length") > v10);
    }
    v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v6, 1, 1);
  }
  else
  {
    v12 = &stru_24D815B48;
  }
  return v12;
}

@end
