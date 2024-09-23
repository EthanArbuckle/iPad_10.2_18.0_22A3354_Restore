@implementation NSUUID(TelephonyUtilities)

+ (id)tu_UUIDv5ForString:()TelephonyUtilities namespaceUUID:
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  if (a3)
  {
    objc_msgSend(a3, "dataUsingEncoding:", 4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    a3 = 0;
    if (v6 && v7)
    {
      objc_msgSend(a1, "tu_UUIDv5ForData:namespaceUUID:", v7, v6);
      a3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return a3;
}

+ (id)tu_UUIDv5ForData:()TelephonyUtilities namespaceUUID:
{
  void *v4;
  id v6;
  id v7;
  const void *v8;
  CC_LONG v9;
  CC_SHA1_CTX v11;
  unsigned __int8 md[20];
  _QWORD data[2];
  __int128 v14;
  uint64_t v15;

  v4 = 0;
  v15 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    data[0] = 0;
    data[1] = 0;
    v6 = a3;
    objc_msgSend(a4, "getUUIDBytes:", data);
    memset(&v11, 0, sizeof(v11));
    CC_SHA1_Init(&v11);
    CC_SHA1_Update(&v11, data, 0x10u);
    v7 = objc_retainAutorelease(v6);
    v8 = (const void *)objc_msgSend(v7, "bytes");
    v9 = objc_msgSend(v7, "length");

    CC_SHA1_Update(&v11, v8, v9);
    CC_SHA1_Final(md, &v11);
    v14 = *(_OWORD *)md;
    BYTE6(v14) = md[6] & 0xF | 0x50;
    BYTE8(v14) = md[8] & 0x3F | 0x80;
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUUIDBytes:", &v14);
  }
  return v4;
}

@end
