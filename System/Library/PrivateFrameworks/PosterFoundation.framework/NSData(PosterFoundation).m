@implementation NSData(PosterFoundation)

- (char)pf_hexadecimalEncodedString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  unsigned __int8 *v7;
  _BYTE *v8;
  unsigned int v9;

  v2 = objc_msgSend(a1, "length");
  if (v2 < 0)
  {
    v5 = 0;
    return v5;
  }
  v3 = v2;
  v4 = 2 * v2;
  v5 = (char *)malloc_type_malloc(2 * v2, 0x35358860uLL);
  if (!v5)
    return v5;
  v6 = v5;
  v7 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (v3)
  {
    v8 = v6 + 1;
    do
    {
      v9 = *v7++;
      *(v8 - 1) = a0123456789abcd[(unint64_t)v9 >> 4];
      *v8 = a0123456789abcd[v9 & 0xF];
      v8 += 2;
      --v3;
    }
    while (v3);
  }
  return (char *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, v4, 1, 1);
}

@end
