@implementation NSString(ISAdditions)

- (uint64_t)copyUTF8StringOfLength:()ISAdditions
{
  _BYTE *v5;
  _BYTE *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;

  v5 = malloc_type_malloc(a3 + 1, 0x100004077774924uLL);
  if (!v5)
    return 0;
  v6 = v5;
  v10 = 0;
  v7 = objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v5, a3, &v10, 4, 0, 0, objc_msgSend(a1, "length"), 0);
  v8 = 0;
  if (v7)
  {
    v6[v10] = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v6);
  }
  free(v6);
  return v8;
}

@end
