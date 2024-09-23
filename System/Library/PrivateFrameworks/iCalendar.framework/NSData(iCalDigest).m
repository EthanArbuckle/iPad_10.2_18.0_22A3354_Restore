@implementation NSData(iCalDigest)

- (uint64_t)ical_digest
{
  return objc_msgSend(a1, "ical_digestWithVersionNumber:", 0);
}

- (id)ical_digestWithVersionNumber:()iCalDigest
{
  void *v5;
  id v6;
  CC_SHA1_CTX v8;
  int data;
  unsigned __int8 md[20];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  data = a3;
  v5 = (void *)objc_msgSend(a1, "length");
  if (v5)
  {
    memset(&v8, 0, sizeof(v8));
    CC_SHA1_Init(&v8);
    if (a3)
      CC_SHA1_Update(&v8, &data, 4u);
    v6 = objc_retainAutorelease(a1);
    CC_SHA1_Update(&v8, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
    CC_SHA1_Final(md, &v8);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
