@implementation NSString

- (void)copyLastPathComponent
{
  void *v1;
  unint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  char *v6;
  int v7;

  v1 = a1;
  if (a1)
  {
    v2 = objc_msgSend(a1, "length");
    v3 = (char *)malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
    objc_msgSend(v1, "getCharacters:range:", v3, 0, v2);
    if (v2 >= 2)
    {
      v5 = 0;
      v6 = &v3[2 * v2];
      while (v2 - 1 != v5)
      {
        v7 = *((unsigned __int16 *)v6 - 2);
        v6 -= 2;
        ++v5;
        if (v7 == 47)
        {
          v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v6, v5);
          goto LABEL_8;
        }
      }
    }
    v4 = v1;
LABEL_8:
    v1 = v4;
    free(v3);
  }
  return v1;
}

@end
