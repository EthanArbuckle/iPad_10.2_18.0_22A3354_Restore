@implementation NSData(Construction)

+ (id)dataWithShortBE:()Construction
{
  __int16 v4;

  v4 = __rev16(a3);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dataWithIntBE:()Construction
{
  unsigned int v4;

  v4 = bswap32(a3);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dataWithLongBE:()Construction
{
  unint64_t v4;

  v4 = bswap64(a3);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dataWithReversedBytes:()Construction length:
{
  id v4;
  uint64_t v5;
  _BYTE *v7;

  v4 = 0;
  if (a3)
  {
    v5 = a4;
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a4);
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = (_BYTE *)objc_msgSend(v4, "mutableBytes");
      do
        *v7++ = *(_BYTE *)(a3 - 1 + v5--);
      while (v5);
    }
  }
  return v4;
}

+ (uint64_t)randomData:()Construction
{
  void *v4;

  v4 = malloc_type_calloc(1uLL, size, 0xEC002F68uLL);
  arc4random_buf(v4, size);
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v4, size, 1);
}

@end
