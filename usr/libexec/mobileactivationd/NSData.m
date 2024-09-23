@implementation NSData

- (id)hexString
{
  NSUInteger v3;
  char *v4;
  void *v5;
  uint64_t v6;
  _BYTE *v7;
  NSData *v8;
  unsigned int v9;
  char v10;
  unsigned int v11;
  char v12;
  id v13;

  v3 = -[NSData length](self, "length");
  v4 = (char *)malloc_type_malloc(2 * v3, 0x193D21A2uLL);
  if (v4)
  {
    v5 = v4;
    if (v3)
    {
      v6 = 0;
      v7 = v4 + 1;
      do
      {
        v8 = objc_retainAutorelease(self);
        v9 = *((unsigned __int8 *)-[NSData bytes](v8, "bytes") + v6);
        if (v9 <= 0x9F)
          v10 = 48;
        else
          v10 = 55;
        *(v7 - 1) = v10 + (v9 >> 4);
        v11 = *((_BYTE *)-[NSData bytes](objc_retainAutorelease(v8), "bytes") + v6) & 0xF;
        if (v11 <= 9)
          v12 = 48;
        else
          v12 = 55;
        *v7 = v12 + v11;
        v7 += 2;
        ++v6;
      }
      while (v3 != v6);
    }
    v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v5, 2 * v3, 1);
    free(v5);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

@end
