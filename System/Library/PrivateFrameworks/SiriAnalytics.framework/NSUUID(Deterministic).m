@implementation NSUUID(Deterministic)

- (id)sa_uuidBytes
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sa_deterministicUUIDv5ForNamespaceUUID:()Deterministic sourceUUID:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3A28];
  v6 = a4;
  objc_msgSend(a3, "sa_uuidBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sa_uuidBytes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sa_deterministicUUIDv5ForNamespace:name:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)sa_deterministicUUIDv5ForNamespace:()Deterministic name:
{
  id v5;
  id v6;
  id v7;
  const void *v8;
  CC_LONG v9;
  id v10;
  const void *v11;
  CC_SHA1_CTX v13;
  unsigned __int8 md[6];
  __int16 v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  memset(&v13, 0, sizeof(v13));
  v5 = a4;
  v6 = a3;
  CC_SHA1_Init(&v13);
  v7 = objc_retainAutorelease(v6);
  v8 = (const void *)objc_msgSend(v7, "bytes", *(_OWORD *)&v13.h0, *(_OWORD *)&v13.h4, *(_OWORD *)&v13.data[1], *(_OWORD *)&v13.data[5], *(_OWORD *)&v13.data[9], *(_OWORD *)&v13.data[13]);
  v9 = objc_msgSend(v7, "length");

  CC_SHA1_Update(&v13, v8, v9);
  v10 = objc_retainAutorelease(v5);
  v11 = (const void *)objc_msgSend(v10, "bytes");
  LODWORD(v8) = objc_msgSend(v10, "length");

  CC_SHA1_Update(&v13, v11, (CC_LONG)v8);
  CC_SHA1_Final(md, &v13);
  v15 = v15 & 0xFFF | 0x5000;
  v16 = v16 & 0x3F | 0x80;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", md);
}

@end
