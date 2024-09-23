@implementation NSData(RTExtensions)

- (id)hexDescription
{
  id v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * objc_msgSend(v1, "length") + 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("0x"));
  if (objc_msgSend(v1, "length"))
  {
    v4 = 0;
    do
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v2 + v4++));
    while (objc_msgSend(v1, "length") > v4);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hexString
{
  id v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * objc_msgSend(v1, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    v4 = 0;
    do
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v2 + v4++));
    while (objc_msgSend(v1, "length") > v4);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)md5
{
  id v1;
  unsigned __int8 md[16];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_MD5((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hmacSha1WithKey:()RTExtensions
{
  id v4;
  const void *v5;
  size_t v6;
  id v7;
  void *v8;
  _BYTE macOut[20];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = objc_retainAutorelease(a3);
    v5 = (const void *)objc_msgSend(v4, "bytes");
    v6 = objc_msgSend(v4, "length");

    v7 = objc_retainAutorelease(a1);
    CCHmac(0, v5, v6, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), macOut);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", macOut, 20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)initWithHexString:()RTExtensions
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  char __str[2];
  __int16 v10;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E92AB3A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v10 = 0;
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      __str[0] = objc_msgSend(v4, "characterAtIndex:", v7 - 1);
      __str[1] = objc_msgSend(v4, "characterAtIndex:", v7);
      HIBYTE(v10) = strtol(__str, 0, 16);
      objc_msgSend(v5, "appendBytes:length:", (char *)&v10 + 1, 1);
      ++v6;
      v7 += 2;
    }
    while (v6 < (unint64_t)objc_msgSend(v4, "length") >> 1);
  }

  return v5;
}

@end
