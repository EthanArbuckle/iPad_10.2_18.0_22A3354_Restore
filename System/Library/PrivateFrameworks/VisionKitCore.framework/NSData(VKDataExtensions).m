@implementation NSData(VKDataExtensions)

- (id)vk_md5
{
  id v2;
  void *v3;
  uint64_t i;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  CC_MD5_CTX c;
  unsigned __int8 md[16];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  v2 = objc_retainAutorelease(a1);
  CC_MD5_Update(&c, (const void *)objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"));
  CC_MD5_Final(md, &c);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 16; ++i)
  {
    v5 = md[i];
    LODWORD(v6) = (v5 >> 4) + 87;
    if (v5 >= 0xA0)
      v6 = v6;
    else
      v6 = (v5 >> 4) | 0x30;
    v7 = v5 & 0xF;
    LODWORD(v8) = v7 + 87;
    if (v7 >= 0xA)
      v8 = v8;
    else
      v8 = v7 | 0x30;
    objc_msgSend(v3, "appendFormat:", CFSTR("%c%c"), v6, v8);
  }
  return v3;
}

- (id)vk_stringValue
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", a1, 4);
}

@end
