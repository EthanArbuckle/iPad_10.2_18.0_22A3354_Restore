@implementation NSData(IMAdditions)

+ (id)imDataFromHexString:()IMAdditions
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int16 v14;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = v4 >> 1;
  v6 = malloc_type_malloc(v4 >> 1, 0x7AC88058uLL);
  v7 = objc_retainAutorelease(v3);
  v8 = objc_msgSend(v7, "UTF8String");
  if (v4 < 2)
  {
LABEL_7:
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v6, v5);
  }
  else
  {
    v9 = (const char *)v8;
    v10 = 0;
    if (v5 <= 1)
      v11 = 1;
    else
      v11 = v4 >> 1;
    while (1)
    {
      v14 = 0;
      if (sscanf(v9, "%1hhx%1hhx", (char *)&v14 + 1, &v14) < 2)
        break;
      v6[v10++] = v14 + 16 * HIBYTE(v14);
      v9 += 2;
      if (v11 == v10)
        goto LABEL_7;
    }
    free(v6);
    v12 = 0;
  }

  return v12;
}

- (id)hexString
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned int v6;

  v2 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (v2)
  {
    v5 = (unsigned __int8 *)v4;
    do
    {
      v6 = *v5++;
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), v6);
      --v2;
    }
    while (v2);
  }
  return v3;
}

- (id)uniquenessHash
{
  void *v2;
  unint64_t v3;
  char *v4;
  uint64_t v5;
  _BYTE *v6;
  unint64_t v7;
  CC_MD5_CTX v9;
  _OWORD v10[2];
  char v11;
  unsigned __int8 md[16];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(a1, "length");
  if (v2)
  {
    v3 = (unint64_t)v2;
    memset(&v9, 0, sizeof(v9));
    CC_MD5_Init(&v9);
    v4 = (char *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
    if (v3 < 0x10000)
      goto LABEL_5;
    do
    {
      CC_MD5_Update(&v9, v4, 0x10000u);
      v4 += 0x10000;
      v3 -= 0x10000;
    }
    while (v3 >> 16);
    if (v3)
LABEL_5:
      CC_MD5_Update(&v9, v4, v3);
    CC_MD5_Final(md, &v9);
    v5 = 0;
    v11 = 0;
    memset(v10, 0, sizeof(v10));
    v6 = (char *)v10 + 1;
    do
    {
      v7 = md[v5];
      *(v6 - 1) = a0123456789abcd[v7 >> 4];
      *v6 = a0123456789abcd[v7 & 0xF];
      v6 += 2;
      ++v5;
    }
    while (v5 != 16);
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v10, 32, 4);
  }
  return v2;
}

+ (uint64_t)uniquenessHashForContentsOfFileUrl:()IMAdditions
{
  return objc_msgSend(a1, "uniquenessHashForContentsOfFileUrl:readBufferSize:", a3, 0);
}

+ (id)uniquenessHashForContentsOfFileUrl:()IMAdditions readBufferSize:
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  CC_MD5_CTX v16;
  id v17;
  unsigned __int8 md[16];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4)
    v6 = a4;
  else
    v6 = 0x4000;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v5, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    memset(&v16, 0, sizeof(v16));
    v9 = CC_MD5_Init(&v16);
    do
    {
      v10 = (void *)MEMORY[0x1AF4138F4](v9);
      objc_msgSend(v7, "readDataOfLength:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");
      if (v12)
      {
        v13 = objc_retainAutorelease(v11);
        CC_MD5_Update(&v16, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
      }

      objc_autoreleasePoolPop(v10);
    }
    while (v12);
    CC_MD5_Final(md, &v16);
    objc_msgSend(v7, "closeFile");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
