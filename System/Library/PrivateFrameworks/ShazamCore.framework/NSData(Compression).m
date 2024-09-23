@implementation NSData(Compression)

- (uint64_t)sh_rangeOfData:()Compression
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v5 = objc_retainAutorelease(a1);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  v8 = objc_retainAutorelease(v4);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  if (v7)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (*(unsigned __int8 *)(v6 + v11) == *(unsigned __int8 *)(v9 + v12))
      {
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          v13 = v11;
        if (++v12 >= v10)
          goto LABEL_12;
      }
      else
      {
        v12 = 0;
        v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v7 == ++v11)
        goto LABEL_12;
    }
  }
  v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v13;
}

@end
