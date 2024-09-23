@implementation NSData(PBFUtilities)

- (id)pbf_sha256Hash
{
  void *v2;
  uint64_t i;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  CC_SHA256_CTX v11;
  unsigned __int8 md[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "length"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x8810000000;
  v10 = &unk_1CBBCDE9F;
  memset(&v11, 0, sizeof(v11));
  CC_SHA256_Init(&v11);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__NSData_PBFUtilities__pbf_sha256Hash__block_invoke;
  v6[3] = &unk_1E86F5F90;
  v6[4] = &v7;
  objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v6);
  CC_SHA256_Final(md, (CC_SHA256_CTX *)(v8 + 4));
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 64);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v7, 8);
  return v4;
}

@end
