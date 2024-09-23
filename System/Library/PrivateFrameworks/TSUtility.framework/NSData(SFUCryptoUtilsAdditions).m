@implementation NSData(SFUCryptoUtilsAdditions)

- (BOOL)writeToURL:()SFUCryptoUtilsAdditions encryptionKey:
{
  SFUFileOutputStream *v6;
  SFUFileOutputStream *v7;
  id v8;
  _BOOL8 v9;
  void *v10;

  v6 = -[SFUFileOutputStream initWithPath:]([SFUFileOutputStream alloc], "initWithPath:", objc_msgSend(a3, "path"));
  if (!v6)
    return 0;
  v7 = v6;
  v8 = -[SFUCryptoOutputStream initForEncryptionWithOutputStream:key:]([SFUCryptoOutputStream alloc], "initForEncryptionWithOutputStream:key:", v6, a4);
  v9 = v8 != 0;
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v8, "writeBuffer:size:", objc_msgSend(a1, "bytes"), objc_msgSend(a1, "length"));

  }
  return v9;
}

+ (SFUFileInputStream)dataWithContentsOfURL:()SFUCryptoUtilsAdditions decryptionKey:
{
  void *v6;
  SFUFileInputStream *v7;
  id v8;
  SFUMemoryOutputStream *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v14 = 0;
  v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), &v14);
  v7 = -[SFUFileInputStream initWithPath:offset:length:]([SFUFileInputStream alloc], "initWithPath:offset:length:", objc_msgSend(a3, "path"), 0, objc_msgSend((id)objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD0D08]), "unsignedLongLongValue"));
  if (v7)
  {
    v8 = -[SFUCryptoInputStream initForDecryptionWithInputStream:key:]([SFUCryptoInputStream alloc], "initForDecryptionWithInputStream:key:", v7, a4);

    if (v8)
    {
      v7 = (SFUFileInputStream *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
      v9 = -[SFUMemoryOutputStream initWithData:]([SFUMemoryOutputStream alloc], "initWithData:", v7);
      v10 = malloc_type_malloc(0x40007uLL, 0x318AAE9AuLL);
      v11 = objc_msgSend(v8, "readToBuffer:size:", v10, 262151);
      if (v11)
      {
        v12 = v11;
        do
        {
          -[SFUMemoryOutputStream writeBuffer:size:](v9, "writeBuffer:size:", v10, v12);
          v12 = objc_msgSend(v8, "readToBuffer:size:", v10, 262151);
        }
        while (v12);
      }

    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

@end
